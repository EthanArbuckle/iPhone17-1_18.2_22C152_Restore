@interface SXMosaicGalleryLayouter
- (BOOL)reverseNextHorizontalLivingRoomLayout;
- (CGRect)frameForItemAtIndex:(unint64_t)a3;
- (CGSize)contentSize;
- (NSArray)supportedTileTypeClusters;
- (NSMutableArray)clusters;
- (NSMutableArray)frames;
- (NSMutableArray)items;
- (NSMutableArray)layouts;
- (NSMutableArray)views;
- (SXMosaicGalleryColumnLayout)columnLayout;
- (SXMosaicGalleryLayouter)initWithDataSource:(id)a3;
- (SXMosaicGalleryLayouterDataSource)dataSource;
- (double)width;
- (id)clusterForItemsInRange:(_NSRange)a3;
- (id)itemAtIndex:(unint64_t)a3;
- (id)itemsForRange:(_NSRange)a3;
- (id)layoutForCluster:(id)a3 previousLayouts:(id)a4;
- (id)viewForItem:(id)a3;
- (id)viewForItemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItems;
- (void)calculateLayoutForWidth:(double)a3;
- (void)layoutGalleryOnView:(id)a3;
- (void)resetLayout;
- (void)setDataSource:(id)a3;
- (void)setReverseNextHorizontalLivingRoomLayout:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation SXMosaicGalleryLayouter

- (SXMosaicGalleryLayouter)initWithDataSource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXMosaicGalleryLayouter;
  v5 = [(SXMosaicGalleryLayouter *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_numberOfItems = -1;
    v6->_width = 1.79769313e308;
    v6->_contentSize = (CGSize)*MEMORY[0x263F001B0];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    layouts = v6->_layouts;
    v6->_layouts = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    clusters = v6->_clusters;
    v6->_clusters = (NSMutableArray *)v9;
  }
  return v6;
}

- (void)calculateLayoutForWidth:(double)a3
{
  [(SXMosaicGalleryLayouter *)self width];
  if (v5 == a3) {
    return;
  }
  [(SXMosaicGalleryLayouter *)self resetLayout];
  [(SXMosaicGalleryLayouter *)self setWidth:a3];
  v6 = [SXMosaicGalleryColumnLayout alloc];
  [(SXMosaicGalleryLayouter *)self width];
  uint64_t v7 = -[SXMosaicGalleryColumnLayout initWithWidth:gutter:](v6, "initWithWidth:gutter:");
  columnLayout = self->_columnLayout;
  self->_columnLayout = v7;

  unint64_t v9 = [(SXMosaicGalleryLayouter *)self numberOfItems];
  unint64_t v10 = v9;
  if (v9 >= 3) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = v9;
  }
  id v35 = [MEMORY[0x263EFF980] array];
  char v12 = 0;
  unint64_t v13 = 0;
  do
  {
    v14 = [v35 lastObject];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 rangeValue];
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v19 = -[SXMosaicGalleryLayouter clusterForItemsInRange:](self, "clusterForItemsInRange:", v13, v11);
    v20 = (void *)v19;
    if (!((v19 == 0) | v12 & 1))
    {
      unint64_t v21 = v13 + v11;
      if (v11 == 1 && v21 == v10 && v18 == 3 && v10 >= 4)
      {
        v22 = [(SXMosaicGalleryLayouter *)self clusters];
        v23 = [(SXMosaicGalleryLayouter *)self clusters];
        v24 = [v23 lastObject];
        [v22 removeObject:v24];

        v25 = [(SXMosaicGalleryLayouter *)self layouts];
        v26 = [(SXMosaicGalleryLayouter *)self layouts];
        v27 = [v26 lastObject];
        [v25 removeObject:v27];

        char v12 = 1;
        unint64_t v13 = v16;
        unint64_t v28 = 2;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (v19)
    {
      unint64_t v21 = v13 + v11;
LABEL_17:
      v29 = [(SXMosaicGalleryLayouter *)self layouts];
      v30 = [(SXMosaicGalleryLayouter *)self layoutForCluster:v20 previousLayouts:v29];

      v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v13, v11);
      [v35 addObject:v31];

      v32 = [(SXMosaicGalleryLayouter *)self layouts];
      [v32 addObject:v30];

      v33 = [(SXMosaicGalleryLayouter *)self clusters];
      [v33 addObject:v20];

      unint64_t v13 = v21;
LABEL_18:
      unint64_t v28 = 3;
      goto LABEL_19;
    }
    if (v12)
    {
      uint64_t v34 = v10 - v13;
      if (v10 - v13 >= 3) {
        uint64_t v34 = 3;
      }
      if (v11 != v34)
      {
        char v12 = 1;
        goto LABEL_18;
      }
    }
    unint64_t v28 = v11 - 1;
LABEL_19:
    if (v28 >= v10 - v13) {
      uint64_t v11 = v10 - v13;
    }
    else {
      uint64_t v11 = v28;
    }
  }
  while (v10 > v13);
}

