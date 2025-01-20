@interface CustomBackButtonNavigationBarTitleView
- (_TtC23ShelfKitCollectionViews38CustomBackButtonNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews38CustomBackButtonNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)contentDidChange;
- (void)layoutSubviews;
@end

@implementation CustomBackButtonNavigationBarTitleView

- (void)layoutSubviews
{
  v2 = self;
  sub_2ACF44();
}

- (void)contentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CustomBackButtonNavigationBarTitleView *)&v3 contentDidChange];
  [v2 setNeedsLayout];
}

- (_TtC23ShelfKitCollectionViews38CustomBackButtonNavigationBarTitleView)initWithFrame:(CGRect)a3
{
}

- (_TtC23ShelfKitCollectionViews38CustomBackButtonNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2AD4D8();
}

- (void).cxx_destruct
{
}

@end