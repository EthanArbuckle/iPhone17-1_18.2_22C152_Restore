@interface _TVStackCommonTemplateController
- (BOOL)_backgroundImageRequiresBlur;
- (BOOL)_isBackdropNeeded;
- (BOOL)_shouldLoadBackgroundImageAsynchronously;
- (BOOL)_updateSupplementaryViewControllersWithElements:(id)a3 updateStyles:(BOOL)a4;
- (BOOL)automaticallyAdjustsScrollViewInsets;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (CGSize)_backgroundImageProxySize;
- (IKAudioElement)audioElement;
- (IKImageElement)bgImgElement;
- (IKImageElement)heroImgElement;
- (IKImageElement)uberImgElement;
- (IKMediaContentElement)bgMediaContentElement;
- (IKViewElement)backgroundElement;
- (IKViewElement)collectionListElement;
- (IKViewElement)viewElement;
- (NSArray)supplementaryViewControllers;
- (TVMediaInfo)selectedMediaInfo;
- (TVMediaPlaying)mediaPlayer;
- (TVObservableEventController)observableEventController;
- (UIImage)bgImage;
- (UIViewController)focusedSupplementaryViewController;
- (_TVStackCollectionView)collectionView;
- (id)_backgroundImageProxy;
- (id)_flowLayout;
- (id)_modalPresenterPresentedViewController;
- (id)_overlayView;
- (id)_preferredFocusedSupplementaryView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)parsedMediaInfo;
- (id)preferredFocusEnvironments;
- (id)viewControllerWithElement:(id)a3 layout:(id)a4 existingController:(id)a5;
- (int64_t)_blurEffectStyle;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancelImpressionsUpdate;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)_disableScrollingIfNecessary:(id)a3;
- (void)_dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4;
- (void)_mediaPlayerStateDidChange;
- (void)_recordImpressionsForVisibleView;
- (void)_updateBackgroundViews;
- (void)_updateImpressions;
- (void)_updateViewLayout;
- (void)_updateViewOverlay;
- (void)_updateViewSupplementaryViews;
- (void)addObserver:(id)a3 forEvent:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5;
- (void)loadView;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forEvent:(id)a4;
- (void)scrollToTop;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAudioElement:(id)a3;
- (void)setBackgroundElement:(id)a3;
- (void)setBgImage:(id)a3;
- (void)setBgImgElement:(id)a3;
- (void)setBgMediaContentElement:(id)a3;
- (void)setCollectionListElement:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setFocusedSupplementaryViewController:(id)a3;
- (void)setHeroImgElement:(id)a3;
- (void)setMediaPlayer:(id)a3;
- (void)setSelectedMediaInfo:(id)a3;
- (void)setSupplementaryViewControllers:(id)a3;
- (void)setUberImgElement:(id)a3;
- (void)setViewElement:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundAndBackdrop;
- (void)updateBackgroundAndBackdropMaskFactor;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation _TVStackCommonTemplateController

