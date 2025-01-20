@interface _TVAlertTemplateController
- (BOOL)_backgroundImageRequiresBlur;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (CGSize)_backgroundImageProxySize;
- (id)_backgroundImageProxy;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_blurEffectStyle;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)_scrollToPreferredFocusView;
- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)loadView;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _TVAlertTemplateController

- (void)updateWithViewElement:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_TVAlertTemplateController;
  [(_TVBgImageLoadingViewController *)&v73 updateWithViewElement:v5];
  int v55 = [(_TVAlertTemplateController *)self isViewLoaded];
  v56 = [(_TVAlertTemplateController *)self view];
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_bgImageElement = &self->_bgImageElement;
  bgImageElement = self->_bgImageElement;
  self->_bgImageElement = 0;

  v57 = self;
  p_bgHeroImageElement = &self->_bgHeroImageElement;
  v10 = *p_bgHeroImageElement;
  *p_bgHeroImageElement = 0;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v58 = v5;
  obuint64_t j = [v5 children];
  uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v11)
  {
    v62 = 0;
    double v16 = 0.0;
    double v17 = 0.0;
    goto LABEL_42;
  }
  uint64_t v12 = v11;
  char v64 = 0;
  v62 = 0;
  uint64_t v13 = *(void *)v70;
  double v14 = *MEMORY[0x263F001B0];
  double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v16 = 0.0;
  double v17 = 0.0;
  id v59 = v6;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v70 != v13) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      unint64_t v20 = objc_msgSend(v19, "tv_elementType");
      if (v20 > 0x17 || ((1 << v20) & 0x8000C0) == 0)
      {
        if (objc_msgSend(v19, "tv_elementType") == 4)
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v27 = [v19 children];
          uint64_t v33 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v66;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v66 != v35) {
                  objc_enumerationMutation(v27);
                }
                v37 = *(void **)(*((void *)&v65 + 1) + 8 * j);
                if (*p_bgImageElement
                  || (uint64_t v38 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * j), "tv_imageType"),
                      v39 = (id *)p_bgImageElement,
                      v38))
                {
                  if (*p_bgHeroImageElement) {
                    continue;
                  }
                  uint64_t v40 = objc_msgSend(v37, "tv_imageType");
                  v39 = (id *)p_bgHeroImageElement;
                  if (v40 != 3) {
                    continue;
                  }
                }
                objc_storeStrong(v39, v37);
              }
              uint64_t v34 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
            }
            while (v34);
            id v6 = v59;
          }
        }
        else
        {
          v41 = +[TVInterfaceFactory sharedInterfaceFactory];
          v27 = [v41 _viewFromElement:v19 existingView:0];

          if (v27)
          {
            if ([v6 count]) {
              v42 = v60;
            }
            else {
              v42 = v61;
            }
            [v42 addObject:v27];
          }
        }
      }
      else
      {
        unint64_t v22 = v20;
        [v6 addObject:v19];
        v23 = [v19 autoHighlightIdentifier];
        uint64_t v24 = [v23 length];

        if (v24)
        {
          if ((v64 & 1) == 0)
          {
            id v25 = v19;

            v62 = v25;
          }
          [v19 resetProperty:2];
          char v64 = 1;
        }
        if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          v26 = +[TVInterfaceFactory sharedInterfaceFactory];
          v27 = [v26 _viewFromElement:v19 existingView:0];

          objc_msgSend(v27, "tv_sizeThatFits:", v14, v15);
          double v17 = fmax(v17, v28);
          double v16 = fmax(v16, v29);
        }
        else
        {
          if (v17 != 0.0) {
            continue;
          }
          v30 = [v19 style];
          objc_msgSend(v30, "tv_width");
          double v17 = v31;

          v27 = [v19 style];
          objc_msgSend(v27, "tv_height");
          double v16 = v32;
        }
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v12);
LABEL_42:

  v43 = [v58 style];
  v44 = objc_msgSend(v43, "tv_backgroundColor");
  v45 = [v44 color];
  [v56 setBackgroundColor:v45];

  v46 = [v58 style];
  objc_msgSend(v46, "tv_padding");
  objc_msgSend(v56, "setPadding:");

  uint64_t v47 = [v6 copy];
  collectionViewElements = v57->_collectionViewElements;
  v57->_collectionViewElements = (NSArray *)v47;

  if (v62)
  {
    uint64_t v49 = [v6 indexOfObject:v62];
    uint64_t v50 = [MEMORY[0x263F088C8] indexPathForItem:v49 inSection:0];
    lastFocusedIndexPath = v57->_lastFocusedIndexPath;
    v57->_lastFocusedIndexPath = (NSIndexPath *)v50;

    if (v55) {
      [(_TVAlertTemplateController *)v57 _scrollToPreferredFocusView];
    }
    else {
      v57->_updateAutoHighlight = 1;
    }
  }
  else
  {
    unint64_t v52 = [(NSIndexPath *)v57->_lastFocusedIndexPath item];
    if (v52 >= [(NSArray *)v57->_collectionViewElements count])
    {
      v53 = v57->_lastFocusedIndexPath;
      v57->_lastFocusedIndexPath = 0;
    }
  }
  [v56 setViewsAbove:v61];
  [v56 setViewsBelow:v60];
  if (v17 > 0.0 && v16 > 0.0)
  {
    v54 = [(_TVCollectionView *)v57->_collectionView collectionViewLayout];
    objc_msgSend(v54, "setItemSize:", v17, v16);
  }
  [(_TVCollectionView *)v57->_collectionView reloadData];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVAlertTemplateController;
  [(_TVBgImageLoadingViewController *)&v3 viewDidLayoutSubviews];
  if (self->_updateAutoHighlight)
  {
    [(_TVAlertTemplateController *)self _scrollToPreferredFocusView];
    self->_updateAutoHighlight = 0;
  }
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_collectionView)
  {
    v4[0] = self->_collectionView;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (void)loadView
{
  objc_super v3 = [_TVAlertTemplateView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  uint64_t v11 = -[_TVAlertTemplateView initWithFrame:](v3, "initWithFrame:");

  id v5 = [MEMORY[0x263F1C550] clearColor];
  [(_TVAlertTemplateView *)v11 setBackgroundColor:v5];

  id v6 = objc_alloc_init(_TVCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v6 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v6 setMinimumLineSpacing:14.0];
  [(UICollectionViewFlowLayout *)v6 setMinimumInteritemSpacing:0.0];
  -[UICollectionViewFlowLayout setSectionInset:](v6, "setSectionInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  v7 = [_TVCollectionView alloc];
  v8 = -[_TVCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_TVCollectionView *)v8 setAutoresizingMask:18];
  [(_TVCollectionView *)v8 setDelegate:self];
  [(_TVCollectionView *)v8 setDataSource:self];
  [(_TVCollectionView *)v8 setBackgroundColor:0];
  [(_TVCollectionView *)v8 setOpaque:0];
  [(_TVCollectionView *)v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVAlertCellIdentifier"];
  [(_TVCollectionView *)v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVAlertListCellIdentifier"];
  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v10 = v8;

  [(_TVAlertTemplateView *)v11 setCollectionView:v10];
  [(_TVAlertTemplateController *)self setView:v11];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_collectionViewElements count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  collectionViewElements = self->_collectionViewElements;
  id v8 = a3;
  v9 = -[NSArray objectAtIndex:](collectionViewElements, "objectAtIndex:", [v6 item]);
  if (objc_msgSend(v9, "tv_elementType") == 23)
  {
    v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"TVAlertListCellIdentifier" forIndexPath:v6];

    uint64_t v11 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v12 = (id)[v11 _viewFromElement:v9 existingView:v10];
  }
  else
  {
    v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"TVAlertCellIdentifier" forIndexPath:v6];

    uint64_t v13 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v11 = [v13 _viewFromElement:v9 existingView:0];

    double v14 = [MEMORY[0x263F1C550] clearColor];
    [v10 setBackgroundColor:v14];

    [v10 setOpaque:0];
    NSUInteger v15 = [(NSArray *)self->_collectionViewElements count];
    double v16 = (double)(v15 - [v6 item]);
    double v17 = [v10 layer];
    [v17 setZPosition:v16];

    [v10 setButtonView:v11];
    [v11 setAutoresizingMask:18];
  }

  [v10 setClipsToBounds:0];
  return v10;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  return self->_lastFocusedIndexPath;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v13 = a3;
  v7 = [a4 nextFocusedIndexPath];
  id v8 = v7;
  if (v7)
  {
    v9 = (NSIndexPath *)[v7 copy];
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v9;

    uint64_t v11 = -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", [v8 row]);
    if (objc_msgSend(v11, "tv_elementType") == 23)
    {
      id v12 = [v13 cellForItemAtIndexPath:v8];
      objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"highlight", 1, 1, 0, v12, 0);
    }
  }
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", [v6 row]);
  if (objc_msgSend(v7, "tv_elementType") == 23)
  {
    id v8 = [v9 cellForItemAtIndexPath:v6];
    objc_msgSend(v7, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"play", 1, 1, 0, v8, 0);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", [v6 row]);
  if (objc_msgSend(v7, "tv_elementType") == 23)
  {
    id v8 = [v9 cellForItemAtIndexPath:v6];
    objc_msgSend(v7, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"select", 1, 1, 0, v8, 0);
  }
}

- (CGSize)_backgroundImageProxySize
{
  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_bgHeroImageElement) != 0)
  {
    [(IKImageElement *)bgImageElement tv_imageScaleToSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVAlertTemplateController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  if (self->_bgImageElement)
  {
    double v3 = [(IKViewElement *)self->_templateElement appDocument];
    objc_msgSend(v3, "tv_adjustedWindowSize");
    double v5 = v4;
    double v7 = v6;

    id v8 = objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    id v9 = +[TVImageLayout layoutWithLayout:v8 element:self->_bgImageElement];
    v10 = [(IKImageElement *)self->_bgImageElement tv_imageProxyWithLayout:v8];
  }
  else
  {
    bgHeroImageElement = self->_bgHeroImageElement;
    if (bgHeroImageElement)
    {
      v10 = [(IKImageElement *)bgHeroImageElement tv_imageProxy];
    }
    else
    {
      v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_bgHeroImageElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:self->_templateElement] == 1)return 4000; {
  else
  }
    return 4005;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5 = a3;
  id v6 = [(_TVAlertTemplateController *)self view];
  [v6 setBgImage:v5];
}

- (void)_scrollToPreferredFocusView
{
  if (self->_lastFocusedIndexPath)
  {
    [(_TVCollectionView *)self->_collectionView layoutIfNeeded];
    collectionView = self->_collectionView;
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    [(_TVCollectionView *)collectionView scrollToItemAtIndexPath:lastFocusedIndexPath atScrollPosition:2 animated:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_bgHeroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_collectionViewElements, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end