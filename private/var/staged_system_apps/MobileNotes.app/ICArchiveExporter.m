@interface ICArchiveExporter
+ (ICArchiveExporter)exporterForHandoffToPages;
- (BOOL)removeArchiveAt:(id)a3 error:(id *)a4;
- (ICArchiveExporter)init;
- (id)createArchiveForObjects:(id)a3 progress:(id)a4 error:(id *)a5;
@end

@implementation ICArchiveExporter

- (ICArchiveExporter)init
{
  sub_100419D08();
  return result;
}

+ (ICArchiveExporter)exporterForHandoffToPages
{
  sub_10041B704();

  return (ICArchiveExporter *)v2;
}

- (id)createArchiveForObjects:(id)a3 progress:(id)a4 error:(id *)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031418(0, (unint64_t *)&qword_1006A5380);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  id v13 = a4;
  v14 = sub_10041A330(v11, (void (**)(char *, uint64_t, uint64_t, uint64_t))v12);
  sub_100409D88((uint64_t)v14, (uint64_t)v13, (uint64_t)v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  URL._bridgeToObjectiveC()(v15);
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v17;
}

- (BOOL)removeArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  sub_10040A184((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void).cxx_destruct
{
}

@end