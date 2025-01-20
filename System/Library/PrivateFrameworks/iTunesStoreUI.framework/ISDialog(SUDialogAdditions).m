@interface ISDialog(SUDialogAdditions)
+ (id)ITunesStoreNotAvailableDialog;
@end

@implementation ISDialog(SUDialogAdditions)

+ (id)ITunesStoreNotAvailableDialog
{
  id v1 = objc_alloc_init(a1);
  objc_msgSend(v1, "setButtons:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(MEMORY[0x263F89490], "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OK", &stru_26DB8C5F8, 0))));
  objc_msgSend(v1, "setMessage:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"NO_STORE_SUPPORTED_ALERT_BODY", &stru_26DB8C5F8, 0));
  objc_msgSend(v1, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"NO_STORE_SUPPORTED_ALERT_TITLE", &stru_26DB8C5F8, 0));

  return v1;
}

@end