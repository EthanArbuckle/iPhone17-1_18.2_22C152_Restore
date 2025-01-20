@interface UIPrintInteractionController
+ (BOOL)canPrintData:(NSData *)data;
+ (BOOL)canPrintURL:(NSURL *)url;
+ (BOOL)isPrintingAvailable;
+ (NSSet)printableUTIs;
+ (UIPrintInteractionController)sharedPrintController;
- (BOOL)_canPreviewContent;
- (BOOL)_canPrintPDFData:(id)a3;
- (BOOL)_canPrintPDFURL:(id)a3;
- (BOOL)_canShowAnnotations;
- (BOOL)_canShowColor;
- (BOOL)_canShowCopies;
- (BOOL)_canShowDuplex;
- (BOOL)_canShowLayout;
- (BOOL)_canShowOrientation;
- (BOOL)_canShowPageRange;
- (BOOL)_canShowPaperList;
- (BOOL)_canShowPreview;
- (BOOL)_canShowPunch;
- (BOOL)_canShowScaling;
- (BOOL)_canShowStaple;
- (BOOL)_isPageCancelled:(id)a3;
- (BOOL)_pageRendererAvailable;
- (BOOL)_presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5;
- (BOOL)_printingItemIsReallyTallPDF;
- (BOOL)_setupPrintPanel:(id)a3;
- (BOOL)_setupPrintPanel:(id)a3 forPDFGenerationOnly:(BOOL)a4;
- (BOOL)isContentManaged;
- (BOOL)manualPrintPageEnabled;
- (BOOL)needRedrawWithNUp;
- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;
- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;
- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;
- (BOOL)preventPDFCreation;
- (BOOL)printStateActive;
- (BOOL)printToPrinter:(UIPrinter *)printer completionHandler:(UIPrintInteractionCompletionHandler)completion;
- (BOOL)savePDFToURL:(id)a3 completionHandler:(id)a4;
- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 hostingScene:(id)a5 completionHandler:(id)a6;
- (BOOL)showPrintingProgress;
- (BOOL)showsNumberOfCopies;
- (BOOL)showsPageRange;
- (BOOL)showsPaperOrientation;
- (BOOL)showsPaperSelectionForLoadedPapers;
- (BOOL)showsScalingFactor;
- (BOOL)supressNotifyDismissed;
- (BOOL)usingWebKitFormatter;
- (CGContext)_newSaveContext:(id)a3 withMediaRect:(CGRect)a4;
- (CGRect)_mediaRect;
- (CGSize)_printItemContentSize;
- (CGSize)_printItemContentSize:(id)a3;
- (CGSize)_printablePDFDataSize:(id)a3;
- (CGSize)_printablePDFURLSize:(id)a3;
- (CGSize)paperSizeForPageNum:(int64_t)a3;
- (NSArray)pageRanges;
- (NSArray)printingItems;
- (NSMutableDictionary)convertedPrintableItems;
- (NSMutableSet)previewStates;
- (NSObject)renderThumbnailMutex;
- (NSObject)webKitFormatterMutex;
- (NSString)pdfPassword;
- (NSURL)saveFileURL;
- (NSURL)tempPreviewFileURL;
- (PKPrintSettings)printSettings;
- (PKPrinter)printer;
- (UIPrintFormatter)printFormatter;
- (UIPrintInfo)activePrintInfo;
- (UIPrintInfo)printInfo;
- (UIPrintInteractionController)init;
- (UIPrintInteractionControllerActivityDelegate)printActivityDelegate;
- (UIPrintPageRenderer)formatterRenderer;
- (UIPrintPageRenderer)printPageRenderer;
- (UIPrintPanelViewController)printPanelViewController;
- (UIPrintPaper)paper;
- (UIPrintPaper)printPaper;
- (UIPrintingProgress)printingProgress;
- (UIWindowScene)hostingWindowScene;
- (_NSRange)_fullPagesRange;
- (_NSRange)currentRange;
- (double)_getCutLengthFromDelegateForPaper:(id)a3;
- (id)_completionHandler;
- (id)_convertToPrintableItem:(id)a3;
- (id)_createDocInfoDict;
- (id)_currentPrintInfo;
- (id)_getChosenPaperFromDelegateForPaperList:(id)a3;
- (id)_newPDFURLWithPath:(id)a3 isContentManaged:(BOOL)a4;
- (id)_paperForContentType:(int64_t)a3;
- (id)_paperForPDFItem:(id)a3 withDuplexMode:(int64_t)a4;
- (id)_printPageWithRenderer:(id)a3;
- (id)_printingItemPrintablePDFURL;
- (id)_tempFilePath;
- (id)_updatePrintPaper;
- (id)appOptionsViewController;
- (id)createWebKitPDFForAllPages;
- (id)delegate;
- (id)drawPagesWithPreviewState:(id)a3;
- (id)getPrintingItemForPageNum:(int64_t)a3 pdfItemPageNum:(int64_t *)a4;
- (id)printingItem;
- (id)redrawPDFwithPageRange:(id)a3;
- (id)rendererToUse;
- (int)printerInfoState;
- (int64_t)currentPage;
- (int64_t)numberOfPages;
- (int64_t)pageCount;
- (int64_t)pageCountWithRanges;
- (int64_t)pagesDrawn;
- (void)_addPDFWithData:(id)a3 toContext:(CGContext *)a4 addAllPages:(BOOL)a5;
- (void)_cancelAllPreviewGeneration;
- (void)_cancelManualPrintPage;
- (void)_cancelPreviewQueue:(BOOL)a3 completionHandler:(id)a4;
- (void)_cleanPrintState;
- (void)_completePrintPageWithError:(id)a3;
- (void)_drawPrintItem:(id)a3 toContext:(CGContext *)a4 printAllPages:(BOOL)a5;
- (void)_enableManualPrintPage:(BOOL)a3;
- (void)_endPrintJobWithAction:(int64_t)a3 error:(id)a4;
- (void)_ensurePDFIsUnlockedFirstAttempt:(BOOL)a3 completionHandler:(id)a4;
- (void)_generatePDFWithCompletionHandler:(id)a3;
- (void)_generatePDFWithNupForPrintingCompletion:(id)a3;
- (void)_generatePrintPreview:(id)a3;
- (void)_manualPrintPage;
- (void)_preparePrintInfo;
- (void)_printItemAsync:(id)a3 completionHandler:(id)a4;
- (void)_printPage;
- (void)_printPageWithDelay:(double)a3;
- (void)_printPanelDidDismissWithAction:(int64_t)a3;
- (void)_printPanelDidPresent;
- (void)_printPanelWillDismissWithAction:(int64_t)a3;
- (void)_setPrinterInfoState:(int)a3;
- (void)_startPrinting;
- (void)_updateCutterBehavior;
- (void)_updatePageCount;
- (void)_updatePrintInfoWithAnnotations;
- (void)_updateRendererWithQuality:(int64_t)a3;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissAnimated:(BOOL)animated;
- (void)drawImage:(id)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5;
- (void)drawImageForPageNum:(int64_t)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5;
- (void)recalculateWebKitPageCount;
- (void)removeFileAtURL:(id)a3;
- (void)setActivePrintInfo:(id)a3;
- (void)setConvertedPrintableItems:(id)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setCurrentRange:(_NSRange)a3;
- (void)setDelegate:(id)delegate;
- (void)setFormatterRenderer:(id)a3;
- (void)setHostingWindowScene:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setManualPrintPageEnabled:(BOOL)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageCountWithRanges:(int64_t)a3;
- (void)setPageRanges:(id)a3;
- (void)setPagesDrawn:(int64_t)a3;
- (void)setPaper:(id)a3;
- (void)setPdfPassword:(id)a3;
- (void)setPreventPDFCreation:(BOOL)a3;
- (void)setPreviewStates:(id)a3;
- (void)setPrintActivityDelegate:(id)a3;
- (void)setPrintFormatter:(UIPrintFormatter *)printFormatter;
- (void)setPrintInfo:(UIPrintInfo *)printInfo;
- (void)setPrintPageRenderer:(UIPrintPageRenderer *)printPageRenderer;
- (void)setPrintPanelViewController:(id)a3;
- (void)setPrintSettings:(id)a3;
- (void)setPrintStateActive:(BOOL)a3;
- (void)setPrinter:(id)a3;
- (void)setPrinterInfoState:(int)a3;
- (void)setPrintingItem:(id)printingItem;
- (void)setPrintingItems:(NSArray *)printingItems;
- (void)setPrintingProgress:(id)a3;
- (void)setRenderThumbnailMutex:(id)a3;
- (void)setSaveFileURL:(id)a3;
- (void)setShowPrintingProgress:(BOOL)a3;
- (void)setShowsNumberOfCopies:(BOOL)showsNumberOfCopies;
- (void)setShowsPageRange:(BOOL)showsPageRange;
- (void)setShowsPaperOrientation:(BOOL)showsPaperOrientation;
- (void)setShowsPaperSelectionForLoadedPapers:(BOOL)showsPaperSelectionForLoadedPapers;
- (void)setShowsScalingFactor:(BOOL)a3;
- (void)setSupressNotifyDismissed:(BOOL)a3;
- (void)setTempPreviewFileURL:(id)a3;
- (void)setUsingWebKitFormatter:(BOOL)a3;
- (void)setWebKitFormatterMutex:(id)a3;
- (void)set_completionHandler:(id)a3;
- (void)updatePrintingItems;
@end

@implementation UIPrintInteractionController

- (void)dismissAnimated:(BOOL)animated
{
}

- (UIPrintInteractionController)init
{
  v11.receiver = self;
  v11.super_class = (Class)UIPrintInteractionController;
  v2 = [(UIPrintInteractionController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    previewQueue = v3->_previewQueue;
    v3->_previewQueue = v4;

    [(NSOperationQueue *)v3->_previewQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_previewQueue setName:@"com.apple.UIKit.UIPrintInteractionController.printPreviewGeneration"];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    previewStates = v3->_previewStates;
    v3->_previewStates = (NSMutableSet *)v6;

    v3->_showsNumberOfCopies = 1;
    v3->_showsPaperOrientation = 1;
    v3->_showsScalingFactor = 1;
    v8 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    webKitFormatterMutex = v3->_webKitFormatterMutex;
    v3->_webKitFormatterMutex = v8;
  }
  return v3;
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v7 = (void (**)(void))a4;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    self->_supressNotifyDismissed = 1;
    uint64_t v6 = [(UIPrintInteractionController *)self printPanelViewController];
    [v6 dismissAnimated:v4 completionHandler:v7];
  }
  else if (v7)
  {
    v7[2]();
  }
}

- (BOOL)printStateActive
{
  return self->_printStateActive;
}

+ (BOOL)isPrintingAvailable
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isAirPrintAllowed];

  return v3;
}

+ (NSSet)printableUTIs
{
  v2 = (void *)printableUTIs___printableUTIs;
  if (!printableUTIs___printableUTIs)
  {
    char v3 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v4 = [(id)*MEMORY[0x1E4F44410] identifier];
    v5 = [(id)*MEMORY[0x1E4F44450] identifier];
    uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
    v7 = (void *)printableUTIs___printableUTIs;
    printableUTIs___printableUTIs = v6;

    CFArrayRef v8 = CGImageSourceCopyTypeIdentifiers();
    v2 = (void *)printableUTIs___printableUTIs;
    if (v8)
    {
      uint64_t v9 = [(id)printableUTIs___printableUTIs setByAddingObjectsFromArray:v8];
      v10 = (void *)printableUTIs___printableUTIs;
      printableUTIs___printableUTIs = v9;

      v2 = (void *)printableUTIs___printableUTIs;
    }
  }
  return (NSSet *)v2;
}

+ (BOOL)canPrintURL:(NSURL *)url
{
  char v3 = GetImageUTI(0, url);
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)canPrintData:(NSData *)data
{
  char v3 = GetImageUTI(data, 0);
  BOOL v4 = v3 != 0;

  return v4;
}

+ (UIPrintInteractionController)sharedPrintController
{
  v2 = (void *)__sharedPrintController;
  if (!__sharedPrintController)
  {
    char v3 = objc_alloc_init(UIPrintInteractionController);
    BOOL v4 = (void *)__sharedPrintController;
    __sharedPrintController = (uint64_t)v3;

    v2 = (void *)__sharedPrintController;
  }
  return (UIPrintInteractionController *)v2;
}

- (void)dealloc
{
  unint64_t v3 = *MEMORY[0x1E4FB2748];
  if (self->_backgroundTaskIdentifier != *MEMORY[0x1E4FB2748])
  {
    BOOL v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 _endBackgroundTask:self->_backgroundTaskIdentifier];

    self->_backgroundTaskIdentifier = v3;
  }
  [(UIPrintInteractionController *)self _cancelPreviewQueue:1 completionHandler:0];
  [(UIPrintInteractionController *)self _cleanPrintState];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  previewQueue = self->_previewQueue;
  self->_previewQueue = 0;

  v7.receiver = self;
  v7.super_class = (Class)UIPrintInteractionController;
  [(UIPrintInteractionController *)&v7 dealloc];
}

- (void)_cancelPreviewQueue:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  previewQueue = self->_previewQueue;
  if (previewQueue)
  {
    if (v4) {
      [(NSOperationQueue *)previewQueue cancelAllOperations];
    }
    if (v6)
    {
      CFArrayRef v8 = self->_previewQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70__UIPrintInteractionController__cancelPreviewQueue_completionHandler___block_invoke;
      v9[3] = &unk_1E6DA1540;
      v10 = v6;
      [(NSOperationQueue *)v8 addBarrierBlock:v9];
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __70__UIPrintInteractionController__cancelPreviewQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPrintingItem:(id)printingItem
{
  id v4 = printingItem;
  if (self->_printingItem != v4)
  {
    id v7 = v4;
    if (objc_opt_respondsToSelector()) {
      id v5 = (id)[v7 copy];
    }
    else {
      id v5 = v7;
    }
    id v6 = self->_printingItem;
    self->_printingItem = v5;

    id v4 = v7;
  }
}

- (void)updatePrintingItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_printingItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if (objc_msgSend(v10, "isFileURL", (void)v13)
            && IsPrintablePDFURL(v10, 0, 0)
            && ![(UIPrintInteractionController *)self _canPrintPDFURL:v10])
          {
            [v3 addObject:v10];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    objc_super v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_printingItems];
    [(NSArray *)v11 removeObjectsInArray:v3];
    printingItems = self->_printingItems;
    self->_printingItems = v11;
  }
}

- (BOOL)_presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v35 = a5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  if (!v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v35);
    id v8 = [v9 _findUISceneForLegacyInterfaceOrientation];
  }
  -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v8, v35);
  id v10 = [(UIPrintInteractionController *)self printingItems];
  BOOL v11 = (unint64_t)[v10 count] > 1;

  if (v11
    && ([(UIPrintInteractionController *)self updatePrintingItems],
        [(UIPrintInteractionController *)self printingItems],
        v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [v12 count] == 0,
        v12,
        v13))
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v8];
    objc_storeStrong((id *)&self->_alertWindow, v23);
    [v23 setOpaque:0];
    v24 = [MEMORY[0x1E4FB1618] clearColor];
    [v23 setBackgroundColor:v24];

    [v23 setWindowLevel:*MEMORY[0x1E4FB3118]];
    id v25 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    [v23 setRootViewController:v25];
    [v23 makeKeyAndVisible];
    v26 = (void *)MEMORY[0x1E4FB1418];
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"Protected PDF files can only be printed separately." value:@"Protected PDF files can only be printed separately." table:@"Localizable"];
    v29 = [v26 alertControllerWithTitle:v28 message:0 preferredStyle:1];

    v30 = (void *)MEMORY[0x1E4FB1410];
    v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"PRINT_INTERACTION_OK_BUTTON" value:@"OK" table:@"Localizable"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke;
    v48[3] = &unk_1E6DA1568;
    id v33 = v29;
    id v49 = v33;
    v50 = self;
    v34 = [v30 actionWithTitle:v32 style:0 handler:v48];
    [v33 addAction:v34];

    [v25 presentViewController:v33 animated:0 completion:0];
    int v21 = *((unsigned __int8 *)v52 + 24);
  }
  else
  {
    [(UIPrintInteractionController *)self setUsingWebKitFormatter:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v14 = [(UIPrintInteractionController *)self printPageRenderer];
    long long v15 = [v14 printFormatters];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = [(id)objc_opt_class() description];
          int v20 = [v19 isEqualToString:@"_WKWebViewPrintFormatter"];

          if (v20)
          {
            [(UIPrintInteractionController *)self setUsingWebKitFormatter:1];
            goto LABEL_15;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    objc_initWeak(&location, self);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke_2;
    v37[3] = &unk_1E6DA1590;
    objc_copyWeak(&v41, &location);
    v40 = &v51;
    v37[4] = self;
    id v39 = v36;
    BOOL v42 = a3;
    id v38 = v8;
    [(UIPrintInteractionController *)self _ensurePDFIsUnlockedFirstAttempt:1 completionHandler:v37];
    int v21 = *((unsigned __int8 *)v52 + 24);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v51, 8);

  return v21 != 0;
}

void __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  [*(id *)(*(void *)(a1 + 40) + 48) setHidden:1];
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

void __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v8 = WeakRetained;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _setupPrintPanel:*(void *)(a1 + 48) forPDFGenerationOnly:0];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v5 = [v8[32] pdfPassword];

      if (v5) {
        [v8 _updatePrintInfoWithAnnotations];
      }
      id v6 = objc_loadWeakRetained(v8 + 16);
      if (objc_opt_respondsToSelector()) {
        [v6 printInteractionControllerWillPresentPrinterOptions:*(void *)(a1 + 32)];
      }
      uint64_t v7 = [v8 printPanelViewController];
      [v7 presentPrintPanelAnimated:*(unsigned __int8 *)(a1 + 72) hostingScene:*(void *)(a1 + 40)];
    }
    else
    {
      [v8 _endPrintJobWithAction:0 error:0];
    }
    WeakRetained = v8;
  }
}

- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  return [(UIPrintInteractionController *)self _presentAnimated:animated hostingScene:0 completionHandler:completion];
}

- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  BOOL v7 = animated;
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  BOOL v13 = view;
  UIPrintInteractionCompletionHandler v14 = completion;
  long long v15 = [(UIPrintInteractionController *)self hostingWindowScene];

  if (!v15)
  {
    uint64_t v16 = [(UIView *)v13 window];
    uint64_t v17 = [v16 windowScene];
    [(UIPrintInteractionController *)self setHostingWindowScene:v17];

    uint64_t v18 = [(UIPrintInteractionController *)self hostingWindowScene];

    if (!v18)
    {
      v19 = [MEMORY[0x1E4FB1438] sharedApplication];
      int v20 = [v19 _findUISceneForLegacyInterfaceOrientation];
      [(UIPrintInteractionController *)self setHostingWindowScene:v20];
    }
  }
  int v21 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v22)
  {
    NSLog(&cfstr_WarningUiprint.isa);
    v23 = [(UIPrintInteractionController *)self hostingWindowScene];
    BOOL v24 = [(UIPrintInteractionController *)self _presentAnimated:v7 hostingScene:v23 completionHandler:v14];
  }
  else
  {
    BOOL v24 = 0;
    if ([(UIPrintInteractionController *)self _setupPrintPanel:v14 forPDFGenerationOnly:0])
    {
      objc_initWeak(&location, self);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__UIPrintInteractionController_presentFromRect_inView_animated_completionHandler___block_invoke;
      v26[3] = &unk_1E6DA15B8;
      objc_copyWeak(v28, &location);
      v26[4] = self;
      v28[1] = *(id *)&x;
      v28[2] = *(id *)&y;
      v28[3] = *(id *)&width;
      v28[4] = *(id *)&height;
      v27 = v13;
      BOOL v29 = v7;
      [(UIPrintInteractionController *)self _ensurePDFIsUnlockedFirstAttempt:1 completionHandler:v26];

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
      BOOL v24 = 1;
    }
  }

  return v24;
}

void __82__UIPrintInteractionController_presentFromRect_inView_animated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if (a2)
    {
      [WeakRetained _endPrintJobWithAction:0 error:0];
    }
    else
    {
      uint64_t v5 = [WeakRetained[32] pdfPassword];

      if (v5) {
        [v8 _updatePrintInfoWithAnnotations];
      }
      id v6 = objc_loadWeakRetained(v8 + 16);
      if (objc_opt_respondsToSelector()) {
        [v6 printInteractionControllerWillPresentPrinterOptions:*(void *)(a1 + 32)];
      }
      BOOL v7 = [v8 printPanelViewController];
      objc_msgSend(v7, "presentPrintPanelFromRect:inView:animated:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    }
    WeakRetained = v8;
  }
}

- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  BOOL v6 = animated;
  id v8 = item;
  UIPrintInteractionCompletionHandler v9 = completion;
  id v10 = [(UIPrintInteractionController *)self hostingWindowScene];

  if (!v10)
  {
    BOOL v11 = [(UIBarButtonItem *)v8 _viewForPresenting];
    v12 = [v11 window];
    BOOL v13 = [v12 windowScene];
    [(UIPrintInteractionController *)self setHostingWindowScene:v13];

    UIPrintInteractionCompletionHandler v14 = [(UIPrintInteractionController *)self hostingWindowScene];

    if (!v14)
    {
      long long v15 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v16 = [v15 _findUISceneForLegacyInterfaceOrientation];
      [(UIPrintInteractionController *)self setHostingWindowScene:v16];
    }
  }
  uint64_t v17 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if (v18)
  {
    BOOL v19 = 0;
    if ([(UIPrintInteractionController *)self _setupPrintPanel:v9 forPDFGenerationOnly:0])
    {
      objc_initWeak(&location, self);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __84__UIPrintInteractionController_presentFromBarButtonItem_animated_completionHandler___block_invoke;
      v22[3] = &unk_1E6DA15E0;
      objc_copyWeak(&v24, &location);
      v22[4] = self;
      v23 = v8;
      BOOL v25 = v6;
      [(UIPrintInteractionController *)self _ensurePDFIsUnlockedFirstAttempt:1 completionHandler:v22];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      BOOL v19 = 1;
    }
  }
  else
  {
    NSLog(&cfstr_WarningUiprint_0.isa);
    int v20 = [(UIPrintInteractionController *)self hostingWindowScene];
    BOOL v19 = [(UIPrintInteractionController *)self _presentAnimated:v6 hostingScene:v20 completionHandler:v9];
  }
  return v19;
}

