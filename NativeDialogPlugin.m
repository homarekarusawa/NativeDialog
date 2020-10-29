#import "NativeDialogPlugin.h"
#import "StringUtil.h"
#import <Appkit/Appkit.h>

#ifdef __cplusplus
extern "C" {
#endif
    typedef void (*UnitySendMessageFunc)(const char* gameObjectName, const char* methodName, const char* message);
#ifdef __cplusplus
}
#endif

@implementation NativeDialogPlugin

// ボタン3個のAlertダイアログを出す
+(void) showAlertDialog3Button: (NSString *) title message: (NSString*) msg yesTitle:  (NSString*) b1 noTitle: (NSString*) b2 cancelTitle: (NSString*) b3 callback: (UnitySendMessageFunc) unitySendMessage
{
    // Alertの生成
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText: msg];
    [alert setInformativeText: title];
    [alert addButtonWithTitle:b1];
    [alert addButtonWithTitle:b2];
    [alert addButtonWithTitle:b3];

    // Alertの表示
    NSModalResponse response = [alert runModal];

    switch (response)
    {
        // Yesが押されたときのアクション
        case NSAlertFirstButtonReturn:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog3Button", "OnYesCallback", "0");
            break;

        // Noが押されたときのアクション
        case NSAlertSecondButtonReturn:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog3Button", "OnNoCallback", "1");
            break;
            
        // Cancelが押されたときのアクション
        case NSAlertThirdButtonReturn:
        default:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog3Button", "OnCancelCallback", "2");
            break;
    }
}

// ボタン2個のAlertダイアログを出す
+(void) showAlertDialog2Button: (NSString *) title message: (NSString*) msg okTitle:(NSString*) b1 cancelTitle: (NSString*) b2 callback: (UnitySendMessageFunc) unitySendMessage
{
    // Alertの生成
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText: msg];
    [alert setInformativeText: title];
    [alert addButtonWithTitle:b1];
    [alert addButtonWithTitle:b2];

    // Alertの表示
    NSModalResponse response = [alert runModal];

    switch (response)
    {
        // Okが押されたときのアクション
        case NSAlertFirstButtonReturn:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog2Button", "OnOkCallback", "0");
            break;
            
        // Cancelが押されたときのアクション
        case NSAlertSecondButtonReturn:
        default:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog2Button", "OnCancelCallback", "1");
            break;
    }
}

// ボタン1個のAlertダイアログを出す
+(void) showAlertDialog1Button: (NSString *) title message: (NSString*) msg okTitle: (NSString*) b1 callback: (UnitySendMessageFunc) unitySendMessage
{
    // Alertの生成
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText: msg];
    [alert setInformativeText: title];
    [alert addButtonWithTitle:b1];

    // Alertの表示
    NSModalResponse response = [alert runModal];

    switch (response)
    {
        // Okが押されたときのアクション
        case NSAlertFirstButtonReturn:
        default:
            // コールバックを呼ぶためのメッセージを送る
            unitySendMessage("NativeDialog1Button", "OnOkCallback", "0");
            break;
    }
}

#ifdef __cplusplus
extern "C"
{
#endif
    // ボタン3個のAlertダイアログを出す
    void showAlertDialog3Button(char* title, char* msg, char* yes, char* no, char* cancel, UnitySendMessageFunc unitySendMessage)
    {
        [NativeDialogPlugin showAlertDialog3Button:[StringUtil charToNSString:title] message:[StringUtil charToNSString:msg] yesTitle:[StringUtil charToNSString:yes] noTitle:[StringUtil charToNSString:no] cancelTitle:[StringUtil charToNSString:cancel] callback:unitySendMessage];
    }
    
    // ボタン2個のAlertダイアログを出す
    void showAlertDialog2Button(char* title, char* msg, char* ok, char* cancel, UnitySendMessageFunc unitySendMessage)
    {
        [NativeDialogPlugin showAlertDialog2Button:[StringUtil charToNSString:title] message:[StringUtil charToNSString:msg] okTitle:[StringUtil charToNSString:ok] cancelTitle:[StringUtil charToNSString:cancel] callback:unitySendMessage];
    }
    
    // ボタン1個のAlertダイアログを出す
    void showAlertDialog1Button(char* title, char* msg, char* ok, UnitySendMessageFunc unitySendMessage)
    {
        [NativeDialogPlugin showAlertDialog1Button:[StringUtil charToNSString:title] message:[StringUtil charToNSString:msg] okTitle:[StringUtil charToNSString:ok] callback:unitySendMessage];
    }
    
#ifdef __cplusplus
}
#endif

@end
