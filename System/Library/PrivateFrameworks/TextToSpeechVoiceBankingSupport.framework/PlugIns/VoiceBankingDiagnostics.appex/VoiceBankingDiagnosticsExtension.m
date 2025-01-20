@interface VoiceBankingDiagnosticsExtension
- (VoiceBankingDiagnosticsExtension)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation VoiceBankingDiagnosticsExtension

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    sub_1000113E0();
  }
  v4 = self;
  uint64_t v5 = _s23VoiceBankingDiagnostics0abC9ExtensionC11attachments13forParametersSayypGSgSDys11AnyHashableVypGSg_tF_0();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6.super.isa = sub_100011480().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (VoiceBankingDiagnosticsExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(VoiceBankingDiagnosticsExtension *)&v3 init];
}

@end