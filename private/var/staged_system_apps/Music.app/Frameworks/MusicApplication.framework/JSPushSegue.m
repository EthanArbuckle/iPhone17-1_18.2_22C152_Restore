@interface JSPushSegue
@end

@implementation JSPushSegue

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore11JSPushSegue_componentController));
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore11JSPushSegue_delegate;

  sub_1A500((uint64_t)v3);
}

@end