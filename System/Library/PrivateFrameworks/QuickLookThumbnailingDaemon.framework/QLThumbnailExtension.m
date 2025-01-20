@interface QLThumbnailExtension
- (BOOL)enabled;
- (BOOL)supportsConcurrentRequests;
- (BOOL)supportsInteractiveThumbnailBadges;
- (NSString)debugDescription;
- (NSString)generatorIdentifier;
- (NSString)generatorVersion;
- (QLThumbnailExtension)init;
- (_EXExtensionIdentity)exIdentity;
- (double)minimumThumbnailDimension;
@end

@implementation QLThumbnailExtension

- (NSString)generatorIdentifier
{
  return (NSString *)sub_1DDC6B47C();
}

- (NSString)generatorVersion
{
  return (NSString *)sub_1DDC6B47C();
}

- (BOOL)supportsInteractiveThumbnailBadges
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges);
}

- (double)minimumThumbnailDimension
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension);
}

- (_EXExtensionIdentity)exIdentity
{
  v2 = self;
  v3 = (void *)sub_1DDCB4950();

  return (_EXExtensionIdentity *)v3;
}

- (BOOL)supportsConcurrentRequests
{
  return (6u >> (*((unsigned char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel) & 7)) & 1;
}

- (BOOL)enabled
{
  return 1;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1DDCA7174();

  v3 = (void *)sub_1DDCB4B30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (QLThumbnailExtension)init
{
  result = (QLThumbnailExtension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___QLThumbnailExtension_identity;
  uint64_t v3 = sub_1DDCB4970();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end