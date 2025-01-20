@interface UIDebuggingInformationHierarchyLineView
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation UIDebuggingInformationHierarchyLineView

- (void)layoutSubviews
{
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyLineView;
  [(UICollectionReusableView *)&v7 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 lineColor];
    lineColor = self->_lineColor;
    self->_lineColor = v5;
  }
}

- (void).cxx_destruct
{
}

@end