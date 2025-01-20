@interface UIPrintPanelViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)animated;
- (BOOL)dismissed;
- (BOOL)quickLookPDFGenerationCancelled;
- (BOOL)quickLookPDFGenerationInProgress;
- (BOOL)shouldShowDuplex;
- (BOOL)shouldShowLayout;
- (BOOL)shouldShowOrientation;
- (BOOL)shouldShowPageRange;
- (BOOL)shouldShowScaling;
- (BOOL)showingVerticalPreview;
- (CGSize)preferredSizeForScene:(id)a3;
- (NSArray)horizScrollPrintPanelConstraints;
- (NSArray)lastUsedPrinterArray;
- (NSArray)vertScrollPrintPanelConstraints;
- (NSLayoutConstraint)previewHeightConstraint;
- (NSLayoutConstraint)printOptionsWidthConstraint;
- (NSString)shareablePDFDirectoryPath;
- (NSURL)quickLookPDFURL;
- (UIActivityViewController)activityViewController;
- (UIAlertController)pdfCreationProgressController;
- (UIBarButtonItem)shareButton;
- (UIPopoverController)poverController;
- (UIPrintInfo)printInfo;
- (UIPrintInteractionController)printInteractionController;
- (UIPrintOptionsTableViewController)printOptionsTableViewController;
- (UIPrintPanelNavigationController)printOptionsNavController;
- (UIPrintPanelNavigationController)printPanelNavigationController;
- (UIPrintPanelViewController)initWithPrintInterationController:(id)a3 inParentController:(id)a4;
- (UIPrintPanelWindow)printPanelWindow;
- (UIPrintPreviewViewController)previewViewController;
- (UIPrinter)observedPrinter;
- (UITableView)printOptionsTableView;
- (UIView)previewPanelView;
- (UIView)previewSeparatorView;
- (UIViewController)parentController;
- (double)progressPresentationTime;
- (id)createShareablePDFFileURL:(id)a3;
- (id)keyCommands;
- (id)shareableURLForPreviewing;
- (int64_t)lastUsedPrinterIndex;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_presentInParentAnimated:(BOOL)a3 hostingScene:(id)a4;
- (void)addCanelButtonToNavItem:(id)a3;
- (void)addPrintShareButtonsToNavItem:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)backButtonPressed:(id)a3;
- (void)cancelPrinting;
- (void)cancelQuickLookPDFGeneration;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissKeyboard;
- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)generateQuickLookPDFWithCompletionHandler:(id)a3;
- (void)hideGeneratingPDFProgress:(id)a3;
- (void)loadView;
- (void)lookupLastUsedPrinter;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentPrintPanelAnimated:(BOOL)a3 hostingScene:(id)a4;
- (void)presentPrintPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)presentPrintPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)printButtonPressed:(id)a3;
- (void)printNavigationConrollerDidDismiss;
- (void)printPanelDidDisappear;
- (void)removeShareablePDFFiles;
- (void)resetPreviewPages;
- (void)setActivityViewController:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setHorizScrollPrintPanelConstraints:(id)a3;
- (void)setLastUsedPrinterArray:(id)a3;
- (void)setLastUsedPrinterIndex:(int64_t)a3;
- (void)setObservedPrinter:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPdfCreationProgressController:(id)a3;
- (void)setPoverController:(id)a3;
- (void)setPreviewHeightConstraint:(id)a3;
- (void)setPreviewPanelView:(id)a3;
- (void)setPreviewSeparatorView:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintInteractionController:(id)a3;
- (void)setPrintOptionsNavController:(id)a3;
- (void)setPrintOptionsTableView:(id)a3;
- (void)setPrintOptionsTableViewController:(id)a3;
- (void)setPrintOptionsWidthConstraint:(id)a3;
- (void)setPrintPanelNavigationController:(id)a3;
- (void)setPrintPanelWindow:(id)a3;
- (void)setPrinter:(id)a3;
- (void)setProgressPresentationTime:(double)a3;
- (void)setQuickLookPDFGenerationCancelled:(BOOL)a3;
- (void)setQuickLookPDFGenerationInProgress:(BOOL)a3;
- (void)setQuickLookPDFURL:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setShareablePDFDirectoryPath:(id)a3;
- (void)setVertScrollPrintPanelConstraints:(id)a3;
- (void)shareButtonPress:(id)a3;
- (void)showGeneratingPDFProgressPanel;
- (void)showSharePanelForPDFURL:(id)a3;
- (void)startPrinting;
- (void)updatePageRange;
- (void)updatePreviewLayoutConstraints;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UIPrintPanelViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (UIPrintPanelViewController)initWithPrintInterationController:(id)a3 inParentController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)UIPrintPanelViewController;
  v9 = [(UIPrintPanelViewController *)&v42 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printInteractionController, a3);
    objc_storeWeak((id *)&v10->_parentController, v8);
    [(UIPrintPanelViewController *)v10 setModalPresentationStyle:2];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.UIKit.UIPrintPanelViewController.printerLookup", 0);
    lookupPrinterQueue = v10->_lookupPrinterQueue;
    v10->_lookupPrinterQueue = (OS_dispatch_queue *)v11;

    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = [[UIPrintPanelNavigationController alloc] initWithPrintOptionsTableViewController:0 rootViewController:v10];
      [(UIPrintPanelViewController *)v10 setPrintPanelNavigationController:v13];

      v14 = [(UIPrintPanelViewController *)v10 printPanelNavigationController];
      [v14 setAppearanceDelegate:v10];

      v15 = [(UIPrintPanelViewController *)v10 printPanelNavigationController];
      [v15 setDelegate:v10];

      v16 = [(UIPrintPanelViewController *)v10 printPanelNavigationController];
      [v16 setIsAccessibilityElement:0];
    }
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"Options" value:@"Options" table:@"Localizable"];
    [(UIPrintPanelViewController *)v10 setTitle:v18];

    v19 = [v7 _currentPrintInfo];
    [(UIPrintPanelViewController *)v10 setPrintInfo:v19];

    v20 = [(UIPrintPanelViewController *)v10 printInteractionController];
    v21 = [v20 paper];
    v22 = [(UIPrintPanelViewController *)v10 printInfo];
    [v22 setPrintPaper:v21];

    v23 = [(UIPrintPanelViewController *)v10 printInteractionController];
    uint64_t v24 = [v23 _canShowAnnotations];
    v25 = [(UIPrintPanelViewController *)v10 printInfo];
    [v25 setPdfAnnotationsAvailable:v24];

    v26 = [(UIPrintPanelViewController *)v10 printInteractionController];
    [v26 setShowsPaperSelectionForLoadedPapers:1];

    v27 = [(UIPrintPanelViewController *)v10 printInfo];
    [v27 addObserver:v10 forKeyPath:0x1F3C9DE58 options:0 context:0];

    v28 = [(UIPrintPanelViewController *)v10 printInfo];
    [v28 addObserver:v10 forKeyPath:0x1F3C9DDD8 options:0 context:0];

    v29 = [(UIPrintPanelViewController *)v10 printInfo];
    [v29 addObserver:v10 forKeyPath:0x1F3C9DEB8 options:0 context:0];

    v30 = [(UIPrintPanelViewController *)v10 printInfo];
    [v30 addObserver:v10 forKeyPath:0x1F3C9DFF8 options:0 context:0];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v10 selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

    _UIPrinterInfoCancelRequests();
    v32 = [(UIPrintPanelViewController *)v10 printInteractionController];
    v33 = [v32 _currentPrintInfo];
    v34 = [v33 printerID];

    if (v34)
    {
      v35 = [(UIPrintPanelViewController *)v10 printInfo];
      v36 = [v35 currentPrinter];
      v37 = (void *)MEMORY[0x1E4F932F8];
      v38 = [v7 _currentPrintInfo];
      v39 = [v38 printerID];
      v40 = [v37 printerWithName:v39];
      objc_msgSend(v36, "set_internalPrinter:", v40);
    }
    else
    {
      [(UIPrintPanelViewController *)v10 lookupLastUsedPrinter];
    }
  }

  return v10;
}

