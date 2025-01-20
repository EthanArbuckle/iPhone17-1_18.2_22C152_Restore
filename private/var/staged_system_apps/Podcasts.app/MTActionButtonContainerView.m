@interface MTActionButtonContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTActionButtonContainerView)initWithActionButtons:(id)a3;
- (NSArray)actionButtons;
- (void)layoutSubviews;
- (void)setActionButtons:(id)a3;
@end

@implementation MTActionButtonContainerView

- (MTActionButtonContainerView)initWithActionButtons:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTActionButtonContainerView;
  v5 = -[MTActionButtonContainerView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = +[UIColor whiteColor];
    [(MTActionButtonContainerView *)v5 setBackgroundColor:v6];

    [(MTActionButtonContainerView *)v5 setActionButtons:v4];
  }

  return v5;
}

- (void)setActionButtons:(id)a3
{
  id v4 = (NSArray *)a3;
  [(NSArray *)self->_actionButtons makeObjectsPerformSelector:"removeFromSuperview"];
  actionButtons = self->_actionButtons;
  self->_actionButtons = v4;
  v6 = v4;

  v7 = self->_actionButtons;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000600A0;
  v8[3] = &unk_10054D400;
  v8[4] = self;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  [(MTActionButtonContainerView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [(MTActionButtonContainerView *)self actionButtons];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100060190;
  v9[3] = &unk_10054D428;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  v9[4] = &v10;
  [v5 enumerateObjectsUsingBlock:v9];

  double v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  double v7 = v6;
  double v8 = height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MTActionButtonContainerView;
  [(MTActionButtonContainerView *)&v6 layoutSubviews];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v3 = [(MTActionButtonContainerView *)self actionButtons];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000602C4;
  v4[3] = &unk_10054D450;
  v4[4] = self;
  v4[5] = v5;
  [v3 enumerateObjectsUsingBlock:v4];

  _Block_object_dispose(v5, 8);
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void).cxx_destruct
{
}

@end