- (void)layoutGalleryOnView:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v4 = [(SXMosaicGalleryLayouter *)self columnLayout];
  [v4 gutter];
  double v6 = v5;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = [(SXMosaicGalleryLayouter *)self layouts];
  uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v38)
  {
    uint64_t v42 = 0;
    uint64_t v37 = *(void *)v48;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        unint64_t v10 = [v9 cluster];
        uint64_t v11 = [v10 items];

        id v40 = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v39 = i;
          uint64_t v14 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v40);
              }
              uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              uint64_t v17 = [v9 cluster];
              uint64_t v18 = [v17 items];
              uint64_t v19 = [v18 indexOfObject:v16];

              [v9 frameForItemAtIndex:v19];
              double v21 = v20;
              double v23 = v22;
              double v25 = v24;
              double v27 = v7 + v26;
              unint64_t v28 = [(SXMosaicGalleryLayouter *)self frames];
              v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v21, v27, v23, v25);
              [v28 replaceObjectAtIndex:v42 + j withObject:v29];

              v30 = [(SXMosaicGalleryLayouter *)self viewForItem:v16];
              v31 = [(SXMosaicGalleryLayouter *)self items];
              uint64_t v32 = [v31 indexOfObject:v16];

              v33 = [(SXMosaicGalleryLayouter *)self dataSource];
              LOBYTE(v32) = [v33 galleryLayouter:self viewIsCurrentlyFullscreenForItemAtIndex:v32];

              if ((v32 & 1) == 0)
              {
                objc_msgSend(v30, "setFrame:", v21, v27, v23, v25);
                id v34 = [v30 superview];

                if (v34 != v41) {
                  [v41 addSubview:v30];
                }
              }
            }
            uint64_t v13 = [v40 countByEnumeratingWithState:&v43 objects:v51 count:16];
            v42 += j;
          }
          while (v13);
          uint64_t i = v39;
        }

        [v9 height];
        double v7 = v7 + v6 + v35;
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v38);
  }
}

- (CGSize)contentSize
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v6 = [(SXMosaicGalleryLayouter *)self columnLayout];
    [v6 gutter];
    double v8 = v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v9 = [(SXMosaicGalleryLayouter *)self layouts];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) height];
          double v13 = v8 + v13 + v15;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 0.0;
    }

    double height = v13 - v8;
    [(SXMosaicGalleryLayouter *)self width];
    self->_contentSize.double width = width;
    self->_contentSize.double height = height;
  }
  double v16 = height;
  result.double height = v16;
  result.double width = width;
  return result;
}