- (void)dealloc
{
  lookupPrinterQueue = self->_lookupPrinterQueue;
  self->_lookupPrinterQueue = 0;

  v4 = [(UIPrintPanelViewController *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5 = [(UIPrintPanelViewController *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9DDD8];

  v6 = [(UIPrintPanelViewController *)self printInfo];
  [v6 removeObserver:self forKeyPath:0x1F3C9DEB8];

  id v7 = [(UIPrintPanelViewController *)self printInfo];
  [v7 removeObserver:self forKeyPath:0x1F3C9DFF8];

  id v8 = [(UIPrintPanelViewController *)self view];
  [v8 removeObserver:self forKeyPath:@"frame"];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self];

  [(UIPrintPanelViewController *)self removeShareablePDFFiles];
  v10.receiver = self;
  v10.super_class = (Class)UIPrintPanelViewController;
  [(UIPrintPanelViewController *)&v10 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if ([v7 isEqualToString:0x1F3C9DE58])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_1E6DA1408;
    v14[4] = self;
    id v8 = MEMORY[0x1E4F14428];
    v9 = v14;
LABEL_9:
    dispatch_async(v8, v9);
    goto LABEL_10;
  }
  if ([v7 isEqualToString:0x1F3C9DFF8])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v13[3] = &unk_1E6DA1408;
    v13[4] = self;
    id v8 = MEMORY[0x1E4F14428];
    v9 = v13;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:0x1F3C9DEB8])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v12[3] = &unk_1E6DA1408;
    v12[4] = self;
    id v8 = MEMORY[0x1E4F14428];
    v9 = v12;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:0x1F3C9DDD8])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
    v11[3] = &unk_1E6DA1408;
    v11[4] = self;
    id v8 = MEMORY[0x1E4F14428];
    v9 = v11;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"frame"])
  {
    objc_super v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"UIPrintPanelDidChangeSizeNotification" object:self userInfo:0];
  }
LABEL_10:
}

void __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 printInfo];
  v2 = [v3 currentPrinter];
  [v1 setPrinter:v2];
}

uint64_t __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreviewLayoutConstraints];
}

uint64_t __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePageRange];
}

void __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) printOptionsTableViewController];
  [v1 updatePrintSectionList];
}

- (void)loadView
{
  v131[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v8 setBackgroundColor:v9];

  [(UIPrintPanelViewController *)self setView:v8];
  objc_super v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 2, v4, v5, v6, v7);
  [(UIPrintPanelViewController *)self setPrintOptionsTableView:v10];

  dispatch_queue_t v11 = [(UIPrintPanelViewController *)self printOptionsTableView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(UIPrintPanelViewController *)self printOptionsTableView];
  [v12 setEstimatedSectionHeaderHeight:8.0];

  v13 = [UIPrintOptionsTableViewController alloc];
  v14 = [(UIPrintPanelViewController *)self printOptionsTableView];
  v15 = [(UIPrintPanelViewController *)self printInfo];
  v16 = [(UIPrintOptionsTableViewController *)v13 initWithTableView:v14 printInfo:v15 printPanelViewController:self];
  [(UIPrintPanelViewController *)self setPrintOptionsTableViewController:v16];

  v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"Options" value:@"Options" table:@"Localizable"];
  v19 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  [v19 setTitle:v18];

  v126 = (void *)[objc_alloc(MEMORY[0x1E4FB1EC0]) initWithNibName:0 bundle:0];
  v20 = [UIPrintPanelNavigationController alloc];
  v21 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  v22 = [(UIPrintPanelNavigationController *)v20 initWithPrintOptionsTableViewController:v21 rootViewController:v126];
  [(UIPrintPanelViewController *)self setPrintOptionsNavController:v22];

  id v23 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v23 configureWithTransparentBackground];
  uint64_t v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v23 setBackgroundColor:v24];

  v25 = [MEMORY[0x1E4FB1618] separatorColor];
  v125 = v23;
  [v23 setShadowColor:v25];

  v26 = [(UIPrintPanelViewController *)self printOptionsNavController];
  v27 = [v26 navigationBar];
  [v27 setStandardAppearance:v23];

  id v28 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  v29 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v28 setShadowColor:v29];

  v30 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v124 = v28;
  [v28 setBackgroundColor:v30];

  v31 = [(UIPrintPanelViewController *)self printOptionsNavController];
  v32 = [v31 navigationBar];
  [v32 setScrollEdgeAppearance:v28];

  v33 = [(UIPrintPanelViewController *)self printOptionsNavController];
  v34 = [v33 view];

  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [(UIPrintPanelViewController *)self view];
  v36 = v34;
  [v35 addSubview:v34];

  v37 = [(UIPrintPanelViewController *)self printOptionsNavController];
  [(UIPrintPanelViewController *)self addChildViewController:v37];

  v38 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v38 scale];
  double v40 = v39;

  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v40, v40);
  [(UIPrintPanelViewController *)self setPreviewSeparatorView:v41];

  objc_super v42 = [(UIPrintPanelViewController *)self previewSeparatorView];
  [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

  v43 = [MEMORY[0x1E4FB1618] separatorColor];
  v44 = [(UIPrintPanelViewController *)self previewSeparatorView];
  [v44 setBackgroundColor:v43];

  v45 = [(UIPrintPanelViewController *)self previewSeparatorView];
  [v8 addSubview:v45];

  v46 = [[UIPrintPreviewViewController alloc] initWithScrollDirection:[(UIPrintPanelViewController *)self showingVerticalPreview] ^ 1 printPanelViewController:self];
  [(UIPrintPanelViewController *)self setPreviewViewController:v46];

  v47 = [(UIPrintPanelViewController *)self previewViewController];
  v48 = [v47 view];
  [(UIPrintPanelViewController *)self setPreviewPanelView:v48];

  v49 = [(UIPrintPanelViewController *)self previewPanelView];
  [v49 setTranslatesAutoresizingMaskIntoConstraints:0];

  v50 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v51 = [(UIPrintPanelViewController *)self previewPanelView];
  [v51 setBackgroundColor:v50];

  v52 = [(UIPrintPanelViewController *)self previewPanelView];
  [v8 addSubview:v52];

  v53 = [(UIPrintPanelViewController *)self previewViewController];
  [(UIPrintPanelViewController *)self addChildViewController:v53];

  v54 = (void *)MEMORY[0x1E4F28DC8];
  v127 = v36;
  v55 = [MEMORY[0x1E4F28DC8] constraintWithItem:v36 attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:0.0];
  v131[0] = v55;
  v128 = v8;
  v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:v36 attribute:6 relatedBy:0 toItem:v8 attribute:6 multiplier:1.0 constant:0.0];
  v131[1] = v56;
  v57 = [(UIPrintPanelViewController *)self previewPanelView];
  v58 = [v57 leadingAnchor];
  v59 = [v8 safeAreaLayoutGuide];
  v60 = [v59 leadingAnchor];
  v61 = [v58 constraintEqualToAnchor:v60];
  v131[2] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
  [v54 activateConstraints:v62];

  v63 = [MEMORY[0x1E4F28DC8] constraintWithItem:v127 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:333.0];
  [(UIPrintPanelViewController *)self setPrintOptionsWidthConstraint:v63];

  v122 = [MEMORY[0x1E4F28DC8] constraintWithItem:v127 attribute:4 relatedBy:0 toItem:v128 attribute:4 multiplier:1.0 constant:0.0];
  v130[0] = v122;
  v64 = (void *)MEMORY[0x1E4F28DC8];
  v120 = [(UIPrintPanelViewController *)self previewPanelView];
  v118 = [v64 constraintWithItem:v120 attribute:4 relatedBy:0 toItem:v128 attribute:4 multiplier:1.0 constant:0.0];
  v130[1] = v118;
  v65 = (void *)MEMORY[0x1E4F28DC8];
  v116 = [(UIPrintPanelViewController *)self previewPanelView];
  v114 = [v65 constraintWithItem:v116 attribute:3 relatedBy:0 toItem:v128 attribute:3 multiplier:1.0 constant:0.0];
  v130[2] = v114;
  v66 = (void *)MEMORY[0x1E4F28DC8];
  v112 = [(UIPrintPanelViewController *)self previewPanelView];
  v110 = [v66 constraintWithItem:v112 attribute:6 relatedBy:0 toItem:v127 attribute:5 multiplier:1.0 constant:0.0];
  v130[3] = v110;
  v67 = (void *)MEMORY[0x1E4F28DC8];
  v108 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v106 = [(UIPrintPanelViewController *)self previewPanelView];
  v104 = [v67 constraintWithItem:v108 attribute:3 relatedBy:0 toItem:v106 attribute:3 multiplier:1.0 constant:0.0];
  v130[4] = v104;
  v68 = (void *)MEMORY[0x1E4F28DC8];
  v102 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v69 = [(UIPrintPanelViewController *)self previewPanelView];
  v70 = [v68 constraintWithItem:v102 attribute:4 relatedBy:0 toItem:v69 attribute:4 multiplier:1.0 constant:0.0];
  v130[5] = v70;
  v71 = (void *)MEMORY[0x1E4F28DC8];
  v72 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v73 = [(UIPrintPanelViewController *)self previewPanelView];
  v74 = [v71 constraintWithItem:v72 attribute:5 relatedBy:0 toItem:v73 attribute:6 multiplier:1.0 constant:0.0];
  v130[6] = v74;
  v75 = (void *)MEMORY[0x1E4F28DC8];
  v76 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v77 = [v75 constraintWithItem:v76 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0];
  v130[7] = v77;
  v78 = [(UIPrintPanelViewController *)self printOptionsWidthConstraint];
  v130[8] = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:9];
  [(UIPrintPanelViewController *)self setVertScrollPrintPanelConstraints:v79];

  v80 = (void *)MEMORY[0x1E4F28DC8];
  v81 = [(UIPrintPanelViewController *)self previewPanelView];
  v82 = [v80 constraintWithItem:v81 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:250.0];
  [(UIPrintPanelViewController *)self setPreviewHeightConstraint:v82];

  v123 = [MEMORY[0x1E4F28DC8] constraintWithItem:v127 attribute:5 relatedBy:0 toItem:v128 attribute:5 multiplier:1.0 constant:0.0];
  v129[0] = v123;
  v83 = (void *)MEMORY[0x1E4F28DC8];
  v121 = [(UIPrintPanelViewController *)self previewPanelView];
  v119 = [v83 constraintWithItem:v121 attribute:4 relatedBy:0 toItem:v128 attribute:16 multiplier:1.0 constant:0.0];
  v129[1] = v119;
  v84 = (void *)MEMORY[0x1E4F28DC8];
  v117 = [(UIPrintPanelViewController *)self previewPanelView];
  v115 = [v84 constraintWithItem:v127 attribute:4 relatedBy:0 toItem:v117 attribute:3 multiplier:1.0 constant:0.0];
  v129[2] = v115;
  v85 = (void *)MEMORY[0x1E4F28DC8];
  v113 = [(UIPrintPanelViewController *)self previewPanelView];
  v111 = [v85 constraintWithItem:v113 attribute:6 relatedBy:0 toItem:v128 attribute:6 multiplier:1.0 constant:0.0];
  v129[3] = v111;
  v86 = (void *)MEMORY[0x1E4F28DC8];
  v109 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v107 = [(UIPrintPanelViewController *)self previewPanelView];
  v105 = [v86 constraintWithItem:v109 attribute:5 relatedBy:0 toItem:v107 attribute:5 multiplier:1.0 constant:0.0];
  v129[4] = v105;
  v87 = (void *)MEMORY[0x1E4F28DC8];
  v103 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v88 = [(UIPrintPanelViewController *)self previewPanelView];
  v89 = [v87 constraintWithItem:v103 attribute:6 relatedBy:0 toItem:v88 attribute:6 multiplier:1.0 constant:0.0];
  v129[5] = v89;
  v90 = (void *)MEMORY[0x1E4F28DC8];
  v91 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v92 = [(UIPrintPanelViewController *)self previewPanelView];
  v93 = [v90 constraintWithItem:v91 attribute:4 relatedBy:0 toItem:v92 attribute:3 multiplier:1.0 constant:0.0];
  v129[6] = v93;
  v94 = (void *)MEMORY[0x1E4F28DC8];
  v95 = [(UIPrintPanelViewController *)self previewSeparatorView];
  v96 = [v94 constraintWithItem:v95 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0];
  v129[7] = v96;
  v97 = [(UIPrintPanelViewController *)self previewHeightConstraint];
  v129[8] = v97;
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:9];
  [(UIPrintPanelViewController *)self setHorizScrollPrintPanelConstraints:v98];

  v99 = [(UIPrintPanelViewController *)self printOptionsNavController];
  v100 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  [v99 pushViewController:v100 animated:0];

  v101 = [(UIPrintPanelViewController *)self view];
  [v101 addObserver:self forKeyPath:@"frame" options:0 context:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPrintPanelViewController;
  [(UIPrintPanelViewController *)&v6 viewWillAppear:a3];
  double v4 = [(UIPrintPanelViewController *)self parentController];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 setNavigationBarHidden:1];
  }
  else
  {
    double v5 = [(UIPrintPanelViewController *)self printPanelNavigationController];
    [v5 setNavigationBarHidden:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPanelViewController;
  [(UIPrintPanelViewController *)&v9 viewDidDisappear:a3];
  double v4 = [(UIPrintPanelViewController *)self parentController];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setNavigationBarHidden:0];
    }
  }
  uint64_t v5 = [(UIPrintPanelViewController *)self previewViewController];
  if (!v5
    || (objc_super v6 = (void *)v5,
        [(UIPrintPanelViewController *)self previewViewController],
        double v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 presentingDocumentInteractionController],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    [(UIPrintPanelViewController *)self printPanelDidDisappear];
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = [(UIPrintPanelViewController *)self printInteractionController];
  [v3 _updatePageCount];
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v3 = [(UIPrintPanelViewController *)self view];
  double v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  unint64_t v6 = 1 << [v5 interfaceOrientation];

  return v6;
}

