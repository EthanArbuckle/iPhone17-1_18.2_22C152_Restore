@interface SUAppPurgingAlertItem
- (SUAppPurgingAlertItem)initWithHandler:(id)a3 bytesNeeded:(unint64_t)a4;
- (id)_noButton;
- (id)_yesButton;
- (id)buttons;
- (id)message;
- (id)title;
- (void)alertWasDismissed:(unint64_t)a3;
@end

@implementation SUAppPurgingAlertItem

- (SUAppPurgingAlertItem)initWithHandler:(id)a3 bytesNeeded:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUAppPurgingAlertItem;
  v7 = [(SUBaseAlertItem *)&v11 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x223C18480](v6);
    id handler = v7->_handler;
    v7->_id handler = (id)v8;

    v7->_bytesNeeded = a4;
  }

  return v7;
}

- (void)alertWasDismissed:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUAppPurgingAlertItem;
  -[SUBaseAlertItem alertWasDismissed:](&v6, sel_alertWasDismissed_);
  if (a3 != 1)
  {
    id handler = (void (**)(id, void))self->_handler;
    if (handler) {
      handler[2](handler, 0);
    }
  }
}

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v3 = [v2 localizedStringForKey:@"DISK_SPACE_HEADER" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];

  return v3;
}

- (id)message
{
  v2 = [MEMORY[0x263F086F0] stringFromByteCount:self->_bytesNeeded countStyle:2];
  v3 = NSString;
  v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v5 = [v4 localizedStringForKey:@"APP_DEMOTION_BODY" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  objc_super v6 = objc_msgSend(v3, "stringWithFormat:", v5, v2);

  return v6;
}

- (id)buttons
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUAppPurgingAlertItem *)self _yesButton];
  [v3 addObject:v4];

  v5 = [(SUAppPurgingAlertItem *)self _noButton];
  [v3 addObject:v5];

  objc_super v6 = (void *)[v3 copy];
  return v6;
}

- (id)_yesButton
{
  v3 = [SUAlertButtonDefinition alloc];
  v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v5 = [v4 localizedStringForKey:@"DISK_SPACE_DEFAULT" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SUAppPurgingAlertItem__yesButton__block_invoke;
  v8[3] = &unk_26447C878;
  v8[4] = self;
  objc_super v6 = [(SUAlertButtonDefinition *)v3 initWithLabel:v5 presentationStyle:0 isPreferredButton:1 handler:v8];

  return v6;
}

uint64_t __35__SUAppPurgingAlertItem__yesButton__block_invoke(uint64_t a1)
{
  v2 = SULogAlerts();
  uint64_t v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, @"[%@] User accepted to purge apps.", v4, v5, v6, v7, v8, v9, v3);

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    objc_super v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (id)_noButton
{
  uint64_t v3 = [SUAlertButtonDefinition alloc];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v5 = [v4 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SUAppPurgingAlertItem__noButton__block_invoke;
  v8[3] = &unk_26447C878;
  v8[4] = self;
  uint64_t v6 = [(SUAlertButtonDefinition *)v3 initWithLabel:v5 presentationStyle:2 isPreferredButton:0 handler:v8];

  return v6;
}

uint64_t __34__SUAppPurgingAlertItem__noButton__block_invoke(uint64_t a1)
{
  v2 = SULogAlerts();
  uint64_t v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, @"[%@] User declined to purge apps.", v4, v5, v6, v7, v8, v9, v3);

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    objc_super v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end