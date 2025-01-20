@interface _VideosExtrasShelfCollectionViewLayout
- (CGSize)calculatedContentSize;
- (CGSize)collectionViewContentSize;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)_calculateSizes;
- (void)prepareLayout;
@end

@implementation _VideosExtrasShelfCollectionViewLayout

- (void)_calculateSizes
{
  if (!self->_rects)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = [(_VideosExtrasShelfCollectionViewLayout *)self collectionView];
    v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();
    char v6 = objc_opt_respondsToSelector() & 1;
    char v7 = objc_opt_respondsToSelector() & 1;
    if (v5)
    {
      uint64_t v8 = *MEMORY[0x1E4F1DB30];
      uint64_t v9 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      [(UICollectionViewFlowLayout *)self itemSize];
      uint64_t v8 = v10;
      uint64_t v9 = v11;
    }
    if (v6)
    {
      uint64_t v12 = *MEMORY[0x1E4FB2848];
      uint64_t v13 = *(void *)(MEMORY[0x1E4FB2848] + 8);
      uint64_t v14 = *(void *)(MEMORY[0x1E4FB2848] + 16);
      uint64_t v15 = *(void *)(MEMORY[0x1E4FB2848] + 24);
    }
    else
    {
      [(UICollectionViewFlowLayout *)self sectionInset];
      uint64_t v12 = v16;
      uint64_t v13 = v17;
      uint64_t v14 = v18;
      uint64_t v15 = v19;
    }
    uint64_t v20 = 0;
    if ((v7 & 1) == 0)
    {
      [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
      uint64_t v20 = v21;
    }
    uint64_t v53 = 0;
    v54 = (CGRect *)&v53;
    uint64_t v55 = 0x4010000000;
    v56 = &unk_1E3ADDC25;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v57 = *MEMORY[0x1E4F1DB28];
    long long v58 = v22;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3010000000;
    v51[3] = &unk_1E3ADDC25;
    long long v52 = *MEMORY[0x1E4F1DAD8];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke;
    v41[3] = &unk_1E6DF6838;
    char v50 = v6;
    v45 = v51;
    id v42 = v4;
    id v43 = v3;
    v44 = self;
    uint64_t v46 = v12;
    uint64_t v47 = v13;
    uint64_t v48 = v14;
    uint64_t v49 = v15;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke_2;
    v29[3] = &unk_1E6DF6860;
    char v39 = v5 & 1;
    id v23 = v42;
    id v30 = v23;
    id v24 = v43;
    id v31 = v24;
    v32 = self;
    uint64_t v36 = v8;
    uint64_t v37 = v9;
    v34 = v51;
    v25 = (NSDictionary *)v28;
    v33 = v25;
    v35 = &v53;
    char v40 = v7;
    uint64_t v38 = v20;
    _MPUEnumerateItemsOfCollectionView(v24, v41, v29);
    CGRect v59 = CGRectStandardize(v54[1]);
    self->_contentSize.width = v59.size.width;
    self->_contentSize.height = v59.size.height;
    rects = self->_rects;
    self->_rects = v25;
    v27 = v25;

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(&v53, 8);
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(UICollectionViewFlowLayout *)self scrollDirection])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = self->_rects;
    uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB15E0], "layoutAttributesForCellWithIndexPath:", v14, (void)v18);
          uint64_t v16 = [(NSDictionary *)self->_rects objectForKey:v14];
          [v16 CGRectValue];
          objc_msgSend(v15, "setFrame:");

          [v8 addObject:v15];
        }
        uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
    -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v22, sel_layoutAttributesForElementsInRect_, x, y, width, height);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v3 prepareLayout];
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1) {
    [(_VideosExtrasShelfCollectionViewLayout *)self _calculateSizes];
  }
}

- (CGSize)collectionViewContentSize
{
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1)
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
    [(UICollectionViewFlowLayout *)&v5 collectionViewContentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)calculatedContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end