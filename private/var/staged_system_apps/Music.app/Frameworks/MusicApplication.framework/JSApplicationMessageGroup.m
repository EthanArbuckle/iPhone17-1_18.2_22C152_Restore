@interface JSApplicationMessageGroup
- (BOOL)shouldPerformModalMessagePresentation;
- (_TtC16MusicApplication25JSApplicationMessageGroup)init;
- (_TtC16MusicApplication25JSApplicationMessageGroup)initWithGroupIdentifier:(id)a3;
- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4;
@end

@implementation JSApplicationMessageGroup

- (_TtC16MusicApplication25JSApplicationMessageGroup)init
{
  NSString v3 = sub_AB64D0();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSApplicationMessageGroup();
  v4 = [(JSApplicationMessageGroup *)&v6 initWithGroupIdentifier:v3];

  return v4;
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 1;
}

- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4
{
  id v7 = objc_allocWithZone((Class)type metadata accessor for JSApplicationMessage());
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = JSApplicationMessage.init(from:)(v8);
  v12 = (void *)*JSBridge.shared.unsafeMutableAddressor();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v9;
  v14 = *(void (**)(uint64_t (*)(void **), uint64_t))&stru_B8.segname[(swift_isaMask & *v12) + 16];
  id v15 = v9;
  v16 = v12;
  id v17 = v11;
  v14(sub_336F30, v13);

  swift_release();
}

- (_TtC16MusicApplication25JSApplicationMessageGroup)initWithGroupIdentifier:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication25JSApplicationMessageGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end