@interface PFXConstants
+ (void)initialize;
@end

@implementation PFXConstants

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    PFXPropValApplePubDoubleParen = [(uint64_t)[objc_alloc((Class)NSString) initWithFormat:@"-ibooks-%s" arguments:@"double-paren"]];
    PFXPropValApplePubRightParen = [(uint64_t)[objc_alloc((Class)NSString) initWithFormat:@"-ibooks-%s" arguments:@"right-paren"]
    id v2 = objc_alloc((Class)NSString);
    PFXCommonEpubPackageStringNS = (uint64_t)[v2 initWithXmlString:PFXCommonEpubOpfNS[0]];
    id v3 = objc_alloc((Class)NSString);
    PFXCommonDublinCoreMetadataStringNS = (uint64_t)[v3 initWithXmlString:PFXCommonDublinCoreMetadataNS[0]];
    id v4 = objc_alloc((Class)NSString);
    PFXCommonEpubNavigationStringNS = (uint64_t)[v4 initWithXmlString:PFXCommonEpubNavigationNS[0]];
    id v5 = objc_alloc((Class)NSString);
    PFXCommonApplePubStringNS = (uint64_t)[v5 initWithXmlString:PFXCommonApplePubNS[0]];
    id v6 = objc_alloc((Class)NSString);
    PFXCommonOEBPSPackageMediaType = (uint64_t)[v6 initWithXmlString:PFXCommonOEBPSPackageMediaTypeXmlChars];
  }
}

@end