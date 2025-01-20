@interface JSLocalStorage
@end

@implementation JSLocalStorage

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore14JSLocalStorage_scriptingUserDefaults));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end