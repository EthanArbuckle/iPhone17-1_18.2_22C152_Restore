@interface ModalToolbarFeatureProvider.LabelContainer
- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithCoder:(id)a3;
- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ModalToolbarFeatureProvider.LabelContainer

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  id v7 = v14.receiver;
  id v8 = a4;
  id v9 = -[ModalToolbarFeatureProvider.LabelContainer hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    objc_msgSend(v7, sel_bounds, v14.receiver, v14.super_class);
    v17.origin.double x = UIEdgeInsetsInsetRect(v11);
    v16.double x = x;
    v16.double y = y;
    BOOL v12 = CGRectContainsPoint(v17, v16);

    if (v12) {
      goto LABEL_6;
    }
    id v10 = 0;
  }

  id v7 = v10;
LABEL_6:
  return v7;
}

- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  return -[ModalToolbarFeatureProvider.LabelContainer initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  return [(ModalToolbarFeatureProvider.LabelContainer *)&v5 initWithCoder:a3];
}

@end