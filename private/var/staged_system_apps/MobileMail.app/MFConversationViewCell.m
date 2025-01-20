@interface MFConversationViewCell
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3;
- (BOOL)disallowsHighlighting;
- (ConversationCellViewModel)viewModel;
- (EMCollectionItemID)itemID;
- (MFConversationViewCell)initWithFrame:(CGRect)a3;
- (MFMessageDisplayMetrics)displayMetrics;
- (UIView)contentWrapperView;
- (void)_displayMetricsDidChange;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutMarginsDidChange;
- (void)prepareForReuse;
- (void)setContentWrapperView:(id)a3;
- (void)setDisallowsHighlighting:(BOOL)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setItemID:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MFConversationViewCell

- (MFConversationViewCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MFConversationViewCell;
  v3 = -[MFConversationViewCell initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MFConversationViewCell *)v3 contentView];
    [v5 setClipsToBounds:1];

    [(MFConversationViewCell *)v4 setPreservesSuperviewLayoutMargins:1];
    id v6 = objc_alloc((Class)UIView);
    [(MFConversationViewCell *)v4 bounds];
    id v7 = [v6 initWithFrame:];
    [(MFConversationViewCell *)v4 setContentWrapperView:v7];

    v8 = [(MFConversationViewCell *)v4 contentWrapperView];
    [v8 setAutoresizingMask:18];

    v9 = [(MFConversationViewCell *)v4 contentWrapperView];
    [(MFConversationViewCell *)v4 addSubview:v9];

    v10 = [(MFConversationViewCell *)v4 contentWrapperView];
    v11 = [(MFConversationViewCell *)v4 contentView];
    [v10 addSubview:v11];

    v12 = [(MFConversationViewCell *)v4 contentWrapperView];
    [v12 setInsetsLayoutMarginsFromSafeArea:0];

    v13 = [(MFConversationViewCell *)v4 contentView];
    [v13 setPreservesSuperviewLayoutMargins:1];

    v14 = [(MFConversationViewCell *)v4 contentView];
    [v14 setInsetsLayoutMarginsFromSafeArea:0];

    v15 = [(MFConversationViewCell *)v4 contentView];
    [v15 setLayoutMargins:0.0, 31.0, 0.0, 31.0];

    if (qword_100699A90 != -1) {
      dispatch_once(&qword_100699A90, &stru_10060B468);
    }
    if (byte_100699A88)
    {
      id v16 = +[UIColor lightGrayColor];
      id v17 = [v16 CGColor];
      v18 = [(MFConversationViewCell *)v4 layer];
      [v18 setBorderColor:v17];

      v19 = +[UIScreen mainScreen];
      [v19 scale];
      double v21 = v20;
      v22 = [(MFConversationViewCell *)v4 layer];
      [v22 setBorderWidth:1.0 / v21];
    }
    [(MFConversationViewCell *)v4 setInsetsLayoutMarginsFromSafeArea:0];
  }
  return v4;
}

- (void)setDisplayMetrics:(id)a3
{
  id v5 = a3;
  if ((-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFConversationViewCell *)self _displayMetricsDidChange];
  }
}

- (void)_displayMetricsDidChange
{
}

- (void)layoutMarginsDidChange
{
  v20.receiver = self;
  v20.super_class = (Class)MFConversationViewCell;
  [(MFConversationViewCell *)&v20 layoutMarginsDidChange];
  [(MFConversationViewCell *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MFConversationViewCell *)self contentView];
  [v11 layoutMargins];
  double v16 = v15;
  if (v10 < 31.0) {
    double v10 = 31.0;
  }
  if (v6 < 31.0) {
    double v6 = 31.0;
  }
  if (v6 == v13 && v4 == v12 && v10 == v14)
  {

    if (v8 == v16) {
      return;
    }
  }
  else
  {
  }
  v19 = [(MFConversationViewCell *)self contentView];
  [v19 setLayoutMargins:v4, v6, v8, v10];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationViewCell;
  [(MFConversationViewCell *)&v7 applyLayoutAttributes:v4];
  id v5 = [v4 zIndex];
  double v6 = [(MFConversationViewCell *)self layer];
  [v6 setZPosition:(double)(uint64_t)v5];
}

- (void)prepareForReuse
{
  [(MFConversationViewCell *)self setItemID:0];
  [(MFConversationViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MFConversationViewCell *)self contentWrapperView];
  [v11 setFrame:v4, v6, v8, v10];

  v12.receiver = self;
  v12.super_class = (Class)MFConversationViewCell;
  [(MFConversationViewCell *)&v12 prepareForReuse];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  return 1;
}

- (UIView)contentWrapperView
{
  return self->_contentWrapperView;
}

- (void)setContentWrapperView:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)disallowsHighlighting
{
  return self->_disallowsHighlighting;
}

- (void)setDisallowsHighlighting:(BOOL)a3
{
  self->_disallowsHighlighting = a3;
}

- (ConversationCellViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);

  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end