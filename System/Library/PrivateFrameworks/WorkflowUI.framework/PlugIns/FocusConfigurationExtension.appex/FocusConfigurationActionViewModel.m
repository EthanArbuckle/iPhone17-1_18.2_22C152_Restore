@interface FocusConfigurationActionViewModel
- (_TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel)init;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)dealloc;
- (void)parameterAttributesDidChange:(id)a3;
@end

@implementation FocusConfigurationActionViewModel

- (void)dealloc
{
  v2 = self;
  sub_100011DC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel__isUIValid;
  uint64_t v4 = sub_1000061EC(&qword_100033448);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  uint64_t v6 = sub_1000207E0();
  unint64_t v8 = v7;
  id v10 = a3;
  v9 = self;
  sub_100014C7C(v10, v6, v8);
  swift_bridgeObjectRelease();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100015048(v5);
}

- (_TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel)init
{
}

@end