- (BOOL)showingVerticalPreview
{
  v2 = [(UIPrintPanelViewController *)self view];
  [v2 frame];
  BOOL v4 = v3 > 500.0;

  return v4;
}

- (void)updatePreviewLayoutConstraints
{
  BOOL v3 = [(UIPrintPanelViewController *)self showingVerticalPreview];
  BOOL v4 = [(UIPrintPanelViewController *)self view];
  [v4 frame];
  if (v3)
  {
    double v7 = v5 * 0.6667;

    double v8 = 333.0;
    if (v7 >= 333.0) {
      double v8 = v7;
    }
    float v9 = v8;
    double v10 = floorf(v9);
    BOOL v4 = [(UIPrintPanelViewController *)self printOptionsWidthConstraint];
    [v4 setConstant:v10];
  }
  else
  {
    float v11 = v6 * 0.3333;
    double v12 = floorf(v11);
    v13 = [(UIPrintPanelViewController *)self previewViewController];
    [v13 headerHeight];
    double v15 = v14 + v12;
    v16 = [(UIPrintPanelViewController *)self previewHeightConstraint];
    [v16 setConstant:v15];
  }
  if ([(UIPrintPanelViewController *)self showingVerticalPreview]
    && ([(UIPrintPanelViewController *)self vertScrollPrintPanelConstraints],
        v17 = objc_claimAutoreleasedReturnValue(),
        [v17 objectAtIndex:0],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 isActive],
        v18,
        v17,
        (v19 & 1) == 0))
  {
    id v23 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v24 = [(UIPrintPanelViewController *)self horizScrollPrintPanelConstraints];
    [v23 deactivateConstraints:v24];

    v25 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v26 = [(UIPrintPanelViewController *)self vertScrollPrintPanelConstraints];
  }
  else
  {
    if ([(UIPrintPanelViewController *)self showingVerticalPreview]) {
      return;
    }
    v20 = [(UIPrintPanelViewController *)self horizScrollPrintPanelConstraints];
    v21 = [v20 objectAtIndex:0];
    char v22 = [v21 isActive];

    if (v22) {
      return;
    }
    v27 = (void *)MEMORY[0x1E4F28DC8];
    id v28 = [(UIPrintPanelViewController *)self vertScrollPrintPanelConstraints];
    [v27 deactivateConstraints:v28];

    v25 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v26 = [(UIPrintPanelViewController *)self horizScrollPrintPanelConstraints];
  }
  id v29 = (id)v26;
  objc_msgSend(v25, "activateConstraints:");
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrintPanelViewController;
  [(UIPrintPanelViewController *)&v3 updateViewConstraints];
  [(UIPrintPanelViewController *)self updatePreviewLayoutConstraints];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIPrintPanelViewController;
  [(UIPrintPanelViewController *)&v6 viewWillLayoutSubviews];
  BOOL v3 = [(UIPrintPanelViewController *)self showingVerticalPreview];
  BOOL v4 = [(UIPrintPanelViewController *)self previewViewController];
  [v4 setScrollDirection:!v3];

  double v5 = [(UIPrintPanelViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)updatePageRange
{
  if ([(UIPrintPanelViewController *)self shouldShowPageRange])
  {
    id v6 = [(UIPrintPanelViewController *)self printInfo];
    BOOL v3 = [v6 pageRanges];
    BOOL v4 = (void *)[v3 copy];
    double v5 = [(UIPrintPanelViewController *)self printInteractionController];
    [v5 setPageRanges:v4];
  }
}

- (id)keyCommands
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_cancelButtonPressed_];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB18D0], "keyCommandWithInput:modifierFlags:action:", @".", 0x100000, sel_cancelButtonPressed_, v2);
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_printButtonPressed_];
  v7[2] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void)backButtonPressed:(id)a3
{
  id v4 = [(UIPrintPanelViewController *)self parentController];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = (id)[v4 popViewControllerAnimated:1];
    }
  }
}