- (void)dealloc
{
  v3 = [(_TVStackCommonTemplateController *)self collectionView];
  [v3 setDataSource:0];

  v4 = [(_TVStackCommonTemplateController *)self collectionView];
  [v4 setDelegate:0];

  v5 = [(_TVStackCommonTemplateController *)self viewElement];
  v6 = [v5 appDocument];
  v7 = +[TVTemplateFeaturesManager featuresManagerForAppDocument:v6];

  [v7 popContext:self forFeature:&unk_26E5E0118];
  [(_TVStackCommonTemplateController *)self setMediaPlayer:0];

  v8.receiver = self;
  v8.super_class = (Class)_TVStackCommonTemplateController;
  [(_TVBgImageLoadingViewController *)&v8 dealloc];
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)_TVStackCommonTemplateController;
  [(_TVBgImageLoadingViewController *)&v94 updateWithViewElement:v4];
  v57 = [MEMORY[0x263EFF980] array];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v55 = v4;
  obuint64_t j = [v4 children];
  uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v64)
  {
    v71 = 0;
    v5 = 0;
    id v6 = 0;
    unint64_t v7 = 0;
    id v8 = 0;
    v9 = 0;
    id v62 = 0;
    uint64_t v63 = *(void *)v91;
    int v10 = 1;
    v56 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v91 != v63)
        {
          uint64_t v12 = v11;
          objc_enumerationMutation(obj);
          uint64_t v11 = v12;
        }
        uint64_t v65 = v11;
        id v68 = *(id *)(*((void *)&v90 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v68, "tv_elementType", v54);
        if (v13 == 10)
        {
          id v25 = v68;

          int v10 = 0;
          id v62 = v25;
        }
        else if (v13 == 4)
        {
          int v60 = v10;
          id v14 = v68;

          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v59 = v14;
          id v69 = [v14 children];
          uint64_t v15 = [v69 countByEnumeratingWithState:&v86 objects:v98 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v87;
            do
            {
              uint64_t v18 = 0;
              uint64_t v66 = v16;
              do
              {
                if (*(void *)v87 != v17) {
                  objc_enumerationMutation(v69);
                }
                v19 = *(void **)(*((void *)&v86 + 1) + 8 * v18);
                if (!v7
                  && objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * v18), "tv_elementType") == 16
                  && objc_msgSend(v19, "tv_imageType") == 3)
                {
                  unint64_t v7 = v19;
                }
                else if (v6 || objc_msgSend(v19, "tv_elementType") != 16)
                {
                  if (objc_msgSend(v19, "tv_elementType") == 35)
                  {
                    id v72 = v6;
                    id v20 = v19;
                    v21 = [v20 children];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      overlayView = self->_overlayView;
                    }
                    else {
                      overlayView = 0;
                    }
                    uint64_t v23 = +[TVMLViewFactory organizerViewWithElements:v21 existingView:overlayView];

                    v71 = (void *)v23;
                    id v6 = v72;
                    uint64_t v16 = v66;
                  }
                  else if (!v8)
                  {
                    if (objc_msgSend(v19, "tv_elementType") == 81) {
                      id v8 = v19;
                    }
                    else {
                      id v8 = 0;
                    }
                  }
                }
                else
                {
                  id v6 = v19;
                }
                ++v18;
              }
              while (v16 != v18);
              uint64_t v24 = [v69 countByEnumeratingWithState:&v86 objects:v98 count:16];
              uint64_t v16 = v24;
            }
            while (v24);
          }

          v9 = v59;
          int v10 = v60;
        }
        else if (v10)
        {
          id v26 = v68;
          if (objc_msgSend(v68, "tv_elementType") == 12)
          {
            id v61 = v8;
            v67 = v9;
            id v73 = v6;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v70 = [v68 children];
            uint64_t v27 = [v70 countByEnumeratingWithState:&v82 objects:v97 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v83;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v83 != v29) {
                    objc_enumerationMutation(v70);
                  }
                  v31 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                  if (!v7
                    && objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * i), "tv_elementType") == 16
                    && objc_msgSend(v31, "tv_imageType") == 3)
                  {
                    unint64_t v7 = v31;
                  }
                  else if (objc_msgSend(v31, "tv_elementType") == 4)
                  {
                    long long v80 = 0u;
                    long long v81 = 0u;
                    long long v78 = 0u;
                    long long v79 = 0u;
                    v32 = [v31 children];
                    uint64_t v33 = [v32 countByEnumeratingWithState:&v78 objects:v96 count:16];
                    if (v33)
                    {
                      uint64_t v34 = v33;
                      uint64_t v35 = *(void *)v79;
                      do
                      {
                        for (uint64_t j = 0; j != v34; ++j)
                        {
                          if (*(void *)v79 != v35) {
                            objc_enumerationMutation(v32);
                          }
                          v37 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                          if (objc_msgSend(v37, "tv_elementType") == 16 && !objc_msgSend(v37, "tv_imageType"))
                          {
                            id v38 = v37;

                            v5 = v38;
                          }
                        }
                        uint64_t v34 = [v32 countByEnumeratingWithState:&v78 objects:v96 count:16];
                      }
                      while (v34);
                    }
                  }
                }
                uint64_t v28 = [v70 countByEnumeratingWithState:&v82 objects:v97 count:16];
              }
              while (v28);
            }

            self = v56;
            id v6 = v73;
            v9 = v67;
            id v26 = v68;
            id v8 = v61;
          }
          [v57 addObject:v26];
          int v10 = 1;
        }
        else
        {
          int v10 = 0;
        }
        uint64_t v11 = v65 + 1;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    }
    while (v64);

    if (!v8) {
      goto LABEL_83;
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = [v8 children];
    uint64_t v39 = [obj countByEnumeratingWithState:&v74 objects:v95 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v75;
LABEL_67:
      uint64_t v42 = 0;
      while (1)
      {
        if (*(void *)v75 != v41) {
          objc_enumerationMutation(obj);
        }
        v43 = *(void **)(*((void *)&v74 + 1) + 8 * v42);
        if (objc_msgSend(v43, "tv_elementType") == 16 && objc_msgSend(v43, "tv_imageType") == 3) {
          break;
        }
        uint64_t v46 = objc_msgSend(v43, "tv_elementType");
        unint64_t v45 = 0;
        unint64_t v47 = 0;
        unint64_t v7 = 0;
        unint64_t v44 = (unint64_t)v43;
        if (v46 == 16) {
          goto LABEL_74;
        }
LABEL_75:
        if (v47 | v7)
        {
          self = v56;
          id v6 = (id)v47;
          goto LABEL_82;
        }
        ++v42;
        self = v56;
        if (v40 == v42)
        {
          uint64_t v40 = [obj countByEnumeratingWithState:&v74 objects:v95 count:16];
          if (v40) {
            goto LABEL_67;
          }
          goto LABEL_80;
        }
      }
      unint64_t v44 = 0;
      unint64_t v45 = (unint64_t)v43;
LABEL_74:
      id v48 = v43;
      unint64_t v47 = v44;
      unint64_t v7 = v45;
      goto LABEL_75;
    }
  }
  else
  {
    id v62 = 0;
    v9 = 0;
    id v8 = 0;
    v5 = 0;
    v71 = 0;
  }
LABEL_80:
  id v6 = 0;
  unint64_t v7 = 0;
LABEL_82:

