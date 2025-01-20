@interface _TVRelatedContentShelfViewController
- (_TVShelfViewController)shelfViewController;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (void)loadView;
- (void)setShelfViewController:(id)a3;
- (void)shelfViewController:(id)a3 updateRelatedView:(id)a4;
@end

@implementation _TVRelatedContentShelfViewController

- (void)setShelfViewController:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v5 = (_TVShelfViewController *)a3;
  p_shelfViewController = &self->_shelfViewController;
  shelfViewController = self->_shelfViewController;
  if (shelfViewController != v5)
  {
    [(_TVShelfViewController *)shelfViewController willMoveToParentViewController:0];
    if (v5)
    {
      [(_TVRelatedContentShelfViewController *)self addChildViewController:v5];
      [(_TVShelfViewController *)v5 setDelegate:self];
      v8 = [(_TVRelatedContentShelfViewController *)self view];
      v9 = [(_TVShelfViewController *)v5 view];
      [v8 setShelfView:v9];

      v10 = [(_TVRelatedContentShelfViewController *)self view];
      v11 = [(_TVMLCollectionViewController *)v5 collectionElement];
      [v10 transferLayoutStylesFromElement:v11];

      v12 = [(_TVRelatedContentShelfViewController *)self view];
      v13 = (void *)MEMORY[0x263F08D40];
      v14 = [(_TVShelfViewController *)v5 view];
      objc_msgSend(v14, "tv_margin");
      v15 = objc_msgSend(v13, "valueWithUIEdgeInsets:");
      [v12 setValue:v15 forTVViewStyle:@"margin"];
    }
    [(_TVShelfViewController *)*p_shelfViewController removeFromParentViewController];
    [(_TVShelfViewController *)v5 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_shelfViewController, a3);
    v16 = [(_TVMLCollectionViewController *)v5 collectionElement];
    v17 = [v16 sections];
    v18 = [v17 firstObject];

    v19 = [v18 firstItemElement];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v20 = objc_msgSend(v19, "children", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v25, "tv_elementType") == 43)
          {
            v26 = [(_TVRelatedContentShelfViewController *)self view];
            v27 = [v25 style];
            objc_msgSend(v27, "tv_height");
            objc_msgSend(v26, "setRelatedHeight:");

            goto LABEL_14;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v28 = [(_TVMLCollectionViewController *)*p_shelfViewController collectionView];
    [v28 setRemembersLastFocusedIndexPath:1];
  }
}

- (void)loadView
{
  v3 = [_TVRelatedContentShelfView alloc];
  v4 = -[_TVRelatedContentShelfView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_TVRelatedContentShelfViewController *)self setView:v4];
}

- (void)shelfViewController:(id)a3 updateRelatedView:(id)a4
{
  id v5 = a4;
  id v6 = [(_TVRelatedContentShelfViewController *)self view];
  [v6 setRelatedView:v5];
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVRelatedContentShelfViewController *)self view];
  if (v3)
  {
    v4 = [(_TVRelatedContentShelfViewController *)self view];
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 array];
  v7 = [(_TVRelatedContentShelfViewController *)self shelfViewController];
  v8 = objc_msgSend(v7, "tv_impressionableElementsForDocument:", v5);
  [v6 addObjectsFromArray:v8];

  v9 = [(_TVRelatedContentShelfViewController *)self view];
  v10 = [v9 relatedView];
  v11 = objc_msgSend(v10, "tv_impressionableElementsForDocument:", v5);

  [v6 addObjectsFromArray:v11];
  if ([v6 count])
  {
    v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_TVShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (void).cxx_destruct
{
}

@end