- (void)printButtonPressed:(id)a3
{
  id v4 = [(UIPrintPanelViewController *)self printInfo];
  double v5 = [v4 currentPrinter];

  if (v5)
  {
    id v6 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
    int v7 = [v6 canDismissPrintOptions];

    if (v7)
    {
      [(UIPrintPanelViewController *)self startPrinting];
    }
  }
}

- (void)dismissKeyboard
{
  id v2 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  [v2 dismissKeyboard];
}

- (void)resetPreviewPages
{
  id v2 = [(UIPrintPanelViewController *)self previewViewController];
  [v2 resetAllPages];
}

- (void)showGeneratingPDFProgressPanel
{
  if ([(UIPrintPanelViewController *)self quickLookPDFGenerationInProgress])
  {
    if (![(UIPrintPanelViewController *)self quickLookPDFGenerationCancelled])
    {
      id v3 = (void *)MEMORY[0x1E4FB1418];
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v5 = [v4 localizedStringForKey:@"Creating PDF" value:@"Creating PDF" table:@"Localizable"];
      id v6 = [v3 alertControllerWithTitle:v5 message:@"\n" preferredStyle:1];
      [(UIPrintPanelViewController *)self setPdfCreationProgressController:v6];

      int v7 = [(UIPrintPanelViewController *)self pdfCreationProgressController];
      double v8 = (void *)MEMORY[0x1E4FB1410];
      float v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v10 = [v9 localizedStringForKey:@"PRINT_INTERACTION_CANCEL_BUTTON" value:@"Cancel" table:@"Localizable"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __60__UIPrintPanelViewController_showGeneratingPDFProgressPanel__block_invoke;
      v18[3] = &unk_1E6DA1F68;
      v18[4] = self;
      float v11 = [v8 actionWithTitle:v10 style:1 handler:v18];
      [v7 addAction:v11];

      double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v12 startAnimating];
      v13 = [(UIPrintPanelViewController *)self pdfCreationProgressController];
      double v14 = [v13 view];

      [v14 addSubview:v12];
      double v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v14 attribute:9 multiplier:1.0 constant:0.0];
      [v14 addConstraint:v15];

      v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:0.0];
      [v14 addConstraint:v16];

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[UIPrintPanelViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
      v17 = [(UIPrintPanelViewController *)self pdfCreationProgressController];
      [(UIPrintPanelViewController *)self presentViewController:v17 animated:1 completion:0];
    }
  }
}

uint64_t __60__UIPrintPanelViewController_showGeneratingPDFProgressPanel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelQuickLookPDFGeneration];
}

- (void)showSharePanelForPDFURL:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UIPrintPanelViewController *)self createShareablePDFFileURL:v4];
  if (v5)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v6 = (void *)getUIActivityViewControllerClass_softClass;
    uint64_t v34 = getUIActivityViewControllerClass_softClass;
    if (!getUIActivityViewControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getUIActivityViewControllerClass_block_invoke;
      location[3] = &unk_1E6DA1878;
      location[4] = &v31;
      __getUIActivityViewControllerClass_block_invoke((uint64_t)location);
      id v6 = (void *)v32[3];
    }
    int v7 = v6;
    _Block_object_dispose(&v31, 8);
    id v8 = [v7 alloc];
    v35[0] = v5;
    float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    double v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];
    [(UIPrintPanelViewController *)self setActivityViewController:v10];

    float v11 = [(UIPrintPanelViewController *)self activityViewController];
    double v12 = [(UIPrintPanelViewController *)self printInfo];
    v13 = [v12 jobName];
    [v11 setValue:v13 forKey:@"subject"];

    double v14 = [(UIPrintPanelViewController *)self activityViewController];
    [v14 setExcludedActivityTypes:&unk_1F3CB1BE0];

    double v15 = [(UIPrintPanelViewController *)self printInteractionController];
    uint64_t v16 = [v15 isContentManaged];
    v17 = [(UIPrintPanelViewController *)self activityViewController];
    [v17 setIsContentManaged:v16];

    v18 = [MEMORY[0x1E4FB16C8] currentDevice];
    LOBYTE(v16) = [v18 userInterfaceIdiom] == 0;

    if ((v16 & 1) == 0)
    {
      char v19 = [(UIPrintPanelViewController *)self activityViewController];
      [v19 setModalPresentationStyle:7];

      v20 = [(UIPrintPanelViewController *)self activityViewController];
      v21 = [v20 popoverPresentationController];

      char v22 = [(UIPrintPanelViewController *)self shareButton];
      [v21 setBarButtonItem:v22];

      [v21 setPermittedArrowDirections:1];
    }
    objc_initWeak(location, self);
    id v23 = [(UIPrintPanelViewController *)self activityViewController];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __54__UIPrintPanelViewController_showSharePanelForPDFURL___block_invoke;
    id v28 = &unk_1E6DA1D78;
    objc_copyWeak(&v29, location);
    [v23 setCompletionWithItemsHandler:&v25];

    uint64_t v24 = [(UIPrintPanelViewController *)self activityViewController];
    [(UIPrintPanelViewController *)self presentViewController:v24 animated:1 completion:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }
}

void __54__UIPrintPanelViewController_showSharePanelForPDFURL___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setActivityViewController:0];
  if (a3) {
    [WeakRetained dismissPrintPanelWithAction:2 animated:1 completionHandler:0];
  }
}

- (void)shareButtonPress:(id)a3
{
  id v4 = a3;
  [(UIPrintPanelViewController *)self dismissKeyboard];
  [(UIPrintPanelViewController *)self performSelector:sel_showGeneratingPDFProgressPanel withObject:0 afterDelay:0.5];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__UIPrintPanelViewController_shareButtonPress___block_invoke;
  v5[3] = &unk_1E6DA1D50;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(UIPrintPanelViewController *)self generateQuickLookPDFWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__UIPrintPanelViewController_shareButtonPress___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {

    id v6 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UIPrintPanelViewController_shareButtonPress___block_invoke_2;
  v8[3] = &unk_1E6DA1F90;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  char v11 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
}

void __47__UIPrintPanelViewController_shareButtonPress___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained pdfCreationProgressController];

  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    [*(id *)(a1 + 32) progressPresentationTime];
    double v6 = v4 - v5;
    if (v6 >= 1.0) {
      [WeakRetained hideGeneratingPDFProgress:*(void *)(a1 + 40)];
    }
    else {
      [WeakRetained performSelector:sel_hideGeneratingPDFProgress_ withObject:*(void *)(a1 + 40) afterDelay:1.0 - v6];
    }
    goto LABEL_8;
  }
  id v7 = WeakRetained;
  if (*(void *)(a1 + 40) && !*(unsigned char *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "showSharePanelForPDFURL:");
LABEL_8:
    id v7 = WeakRetained;
  }
}

- (void)hideGeneratingPDFProgress:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPrintPanelViewController *)self pdfCreationProgressController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__UIPrintPanelViewController_hideGeneratingPDFProgress___block_invoke;
  v7[3] = &unk_1E6DA14F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __56__UIPrintPanelViewController_hideGeneratingPDFProgress___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setPdfCreationProgressController:0];
  if (*(void *)(a1 + 40))
  {
    double v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "showSharePanelForPDFURL:");
  }
  return result;
}

