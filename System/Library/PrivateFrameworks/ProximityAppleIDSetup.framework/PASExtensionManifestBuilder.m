@interface PASExtensionManifestBuilder
- (_TtC21ProximityAppleIDSetup27PASExtensionManifestBuilder)init;
@end

@implementation PASExtensionManifestBuilder

- (_TtC21ProximityAppleIDSetup27PASExtensionManifestBuilder)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup27PASExtensionManifestBuilder_isAccountPickerAvailable) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup27PASExtensionManifestBuilder_wantsFullScreenPresentation) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PASExtensionManifestBuilder();
  return [(PASExtensionManifestBuilder *)&v3 init];
}

@end