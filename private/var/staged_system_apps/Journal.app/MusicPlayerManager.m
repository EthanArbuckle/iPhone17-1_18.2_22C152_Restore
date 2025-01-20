@interface MusicPlayerManager
- (_TtC7Journal18MusicPlayerManager)init;
@end

@implementation MusicPlayerManager

- (_TtC7Journal18MusicPlayerManager)init
{
  swift_defaultActor_initialize();
  *(void *)self->$__lazy_storage_$_musicPlayerController = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MusicPlayerManager();
  return [(MusicPlayerManager *)&v4 init];
}

@end