- (void)addPrintShareButtonsToNavItem:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"Print[Button]" value:@"Print" table:@"Localizable"];
  id v18 = (id)[v6 initWithTitle:v8 style:2 target:self action:sel_printButtonPressed_];

  id v9 = [(UIPrintPanelViewController *)self printInfo];
  id v10 = [v9 currentPrinter];
  [v18 setEnabled:v10 != 0];

  char v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_shareButtonPress_];
  [(UIPrintPanelViewController *)self setShareButton:v11];

  double v12 = [(UIPrintPanelViewController *)self printInteractionController];
  uint64_t v13 = [v12 preventPDFCreation] ^ 1;
  double v14 = [(UIPrintPanelViewController *)self shareButton];
  [v14 setEnabled:v13];

  double v15 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v16 = [(UIPrintPanelViewController *)self shareButton];
  v17 = objc_msgSend(v15, "arrayWithObjects:", v18, v16, 0);
  [v5 setRightBarButtonItems:v17];
}

- (void)addCanelButtonToNavItem:(id)a3
{
  id v15 = a3;
  id v4 = [(UIPrintPanelViewController *)self parentController];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
    [v15 setLeftBarButtonItem:v11];
    goto LABEL_11;
  }
  id v5 = [v4 viewControllers];
  if ((unint64_t)[v5 count] < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 2);
    id v7 = [v6 title];

    if (v7)
    {
      id v8 = [(UIPrintPanelViewController *)self printOptionsWidthConstraint];
      [v8 constant];
      double v10 = v9;

      char v11 = v7;
      if (v10 > 433.0) {
        goto LABEL_10;
      }
    }
  }
  double v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v11 = [v12 localizedStringForKey:@"Back" value:@"Back" table:@"Localizable"];

LABEL_10:
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v11 style:0 target:self action:sel_backButtonPressed_];
  [v15 setLeftBarButtonItem:v13];

  double v14 = [v15 leftBarButtonItem];
  [v14 _setShowsBackButtonIndicator:1];

LABEL_11:
}

- (void)setPrinter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _internalPrinter];
  _UIPrinterInfoCancelRequest(v5);
  id v6 = [(UIPrintPanelViewController *)self printInteractionController];
  [v6 setPrinter:v5];

  id v7 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  [v7 setCurrentPrinter:v4];

  id v8 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
  double v9 = v8;
  if (v4)
  {
    [v8 setShowContactingPrinter:1];

    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = v5;
    double v10 = (void *)v28[5];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __41__UIPrintPanelViewController_setPrinter___block_invoke;
    v26[3] = &unk_1E6DA1FB8;
    v26[4] = self;
    v26[5] = &v27;
    _UIPrintInfoPrinterLookup(v10, v26);
    char v11 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
    [v11 setShowingGatheringPrinterInfo:1];

    double v12 = [v4 _internalPrinter];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __41__UIPrintPanelViewController_setPrinter___block_invoke_2;
    v25[3] = &unk_1E6DA1608;
    v25[4] = self;
    int State = _UIPrinterInfoGetState(v12, v25);

    if (State)
    {
      double v14 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
      [v14 setShowingGatheringPrinterInfo:0];
      if (State == 1)
      {

        id v15 = [v4 _internalPrinter];
        uint64_t v16 = [v15 printInfoSupported];
        v17 = [(UIPrintPanelViewController *)self printInfo];
        id v18 = [v17 currentPrinter];
        [v18 setPrinterInfoDict:v16];

        double v14 = [(UIPrintPanelViewController *)self printInteractionController];
        char v19 = [v14 paper];
        v20 = [(UIPrintPanelViewController *)self printInfo];
        [v20 setPrintPaper:v19];
      }
    }
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    [v8 setShowContactingPrinter:0];
  }
  v21 = [(UIPrintPanelViewController *)self printOptionsNavController];
  char v22 = [v21 topViewController];
  id v23 = [v22 navigationItem];
  uint64_t v24 = [v23 rightBarButtonItem];
  [v24 setEnabled:v4 != 0];
}

void __41__UIPrintPanelViewController_setPrinter___block_invoke(uint64_t a1, char a2)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [*(id *)(a1 + 32) printInfo];
  id v6 = [v5 currentPrinter];
  id v7 = [v6 _internalPrinter];

  if (v4 == v7)
  {
    id v8 = *(void **)(a1 + 32);
    if (a2)
    {
      id v11 = [v8 printOptionsTableViewController];
      [v11 setShowContactingPrinter:0];
    }
    else
    {
      double v9 = [v8 printInfo];
      [v9 setCurrentPrinter:0];

      [*(id *)(a1 + 32) setLastUsedPrinterIndex:0];
      double v10 = *(void **)(a1 + 32);
      [v10 lookupLastUsedPrinter];
    }
  }
}

void __41__UIPrintPanelViewController_setPrinter___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id v5 = [*(id *)(a1 + 32) printOptionsTableViewController];
  [v5 setShowingGatheringPrinterInfo:0];

  id v6 = [*(id *)(a1 + 32) printInfo];
  id v7 = v6;
  if (a2 == 2)
  {
    [v6 setCurrentPrinter:0];
  }
  else
  {
    id v8 = [v6 currentPrinter];
    [v8 setPrinterInfoDict:v11];

    id v7 = [*(id *)(a1 + 32) printInteractionController];
    double v9 = [v7 _updatePrintPaper];
    double v10 = [*(id *)(a1 + 32) printInfo];
    [v10 setPrintPaper:v9];
  }
}

- (void)lookupLastUsedPrinter
{
  double v3 = [(UIPrintPanelViewController *)self lastUsedPrinterArray];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F932E0] lastUsedPrinters];
    [(UIPrintPanelViewController *)self setLastUsedPrinterArray:v4];
  }
  if ([(UIPrintPanelViewController *)self lastUsedPrinterIndex] <= 2)
  {
    id v5 = [(UIPrintPanelViewController *)self lastUsedPrinterArray];
    unint64_t v6 = [v5 count];
    unint64_t v7 = [(UIPrintPanelViewController *)self lastUsedPrinterIndex];

    if (v6 > v7)
    {
      lookupPrinterQueue = self->_lookupPrinterQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke;
      block[3] = &unk_1E6DA1408;
      block[4] = self;
      dispatch_async(lookupPrinterQueue, block);
    }
  }
}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastUsedPrinterArray];
  double v3 = objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex"));

  id v4 = [v3 objectForKey:*MEMORY[0x1E4F93460]];
  id v5 = [v3 objectForKey:*MEMORY[0x1E4F93320]];
  unint64_t v6 = [MEMORY[0x1E4F932F8] printerWithName:v4];
  unint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_2;
    v9[3] = &unk_1E6DA2008;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = v4;
    id v12 = v5;
    _UIPrintInfoPrinterLookup(v8, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastUsedPrinterIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex") + 1);
    [*(id *)(a1 + 32) lookupLastUsedPrinter];
  }
}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = [*(id *)(a1 + 32) printInfo];
    id v4 = [v3 currentPrinter];

    if (!v4)
    {
      id v5 = [[UIPrinter alloc] _initWithPrinter:*(void *)(a1 + 40)];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_3;
      v8[3] = &unk_1E6DA1FE0;
      v8[4] = *(void *)(a1 + 32);
      id v9 = v5;
      id v10 = *(id *)(a1 + 48);
      id v11 = *(id *)(a1 + 56);
      id v6 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastUsedPrinterIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex") + 1);
    unint64_t v7 = *(void **)(a1 + 32);
    [v7 lookupLastUsedPrinter];
  }
}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) printInfo];
  [v3 setCurrentPrinter:v2];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) printInfo];
  [v5 setPrinterID:v4];

  id v6 = *(void **)(a1 + 56);
  if (v6)
  {
    if ((([v6 isEqualToString:*MEMORY[0x1E4F93328]] & 1) != 0
       || [*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F93338]])
      && ([*(id *)(a1 + 32) printInfo],
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 duplex],
          v7,
          !v8))
    {
      id v9 = [*(id *)(a1 + 32) printInfo];
      id v11 = v9;
      uint64_t v10 = 1;
    }
    else
    {
      if (![*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F93330]]) {
        return;
      }
      id v9 = [*(id *)(a1 + 32) printInfo];
      id v11 = v9;
      uint64_t v10 = 0;
    }
    [v9 setDuplex:v10];
  }
}