void __84__UIPrintInteractionController_presentFromBarButtonItem_animated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if (a2)
    {
      [WeakRetained _endPrintJobWithAction:0 error:0];
    }
    else
    {
      uint64_t v5 = [WeakRetained[32] pdfPassword];

      if (v5) {
        [v8 _updatePrintInfoWithAnnotations];
      }
      id v6 = objc_loadWeakRetained(v8 + 16);
      if (objc_opt_respondsToSelector()) {
        [v6 printInteractionControllerWillPresentPrinterOptions:*(void *)(a1 + 32)];
      }
      BOOL v7 = [v8 printPanelViewController];
      [v7 presentPrintPanelFromBarButtonItem:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56)];
    }
    WeakRetained = v8;
  }
}

- (BOOL)printToPrinter:(UIPrinter *)printer completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  id v6 = printer;
  UIPrintInteractionCompletionHandler v7 = completion;
  if (!+[UIPrintInteractionController isPrintingAvailable])goto LABEL_9; {
  if (!self->_printingItem
  }
    && ![(NSArray *)self->_printingItems count]
    && !self->_printFormatter
    && !self->_printPageRenderer)
  {
    NSLog(&cfstr_ErrorAttemptin.isa);
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_31;
  }
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    id v8 = [(UIPrintInteractionController *)self printPanelViewController];

    if (v8)
    {
      UIPrintInteractionCompletionHandler v9 = [(UIPrintInteractionController *)self printPanelViewController];
      [v9 dismissAnimated:1 completionHandler:0];

      [(UIPrintInteractionController *)self setPrintPanelViewController:0];
    }
    goto LABEL_9;
  }
  [(UIPrintInteractionController *)self setPrintStateActive:1];
  BOOL v11 = (void *)[v7 copy];
  [(UIPrintInteractionController *)self set_completionHandler:v11];

  printInfo = self->_printInfo;
  if (printInfo)
  {
    BOOL v13 = (UIPrintInfo *)[(UIPrintInfo *)printInfo copy];
  }
  else
  {
    BOOL v13 = +[UIPrintInfo printInfo];
  }
  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = v13;

  [(UIPrintInfo *)self->_activePrintInfo setDuplex:0];
  if ([(NSArray *)self->_printingItems count] == 1)
  {
    long long v15 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
    id printingItem = self->_printingItem;
    self->_id printingItem = v15;

    printingItems = self->_printingItems;
    self->_printingItems = 0;
  }
  [(UIPrintInteractionController *)self _updatePrintInfoWithAnnotations];
  if (self->_printingItem
    && [(UIPrintInteractionController *)self _printingItemIsReallyTallPDF])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [UITallPDFPrintFormatter alloc];
      id v19 = self->_printingItem;
      int v20 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      uint64_t v21 = [(UITallPDFPrintFormatter *)v18 initWithPDFURL:v19 pdfPassword:v20];
LABEL_21:
      id v24 = (void *)v21;
      [(UIPrintInteractionController *)self setPrintFormatter:v21];

      BOOL v25 = [(UIPrintInteractionController *)self printFormatter];
      objc_msgSend(v25, "setPerPageContentInsets:", 36.0, 36.0, 36.0, 36.0);

      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [UITallPDFPrintFormatter alloc];
      id v23 = self->_printingItem;
      int v20 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      uint64_t v21 = [(UITallPDFPrintFormatter *)v22 initWithPDFData:v23 pdfPassword:v20];
      goto LABEL_21;
    }
  }
LABEL_22:
  v26 = [(UIPrinter *)v6 _internalPrinter];
  [(UIPrintInteractionController *)self setPrinter:v26];

  v27 = [(UIPrintInteractionController *)self printer];
  id v28 = (id)[v27 printInfoSupported];

  BOOL v29 = [(UIPrintInteractionController *)self printer];

  if (v29)
  {
    v30 = self->_printer;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke;
    v45[3] = &unk_1E6DA1608;
    v45[4] = self;
    [(UIPrintInteractionController *)self _setPrinterInfoState:_UIPrinterInfoGetState(v30, v45)];
  }
  else
  {
    printingProgress = self->_printingProgress;
    if (!printingProgress)
    {
      v32 = [(PKPrinter *)self->_printer displayName];
      id v33 = v32;
      if (!v32 || ![v32 length])
      {
        v34 = [(UIPrinter *)v6 URL];
        uint64_t v35 = [v34 host];

        id v33 = (void *)v35;
      }
      v36 = [UIPrintingProgress alloc];
      v37 = [(UIPrintInteractionController *)self hostingWindowScene];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_2;
      v44[3] = &unk_1E6DA1408;
      v44[4] = self;
      id v38 = [(UIPrintingProgress *)v36 initWithPrinterName:v33 forceDisplayAsAlert:1 hostingWindowScene:v37 cancelHandler:v44];
      id v39 = self->_printingProgress;
      self->_printingProgress = v38;

      printingProgress = self->_printingProgress;
    }
    [(UIPrintingProgress *)printingProgress setPrinterInfoState:0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_3;
    v41[3] = &unk_1E6DA1630;
    BOOL v42 = v6;
    v43 = self;
    [(UIPrinter *)v42 contactPrinter:v41];
  }
  BOOL v10 = 1;
LABEL_31:

  return v10;
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setPrinterInfoState:a2];
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPrintJobWithAction:0 error:0];
}

void __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  if (a2
    && ([*(id *)(a1 + 32) _internalPrinter], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v4 = (void *)v3, v5 = [*(id *)(a1 + 40) printStateActive], v4, v5))
  {
    id v6 = [*(id *)(a1 + 32) _internalPrinter];
    [*(id *)(a1 + 40) setPrinter:v6];

    UIPrintInteractionCompletionHandler v7 = *(void **)(a1 + 40);
    id v8 = (void *)v7[12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_4;
    v11[3] = &unk_1E6DA1608;
    v11[4] = v7;
    objc_msgSend(v7, "_setPrinterInfoState:", _UIPrinterInfoGetState(v8, v11));
  }
  else if ([*(id *)(a1 + 40) printStateActive])
  {
    [*(id *)(a1 + 40) _setPrinterInfoState:2];
    UIPrintInteractionCompletionHandler v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
    [v9 _endPrintJobWithAction:0 error:v10];
  }
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setPrinterInfoState:a2];
}

- (void)_cleanPrintState
{
  printPageRenderer = self->_printPageRenderer;
  self->_printPageRenderer = 0;

  printFormatter = self->_printFormatter;
  self->_printFormatter = 0;

  id printingItem = self->_printingItem;
  self->_id printingItem = 0;

  printingItems = self->_printingItems;
  self->_printingItems = 0;

  printPaper = self->_printPaper;
  self->_printPaper = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_printActivityDelegate, 0);
  *(_DWORD *)&self->_showsPageRange = 16777472;
  self->_isContentManaged = 0;
  self->_printStateActive = 0;
  previewStates = self->_previewStates;
  self->_pageCountWithRanges = 0;
  self->_previewStates = 0;

  tempPreviewFileURL = self->_tempPreviewFileURL;
  self->_tempPreviewFileURL = 0;

  paper = self->_paper;
  self->_paper = 0;

  self->_currentPage = 0;
  self->_pagesDrawn = 0;
  self->_currentRange.id location = 0;
  self->_currentRange.length = 0;
  printPanelViewController = self->_printPanelViewController;
  self->_printPanelViewController = 0;

  printingProgress = self->_printingProgress;
  self->_printingProgress = 0;

  printSettings = self->_printSettings;
  self->_printSettings = 0;

  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = 0;

  self->_printerInfoState = 0;
  self->_supressNotifyDismissed = 0;
  formatterRenderer = self->_formatterRenderer;
  self->_formatterRenderer = 0;

  self->_manualPrintPageEnabled = 0;
  saveFileURL = self->_saveFileURL;
  self->_saveFileURL = 0;

  self->_showPrintingProgress = 0;
  self->_pageCount = 0;
  pageRanges = self->_pageRanges;
  self->_pageRanges = 0;

  printer = self->_printer;
  self->_printer = 0;

  hostingWindowScene = self->_hostingWindowScene;
  self->_hostingWindowScene = 0;
}

- (id)_currentPrintInfo
{
  if ([(UIPrintInteractionController *)self printStateActive]) {
    activePrintInfo = self->_activePrintInfo;
  }
  else {
    activePrintInfo = 0;
  }
  return activePrintInfo;
}

- (CGSize)_printItemContentSize:(id)a3
{
  id v4 = a3;
  activePrintInfo = self->_activePrintInfo;
  if (activePrintInfo) {
    BOOL v6 = ([(UIPrintInfo *)activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else {
    BOOL v6 = 0;
  }
  UIPrintInteractionCompletionHandler v7 = [(PKPrinter *)self->_printer availableRollPapersPreferBorderless:v6];
  uint64_t v8 = [v7 count];

  double width = *MEMORY[0x1E4F1DB30];
  double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v8) {
    BOOL v11 = v4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 size];
      double width = v12;
      double height = v13;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v4;
        if (IsAssetURL(v14))
        {
          long long v15 = GetPHAssetForAssetURLSync(v14);
          double width = (double)(unint64_t)[v15 pixelWidth];
          double height = (double)(unint64_t)[v15 pixelHeight];
        }
        else if ([v14 isFileURL])
        {
          if ([(UIPrintInteractionController *)self _canPrintPDFURL:v14])
          {
            CGPDFDocumentRef v28 = CGPDFDocumentCreateWithURL((CFURLRef)v14);
            if (v28)
            {
              BOOL v29 = v28;
              uint64_t v30 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
              if (v30)
              {
                v31 = (void *)v30;
                BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v29);

                if (IsEncrypted)
                {
                  id v33 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                  CGPDFDocumentUnlockWithPassword(v29, (const char *)[v33 cStringUsingEncoding:4]);
                }
              }
              Page = CGPDFDocumentGetPage(v29, 1uLL);
              if (Page)
              {
                CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
                double width = BoxRect.size.width;
                double height = BoxRect.size.height;
              }
              CGPDFDocumentRelease(v29);
            }
          }
          else
          {
            v37 = CGImageSourceCreateWithURL((CFURLRef)v14, 0);
            if (v37)
            {
              id v38 = v37;
              ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v37, 0, 0);
              if (ImageAtIndex)
              {
                v40 = ImageAtIndex;
                double width = (double)CGImageGetWidth(ImageAtIndex);
                double height = (double)CGImageGetHeight(v40);
                CGImageRelease(v40);
              }
              CFRelease(v38);
            }
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(UIPrintInteractionController *)self _canPrintPDFData:v4])
          {
            uint64_t v16 = CGDataProviderCreateWithCFData((CFDataRef)v4);
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = CGPDFDocumentCreateWithProvider(v16);
              CGDataProviderRelease(v17);
              if (v18)
              {
                uint64_t v19 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                if (v19)
                {
                  int v20 = (void *)v19;
                  BOOL v21 = CGPDFDocumentIsEncrypted(v18);

                  if (v21)
                  {
                    id v22 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                    CGPDFDocumentUnlockWithPassword(v18, (const char *)[v22 cStringUsingEncoding:4]);
                  }
                }
                id v23 = CGPDFDocumentGetPage(v18, 1uLL);
                if (v23)
                {
                  CGRect v44 = CGPDFPageGetBoxRect(v23, kCGPDFCropBox);
                  double width = v44.size.width;
                  double height = v44.size.height;
                }
                CGPDFDocumentRelease(v18);
              }
            }
          }
          id v24 = CGImageSourceCreateWithData((CFDataRef)v4, 0);
          if (v24)
          {
            BOOL v25 = v24;
            v26 = CGImageSourceCreateImageAtIndex(v24, 0, 0);
            if (v26)
            {
              v27 = v26;
              double width = (double)CGImageGetWidth(v26);
              double height = (double)CGImageGetHeight(v27);
              CGImageRelease(v27);
            }
            CFRelease(v25);
          }
        }
        else
        {
          getPHAssetClass();
          if (objc_opt_isKindOfClass())
          {
            id v35 = v4;
            double width = (double)(unint64_t)[v35 pixelWidth];
            unint64_t v36 = [v35 pixelHeight];

            double height = (double)v36;
          }
        }
      }
    }
  }

  double v41 = width;
  double v42 = height;
  result.double height = v42;
  result.double width = v41;
  return result;
}

- (CGSize)_printItemContentSize
{
  id printingItem = self->_printingItem;
  if (printingItem)
  {
    id v4 = printingItem;
LABEL_3:
    [(UIPrintInteractionController *)self _printItemContentSize:v4];
    double v6 = v5;
    double v8 = v7;

    goto LABEL_4;
  }
  double v6 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(NSArray *)self->_printingItems count])
  {
    id v4 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
    if (v4) {
      goto LABEL_3;
    }
  }
LABEL_4:
  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)_canShowDuplex
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v19[0] = self->_printingItem;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    uint64_t v3 = self->_printingItems;
  }
  id v4 = v3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v5 = v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {

            BOOL v12 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v12 = ([(UIPrintInfo *)self->_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) != 1;
LABEL_16:

  return v12;
}

- (BOOL)_canShowPageRange
{
  if (self->_showsPageRange || (BOOL v3 = [(UIPrintInteractionController *)self _canPreviewContent]))
  {
    BOOL v3 = [(UIPrintInteractionController *)self printStateActive];
    if (v3) {
      LOBYTE(v3) = (self->_printPageRenderer || self->_formatterRenderer || self->_printingItem && !self->_printingItems)
    }
                && [(UIPrintInteractionController *)self pageCount] > 1;
  }
  return v3;
}

- (BOOL)_canShowPaperList
{
  BOOL v3 = [(UIPrintInteractionController *)self printStateActive];
  if (v3) {
    LOBYTE(v3) = ([(UIPrintInfo *)self->_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1
  }
              || self->_showsPaperSelectionForLoadedPapers;
  return v3;
}

- (BOOL)_canShowCopies
{
  return self->_showsNumberOfCopies;
}

- (BOOL)_canShowColor
{
  BOOL v3 = [(UIPrintInteractionController *)self printStateActive];
  if (v3) {
    LOBYTE(v3) = [(UIPrintInfo *)self->_activePrintInfo outputType] != UIPrintInfoOutputGrayscale
  }
              && [(UIPrintInfo *)self->_activePrintInfo outputType] != UIPrintInfoOutputPhotoGrayscale;
  return v3;
}

- (BOOL)_canShowStaple
{
  BOOL v3 = [(UIPrintInteractionController *)self printStateActive];
  if (v3) {
    LOBYTE(v3) = ([(UIPrintInfo *)self->_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (BOOL)_canShowPunch
{
  BOOL v3 = [(UIPrintInteractionController *)self printStateActive];
  if (v3) {
    LOBYTE(v3) = ([(UIPrintInfo *)self->_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (BOOL)_canShowAnnotations
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v31[0] = self->_printingItem;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  }
  else
  {
    BOOL v3 = self->_printingItems;
  }
  id v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v5 = v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v25 = v4;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          CFDataRef v10 = [(UIPrintInteractionController *)self _convertToPrintableItem:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v11 = CGDataProviderCreateWithCFData(v10);
            if (v11)
            {
              BOOL v12 = v11;
              double v13 = CGPDFDocumentCreateWithProvider(v11);
              CGDataProviderRelease(v12);
              if (v13)
              {
                long long v14 = v5;
                uint64_t v15 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                if (v15)
                {
                  long long v16 = (void *)v15;
                  BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v13);

                  if (IsEncrypted)
                  {
                    id v18 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                    CGPDFDocumentUnlockWithPassword(v13, (const char *)[v18 cStringUsingEncoding:4]);
                  }
                }
                size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v13);
                if (NumberOfPages)
                {
                  size_t v20 = NumberOfPages;
                  size_t v21 = 0;
                  BOOL v22 = 1;
                  do
                  {
                    if (CGPDFDocumentGetPage(v13, ++v21) && CGPDFPageGetAnnotationCount()) {
                      break;
                    }
                    BOOL v22 = v20 > v21;
                  }
                  while (v20 != v21);
                  CGPDFDocumentRelease(v13);
                  double v5 = v14;
                  if (v22)
                  {

                    BOOL v23 = 1;
                    goto LABEL_28;
                  }
                }
                else
                {
                  CGPDFDocumentRelease(v13);
                  double v5 = v14;
                }
              }
            }
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
      BOOL v23 = 0;
LABEL_28:
      id v4 = v25;
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)_canShowLayout
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v20[0] = self->_printingItem;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
  else
  {
    BOOL v3 = self->_printingItems;
  }
  id v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v5 = v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          CFDataRef v10 = -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v11 = [(UIPrintInteractionController *)self printInfo];
            unint64_t v12 = [v11 outputType] & 0xFFFFFFFFFFFFFFFDLL;

            if (v12 == 1)
            {

              BOOL v13 = 0;
              goto LABEL_17;
            }
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_17:
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_canShowOrientation
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (![(UIPrintInteractionController *)self showsPaperOrientation]) {
    return 0;
  }
  if (self->_printingItem)
  {
    v17[0] = self->_printingItem;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    BOOL v3 = self->_printingItems;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = v3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {

          BOOL v4 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v4 = 1;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
LABEL_18:

  return v4;
}

- (BOOL)_canShowScaling
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (![(UIPrintInteractionController *)self showsPaperOrientation]) {
    return 0;
  }
  if (self->_printingItem)
  {
    v17[0] = self->_printingItem;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    BOOL v3 = self->_printingItems;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = v3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {

          BOOL v4 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v4 = 1;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
LABEL_18:

  return v4;
}

- (NSArray)pageRanges
{
  if (![(UIPrintInteractionController *)self printStateActive]) {
    goto LABEL_11;
  }
  printPageRenderer = self->_printPageRenderer;
  if (printPageRenderer)
  {
    if ([(UIPrintPageRenderer *)printPageRenderer _numberOfPagesIsCached]) {
      goto LABEL_6;
    }
  }
  formatterRenderer = (NSArray *)self->_formatterRenderer;
  if (!formatterRenderer) {
    goto LABEL_12;
  }
  if ([(NSArray *)formatterRenderer _numberOfPagesIsCached])
  {
LABEL_6:
    pageRanges = self->_pageRanges;
    if ((!pageRanges || ![(NSArray *)pageRanges count])
      && ![(UIPrintInteractionController *)self usingWebKitFormatter])
    {
      [(UIPrintInteractionController *)self _updatePageCount];
    }
    formatterRenderer = self->_pageRanges;
  }
  else
  {
LABEL_11:
    formatterRenderer = 0;
  }
LABEL_12:
  return formatterRenderer;
}

- (void)setPageRanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int64_t v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "rangeValue", (void)v13);
          v9 += v12;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      int64_t v9 = 0;
    }

    self->_pageCountWithRanges = v9;
    objc_storeStrong((id *)&self->_pageRanges, a3);
  }
}

- (PKPrinter)printer
{
  if ([(UIPrintInteractionController *)self printStateActive]) {
    printer = self->_printer;
  }
  else {
    printer = 0;
  }
  return printer;
}

- (void)setPrinter:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (PKPrinter *)a3;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    p_printer = &self->_printer;
    if (self->_printer != v5)
    {
      objc_storeStrong((id *)&self->_printer, a3);
      paper = self->_paper;
      self->_paper = 0;

      BOOL v25 = self;
      [(UIPrintInfo *)self->_activePrintInfo _updateWithPrinter:v5];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v8 = [MEMORY[0x1E4F932E0] lastUsedPrinters];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        size_t v20 = v5;
        BOOL v11 = 0;
        uint64_t v12 = *(void *)v28;
        uint64_t v26 = *MEMORY[0x1E4F93460];
        uint64_t v24 = *MEMORY[0x1E4F93320];
        uint64_t v23 = *MEMORY[0x1E4F93328];
        uint64_t v21 = *MEMORY[0x1E4F93338];
        uint64_t v22 = *MEMORY[0x1E4F93330];
        while (1)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v8);
            }
            if (*p_printer)
            {
              long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              long long v15 = [v14 objectForKey:v26];
              long long v16 = [(PKPrinter *)*p_printer name];
              int v17 = [v15 isEqualToString:v16];

              if (v17)
              {
                uint64_t v18 = [v14 objectForKey:v24];

                if ((([v18 isEqualToString:v23] & 1) != 0
                   || [v18 isEqualToString:v21])
                  && [(UIPrintInfo *)v25->_activePrintInfo duplex] == UIPrintInfoDuplexNone)
                {
                  uint64_t v19 = 1;
LABEL_16:
                  [(UIPrintInfo *)v25->_activePrintInfo setDuplex:v19];
                }
                else if ([v18 isEqualToString:v22])
                {
                  uint64_t v19 = 0;
                  goto LABEL_16;
                }
                BOOL v11 = v18;
                continue;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (!v10)
          {

            id v5 = v20;
            if (!v11) {
              goto LABEL_23;
            }
            goto LABEL_28;
          }
        }
      }

LABEL_23:
      if ([(UIPrintInfo *)v25->_activePrintInfo duplex] == UIPrintInfoDuplexNone
        && ([(PKPrinter *)v5 type] == 3 || [(PKPrinter *)v5 type] == 2))
      {
        [(UIPrintInfo *)v25->_activePrintInfo setDuplex:1];
      }
      BOOL v11 = 0;
LABEL_28:
    }
  }
}

- (UIPrintPaper)paper
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (![(UIPrintInteractionController *)self printStateActive]) {
    goto LABEL_79;
  }
  p_paper = &self->_paper;
  if (self->_paper) {
    goto LABEL_79;
  }
  printer = self->_printer;
  activePrintInfo = self->_activePrintInfo;
  if (printer)
  {
    uint64_t v6 = [(UIPrintInfo *)activePrintInfo duplex];
    UIPrintInfoOutputType v7 = [(UIPrintInfo *)self->_activePrintInfo outputType];
    [(UIPrintInteractionController *)self _printItemContentSize];
    +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v6, v7);
  }
  else
  {
    +[UIPrintPaper _genericPaperListForOutputType:[(UIPrintInfo *)activePrintInfo outputType]];
  uint64_t v8 = };
  UIPrintInfoOutputType v9 = [(UIPrintInfo *)self->_activePrintInfo outputType];
  uint64_t v10 = [(UIPrintInteractionController *)self printPageRenderer];

  if (v10)
  {
    BOOL v11 = [(UIPrintInteractionController *)self printPageRenderer];
    [v11 paperRect];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  unint64_t v16 = v9 & 0xFFFFFFFFFFFFFFFDLL;
  if (v13 == 0.0 && self->_printer)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    [MEMORY[0x1E4F932E0] lastUsedPrintersForPhoto:v16 == 1];
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      unint64_t v67 = v9 & 0xFFFFFFFFFFFFFFFDLL;
      v68 = v8;
      v69 = &self->_paper;
      uint64_t v19 = *(void *)v84;
      uint64_t v20 = *MEMORY[0x1E4F93460];
      uint64_t v21 = *MEMORY[0x1E4F93458];
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v84 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v23, "objectForKey:", v20, v67, v68, v69);
          BOOL v25 = [(PKPrinter *)self->_printer name];
          int v26 = [v24 isEqualToString:v25];

          if (v26)
          {
            long long v27 = [v23 objectForKey:v21];
            if (v27)
            {
              long long v28 = v27;
              [v27 CGSizeValue];
              double v13 = v29;
              double v15 = v30;

              goto LABEL_22;
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
        if (v18) {
          continue;
        }
        break;
      }
LABEL_22:
      uint64_t v8 = v68;
      p_paper = v69;
      unint64_t v16 = v67;
    }
  }
  if (v13 == 0.0)
  {
    v31 = +[UIPrintPaper _defaultPaperForOutputType:[(UIPrintInfo *)self->_activePrintInfo outputType]];
    [v31 paperSize];
    double v13 = v32;
    double v15 = v33;
  }
  if (v13 <= 0.0) {
    goto LABEL_59;
  }
  unint64_t v34 = v16;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v35 = v8;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v80;
    while (2)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v80 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v79 + 1) + 8 * j);
        [v40 paperSize];
        if ((v41 != v13 || v42 != v15) && (v41 != v15 || v42 != v13)) {
          continue;
        }
        objc_storeStrong((id *)p_paper, v40);
        goto LABEL_44;
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v79 objects:v89 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
LABEL_44:

  long long v45 = *p_paper;
  unint64_t v16 = v34;
  if (!*p_paper)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v46 = v35;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v88 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v76;
      while (2)
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v76 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          [v51 paperSize];
          if (vabdd_f64(v52, v13) < 0.029 && vabdd_f64(v53, v15) < 0.029
            || vabdd_f64(v52, v15) < 0.029 && vabdd_f64(v53, v13) < 0.029)
          {
            objc_storeStrong((id *)p_paper, v51);
            goto LABEL_58;
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v75 objects:v88 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }
LABEL_58:

    unint64_t v16 = v34;
