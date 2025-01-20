@interface TFFeedbackFormImageCollectionCell
+ (CGSize)_sizeForImage:(id)a3 constrainedToWidth:(double)a4;
+ (CGSize)_sizeForImages:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5;
+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6;
+ (UIEdgeInsets)_imageViewInsetsInTraitEnvironment:(id)a3;
- (NSMutableArray)imageViews;
- (TFFeedbackEntryImageCollection)imageCollectionEntry;
- (TFFeedbackFormImageCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_createImageView;
- (unint64_t)displayableDataType;
- (void)_setupImagesViewsForImages:(id)a3;
- (void)applyContentsOfEntry:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplayedDataImageCollection:(id)a3;
- (void)setImageCollectionEntry:(id)a3;
@end

@implementation TFFeedbackFormImageCollectionCell

- (TFFeedbackFormImageCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TFFeedbackFormImageCollectionCell;
  v4 = [(TFFeedbackFormBaseCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    imageViews = v4->_imageViews;
    v4->_imageViews = v5;
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)TFFeedbackFormImageCollectionCell;
  [(TFFeedbackFormBaseCell *)&v43 layoutSubviews];
  +[TFFeedbackFormImageCollectionCell _imageViewInsetsInTraitEnvironment:self];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TFFeedbackFormImageCollectionCell *)self traitCollection];
  uint64_t v12 = [v11 layoutDirection];

  v13 = [(TFFeedbackFormImageCollectionCell *)self contentView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v22 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    double v25 = v21 - (v4 + v8);
    double v26 = v19 - (v6 + v10);
    double v27 = v4 + v17;
    double v28 = v6 + v15;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v22);
        }
        v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v32 = [v31 image];
        v46.origin.x = v28;
        v46.origin.y = v27;
        v46.size.width = v26;
        v46.size.height = v25;
        +[TFFeedbackFormImageCollectionCell _sizeForImage:v32 constrainedToWidth:CGRectGetWidth(v46)];
        double v34 = v33;
        double v36 = v35;
        v47.origin.x = v28;
        v47.origin.y = v27;
        v47.size.width = v26;
        v47.size.height = v25;
        double MinX = CGRectGetMinX(v47);
        if (v12 == 1)
        {
          v48.origin.x = v28;
          v48.origin.y = v27;
          v48.size.width = v26;
          v48.size.height = v25;
          double v38 = CGRectGetMaxX(v48) - v34;
        }
        else
        {
          double v38 = MinX;
        }
        objc_msgSend(v31, "setFrame:", v38, v4, v34, v36);
        v49.origin.x = v38;
        v49.origin.y = v4;
        v49.size.width = v34;
        v49.size.height = v36;
        double v4 = v4 + CGRectGetHeight(v49) + 16.0;
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v24);
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TFFeedbackFormImageCollectionCell;
  [(TFFeedbackFormImageCollectionCell *)&v3 prepareForReuse];
  [(TFFeedbackFormImageCollectionCell *)self setImageCollectionEntry:0];
}

- (void)applyContentsOfEntry:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3) {
    [(TFFeedbackFormImageCollectionCell *)self setImageCollectionEntry:v4];
  }
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = [v11 identifier];
    double v15 = [v12 imageCollectionForIdentifer:v14];

    objc_msgSend(a1, "_sizeForImages:fittingSize:inTraitEnvironment:", v15, v13, width, height);
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v17 = *MEMORY[0x263F001B0];
    double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (unint64_t)displayableDataType
{
  return 3;
}

- (void)setDisplayedDataImageCollection:(id)a3
{
  id v4 = a3;
  [(TFFeedbackFormImageCollectionCell *)self _setupImagesViewsForImages:v4];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__TFFeedbackFormImageCollectionCell_setDisplayedDataImageCollection___block_invoke;
  v5[3] = &unk_26468ECE8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];

  [(TFFeedbackFormImageCollectionCell *)self setNeedsLayout];
}

void __69__TFFeedbackFormImageCollectionCell_setDisplayedDataImageCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = [v4 imageViews];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  [v7 setImage:v5];
}

- (void)_setupImagesViewsForImages:(id)a3
{
  id v4 = a3;
  id v20 = v4;
  if (v4) {
    unint64_t v5 = [v4 count];
  }
  else {
    unint64_t v5 = 0;
  }
  double v6 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
  uint64_t v7 = [v6 count];

  if (v7 != v5)
  {
    double v8 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
    unint64_t v9 = [v8 count];

    double v10 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
    uint64_t v11 = [v10 count];

    if (v9 >= v5)
    {
      unint64_t v16 = v11 - v5;
      if ((uint64_t)(v11 - v5) >= 1)
      {
        do
        {
          double v17 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
          double v18 = [v17 lastObject];

          [v18 removeFromSuperview];
          double v19 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
          [v19 removeObject:v18];

          --v16;
        }
        while (v16);
      }
    }
    else
    {
      unint64_t v12 = v5 - v11;
      if ((uint64_t)(v5 - v11) >= 1)
      {
        do
        {
          id v13 = [(TFFeedbackFormImageCollectionCell *)self _createImageView];
          double v14 = [(TFFeedbackFormImageCollectionCell *)self contentView];
          [v14 addSubview:v13];

          double v15 = [(TFFeedbackFormImageCollectionCell *)self imageViews];
          [v15 addObject:v13];

          --v12;
        }
        while (v12);
      }
    }
  }
}

- (id)_createImageView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [v3 setContentMode:1];
  id v4 = [(TFFeedbackFormImageCollectionCell *)self contentView];
  [v4 addSubview:v3];

  return v3;
}

+ (UIEdgeInsets)_imageViewInsetsInTraitEnvironment:(id)a3
{
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:a3];

  MEMORY[0x270F05FE0](15);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)_sizeForImages:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width = a4.width;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    +[TFFeedbackFormImageCollectionCell _imageViewInsetsInTraitEnvironment:a5];
    double v10 = v9;
    double v12 = v11;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      double v16 = width - v10 - v12;
      uint64_t v17 = *(void *)v25;
      double v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(a1, "_sizeForImage:constrainedToWidth:", *(void *)(*((void *)&v24 + 1) + 8 * i), v16, (void)v24);
          double v18 = v18 + v20;
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }
    else
    {
      double v18 = 0.0;
    }

    double v21 = v18 + (double)(unint64_t)([v13 count] - 1) * 16.0 + 15.0 + 30.0;
  }
  else
  {
    double width = *MEMORY[0x263F001B0];
    double v21 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v22 = width;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

+ (CGSize)_sizeForImage:(id)a3 constrainedToWidth:(double)a4
{
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    [v5 size];
    double v8 = v7;
    [v6 size];
    if (v8 <= a4)
    {
      double v13 = v10;
      a4 = v9;
    }
    else
    {
      double v11 = a4 / v9;
      [v6 size];
      double v13 = v11 * v12;
    }
  }
  else
  {
    a4 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v14 = a4;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (TFFeedbackEntryImageCollection)imageCollectionEntry
{
  return self->_imageCollectionEntry;
}

- (void)setImageCollectionEntry:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);

  objc_storeStrong((id *)&self->_imageCollectionEntry, 0);
}

@end