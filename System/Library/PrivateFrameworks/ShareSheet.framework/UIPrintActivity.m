@interface UIPrintActivity
+ (unint64_t)_xpcAttributes;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isContentManaged;
- (NSString)sourceApplicationBundleID;
- (UIPrintInteractionController)printInteractionController;
- (UIViewController)wrapperViewController;
- (UIWindow)windowHoldingActivityViewController;
- (id)_embeddedActivityViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)printInteractionControllerParentViewController:(id)a3;
- (id)printInteractionControllerWindowForPresentation:(id)a3;
- (void)activityDidFinish:(BOOL)a3;
- (void)cancelPrintOptions;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setPrintInteractionController:(id)a3;
- (void)setSourceApplicationBundleID:(id)a3;
- (void)setWindowHoldingActivityViewController:(id)a3;
- (void)setWrapperViewController:(id)a3;
@end

@implementation UIPrintActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.Print";
}

- (id)_systemImageName
{
  return @"printer";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Print[Activity]" value:@"Print" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![MEMORY[0x1E4F934B0] isPrintingAvailable] || (_UIActivityItemTypes() & 0x40) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else if ((_UIActivityItemTypes() & 0xA2) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = v3;
    uint64_t v4 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(MEMORY[0x1E4F934B0], "canPrintData:", v9, (void)v10) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ![v9 isFileURL]
              || ([MEMORY[0x1E4F934B0] canPrintURL:v9] & 1) == 0)
            {
              continue;
            }
          }
          LOBYTE(v4) = 1;
          goto LABEL_21;
        }
        uint64_t v4 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  __int16 v39 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v12 = [(UIPrintActivity *)self printInteractionController];
        [v12 setPrintPageRenderer:v11];
LABEL_13:

        v5 = 0;
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v12 = [(UIPrintActivity *)self printInteractionController];
        [v12 setPrintFormatter:v11];
        goto LABEL_13;
      }
      ScanForPrintingItems(v11, v5, (char *)&v39 + 1, (char *)&v39, &v38);
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_14:

  if ((unint64_t)[v5 count] >= 2)
  {
    long long v13 = [(UIPrintActivity *)self printInteractionController];
    [v13 setPrintingItems:v5];
    goto LABEL_18;
  }
  if ([v5 count] == 1)
  {
    long long v13 = [v5 lastObject];
    v14 = [(UIPrintActivity *)self printInteractionController];
    [v14 setPrintingItem:v13];

LABEL_18:
  }
  uint64_t v15 = [(UIPrintActivity *)self printInteractionController];
  [v15 setPrintInfo:0];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = [(UIPrintActivity *)self printInteractionController];
          [v22 setPrintInfo:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v18);
  }

  if ([v5 count])
  {
    v23 = [(UIPrintActivity *)self printInteractionController];
    v24 = [v23 printInfo];
    if (v24 || !HIBYTE(v39))
    {
LABEL_33:
    }
    else
    {
      int v25 = v39;

      if (!v25)
      {
        v23 = [MEMORY[0x1E4F934A8] printInfo];
        [v23 setOutputType:1];
        v24 = [(UIPrintActivity *)self printInteractionController];
        [v24 setPrintInfo:v23];
        goto LABEL_33;
      }
    }
  }
  v26 = [(UIPrintActivity *)self printInteractionController];
  [v26 setShowsPaperSelectionForLoadedPapers:1];

  BOOL v27 = [(UIPrintActivity *)self isContentManaged];
  v28 = [(UIPrintActivity *)self printInteractionController];
  [v28 setIsContentManaged:v27];

  v29 = [(UIPrintActivity *)self printInteractionController];
  [v29 setPrintActivityDelegate:self];
}