LABEL_59:
    long long v45 = *p_paper;
  }
  if (v16 != 1)
  {
LABEL_74:
    if (!v45)
    {
      id v62 = [(UIPrintInteractionController *)self _updatePrintPaper];
      objc_storeStrong((id *)p_paper, self->_printPaper);
      if (!self->_paper)
      {
        if ([v8 count])
        {
          uint64_t v63 = [v8 objectAtIndex:0];
          v64 = *p_paper;
          *p_paper = (UIPrintPaper *)v63;
        }
      }
    }
    goto LABEL_78;
  }
  if (!v45)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v54 = v8;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v72;
      while (2)
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v72 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v71 + 1) + 8 * m);
          [v59 paperSize];
          if (v61 <= 720.0 && v60 <= 720.0)
          {
            objc_storeStrong((id *)p_paper, v59);
            goto LABEL_73;
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v56) {
          continue;
        }
        break;
      }
    }
LABEL_73:

    long long v45 = *p_paper;
    goto LABEL_74;
  }
LABEL_78:

LABEL_79:
  if ([(UIPrintInteractionController *)self printStateActive]) {
    paper = self->_paper;
  }
  else {
    paper = 0;
  }
  return paper;
}

- (void)setPaper:(id)a3
{
  UIPrintInfoOutputType v7 = (UIPrintPaper *)a3;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    paper = self->_paper;
    p_paper = &self->_paper;
    if (paper != v7) {
      objc_storeStrong((id *)p_paper, a3);
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSURL)tempPreviewFileURL
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_tempPreviewFileURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTempPreviewFileURL:(id)a3
{
  BOOL v4 = (NSURL *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (obj->_tempPreviewFileURL && (-[NSURL isEqual:](v4, "isEqual:") & 1) == 0) {
    [(UIPrintInteractionController *)obj removeFileAtURL:obj->_tempPreviewFileURL];
  }
  tempPreviewFileURL = obj->_tempPreviewFileURL;
  obj->_tempPreviewFileURL = v4;

  objc_sync_exit(obj);
}

- (void)removeFileAtURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  if (v3)
  {
    id v5 = [v3 path];
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      id v10 = 0;
      char v7 = [v4 removeItemAtURL:v3 error:&v10];
      id v8 = v10;
      UIPrintInfoOutputType v9 = v8;
      if ((v7 & 1) == 0) {
        NSLog(&cfstr_RemovingTempor.isa, v8);
      }
    }
  }
}

- (void)_updatePrintInfoWithAnnotations
{
  if ([(UIPrintInteractionController *)self _canShowAnnotations])
  {
    activePrintInfo = self->_activePrintInfo;
    [(UIPrintInfo *)activePrintInfo setImagePDFAnnotations:1];
  }
}

- (id)rendererToUse
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_printPageRenderer)
  {
    if (!v2->_printFormatter)
    {
      BOOL v11 = 0;
      goto LABEL_14;
    }
    if (!v2->_formatterRenderer)
    {
      double v13 = objc_alloc_init(UIPrintPageRenderer);
      formatterRenderer = v2->_formatterRenderer;
      v2->_formatterRenderer = v13;

      [(UIPrintPageRenderer *)v2->_formatterRenderer addPrintFormatter:v2->_printFormatter startingAtPageAtIndex:0];
    }
  }
  id v3 = v2->_formatterRenderer;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v4 = [(UIPrintPageRenderer *)v3 printFormatters];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          UIPrintInfoOutputType v9 = [(UIPrintInteractionController *)v2 activePrintInfo];
          objc_msgSend(v8, "setImagePDFAnnotations:", objc_msgSend(v9, "imagePDFAnnotations"));
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
  printPageRenderer = v2->_printPageRenderer;
  if (!printPageRenderer) {
    printPageRenderer = v2->_formatterRenderer;
  }
  BOOL v11 = printPageRenderer;
LABEL_14:
  objc_sync_exit(v2);

  return v11;
}

- (void)_updatePageCount
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int64_t pageCount = self->_pageCount;
  id v3 = [(UIPrintInteractionController *)self _updatePrintPaper];
  BOOL v4 = [(UIPrintInteractionController *)self rendererToUse];
  if (v4)
  {
    [(UIPrintPaper *)self->_printPaper paperSize];
    double v6 = v5;
    [(UIPrintPaper *)self->_printPaper paperSize];
    objc_msgSend(v4, "setPaperRect:", 0.0, 0.0, v6, v7);
    [(UIPrintPaper *)self->_printPaper _printableRectForDuplex:[(UIPrintInfo *)self->_activePrintInfo duplex] != UIPrintInfoDuplexNone];
    objc_msgSend(v4, "setPrintableRect:");
    size_t v8 = [v4 _numberOfPages];
    self->_int64_t pageCount = v8;
    goto LABEL_3;
  }
  if (!self->_printingItem)
  {
    printingItems = self->_printingItems;
    if (printingItems) {
      size_t v8 = (int)[(NSArray *)printingItems count];
    }
    else {
      size_t v8 = 0;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || IsAssetURL(self->_printingItem))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    UIPrintInfoOutputType v9 = CGDataProviderCreateWithCFData((CFDataRef)self->_printingItem);
    if (!v9) {
      goto LABEL_11;
    }
    id v10 = v9;
    BOOL v11 = CGPDFDocumentCreateWithProvider(v9);
    CGDataProviderRelease(v10);
    if (!v11) {
      goto LABEL_11;
    }
LABEL_52:
    uint64_t v44 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
    if (v44)
    {
      long long v45 = (void *)v44;
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v11);

      if (IsEncrypted)
      {
        id v47 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
        CGPDFDocumentUnlockWithPassword(v11, (const char *)[v47 cStringUsingEncoding:4]);
      }
    }
    self->_int64_t pageCount = (int)CGPDFDocumentGetNumberOfPages(v11);
    CGPDFDocumentRelease(v11);
    size_t v8 = self->_pageCount;
LABEL_3:
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  BOOL v11 = CGPDFDocumentCreateWithURL((CFURLRef)self->_printingItem);
  if (v11) {
    goto LABEL_52;
  }
LABEL_11:
  size_t v8 = 1;
LABEL_12:
  self->_int64_t pageCount = v8;
LABEL_13:
  uint64_t v49 = v4;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = self->_printingItems;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (!v12) {
    goto LABEL_31;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v56;
  unint64_t v15 = 0x1E4F1C000uLL;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v56 != v14) {
        objc_enumerationMutation(obj);
      }
      CFURLRef v17 = *(const __CFURL **)(*((void *)&v55 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !IsAssetURL(v17))
      {
        uint64_t v20 = CGPDFDocumentCreateWithURL(v17);
        if (!v20) {
          continue;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        long long v18 = CGDataProviderCreateWithCFData(v17);
        if (!v18) {
          continue;
        }
        uint64_t v19 = v18;
        uint64_t v20 = CGPDFDocumentCreateWithProvider(v18);
        CGDataProviderRelease(v19);
        if (!v20) {
          continue;
        }
      }
      unint64_t v21 = v15;
      uint64_t v22 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        BOOL v24 = CGPDFDocumentIsEncrypted(v20);

        if (v24)
        {
          id v25 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
          CGPDFDocumentUnlockWithPassword(v20, (const char *)[v25 cStringUsingEncoding:4]);
        }
      }
      size_t v8 = v8 + CGPDFDocumentGetNumberOfPages(v20) - 1;
      CGPDFDocumentRelease(v20);
      unint64_t v15 = v21;
    }
    uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  }
  while (v13);
LABEL_31:

  if ([(UIPrintInfo *)self->_activePrintInfo pageCount] != v8) {
    [(UIPrintInfo *)self->_activePrintInfo setPageCount:v8];
  }
  pageRanges = self->_pageRanges;
  if (!pageRanges)
  {
    int64_t v28 = self->_pageCount;
    goto LABEL_38;
  }
  uint64_t v27 = [(NSArray *)pageRanges count];
  int64_t v28 = self->_pageCount;
  if (!v27 || v28 != pageCount)
  {
LABEL_38:
    double v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, v28);
    double v61 = v29;
    double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    v31 = self->_pageRanges;
    self->_pageRanges = v30;

    double v32 = (void *)[(NSArray *)self->_pageRanges copy];
    [(UIPrintInfo *)self->_activePrintInfo setPageRanges:v32];
  }
  self->_pageCountWithRanges = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v33 = self->_pageRanges;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v51 + 1) + 8 * j) rangeValue];
        self->_pageCountWithRanges += v38;
      }
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v35);
  }

  if (self->_pageCountWithRanges > self->_pageCount)
  {
    id v39 = [MEMORY[0x1E4F29238] valueWithRange:0];
    v59 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    double v41 = self->_pageRanges;
    self->_pageRanges = v40;

    double v42 = (void *)[(NSArray *)self->_pageRanges copy];
    [(UIPrintInfo *)self->_activePrintInfo setPageRanges:v42];

    self->_pageCountWithRanges = self->_pageCount;
  }
}

- (BOOL)_setupPrintPanel:(id)a3
{
  return [(UIPrintInteractionController *)self _setupPrintPanel:a3 forPDFGenerationOnly:1];
}

- (BOOL)_setupPrintPanel:(id)a3 forPDFGenerationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!+[UIPrintInteractionController isPrintingAvailable]&& !v4)
  {
    goto LABEL_10;
  }
  if (!self->_printingItem
    && ![(NSArray *)self->_printingItems count]
    && !self->_printFormatter
    && !self->_printPageRenderer)
  {
    NSLog(&cfstr_ErrorAttemptin.isa);
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_43;
  }
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    double v7 = [(UIPrintInteractionController *)self printPanelViewController];

    if (v7)
    {
      size_t v8 = [(UIPrintInteractionController *)self printPanelViewController];
      [v8 dismissAnimated:1 completionHandler:0];
    }
    goto LABEL_10;
  }
  [(UIPrintInteractionController *)self setPrintStateActive:1];
  id v10 = (void *)[v6 copy];
  [(UIPrintInteractionController *)self set_completionHandler:v10];

  if ([(NSArray *)self->_printingItems count] == 1)
  {
    BOOL v11 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
    id printingItem = self->_printingItem;
    self->_id printingItem = v11;

    printingItems = self->_printingItems;
    self->_printingItems = 0;
  }
  printInfo = self->_printInfo;
  if (printInfo)
  {
    unint64_t v15 = (UIPrintInfo *)[(UIPrintInfo *)printInfo copy];
  }
  else
  {
    unint64_t v15 = +[UIPrintInfo printInfo];
  }
  p_activePrintInfo = &self->_activePrintInfo;
  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = v15;

  long long v18 = [(UIPrintInteractionController *)self pdfPassword];
  [(UIPrintInfo *)self->_activePrintInfo setPdfPassword:v18];

  if (!self->_printInfo)
  {
    if (self->_printingItem)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = self->_printingItem;
        BOOL v24 = [v23 path];
        id v25 = [v24 lastPathComponent];
        int v26 = [v25 stringByDeletingPathExtension];
        [(UIPrintInfo *)self->_activePrintInfo setJobName:v26];
      }
    }
  }
  if (([(UIPrintInfo *)*p_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    [(UIPrintInfo *)*p_activePrintInfo setDuplex:0];
  }
  [(UIPrintInteractionController *)self _updatePrintInfoWithAnnotations];
  if (self->_printingItem
    && [(UIPrintInteractionController *)self _printingItemIsReallyTallPDF])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [UITallPDFPrintFormatter alloc];
      id v20 = self->_printingItem;
      unint64_t v21 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      uint64_t v22 = [(UITallPDFPrintFormatter *)v19 initWithPDFURL:v20 pdfPassword:v21];
LABEL_28:
      double v29 = (void *)v22;
      [(UIPrintInteractionController *)self setPrintFormatter:v22];

      double v30 = [(UIPrintInteractionController *)self printFormatter];
      objc_msgSend(v30, "setPerPageContentInsets:", 36.0, 36.0, 36.0, 36.0);

      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [UITallPDFPrintFormatter alloc];
      id v28 = self->_printingItem;
      unint64_t v21 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      uint64_t v22 = [(UITallPDFPrintFormatter *)v27 initWithPDFData:v28 pdfPassword:v21];
      goto LABEL_28;
    }
  }
LABEL_29:
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([WeakRetained printInteractionControllerParentViewController:self],
          (double v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v33 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
      char v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0
        || (id v35 = objc_loadWeakRetained((id *)&self->_printActivityDelegate),
            [v35 printInteractionControllerParentViewController:self],
            double v32 = objc_claimAutoreleasedReturnValue(),
            v35,
            !v32))
      {
        id v36 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
        char v37 = objc_opt_respondsToSelector();

        if (v37)
        {
          id v38 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
          id v39 = [v38 printInteractionControllerWindowForPresentation:self];
          v40 = [v39 rootViewController];

          double v41 = [v40 presentedViewController];

          if (v41)
          {
            do
            {
              double v32 = [v40 presentedViewController];

              double v42 = [v32 presentedViewController];

              v40 = v32;
            }
            while (v42);
          }
          else
          {
            double v32 = v40;
          }
        }
        else
        {
          double v32 = 0;
        }
      }
    }
    v43 = [[UIPrintPanelViewController alloc] initWithPrintInterationController:self inParentController:v32];
    [(UIPrintInteractionController *)self setPrintPanelViewController:v43];
  }
  BOOL v9 = 1;
LABEL_43:

  return v9;
}

- (void)_generatePDFWithNupForPrintingCompletion:(id)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, id))a3;
  double v5 = [(UIPrintInteractionController *)self rendererToUse];
  if (self->_printingItem)
  {
    v58[0] = self->_printingItem;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  }
  else
  {
    id v6 = self->_printingItems;
  }
  double v7 = v6;
  if (v5) {
    uint64_t v8 = [v5 numberOfPages];
  }
  else {
    uint64_t v8 = [(NSArray *)v6 count];
  }
  uint64_t v9 = v8;
  id v10 = [(UIPrintInteractionController *)self _tempFilePath];
  id v11 = [(UIPrintInteractionController *)self _newPDFURLWithPath:v10 isContentManaged:self->_isContentManaged];

  [(UIPrintInteractionController *)self _mediaRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(UIPrintInteractionController *)self activePrintInfo];
  [v20 scalingFactor];
  double v22 = v17 * v21;

  id v23 = [(UIPrintInteractionController *)self activePrintInfo];
  [v23 scalingFactor];
  double v25 = v19 * v24;

  int v26 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v11, v13, v15, v22, v25);
  if (v5)
  {
    id v50 = v11;
    long long v51 = v7;
    long long v52 = v4;
    uint64_t v27 = [(UIPrintInteractionController *)self _fullPagesRange];
    objc_msgSend(v5, "prepareForDrawingPages:", v27, v28);
    [v5 _startSaveContext:v26];
    double v29 = [(UIPrintInteractionController *)self activePrintInfo];
    double v30 = [v29 pageRanges];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          for (unint64_t j = [v36 rangeValue]; ; ++j)
          {
            uint64_t v38 = [v36 rangeValue];
            [v36 rangeValue];
            if (j >= v39 + v38) {
              break;
            }
            v40 = [(UIPrintInteractionController *)self activePrintInfo];
            [v40 scalingFactor];
            objc_msgSend(v5, "_drawPage:withScale:drawingToPDF:", j, 1);
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v33);
    }

    [v5 _endSaveContext];
    double v7 = v51;
    BOOL v4 = v52;
    id v11 = v50;
    goto LABEL_27;
  }
  if ([(NSArray *)v7 count] == 1)
  {
    id v31 = [(NSArray *)v7 objectAtIndex:0];
    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = v31;
        objc_msgSend(v41, "ui_setIsContentManaged:", self->_isContentManaged);
        if (!IsAssetURL(v41) && [(UIPrintInteractionController *)self _canPrintPDFURL:v41]) {
          goto LABEL_26;
        }
      }
    }
    double v42 = [(UIPrintInteractionController *)self _tempFilePath];
    id v41 = [(UIPrintInteractionController *)self _newPDFURLWithPath:v42 isContentManaged:self->_isContentManaged];

    v43 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v41, v13, v15, v22, v25);
    [(UIPrintInteractionController *)self _drawPrintItem:v31 toContext:v43 printAllPages:0];
    CGPDFContextClose(v43);
    CGContextRelease(v43);
LABEL_26:
    uint64_t v44 = [(UIPrintInteractionController *)self redrawPDFwithPageRange:v41];

    [(UIPrintInteractionController *)self removeFileAtURL:v11];
    id v11 = (id)v44;
LABEL_27:

    goto LABEL_28;
  }
  if ([(NSArray *)v7 count] >= 2 && v9)
  {
    for (uint64_t k = 0; k != v9; ++k)
    {
      if (![(UIPrintInteractionController *)self printStateActive]) {
        break;
      }
      uint64_t v49 = [(NSArray *)v7 objectAtIndex:k];
      [(UIPrintInteractionController *)self _drawPrintItem:v49 toContext:v26 printAllPages:1];
    }
  }
LABEL_28:
  if (v26)
  {
    CGPDFContextClose(v26);
    CGContextRelease(v26);
  }
  if ([(UIPrintInteractionController *)self needRedrawWithNUp])
  {
    long long v45 = [(UIPrintInteractionController *)self activePrintInfo];
    id v46 = [(UIPrintInteractionController *)self printPaper];
    uint64_t v47 = redrawPDFWithNUp(v11, v45, v46);

    id v11 = (id)v47;
  }
  v4[2](v4, v11);
}