LABEL_83:
  objc_storeStrong((id *)&self->_viewElement, v54);
  v49 = [v55 appDocument];
  [v49 impressionThreshold];
  self->_impressionThreshold = v50;

  objc_storeStrong((id *)&self->_collectionListElement, v62);
  objc_storeStrong((id *)&self->_backgroundElement, v9);
  objc_storeStrong((id *)&self->_heroImgElement, (id)v7);
  objc_storeStrong((id *)&self->_bgImgElement, v6);
  objc_storeStrong((id *)&self->_uberImgElement, v5);
  objc_storeStrong((id *)&self->_bgMediaContentElement, v8);
  if (v71)
  {
    v51 = v71;
  }
  else
  {
    [(UIView *)self->_overlayView removeFromSuperview];
    v51 = 0;
  }
  v52 = self->_overlayView;
  self->_overlayView = v51;

  -[_TVStackCommonTemplateController updateCollectionViewControllersAndForceReload:](self, "updateCollectionViewControllersAndForceReload:", -[_TVStackCommonTemplateController _updateSupplementaryViewControllersWithElements:updateStyles:](self, "_updateSupplementaryViewControllersWithElements:updateStyles:", v57, [v55 updateType] == 2));
  v53 = [(_TVStackCommonTemplateController *)self parentViewController];
  [(_TVStackCommonTemplateController *)self _disableScrollingIfNecessary:v53];

  if ([(_TVStackCommonTemplateController *)self isViewLoaded])
  {
    [(_TVStackCommonTemplateController *)self _updateBackgroundViews];
    [(_TVStackCommonTemplateController *)self _updateViewOverlay];
    [(_TVStackCommonTemplateController *)self _updateViewSupplementaryViews];
    [(_TVStackCommonTemplateController *)self _updateViewLayout];
  }
}

- (void)loadView
{
  v3 = [_TVStackWrappingView alloc];
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  v5 = -[_TVStackWrappingView initWithFrame:](v3, "initWithFrame:");

  [(_TVStackCommonTemplateController *)self setView:v5];
  objc_initWeak(&location, self);
  id v6 = objc_alloc_init(_TVStackViewFlowLayout);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __44___TVStackCommonTemplateController_loadView__block_invoke;
  uint64_t v18 = &unk_264BA75C0;
  objc_copyWeak(&v19, &location);
  [(_TVStackViewFlowLayout *)v6 setOnPrepareLayout:&v15];
  unint64_t v7 = [_TVStackCollectionView alloc];
  [(_TVStackWrappingView *)v5 bounds];
  id v8 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6);
  [(_TVStackCollectionView *)v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVStackViewCollectionCellIdentifier"];
  [(_TVStackCollectionView *)v8 setDelegate:self];
  [(_TVStackCollectionView *)v8 setDataSource:self];
  [(_TVStackCollectionView *)v8 setBackgroundColor:0];
  [(_TVStackCollectionView *)v8 setOpaque:0];
  [(_TVStackCollectionView *)v8 setAutoresizingMask:18];
  [(_TVStackCollectionView *)v8 setShowsVerticalScrollIndicator:0];
  [(_TVStackCollectionView *)v8 setShowsHorizontalScrollIndicator:0];
  [(_TVStackCollectionView *)v8 setAlwaysBounceVertical:1];
  [(_TVStackCollectionView *)v8 _setContentInsetAdjustmentBehavior:2];
  [(_TVStackWrappingView *)v5 setStackView:v8];
  [(_TVStackCommonTemplateController *)self setCollectionView:v8];
  [(_TVStackCommonTemplateController *)self _updateBackgroundViews];
  [(_TVStackCommonTemplateController *)self _updateViewOverlay];
  [(_TVStackCommonTemplateController *)self _updateViewSupplementaryViews];
  [(_TVStackCommonTemplateController *)self _updateViewLayout];
  v9 = objc_alloc_init(TVObservableEventController);
  observableEventController = self->_observableEventController;
  self->_observableEventController = v9;

  uint64_t v11 = [(_TVStackCommonTemplateController *)self viewElement];
  uint64_t v12 = [v11 appDocument];
  uint64_t v13 = +[TVTemplateFeaturesManager featuresManagerForAppDocument:v12];

  [v13 pushContext:self forFeature:&unk_26E5E0118];
  id v14 = [v13 currentContextForFeature:&unk_26E5F4098];
  [(_TVStackCommonTemplateController *)self setMediaPlayer:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_TVStackCommonTemplateController;
  id v4 = a3;
  [(_TVStackCommonTemplateController *)&v20 traitCollectionDidChange:v4];
  v5 = [(_TVStackCommonTemplateController *)self popoverPresentationController];
  if (![v5 presenting]) {
    goto LABEL_8;
  }
  id v6 = [(_TVStackCommonTemplateController *)self popoverPresentationController];
  unint64_t v7 = [v6 presentedViewController];
  if ([v7 isEqual:self])
  {

LABEL_6:
    uint64_t v13 = [(_TVStackCommonTemplateController *)self collectionView];
    id v14 = v13;
    uint64_t v15 = 0;
    goto LABEL_10;
  }
  id v8 = [(_TVStackCommonTemplateController *)self popoverPresentationController];
  v9 = [v8 presentedViewController];
  int v10 = +[_TVModalPresenter presenter];
  uint64_t v11 = [v10 modalRootViewController];
  if (![v9 isEqual:v11])
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v12 = [(_TVStackCommonTemplateController *)self _modalPresenterPresentedViewController];
  int v19 = [(_TVStackCommonTemplateController *)self isEqual:v12];

  if (v19) {
    goto LABEL_6;
  }
LABEL_9:
  uint64_t v13 = [(_TVStackCommonTemplateController *)self collectionView];
  id v14 = v13;
  uint64_t v15 = 1;
LABEL_10:
  [v13 setAlwaysBounceVertical:v15];

  uint64_t v16 = [(_TVStackCommonTemplateController *)self traitCollection];
  uint64_t v17 = [v16 userInterfaceStyle];
  uint64_t v18 = [v4 userInterfaceStyle];

  if (v17 != v18) {
    [(_TVStackCommonTemplateController *)self updateBackgroundAndBackdrop];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVStackCommonTemplateController;
  [(_TVBgImageLoadingViewController *)&v4 viewDidAppear:a3];
  [(_TVStackCommonTemplateController *)self _updateImpressions];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVStackCommonTemplateController;
  [(_TVBgImageLoadingViewController *)&v4 viewDidDisappear:a3];
  [(_TVStackCommonTemplateController *)self _cancelImpressionsUpdate];
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(IKViewElement *)self->_viewElement isDisabled])
  {
    if (self->_disabledTemplateFocusCaptureView)
    {
      v10[0] = self->_disabledTemplateFocusCaptureView;
      v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    }
    else
    {
      v3 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    objc_super v4 = [(_TVStackCommonTemplateController *)self view];
    [v4 layoutIfNeeded];

    v5 = [(_TVStackCommonTemplateController *)self _preferredFocusedSupplementaryView];
    if (v5)
    {
      id v6 = [(_TVStackCommonTemplateController *)self _preferredFocusedSupplementaryView];
      v9 = v6;
      v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)_TVStackCommonTemplateController;
      v3 = [(_TVStackCommonTemplateController *)&v8 preferredFocusEnvironments];
    }
  }
  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3, a4);
  id v6 = [v5 focusedView];

  if (v6)
  {
    unint64_t v7 = [(_TVStackCommonTemplateController *)self view];
    int v8 = [v6 isDescendantOfView:v7];

    if (v8)
    {
      v9 = [(_TVStackCommonTemplateController *)self focusedSupplementaryViewController];
      int v10 = [v9 view];
      char v11 = [v6 isDescendantOfView:v10];

      if ((v11 & 1) == 0)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v12 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
        id v13 = (id)[v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v17 = [v16 view];
              int v18 = [v6 isDescendantOfView:v17];

              if (v18)
              {
                id v13 = v16;
                goto LABEL_14;
              }
            }
            id v13 = (id)[v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        [(_TVStackCommonTemplateController *)self setFocusedSupplementaryViewController:v13];
      }
    }
  }
}

