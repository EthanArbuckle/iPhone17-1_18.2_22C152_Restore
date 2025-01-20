@interface WFAppIntentShortcutsMetadata
- (WFAppIntentShortcutsMetadata)init;
- (id)attributionBundleIdentifierWithDefaultValue:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation WFAppIntentShortcutsMetadata

- (id)attributionBundleIdentifierWithDefaultValue:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1C8532658();
  }
  else {
    uint64_t v3 = 0;
  }
  sub_1C7FCBD54(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (WFAppIntentShortcutsMetadata)init
{
}

- (void).cxx_destruct
{
  sub_1C7FCCE94(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFAppIntentShortcutsMetadata_displayedAppDescriptor), *(void *)&self->displayedAppDescriptor[OBJC_IVAR___WFAppIntentShortcutsMetadata_displayedAppDescriptor]);

  sub_1C7FCBB20(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFAppIntentShortcutsMetadata_iconSymbol), *(void *)&self->displayedAppDescriptor[OBJC_IVAR___WFAppIntentShortcutsMetadata_iconSymbol]);
  swift_bridgeObjectRelease();
}

- (id)dictionaryRepresentation
{
  v2 = self;
  AppIntentShortcutsMetadata.dictionaryRepresentation()();

  _s3__C3KeyVMa_0(0);
  sub_1C7F861C8();
  uint64_t v3 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return v3;
}

@end