- (id)redrawPDFwithPageRange:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v4 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
  uint64_t v39 = self;
  double v5 = [(UIPrintInteractionController *)self activePrintInfo];
  id v6 = [v5 pageRanges];
  double v7 = (void *)[v6 copy];

  CFURLRef v8 = 0;
  if (!v7 || !v4) {
    goto LABEL_24;
  }
  uint64_t v9 = [(UIPrintInteractionController *)v39 activePrintInfo];
  uint64_t v10 = [v9 pdfPassword];
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = (void *)v10;
  BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v4);

  if (IsEncrypted)
  {
    uint64_t v9 = [(UIPrintInteractionController *)v39 activePrintInfo];
    id v13 = [v9 pdfPassword];
    CGPDFDocumentUnlockWithPassword(v4, (const char *)[v13 cStringUsingEncoding:4]);

LABEL_6:
  }
  if (!CGPDFDocumentAllowsPrinting(v4))
  {
    CFURLRef v8 = 0;
    goto LABEL_27;
  }
  double v14 = [(UIPrintInteractionController *)v39 _tempFilePath];
  CFURLRef v8 = [(UIPrintInteractionController *)v39 _newPDFURLWithPath:v14 isContentManaged:v39->_isContentManaged];

  Page = CGPDFDocumentGetPage(v4, 1uLL);
  memset(&mediaBox, 0, sizeof(mediaBox));
  if (Page)
  {
    mediaBox.origin.CGFloat x = getPDFPageBoxRect(Page);
    mediaBox.origin.CGFloat y = v16;
    mediaBox.size.double width = v17;
    mediaBox.size.double height = v18;
  }
  CGContextRef v19 = CGPDFContextCreateWithURL(v8, &mediaBox, 0);
  if (v19)
  {
    id v20 = v19;
    CFURLRef v34 = v8;
    id v35 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obunint64_t j = v7;
    uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v41 != v37) {
            objc_enumerationMutation(obj);
          }
          double v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          size_t v23 = objc_msgSend(v22, "rangeValue", v34, v35);
          uint64_t v24 = [v22 rangeValue];
          [v22 rangeValue];
          if (v23 < v25 + v24)
          {
            do
            {
              ++v23;
              int v26 = v4;
              uint64_t v27 = CGPDFDocumentGetPage(v4, v23);
              uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
              getPDFPageProperties(v28, v27);
              CGPDFContextBeginPage(v20, v28);
              double v29 = [(UIPrintInteractionController *)v39 activePrintInfo];
              int v30 = [v29 imagePDFAnnotations];

              if (v30) {
                CGContextDrawPDFPageWithAnnotations();
              }
              else {
                CGContextDrawPDFPage(v20, v27);
              }
              CGContextEndPage(v20);

              uint64_t v31 = [v22 rangeValue];
              [v22 rangeValue];
              BOOL v4 = v26;
            }
            while (v23 < v32 + v31);
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v38);
    }

    CGPDFContextClose(v20);
    CGContextRelease(v20);
    CFURLRef v8 = v34;
    double v7 = v35;
  }
LABEL_24:
  if (v4) {
LABEL_27:
  }
    CGPDFDocumentRelease(v4);

  return v8;
}

- (id)_newPDFURLWithPath:(id)a3 isContentManaged:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  objc_msgSend(v5, "ui_setIsContentManaged:", v4);
  return v5;
}

- (id)_tempFilePath
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  uuid_unparse(out, v7);
  uint64_t v2 = NSString;
  id v3 = NSTemporaryDirectory();
  BOOL v4 = [NSString stringWithUTF8String:v7];
  double v5 = [v2 stringWithFormat:@"%@/%@.pdf", v3, v4];

  return v5;
}

- (void)_updateRendererWithQuality:(int64_t)a3
{
  obunint64_t j = [(UIPrintInteractionController *)self rendererToUse];
  objc_sync_enter(obj);
  self->_currentRenderingQualitCGFloat y = [obj currentRenderingQualityForRequestedRenderingQuality:a3];
  [obj setRequestedRenderingQuality:a3];
  objc_sync_exit(obj);
}

- (_NSRange)_fullPagesRange
{
  if ([(UIPrintInteractionController *)self _pageRendererAvailable])
  {
    NSUInteger v3 = 0;
    NSUInteger pageCount = self->_pageCount;
  }
  else
  {
    if (self->_printingItem) {
      goto LABEL_4;
    }
    if (![(NSArray *)self->_printingItems count])
    {
      NSUInteger pageCount = 0;
      NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
    if (self->_printingItem) {
LABEL_4:
    }
      NSUInteger pageCount = 1;
    else {
      NSUInteger pageCount = [(NSArray *)self->_printingItems count];
    }
    NSUInteger v3 = 0;
  }
LABEL_10:
  result.length = pageCount;
  result.id location = v3;
  return result;
}

- (BOOL)_isPageCancelled:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_previewStates containsObject:v4]) {
    char v5 = [v4 cancelled];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_pageRendererAvailable
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_printPageRenderer) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2->_printFormatter != 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (CGRect)_mediaRect
{
  BOOL v3 = [(UIPrintInteractionController *)self rendererToUse];
  id v4 = v3;
  if (v3)
  {
    [v3 paperRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    printInfo = self->_printInfo;
    if (printInfo) {
      uint64_t v14 = [(UIPrintInfo *)printInfo outputType];
    }
    else {
      uint64_t v14 = 1;
    }
    printPaper = self->_printPaper;
    if (printPaper)
    {
      CGFloat v16 = printPaper;
    }
    else
    {
      CGFloat v16 = +[UIPrintPaper _defaultPaperForOutputType:v14];
    }
    CGFloat v17 = v16;
    [(UIPrintPaper *)v16 paperSize];
    double v10 = v18;
    [(UIPrintPaper *)v17 paperSize];
    double v12 = v19;
    double v6 = 0.0;

    double v8 = 0.0;
  }

  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (id)_printingItemPrintablePDFURL
{
  if ([(UIPrintInteractionController *)self _pageRendererAvailable])
  {
    id v3 = 0;
    goto LABEL_13;
  }
  if ([(NSArray *)self->_printingItems count] == 1)
  {
    id v4 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
  }
  else
  {
    id v4 = self->_printingItem;
  }
  double v5 = v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v5;
      objc_msgSend(v3, "ui_setIsContentManaged:", self->_isContentManaged);
      if (!IsAssetURL(v3) && [(UIPrintInteractionController *)self _canPrintPDFURL:v3]) {
        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

LABEL_13:
  return v3;
}

- (void)_generatePDFWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[v4 copy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained printInteractionControllerWillStartJob:self];
  }
  uint64_t v7 = [(UIPrintInteractionController *)self _printingItemPrintablePDFURL];
  double v8 = (void *)v7;
  if (!v4 || !v7) {
    goto LABEL_15;
  }
  [(UIPrintInteractionController *)self _printablePDFURLSize:v7];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(UIPrintInteractionController *)self paper];
  [v13 paperSize];
  if (v10 != v15 || v12 != v14)
  {
LABEL_14:

    goto LABEL_15;
  }
  if ([(UIPrintInteractionController *)self _canShowAnnotations])
  {
    CGFloat v16 = [(UIPrintInteractionController *)self activePrintInfo];
    if ([v16 imagePDFAnnotations])
    {
      int64_t v17 = [(UIPrintInteractionController *)self pageCount];
      int64_t pageCountWithRanges = self->_pageCountWithRanges;

      if (v17 != pageCountWithRanges) {
        goto LABEL_15;
      }
LABEL_12:
      [(UIPrintInteractionController *)self _updatePageCount];
      (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
      goto LABEL_18;
    }

    goto LABEL_14;
  }
  int64_t v19 = [(UIPrintInteractionController *)self pageCount];
  int64_t v20 = self->_pageCountWithRanges;

  if (v19 == v20) {
    goto LABEL_12;
  }
LABEL_15:
  [(UIPrintInteractionController *)self _cancelAllPreviewGeneration];
  double v21 = objc_alloc_init(UIPrintPreviewState);
  previewStates = self->_previewStates;
  if (!previewStates)
  {
    double v23 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    uint64_t v24 = self->_previewStates;
    self->_previewStates = v23;

    previewStates = self->_previewStates;
  }
  [(NSMutableSet *)previewStates addObject:v21];
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__UIPrintInteractionController__generatePDFWithCompletionHandler___block_invoke;
  v26[3] = &unk_1E6DA1658;
  objc_copyWeak(&v29, &location);
  uint64_t v25 = v21;
  uint64_t v27 = v25;
  id v28 = v5;
  [(UIPrintInteractionController *)self _cancelPreviewQueue:1 completionHandler:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

LABEL_18:
}

void __66__UIPrintInteractionController__generatePDFWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v14 = WeakRetained;
    if ([*(id *)(a1 + 32) cancelled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3) {
        (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, 1);
      }
    }
    else
    {
      if ([v14 _pageRendererAvailable]) {
        [v14 _updateRendererWithQuality:0];
      }
      [v14 _updatePageCount];
      uint64_t v4 = [v14 _fullPagesRange];
      uint64_t v6 = v5;
      if ([v14 _pageRendererAvailable])
      {
        uint64_t v7 = [v14 rendererToUse];
        objc_msgSend(v7, "prepareForDrawingPages:", v4, v6);
      }
      double v8 = [v14 drawPagesWithPreviewState:*(void *)(a1 + 32)];
      if ([*(id *)(a1 + 32) cancelled]) {
        double v9 = 0;
      }
      else {
        double v9 = v8;
      }
      id v10 = v9;
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v10, [*(id *)(a1 + 32) cancelled]);
      }
      [v14 setTempPreviewFileURL:v8];
    }
    id WeakRetained = v14;
    id v12 = v14[25];
    if (v12 && *(void *)(a1 + 32))
    {
      id v13 = v12;
      objc_sync_enter(v13);
      [v14[25] removeObject:*(void *)(a1 + 32)];
      objc_sync_exit(v13);

      id WeakRetained = v14;
    }
  }
}

- (int64_t)numberOfPages
{
  return [(UIPrintInfo *)self->_activePrintInfo pageCount];
}

- (id)getPrintingItemForPageNum:(int64_t)a3 pdfItemPageNum:(int64_t *)a4
{
  uint64_t v5 = self;
  v35[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v35[0] = self->_printingItem;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  }
  else
  {
    uint64_t v6 = self->_printingItems;
  }
  uint64_t v7 = v6;
  if (!v6 || ![(NSArray *)v6 count])
  {
    CFURLRef v11 = 0;
    goto LABEL_32;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v8 = v7;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9)
  {
    CFURLRef v11 = 0;
    goto LABEL_31;
  }
  uint64_t v10 = v9;
  int v26 = a4;
  uint64_t v27 = v7;
  CFURLRef v11 = 0;
  int64_t v12 = 0;
  uint64_t v13 = *(void *)v31;
  id v28 = v8;
LABEL_8:
  uint64_t v14 = 0;
  CFURLRef v15 = v11;
  while (1)
  {
    if (*(void *)v31 != v13) {
      objc_enumerationMutation(v8);
    }
    CFURLRef v11 = (const __CFURL *)*(id *)(*((void *)&v30 + 1) + 8 * v14);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !IsAssetURL(v11))
    {
      double v18 = CGPDFDocumentCreateWithURL(v11);
      if (!v18) {
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (CGFloat v16 = CGDataProviderCreateWithCFData(v11)) == 0
        || (v17 = v16, double v18 = CGPDFDocumentCreateWithProvider(v16), CGDataProviderRelease(v17), !v18))
      {
LABEL_16:
        if (++v12 == a3) {
          goto LABEL_27;
        }
        goto LABEL_24;
      }
    }
    int64_t v19 = v5;
    uint64_t v20 = [(UIPrintInfo *)v5->_activePrintInfo pdfPassword];
    if (v20)
    {
      double v21 = (void *)v20;
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v18);

      if (IsEncrypted)
      {
        id v23 = [(UIPrintInfo *)v19->_activePrintInfo pdfPassword];
        CGPDFDocumentUnlockWithPassword(v18, (const char *)[v23 cStringUsingEncoding:4]);
      }
    }
    int64_t v24 = CGPDFDocumentGetNumberOfPages(v18) + v12;
    if (v24 >= a3) {
      break;
    }
    CGPDFDocumentRelease(v18);
    int64_t v12 = v24;
    uint64_t v5 = v19;
    double v8 = v28;
LABEL_24:
    ++v14;
    CFURLRef v15 = v11;
    if (v10 == v14)
    {
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10) {
        goto LABEL_8;
      }

      CFURLRef v11 = 0;
LABEL_27:
      uint64_t v7 = v27;
      goto LABEL_31;
    }
  }
  int64_t *v26 = a3 - v12;
  CGPDFDocumentRelease(v18);
  uint64_t v7 = v27;
  double v8 = v28;
LABEL_31:

LABEL_32:
  return v11;
}

- (CGSize)paperSizeForPageNum:(int64_t)a3
{
  uint64_t v5 = [(UIPrintInteractionController *)self rendererToUse];
  uint64_t v6 = v5;
  if (!v5)
  {
    double width = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    size_t pageNumber = a3;
    CFURLRef v11 = [(UIPrintInteractionController *)self getPrintingItemForPageNum:a3 pdfItemPageNum:&pageNumber];
    int64_t v12 = [(UIPrintInteractionController *)self _convertToPrintableItem:v11];

    if (!v12)
    {
LABEL_42:

      goto LABEL_43;
    }
    printInfo = self->_printInfo;
    if (printInfo) {
      uint64_t v14 = [(UIPrintInfo *)printInfo outputType];
    }
    else {
      uint64_t v14 = 1;
    }
    printPaper = self->_printPaper;
    if (printPaper)
    {
      CGFloat v16 = printPaper;
    }
    else
    {
      CGFloat v16 = +[UIPrintPaper _defaultPaperForOutputType:v14];
    }
    int64_t v17 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v12;
      if ([v18 CGImage])
      {
        [v18 size];
        double width = v19;
        double v10 = v20;
      }
      double v21 = [v17 _pkPaper];
      if ([v21 isRoll] && !self->_printingItem)
      {
        NSUInteger v46 = [(NSArray *)self->_printingItems count];

        if (v46 < 2) {
          goto LABEL_16;
        }
        double v21 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, [(UIPrintInfo *)self->_printInfo duplex], v14, width, v10);
        if (v21)
        {
          uint64_t v47 = +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v21, width, v10);

          int64_t v17 = (void *)v47;
        }
      }

LABEL_16:
      goto LABEL_35;
    }
    double v22 = CGDataProviderCreateWithCFData((CFDataRef)v12);
    if (!v22 || (v23 = v22, int64_t v24 = CGPDFDocumentCreateWithProvider(v22), CGDataProviderRelease(v23), !v24))
    {
LABEL_35:
      [v17 paperSize];
      double v35 = v34;
      [v17 paperSize];
      if ((v35 <= v36 || width >= v10)
        && (([v17 paperSize], double v38 = v37, objc_msgSend(v17, "paperSize"), v38 >= v39) || width <= v10))
      {
        [v17 paperSize];
        double width = v42;
        [v17 paperSize];
        double v10 = v43;
      }
      else
      {
        [v17 paperSize];
        double width = v40;
        [v17 paperSize];
        double v10 = v41;
      }

      goto LABEL_42;
    }
    uint64_t v25 = [(UIPrintInteractionController *)self activePrintInfo];
    uint64_t v26 = [v25 pdfPassword];
    if (v26)
    {
      uint64_t v27 = (void *)v26;
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v24);

      if (!IsEncrypted)
      {
LABEL_23:
        Page = CGPDFDocumentGetPage(v24, pageNumber);
        CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        double width = BoxRect.size.width;
        double height = BoxRect.size.height;
        LODWORD(v32) = CGPDFPageGetRotationAngle(Page) % 360;
        if ((int)v32 >= 0) {
          uint64_t v32 = (int)v32;
        }
        else {
          uint64_t v32 = (int)v32 + 360;
        }
        BOOL v33 = v32 == 90 || v32 == 270;
        if (v33) {
          double v10 = width;
        }
        else {
          double v10 = height;
        }
        if (v33) {
          double width = height;
        }
        CGPDFDocumentRelease(v24);
        goto LABEL_35;
      }
      uint64_t v25 = [(UIPrintInteractionController *)self activePrintInfo];
      id v29 = [v25 pdfPassword];
      CGPDFDocumentUnlockWithPassword(v24, (const char *)[v29 cStringUsingEncoding:4]);
    }
    goto LABEL_23;
  }
  [v5 paperRect];
  double width = v7;
  double v10 = v9;
LABEL_43:

  double v44 = width;
  double v45 = v10;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (void)drawImageForPageNum:(int64_t)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v10 = [(UIPrintInteractionController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int64_t v12 = [(UIPrintInteractionController *)self delegate];
    [v12 printInteractionControllerWillStartJob:self];
  }
  uint64_t v13 = [(UIPrintInteractionController *)self rendererToUse];
  if (!v13)
  {
    size_t pageNumber = a3;
    CGFloat v16 = [(UIPrintInteractionController *)self getPrintingItemForPageNum:a3 pdfItemPageNum:&pageNumber];
    id v18 = [(UIPrintInteractionController *)self _convertToPrintableItem:v16];
    if (!v18)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[UIPrintInteractionController drawImage:toContext:sheetSize:](self, "drawImage:toContext:sheetSize:", v18, a4, width, height);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    CGDataProviderRef v19 = CGDataProviderCreateWithCFData((CFDataRef)v18);
    if (!v19) {
      goto LABEL_21;
    }
    double v20 = v19;
    CGContextSaveGState(a4);
    memset(&v33, 0, sizeof(v33));
    CGContextGetBaseCTM();
    CGContextGetCTM(&v30, a4);
    CGContextSetBaseCTM();
    double v21 = CGPDFDocumentCreateWithProvider(v20);
    CGDataProviderRelease(v20);
    if (!v21)
    {
LABEL_20:
      transforuint64_t m = v33;
      CGContextSetBaseCTM();
      CGContextRestoreGState(a4);
      goto LABEL_21;
    }
    double v22 = [(UIPrintInteractionController *)self activePrintInfo];
    uint64_t v23 = [v22 pdfPassword];
    if (v23)
    {
      int64_t v24 = (void *)v23;
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v21);

      if (!IsEncrypted)
      {
LABEL_17:
        CGPDFPageRef Page = CGPDFDocumentGetPage(v21, pageNumber);
        if (Page)
        {
          id v28 = Page;
          id v29 = [(UIPrintInteractionController *)self printPaper];
          drawPDFPageToCGContext(v28, a4, v29, [(UIPrintInfo *)self->_activePrintInfo imagePDFAnnotations], width, height);
        }
        CGPDFDocumentRelease(v21);
        goto LABEL_20;
      }
      double v22 = [(UIPrintInteractionController *)self activePrintInfo];
      id v26 = [v22 pdfPassword];
      CGPDFDocumentUnlockWithPassword(v21, (const char *)[v26 cStringUsingEncoding:4]);
    }
    goto LABEL_17;
  }
  uint64_t v14 = [(UIPrintInteractionController *)self renderThumbnailMutex];

  if (!v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    [(UIPrintInteractionController *)self setRenderThumbnailMutex:v15];
  }
  CGFloat v16 = [(UIPrintInteractionController *)self renderThumbnailMutex];
  objc_sync_enter(v16);
  CGContextSaveGState(a4);
  [(UIPrintInteractionController *)self paperSizeForPageNum:a3];
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, height / v17, height / v17);
  transforuint64_t m = v33;
  CGContextConcatCTM(a4, &transform);
  [(UIPrintInteractionController *)self _updateRendererWithQuality:1];
  objc_msgSend(v13, "prepareForDrawingPages:", a3 - 1, 1);
  [v13 _startSaveContext:a4];
  [v13 _drawPage:a3 - 1 withScale:0 drawingToPDF:1.0];
  [v13 _endSaveContext];
  CGContextRestoreGState(a4);
  objc_sync_exit(v16);
LABEL_22:
}

- (id)createWebKitPDFForAllPages
{
  uint64_t v3 = [(UIPrintInteractionController *)self webKitFormatterMutex];
  objc_sync_enter(v3);
  [(UIPrintInteractionController *)self _updateRendererWithQuality:0];
  uint64_t v4 = [(UIPrintInteractionController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(UIPrintInteractionController *)self delegate];
    [v6 printInteractionControllerWillStartJob:self];
  }
  [(UIPrintInteractionController *)self _updatePageCount];
  if ([(UIPrintInteractionController *)self pageCount] < 1)
  {
    id v13 = 0;
  }
  else
  {
    double v7 = [(UIPrintInteractionController *)self rendererToUse];
    [v7 paperRect];
    double v9 = v8;
    double v11 = v10;
    int64_t v12 = [(UIPrintInteractionController *)self _tempFilePath];
    id v13 = [(UIPrintInteractionController *)self _newPDFURLWithPath:v12 isContentManaged:self->_isContentManaged];

    uint64_t v14 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v13, 0.0, 0.0, v9, v11);
    [v7 _startSaveContext:v14];
    unint64_t v15 = [(UIPrintInteractionController *)self _fullPagesRange];
    uint64_t v17 = v16;
    if (v15 < v15 + v16)
    {
      do
      {
        id v18 = [MEMORY[0x1E4F29060] currentThread];
        char v19 = [v18 isCancelled];

        if (v19) {
          break;
        }
        [v7 _drawPage:v15++ withScale:1 drawingToPDF:1.0];
        --v17;
      }
      while (v17);
    }
    [v7 _endSaveContext];
    CGPDFContextClose(v14);
    CGContextRelease(v14);
  }
  objc_sync_exit(v3);

  return v13;
}

- (void)recalculateWebKitPageCount
{
  obunint64_t j = [(UIPrintInteractionController *)self webKitFormatterMutex];
  objc_sync_enter(obj);
  [(UIPrintInteractionController *)self _updatePageCount];
  objc_sync_exit(obj);
}

