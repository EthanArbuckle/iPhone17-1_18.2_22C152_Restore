@interface BKLibraryBookshelfNoBooks
+ (id)_createDescriptionDetailLabel:(CGRect)a3;
+ (id)_createDescriptionHeaderLabel:(CGRect)a3;
+ (void)_layoutDescriptionHeader:(id)a3 detail:(id)a4 topMargin:(double)a5 descWidth:(double)a6 spacing:(double)a7 inRect:(CGRect)a8;
+ (void)adjustHeight:(id)a3 withDataSource:(id)a4;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryBookshelfNoBooks)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (UILabel)descriptionDetailLabel;
- (UILabel)descriptionHeaderLabel;
- (double)descriptionSpacing;
- (double)descriptionTopMargin;
- (double)descriptionWidth;
- (void)_updateLabels;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setDataSource:(id)a3;
- (void)setDescriptionDetailLabel:(id)a3;
- (void)setDescriptionHeaderLabel:(id)a3;
- (void)setDescriptionSpacing:(double)a3;
- (void)setDescriptionTopMargin:(double)a3;
- (void)setDescriptionWidth:(double)a3;
- (void)setMainHeaderMetrics:(id)a3;
@end

@implementation BKLibraryBookshelfNoBooks

+ (id)_createDescriptionHeaderLabel:(CGRect)a3
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  [v3 setNumberOfLines:0];

  return v3;
}

