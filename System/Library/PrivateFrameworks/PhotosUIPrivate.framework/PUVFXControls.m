@interface PUVFXControls
+ (id)createViewControllerWithSettingsData:(id)a3 update:(id)a4;
- (_TtC15PhotosUIPrivate13PUVFXControls)init;
@end

@implementation PUVFXControls

+ (id)createViewControllerWithSettingsData:(id)a3 update:(id)a4
{
  v5 = _Block_copy(a4);
  id v6 = a3;
  uint64_t v7 = sub_1AEF937B0();
  unint64_t v9 = v8;

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  v11 = (void *)sub_1AEA5D878(v7, v9, (uint64_t)sub_1AEA6E314, v10);
  swift_release();
  sub_1AEA6E31C(v7, v9);
  return v11;
}

- (_TtC15PhotosUIPrivate13PUVFXControls)init
{
  return (_TtC15PhotosUIPrivate13PUVFXControls *)PUVFXControls.init()();
}

@end