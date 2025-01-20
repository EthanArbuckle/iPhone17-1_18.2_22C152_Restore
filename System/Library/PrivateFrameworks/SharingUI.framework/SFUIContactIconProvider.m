@interface SFUIContactIconProvider
- (_TtC9SharingUI23SFUIContactIconProvider)init;
@end

@implementation SFUIContactIconProvider

- (_TtC9SharingUI23SFUIContactIconProvider)init
{
  return (_TtC9SharingUI23SFUIContactIconProvider *)SFUIContactIconProvider.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_avatarImageRenderer));
}

@end