+ (id)_createDescriptionDetailLabel:(CGRect)a3
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  [v3 setNumberOfLines:0];

  return v3;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 mainHeaderMetrics];
  id v33 = [v7 noBooksDescriptionHeaderFontAttributes];

  v8 = [v6 mainHeaderMetrics];
  v9 = [v8 noBooksDescriptionFontAttributes];

  [v6 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v6 mainHeaderMetrics];
  [v18 noBooksDescriptionTopMargin];
  double v20 = v19;

  v21 = [v6 mainHeaderMetrics];
  [v21 noBooksDescriptionSpacing];
  double v23 = v22;

  v24 = [v6 mainHeaderMetrics];
  [v24 noBooksDescriptionWidth];
  double v26 = v25;

  v27 = +[BKLibraryBookshelfNoBooks _createDescriptionHeaderLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionHeaderLabel:", v11, v13, v15, v17);
  v28 = +[BKLibraryBookshelfNoBooks _createDescriptionDetailLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionDetailLabel:", v11, v13, v15, v17);
  v29 = [v5 noBooksDescriptionHeader];
  v30 = +[TUIFontSpec attributedStringWith:v29 attributes:v33];
  [v27 setAttributedText:v30];

  v31 = [v5 noBooksDescription];

  v32 = +[TUIFontSpec attributedStringWith:v31 attributes:v9];
  [v28 setAttributedText:v32];

  +[BKLibraryBookshelfNoBooks _layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:](BKLibraryBookshelfNoBooks, "_layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:", v27, v28, v20, v26, v23, v11, v13, v15, v17);
  [v28 frame];
  [v6 setFrame:v11, v13, v15, CGRectGetMaxY(v35) * 1.2];
}

+ (void)_layoutDescriptionHeader:(id)a3 detail:(id)a4 topMargin:(double)a5 descWidth:(double)a6 spacing:(double)a7 inRect:(CGRect)a8
{
  CGFloat height = a8.size.height;
  double width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v33 = a3;
  id v16 = a4;
  uint64_t v17 = [v33 attributedText];
  if (v17)
  {
    v18 = (void *)v17;
    double v19 = [v16 attributedText];

    if (v19)
    {
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.double width = width;
      v35.size.CGFloat height = height;
      double v20 = CGRectGetHeight(v35);
      [v33 sizeThatFits:width, CGRectZero.size.height];
      CGFloat rect = v21;
      double v32 = a7;
      double v22 = round(v20 * a5 / 100.0);
      [v33 setFrame:(width - width) * 0.5, v22, width, v21];
      double v23 = [v16 attributedText];
      [v23 size];
      double v24 = a6;
      double v26 = v25;

      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.double width = width;
      v36.size.CGFloat height = height;
      double v27 = CGRectGetWidth(v36);
      if (v27 >= v26 / v24) {
        double v28 = v26 / v24;
      }
      else {
        double v28 = v27;
      }
      [v16 sizeThatFits:v28];
      double v30 = v29;
      v37.origin.CGFloat x = (width - width) * 0.5;
      v37.origin.CGFloat y = v22;
      v37.size.double width = width;
      v37.size.CGFloat height = rect;
      [v16 setFrame:(width - v28) * 0.5, CGRectGetMaxY(v37) + v32, v28, v30];
    }
  }
}

- (BKLibraryBookshelfNoBooks)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfNoBooks;
  v7 = -[BKLibraryBookshelfNoBooks initWithFrame:](&v11, "initWithFrame:");
  if (v7)
  {
    v8 = +[BKLibraryBookshelfNoBooks _createDescriptionHeaderLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionHeaderLabel:", x, y, width, height);
    [(BKLibraryBookshelfNoBooks *)v7 addSubview:v8];
    [(BKLibraryBookshelfNoBooks *)v7 setDescriptionHeaderLabel:v8];
    v9 = +[BKLibraryBookshelfNoBooks _createDescriptionDetailLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionDetailLabel:", x, y, width, height);
    [(BKLibraryBookshelfNoBooks *)v7 addSubview:v9];
    [(BKLibraryBookshelfNoBooks *)v7 setDescriptionDetailLabel:v9];
  }
  return v7;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookshelfNoBooks;
  [(BKLibraryBookshelfNoBooks *)&v18 layoutSubviews];
  [(BKLibraryBookshelfNoBooks *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(BKLibraryBookshelfNoBooks *)self descriptionHeaderLabel];
  double v12 = [(BKLibraryBookshelfNoBooks *)self descriptionDetailLabel];
  [(BKLibraryBookshelfNoBooks *)self descriptionTopMargin];
  double v14 = v13;
  [(BKLibraryBookshelfNoBooks *)self descriptionWidth];
  double v16 = v15;
  [(BKLibraryBookshelfNoBooks *)self descriptionSpacing];
  +[BKLibraryBookshelfNoBooks _layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:](BKLibraryBookshelfNoBooks, "_layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:", v11, v12, v14, v16, v17, v4, v6, v8, v10);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfNoBooks;
  [(BKLibraryBookshelfNoBooks *)&v17 applyLayoutAttributes:v4];
  id v5 = v4;
  if ([v5 layoutDebugMode])
  {
    double v6 = +[UIColor redColor];
    id v7 = [v6 colorWithAlphaComponent:0.2];
    id v8 = [v7 CGColor];
    double v9 = [(BKLibraryBookshelfNoBooks *)self layer];
    [v9 setBorderColor:v8];

    double v10 = [(BKLibraryBookshelfNoBooks *)self layer];
    objc_super v11 = v10;
    double v12 = 0.5;
  }
  else
  {
    double v10 = [(BKLibraryBookshelfNoBooks *)self layer];
    objc_super v11 = v10;
    double v12 = 0.0;
  }
  [v10 setBorderWidth:v12];

  double v13 = [v5 mainHeaderMetrics];
  [(BKLibraryBookshelfNoBooks *)self setMainHeaderMetrics:v13];

  double v14 = [v5 mainHeaderMetrics];
  [v14 noBooksDescriptionTopMargin];
  -[BKLibraryBookshelfNoBooks setDescriptionTopMargin:](self, "setDescriptionTopMargin:");

  double v15 = [v5 mainHeaderMetrics];
  [v15 noBooksDescriptionSpacing];
  -[BKLibraryBookshelfNoBooks setDescriptionSpacing:](self, "setDescriptionSpacing:");

  double v16 = [v5 mainHeaderMetrics];

  [v16 noBooksDescriptionWidth];
  -[BKLibraryBookshelfNoBooks setDescriptionWidth:](self, "setDescriptionWidth:");

  [(BKLibraryBookshelfNoBooks *)self _updateLabels];
}

- (void)_updateLabels
{
  double v3 = [(BKLibraryBookshelfNoBooks *)self dataSource];

  if (v3)
  {
    id v4 = [(BKLibraryBookshelfNoBooks *)self dataSource];
    id v5 = [v4 noBooksDescriptionHeader];
    double v6 = [(BKLibraryBookshelfNoBooks *)self mainHeaderMetrics];
    id v7 = [v6 noBooksDescriptionHeaderFontAttributes];
    id v8 = +[TUIFontSpec attributedStringWith:v5 attributes:v7];
    double v9 = [(BKLibraryBookshelfNoBooks *)self descriptionHeaderLabel];
    [v9 setAttributedText:v8];

    double v10 = [(BKLibraryBookshelfNoBooks *)self dataSource];
    objc_super v11 = [v10 noBooksDescription];
    double v12 = [(BKLibraryBookshelfNoBooks *)self mainHeaderMetrics];
    double v13 = [v12 noBooksDescriptionFontAttributes];
    double v14 = +[TUIFontSpec attributedStringWith:v11 attributes:v13];
    double v15 = [(BKLibraryBookshelfNoBooks *)self descriptionDetailLabel];
    [v15 setAttributedText:v14];

    [(BKLibraryBookshelfNoBooks *)self setNeedsLayout];
  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);

  [(BKLibraryBookshelfNoBooks *)self _updateLabels];
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (UILabel)descriptionHeaderLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionHeaderLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDescriptionHeaderLabel:(id)a3
{
}

- (UILabel)descriptionDetailLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionDetailLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDescriptionDetailLabel:(id)a3
{
}

- (double)descriptionWidth
{
  return self->_descriptionWidth;
}

- (void)setDescriptionWidth:(double)a3
{
  self->_descriptionWidth = a3;
}

- (double)descriptionTopMargin
{
  return self->_descriptionTopMargin;
}

- (void)setDescriptionTopMargin:(double)a3
{
  self->_descriptionTopMargin = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionDetailLabel);
  objc_destroyWeak((id *)&self->_descriptionHeaderLabel);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end