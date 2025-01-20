@interface UnselectableLinkEnabledTextView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation UnselectableLinkEnabledTextView

- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return -[UnselectableLinkEnabledTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return [(UnselectableLinkEnabledTextView *)&v5 initWithCoder:a3];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v5 = a3;
    v6 = self;
  }
  else
  {
    self;
    v8 = (void *)swift_dynamicCastObjCClass();
    id v9 = a3;
    objc_super v10 = self;
    if (!v8 || (uint64_t)objc_msgSend(v8, sel_numberOfTapsRequired) <= 1)
    {
      v12.receiver = v10;
      v12.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
      BOOL v7 = [(UnselectableLinkEnabledTextView *)&v12 gestureRecognizerShouldBegin:v9];

      return v7;
    }
  }
  objc_msgSend(a3, sel_setEnabled_, 0);

  return 0;
}

@end