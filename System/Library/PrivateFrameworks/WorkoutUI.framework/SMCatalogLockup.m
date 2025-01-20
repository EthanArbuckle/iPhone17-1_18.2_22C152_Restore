@interface SMCatalogLockup
- (NSAttributedString)detail;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (NSNumber)mediaTypeRawValue;
- (NSString)description;
- (NSString)identifier;
- (NSString)recencyTag;
- (SMArtwork)artwork;
- (SMCatalogLockup)init;
- (int64_t)assetLoadStatus;
- (int64_t)bundleReason;
@end

@implementation SMCatalogLockup

- (NSAttributedString)title
{
  return (NSAttributedString *)sub_261A8B974((char *)self, (uint64_t)a2, MEMORY[0x263F69410]);
}

- (NSAttributedString)subtitle
{
  return (NSAttributedString *)sub_261A8B974((char *)self, (uint64_t)a2, MEMORY[0x263F69408]);
}

- (NSAttributedString)detail
{
  return (NSAttributedString *)sub_261A8B974((char *)self, (uint64_t)a2, MEMORY[0x263F693F0]);
}

- (NSString)identifier
{
  return (NSString *)sub_261A8C2B0(self, (uint64_t)a2, MEMORY[0x263F693F8]);
}

- (SMArtwork)artwork
{
  v2 = self;
  id v3 = sub_261A8BD1C();

  return (SMArtwork *)v3;
}

- (NSNumber)mediaTypeRawValue
{
  v2 = self;
  id v3 = sub_261A8C040();

  return (NSNumber *)v3;
}

- (int64_t)assetLoadStatus
{
  v2 = self;
  int64_t v3 = sub_261A8C1A8();

  return v3;
}

- (int64_t)bundleReason
{
  v2 = self;
  unint64_t v3 = sub_261A8C238();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_261A8C2B0(self, (uint64_t)a2, MEMORY[0x263F69400]);
}

- (NSString)recencyTag
{
  v2 = self;
  sub_261B8B2E8();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (SMCatalogLockup)init
{
  result = (SMCatalogLockup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___SMCatalogLockup_catalogLockup;
  uint64_t v4 = sub_261B8B378();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___SMCatalogLockup_mediaTagStringBuilder;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

@end