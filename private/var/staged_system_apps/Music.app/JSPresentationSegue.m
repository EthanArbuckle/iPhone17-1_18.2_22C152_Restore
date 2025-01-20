@interface JSPresentationSegue
@end

@implementation JSPresentationSegue

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore19JSPresentationSegue_componentController));
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSPresentationSegue_delegate;

  sub_100046744((uint64_t)v3);
}

@end