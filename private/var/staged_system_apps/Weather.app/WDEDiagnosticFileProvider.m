@interface WDEDiagnosticFileProvider
- (WDEDiagnosticFileProvider)init;
- (id)exportDirectoryAndReturnError:(id *)a3;
- (id)files;
@end

@implementation WDEDiagnosticFileProvider

- (id)files
{
  v2 = self;
  DiagnosticFileProvider.files()();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)exportDirectoryAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  DiagnosticFileProvider.exportDirectory()((uint64_t)v7);

  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (WDEDiagnosticFileProvider)init
{
  return (WDEDiagnosticFileProvider *)DiagnosticFileProvider.init()();
}

@end