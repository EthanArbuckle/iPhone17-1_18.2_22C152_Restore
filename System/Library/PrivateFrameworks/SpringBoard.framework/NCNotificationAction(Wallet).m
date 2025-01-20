@interface NCNotificationAction(Wallet)
+ (id)revealWalletPassNotificationActionForCardItem:()Wallet;
@end

@implementation NCNotificationAction(Wallet)

+ (id)revealWalletPassNotificationActionForCardItem:()Wallet
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 localizedStringForKey:@"WALLET_ACTION_SHOW_PASS" value:&stru_1F3084718 table:@"SpringBoard"];
  [v4 setTitle:v6];

  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"%@-%lu-default", v9, objc_msgSend(v3, "hash")];

  [v4 setIdentifier:v10];
  [v4 setActivationMode:0];
  [v4 setShouldDismissNotification:0];
  objc_msgSend(v4, "setRequiresAuthentication:", objc_msgSend(v3, "requiresPasscode"));
  v11 = -[NCRevealWalletPassActionRunner initWithCardItem:]((id *)[NCRevealWalletPassActionRunner alloc], v3);

  [v4 setActionRunner:v11];
  return v4;
}

@end