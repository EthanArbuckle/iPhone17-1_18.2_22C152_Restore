@interface SonicDiagnosticsExtension
- (_TtC16SonicDiagnostics25SonicDiagnosticsExtension)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation SonicDiagnosticsExtension

- (_TtC16SonicDiagnostics25SonicDiagnosticsExtension)init
{
  return (_TtC16SonicDiagnostics25SonicDiagnosticsExtension *)sub_100002B34();
}

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_100003A90();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = sub_100002BEC(v4);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = sub_100003AD0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

@end