@interface StateCaptureServer
- (_TtC14ReplicatorCore18StateCaptureServer)init;
- (id)dataPathAndReturnError:(id *)a3;
- (id)stateFor:(id)a3 error:(id *)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation StateCaptureServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_25B0DFFB8(v8);

  swift_unknownObjectRelease();
}

- (_TtC14ReplicatorCore18StateCaptureServer)init
{
  result = (_TtC14ReplicatorCore18StateCaptureServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplicatorCore18StateCaptureServer_requestProcessingQueue));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore18StateCaptureServer_stateCaptureManager);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplicatorCore18StateCaptureServer_listener);
}

- (id)stateFor:(id)a3 error:(id *)a4
{
  if (a3)
  {
    unint64_t v5 = sub_25B0F3918();
    uint64_t v7 = v6;
  }
  else
  {
    unint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = self;
  sub_25B0DF688(v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_25B0F38E8();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)dataPathAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F1D68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = self;
  sub_25B0B9600((uint64_t)v7);
  sub_25B0F1D28();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  v9 = (void *)sub_25B0F38E8();
  swift_bridgeObjectRelease();
  return v9;
}

@end