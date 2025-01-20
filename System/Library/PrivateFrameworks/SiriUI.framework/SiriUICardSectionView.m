@interface SiriUICardSectionView
+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4;
- (CGSize)contentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (CRKComposableView)composedSuperview;
- (NSString)cardSectionViewIdentifier;
- (SiriUICardSectionView)initWithFrame:(CGRect)a3;
- (SiriUIReusableView)footerView;
- (SiriUIReusableView)headerView;
- (UIView)contentView;
- (double)footerViewHeight;
- (double)headerViewHeight;
- (id)accessibilityIdentifier;
- (void)layoutSubviews;
- (void)removeFromComposedSuperview;
- (void)setCardSectionViewIdentifier:(id)a3;
- (void)setComposedSuperview:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewHeight:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeaderViewHeight:(double)a3;
@end

@implementation SiriUICardSectionView

- (SiriUICardSectionView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUICardSectionView;
  v3 = -[SiriUICardSectionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    cardSectionViewIdentifier = v3->_cardSectionViewIdentifier;
    v3->_cardSectionViewIdentifier = (NSString *)v5;
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = self->_contentSize.height + self->_headerViewHeight + self->_footerViewHeight;
  result.height = v3;
  return result;
}

- (void)setContentView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    contentView = (UIView *)[(SiriUICardSectionView *)self addSubview:self->_contentView];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](contentView, v5);
}

- (void)setHeaderView:(id)a3
{
  uint64_t v5 = (SiriUIReusableView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    [(SiriUIReusableView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    headerView = (SiriUIReusableView *)[(SiriUICardSectionView *)self addSubview:self->_headerView];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](headerView, v5);
}

- (void)setFooterView:(id)a3
{
  uint64_t v5 = (SiriUIReusableView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v7 = v5;
    [(SiriUIReusableView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    footerView = (SiriUIReusableView *)[(SiriUICardSectionView *)self addSubview:self->_footerView];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](footerView, v5);
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SiriUICardSectionView;
  [(SiriUICardSectionView *)&v20 layoutSubviews];
  [(SiriUICardSectionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (!self->_headerView || (double headerViewHeight = self->_headerViewHeight, headerViewHeight <= 0.0))
  {
    [(id)objc_opt_class() defaultHeight];
    double headerViewHeight = v12;
  }
  if (!self->_footerView || (double footerViewHeight = self->_footerViewHeight, footerViewHeight <= 0.0))
  {
    [(id)objc_opt_class() defaultHeight];
    double footerViewHeight = v14;
  }
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  -[SiriUIReusableView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v21), headerViewHeight);
  contentView = self->_contentView;
  [(SiriUIReusableView *)self->_headerView frame];
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[UIView setFrame:](contentView, "setFrame:", 0.0, MaxY, Width, CGRectGetMaxY(v24) - headerViewHeight - footerViewHeight);
  footerView = self->_footerView;
  [(UIView *)self->_contentView frame];
  double v19 = CGRectGetMaxY(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[SiriUIReusableView setFrame:](footerView, "setFrame:", 0.0, v19, CGRectGetWidth(v26), footerViewHeight);
}

- (id)accessibilityIdentifier
{
  return @"SiriUICardSectionViewAccessibilityIdentifier";
}

+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)removeFromComposedSuperview
{
  id v3 = [(SiriUICardSectionView *)self composedSuperview];
  [v3 cardSectionSubviewWantsToBeRemovedFromHierarchy:self];
}

- (CRKComposableView)composedSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedSuperview);
  return (CRKComposableView *)WeakRetained;
}

- (void)setComposedSuperview:(id)a3
{
}

- (NSString)cardSectionViewIdentifier
{
  return self->_cardSectionViewIdentifier;
}

- (void)setCardSectionViewIdentifier:(id)a3
{
}

- (SiriUIReusableView)headerView
{
  return self->_headerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SiriUIReusableView)footerView
{
  return self->_footerView;
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_double headerViewHeight = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (void)setFooterViewHeight:(double)a3
{
  self->_double footerViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cardSectionViewIdentifier, 0);
  objc_destroyWeak((id *)&self->_composedSuperview);
}

@end