- (id)drawPagesWithPreviewState:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UIPrintInteractionController *)self rendererToUse];
  if (self->_printingItem)
  {
    v43[0] = self->_printingItem;
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = [v5 numberOfPages];
      goto LABEL_6;
    }
  }
  else
  {
    double v37 = self->_printingItems;
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = [(NSArray *)v37 count];
LABEL_6:
  uint64_t v7 = v6;
  double v8 = [(UIPrintInteractionController *)self _tempFilePath];
  id v35 = [(UIPrintInteractionController *)self _newPDFURLWithPath:v8 isContentManaged:self->_isContentManaged];

  if (v5)
  {
    double v9 = [(UIPrintInteractionController *)self printPaper];
    [v9 scalingFactor];
    double v11 = v10;

    int64_t v12 = [(UIPrintInteractionController *)self printPaper];
    [v12 paperSize];
    double v14 = v13;
    double v16 = v15;

    [(UIPrintInteractionController *)self _mediaRect];
    if (v14 == v19 && v16 == v20)
    {
      double v20 = v11 * v16;
      double v19 = v11 * v14;
      double v17 = 0.0;
      double v18 = 0.0;
    }
    context = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v35, v17, v18, v19, v20);
    obunint64_t j = [(UIPrintInteractionController *)self webKitFormatterMutex];
    objc_sync_enter(obj);
    [v5 _startSaveContext:context];
    double v21 = [(UIPrintInteractionController *)self activePrintInfo];
    double v22 = [v21 pageRanges];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v39;
LABEL_11:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v38 + 1) + 8 * v26);
        unint64_t v28 = objc_msgSend(v27, "rangeValue", obj);
        do
        {
          uint64_t v29 = [v27 rangeValue];
          [v27 rangeValue];
          if (v28 >= v30 + v29) {
            break;
          }
          [v5 _drawPage:v28 withScale:1 drawingToPDF:v11];
          if (![(UIPrintInteractionController *)self printStateActive]) {
            break;
          }
          ++v28;
        }
        while (![(UIPrintInteractionController *)self _isPageCancelled:v4]);
        if (![(UIPrintInteractionController *)self printStateActive]
          || [(UIPrintInteractionController *)self _isPageCancelled:v4])
        {
          break;
        }
        if (++v26 == v24)
        {
          uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v24) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    [v5 _endSaveContext];
    long long v31 = obj;
    objc_sync_exit(obj);
LABEL_23:
  }
  else
  {
    [(UIPrintInteractionController *)self _mediaRect];
    context = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v35);
    if (v7)
    {
      unint64_t v33 = 0;
      while ([(UIPrintInteractionController *)self printStateActive]
           && ![(UIPrintInteractionController *)self _isPageCancelled:v4])
      {
        if (v33 < [(NSArray *)v37 count])
        {
          long long v31 = [(NSArray *)v37 objectAtIndex:v33];
          [(UIPrintInteractionController *)self _drawPrintItem:v31 toContext:context printAllPages:[(NSArray *)v37 count] > 1];
          if (![(UIPrintInteractionController *)self printStateActive]
            || [(UIPrintInteractionController *)self _isPageCancelled:v4])
          {
            goto LABEL_23;
          }
        }
        if (v7 == ++v33) {
          break;
        }
      }
    }
  }
  if (context)
  {
    CGPDFContextClose(context);
    CGContextRelease(context);
  }

  return v35;
}

- (void)drawImage:(id)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  double v10 = [v9 CIImage];

  if (v10)
  {
    uint64_t v11 = ConvertCIBasedImage(v9);

    id v9 = (id)v11;
  }
  id v46 = v9;
  int64_t v12 = (CGImage *)[v46 CGImage];
  double v13 = v46;
  if (v12)
  {
    unint64_t v14 = [v46 imageOrientation];
    if (v14 > 7) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = drawImage_toContext_sheetSize___UIImageOrientationToEXIFOrientationMapping[v14];
    }
    double v16 = [(UIPrintInteractionController *)self printPaper];
    [v16 paperSize];
    double v18 = v17;
    double v20 = v19;

    double v21 = [(UIPrintInteractionController *)self printPaper];
    [v21 printableRect];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    double v30 = v18 - (v23 + v27);
    double v31 = v20 - (v25 + v29);
    double v44 = height;
    if ((v18 <= v20 || width >= height) && (v18 >= v20 || width <= height))
    {
      double v32 = v25;
      double v33 = v31;
      double v31 = v30;
      double v25 = v23;
      double v34 = v20;
      double v20 = v18;
    }
    else
    {
      double v32 = v23;
      double v33 = v30;
      double v34 = v18;
    }
    objc_msgSend(v46, "size", *(void *)&v44);
    double v36 = v35;
    [v46 size];
    if (v36 >= v37 + v37)
    {
      BOOL v41 = 0;
    }
    else
    {
      [v46 size];
      double v39 = v38;
      [v46 size];
      BOOL v41 = v39 < v40 + v40;
    }
    BOOL v42 = v25 == 0.0;
    if (v31 != 0.0) {
      BOOL v42 = 0;
    }
    if (v33 != 0.0) {
      BOOL v42 = 0;
    }
    if (v32 != 0.0) {
      BOOL v42 = 0;
    }
    double v43 = width / v20;
    if (width / v20 >= v45 / v34) {
      double v43 = v45 / v34;
    }
    drawCGImageToCGContext(v12, a4, v15, v42 && v41, 0, width, v45, v25 * v43, v32 * v43, width - v31 * v43 - v25 * v43, v45 - v32 * v43 - v33 * v43);
    double v13 = v46;
  }
}

- (void)_generatePrintPreview:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__UIPrintInteractionController__generatePrintPreview___block_invoke;
  v6[3] = &unk_1E6DA1680;
  id v7 = v4;
  id v5 = v4;
  [(UIPrintInteractionController *)self _generatePDFWithCompletionHandler:v6];
}

uint64_t __54__UIPrintInteractionController__generatePrintPreview___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    CGSize result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (id)_convertToPrintableItem:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  getPHAssetClass();
  char v6 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 && (v6 & 1) == 0) {
    goto LABEL_8;
  }
  double v8 = [(UIPrintInteractionController *)self convertedPrintableItems];

  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    [(UIPrintInteractionController *)self setConvertedPrintableItems:v11];

LABEL_14:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v4;
      if (IsAssetURL(v12))
      {
        GetPHAssetForAssetURLSync(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v13) {
          goto LABEL_40;
        }
LABEL_30:
        GetImageForPHAssetSync(v13);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
        if (!v7)
        {
          id v14 = 0;
LABEL_42:
          id v17 = 0;
          goto LABEL_43;
        }
LABEL_32:
        double v19 = [v7 CIImage];

        if (v19)
        {
          uint64_t v20 = ConvertCIBasedImage(v7);

          id v7 = (id)v20;
        }
        id v17 = v7;
        if ([v17 CGImage])
        {
          id v7 = v17;
          id v14 = 0;
          id v17 = v7;
        }
        else
        {
          id v14 = 0;
          id v7 = 0;
        }
        goto LABEL_43;
      }
      id v25 = 0;
      id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12 options:1 error:&v25];
      id v15 = v25;
      double v16 = v15;
      if (!v14)
      {
        NSLog(&cfstr_SFailedToLoadD.isa, "-[UIPrintInteractionController _convertToPrintableItem:]", v12, v15);

        id v13 = 0;
LABEL_41:
        id v7 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v4;
        id v13 = 0;
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        getPHAssetClass();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = 0;
LABEL_40:
          id v14 = 0;
          goto LABEL_41;
        }
        id v13 = v4;
        goto LABEL_30;
      }
      id v14 = v4;
    }
    if ([(UIPrintInteractionController *)self _canPrintPDFData:v14])
    {
      id v14 = v14;
      id v13 = 0;
      id v17 = 0;
      id v7 = v14;
LABEL_43:
      double v21 = [(UIPrintInteractionController *)self convertedPrintableItems];
      double v22 = v21;
      if (v7)
      {
        [v21 setObject:v7 forKey:v4];
      }
      else
      {
        double v23 = [MEMORY[0x1E4F1CA98] null];
        [v22 setObject:v23 forKey:v4];
      }
      goto LABEL_47;
    }
    double v18 = CGImageSourceCreateWithData((CFDataRef)v14, 0);
    id v13 = v18;
    if (!v18) {
      goto LABEL_41;
    }
    ImageFromImageSource(v18);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    CFRelease(v13);
    id v13 = 0;
    goto LABEL_31;
  }
  id v9 = [(UIPrintInteractionController *)self convertedPrintableItems];
  id v7 = [v9 objectForKey:v4];

  if (!v7) {
    goto LABEL_14;
  }
  id v10 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v10)
  {

LABEL_8:
    id v7 = 0;
  }
LABEL_47:

  return v7;
}

- (void)_drawPrintItem:(id)a3 toContext:(CGContext *)a4 printAllPages:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(UIPrintInteractionController *)self _convertToPrintableItem:a3];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIPrintInteractionController *)self _addPDFWithData:v8 toContext:a4 addAllPages:v5];
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    id v9 = v8;
    id v10 = [v9 CIImage];

    if (v10)
    {
      uint64_t v11 = ConvertCIBasedImage(v9);

      id v9 = (id)v11;
    }
    id v12 = v9;
    if (![v12 CGImage])
    {
LABEL_24:

      goto LABEL_25;
    }
    [v12 size];
    double v14 = v13;
    double v16 = v15;
    printInfo = self->_printInfo;
    if (printInfo) {
      uint64_t v18 = [(UIPrintInfo *)printInfo outputType];
    }
    else {
      uint64_t v18 = 1;
    }
    printPaper = self->_printPaper;
    if (printPaper)
    {
      uint64_t v20 = printPaper;
    }
    else
    {
      uint64_t v20 = +[UIPrintPaper _defaultPaperForOutputType:v18];
    }
    double v21 = v20;
    double v22 = [(UIPrintPaper *)v20 _pkPaper];
    if ([v22 isRoll] && !self->_printingItem)
    {
      NSUInteger v35 = [(NSArray *)self->_printingItems count];

      if (v35 < 2) {
        goto LABEL_17;
      }
      double v22 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, [(UIPrintInfo *)self->_printInfo duplex], v18, v14, v16);
      if (v22)
      {
        uint64_t v36 = +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v22, v14, v16);

        double v21 = (void *)v36;
      }
    }

LABEL_17:
    [v21 paperSize];
    double v24 = v23;
    [v21 paperSize];
    if ((v24 <= v25 || v14 >= v16)
      && (([v21 paperSize], double v27 = v26, objc_msgSend(v21, "paperSize"), v27 >= v28) || v14 <= v16))
    {
      [v21 paperSize];
      uint64_t v31 = v30;
      [v21 paperSize];
      v37[0] = 0;
      v37[1] = 0;
      v37[2] = v31;
      v37[3] = v32;
      double v33 = (void *)MEMORY[0x1E4F1C9E8];
      double v34 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v37 length:32];
      CFDictionaryRef v29 = [v33 dictionaryWithObject:v34 forKey:*MEMORY[0x1E4F1DDE0]];
    }
    else
    {
      [v21 paperSize];
      CFDictionaryRef v29 = 0;
    }
    CGPDFContextBeginPage(a4, v29);
    CGContextSaveGState(a4);
    [v12 imageOrientation];
    [v21 printableRect];
    PKDrawImageToSheet();
    CGContextRestoreGState(a4);
    CGPDFContextEndPage(a4);

    goto LABEL_24;
  }
LABEL_25:
}

- (void)_addPDFWithData:(id)a3 toContext:(CGContext *)a4 addAllPages:(BOOL)a5
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    if (a4)
    {
      id v10 = v8;
      uint64_t v11 = CGDataProviderCreateWithData(0, (const void *)[v10 bytes], objc_msgSend(v10, "length"), 0);
      if (v11)
      {
        id v12 = v11;
        CGPDFDocumentRef v13 = CGPDFDocumentCreateWithProvider(v11);
        if (v13)
        {
          double v14 = v13;
          uint64_t v15 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
          if (v15)
          {
            double v16 = (void *)v15;
            BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v14);

            if (IsEncrypted)
            {
              id v18 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
              CGPDFDocumentUnlockWithPassword(v14, (const char *)[v18 cStringUsingEncoding:4]);
            }
          }
          size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v14);
          long long v53 = v12;
          long long v54 = v9;
          if (a5)
          {
            uint64_t v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, NumberOfPages);
            v67[0] = v20;
            uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
          }
          else
          {
            uint64_t v20 = [(UIPrintInteractionController *)self activePrintInfo];
            uint64_t v21 = [v20 pageRanges];
          }
          double v22 = (void *)v21;

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          obunint64_t j = v22;
          uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
          if (v57)
          {
            uint64_t v56 = *(void *)v63;
            CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            keCGFloat y = (void *)*MEMORY[0x1E4F1DDE0];
            double v24 = *MEMORY[0x1E4F1DB30];
            double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v63 != v56) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v58 = v26;
                double v27 = *(void **)(*((void *)&v62 + 1) + 8 * v26);
                unint64_t v28 = [v27 rangeValue];
                uint64_t v29 = [v27 rangeValue];
                [v27 rangeValue];
                for (unint64_t i = v30 + v29; v28 < i; unint64_t i = v52 + v51)
                {
                  CGPDFPageRef Page = CGPDFDocumentGetPage(v14, ++v28);
                  if (Page)
                  {
                    double v33 = Page;
                    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
                    double v34 = BoxRect.size.width / BoxRect.size.height;
                    NSUInteger v35 = [(UIPrintInteractionController *)self activePrintInfo];
                    uint64_t v36 = [v35 printPaper];

                    [v36 paperSize];
                    double v38 = v37;
                    [v36 paperSize];
                    double v40 = v38 / v39;
                    *(_OWORD *)bytes = 0u;
                    long long v61 = 0u;
                    BOOL v41 = v34 >= 1.0 || v40 <= 1.0;
                    if (!v41 || (v34 > 1.0 ? (BOOL v42 = v40 < 1.0) : (BOOL v42 = 0), v42))
                    {
                      objc_msgSend(v36, "paperSize", v40);
                      uint64_t v44 = v47;
                      [v36 paperSize];
                    }
                    else
                    {
                      objc_msgSend(v36, "paperSize", v40);
                      uint64_t v44 = v43;
                      [v36 paperSize];
                      uint64_t v46 = v45;
                    }
                    memset(bytes, 0, sizeof(bytes));
                    *(void *)&long long v61 = v44;
                    *((void *)&v61 + 1) = v46;
                    Mutable = CFDictionaryCreateMutable(v23, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                    CFDataRef v49 = CFDataCreate(v23, bytes, 32);
                    CFDictionaryAddValue(Mutable, key, v49);
                    CFRelease(v49);
                    CGPDFContextBeginPage(a4, Mutable);
                    CFRelease(Mutable);
                    CGContextSaveGState(a4);
                    CGContextSetAllowsAntialiasing(a4, 1);
                    CGContextSetShouldAntialias(a4, 1);
                    CGContextSetAllowsFontSmoothing(a4, 0);
                    CGContextSetShouldSmoothFonts(a4, 0);
                    id v50 = [MEMORY[0x1E4FB1618] whiteColor];
                    [v50 CGColor];
                    CGContextSetFontSmoothingBackgroundColor();

                    CGContextSetAllowsFontSubpixelPositioning(a4, 0);
                    CGContextSetShouldSubpixelPositionFonts(a4, 0);
                    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
                    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
                    CGContextSetTextGreekingThreshold();
                    CGContextSetLineWidthThreshold();
                    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
                    drawPDFPageToCGContext(v33, a4, v36, [(UIPrintInfo *)self->_activePrintInfo imagePDFAnnotations], v24, v25);
                    CGContextRestoreGState(a4);
                    CGPDFContextEndPage(a4);
                  }
                  uint64_t v51 = [v27 rangeValue];
                  [v27 rangeValue];
                }
                uint64_t v26 = v58 + 1;
              }
              while (v58 + 1 != v57);
              uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
            }
            while (v57);
          }

          CGPDFDocumentRelease(v14);
          id v12 = v53;
          id v9 = v54;
        }
        CGDataProviderRelease(v12);
      }
    }
  }
}

- (void)_cancelAllPreviewGeneration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = (void *)[(NSMutableSet *)self->_previewStates copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setCancelled:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_printPanelDidPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained printInteractionControllerDidPresentPrinterOptions:self];
  }
}

- (void)_printPanelWillDismissWithAction:(int64_t)a3
{
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    [(UIPrintInteractionController *)self _cancelAllPreviewGeneration];
    uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = (void *)WeakRetained;
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      long long v8 = (void *)WeakRetained;
      printer = self->_printer;
      self->_printer = 0;

      if ([(UIPrintInteractionController *)self _canPreviewContent]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v8 printInteractionControllerDidFinishJob:self];
      }
      uint64_t WeakRetained = [(UIPrintInteractionController *)self setConvertedPrintableItems:0];
      uint64_t v6 = v8;
    }
    if (!self->_supressNotifyDismissed)
    {
      long long v9 = v6;
      uint64_t WeakRetained = objc_opt_respondsToSelector();
      if (WeakRetained) {
        uint64_t WeakRetained = [v9 printInteractionControllerWillDismissPrinterOptions:self];
      }
    }
    MEMORY[0x1F4181820](WeakRetained);
  }
}

- (void)_setPrinterInfoState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_printingProgress) {
    goto LABEL_7;
  }
  if (self->_saveFileURL)
  {
    if (!self->_showPrintingProgress) {
      goto LABEL_7;
    }
    uint64_t v5 = [UIPrintingProgress alloc];
    uint64_t v6 = [(UIPrintInteractionController *)self hostingWindowScene];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__UIPrintInteractionController__setPrinterInfoState___block_invoke_2;
    v13[3] = &unk_1E6DA1408;
    v13[4] = self;
    long long v7 = [(UIPrintingProgress *)v5 initPDFCreationWithHostingWindowScene:v6 cancelHandler:v13];
    printingProgress = self->_printingProgress;
    self->_printingProgress = v7;
  }
  else
  {
    long long v9 = [UIPrintingProgress alloc];
    uint64_t v6 = [(PKPrinter *)self->_printer displayName];
    printingProgress = [(UIPrintInteractionController *)self printPanelViewController];
    long long v10 = [(UIPrintInteractionController *)self hostingWindowScene];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__UIPrintInteractionController__setPrinterInfoState___block_invoke;
    v14[3] = &unk_1E6DA1408;
    v14[4] = self;
    uint64_t v11 = [(UIPrintingProgress *)v9 initWithPrinterName:v6 forceDisplayAsAlert:printingProgress == 0 hostingWindowScene:v10 cancelHandler:v14];
    uint64_t v12 = self->_printingProgress;
    self->_printingProgress = v11;
  }
LABEL_7:
  if (v3 == 1) {
    [(UIPrintInteractionController *)self _startPrinting];
  }
  else {
    [(UIPrintingProgress *)self->_printingProgress setPrinterInfoState:v3];
  }
}

uint64_t __53__UIPrintInteractionController__setPrinterInfoState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPrintJobWithAction:0 error:0];
}

uint64_t __53__UIPrintInteractionController__setPrinterInfoState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPrintJobWithAction:0 error:0];
}

- (void)_printPanelDidDismissWithAction:(int64_t)a3
{
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    [(UIPrintInteractionController *)self setPrintPanelViewController:0];
    [(UIPrintInteractionController *)self setTempPreviewFileURL:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!self->_supressNotifyDismissed && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained printInteractionControllerDidDismissPrinterOptions:self];
    }
    if (a3 == 1 && (printer = self->_printer) != 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __64__UIPrintInteractionController__printPanelDidDismissWithAction___block_invoke;
      v7[3] = &unk_1E6DA1608;
      v7[4] = self;
      [(UIPrintInteractionController *)self _setPrinterInfoState:_UIPrinterInfoGetState(printer, v7)];
    }
    else
    {
      [(UIPrintInteractionController *)self _endPrintJobWithAction:a3 error:0];
    }
  }
}

uint64_t __64__UIPrintInteractionController__printPanelDidDismissWithAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setPrinterInfoState:a2];
}

- (void)_updateCutterBehavior
{
  __assert_rtn("-[UIPrintInteractionController _updateCutterBehavior]", "UIPrintInteractionController.m", 2353, "pkFinishingsNumbers.count == uiCutterBehaviorNumbers.count");
}

- (void)_preparePrintInfo
{
  [(UIPrintInfo *)self->_activePrintInfo _updateWithPrinter:self->_printer];
  if (![(UIPrintInfo *)self->_activePrintInfo staple]
    && ![(UIPrintInfo *)self->_activePrintInfo punch])
  {
    goto LABEL_32;
  }
  uint64_t v3 = (double *)MEMORY[0x1E4F1DB30];
  id printingItem = self->_printingItem;
  if (printingItem)
  {
    id v5 = printingItem;
  }
  else
  {
    if ([(NSArray *)self->_printingItems count] != 1)
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    id v5 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
  }
  uint64_t v6 = v5;
LABEL_8:
  double width = *v3;
  double height = v3[1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFURLRef v9 = v6;
    if ([(__CFURL *)v9 isFileURL])
    {
      if ([(UIPrintInteractionController *)self _canPrintPDFURL:v9])
      {
        CGPDFDocumentRef v10 = CGPDFDocumentCreateWithURL(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
          if (v12)
          {
            CGPDFDocumentRef v13 = (void *)v12;
            BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v11);

            if (IsEncrypted)
            {
              id v15 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
              CGPDFDocumentUnlockWithPassword(v11, (const char *)[v15 cStringUsingEncoding:4]);
            }
          }
          CGPDFPageRef Page = CGPDFDocumentGetPage(v11, 1uLL);
          if (Page)
          {
            CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
            double width = BoxRect.size.width;
            double height = BoxRect.size.height;
          }
          CGPDFDocumentRelease(v11);
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(UIPrintInteractionController *)self _canPrintPDFData:v6])
      {
        id v17 = CGDataProviderCreateWithCFData((CFDataRef)v6);
        if (v17)
        {
          id v18 = v17;
          double v19 = CGPDFDocumentCreateWithProvider(v17);
          CGDataProviderRelease(v18);
          if (v19)
          {
            uint64_t v20 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
            if (v20)
            {
              uint64_t v21 = (void *)v20;
              BOOL v22 = CGPDFDocumentIsEncrypted(v19);

              if (v22)
              {
                id v23 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
                CGPDFDocumentUnlockWithPassword(v19, (const char *)[v23 cStringUsingEncoding:4]);
              }
            }
            double v24 = CGPDFDocumentGetPage(v19, 1uLL);
            if (v24)
            {
              CGRect v47 = CGPDFPageGetBoxRect(v24, kCGPDFCropBox);
              double width = v47.size.width;
              double height = v47.size.height;
            }
            CGPDFDocumentRelease(v19);
          }
        }
      }
    }
  }
  if (height < width) {
    [(UIPrintInfo *)self->_activePrintInfo setOrientation:1];
  }

