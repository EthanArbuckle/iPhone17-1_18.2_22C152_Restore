@interface iCloudStatusFooter
- (_TtC8Freeform18iCloudStatusFooter)initWithCoder:(id)a3;
- (_TtC8Freeform18iCloudStatusFooter)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation iCloudStatusFooter

- (_TtC8Freeform18iCloudStatusFooter)initWithFrame:(CGRect)a3
{
  sub_10057261C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8Freeform18iCloudStatusFooter)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Freeform18iCloudStatusFooter_iCloudStatusLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform18iCloudStatusFooter_syncDidEndObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform18iCloudStatusFooter_syncDidBeginObserver) = 0;

  result = (_TtC8Freeform18iCloudStatusFooter *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  iCloudStatusFooter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform18iCloudStatusFooter_iCloudStatusLabel));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end