@interface NSURL
@end

@implementation NSURL

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = objc_msgSend(v2, "key_window");
  uint64_t v4 = [v3 rootViewController];

  v5 = NUBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"“%@” wants to open “%@”" value:&stru_26D495918 table:0];

  v7 = NSString;
  v8 = [MEMORY[0x263F086E0] mainBundle];
  v9 = [v8 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  v10 = [*(id *)(a1 + 32) localizedName];
  v22 = (void *)v6;
  v11 = objc_msgSend(v7, "stringWithFormat:", v6, v9, v10);

  v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v11 message:0 preferredStyle:1];
  objc_initWeak(&location, v12);
  v13 = (void *)MEMORY[0x263F1C3F0];
  v14 = NUBundle();
  v15 = [v14 localizedStringForKey:@"Cancel" value:&stru_26D495918 table:0];
  v16 = (void *)v4;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_2;
  v25[3] = &unk_2645FF018;
  objc_copyWeak(&v26, &location);
  v17 = [v13 actionWithTitle:v15 style:0 handler:v25];

  v18 = (void *)MEMORY[0x263F1C3F0];
  v19 = NUBundle();
  v20 = [v19 localizedStringForKey:@"Open" value:&stru_26D495918 table:0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_3;
  v23[3] = &unk_2645FF040;
  objc_copyWeak(&v24, &location);
  v23[4] = *(void *)(a1 + 40);
  v21 = [v18 actionWithTitle:v20 style:0 handler:v23];

  [v12 addAction:v21];
  [v12 addAction:v17];
  [v12 setPreferredAction:v17];
  [v16 presentViewController:v12 animated:1 completion:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];

  v3 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 openURL:*(void *)(a1 + 32) options:MEMORY[0x263EFFA78] completionHandler:0];
}

@end