LABEL_32:
  double v25 = [(UIPrintInfo *)self->_activePrintInfo printerID];
  [(UIPrintInfo *)self->_printInfo setPrinterID:v25];

  [(UIPrintInfo *)self->_printInfo setDuplex:[(UIPrintInfo *)self->_activePrintInfo duplex]];
  uint64_t v26 = [(UIPrintInfo *)self->_activePrintInfo _createPrintSettingsForPrinter:self->_printer];
  printSettings = self->_printSettings;
  self->_printSettings = v26;

  id v28 = [(UIPrintInteractionController *)self _updatePrintPaper];
  uint64_t v29 = [(UIPrintPaper *)self->_paper _pkPaper];
  int v30 = [v29 isRoll];

  if (v30) {
    [(UIPrintInteractionController *)self _updateCutterBehavior];
  }
  uint64_t v31 = [(UIPrintPaper *)self->_printPaper _pkPaper];
  [(PKPrintSettings *)self->_printSettings setPaper:v31];

  UIPrintInfoDuplex v32 = [(UIPrintInfo *)self->_activePrintInfo duplex];
  double v33 = (id *)MEMORY[0x1E4F93338];
  double v34 = (id *)MEMORY[0x1E4F93328];
  if (v32 != UIPrintInfoDuplexShortEdge) {
    double v34 = (id *)MEMORY[0x1E4F93330];
  }
  if (v32 != UIPrintInfoDuplexLongEdge) {
    double v33 = v34;
  }
  id v44 = *v33;
  NSUInteger v35 = (void *)MEMORY[0x1E4F932E0];
  printer = self->_printer;
  double v37 = [(PKPrintSettings *)self->_printSettings paper];
  [v37 paperSize];
  objc_msgSend(v35, "addLastUsedPrinter:duplexMode:lastUsedSize:forPhoto:", printer, v44, (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1, v38, v39);

  double v40 = (void *)MEMORY[0x1E4F932E0];
  BOOL v41 = self->_printer;
  BOOL v42 = [(PKPrinter *)v41 displayName];
  uint64_t v43 = [(PKPrinter *)self->_printer location];
  [v40 addPrinterToiCloud:v41 displayName:v42 location:v43];
}

- (id)_paperForPDFItem:(id)a3 withDuplexMode:(int64_t)a4
{
  id v6 = a3;
  if (!self->_printer)
  {
    CFURLRef v9 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIPrintInteractionController *)self _printablePDFURLSize:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v10 = *MEMORY[0x1E4F1DB30];
      double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_9;
    }
    [(UIPrintInteractionController *)self _printablePDFDataSize:v6];
  }
  double v10 = v7;
  double v11 = v8;
LABEL_9:
  CFURLRef v9 = 0;
  if (v10 > 0.0 && v11 > 0.0)
  {
    uint64_t v12 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, a4, [(UIPrintInfo *)self->_activePrintInfo outputType], v10, v11);
    if (v12)
    {
      CFURLRef v9 = +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v12, v10, v11);
    }
    else
    {
      CFURLRef v9 = 0;
    }
  }
LABEL_15:

  return v9;
}

- (id)_paperForContentType:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[UIPrintPaper _defaultPaperListForOutputType:a3];
  if ([(PKPrinter *)self->_printer knowsReadyPaperList])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        printer = self->_printer;
        uint64_t v12 = objc_msgSend(v10, "_pkPaper", (void)v15);
        LOBYTE(printer) = [(PKPrinter *)printer isPaperReady:v12];

        if (printer) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v10;

      if (v13) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
  }
  objc_msgSend(v4, "objectAtIndex:", 0, (void)v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v13;
}

- (double)_getCutLengthFromDelegateForPaper:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  if (pthread_main_np() == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained printInteractionController:self cutLengthForPaper:v4];
    *((void *)v13 + 3) = v6;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__UIPrintInteractionController__getCutLengthFromDelegateForPaper___block_invoke;
    block[3] = &unk_1E6DA16A8;
    double v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  double v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__UIPrintInteractionController__getCutLengthFromDelegateForPaper___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  [WeakRetained printInteractionController:a1[4] cutLengthForPaper:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v2;
}

- (id)_getChosenPaperFromDelegateForPaperList:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (pthread_main_np() == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = [WeakRetained printInteractionController:self choosePaper:v4];
    double v7 = (void *)v14[5];
    void v14[5] = v6;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__UIPrintInteractionController__getChosenPaperFromDelegateForPaperList___block_invoke;
    block[3] = &unk_1E6DA16A8;
    uint64_t v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __72__UIPrintInteractionController__getChosenPaperFromDelegateForPaperList___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  uint64_t v2 = [WeakRetained printInteractionController:a1[4] choosePaper:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_updatePrintPaper
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  p_printPaper = &self->_printPaper;
  printPaper = self->_printPaper;
  self->_printPaper = 0;

  id WeakRetained = objc_loadWeakRetained((id *)p_printPaper - 1);
  if (*(p_printPaper - 5))
  {
    if (objc_opt_respondsToSelector())
    {
      printer = self->_printer;
      UIPrintInfoDuplex v7 = [(UIPrintInfo *)self->_activePrintInfo duplex];
      UIPrintInfoOutputType v8 = [(UIPrintInfo *)self->_activePrintInfo outputType];
      [(UIPrintInteractionController *)self _printItemContentSize];
      uint64_t v9 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v7, v8);
      id v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
      id v11 = [v9 filteredArrayUsingPredicate:v10];
      uint64_t v12 = v11;
      if (v11 && [v11 count])
      {
        long long v83 = v10;
        long long v84 = v9;
        id v85 = WeakRetained;
        if (objc_opt_respondsToSelector())
        {
          long long v93 = 0uLL;
          long long v94 = 0uLL;
          long long v91 = 0uLL;
          long long v92 = 0uLL;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v91 objects:v96 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v92;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v92 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                double v19 = objc_msgSend(v18, "_pkPaper", v83, v84, v85);
                [(UIPrintInteractionController *)self _getCutLengthFromDelegateForPaper:v18];
                uint64_t v20 = objc_msgSend(v19, "cutToLength:");
                [v18 _updatePKPaper:v20];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v91 objects:v96 count:16];
            }
            while (v15);
          }
        }
        else
        {
          long long v89 = 0uLL;
          long long v90 = 0uLL;
          long long v87 = 0uLL;
          long long v88 = 0uLL;
          id v21 = v12;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v87 objects:v95 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v88;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v88 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v87 + 1) + 8 * j);
                double v27 = objc_msgSend(v26, "_pkPaper", v83, v84, v85);
                [v26 paperSize];
                id v28 = objc_msgSend(v27, "cutToLength:");
                [v26 _updatePKPaper:v28];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v87 objects:v95 count:16];
            }
            while (v23);
          }
        }

        uint64_t v9 = v84;
        id WeakRetained = v85;
        id v10 = v83;
      }
      -[UIPrintInteractionController _getChosenPaperFromDelegateForPaperList:](self, "_getChosenPaperFromDelegateForPaperList:", v9, v83, v84, v85);
      uint64_t v29 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
      int v30 = self->_printPaper;
      self->_printPaper = v29;
    }
    else if (self->_printer && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (self->_paper)
      {
        objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
      }
      else
      {
        uint64_t v31 = self->_printer;
        UIPrintInfoDuplex v32 = [(UIPrintInfo *)self->_activePrintInfo duplex];
        UIPrintInfoOutputType v33 = [(UIPrintInfo *)self->_activePrintInfo outputType];
        [(UIPrintInteractionController *)self _printItemContentSize];
        +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v31, v32, v33);
      double v34 = };
      NSUInteger v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_132];
      uint64_t v36 = [v34 filteredArrayUsingPredicate:v35];
      double v37 = v36;
      if (v36 && [v36 count])
      {
        double v38 = [v37 objectAtIndex:0];
        double v39 = self->_printPaper;
        self->_printPaper = v38;

        double v40 = self->_printPaper;
        BOOL v41 = [(UIPrintPaper *)v40 _pkPaper];
        [(UIPrintInteractionController *)self _getCutLengthFromDelegateForPaper:self->_printPaper];
        BOOL v42 = objc_msgSend(v41, "cutToLength:");
        [(UIPrintPaper *)v40 _updatePKPaper:v42];
      }
    }
  }
  if (!*p_printPaper)
  {
    paper = self->_paper;
    if (!paper || (objc_storeStrong((id *)p_printPaper, paper), !*p_printPaper))
    {
      id printingItem = self->_printingItem;
      if (!printingItem
        || ([(UIPrintInteractionController *)self _paperForPDFItem:printingItem withDuplexMode:[(UIPrintInfo *)self->_activePrintInfo duplex]], uint64_t v58 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue(), v59 = self->_printPaper, self->_printPaper = v58, v59, !self->_printPaper))
      {
        double v60 = [(UIPrintInteractionController *)self _paperForContentType:[(UIPrintInfo *)self->_activePrintInfo outputType]];
        long long v61 = self->_printPaper;
        self->_printPaper = v60;
      }
    }
  }
  if (self->_printer)
  {
    char v86 = 0;
    uint64_t v43 = [(UIPrintPaper *)*p_printPaper _pkPaper];
    [v43 imageableAreaRect];
    BOOL v52 = v47 == 0.0
       && v44 == 0.0
       && (v48 = v45, double v49 = v46, [v43 paperSize], v50 == v48)
       && ([v43 paperSize], v51 == v49)
       || ([(UIPrintInfo *)self->_activePrintInfo outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1;
    long long v53 = self->_printer;
    UIPrintInfoDuplex v54 = [(UIPrintInfo *)self->_activePrintInfo duplex];
    if (v54 == UIPrintInfoDuplexLongEdge)
    {
      long long v55 = (void *)MEMORY[0x1E4F93338];
    }
    else
    {
      long long v55 = (void *)MEMORY[0x1E4F93328];
      if (v54 != UIPrintInfoDuplexShortEdge) {
        long long v55 = (void *)MEMORY[0x1E4F93330];
      }
    }
    long long v62 = [(PKPrinter *)v53 matchedPaper:v43 preferBorderless:v52 withDuplexMode:*v55 didMatch:&v86];
    if (!v86
      || [(PKPrinter *)self->_printer knowsReadyPaperList]
      && ([(PKPrinter *)self->_printer isPaperReady:v62] & 1) == 0)
    {
      long long v63 = self->_printer;
      UIPrintInfoDuplex v64 = [(UIPrintInfo *)self->_activePrintInfo duplex];
      UIPrintInfoOutputType v65 = [(UIPrintInfo *)self->_activePrintInfo outputType];
      [(UIPrintInteractionController *)self _printItemContentSize];
      v66 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v63, v64, v65);
      [v43 paperSize];
      double v68 = v67;
      [v43 paperSize];
      v70 = +[UIPrintPaper bestPaperForPageSize:andContentType:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:andContentType:withPapersFromArray:", [(UIPrintInfo *)self->_activePrintInfo outputType], v66, v68, v69);
      long long v71 = v70;
      if (v70)
      {
        uint64_t v72 = [v70 _pkPaper];

        long long v62 = (void *)v72;
      }
    }
    if [v62 isRoll] && (objc_opt_respondsToSelector())
    {
      [(UIPrintInteractionController *)self _getCutLengthFromDelegateForPaper:self->_printPaper];
      double v74 = v73;
      unint64_t v75 = [v62 minCutLength];
      if (v74 < (double)v75) {
        double v74 = (double)v75;
      }
      double v76 = (double)(unint64_t)[v62 maxCutLength];
      if (v74 < v76) {
        double v76 = v74;
      }
      uint64_t v77 = [v62 cutToLength:v76];

      long long v62 = (void *)v77;
    }
    [(UIPrintPaper *)*p_printPaper _updatePKPaper:v62];
  }
  if ([(UIPrintInfo *)self->_activePrintInfo orientation] == UIPrintInfoOrientationLandscape)
  {
    uint64_t v78 = 1;
    if ([(PKPrinter *)self->_printer hasPrintInfoSupported])
    {
      long long v79 = [(PKPrinter *)self->_printer printInfoSupported];
      long long v80 = [v79 objectForKey:*MEMORY[0x1E4F933F0]];

      LODWORD(v79) = [v80 containsObject:*MEMORY[0x1E4F93408]];
      if (v79) {
        uint64_t v78 = 2;
      }
      else {
        uint64_t v78 = 1;
      }
    }
  }
  else
  {
    uint64_t v78 = 0;
  }
  [(UIPrintPaper *)self->_printPaper _setPaperOrientation:v78];
  [(UIPrintInfo *)self->_activePrintInfo scalingFactor];
  -[UIPrintPaper setScalingFactor:](self->_printPaper, "setScalingFactor:");
  long long v81 = self->_printPaper;

  return v81;
}

uint64_t __49__UIPrintInteractionController__updatePrintPaper__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _pkPaper];
  uint64_t v3 = [v2 isRoll];

  return v3;
}

uint64_t __49__UIPrintInteractionController__updatePrintPaper__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _pkPaper];
  uint64_t v3 = [v2 isRoll];

  return v3;
}

- (void)_startPrinting
{
  if (self->_backgroundTaskIdentifier == *MEMORY[0x1E4FB2748])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__UIPrintInteractionController__startPrinting__block_invoke;
    v5[3] = &unk_1E6DA1408;
    v5[4] = self;
    self->_backgroundTaskIdentifier = [v3 _beginBackgroundTaskWithExpirationHandler:v5];
  }
  [(UIPrintInteractionController *)self _cancelAllPreviewGeneration];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__UIPrintInteractionController__startPrinting__block_invoke_2;
  v4[3] = &unk_1E6DA1408;
  v4[4] = self;
  [(UIPrintInteractionController *)self _cancelPreviewQueue:1 completionHandler:v4];
}

uint64_t __46__UIPrintInteractionController__startPrinting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPrintJobWithAction:0 error:0];
}

void __46__UIPrintInteractionController__startPrinting__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _preparePrintInfo];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained printInteractionControllerWillStartJob:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _updateRendererWithQuality:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  int v5 = [*(id *)(a1 + 32) needRedrawWithNUp];
  uint64_t v6 = *(id **)(a1 + 32);
  if (v5)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__UIPrintInteractionController__startPrinting__block_invoke_3;
    v29[3] = &unk_1E6DA16F0;
    v29[4] = v6;
    [v6 _generatePDFWithNupForPrintingCompletion:v29];
    goto LABEL_19;
  }
  [v6[30] setPage:-2 ofPage:0];
  if (([*(id *)(*(void *)(a1 + 32) + 256) outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    [*(id *)(*(void *)(a1 + 32) + 248) setObject:*MEMORY[0x1E4F93488] forKey:*MEMORY[0x1E4F93490]];
  }
  UIPrintInfoDuplex v7 = *(id **)(a1 + 32);
  if (v7[11])
  {
    if ([v7[11] count]) {
      goto LABEL_11;
    }
    UIPrintInfoDuplex v7 = *(id **)(a1 + 32);
  }
  [v7 _updatePageCount];
LABEL_11:
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [*(id *)(v8 + 88) objectAtIndex:0];
  *(void *)(v8 + 312) = [v9 rangeValue];
  *(void *)(v8 + 320) = v10;

  *(void *)(*(void *)(a1 + 32) + 216) = *(void *)(*(void *)(a1 + 32) + 312);
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 144);
  if (v12)
  {
    objc_msgSend(v12, "prepareForDrawingPages:", *(void *)(v11 + 312), *(void *)(v11 + 320));
  }
  else if (!*(void *)(v11 + 152))
  {
    if (*(void *)(v11 + 160))
    {
      *(void *)(v11 + 216) = -1;
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(v17 + 248);
      int v19 = [*(id *)(v17 + 256) scaleUp];
      uint64_t v20 = (void *)MEMORY[0x1E4F93448];
      if (!v19) {
        uint64_t v20 = (void *)MEMORY[0x1E4F93438];
      }
      [v18 setObject:*v20 forKey:*MEMORY[0x1E4F93440]];
      [*(id *)(*(void *)(a1 + 32) + 248) removeObjectForKey:*MEMORY[0x1E4F933F0]];
      id v21 = *(void **)(*(void *)(a1 + 32) + 88);
      if (v21)
      {
        if ([v21 count])
        {
          uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 88) firstObject];
          [v22 rangeValue];
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 176);

          if (v24 != v25) {
            [*(id *)(*(void *)(a1 + 32) + 248) setObject:*(void *)(*(void *)(a1 + 32) + 88) forKey:*MEMORY[0x1E4F93430]];
          }
        }
      }
    }
    else if (*(void *)(v11 + 168))
    {
      uint64_t v26 = *(void **)(v11 + 248);
      int v27 = [*(id *)(v11 + 256) scaleUp];
      id v28 = (void *)MEMORY[0x1E4F93448];
      if (!v27) {
        id v28 = (void *)MEMORY[0x1E4F93438];
      }
      [v26 setObject:*v28 forKey:*MEMORY[0x1E4F93440]];
      [*(id *)(*(void *)(a1 + 32) + 248) removeObjectForKey:*MEMORY[0x1E4F933F0]];
      uint64_t v13 = -1;
      goto LABEL_15;
    }
  }
  uint64_t v13 = 1;
LABEL_15:
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 192);
  if (v15 <= 0) {
    uint64_t v15 = *(void *)(v14 + 176);
  }
  [*(id *)(v14 + 240) setPage:v13 ofPage:v15];
  uint64_t v16 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v16 + 70))
  {
    [*(id *)(v16 + 240) nextPrintDelay];
    objc_msgSend((id)v16, "_printPageWithDelay:");
  }
LABEL_19:
}

void __46__UIPrintInteractionController__startPrinting__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    [*(id *)(a1 + 32) _printPageWithDelay:0.0];
    id v4 = v5;
  }
}

- (BOOL)_canPrintPDFData:(id)a3
{
  activePrintInfo = self->_activePrintInfo;
  id v4 = a3;
  id v5 = [(UIPrintInfo *)activePrintInfo pdfPassword];
  BOOL v6 = IsPrintablePDFData(v4, 1, v5);

  return v6;
}

- (CGSize)_printablePDFDataSize:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  double MaxCropSize = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (HasValidPDFHeader(v4))
  {
    UIPrintInfoDuplex v7 = CGDataProviderCreateWithCFData(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = CGPDFDocumentCreateWithProvider(v7);
      CGDataProviderRelease(v8);
      if (v9)
      {
        uint64_t v10 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v9);

          if (IsEncrypted)
          {
            id v13 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
            CGPDFDocumentUnlockWithPassword(v9, (const char *)[v13 cStringUsingEncoding:4]);
          }
        }
        double MaxCropSize = GetMaxCropSize(v9);
        double v6 = v14;
      }
      CGPDFDocumentRelease(v9);
    }
  }

  double v15 = MaxCropSize;
  double v16 = v6;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)_canPrintPDFURL:(id)a3
{
  id v4 = a3;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    id v5 = [(UIPrintInteractionController *)self activePrintInfo];
    double v6 = [v5 pdfPassword];
    BOOL v7 = IsPrintablePDFURL(v4, 1, v6);
  }
  else
  {
    BOOL v7 = IsPrintablePDFURL(v4, 1, 0);
  }

  return v7;
}

- (BOOL)_canShowPreview
{
  uint64_t v2 = self;
  v28[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v28[0] = self->_printingItem;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  }
  else
  {
    uint64_t v3 = self->_printingItems;
  }
  id v4 = v3;
  if (v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      unint64_t v9 = 0x1E4FB1000uLL;
      id v21 = v4;
      uint64_t v22 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && IsAssetURL(v11)) {
            goto LABEL_34;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_34;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isFileURL])
          {
            if ([(UIPrintInteractionController *)v2 printStateActive])
            {
              [(UIPrintInteractionController *)v2 activePrintInfo];
              unint64_t v12 = v9;
              v14 = id v13 = v2;
              double v15 = [v14 pdfPassword];
              BOOL v16 = IsPrintablePDFURL(v11, 0, v15);

              uint64_t v2 = v13;
              unint64_t v9 = v12;
              id v5 = v22;
              if (v16) {
                goto LABEL_34;
              }
            }
            else if (IsPrintablePDFURL(v11, 0, 0))
            {
              goto LABEL_34;
            }
            CGImageSourceRef v17 = CGImageSourceCreateWithURL((CFURLRef)v11, 0);
            if (v17)
            {
              CFRelease(v17);
LABEL_34:

              char v18 = 1;
              id v4 = v21;
              goto LABEL_35;
            }
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        id v4 = v21;
        if (v7) {
          continue;
        }
        break;
      }
    }

    goto LABEL_32;
  }
  if (!dyld_program_sdk_at_least())
  {
    printFormatter = v2->_printFormatter;
    if (!printFormatter)
    {
LABEL_32:
      char v18 = 0;
      goto LABEL_35;
    }
    if (([(UIPrintFormatter *)printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)v2->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)v2->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)v2->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      char v18 = [(UIPrintFormatter *)v2->_printFormatter isMemberOfClass:objc_opt_class()];
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  if (v2->_printPageRenderer)
  {
LABEL_31:
    char v18 = 1;
    goto LABEL_35;
  }
  char v18 = v2->_printFormatter != 0;
LABEL_35:

  return v18;
}

