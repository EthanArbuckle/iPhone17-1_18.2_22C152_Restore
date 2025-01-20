@interface COSFeatureHighlightView
- (BOOL)flattenImages;
- (CGSize)_sizeThatFits:(CGSize)a3 doLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSFeatureHighlightDataSource)dataSource;
- (COSFeatureHighlightView)initWithFrame:(CGRect)a3;
- (NSMutableArray)features;
- (double)rowHeight;
- (id)localizedStringForString:(id)a3;
- (void)layoutSubviews;
- (void)setDataSource:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setFlattenImages:(BOOL)a3;
- (void)showFeaturesForDataSource:(id)a3;
@end

@implementation COSFeatureHighlightView

- (COSFeatureHighlightView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COSFeatureHighlightView;
  v3 = -[COSFeatureHighlightView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    features = v3->_features;
    v3->_features = (NSMutableArray *)v4;

    [(COSFeatureHighlightView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (id)localizedStringForString:(id)a3
{
  return 0;
}

- (double)rowHeight
{
  return 90.0;
}

- (void)showFeaturesForDataSource:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    id v29 = v4;
    objc_storeWeak((id *)&self->_dataSource, v4);
    [(NSMutableArray *)self->_features makeObjectsPerformSelector:"removeFromSuperview"];
    [(NSMutableArray *)self->_features removeAllObjects];
    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_super v7 = [v6 features];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v16 = -[COSFeatureHighlightRowView initWithFrame:]([COSFeatureHighlightRowView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
          [(NSMutableArray *)self->_features addObject:v16];
          [(COSFeatureHighlightView *)self addSubview:v16];
          BOOL flattenImages = self->_flattenImages;
          v18 = [v15 objectForKeyedSubscript:@"i"];
          v19 = +[UIImage imageNamed:v18];
          if (flattenImages)
          {
            v20 = BPSSetupTintColor();
            uint64_t v21 = [v19 _flatImageWithColor:v20];

            v19 = (void *)v21;
          }

          v22 = [(COSFeatureHighlightRowView *)v16 imageView];
          [v22 setImage:v19];

          v23 = [(COSFeatureHighlightRowView *)v16 title];
          v24 = [v15 objectForKeyedSubscript:@"t"];
          v25 = [(COSFeatureHighlightView *)self localizedStringForString:v24];
          [v23 setText:v25];

          v26 = [(COSFeatureHighlightRowView *)v16 body];
          v27 = [v15 objectForKeyedSubscript:@"b"];
          v28 = [(COSFeatureHighlightView *)self localizedStringForString:v27];
          [v26 setText:v28];
        }
        id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }

    id v4 = v29;
  }
  [(COSFeatureHighlightView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  [(COSFeatureHighlightView *)self bounds];

  -[COSFeatureHighlightView _sizeThatFits:doLayout:](self, "_sizeThatFits:doLayout:", 1, v3, v4);
}

- (CGSize)_sizeThatFits:(CGSize)a3 doLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  [(COSFeatureHighlightView *)self rowHeight];
  double v8 = v7;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = self->_features;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    double v13 = 0.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v15 sizeThatFits:width v8:v24];
        CGFloat v18 = v16;
        double v19 = v17;
        if (v17 >= v8) {
          double v20 = v17;
        }
        else {
          double v20 = v8;
        }
        if (v4) {
          [v15 setFrame:0.0, v13, v16, v20];
        }
        v30.origin.x = 0.0;
        v30.origin.double y = v13;
        v30.size.double width = v18;
        v30.size.double height = v20;
        double MaxY = CGRectGetMaxY(v30);
        if (v19 <= v8) {
          double v13 = MaxY;
        }
        else {
          double v13 = MaxY + 6.0;
        }
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  double v22 = width;
  double v23 = v13;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[COSFeatureHighlightView _sizeThatFits:doLayout:](self, "_sizeThatFits:doLayout:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)flattenImages
{
  return self->_flattenImages;
}

- (void)setFlattenImages:(BOOL)a3
{
  self->_BOOL flattenImages = a3;
}

- (COSFeatureHighlightDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (COSFeatureHighlightDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end