- (id)_embeddedActivityViewController
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (![v3 userInterfaceIdiom])
  {

    goto LABEL_13;
  }
  id v4 = [(UIPrintActivity *)self printInteractionController];
  char v5 = [v4 _canShowPreview];

  if (v5)
  {
LABEL_13:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  id v6 = [(UIPrintActivity *)self printInteractionController];
  uint64_t v7 = [v6 printPageRenderer];
  if (!v7)
  {
    uint64_t v7 = [(UIPrintActivity *)self printInteractionController];
    uint64_t v8 = [v7 printFormatter];
    if (v8)
    {
LABEL_7:

      goto LABEL_8;
    }
    uint64_t v8 = [(UIPrintActivity *)self printInteractionController];
    uint64_t v9 = [v8 printingItem];
    if (v9)
    {

      goto LABEL_7;
    }
    uint64_t v17 = [(UIPrintActivity *)self printInteractionController];
    uint64_t v18 = [v17 printingItems];
    uint64_t v19 = [v18 count];

    if (v19) {
      goto LABEL_9;
    }
    if (self->_wrapperViewController) {
      [(UIPrintActivity *)self activityDidFinish:0];
    }
    goto LABEL_13;
  }
LABEL_8:

LABEL_9:
  wrapperViewController = self->_wrapperViewController;
  if (!wrapperViewController)
  {
    long long v11 = [UIPrintActivityWrapperNavigationController alloc];
    long long v12 = [(UIPrintActivity *)self printInteractionController];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__UIPrintActivity__embeddedActivityViewController__block_invoke;
    v20[3] = &unk_1E5A23168;
    v20[4] = self;
    long long v13 = [(UIPrintActivityWrapperNavigationController *)v11 initWithPrintInteractionController:v12 completion:v20];
    v14 = self->_wrapperViewController;
    self->_wrapperViewController = v13;

    wrapperViewController = self->_wrapperViewController;
  }
  uint64_t v15 = wrapperViewController;
LABEL_14:
  return v15;
}

uint64_t __50__UIPrintActivity__embeddedActivityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (void)performActivity
{
  id v3 = [(UIPrintActivity *)self printInteractionController];
  id v4 = [v3 printPageRenderer];
  if (v4) {
    goto LABEL_6;
  }
  id v4 = [(UIPrintActivity *)self printInteractionController];
  char v5 = [v4 printFormatter];
  if (v5)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    uint64_t v7 = [(UIPrintActivity *)self printInteractionController];
    uint64_t v8 = [(UIWindow *)self->_windowHoldingActivityViewController windowScene];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__UIPrintActivity_performActivity__block_invoke;
    v12[3] = &unk_1E5A23140;
    v12[4] = self;
    [v7 _presentAnimated:1 hostingScene:v8 completionHandler:v12];

    return;
  }
  char v5 = [(UIPrintActivity *)self printInteractionController];
  id v6 = [v5 printingItem];
  if (v6)
  {

    goto LABEL_5;
  }
  uint64_t v9 = [(UIPrintActivity *)self printInteractionController];
  long long v10 = [v9 printingItems];
  uint64_t v11 = [v10 count];

  if (v11) {
    goto LABEL_7;
  }
  [(UIPrintActivity *)self activityDidFinish:0];
}

uint64_t __34__UIPrintActivity_performActivity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:");
}

- (void)cancelPrintOptions
{
}

- (UIPrintInteractionController)printInteractionController
{
  printInteractionController = self->_printInteractionController;
  if (!printInteractionController)
  {
    id v4 = (UIPrintInteractionController *)objc_alloc_init(MEMORY[0x1E4F934B0]);
    char v5 = self->_printInteractionController;
    self->_printInteractionController = v4;

    printInteractionController = self->_printInteractionController;
  }
  return printInteractionController;
}

- (void)activityDidFinish:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrintActivity;
  [(UIActivity *)&v4 activityDidFinish:a3];
  [(UIPrintActivity *)self setWrapperViewController:0];
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  return self->_wrapperViewController;
}

- (id)printInteractionControllerWindowForPresentation:(id)a3
{
  objc_super v4 = [(UIPrintActivity *)self windowHoldingActivityViewController];
  if (v4)
  {
    char v5 = v4;
    id v6 = [(UIPrintActivity *)self windowHoldingActivityViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v4 = [(UIPrintActivity *)self windowHoldingActivityViewController];
    }
    else
    {
      objc_super v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
}

- (UIViewController)wrapperViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWrapperViewController:(id)a3
{
}

- (void)setPrintInteractionController:(id)a3
{
}

- (UIWindow)windowHoldingActivityViewController
{
  return (UIWindow *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWindowHoldingActivityViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowHoldingActivityViewController, 0);
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

@end