- (BOOL)_canPreviewContent
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self->_printingItem)
  {
    v20[0] = self->_printingItem;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
  else
  {
    uint64_t v3 = self->_printingItems;
  }
  id v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && IsAssetURL(v10)) {
            goto LABEL_21;
          }
          uint64_t v11 = -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", v10, (void)v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {

LABEL_21:
            goto LABEL_22;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    goto LABEL_29;
  }
  if (!dyld_program_sdk_at_least())
  {
    printFormatter = self->_printFormatter;
    if (!printFormatter)
    {
LABEL_29:
      char v12 = 0;
      goto LABEL_30;
    }
    if (([(UIPrintFormatter *)printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)self->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)self->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([(UIPrintFormatter *)self->_printFormatter isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      char v12 = [(UIPrintFormatter *)self->_printFormatter isMemberOfClass:objc_opt_class()];
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (self->_printPageRenderer)
  {
LABEL_22:
    char v12 = 1;
    goto LABEL_30;
  }
  char v12 = self->_printFormatter != 0;
LABEL_30:

  return v12;
}

- (CGSize)_printablePDFURLSize:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  id v5 = (double *)MEMORY[0x1E4F1DB30];
  uint64_t v6 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v4 error:0];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 readDataUpToLength:4096 error:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  double MaxCropSize = *v5;
  double v10 = v5[1];
  if (HasValidPDFHeader(v8))
  {
    uint64_t v11 = CGDataProviderCreateWithURL(v4);
    if (v11)
    {
      char v12 = v11;
      id v13 = CGPDFDocumentCreateWithProvider(v11);
      CGDataProviderRelease(v12);
      if (v13)
      {
        uint64_t v14 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
        if (v14)
        {
          long long v15 = (void *)v14;
          BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v13);

          if (IsEncrypted)
          {
            id v17 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
            CGPDFDocumentUnlockWithPassword(v13, (const char *)[v17 cStringUsingEncoding:4]);
          }
        }
        double MaxCropSize = GetMaxCropSize(v13);
        double v10 = v18;
      }
      CGPDFDocumentRelease(v13);
    }
  }

  double v19 = MaxCropSize;
  double v20 = v10;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)_ensurePDFIsUnlockedFirstAttempt:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if ([(NSArray *)self->_printingItems count] == 1)
  {
    id v7 = [(NSArray *)self->_printingItems objectAtIndexedSubscript:0];
  }
  else
  {
    id v7 = self->_printingItem;
  }
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v10 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v8 error:0];
      uint64_t v11 = v10;
      if (v10)
      {
        id v9 = [v10 readDataUpToLength:4096 error:0];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  if (!HasValidPDFHeader(v9)
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (char v12 = CGDataProviderCreateWithURL((CFURLRef)v8))
      : (char v12 = CGDataProviderCreateWithCFData((CFDataRef)v8)),
        (id v13 = v12) == 0 || (v14 = CGPDFDocumentCreateWithProvider(v12), CGDataProviderRelease(v13), !v14)))
  {
LABEL_21:

LABEL_22:
    v6[2](v6, 0);
    goto LABEL_23;
  }
  if (CGPDFDocumentAllowsPrinting(v14))
  {
    CGPDFDocumentRelease(v14);
    goto LABEL_21;
  }
  double v44 = v14;
  uint64_t v15 = [(UIPrintInteractionController *)self hostingWindowScene];
  if (!v15)
  {
    long long v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v15 = [v16 _findUISceneForLegacyInterfaceOrientation];
  }
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v15];
  objc_storeStrong((id *)&self->_alertWindow, v17);
  [v17 setOpaque:0];
  double v18 = [MEMORY[0x1E4FB1618] clearColor];
  [v17 setBackgroundColor:v18];

  [v17 setWindowLevel:*MEMORY[0x1E4FB3118]];
  id v41 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  -[UIWindow setRootViewController:](self->_alertWindow, "setRootViewController:");
  [(UIWindow *)self->_alertWindow makeKeyAndVisible];
  double v19 = (void *)MEMORY[0x1E4FB1418];
  double v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v21 = v20;
  BOOL v42 = v17;
  uint64_t v43 = (void *)v15;
  if (v4) {
    uint64_t v22 = @"Without the proper password, you do not have permission to print this document.";
  }
  else {
    uint64_t v22 = @"Incorrect password for document.";
  }
  long long v23 = [v20 localizedStringForKey:v22 value:v22 table:@"Localizable"];
  long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v25 = [v24 localizedStringForKey:@"Enter the password to unlock printing." value:@"Enter the password to unlock printing." table:@"Localizable"];
  double v40 = [v19 alertControllerWithTitle:v23 message:v25 preferredStyle:1];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke;
  v56[3] = &unk_1E6DA1408;
  v56[4] = self;
  long long v26 = (void *)MEMORY[0x1E4E4C3C0](v56);
  double v39 = (void *)MEMORY[0x1E4FB1410];
  int v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v28 = [v27 localizedStringForKey:@"PRINT_INTERACTION_CANCEL_BUTTON" value:@"Cancel" table:@"Localizable"];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_2;
  v51[3] = &unk_1E6DA1718;
  long long v55 = v44;
  id v29 = v40;
  id v52 = v29;
  id v30 = v26;
  id v53 = v30;
  uint64_t v31 = v6;
  id v54 = v31;
  UIPrintInfoDuplex v32 = [v39 actionWithTitle:v28 style:1 handler:v51];
  [v29 addAction:v32];

  UIPrintInfoOutputType v33 = (void *)MEMORY[0x1E4FB1410];
  double v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  NSUInteger v35 = [v34 localizedStringForKey:@"PRINT_INTERACTION_OK_BUTTON" value:@"OK" table:@"Localizable"];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_3;
  v45[3] = &unk_1E6DA1740;
  id v46 = v29;
  double v47 = self;
  id v48 = v30;
  double v50 = v44;
  double v49 = v31;
  id v36 = v30;
  id v37 = v29;
  double v38 = [v33 actionWithTitle:v35 style:0 handler:v45];
  [v37 addAction:v38];

  [v37 addTextFieldWithConfigurationHandler:&__block_literal_global_157];
  [v41 presentViewController:v37 animated:0 completion:0];

LABEL_23:
}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setHidden:1];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

uint64_t __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_2(uint64_t a1)
{
  CGPDFDocumentRelease(*(CGPDFDocumentRef *)(a1 + 56));
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) textFields];
  id v7 = [v2 firstObject];

  uint64_t v3 = [v7 text];
  [*(id *)(a1 + 40) setPdfPassword:v3];

  BOOL v4 = [v7 text];
  [*(id *)(*(void *)(a1 + 40) + 256) setPdfPassword:v4];

  id v5 = *(CGPDFDocument **)(a1 + 64);
  id v6 = [v7 text];
  CGPDFDocumentUnlockWithPassword(v5, (const char *)[v6 cStringUsingEncoding:4]);

  LOBYTE(v5) = CGPDFDocumentAllowsPrinting(*(CGPDFDocumentRef *)(a1 + 64));
  CGPDFDocumentRelease(*(CGPDFDocumentRef *)(a1 + 64));
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    [*(id *)(a1 + 40) _ensurePDFIsUnlockedFirstAttempt:0 completionHandler:*(void *)(a1 + 56)];
  }
}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a2;
  uint64_t v3 = [v2 bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"Password" value:@"Password" table:@"Localizable"];
  [v5 setPlaceholder:v4];

  [v5 setSecureTextEntry:1];
}

- (BOOL)_printingItemIsReallyTallPDF
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIPrintInteractionController *)self _printablePDFURLSize:self->_printingItem];
    LOBYTE(v5) = 0;
    if (v4 <= 0.0) {
      return (char)v5;
    }
    double v6 = v3;
    if (v3 <= 0.0) {
      return (char)v5;
    }
    double v7 = v4;
    uint64_t v8 = CGDataProviderCreateWithURL((CFURLRef)self->_printingItem);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    [(UIPrintInteractionController *)self _printablePDFDataSize:self->_printingItem];
    LOBYTE(v5) = 0;
    if (v10 <= 0.0) {
      return (char)v5;
    }
    double v6 = v9;
    if (v9 <= 0.0) {
      return (char)v5;
    }
    double v7 = v10;
    uint64_t v8 = CGDataProviderCreateWithCFData((CFDataRef)self->_printingItem);
  }
  id v5 = v8;
  if (!v8) {
    return (char)v5;
  }
  uint64_t v11 = CGPDFDocumentCreateWithProvider(v8);
  CGDataProviderRelease(v5);
  if (!v11)
  {
LABEL_18:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  uint64_t v12 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
  if (v12)
  {
    id v13 = (void *)v12;
    BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v11);

    if (IsEncrypted)
    {
      id v15 = [(UIPrintInfo *)self->_activePrintInfo pdfPassword];
      CGPDFDocumentUnlockWithPassword(v11, (const char *)[v15 cStringUsingEncoding:4]);
    }
  }
  LOBYTE(v5) = 0;
  if (CGPDFDocumentGetNumberOfPages(v11) == 1 && v7 / v6 > 3.0)
  {
    Info = CGPDFDocumentGetInfo(v11);
    if (Info)
    {
      CGPDFStringRef value = 0;
      CGPDFDictionaryGetString(Info, "Keywords", &value);
      id v17 = (__CFString *)CGPDFStringCopyTextString(value);
      LOBYTE(v5) = [(__CFString *)v17 containsString:@"com.apple.MarkupPDF"];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  CGPDFDocumentRelease(v11);
  return (char)v5;
}

- (void)_printPageWithDelay:(double)a3
{
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__UIPrintInteractionController__printPageWithDelay___block_invoke;
    block[3] = &unk_1E6DA17B0;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__UIPrintInteractionController__printPageWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained printStateActive])
  {
    double v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__UIPrintInteractionController__printPageWithDelay___block_invoke_2;
    v5[3] = &unk_1E6DA1788;
    objc_copyWeak(&v6, v2);
    [v4 addOperationWithBlock:v5];
    objc_destroyWeak(&v6);
  }
}

void __52__UIPrintInteractionController__printPageWithDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained printStateActive]) {
    [WeakRetained _printPage];
  }
}

- (void)_printPage
{
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    double v3 = [(UIPrintInteractionController *)self rendererToUse];
    nupFileURL = self->_nupFileURL;
    if (v3)
    {
      if (!nupFileURL)
      {
        dispatch_time_t v5 = [(UIPrintInteractionController *)self _printPageWithRenderer:v3];
        [(UIPrintInteractionController *)self _completePrintPageWithError:v5];
LABEL_9:

        return;
      }
    }
    else if (!nupFileURL)
    {
      nupFileURL = self->_printingItem;
      if (!nupFileURL)
      {
        id v6 = [(NSArray *)self->_printingItems objectAtIndex:self->_currentPage];
        goto LABEL_8;
      }
    }
    id v6 = nupFileURL;
LABEL_8:
    dispatch_time_t v5 = v6;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__UIPrintInteractionController__printPage__block_invoke;
    v7[3] = &unk_1E6DA17D8;
    objc_copyWeak(&v8, &location);
    [(UIPrintInteractionController *)self _printItemAsync:v5 completionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
}

void __42__UIPrintInteractionController__printPage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _completePrintPageWithError:v3];
}

- (void)_completePrintPageWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unint64_t)a3;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    if (self->_printingItem || self->_printingItems || self->_nupFileURL) {
      int64_t pagesDrawn = -1;
    }
    else {
      int64_t pagesDrawn = self->_pagesDrawn;
    }
    currentCGPDFPageRef Page = self->_currentPage;
    if (currentPage != -1)
    {
      if (currentPage == self->_currentRange.location + self->_currentRange.length - 1)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v7 = self->_pageRanges;
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if (objc_msgSend(v12, "rangeValue", (void)v23) == self->_currentRange.location
                && v13 == self->_currentRange.length)
              {
                unint64_t v15 = [(NSArray *)self->_pageRanges count];
                if (v15 > [(NSArray *)self->_pageRanges indexOfObject:v12] + 1)
                {
                  long long v16 = [(NSArray *)self->_pageRanges objectAtIndexedSubscript:[(NSArray *)self->_pageRanges indexOfObject:v12] + 1];
                  self->_currentRange.NSUInteger location = [v16 rangeValue];
                  self->_currentRange.length = v17;

                  self->_currentCGPDFPageRef Page = (int)(self->_currentRange.location - 1);
                  printPageRenderer = self->_printPageRenderer;
                  if (printPageRenderer) {
                    -[UIPrintPageRenderer prepareForDrawingPages:](printPageRenderer, "prepareForDrawingPages:");
                  }
                  goto LABEL_24;
                }
              }
            }
            uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_24:
      }
      currentCGPDFPageRef Page = self->_currentPage + 1;
      self->_currentCGPDFPageRef Page = currentPage;
    }
    if (v4 | (unint64_t)self->_nupFileURL
      || (self->_pageCount & 0x8000000000000000) == 0
      && ((location = self->_currentRange.location, BOOL v20 = currentPage >= location, v21 = currentPage - location, !v20)
       || v21 >= self->_currentRange.length)
      || currentPage == -1)
    {
      -[UIPrintingProgress setPage:ofPage:](self->_printingProgress, "setPage:ofPage:", -1, 0, (void)v23);
      [(UIPrintInteractionController *)self _endPrintJobWithAction:1 error:v4];
    }
    else
    {
      if (self->_pageCountWithRanges <= 0) {
        int64_t pageCount = self->_pageCount;
      }
      else {
        int64_t pageCount = self->_pageCountWithRanges;
      }
      -[UIPrintingProgress setPage:ofPage:](self->_printingProgress, "setPage:ofPage:", pagesDrawn, pageCount, (void)v23);
      if (!self->_manualPrintPageEnabled)
      {
        [(UIPrintingProgress *)self->_printingProgress nextPrintDelay];
        -[UIPrintInteractionController _printPageWithDelay:](self, "_printPageWithDelay:");
      }
    }
  }
}

- (void)_printItemAsync:(id)a3 completionHandler:(id)a4
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    uint64_t v92 = 0;
    long long v93 = &v92;
    uint64_t v94 = 0x3032000000;
    v95 = __Block_byref_object_copy_;
    v96 = __Block_byref_object_dispose_;
    id v97 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      uint64_t v9 = 0;
      id v81 = 0;
      id v10 = 0;
      uint64_t v11 = 0;
      if (!v8) {
        goto LABEL_17;
      }
LABEL_46:
      if (![(PKPrinter *)self->_printer startJob:self->_printSettings ofType:v11])
      {
        UIPrintInfoDuplex v32 = self->_printPaper;
        UIPrintInfoOutputType v33 = [(UIPrintPaper *)v32 _pkPaper];
        if ([v33 isRoll] && !self->_printingItem)
        {
          BOOL v58 = [(NSArray *)self->_printingItems count] > 1;

          if (!v58) {
            goto LABEL_50;
          }
          printer = self->_printer;
          UIPrintInfoDuplex v59 = [(UIPrintInfo *)self->_printInfo duplex];
          UIPrintInfoOutputType v60 = [(UIPrintInfo *)self->_printInfo outputType];
          [v8 size];
          UIPrintInfoOutputType v33 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v59, v60);
          if (v33)
          {
            [v8 size];
            uint64_t v61 = +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v33);

            UIPrintInfoDuplex v32 = (UIPrintPaper *)v61;
          }
        }

LABEL_50:
        double v34 = self->_printer;
        id v8 = v8;
        long long v80 = v34;
        NSUInteger v35 = v32;
        id v36 = [v8 CIImage];
        BOOL v37 = v36 == 0;

        double v38 = v8;
        if (!v37)
        {
          double v38 = ConvertCIBasedImage(v8);
        }
        id v39 = v38;
        if ([v39 CGImage])
        {
          info = v80;
          uint64_t v101 = 0;
          CGDataConsumerCallbacks cbks = (CGDataConsumerCallbacks)xmmword_1F3C9D388;
          consumer = CGDataConsumerCreate(&info, &cbks);
          if (consumer)
          {
            memset(&mediaBox, 0, sizeof(mediaBox));
            [v39 size];
            double v41 = v40;
            double v43 = v42;
            [(UIPrintPaper *)v35 paperSize];
            double v45 = v44;
            [(UIPrintPaper *)v35 paperSize];
            if ((v45 <= v46 || v41 >= v43)
              && (([(UIPrintPaper *)v35 paperSize],
                   double v48 = v47,
                   [(UIPrintPaper *)v35 paperSize],
                   v48 >= v49)
               || v41 <= v43))
            {
              [(UIPrintPaper *)v35 paperSize];
              CGFloat v51 = v62;
              [(UIPrintPaper *)v35 paperSize];
              CGFloat v52 = v63;
            }
            else
            {
              [(UIPrintPaper *)v35 paperSize];
              CGFloat v51 = v50;
              [(UIPrintPaper *)v35 paperSize];
            }
            mediaBox.origin.CGFloat x = 0.0;
            mediaBox.origin.CGFloat y = 0.0;
            mediaBox.size.double width = v51;
            mediaBox.size.double height = v52;
            CFDictionaryRef v64 = (const __CFDictionary *)GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo;
            if (!GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo)
            {
              keys[0] = *(void **)MEMORY[0x1E4F1DDF8];
              values = (void *)*MEMORY[0x1E4F1CFC8];
              CFDictionaryRef v64 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo = (uint64_t)v64;
            }
            UIPrintInfoOutputType v65 = CGPDFContextCreate(consumer, &mediaBox, v64);
            v66 = v65;
            if (v65)
            {
              CGPDFContextBeginPage(v65, 0);
              [v39 imageOrientation];
              [(UIPrintPaper *)v35 paperSize];
              [(UIPrintPaper *)v35 printableRect];
              PKDrawImageToSheet();
              CGPDFContextEndPage(v66);
              CGPDFContextClose(v66);
              CGContextRelease(v66);
            }
            CGDataConsumerRelease(consumer);
          }
          BOOL v67 = (_BYTE)v101 == 0;

          if (!v67)
          {
            double v68 = self->_printer;
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke;
            v88[3] = &unk_1E6DA1800;
            v88[4] = self;
            long long v90 = &v92;
            id v89 = v7;
            [(PKPrinter *)v68 finishJobCompletionHandler:v88];
          }
        }
        else
        {
        }
      }
LABEL_82:

      _Block_object_dispose(&v92, 8);
      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v6;
      if (v13)
      {
        uint64_t v9 = v13;
        uint64_t v14 = GetImageUTI(0, v13);
        unint64_t v15 = (void *)v14;
        if (v14)
        {
          uint64_t v11 = PrintableMIMEType(v14);
          if (v11)
          {
            id v81 = 0;
            id v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
          if (IsAssetURL(v9))
          {
            uint64_t v19 = GetPHAssetForAssetURLSync(v9);
            if (v19)
            {
              id v81 = (id)v19;
              id v10 = 0;
              goto LABEL_27;
            }

            uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:3 userInfo:0];
            uint64_t v9 = 0;
            id v10 = 0;
            uint64_t v22 = (void *)v93[5];
            v93[5] = v23;
          }
          else
          {
            BOOL v20 = v93;
            id v91 = (id)v93[5];
            id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:1 error:&v91];
            id v21 = v91;
            uint64_t v22 = (void *)v20[5];
            v20[5] = (uint64_t)v21;
          }

          id v81 = 0;
          goto LABEL_27;
        }

        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:3 userInfo:0];
        id v81 = 0;
        id v10 = 0;
        uint64_t v9 = (void *)v93[5];
        v93[5] = v18;
LABEL_27:

        uint64_t v9 = 0;
        uint64_t v11 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v6;
        id v81 = 0;
        uint64_t v9 = 0;
        uint64_t v11 = 0;
LABEL_29:
        if (!v10)
        {
          id v8 = 0;
          goto LABEL_43;
        }
        if ([(UIPrintInteractionController *)self _canPrintPDFData:v10])
        {
          id v24 = (id)*MEMORY[0x1E4F93350];

          id v8 = 0;
          uint64_t v11 = v24;
        }
        else
        {
          long long v25 = CGImageSourceCreateWithData((CFDataRef)v10, 0);
          long long v26 = v25;
          if (v25)
          {
            CFStringRef Type = CGImageSourceGetType(v25);
            PrintableMIMEType((uint64_t)Type);
            id v28 = (id)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              id v8 = 0;
            }
            else
            {
              ImageFromImageSource(v26);
              id v8 = (id)objc_claimAutoreleasedReturnValue();
              id v28 = (id)*MEMORY[0x1E4F93350];

              id v10 = 0;
            }
            CFRelease(v26);
            uint64_t v11 = v28;
          }
          else
          {
            id v8 = 0;
          }
        }
        if (!v10 || v11)
        {
LABEL_43:
          if (v81)
          {
            uint64_t v31 = GetImageForPHAssetSync(v81);

            id v8 = (id)v31;
          }
          if (v8) {
            goto LABEL_46;
          }
          if (!v9)
          {
            if (v10)
            {
              if (![(PKPrinter *)self->_printer startJob:self->_printSettings ofType:v11])
              {
                uint64_t v56 = self->_printer;
                id v10 = v10;
                if (!-[PKPrinter sendData:ofLength:](v56, "sendData:ofLength:", [v10 bytes], objc_msgSend(v10, "length")))
                {
                  uint64_t v57 = self->_printer;
                  v82[0] = MEMORY[0x1E4F143A8];
                  v82[1] = 3221225472;
                  v82[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_3;
                  v82[3] = &unk_1E6DA1800;
                  v82[4] = self;
                  long long v84 = &v92;
                  id v83 = v7;
                  [(PKPrinter *)v57 finishJobCompletionHandler:v82];
                }
              }
              id v8 = 0;
              uint64_t v9 = 0;
              goto LABEL_82;
            }
            goto LABEL_17;
          }
          id v53 = [(UIPrintPaper *)self->_printPaper _pkPaper];
          if ([v53 isRoll] && !self->_printingItem)
          {
            BOOL v69 = [(NSArray *)self->_printingItems count] > 1;

            if (!v69) {
              goto LABEL_63;
            }
            [(UIPrintInteractionController *)self _printItemContentSize:v6];
            double v71 = v70;
            double v73 = v72;
            id v53 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, [(UIPrintInfo *)self->_printInfo duplex], [(UIPrintInfo *)self->_printInfo outputType], v70, v72);
            if (v53)
            {
              double v74 = +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v53, v71, v73);
              unint64_t v75 = v74;
              if (v74)
              {
                printSettings = self->_printSettings;
                uint64_t v77 = [v74 _pkPaper];
                [(PKPrintSettings *)printSettings setPaper:v77];
              }
            }
          }

