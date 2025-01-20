@interface JSStaticImageViewModel
@end

@implementation JSStaticImageViewModel

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore22JSStaticImageViewModel_staticImageViewModelDelegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicJSCore22JSStaticImageViewModel_imageResource);
  uint64_t v4 = *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore22JSStaticImageViewModel_imageResource];
  unsigned __int8 v5 = self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore22JSStaticImageViewModel_imageResource + 8];

  sub_461530(v3, v4, v5);
}

@end