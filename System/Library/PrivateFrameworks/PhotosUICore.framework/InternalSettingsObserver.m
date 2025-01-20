@interface InternalSettingsObserver
- (_TtC12PhotosUICore24InternalSettingsObserver)init;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation InternalSettingsObserver

- (void).cxx_destruct
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6 = sub_1AB23A76C();
  uint64_t v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC12PhotosUICore24InternalSettingsObserver_changeHandler);
  id v10 = a3;
  v11 = self;
  v9(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICore24InternalSettingsObserver)init
{
  result = (_TtC12PhotosUICore24InternalSettingsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end