- (void)printNavigationConrollerDidDismiss
{
  if (![(UIPrintPanelViewController *)self dismissed])
  {
    double v3 = [(UIPrintPanelViewController *)self printInteractionController];
    [v3 _printPanelWillDismissWithAction:0];

    [(UIPrintPanelViewController *)self setDismissed:1];
    _UIPrinterInfoCancelRequests();
    uint64_t v4 = [(UIPrintPanelViewController *)self printOptionsNavController];
    id v5 = [v4 topViewController];
    id v6 = [(UIPrintPanelViewController *)self printOptionsTableViewController];

    if (v5 != v6)
    {
      unint64_t v7 = [(UIPrintPanelViewController *)self printOptionsNavController];
      uint64_t v8 = [(UIPrintPanelViewController *)self printOptionsTableViewController];
      id v9 = (id)[v7 popToViewController:v8 animated:0];
    }
    uint64_t v10 = [(UIPrintPanelViewController *)self printPanelWindow];

    if (v10)
    {
      id v11 = [(UIPrintPanelViewController *)self printPanelWindow];
      [v11 setHidden:1];
    }
    id v12 = [(UIPrintPanelViewController *)self printInteractionController];
    [v12 _printPanelDidDismissWithAction:0];

    [(UIPrintPanelViewController *)self setPrintPanelNavigationController:0];
  }
}

- (void)printPanelDidDisappear
{
  if (![(UIPrintPanelViewController *)self dismissed])
  {
    double v3 = [(UIPrintPanelViewController *)self parentController];
    if (v3)
    {
      id v10 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v4 = v10;
      }
      else {
        uint64_t v4 = 0;
      }
      id v5 = v4;
      id v6 = [v5 topViewController];

      if (v6 == self)
      {
        [(UIPrintPanelViewController *)self dismissPrintPanelWithAction:0 animated:0 completionHandler:0];
      }
      else
      {
        unint64_t v7 = [v5 viewControllers];
        uint64_t v8 = [(UIPrintPanelViewController *)self printPanelNavigationController];
        char v9 = [v7 containsObject:v8];

        if ((v9 & 1) == 0) {
          [(UIPrintPanelViewController *)self printNavigationConrollerDidDismiss];
        }
      }

      double v3 = v10;
    }
  }
}

- (BOOL)shouldShowPageRange
{
  uint64_t v2 = [(UIPrintPanelViewController *)self printInteractionController];
  char v3 = [v2 _canShowPageRange];

  return v3;
}

- (BOOL)shouldShowDuplex
{
  uint64_t v2 = [(UIPrintPanelViewController *)self printInteractionController];
  char v3 = [v2 _canShowDuplex];

  return v3;
}

- (BOOL)shouldShowOrientation
{
  uint64_t v2 = [(UIPrintPanelViewController *)self printInteractionController];
  char v3 = [v2 _canShowOrientation];

  return v3;
}

- (BOOL)shouldShowScaling
{
  uint64_t v2 = [(UIPrintPanelViewController *)self printInteractionController];
  char v3 = [v2 _canShowScaling];

  return v3;
}

- (BOOL)shouldShowLayout
{
  uint64_t v2 = [(UIPrintPanelViewController *)self printInteractionController];
  char v3 = [v2 _canShowLayout];

  return v3;
}

- (void)startPrinting
{
  char v3 = [(UIPrintPanelViewController *)self printInfo];
  uint64_t v4 = [v3 currentPrinter];
  id v5 = [v4 _printerID];
  id v6 = [(UIPrintPanelViewController *)self printInteractionController];
  unint64_t v7 = [v6 _currentPrintInfo];
  [v7 setPrinterID:v5];

  [(UIPrintPanelViewController *)self dismissPrintPanelWithAction:1 animated:1 completionHandler:0];
}

- (void)cancelPrinting
{
}

- (CGSize)preferredSizeForScene:(id)a3
{
  uint64_t v4 = [a3 screen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  float v9 = v6 * 0.66667;
  double v10 = floorf(v9);
  id v11 = [(UIPrintPanelViewController *)self view];
  [v11 frame];
  double v13 = v12;

  if (v13 >= v8) {
    double v14 = v13;
  }
  else {
    double v14 = v8;
  }
  double v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)_presentInParentAnimated:(BOOL)a3 hostingScene:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(UIPrintPanelViewController *)self parentController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke;
  v20[3] = &unk_1E6DA1408;
  v20[4] = self;
  double v8 = (void *)MEMORY[0x1E4E4C3C0](v20);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v9 = [(UIPrintPanelViewController *)self parentController];
    double v10 = [v9 view];
    [v10 frame];
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v12);

    [v7 pushViewController:self animated:v4];
    double v13 = [(UIPrintPanelViewController *)self transitionCoordinator];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke_2;
    id v18 = &unk_1E6DA2030;
    id v19 = v8;
    double v14 = (void *)MEMORY[0x1E4E4C3C0](&v15);
    objc_msgSend(v13, "animateAlongsideTransition:completion:", &__block_literal_global_4, v14, v15, v16, v17, v18);
  }
  else
  {
    [(UIPrintPanelViewController *)self preferredSizeForScene:v6];
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    double v13 = [(UIPrintPanelViewController *)self printPanelNavigationController];
    if (v4) {
      [v7 presentViewController:v13 withTransition:3 completion:v8];
    }
    else {
      [v7 presentViewController:v13 animated:0 completion:v8];
    }
  }
}

void __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) printInteractionController];
  [v1 _printPanelDidPresent];
}

uint64_t __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentPrintPanelAnimated:(BOOL)a3 hostingScene:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(UIPrintPanelViewController *)self parentController];

  if (!v7)
  {
    [(UIPrintPanelViewController *)self preferredSizeForScene:v6];
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    double v12 = [MEMORY[0x1E4F28B50] mainBundle];
    double v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v13 userInterfaceIdiom] == 1)
    {
      double v14 = [v12 bundleIdentifier];
      int v15 = [v14 isEqualToString:@"com.apple.mobileslideshow"];

      if (v15)
      {
        uint64_t v16 = [[UIPrintPanelWindow alloc] initWithWindowScene:v6];
        [(UIPrintPanelViewController *)self setPrintPanelWindow:v16];

        double v17 = *MEMORY[0x1E4FB2850];
        id v18 = [(UIPrintPanelViewController *)self printPanelWindow];
        [v18 setWindowLevel:v17];

        id v19 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
        id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        v21 = [(UIPrintPanelViewController *)self printPanelWindow];
        [v21 frame];
        char v22 = objc_msgSend(v20, "initWithFrame:");

        [v19 setView:v22];
        id v23 = [(UIPrintPanelViewController *)self printPanelWindow];
        [v23 setRootViewController:v19];

        uint64_t v24 = [(UIPrintPanelViewController *)self printPanelWindow];
        [v24 addSubview:v22];

        uint64_t v25 = [(UIPrintPanelViewController *)self printPanelWindow];
        [v25 makeKeyAndVisible];

        [(UIPrintPanelViewController *)self setAnimated:v4];
        uint64_t v26 = [(UIPrintPanelViewController *)self printPanelNavigationController];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke;
        v32[3] = &unk_1E6DA1408;
        v32[4] = self;
        [v19 presentViewController:v26 withTransition:3 completion:v32];

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v27 = [v6 keyWindow];
    id v28 = [v27 rootViewController];

    uint64_t v29 = [v28 presentedViewController];

    if (v29)
    {
      do
      {
        id v19 = [v28 presentedViewController];

        v30 = [v19 presentedViewController];

        id v28 = v19;
      }
      while (v30);
    }
    else
    {
      id v19 = v28;
    }
    char v22 = [(UIPrintPanelViewController *)self printPanelNavigationController];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke_2;
    v31[3] = &unk_1E6DA1408;
    v31[4] = self;
    [v19 presentViewController:v22 animated:v4 completion:v31];
    goto LABEL_12;
  }
  double v8 = [(UIPrintPanelViewController *)self parentController];
  float v9 = [v8 view];
  [v9 frame];
  -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v11);

  [(UIPrintPanelViewController *)self _presentInParentAnimated:v4 hostingScene:v6];
LABEL_13:
}

void __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) printInteractionController];
  [v1 _printPanelDidPresent];
}

void __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) printInteractionController];
  [v1 _printPanelDidPresent];
}

