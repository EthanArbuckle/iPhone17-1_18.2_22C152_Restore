@interface TLKDescriptionContainerBoxView
- (TLKTextView)viewForFirstAndLastBaseline;
- (id)calculateViewForFirstBaselineLayout;
- (void)setViewForFirstAndLastBaseline:(id)a3;
@end

@implementation TLKDescriptionContainerBoxView

- (id)calculateViewForFirstBaselineLayout
{
  v3 = [(TLKDescriptionContainerBoxView *)self viewForFirstAndLastBaseline];
  v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (TLKTextView)viewForFirstAndLastBaseline
{
  return self->_viewForFirstAndLastBaseline;
}

- (void)setViewForFirstAndLastBaseline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end