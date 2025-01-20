@interface EmptyStateView
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityElements;
- (NSString)accessibilityLabel;
- (_TtC5TeaUI14EmptyStateView)initWithCoder:(id)a3;
- (_TtC5TeaUI14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation EmptyStateView

- (_TtC5TeaUI14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  EmptyStateView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  EmptyStateView.layoutSubviews()();
}

- (_TtC5TeaUI14EmptyStateView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC5TeaUI14EmptyStateView_model);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI14EmptyStateView_styler);
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  EmptyStateView.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_1B61B20F0();
  }
  uint64_t v4 = self;
  EmptyStateView.accessibilityLabel.setter();
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B61B24E0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  EmptyStateView.accessibilityElements.setter(v4);
}

@end