- (void)presentPrintPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v23 = a4;
  double v11 = [(UIPrintPanelViewController *)self printInteractionController];
  double v12 = [v11 hostingWindowScene];

  double v13 = [(UIPrintPanelViewController *)self printInteractionController];
  int v14 = [v13 _canPreviewContent];

  if (v14)
  {
    [(UIPrintPanelViewController *)self presentPrintPanelAnimated:v5 hostingScene:v12];
  }
  else
  {
    int v15 = [(UIPrintPanelViewController *)self parentController];

    if (v15)
    {
      [(UIPrintPanelViewController *)self _presentInParentAnimated:v5 hostingScene:v12];
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB1AF8]);
      double v17 = [(UIPrintPanelViewController *)self printPanelNavigationController];
      id v18 = (void *)[v16 initWithContentViewController:v17];
      [(UIPrintPanelViewController *)self setPoverController:v18];

      id v19 = [(UIPrintPanelViewController *)self poverController];
      [v19 setDelegate:self];

      id v20 = [(UIPrintPanelViewController *)self poverController];
      objc_msgSend(v20, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v23, 15, v5, x, y, width, height);

      v21 = [(UIPrintPanelViewController *)self printInteractionController];
      char v22 = v21;
      if (v5) {
        [v21 performSelector:sel__printPanelDidPresent withObject:0 afterDelay:0.35];
      }
      else {
        [v21 _printPanelDidPresent];
      }
    }
  }
}

- (void)presentPrintPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  id v6 = [(UIPrintPanelViewController *)self printInteractionController];
  double v7 = [v6 hostingWindowScene];

  double v8 = [(UIPrintPanelViewController *)self printInteractionController];
  int v9 = [v8 _canPreviewContent];

  if (v9)
  {
    [(UIPrintPanelViewController *)self presentPrintPanelAnimated:v4 hostingScene:v7];
  }
  else
  {
    double v10 = [(UIPrintPanelViewController *)self parentController];

    if (v10)
    {
      [(UIPrintPanelViewController *)self _presentInParentAnimated:v4 hostingScene:v7];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB1AF8]);
      double v12 = [(UIPrintPanelViewController *)self printPanelNavigationController];
      double v13 = (void *)[v11 initWithContentViewController:v12];
      [(UIPrintPanelViewController *)self setPoverController:v13];

      int v14 = [(UIPrintPanelViewController *)self poverController];
      [v14 setDelegate:self];

      int v15 = [(UIPrintPanelViewController *)self poverController];
      [v15 presentPopoverFromBarButtonItem:v18 permittedArrowDirections:15 animated:v4];

      id v16 = [(UIPrintPanelViewController *)self printInteractionController];
      double v17 = v16;
      if (v4) {
        [v16 performSelector:sel__printPanelDidPresent withObject:0 afterDelay:0.35];
      }
      else {
        [v16 _printPanelDidPresent];
      }
    }
  }
}

- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  int v9 = [(UIPrintPanelViewController *)self printInteractionController];
  [v9 _printPanelWillDismissWithAction:a3];

  [(UIPrintPanelViewController *)self setDismissed:1];
  _UIPrinterInfoCancelRequests();
  double v10 = [(UIPrintPanelViewController *)self parentController];

  if (v10)
  {
    id v11 = [(UIPrintPanelViewController *)self parentController];
    double v12 = [(UIPrintPanelViewController *)self printInteractionController];
    double v13 = [v12 printActivityDelegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int v14 = [(UIPrintPanelViewController *)self printInteractionController];
        int v15 = [v13 shouldDismissParentViewController:v14];

LABEL_22:
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_3;
        v31[3] = &unk_1E6DA2078;
        v31[4] = self;
        int64_t v33 = a3;
        id v32 = v8;
        uint64_t v29 = (void (**)(void))MEMORY[0x1E4E4C3C0](v31);
        if (v15)
        {
          [v11 dismissViewControllerAnimated:v5 completion:v29];
        }
        else
        {
          id v30 = (id)[v11 popViewControllerAnimated:v5];
          v29[2](v29);
        }

        goto LABEL_26;
      }
      id v23 = [v11 _popoverController];
      if (v23)
      {

LABEL_21:
        int v15 = 0;
        goto LABEL_22;
      }
      uint64_t v27 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v28 = [v27 userInterfaceIdiom];

      if (!v28) {
        goto LABEL_21;
      }
    }
    int v15 = 1;
    goto LABEL_22;
  }
  id v16 = [(UIPrintPanelViewController *)self printPanelNavigationController];

  double v17 = [(UIPrintPanelViewController *)self printPanelWindow];
  id v18 = v17;
  if (v16)
  {

    if (v18)
    {
      if (v5) {
        uint64_t v19 = 7;
      }
      else {
        uint64_t v19 = 0;
      }
      id v20 = [(UIPrintPanelViewController *)self printPanelNavigationController];
      v21 = [v20 presentingViewController];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke;
      v37[3] = &unk_1E6DA2078;
      v37[4] = self;
      int64_t v39 = a3;
      v38 = v8;
      [v21 dismissViewControllerWithTransition:v19 completion:v37];

      char v22 = v38;
    }
    else
    {
      uint64_t v25 = [(UIPrintPanelViewController *)self printPanelNavigationController];
      uint64_t v26 = [v25 presentingViewController];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_2;
      v34[3] = &unk_1E6DA2078;
      v34[4] = self;
      int64_t v36 = a3;
      v35 = v8;
      [v26 dismissViewControllerAnimated:v5 completion:v34];

      char v22 = v35;
    }
  }
  else
  {
    [v17 setHidden:1];

    uint64_t v24 = [(UIPrintPanelViewController *)self printInteractionController];
    [v24 _printPanelDidDismissWithAction:a3];

    if (v8) {
      v8[2](v8);
    }
    [(UIPrintPanelViewController *)self setPrintInteractionController:0];
  }
LABEL_26:
}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) printPanelWindow];
  [v2 setHidden:1];

  char v3 = [*(id *)(a1 + 32) printInteractionController];
  [v3 _printPanelDidDismissWithAction:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setPrintPanelNavigationController:0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  BOOL v5 = *(void **)(a1 + 32);
  return [v5 setPrintInteractionController:0];
}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) printInteractionController];
  [v2 _printPanelDidDismissWithAction:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setPrintPanelNavigationController:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setPrintInteractionController:0];
}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) printInteractionController];
  [v2 _printPanelDidDismissWithAction:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setPrintInteractionController:0];
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)generateQuickLookPDFWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (![(UIPrintPanelViewController *)self quickLookPDFGenerationInProgress])
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E6DA19F0;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    BOOL v5 = (void *)MEMORY[0x1E4E4C3C0](v7);
    [(UIPrintPanelViewController *)self setQuickLookPDFGenerationInProgress:1];
    [(UIPrintPanelViewController *)self setQuickLookPDFGenerationCancelled:0];
    id v6 = [(UIPrintPanelViewController *)self previewViewController];
    [v6 performThumbnailDispatchBlock:v5];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained quickLookPDFGenerationCancelled] & 1) == 0)
  {
    id v4 = [WeakRetained printInteractionController];
    [v4 _cancelAllPreviewGeneration];

    BOOL v5 = [WeakRetained printInteractionController];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke_2;
    double v13 = &unk_1E6DA20A0;
    id v14 = WeakRetained;
    id v6 = v2;
    int v15 = v6;
    [v5 _generatePDFWithCompletionHandler:&v10];

    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v6, v7);
    objc_msgSend(WeakRetained, "setQuickLookPDFGenerationInProgress:", 0, v10, v11, v12, v13, v14);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = [WeakRetained quickLookPDFURL];
      (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, [WeakRetained quickLookPDFGenerationCancelled]);
    }
  }
}

void __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v14 = a2;
  if ((a3 & 1) == 0)
  {
    BOOL v5 = [*(id *)(a1 + 32) printInfo];
    if ([v5 nUpActive])
    {
LABEL_7:

LABEL_8:
      uint64_t v8 = [*(id *)(a1 + 32) printInfo];
      id v9 = [*(id *)(a1 + 32) printInfo];
      uint64_t v10 = [v9 printPaper];
      uint64_t v11 = redrawPDFWithNUp(v14, v8, v10);
      [*(id *)(a1 + 32) setQuickLookPDFURL:v11];

      goto LABEL_9;
    }
    id v6 = [*(id *)(a1 + 32) printInfo];
    if ([v6 borderType])
    {
LABEL_6:

      goto LABEL_7;
    }
    dispatch_time_t v7 = [*(id *)(a1 + 32) printInfo];
    if ([v7 bookletStyle] >= 1)
    {

      goto LABEL_6;
    }
    double v12 = [*(id *)(a1 + 32) printInfo];
    char v13 = [v12 flipHorizontal];

    if (v13) {
      goto LABEL_8;
    }
    [*(id *)(a1 + 32) setQuickLookPDFURL:v14];
  }