- (CGRect)frameForItemAtIndex:(unint64_t)a3
{
  id v4 = [(SXMosaicGalleryLayouter *)self frames];
  double v5 = [v4 objectAtIndex:a3];

  double v6 = [MEMORY[0x263EFF9D0] null];

  if (v5 == v6)
  {
    double v8 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    [v5 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)viewForItemAtIndex:(unint64_t)a3
{
  id v4 = [(SXMosaicGalleryLayouter *)self views];
  double v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (NSArray)supportedTileTypeClusters
{
  supportedTileTypeClusters = self->_supportedTileTypeClusters;
  if (!supportedTileTypeClusters)
  {
    self->_supportedTileTypeClusters = (NSArray *)&unk_26D594100;

    supportedTileTypeClusters = self->_supportedTileTypeClusters;
  }
  return supportedTileTypeClusters;
}

- (id)clusterForItemsInRange:(_NSRange)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = -[SXMosaicGalleryLayouter itemsForRange:](self, "itemsForRange:", a3.location, a3.length);
  double v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "tileType", (void)v17);
        double v12 = [NSNumber numberWithInt:v11];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  double v13 = [(SXMosaicGalleryLayouter *)self supportedTileTypeClusters];
  int v14 = [v13 containsObject:v5];

  if (v14) {
    double v15 = [[SXMosaicGalleryCluster alloc] initWithItems:v6];
  }
  else {
    double v15 = 0;
  }

  return v15;
}

- (id)layoutForCluster:(id)a3 previousLayouts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 items];
  uint64_t v9 = [v8 count];

  double v10 = [v7 lastObject];

  BOOL v11 = [(SXMosaicGalleryLayouter *)self reverseNextHorizontalLivingRoomLayout];
  double v12 = (objc_class *)objc_opt_class();
  if (v9 == 2)
  {
    if (([v6 clusterIsEqualToTileTypes:&unk_26D594130] & 1) == 0
      && ![v6 clusterIsEqualToTileTypes:&unk_26D594148])
    {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v9 != 3) {
    goto LABEL_17;
  }
  if (![v6 isClusterOfType:3]
    || v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ([v6 clusterIsEqualToTileTypes:&unk_26D594118])
    {
      double v12 = (objc_class *)objc_opt_class();
LABEL_15:
      uint64_t v9 = 2;
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v9 = 3;
    goto LABEL_17;
  }
  double v13 = [(SXMosaicGalleryLayouter *)self dataSource];
  int v14 = [v13 documentColumnLayoutForGalleryLayouter:self];

  [v14 constrainedViewportSize];
  double v16 = v15;
  [v14 constrainedViewportSize];
  if (v16 <= v17) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  double v12 = (objc_class *)objc_opt_class();

LABEL_17:
  id v18 = [v12 alloc];
  long long v19 = [(SXMosaicGalleryLayouter *)self columnLayout];
  long long v20 = (void *)[v18 initWithCluster:v6 numberOfColumns:v9 columnLayout:v19];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v20 setReverseLayout:v11];
    [(SXMosaicGalleryLayouter *)self setReverseNextHorizontalLivingRoomLayout:v11 ^ 1];
  }

  return v20;
}

- (id)itemsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3.length];
  if (location < location + length)
  {
    do
    {
      id v7 = [(SXMosaicGalleryLayouter *)self itemAtIndex:location];
      [v6 addObject:v7];

      ++location;
      --length;
    }
    while (length);
  }
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v8;
}

- (id)itemAtIndex:(unint64_t)a3
{
  double v5 = [(SXMosaicGalleryLayouter *)self items];
  id v6 = [v5 objectAtIndex:a3];

  id v7 = [MEMORY[0x263EFF9D0] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [(SXMosaicGalleryLayouter *)self dataSource];
    [v9 galleryLayouter:self dimensionsForItemAtIndex:a3];
    double v11 = v10;
    double v13 = v12;

    int v14 = -[SXMosaicGalleryLayoutItem initWithDimensions:]([SXMosaicGalleryLayoutItem alloc], "initWithDimensions:", v11, v13);
    double v15 = [(SXMosaicGalleryLayouter *)self items];
    [v15 replaceObjectAtIndex:a3 withObject:v14];

    id v6 = v14;
  }
  return v6;
}

