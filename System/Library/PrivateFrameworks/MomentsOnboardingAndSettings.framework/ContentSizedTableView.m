@interface ContentSizedTableView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithCoder:(id)a3;
- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation ContentSizedTableView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ContentSizedTableView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v5 = v6.receiver;
  -[ContentSizedTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);
}

- (CGSize)intrinsicContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v4 = self;
  [(ContentSizedTableView *)v4 layoutIfNeeded];
  double v5 = *MEMORY[0x263F83C20];
  v10.receiver = v4;
  v10.super_class = ObjectType;
  [(ContentSizedTableView *)&v10 contentSize];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[ContentSizedTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ContentSizedTableView *)&v5 initWithCoder:a3];
}

@end