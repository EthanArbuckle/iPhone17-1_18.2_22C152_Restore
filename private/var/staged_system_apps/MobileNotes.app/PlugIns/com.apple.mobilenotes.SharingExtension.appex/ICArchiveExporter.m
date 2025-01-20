@interface ICArchiveExporter
+ (ICArchiveExporter)exporterForHandoffToPages;
- (BOOL)removeArchiveAt:(id)a3 error:(id *)a4;
- (ICArchiveExporter)init;
- (id)createArchiveForObjects:(id)a3 progress:(id)a4 error:(id *)a5;
@end

@implementation ICArchiveExporter

- (ICArchiveExporter)init
{
  sub_10008B530();
  return result;
}

+ (ICArchiveExporter)exporterForHandoffToPages
{
  sub_10008E580();

  return (ICArchiveExporter *)v2;
}

- (id)createArchiveForObjects:(id)a3 progress:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1000B6F10();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100038DC8(0, (unint64_t *)&qword_100103820);
  unint64_t v11 = sub_1000B76E0();
  v12 = self;
  id v13 = a4;
  v14 = sub_10008D1FC(v11, (void (**)(char *, uint64_t, uint64_t, uint64_t))v12);
  sub_10007B39C((uint64_t)v14, (uint64_t)v13, (uint64_t)v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1000B6E80(v15);
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v17;
}

- (BOOL)removeArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1000B6F10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B6EE0();
  uint64_t v9 = self;
  sub_10007B798((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void).cxx_destruct
{
}

@end