- (void)scrollToTop
{
  id v2 = [(_TVStackCommonTemplateController *)self collectionView];
  [v2 _scrollToTopIfPossible:1];
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return 0;
}

- (void)setMediaPlayer:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPlayer);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_mediaPlayer);
    [v5 removeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_mediaPlayer, obj);
    [obj addObserver:self forEvent:@"TVMediaPlayingStateDidChangeEvent"];

    id v7 = objc_loadWeakRetained((id *)&self->_mediaPlayer);
    [v7 addObserver:self forEvent:@"TVMediaPlayingCoverImageDidChangeEvent"];

    [(_TVStackCommonTemplateController *)self _mediaPlayerStateDidChange];
    [(_TVStackCommonTemplateController *)self _mediaPlayerCoverImageDidChange];
  }
}

- (void)setSelectedMediaInfo:(id)a3
{
  id v5 = (TVMediaInfo *)a3;
  selectedMediaInfo = self->_selectedMediaInfo;
  if (selectedMediaInfo != v5)
  {
    int v8 = v5;
    selectedMediaInfo = (TVMediaInfo *)[(TVMediaInfo *)selectedMediaInfo isEqual:v5];
    id v5 = v8;
    if ((selectedMediaInfo & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedMediaInfo, a3);
      id v7 = [(_TVStackCommonTemplateController *)self observableEventController];
      [v7 dispatchEvent:@"TVSelectedMediaInfoDidChangeEvent" sender:self withUserInfo:0];

      id v5 = v8;
    }
  }
  MEMORY[0x270F9A758](selectedMediaInfo, v5);
}

- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  int v10 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  if (@"TVMediaPlayingStateDidChangeEvent" == v10)
  {
    [(_TVStackCommonTemplateController *)self _mediaPlayerStateDidChange];
  }
  else if (@"TVMediaPlayingCoverImageDidChangeEvent" == v10)
  {
    [(_TVStackCommonTemplateController *)self _mediaPlayerCoverImageDidChange];
  }
}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TVStackCommonTemplateController *)self observableEventController];
  [v8 addObserver:v7 forEvent:v6];
}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TVStackCommonTemplateController *)self observableEventController];
  [v8 removeObserver:v7 forEvent:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVStackCommonTemplateController *)self observableEventController];
  [v5 removeObserver:v4];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_TVStackCommonTemplateController *)self collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"TVStackViewCollectionCellIdentifier" forIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
    id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "item"));

    [v7 setViewController:v9];
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(_TVStackCommonTemplateController *)self updateBackgroundAndBackdropMaskFactor];
  [(_TVStackCommonTemplateController *)self _updateImpressions];
  if (self->_impressionThreshold > 0.0)
  {
    id v4 = [(_TVStackCollectionView *)self->_collectionView visibleCells];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_23];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "viewController", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v6 = [(_TVStackCommonTemplateController *)self childViewControllers];
    char v7 = [v6 containsObject:v8];

    if ((v7 & 1) == 0)
    {
      [(_TVStackCommonTemplateController *)self addChildViewController:v8];
      [v8 didMoveToParentViewController:self];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v6 = [v10 viewController];
  if (v6)
  {
    char v7 = [(_TVStackCommonTemplateController *)self childViewControllers];
    if ([v7 containsObject:v6])
    {
      id v8 = [v6 view];
      int v9 = [v8 isDescendantOfView:v10];

      if (v9)
      {
        [v6 willMoveToParentViewController:0];
        [v6 removeFromParentViewController];
      }
    }
    else
    {
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)updateBackgroundAndBackdrop
{
  id v14 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  v3 = [(IKImageElement *)self->_bgImgElement style];
  id v4 = objc_msgSend(v3, "tv_imageTreatment");
  int v5 = [v4 isEqualToString:@"blurOverlay"];

  if (v5)
  {
    int64_t v6 = [(_TVStackCommonTemplateController *)self _blurEffectStyle];
    BOOL v7 = [(_TVStackCommonTemplateController *)self _backgroundImageRequiresBlur];
    uint64_t v8 = 4014;
    if (v6 != 4000) {
      uint64_t v8 = 4015;
    }
    if (v7) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v6;
    }
    [v14 setBackdropBlurEffectStyle:v9];
    [v14 bounds];
    double v11 = v10;
    uint64_t v12 = [(IKImageElement *)self->_bgImgElement style];
    objc_msgSend(v12, "tv_padding");
    [v14 setBackdropInitialPeek:v11 - v13];

    [v14 setBackdropPeekGradient:0.0];
  }
  else
  {
    [v14 setBackdropBlurEffectStyle:0x8000000000000000];
  }
}

- (void)updateBackgroundAndBackdropMaskFactor
{
  id v15 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  [v15 bounds];
  double v3 = v2;
  id v4 = [v15 stackView];
  [v4 contentOffset];
  double v6 = v5;

  BOOL v7 = [v15 stackView];
  [v7 contentInset];
  double v9 = v8;

  [v15 backdropInitialPeek];
  double v11 = v3 - v10;
  double v12 = 1.0;
  double v13 = 1.0;
  if (v11 > 0.0) {
    double v13 = (v11 - v9 - v6) / v11;
  }
  double v14 = 0.0;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  if (v14 <= 1.0) {
    double v12 = v14;
  }
  [v15 setBackdropMaskFactor:v12];
}

- (id)parsedMediaInfo
{
  v14[1] = *MEMORY[0x263EF8340];
  double v3 = [(_TVStackCommonTemplateController *)self bgMediaContentElement];

  if (v3)
  {
    double v3 = objc_alloc_init(TVBackgroundMediaInfo);
    id v4 = [(_TVStackCommonTemplateController *)self viewElement];
    double v5 = [v4 style];
    double v6 = objc_msgSend(v5, "tv_backgroundColor");
    BOOL v7 = [v6 color];
    [(TVMediaInfo *)v3 setBackgroundColor:v7];

    double v8 = [(_TVStackCommonTemplateController *)self bgMediaContentElement];
    double v9 = [v8 playerBridge];
    [(TVBackgroundMediaInfo *)v3 setPlayerBridge:v9];

    uint64_t v10 = [(_TVStackCommonTemplateController *)self _backgroundImageProxy];
    double v11 = (void *)v10;
    if (v10)
    {
      v14[0] = v10;
      double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      [(TVMediaInfo *)v3 setImageProxies:v12];
    }
  }
  return v3;
}

- (void)_updateImpressions
{
  [(_TVStackCommonTemplateController *)self _cancelImpressionsUpdate];
  if (self->_impressionThreshold > 0.0)
  {
    -[_TVStackCommonTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
  }
}

- (void)_cancelImpressionsUpdate
{
}

- (void)_recordImpressionsForVisibleView
{
  double v3 = [(_TVStackCommonTemplateController *)self view];
  id v4 = [v3 window];

  if (v4)
  {
    id v6 = [(IKViewElement *)self->_viewElement appDocument];
    double v5 = -[_TVStackCommonTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    if ([v5 count]) {
      [v6 recordImpressionsForViewElements:v5];
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IKViewElement *)self->_viewElement appDocument];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    BOOL v7 = [(_TVStackCollectionView *)self->_collectionView visibleCells];
    double v8 = [MEMORY[0x263EFF980] array];
    if ([(_TVStackCommonTemplateController *)self isViewLoaded])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v25 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            double v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) viewController];
            id v15 = objc_msgSend(v14, "tv_impressionableElementsForDocument:", v4);
            [v8 addObjectsFromArray:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v11);
      }

      uint64_t v16 = [(_TVStackCollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:@"TVStackElementKindHeader"];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = [*(id *)(*((void *)&v26 + 1) + 8 * j) viewController];
            long long v22 = objc_msgSend(v21, "tv_impressionableElementsForDocument:", v4);
            [v8 addObjectsFromArray:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v18);
      }

      BOOL v7 = v25;
    }
    if ([v8 count])
    {
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (CGSize)_backgroundImageProxySize
{
  heroImgElement = self->_heroImgElement;
  if (heroImgElement || (heroImgElement = self->_bgImgElement) != 0)
  {
    [(IKImageElement *)heroImgElement tv_imageScaleToSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVStackCommonTemplateController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 _graphicsQuality];

  if (v4 == 10) {
    goto LABEL_2;
  }
  heroImgElement = self->_heroImgElement;
  if (heroImgElement)
  {
    objc_super v5 = [(IKImageElement *)heroImgElement tv_imageProxy];
  }
  else
  {
    if (!self->_bgImgElement)
    {
LABEL_2:
      objc_super v5 = 0;
      goto LABEL_7;
    }
    BOOL v7 = [(IKViewElement *)self->_viewElement appDocument];
    objc_msgSend(v7, "tv_adjustedWindowSize");
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = objc_opt_new();
    objc_msgSend(v12, "setImageSize:", v9, v11);
    id v13 = +[TVImageLayout layoutWithLayout:v12 element:self->_bgImgElement];
    objc_super v5 = [(IKImageElement *)self->_bgImgElement tv_imageProxyWithLayout:v12];
  }
LABEL_7:
  return v5;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return self->_heroImgElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:self->_viewElement] == 1)return 4000; {
  else
  }
    return 4005;
}

