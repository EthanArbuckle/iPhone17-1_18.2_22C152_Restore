@interface TFFeedbackFormBaseCell
+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)result inTraitEnvironment:(id)a6;
- (BOOL)isSelectable;
- (CGRect)_separatorFrameForTop:(BOOL)a3 inLayoutBounds:(CGRect)a4;
- (TFFeedbackDataUpdateProxy)updateProxy;
- (TFFeedbackFormBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)bottomSeparator;
- (UIView)topSeparator;
- (id)_createSeparatorSubview;
- (unint64_t)displayableDataType;
- (void)_setupSeparatorViewsForAppearingInSectionLocation:(int)a3;
- (void)applyContentsOfEntry:(id)a3;
- (void)layoutSubviews;
- (void)prepareSeparatorsForCellInSectionLocation:(int)a3;
- (void)setBottomSeparator:(id)a3;
- (void)setTopSeparator:(id)a3;
- (void)setUpdateProxy:(id)a3;
@end

@implementation TFFeedbackFormBaseCell

- (TFFeedbackFormBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackFormBaseCell;
  v4 = [(TFFeedbackFormBaseCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    topSeparator = v4->_topSeparator;
    v4->_topSeparator = 0;

    bottomSeparator = v5->_bottomSeparator;
    v5->_bottomSeparator = 0;
  }
  return v5;
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormBaseCell;
  [(TFFeedbackFormBaseCell *)&v21 layoutSubviews];
  [(TFFeedbackFormBaseCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TFFeedbackFormBaseCell *)self topSeparator];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(TFFeedbackFormBaseCell *)self topSeparator];
    char v14 = [v13 isHidden];

    if ((v14 & 1) == 0)
    {
      v15 = [(TFFeedbackFormBaseCell *)self topSeparator];
      -[TFFeedbackFormBaseCell _separatorFrameForTop:inLayoutBounds:](self, "_separatorFrameForTop:inLayoutBounds:", 1, v4, v6, v8, v10);
      objc_msgSend(v15, "setFrame:");
    }
  }
  uint64_t v16 = [(TFFeedbackFormBaseCell *)self bottomSeparator];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(TFFeedbackFormBaseCell *)self bottomSeparator];
    char v19 = [v18 isHidden];

    if ((v19 & 1) == 0)
    {
      v20 = [(TFFeedbackFormBaseCell *)self bottomSeparator];
      -[TFFeedbackFormBaseCell _separatorFrameForTop:inLayoutBounds:](self, "_separatorFrameForTop:inLayoutBounds:", 0, v4, v6, v8, v10);
      objc_msgSend(v20, "setFrame:");
    }
  }
}

- (void)applyContentsOfEntry:(id)a3
{
}

- (void)prepareSeparatorsForCellInSectionLocation:(int)a3
{
  [(TFFeedbackFormBaseCell *)self _setupSeparatorViewsForAppearingInSectionLocation:*(void *)&a3];

  [(TFFeedbackFormBaseCell *)self setNeedsLayout];
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)result inTraitEnvironment:(id)a6
{
  double v6 = 44.0;
  result.height = v6;
  return result;
}

- (unint64_t)displayableDataType
{
  return 0;
}

- (void)_setupSeparatorViewsForAppearingInSectionLocation:(int)a3
{
  unsigned int v4 = a3 - 3;
  if (a3 == 4 || a3 == 2)
  {
    double v5 = [(TFFeedbackFormBaseCell *)self topSeparator];

    if (!v5)
    {
      double v6 = [(TFFeedbackFormBaseCell *)self _createSeparatorSubview];
      [(TFFeedbackFormBaseCell *)self setTopSeparator:v6];
    }
    double v7 = [(TFFeedbackFormBaseCell *)self topSeparator];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    double v7 = [(TFFeedbackFormBaseCell *)self topSeparator];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHidden:v9];

  double v10 = [(TFFeedbackFormBaseCell *)self bottomSeparator];
  id v13 = v10;
  if (v4 > 1)
  {
    uint64_t v12 = 1;
  }
  else
  {

    if (!v13)
    {
      uint64_t v11 = [(TFFeedbackFormBaseCell *)self _createSeparatorSubview];
      [(TFFeedbackFormBaseCell *)self setBottomSeparator:v11];
    }
    double v10 = [(TFFeedbackFormBaseCell *)self bottomSeparator];
    id v13 = v10;
    uint64_t v12 = 0;
  }
  [v10 setHidden:v12];
}

- (id)_createSeparatorSubview
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  unsigned int v4 = [MEMORY[0x263F1C550] separatorColor];
  [v3 setBackgroundColor:v4];

  [(TFFeedbackFormBaseCell *)self addSubview:v3];

  return v3;
}

- (CGRect)_separatorFrameForTop:(BOOL)a3 inLayoutBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 scale];
  double v11 = 1.0 / v10;

  double v12 = 0.0;
  if (!a3)
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double v12 = CGRectGetMaxY(v17) - v11;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v18);
  double v14 = 0.0;
  double v15 = v12;
  double v16 = v11;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (TFFeedbackDataUpdateProxy)updateProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateProxy);

  return (TFFeedbackDataUpdateProxy *)WeakRetained;
}

- (void)setUpdateProxy:(id)a3
{
}

- (UIView)topSeparator
{
  return self->_topSeparator;
}

- (void)setTopSeparator:(id)a3
{
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);

  objc_destroyWeak((id *)&self->_updateProxy);
}

@end