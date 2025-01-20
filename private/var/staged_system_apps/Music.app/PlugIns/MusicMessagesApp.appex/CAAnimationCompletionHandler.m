@interface CAAnimationCompletionHandler
- (_TtC14MusicUtilities28CAAnimationCompletionHandler)init;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)displayLinkFiredWithDisplayLink:(id)a3;
@end

@implementation CAAnimationCompletionHandler

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002A8E94(v4);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1002AAB1C(a4);
}

- (void)displayLinkFiredWithDisplayLink:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002A90A0(v4);
}

- (_TtC14MusicUtilities28CAAnimationCompletionHandler)init
{
  result = (_TtC14MusicUtilities28CAAnimationCompletionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000109BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating));
  sub_1000109BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_displayLink);
}

@end