- (BOOL)_isBackdropNeeded
{
  return 0;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  -[_TVStackCommonTemplateController setBgImage:](self, "setBgImage:", a3, a4);
  if ([(_TVStackCommonTemplateController *)self isViewLoaded])
  {
    [(_TVStackCommonTemplateController *)self _updateBackgroundViews];
  }
}

- (BOOL)_shouldLoadBackgroundImageAsynchronously
{
  double v2 = [(_TVStackCommonTemplateController *)self _backgroundImageProxy];
  char v3 = [v2 isImageAvailable] ^ 1;

  return v3;
}

- (id)viewControllerWithElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  double v10 = +[TVInterfaceFactory sharedInterfaceFactory];
  double v11 = [v10 _viewControllerFromElement:v7 layout:v9 existingController:v8];

  if (!v11)
  {
    uint64_t v12 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v13 = [v8 view];
    double v14 = [v12 _viewFromElement:v7 existingView:v13];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = (_TVStackWrappingViewController *)v8;
      }
      else {
        id v15 = objc_alloc_init(_TVStackWrappingViewController);
      }
      double v11 = v15;
      [(_TVStackWrappingViewController *)v15 setView:v14];
      objc_msgSend(v11, "tv_setAssociatedIKViewElement:", v7);
    }
    else
    {
      double v11 = 0;
    }
  }
  return v11;
}

- (BOOL)_updateSupplementaryViewControllersWithElements:(id)a3 updateStyles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v4
    || (uint64_t v8 = [v6 count],
        [(_TVStackCommonTemplateController *)self supplementaryViewControllers],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8 != v10))
  {
    unint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v12 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
    uint64_t v46 = (void *)[v12 mutableCopy];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v41 = v7;
    obuint64_t j = v7;
    v43 = self;
    uint64_t v47 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    id v13 = 0;
    if (v47)
    {
      uint64_t v45 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v58 != v45) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "autoHighlightIdentifier", v41);

          if (v16) {
            [v15 resetProperty:2];
          }
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v17 = v46;
          id v18 = (id)[v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v18)
          {
            id v48 = v13;
            uint64_t v19 = *(void *)v54;
            while (2)
            {
              for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v54 != v19) {
                  objc_enumerationMutation(v17);
                }
                long long v21 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
                long long v22 = objc_msgSend(v21, "tv_associatedIKViewElement");
                uint64_t v23 = objc_msgSend(v22, "tv_elementType");

                if (v23 == objc_msgSend(v15, "tv_elementType"))
                {
                  id v18 = v21;
                  goto LABEL_21;
                }
              }
              id v18 = (id)[v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
              if (v18) {
                continue;
              }
              break;
            }
LABEL_21:
            self = v43;
            id v13 = v48;
          }

          uint64_t v24 = [(_TVStackCommonTemplateController *)self viewControllerWithElement:v15 layout:0 existingController:v18];
          id v25 = v24;
          if (v24)
          {
            if (!v13 && v16) {
              id v13 = v24;
            }
            [v44 addObject:v25];
          }
          if (v18 && v18 == v25) {
            [v17 removeObjectIdenticalTo:v18];
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v47);
    }
    long long v26 = v13;

    BOOL v11 = [v46 count] != 0;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v27 = v46;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v49 + 1) + 8 * k);
          objc_msgSend(v32, "willMoveToParentViewController:", 0, v41);
          long long v33 = [v32 view];
          [v33 removeFromSuperview];

          [v32 removeFromParentViewController];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v29);
    }

    self = v43;
    [(_TVStackCommonTemplateController *)v43 setSupplementaryViewControllers:v44];
    uint64_t v34 = v43;
    if (v26)
    {
      uint64_t v35 = v26;
    }
    else
    {
      uint64_t v37 = [(_TVStackCommonTemplateController *)v43 focusedSupplementaryViewController];
      if (!v37) {
        goto LABEL_42;
      }
      id v38 = (void *)v37;
      uint64_t v39 = [(_TVStackCommonTemplateController *)v43 focusedSupplementaryViewController];
      char v40 = [v44 containsObject:v39];

      if (v40) {
        goto LABEL_42;
      }
      uint64_t v34 = v43;
      uint64_t v35 = 0;
    }
    -[_TVStackCommonTemplateController setFocusedSupplementaryViewController:](v34, "setFocusedSupplementaryViewController:", v35, v41);
