@interface NMUKeepLocalAlertConfiguration
+ (id)requiredPropertiesForModelKind:(id)a3;
- (NMUKeepLocalAlertAction)cancelAction;
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (id)_cancelAction;
- (id)_downloadNowOffPowerActionWithOptions:(id)a3;
- (id)_downloadNowOffPowerOnCellularActionWithOptions:(id)a3;
- (id)_okAction;
- (id)alertViewControllerWithKeepLocalBlock:(id)a3;
- (void)setActions:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NMUKeepLocalAlertConfiguration

- (id)alertViewControllerWithKeepLocalBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:self->_title message:self->_message preferredStyle:1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v22 = self;
  obj = self->_actions;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x263F1C3F0];
        v12 = objc_msgSend(v10, "title", v22);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __72__NMUKeepLocalAlertConfiguration_alertViewControllerWithKeepLocalBlock___block_invoke;
        v27[3] = &unk_264DA3C80;
        id v13 = v4;
        v27[4] = v10;
        id v28 = v13;
        v14 = [v11 actionWithTitle:v12 style:0 handler:v27];
        [v5 addAction:v14];
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  cancelAction = v22->_cancelAction;
  if (cancelAction)
  {
    v16 = cancelAction;
    v17 = (void *)MEMORY[0x263F1C3F0];
    v18 = [(NMUKeepLocalAlertAction *)v16 title];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__NMUKeepLocalAlertConfiguration_alertViewControllerWithKeepLocalBlock___block_invoke_2;
    v24[3] = &unk_264DA3C80;
    v25 = v16;
    id v26 = v4;
    v19 = v16;
    v20 = [v17 actionWithTitle:v18 style:1 handler:v24];
    [v5 addAction:v20];
  }
  return v5;
}

uint64_t __72__NMUKeepLocalAlertConfiguration_alertViewControllerWithKeepLocalBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__NMUKeepLocalAlertConfiguration_alertViewControllerWithKeepLocalBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)requiredPropertiesForModelKind:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F11E88] identityKind];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F12180];
    v15[0] = *MEMORY[0x263F114C0];
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v8 = v15;
LABEL_5:
    v11 = [v7 arrayWithObjects:v8 count:1];
    v12 = [v6 propertySetWithProperties:v11];

    goto LABEL_7;
  }
  v9 = [MEMORY[0x263F11FB8] identityKind];
  int v10 = [v3 isEqual:v9];

  uint64_t v6 = (void *)MEMORY[0x263F12180];
  if (v10)
  {
    uint64_t v14 = *MEMORY[0x263F11670];
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v8 = &v14;
    goto LABEL_5;
  }
  v12 = [MEMORY[0x263F12180] emptyPropertySet];
LABEL_7:

  return v12;
}

- (id)_okAction
{
  v2 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  id v3 = [v2 localizedStringForKey:@"ACTION_TITLE_OK" value:@"OK" table:0];
  id v4 = +[NMUKeepLocalAlertAction actionWithTitle:v3 shouldPerformKeepLocalRequest:0 keepLocalRequestOptions:0 downloadAction:0];

  return v4;
}

- (id)_cancelAction
{
  v2 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  id v3 = [v2 localizedStringForKey:@"ACTION_TITLE_CANCEL" value:@"Cancel" table:0];
  id v4 = +[NMUKeepLocalAlertAction actionWithTitle:v3 shouldPerformKeepLocalRequest:0 keepLocalRequestOptions:0 downloadAction:1];

  return v4;
}

- (id)_downloadNowOffPowerActionWithOptions:(id)a3
{
  id v3 = (void *)[a3 copy];
  [v3 setPowerPolicy:1];
  id v4 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  int v5 = [v4 localizedStringForKey:@"ACTION_TITLE_DOWNLOAD_NOW" value:@"Download Now" table:0];
  uint64_t v6 = +[NMUKeepLocalAlertAction actionWithTitle:v5 shouldPerformKeepLocalRequest:1 keepLocalRequestOptions:v3 downloadAction:2];

  return v6;
}

- (id)_downloadNowOffPowerOnCellularActionWithOptions:(id)a3
{
  id v3 = (void *)[a3 copy];
  [v3 setPowerPolicy:1];
  [v3 setCellularPolicy:1];
  id v4 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  int v5 = [v4 localizedStringForKey:@"ACTION_TITLE_DOWNLOAD_NOW" value:@"Download Now" table:0];
  uint64_t v6 = +[NMUKeepLocalAlertAction actionWithTitle:v5 shouldPerformKeepLocalRequest:1 keepLocalRequestOptions:v3 downloadAction:3];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NMUKeepLocalAlertAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end