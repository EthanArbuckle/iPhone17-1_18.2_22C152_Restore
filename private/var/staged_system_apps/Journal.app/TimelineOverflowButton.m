@interface TimelineOverflowButton
- (_TtC7Journal22TimelineOverflowButton)initWithCoder:(id)a3;
- (_TtC7Journal22TimelineOverflowButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
- (void)updateMenu;
@end

@implementation TimelineOverflowButton

- (_TtC7Journal22TimelineOverflowButton)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC7Journal22TimelineOverflowButton_delegate;
  *(void *)&self->placement[OBJC_IVAR____TtC7Journal22TimelineOverflowButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  swift_weakInit();
  v5 = self;
  sub_1000109BC((uint64_t)v4);
  swift_weakDestroy();

  type metadata accessor for TimelineOverflowButton();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_10039A814();
}

- (void)updateMenu
{
  v2 = self;
  Class v3 = sub_10039AAA0();
  [(TimelineOverflowButton *)v2 setMenu:v3];
}

- (_TtC7Journal22TimelineOverflowButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal22TimelineOverflowButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal22TimelineOverflowButton_delegate);

  swift_weakDestroy();
}

@end