LABEL_42:

    id v7 = v41;
    goto LABEL_43;
  }
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __97___TVStackCommonTemplateController__updateSupplementaryViewControllersWithElements_updateStyles___block_invoke;
  v61[3] = &unk_264BA7608;
  v61[4] = self;
  [v7 enumerateObjectsUsingBlock:v61];
  BOOL v11 = 0;
LABEL_43:
  [(_TVStackCommonTemplateController *)self didUpdateSupplementarySectionInfo];

  return v11;
}

- (id)_flowLayout
{
  double v2 = [(_TVStackCommonTemplateController *)self collectionView];
  char v3 = [v2 collectionViewLayout];

  return v3;
}

- (id)_overlayView
{
  return self->_overlayView;
}

- (void)_updateViewOverlay
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)self->_overlayView setComponentsNeedUpdate];
  }
  char v3 = [(_TVStackCommonTemplateController *)self view];
  [v3 addSubview:self->_overlayView];

  overlayView = self->_overlayView;
  [(UIView *)overlayView sizeToFit];
}

- (void)_updateBackgroundViews
{
  char v3 = [(_TVStackCommonTemplateController *)self parsedMediaInfo];
  [(_TVStackCommonTemplateController *)self setSelectedMediaInfo:v3];

  id v15 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  BOOL v4 = [(_TVStackCommonTemplateController *)self selectedMediaInfo];

  objc_super v5 = [(_TVStackCommonTemplateController *)self mediaPlayer];
  id v6 = [v5 coverImage];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(_TVStackCommonTemplateController *)self bgImage];
  }
  id v9 = v8;

  [v15 setBackgroundImage:v9];
  [v15 setUsesBackgroundImage:v4 == 0];
  uint64_t v10 = [(_TVStackCommonTemplateController *)self viewElement];
  BOOL v11 = [v10 style];
  uint64_t v12 = objc_msgSend(v11, "tv_backgroundColor");
  id v13 = [v12 color];
  [v15 setBackgroundColor:v13];

  double v14 = [(_TVStackCommonTemplateController *)self mediaPlayer];
  LODWORD(v11) = [v14 isPlaying];

  [v15 setBackdropImage:v9];
  [v15 setUsesBackdropImage:v11 ^ 1];
  [(_TVStackCommonTemplateController *)self updateBackgroundAndBackdrop];
}

- (void)_updateViewSupplementaryViews
{
  char v3 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  BOOL v4 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
  objc_super v5 = [v4 valueForKey:@"view"];

  id v6 = [(_TVStackCommonTemplateController *)self viewElement];
  uint64_t v7 = objc_msgSend(v6, "tv_semanticContentAttribute");

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65___TVStackCommonTemplateController__updateViewSupplementaryViews__block_invoke;
  v8[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v8[4] = v7;
  [v5 enumerateObjectsUsingBlock:v8];
  [v3 setHeaderSupplementaryViews:v5];
}

- (void)viewSafeAreaInsetsDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)_TVStackCommonTemplateController;
  [(_TVStackCommonTemplateController *)&v10 viewSafeAreaInsetsDidChange];
  char v3 = [(_TVStackCommonTemplateController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  id v6 = [(_TVStackCommonTemplateController *)self view];
  [v6 safeAreaInsets];
  double v8 = v7;

  id v9 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  objc_msgSend(v9, "configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:", -[_TVStackCommonTemplateController _supplementaryViewSectionIndex](self, "_supplementaryViewSectionIndex"), v5, 0.0, v8, 0.0);
}

- (void)_updateViewLayout
{
  char v3 = [(_TVStackCommonTemplateController *)self collectionView];
  double v4 = [(_TVStackCommonTemplateController *)self viewElement];
  objc_msgSend(v3, "setSemanticContentAttribute:", objc_msgSend(v4, "tv_semanticContentAttribute"));

  id v14 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  double v5 = [(_TVStackCommonTemplateController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6;
  double v8 = [(_TVStackCommonTemplateController *)self view];
  [v8 safeAreaInsets];
  double v10 = v9;

  [(_TVStackCommonTemplateController *)self updateBackgroundAndBackdropMaskFactor];
  BOOL v11 = [(_TVStackCommonTemplateController *)self viewElement];
  [v14 transferLayoutStylesFromElement:v11];

  uint64_t v12 = [v14 stackView];
  id v13 = [(_TVStackCommonTemplateController *)self collectionListElement];
  [v12 transferLayoutStylesFromElement:v13];

  objc_msgSend(v14, "configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:", -[_TVStackCommonTemplateController _supplementaryViewSectionIndex](self, "_supplementaryViewSectionIndex"), v7, 0.0, v10, 0.0);
}

- (id)_modalPresenterPresentedViewController
{
  double v2 = +[_TVModalPresenter presenter];
  char v3 = [v2 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 templateViewController];

    char v3 = (void *)v4;
  }
  return v3;
}

- (void)_disableScrollingIfNecessary:(id)a3
{
  id v4 = a3;
  id v23 = v4;
  if (v4)
  {
    double v5 = [v4 popoverPresentationController];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      double v7 = [v23 navigationController];
      double v8 = [v7 popoverPresentationController];
      BOOL v6 = v8 == 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }
  double v9 = [(_TVStackCommonTemplateController *)self viewElement];
  double v10 = [v9 attributes];
  BOOL v11 = [v10 objectForKey:@"disableScrolling"];
  int v12 = [v11 BOOLValue];

  if (!v6 && v12)
  {
    id v13 = [(_TVStackCommonTemplateController *)self view];
    id v14 = [v13 stackView];
    id v15 = [v14 collectionViewLayout];
    [v15 collectionViewContentSize];
    double v17 = v16;

    [v14 contentInset];
    double v19 = v18;
    [v13 bounds];
    BOOL v21 = v20 - v19 - v17 <= 8.0;
    long long v22 = [(_TVStackCommonTemplateController *)self collectionView];
    [v22 setScrollEnabled:v21];
  }
}

- (id)_preferredFocusedSupplementaryView
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v3 = [(_TVStackCommonTemplateController *)self focusedSupplementaryViewController];

  if (v3)
  {
    id v4 = [(_TVStackCommonTemplateController *)self focusedSupplementaryViewController];
    goto LABEL_26;
  }
  double v5 = [(_TVStackCommonTemplateController *)self collectionView];
  BOOL v6 = [v5 indexPathForLastFocusedItem];

  if (v6)
  {
    id v4 = 0;
    goto LABEL_26;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v7 = [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8)
  {
    id v4 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = v8;
  id v4 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (!v4)
      {
        id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) view];
        if (([v13 canBecomeFocused] & 1) == 0)
        {

LABEL_15:
          id v4 = 0;
          goto LABEL_16;
        }
        uint64_t v14 = [(_TVStackCommonTemplateController *)self numberOfCollections];

        if (v14) {
          goto LABEL_15;
        }
        id v4 = v12;
      }
LABEL_16:
      id v15 = objc_msgSend(v12, "tv_associatedIKViewElement");
      uint64_t v16 = objc_msgSend(v15, "tv_elementType");

      if (v16 == 57 || v16 == 45)
      {
        id v17 = v12;

        id v4 = v17;
      }
      if (v16 == 45 || v16 == 57) {
        goto LABEL_25;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v9);
LABEL_25:

LABEL_26:
  double v18 = [v4 view];

  return v18;
}

- (void)_dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(_TVStackCommonTemplateController *)self collectionView];
  uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

  uint64_t v9 = [v8 viewController];
  uint64_t v10 = objc_msgSend(v9, "tv_associatedIKViewElement");

  if (v10 && ([v10 isDisabled] & 1) == 0) {
    objc_msgSend(v10, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v11, 1, 1, 0, v8, 0);
  }
}