LABEL_63:
          id v54 = self->_printer;
          long long v55 = self->_printSettings;
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_2;
          v85[3] = &unk_1E6DA1828;
          long long v87 = &v92;
          id v86 = v7;
          [(PKPrinter *)v54 printURL:v9 ofType:v11 printSettings:v55 completionHandler:v85];

          id v8 = 0;
          goto LABEL_82;
        }

        uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:3 userInfo:0];
        id v30 = (void *)v93[5];
        v93[5] = v29;

LABEL_42:
        id v10 = 0;
        uint64_t v11 = 0;
        goto LABEL_43;
      }
      getPHAssetClass();
      if (objc_opt_isKindOfClass())
      {
        id v81 = v6;
        uint64_t v9 = 0;
        id v8 = 0;
        goto LABEL_42;
      }
    }
    id v81 = 0;
    uint64_t v11 = 0;
LABEL_17:
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:3 userInfo:0];
    NSUInteger v17 = (void *)v93[5];
    v93[5] = v16;

    if (v7) {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, v93[5]);
    }
    id v8 = 0;
    uint64_t v9 = 0;
    id v10 = 0;
    goto LABEL_82;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
LABEL_83:
}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1[4] + 96) abortJobCompletionHandler:0];
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
    uint64_t v4 = *(void *)(a1[6] + 8);
    dispatch_time_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_time_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_3(void *a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1[4] + 96) abortJobCompletionHandler:0];
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
    uint64_t v4 = *(void *)(a1[6] + 8);
    dispatch_time_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)needRedrawWithNUp
{
  if (![(UIPrintInteractionController *)self _canShowLayout]) {
    return 0;
  }
  uint64_t v3 = [(UIPrintInteractionController *)self activePrintInfo];
  if ([v3 nUpActive])
  {
    char v4 = 1;
  }
  else
  {
    dispatch_time_t v5 = [(UIPrintInteractionController *)self activePrintInfo];
    if ([v5 borderType])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(UIPrintInteractionController *)self activePrintInfo];
      if ([v6 bookletStyle] <= 0)
      {
        id v7 = [(UIPrintInteractionController *)self activePrintInfo];
        char v4 = [v7 flipHorizontal];
      }
      else
      {
        char v4 = 1;
      }
    }
  }

  return v4;
}

- (id)_createDocInfoDict
{
  uint64_t v3 = GetAppName();
  char v4 = [(UIPrintInfo *)self->_activePrintInfo jobName];
  if (!v4)
  {
    char v4 = GetDefaultJobName();
  }
  uint64_t v5 = *MEMORY[0x1E4F1DE08];
  uint64_t v6 = *MEMORY[0x1E4F1DDC8];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x1E4F1DE08], v3, *MEMORY[0x1E4F1DDC8], 0);
  paper = self->_paper;
  if (paper)
  {
    uint64_t v9 = [(UIPrintPaper *)paper _keywordForPDFMetadata];

    if (v9)
    {
      id v10 = [(UIPrintPaper *)self->_paper _keywordForPDFMetadata];
      [v7 setObject:v10 forKey:*MEMORY[0x1E4F1DDD8]];
    }
  }
  uint64_t v11 = [(UIPrintInteractionController *)self printingItem];

  if (v11)
  {
    uint64_t v12 = [(UIPrintInteractionController *)self printingItem];
    CFDataRef v13 = [(UIPrintInteractionController *)self _convertToPrintableItem:v12];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_35;
    }
    uint64_t v14 = CGDataProviderCreateWithCFData(v13);
    if (!v14) {
      goto LABEL_35;
    }
    unint64_t v15 = v14;
    uint64_t v16 = CGPDFDocumentCreateWithProvider(v14);
    CGDataProviderRelease(v15);
    if (!v16) {
      goto LABEL_35;
    }
    uint64_t v17 = CGPDFDocumentCopyOutputIntents();
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      [v7 setObject:v17 forKey:*MEMORY[0x1E4F1DDE8]];
    }
    uint64_t v19 = [(UIPrintInteractionController *)self pdfPassword];
    if (v19)
    {
      BOOL v20 = (void *)v19;
      [(UIPrintInteractionController *)self pdfPassword];
      id v21 = v41 = v16;
      uint64_t v22 = [v21 length];

      uint64_t v16 = v41;
      if (v22)
      {
        uint64_t v23 = [(UIPrintInteractionController *)self pdfPassword];
        [v7 setObject:v23 forKey:*MEMORY[0x1E4F1DDF0]];

        id v24 = [(UIPrintInteractionController *)self pdfPassword];
        [v7 setObject:v24 forKey:*MEMORY[0x1E4F1DE18]];
      }
    }
    long long v25 = [MEMORY[0x1E4F28ED0] numberWithBool:CGPDFDocumentAllowsPrinting(v16)];
    [v7 setObject:v25 forKey:*MEMORY[0x1E4F1DDA8]];

    long long v26 = [MEMORY[0x1E4F28ED0] numberWithBool:CGPDFDocumentAllowsCopying(v16)];
    [v7 setObject:v26 forKey:*MEMORY[0x1E4F1DDA0]];

    [v7 setObject:@"pdftopdf filter" forKey:v6];
    uint64_t v27 = [(UIPrintInteractionController *)self pdfPassword];
    if (v27)
    {
      id v28 = (void *)v27;
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v16);

      if (IsEncrypted)
      {
        id v30 = [(UIPrintInteractionController *)self pdfPassword];
        CGPDFDocumentUnlockWithPassword(v16, (const char *)[v30 cStringUsingEncoding:4]);
      }
    }
    Info = CGPDFDocumentGetInfo(v16);
    if (Info)
    {
      UIPrintInfoDuplex v32 = Info;
      CGPDFArrayRef v42 = 0;
      CGPDFStringRef value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        CFStringRef v33 = CGPDFStringCopyTextString(value);
        if (v33)
        {
          double v34 = (__CFString *)v33;
          [v7 setObject:v33 forKey:v5];
        }
      }
      if (CGPDFDictionaryGetString(v32, "Author", &value))
      {
        CFStringRef v35 = CGPDFStringCopyTextString(value);
        if (v35)
        {
          id v36 = (__CFString *)v35;
          [v7 setObject:v35 forKey:*MEMORY[0x1E4F1DDB8]];
        }
      }
      if (CGPDFDictionaryGetString(v32, "Subject", &value))
      {
        CFStringRef v37 = CGPDFStringCopyTextString(value);
        if (v37)
        {
          double v38 = (__CFString *)v37;
          [v7 setObject:v37 forKey:*MEMORY[0x1E4F1DE00]];
        }
      }
      if (CGPDFDictionaryGetString(v32, "Keywords", &value))
      {
        id v39 = (void *)CGPDFStringCopyTextString(value);
        if (!v39) {
          goto LABEL_34;
        }
      }
      else
      {
        if (!CGPDFDictionaryGetArray(v32, "AAPL:Keywords", &v42)) {
          goto LABEL_34;
        }
        id v39 = v42;
        if (!v42) {
          goto LABEL_34;
        }
      }
      [v7 setObject:v39 forKey:*MEMORY[0x1E4F1DDD8]];
    }
LABEL_34:
    CGPDFDocumentRelease(v16);
LABEL_35:
  }
  return v7;
}

- (CGContext)_newSaveContext:(id)a3 withMediaRect:(CGRect)a4
{
  CGRect v9 = a4;
  if (!a3) {
    return 0;
  }
  CFURLRef v5 = (const __CFURL *)a3;
  CFDictionaryRef v6 = [(UIPrintInteractionController *)self _createDocInfoDict];
  id v7 = CGPDFContextCreateWithURL(v5, &v9, v6);

  return v7;
}

- (id)_printPageWithRenderer:(id)a3
{
  id v4 = a3;
  if (![(UIPrintInteractionController *)self printStateActive])
  {
    unint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
    goto LABEL_21;
  }
  if (self->_currentPage != self->_currentRange.location) {
    goto LABEL_13;
  }
  CFURLRef v5 = [(NSArray *)self->_pageRanges firstObject];
  uint64_t v6 = [v5 rangeValue];
  uint64_t v8 = v7;
  NSUInteger location = self->_currentRange.location;
  NSUInteger length = self->_currentRange.length;

  if (location != v6 || length != v8) {
    goto LABEL_13;
  }
  saveFileURL = self->_saveFileURL;
  if (saveFileURL)
  {
    [v4 paperRect];
    CFDataRef v13 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", saveFileURL);
    if (v13)
    {
      uint64_t v14 = v13;
      [v4 _startPrintJobContext:v13];
      CGContextRelease(v14);
LABEL_13:
      unint64_t v15 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    printer = self->_printer;
    uint64_t v17 = [(UIPrintInteractionController *)self activePrintInfo];
    LOBYTE(printer) = [v4 _startPrintJobContext:printer printInfo:v17 printSettings:self->_printSettings];

    if (printer) {
      goto LABEL_13;
    }
  }
  unint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
LABEL_14:
  if ([(UIPrintInteractionController *)self printStateActive] && !v15)
  {
    currentCGPDFPageRef Page = self->_currentPage;
    uint64_t v19 = [(UIPrintInteractionController *)self activePrintInfo];
    [v19 scalingFactor];
    objc_msgSend(v4, "_drawPage:withScale:drawingToPDF:", currentPage, 1);
  }
  if ([(UIPrintInteractionController *)self printStateActive])
  {
    if (!v15)
    {
      ++self->_pagesDrawn;
      if (self->_pageCount < 0) {
        self->_int64_t pageCount = [v4 numberOfPages];
      }
    }
  }
LABEL_21:

  return v15;
}

- (void)_endPrintJobWithAction:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  id temporaryRetainCycle = v7->_temporaryRetainCycle;
  v7->_id temporaryRetainCycle = 0;

  if ([(UIPrintInteractionController *)v7 printStateActive])
  {
    BOOL v9 = a3 == 0;
    BOOL v10 = a3 == 0;
    char v11 = !v9;
    [(UIPrintInteractionController *)v7 _cancelAllPreviewGeneration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke;
    v12[3] = &unk_1E6DA14C8;
    v12[4] = v7;
    char v14 = v11;
    id v13 = v6;
    [(UIPrintInteractionController *)v7 _cancelPreviewQueue:v10 completionHandler:v12];
  }
}

void __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) rendererToUse];
  uint64_t v3 = v2;
  if (v2) {
    [v2 _endPrintJobContext];
  }
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 96) finishJobCompletionHandler:0];
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 96) abortJobCompletionHandler:0];
  }
  id v4 = *(id **)(a1 + 32);
  if (v4[34] && (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 40)))
  {
    CFURLRef v5 = [v4[34] path];
    [v5 getCString:v19 maxLength:1024 encoding:4];

    unlink(v19);
    id v4 = *(id **)(a1 + 32);
  }
  [v4 setConvertedPrintableItems:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  uint64_t v7 = *MEMORY[0x1E4FB2748];
  if ((*(void *)(*(void *)(a1 + 32) + 16) != *MEMORY[0x1E4FB2748]
     || [(id)*MEMORY[0x1E4FB2608] _taskSuspendingUnsupported])
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained printInteractionControllerDidFinishJob:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(a1 + 32) + 240) endProgress];
  uint64_t v8 = [*(id *)(a1 + 32) _completionHandler];
  if (v8)
  {
    int v9 = pthread_main_np();
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9 == 1 || *(void *)(v10 + 272))
    {
      v8[2](v8, v10, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke_2;
      block[3] = &unk_1E6DA1850;
      uint64_t v12 = v8;
      uint64_t v13 = *(void *)(a1 + 32);
      char v14 = *(void **)(a1 + 40);
      id v17 = v12;
      block[4] = v13;
      char v18 = *(unsigned char *)(a1 + 48);
      id v16 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  [*(id *)(a1 + 32) _cleanPrintState];
  if (*(void *)(*(void *)(a1 + 32) + 16) != v7)
  {
    char v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v11 _endBackgroundTask:*(void *)(*(void *)(a1 + 32) + 16)];

    *(void *)(*(void *)(a1 + 32) + 16) = v7;
  }
}

uint64_t __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (id)appOptionsViewController
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [v5 performSelector:sel_appOptionsViewController];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_completionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)set_completionHandler:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(UIPrintInfo *)printInfo
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)showsPageRange
{
  return self->_showsPageRange;
}

- (void)setShowsPageRange:(BOOL)showsPageRange
{
  self->_showsPageRange = showsPageRange;
}

- (BOOL)showsNumberOfCopies
{
  return self->_showsNumberOfCopies;
}

- (void)setShowsNumberOfCopies:(BOOL)showsNumberOfCopies
{
  self->_showsNumberOfCopies = showsNumberOfCopies;
}

- (BOOL)showsPaperSelectionForLoadedPapers
{
  return self->_showsPaperSelectionForLoadedPapers;
}

- (void)setShowsPaperSelectionForLoadedPapers:(BOOL)showsPaperSelectionForLoadedPapers
{
  self->_showsPaperSelectionForLoadedPapers = showsPaperSelectionForLoadedPapers;
}

- (BOOL)showsPaperOrientation
{
  return self->_showsPaperOrientation;
}

- (void)setShowsPaperOrientation:(BOOL)showsPaperOrientation
{
  self->_showsPaperOrientation = showsPaperOrientation;
}

- (UIPrintPaper)printPaper
{
  return self->_printPaper;
}

- (UIPrintPageRenderer)printPageRenderer
{
  return self->_printPageRenderer;
}

- (void)setPrintPageRenderer:(UIPrintPageRenderer *)printPageRenderer
{
}

- (UIPrintFormatter)printFormatter
{
  return self->_printFormatter;
}

- (void)setPrintFormatter:(UIPrintFormatter *)printFormatter
{
}

- (id)printingItem
{
  return self->_printingItem;
}

- (NSArray)printingItems
{
  return self->_printingItems;
}

- (void)setPrintingItems:(NSArray *)printingItems
{
}

- (void)setPrintStateActive:(BOOL)a3
{
  self->_printStateActive = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_int64_t pageCount = a3;
}

- (UIWindowScene)hostingWindowScene
{
  return self->_hostingWindowScene;
}

- (void)setHostingWindowScene:(id)a3
{
}

- (int64_t)pageCountWithRanges
{
  return self->_pageCountWithRanges;
}

- (void)setPageCountWithRanges:(int64_t)a3
{
  self->_int64_t pageCountWithRanges = a3;
}

- (NSMutableSet)previewStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPreviewStates:(id)a3
{
}

- (NSObject)renderThumbnailMutex
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setRenderThumbnailMutex:(id)a3
{
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentCGPDFPageRef Page = a3;
}

- (_NSRange)currentRange
{
  objc_copyStruct(v4, &self->_currentRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setCurrentRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_currentRange, &v3, 16, 1, 0);
}

- (int64_t)pagesDrawn
{
  return self->_pagesDrawn;
}

- (void)setPagesDrawn:(int64_t)a3
{
  self->_int64_t pagesDrawn = a3;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPrintPanelViewController:(id)a3
{
}

- (UIPrintingProgress)printingProgress
{
  return (UIPrintingProgress *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPrintingProgress:(id)a3
{
}

- (PKPrintSettings)printSettings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPrintSettings:(id)a3
{
}

- (UIPrintInfo)activePrintInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 256, 1);
}

- (void)setActivePrintInfo:(id)a3
{
}

- (int)printerInfoState
{
  return self->_printerInfoState;
}

- (void)setPrinterInfoState:(int)a3
{
  self->_printerInfoState = a3;
}

- (BOOL)supressNotifyDismissed
{
  return self->_supressNotifyDismissed;
}

- (void)setSupressNotifyDismissed:(BOOL)a3
{
  self->_supressNotifyDismissed = a3;
}

- (UIPrintPageRenderer)formatterRenderer
{
  return (UIPrintPageRenderer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFormatterRenderer:(id)a3
{
}

- (BOOL)manualPrintPageEnabled
{
  return self->_manualPrintPageEnabled;
}

- (void)setManualPrintPageEnabled:(BOOL)a3
{
  self->_manualPrintPageEnabled = a3;
}

- (NSURL)saveFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSaveFileURL:(id)a3
{
}

- (BOOL)showPrintingProgress
{
  return self->_showPrintingProgress;
}

- (void)setShowPrintingProgress:(BOOL)a3
{
  self->_showPrintingProgress = a3;
}

- (NSString)pdfPassword
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPdfPassword:(id)a3
{
}

- (NSMutableDictionary)convertedPrintableItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setConvertedPrintableItems:(id)a3
{
}

- (BOOL)usingWebKitFormatter
{
  return self->_usingWebKitFormatter;
}

- (void)setUsingWebKitFormatter:(BOOL)a3
{
  self->_usingWebKitFormatter = a3;
}

- (NSObject)webKitFormatterMutex
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setWebKitFormatterMutex:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (UIPrintInteractionControllerActivityDelegate)printActivityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
  return (UIPrintInteractionControllerActivityDelegate *)WeakRetained;
}

- (void)setPrintActivityDelegate:(id)a3
{
}

- (BOOL)showsScalingFactor
{
  return self->_showsScalingFactor;
}

- (void)setShowsScalingFactor:(BOOL)a3
{
  self->_showsScalingFactor = a3;
}

- (BOOL)preventPDFCreation
{
  return self->_preventPDFCreation;
}

- (void)setPreventPDFCreation:(BOOL)a3
{
  self->_preventPDFCreation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printActivityDelegate);
  objc_storeStrong((id *)&self->_webKitFormatterMutex, 0);
  objc_storeStrong((id *)&self->_convertedPrintableItems, 0);
  objc_storeStrong((id *)&self->_pdfPassword, 0);
  objc_storeStrong((id *)&self->_saveFileURL, 0);
  objc_storeStrong((id *)&self->_formatterRenderer, 0);
  objc_storeStrong((id *)&self->_activePrintInfo, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_printingProgress, 0);
  objc_storeStrong((id *)&self->_printPanelViewController, 0);
  objc_storeStrong((id *)&self->_renderThumbnailMutex, 0);
  objc_storeStrong((id *)&self->_previewStates, 0);
  objc_storeStrong((id *)&self->_hostingWindowScene, 0);
  objc_storeStrong((id *)&self->_printingItems, 0);
  objc_storeStrong(&self->_printingItem, 0);
  objc_storeStrong((id *)&self->_printFormatter, 0);
  objc_storeStrong((id *)&self->_printPageRenderer, 0);
  objc_storeStrong((id *)&self->_printPaper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_tempPreviewFileURL, 0);
  objc_storeStrong((id *)&self->_paper, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_nupFileURL, 0);
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_storeStrong(&self->_temporaryRetainCycle, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
}

- (void)_enableManualPrintPage:(BOOL)a3
{
  self->_manualPrintPageEnabled = a3;
}

- (void)_manualPrintPage
{
}

- (void)_cancelManualPrintPage
{
}

- (BOOL)savePDFToURL:(id)a3 completionHandler:(id)a4
{
  return [(UIPrintInteractionController *)self savePDFToURL:a3 showProgress:1 hostingScene:0 completionHandler:a4];
}

- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 completionHandler:(id)a5
{
  return [(UIPrintInteractionController *)self savePDFToURL:a3 showProgress:a4 hostingScene:0 completionHandler:a5];
}

- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 hostingScene:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (*(_OWORD *)&self->_printPageRenderer == 0)
  {
    NSLog(&cfstr_ErrorAttemptin_0.isa);
    if (v13) {
      goto LABEL_4;
    }
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if (![(UIPrintInteractionController *)self printStateActive])
  {
    [(UIPrintInteractionController *)self setPrintStateActive:1];
    id v16 = (void *)[v13 copy];
    [(UIPrintInteractionController *)self set_completionHandler:v16];

    printInfo = self->_printInfo;
    if (printInfo)
    {
      char v18 = (UIPrintInfo *)[(UIPrintInfo *)printInfo copy];
    }
    else
    {
      char v18 = +[UIPrintInfo printInfo];
    }
    activePrintInfo = self->_activePrintInfo;
    self->_activePrintInfo = v18;

    [(UIPrintInteractionController *)self setPrinter:0];
    [(UIPrintInfo *)self->_activePrintInfo setPrinterID:0];
    [(UIPrintInfo *)self->_activePrintInfo setDuplex:0];
    objc_storeStrong((id *)&self->_saveFileURL, a3);
    self->_showPrintingProgress = a4;
    objc_storeStrong((id *)&self->_hostingWindowScene, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained printInteractionControllerWillPresentPrinterOptions:self];
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained printInteractionControllerDidPresentPrinterOptions:self];
    }
    if (!self->_supressNotifyDismissed)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained printInteractionControllerWillDismissPrinterOptions:self];
      }
      if (!self->_supressNotifyDismissed && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained printInteractionControllerDidDismissPrinterOptions:self];
      }
    }
    BOOL v15 = 1;
    [(UIPrintInteractionController *)self _setPrinterInfoState:1];
    goto LABEL_19;
  }
  if (!v13) {
    goto LABEL_21;
  }
LABEL_4:
  id WeakRetained = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIPrintErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, UIPrintInteractionController *, void, void *))v13 + 2))(v13, self, 0, WeakRetained);
  BOOL v15 = 0;
LABEL_19:

LABEL_22:
  return v15;
}

@end