- (unint64_t)numberOfItems
{
  if (self->_numberOfItems == -1)
  {
    v3 = [(SXMosaicGalleryLayouter *)self dataSource];
    self->_numberOfItems = [v3 numberOfItemsForGalleryLayouter:self];

    id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numberOfItems];
    items = self->_items;
    self->_items = v4;

    id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numberOfItems];
    frames = self->_frames;
    self->_frames = v6;

    if (self->_numberOfItems)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [(SXMosaicGalleryLayouter *)self items];
        double v10 = [MEMORY[0x263EFF9D0] null];
        [v9 addObject:v10];

        double v11 = [(SXMosaicGalleryLayouter *)self frames];
        double v12 = [MEMORY[0x263EFF9D0] null];
        [v11 addObject:v12];

        ++v8;
      }
      while (v8 < self->_numberOfItems);
    }
    double v13 = [(SXMosaicGalleryLayouter *)self views];

    if (!v13)
    {
      int v14 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numberOfItems];
      views = self->_views;
      self->_views = v14;
    }
    double v16 = [(SXMosaicGalleryLayouter *)self views];
    unint64_t v17 = [v16 count];
    unint64_t v18 = [(SXMosaicGalleryLayouter *)self numberOfItems];

    if (v17 < v18)
    {
      do
      {
        long long v19 = [(SXMosaicGalleryLayouter *)self views];
        long long v20 = [MEMORY[0x263EFF9D0] null];
        [v19 addObject:v20];

        double v21 = [(SXMosaicGalleryLayouter *)self views];
        unint64_t v22 = [v21 count];
        unint64_t v23 = [(SXMosaicGalleryLayouter *)self numberOfItems];
      }
      while (v22 < v23);
    }
    while (1)
    {
      double v25 = [(SXMosaicGalleryLayouter *)self views];
      unint64_t v26 = [v25 count];
      unint64_t v27 = [(SXMosaicGalleryLayouter *)self numberOfItems];

      if (v26 <= v27) {
        break;
      }
      double v24 = [(SXMosaicGalleryLayouter *)self views];
      [v24 removeLastObject];
    }
  }
  return self->_numberOfItems;
}

- (id)viewForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SXMosaicGalleryLayouter *)self items];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v7 = [(SXMosaicGalleryLayouter *)self views];
  unint64_t v8 = [v7 objectAtIndex:v6];

  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    double v11 = [(SXMosaicGalleryLayouter *)self dataSource];
    uint64_t v12 = [v11 galleryLayouter:self viewForItemAtIndex:v6];

    double v13 = [(SXMosaicGalleryLayouter *)self views];
    [v13 replaceObjectAtIndex:v6 withObject:v12];

    unint64_t v8 = (void *)v12;
  }
  return v8;
}

- (void)resetLayout
{
  self->_numberOfItems = -1;
  self->_contentSize = (CGSize)*MEMORY[0x263F001B0];
  columnLayout = self->_columnLayout;
  self->_columnLayout = 0;

  supportedTileTypeClusters = self->_supportedTileTypeClusters;
  self->_supportedTileTypeClusters = 0;

  [(SXMosaicGalleryLayouter *)self setReverseNextHorizontalLivingRoomLayout:0];
  double v5 = [(SXMosaicGalleryLayouter *)self items];
  [v5 removeAllObjects];

  uint64_t v6 = [(SXMosaicGalleryLayouter *)self layouts];
  [v6 removeAllObjects];

  id v7 = [(SXMosaicGalleryLayouter *)self clusters];
  [v7 removeAllObjects];

  id v8 = [(SXMosaicGalleryLayouter *)self frames];
  [v8 removeAllObjects];
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (SXMosaicGalleryLayouterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SXMosaicGalleryLayouterDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SXMosaicGalleryColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (NSMutableArray)clusters
{
  return self->_clusters;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSMutableArray)views
{
  return self->_views;
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (BOOL)reverseNextHorizontalLivingRoomLayout
{
  return self->_reverseNextHorizontalLivingRoomLayout;
}

- (void)setReverseNextHorizontalLivingRoomLayout:(BOOL)a3
{
  self->_reverseNextHorizontalLivingRoomLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_supportedTileTypeClusters, 0);
}

@end