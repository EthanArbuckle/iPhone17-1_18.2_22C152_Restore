@interface LayoutCardInfo
- (ContaineeProtocol)modalPresenter;
- (LayoutCardInfo)init;
- (NSLayoutConstraint)bottomToBottomContentConstraint;
- (NSLayoutConstraint)topToTopContentConstraint;
- (double)alpha;
- (unint64_t)backgroundLayout;
- (void)setAlpha:(double)a3;
- (void)setBackgroundLayout:(unint64_t)a3;
- (void)setBottomToBottomContentConstraint:(id)a3;
- (void)setModalPresenter:(id)a3;
- (void)setTopToTopContentConstraint:(id)a3;
@end

@implementation LayoutCardInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresenter, 0);
  objc_storeStrong((id *)&self->_topToTopContentConstraint, 0);

  objc_storeStrong((id *)&self->_bottomToBottomContentConstraint, 0);
}

- (LayoutCardInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)LayoutCardInfo;
  result = [(LayoutCardInfo *)&v3 init];
  if (result) {
    result->_alpha = 1.0;
  }
  return result;
}

- (NSLayoutConstraint)bottomToBottomContentConstraint
{
  return self->_bottomToBottomContentConstraint;
}

- (void)setBottomToBottomContentConstraint:(id)a3
{
}

- (NSLayoutConstraint)topToTopContentConstraint
{
  return self->_topToTopContentConstraint;
}

- (void)setTopToTopContentConstraint:(id)a3
{
}

- (ContaineeProtocol)modalPresenter
{
  return self->_modalPresenter;
}

- (void)setModalPresenter:(id)a3
{
}

- (unint64_t)backgroundLayout
{
  return self->_backgroundLayout;
}

- (void)setBackgroundLayout:(unint64_t)a3
{
  self->_backgroundLayout = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end