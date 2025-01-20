@interface PSSharableDetailController
- (void)shareLog;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSSharableDetailController

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PSSharableDetailController;
  [(PSDetailController *)&v10 viewWillAppear:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v4 configureWithOpaqueBackground];
  v5 = [(PSSharableDetailController *)self navigationItem];
  [v5 setStandardAppearance:v4];

  v6 = [(PSSharableDetailController *)self navigationItem];
  [v6 setCompactAppearance:v4];

  v7 = [(PSSharableDetailController *)self navigationItem];
  [v7 setScrollEdgeAppearance:v4];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_shareLog];
  v9 = [(PSSharableDetailController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];
}

- (void)shareLog
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PSSharableDetailController *)self specifier];
  id v4 = [v3 propertyForKey:*MEMORY[0x1E4F92DE8]];

  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    id v6 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v16[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v8 = (void *)[v6 initWithActivityItems:v7 applicationActivities:0];

    uint64_t v9 = *MEMORY[0x1E4F9F388];
    v15[0] = *MEMORY[0x1E4F9F350];
    v15[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F9F3C8];
    v15[2] = *MEMORY[0x1E4F9F340];
    v15[3] = v10;
    v15[4] = *MEMORY[0x1E4F9F3C0];
    v15[5] = @"com.apple.mobilenotes.SharingExtension";
    v15[6] = @"com.apple.reminders.RemindersEditorExtension";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:7];
    [v8 setExcludedActivityTypes:v11];

    v12 = [(PSSharableDetailController *)self navigationItem];
    v13 = [v12 rightBarButtonItem];
    v14 = [v8 popoverPresentationController];
    [v14 setBarButtonItem:v13];

    [(PSSharableDetailController *)self presentViewController:v8 animated:1 completion:0];
  }
}

@end