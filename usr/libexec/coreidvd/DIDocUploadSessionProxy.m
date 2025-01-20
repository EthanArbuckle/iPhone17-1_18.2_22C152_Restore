@interface DIDocUploadSessionProxy
- (_TtC8coreidvd23DIDocUploadSessionProxy)init;
- (void)cancelUploads;
- (void)dealloc;
- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5;
@end

@implementation DIDocUploadSessionProxy

- (void)dealloc
{
  v2 = self;
  sub_100121AC4();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_100025C28(0, &qword_100724518);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = (char *)a4;
  v11 = self;
  sub_100121CF0(v8, v10, sub_100122DB0, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)cancelUploads
{
  v2 = self;
  sub_100122140();
}

- (_TtC8coreidvd23DIDocUploadSessionProxy)init
{
  result = (_TtC8coreidvd23DIDocUploadSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end