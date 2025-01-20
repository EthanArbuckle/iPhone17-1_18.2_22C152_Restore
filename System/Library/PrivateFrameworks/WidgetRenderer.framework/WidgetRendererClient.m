@interface WidgetRendererClient
- (_TtC14WidgetRenderer20WidgetRendererClient)init;
- (uint64_t)flushPowerlog;
- (void)clientConfigurationsDidChange:(id)a3 forHost:(id)a4;
- (void)extensionsDidChange:(id)a3;
- (void)initializeConnection:(id)a3;
- (void)placeholdersDidChange:(id)a3;
- (void)snapshotsDidChange:(id)a3;
- (void)systemEnvironmentDidChange:(id)a3;
- (void)timelinesDidChange:(id)a3;
@end

@implementation WidgetRendererClient

- (_TtC14WidgetRenderer20WidgetRendererClient)init
{
  return (_TtC14WidgetRenderer20WidgetRendererClient *)sub_2618D50E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer20WidgetRendererClient__queue_connection));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14WidgetRenderer20WidgetRendererClient__lock_systemEnvironment;
  uint64_t v4 = sub_2618FA2B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)initializeConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2618DBBCC(v4);
}

- (void)clientConfigurationsDidChange:(id)a3 forHost:(id)a4
{
  uint64_t v6 = sub_2618FB330();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_2618DDF10(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)extensionsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2618DE514(v4);
}

- (void)systemEnvironmentDidChange:(id)a3
{
  id v4 = a3;
  unint64_t v8 = self;
  v5 = (char *)sub_2618F9B40();
  unint64_t v7 = v6;

  sub_2618DEC10(v5, v7);
  sub_2618C9B78((uint64_t)v5, v7);
}

- (void)timelinesDidChange:(id)a3
{
}

- (void)snapshotsDidChange:(id)a3
{
}

- (void)placeholdersDidChange:(id)a3
{
}

- (uint64_t)flushPowerlog
{
  uint64_t v0 = sub_2618FA430();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2618FA480();
  uint64_t v4 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2618A2568(0, (unint64_t *)&qword_26B414850);
  unint64_t v7 = (void *)sub_2618FB570();
  aBlock[4] = sub_2618DBA80;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2618D42B0;
  aBlock[3] = &block_descriptor_99;
  unint64_t v8 = _Block_copy(aBlock);
  sub_2618FA450();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2618E25A4(&qword_26B4146C8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B4147D0);
  sub_261892CC0((unint64_t *)&qword_26B4147D8, &qword_26B4147D0);
  sub_2618FB720();
  MEMORY[0x263E44010](0, v6, v3, v8);
  _Block_release(v8);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v11);
}

@end