LABEL_9:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)cancelQuickLookPDFGeneration
{
  uint64_t v3 = [(UIPrintPanelViewController *)self printInteractionController];
  [v3 _cancelAllPreviewGeneration];

  [(UIPrintPanelViewController *)self setQuickLookPDFGenerationCancelled:1];
  [(UIPrintPanelViewController *)self setQuickLookPDFGenerationInProgress:0];
  id v4 = [(UIPrintPanelViewController *)self pdfCreationProgressController];

  if (v4)
  {
    id v5 = [(UIPrintPanelViewController *)self pdfCreationProgressController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)shareableURLForPreviewing
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIPrintPanelViewController *)self printInfo];
  id v4 = [v3 jobName];
  id v5 = [v4 stringByStandardizingPath];

  if (!v5 || ![v5 length])
  {
    uint64_t v6 = GetDefaultJobName();

    id v5 = (void *)v6;
  }
  dispatch_time_t v7 = [v5 stringByReplacingOccurrencesOfString:@":" withString:@"-"];
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  if ((unint64_t)[v8 length] >= 0x51)
  {
    uint64_t v9 = [v8 substringToIndex:80];

    uint64_t v8 = (void *)v9;
  }
  uint64_t v10 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];

  if (!v10)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    uuid_unparse(out, v24);
    id v16 = NSString;
    double v17 = NSTemporaryDirectory();
    id v18 = [NSString stringWithUTF8String:v24];
    uint64_t v19 = [v16 stringWithFormat:@"%@/PrintPreviewPDF/%@", v17, v18];
    [(UIPrintPanelViewController *)self setShareablePDFDirectoryPath:v19];

    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v21 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];
    id v23 = 0;
    [v20 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v11 = v23;

    if (v11) {
      goto LABEL_10;
    }
  }
  id v11 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];

  if (v11)
  {
    double v12 = NSString;
    char v13 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];
    id v14 = [v12 stringWithFormat:@"%@/%@.pdf", v13, v8];

    int v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];

    id v11 = 0;
  }
  else
  {
LABEL_10:
    int v15 = 0;
  }

  return v15;
}

- (id)createShareablePDFFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIPrintPanelViewController *)self shareableURLForPreviewing];
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    dispatch_time_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtURL:v6 error:0];
    id v15 = 0;
    char v8 = [v7 linkItemAtURL:v4 toURL:v6 error:&v15];
    id v9 = v15;
    uint64_t v10 = v9;
    if ((v8 & 1) == 0)
    {

      id v14 = 0;
      char v11 = [v7 copyItemAtURL:v4 toURL:v6 error:&v14];
      id v12 = v14;
      uint64_t v10 = v12;
      if ((v11 & 1) == 0)
      {
        NSLog(&cfstr_Uiprintpanelvi.isa, v12);

        uint64_t v6 = 0;
      }
    }
  }
  return v6;
}

- (void)removeShareablePDFFiles
{
  uint64_t v3 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];

  if (v3)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      dispatch_time_t v7 = [(UIPrintPanelViewController *)self shareablePDFDirectoryPath];
      id v10 = 0;
      char v8 = [v4 removeItemAtPath:v7 error:&v10];
      id v9 = v10;

      if ((v8 & 1) == 0) {
        NSLog(&cfstr_Uiprintpreview_1.isa, v9);
      }
    }
    [(UIPrintPanelViewController *)self setShareablePDFDirectoryPath:0];
  }
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (UIPrintPanelNavigationController)printOptionsNavController
{
  return self->_printOptionsNavController;
}

- (void)setPrintOptionsNavController:(id)a3
{
}

- (UITableView)printOptionsTableView
{
  return self->_printOptionsTableView;
}

- (void)setPrintOptionsTableView:(id)a3
{
}

- (UIPrintInteractionController)printInteractionController
{
  return self->_printInteractionController;
}

- (void)setPrintInteractionController:(id)a3
{
}

- (UIPrintPanelWindow)printPanelWindow
{
  return self->_printPanelWindow;
}

- (void)setPrintPanelWindow:(id)a3
{
}

- (UIPrintPanelNavigationController)printPanelNavigationController
{
  return self->_printPanelNavigationController;
}

- (void)setPrintPanelNavigationController:(id)a3
{
}

- (UIViewController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (UIView)previewSeparatorView
{
  return self->_previewSeparatorView;
}

- (void)setPreviewSeparatorView:(id)a3
{
}

- (UIBarButtonItem)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (UIPrintPreviewViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (UIView)previewPanelView
{
  return self->_previewPanelView;
}

- (void)setPreviewPanelView:(id)a3
{
}

- (NSLayoutConstraint)previewHeightConstraint
{
  return self->_previewHeightConstraint;
}

- (void)setPreviewHeightConstraint:(id)a3
{
}

- (UIPrintOptionsTableViewController)printOptionsTableViewController
{
  return self->_printOptionsTableViewController;
}

- (void)setPrintOptionsTableViewController:(id)a3
{
}

- (NSLayoutConstraint)printOptionsWidthConstraint
{
  return self->_printOptionsWidthConstraint;
}

- (void)setPrintOptionsWidthConstraint:(id)a3
{
}

- (int64_t)lastUsedPrinterIndex
{
  return self->_lastUsedPrinterIndex;
}

- (void)setLastUsedPrinterIndex:(int64_t)a3
{
  self->_lastUsedPrinterIndedouble x = a3;
}

- (NSArray)lastUsedPrinterArray
{
  return (NSArray *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setLastUsedPrinterArray:(id)a3
{
}

- (NSArray)vertScrollPrintPanelConstraints
{
  return self->_vertScrollPrintPanelConstraints;
}

- (void)setVertScrollPrintPanelConstraints:(id)a3
{
}

- (NSArray)horizScrollPrintPanelConstraints
{
  return self->_horizScrollPrintPanelConstraints;
}

- (void)setHorizScrollPrintPanelConstraints:(id)a3
{
}

- (UIPopoverController)poverController
{
  return self->_poverController;
}

- (void)setPoverController:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (NSURL)quickLookPDFURL
{
  return (NSURL *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setQuickLookPDFURL:(id)a3
{
}

- (NSString)shareablePDFDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setShareablePDFDirectoryPath:(id)a3
{
}

- (UIAlertController)pdfCreationProgressController
{
  return (UIAlertController *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setPdfCreationProgressController:(id)a3
{
}

- (BOOL)quickLookPDFGenerationInProgress
{
  return self->_quickLookPDFGenerationInProgress;
}

- (void)setQuickLookPDFGenerationInProgress:(BOOL)a3
{
  self->_quickLookPDFGenerationInProgress = a3;
}

- (BOOL)quickLookPDFGenerationCancelled
{
  return self->_quickLookPDFGenerationCancelled;
}

- (void)setQuickLookPDFGenerationCancelled:(BOOL)a3
{
  self->_quickLookPDFGenerationCancelled = a3;
}

- (double)progressPresentationTime
{
  return self->_progressPresentationTime;
}

- (void)setProgressPresentationTime:(double)a3
{
  self->_progressPresentationTime = a3;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_pdfCreationProgressController, 0);
  objc_storeStrong((id *)&self->_shareablePDFDirectoryPath, 0);
  objc_storeStrong((id *)&self->_quickLookPDFURL, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_poverController, 0);
  objc_storeStrong((id *)&self->_horizScrollPrintPanelConstraints, 0);
  objc_storeStrong((id *)&self->_vertScrollPrintPanelConstraints, 0);
  objc_storeStrong((id *)&self->_lastUsedPrinterArray, 0);
  objc_storeStrong((id *)&self->_printOptionsWidthConstraint, 0);
  objc_storeStrong((id *)&self->_printOptionsTableViewController, 0);
  objc_storeStrong((id *)&self->_previewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_previewPanelView, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_previewSeparatorView, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_printPanelNavigationController, 0);
  objc_storeStrong((id *)&self->_printPanelWindow, 0);
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_printOptionsTableView, 0);
  objc_storeStrong((id *)&self->_printOptionsNavController, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_lookupPrinterQueue, 0);
}

@end