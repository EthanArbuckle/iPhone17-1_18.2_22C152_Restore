@interface NewslettersStateCommandHandler
- (_TtC7NewsUI230NewslettersStateCommandHandler)init;
- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3;
@end

@implementation NewslettersStateCommandHandler

- (_TtC7NewsUI230NewslettersStateCommandHandler)init
{
  result = (_TtC7NewsUI230NewslettersStateCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI230NewslettersStateCommandHandler_commandCenter);
  swift_unknownObjectRelease();
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI230NewslettersStateCommandHandler_commandCenter, a2, a3))
  {
    swift_getObjectType();
    v4 = self;
    sub_1DFDF53D0();
    sub_1DFDF1AE0();

    swift_release();
    swift_unknownObjectRelease();
  }
}

@end