- (void)_mediaPlayerStateDidChange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = [(_TVStackCommonTemplateController *)self mediaPlayer];
  int v4 = [v3 isPlaying];

  if (v4)
  {
    double v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  }
  else
  {
    double v5 = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(_TVStackCommonTemplateController *)self childViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_TVStackCommonTemplateController *)self setOverrideTraitCollection:v5 forChildViewController:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(_TVStackCommonTemplateController *)self _updateBackgroundViews];
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (_TVStackCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (IKViewElement)collectionListElement
{
  return self->_collectionListElement;
}

- (void)setCollectionListElement:(id)a3
{
}

- (TVObservableEventController)observableEventController
{
  return self->_observableEventController;
}

- (IKAudioElement)audioElement
{
  return self->_audioElement;
}

- (void)setAudioElement:(id)a3
{
}

- (IKViewElement)backgroundElement
{
  return self->_backgroundElement;
}

- (void)setBackgroundElement:(id)a3
{
}

- (IKImageElement)heroImgElement
{
  return self->_heroImgElement;
}

- (void)setHeroImgElement:(id)a3
{
}

- (IKImageElement)bgImgElement
{
  return self->_bgImgElement;
}

- (void)setBgImgElement:(id)a3
{
}

- (IKImageElement)uberImgElement
{
  return self->_uberImgElement;
}

- (void)setUberImgElement:(id)a3
{
}

- (IKMediaContentElement)bgMediaContentElement
{
  return self->_bgMediaContentElement;
}

- (void)setBgMediaContentElement:(id)a3
{
}

- (UIImage)bgImage
{
  return self->_bgImage;
}

- (void)setBgImage:(id)a3
{
}

- (TVMediaPlaying)mediaPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPlayer);
  return (TVMediaPlaying *)WeakRetained;
}

- (TVMediaInfo)selectedMediaInfo
{
  return self->_selectedMediaInfo;
}

- (NSArray)supplementaryViewControllers
{
  return self->_supplementaryViewControllers;
}

- (void)setSupplementaryViewControllers:(id)a3
{
}

- (UIViewController)focusedSupplementaryViewController
{
  return self->_focusedSupplementaryViewController;
}

- (void)setFocusedSupplementaryViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedSupplementaryViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryViewControllers, 0);
  objc_storeStrong((id *)&self->_selectedMediaInfo, 0);
  objc_destroyWeak((id *)&self->_mediaPlayer);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_bgMediaContentElement, 0);
  objc_storeStrong((id *)&self->_uberImgElement, 0);
  objc_storeStrong((id *)&self->_bgImgElement, 0);
  objc_storeStrong((id *)&self->_heroImgElement, 0);
  objc_storeStrong((id *)&self->_backgroundElement, 0);
  objc_storeStrong((id *)&self->_audioElement, 0);
  objc_storeStrong((id *)&self->_observableEventController, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_disabledTemplateFocusCaptureView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end