@interface PHAsset
- (NSString)crlaxFriendlyFilename;
- (NSString)crlaxLabel;
- (NSString)crlaxMediaSubtypeName;
- (NSString)crlaxMediaTypeName;
- (int64_t)crlaxMediaType;
- (unint64_t)crlaxMediaSubtype;
@end

@implementation PHAsset

- (NSString)crlaxLabel
{
  v3 = [(PHAsset *)self crlaxMediaSubtypeName];
  v4 = [(PHAsset *)self crlaxMediaTypeName];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  v6 = [(PHAsset *)self crlaxFriendlyFilename];
  v13 = __CRLAccessibilityStringForVariables(1, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  return (NSString *)v13;
}

- (NSString)crlaxFriendlyFilename
{
  char v8 = 0;
  v2 = [(PHAsset *)self crlaxValueForKey:@"filename"];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  v5 = (void *)v4;

  v6 = CRLAccessibilityFriendlyFilename(v5);

  return (NSString *)v6;
}

- (int64_t)crlaxMediaType
{
  return (int64_t)[(PHAsset *)self crlaxUnsignedIntegerValueForKey:@"mediaType"];
}

- (unint64_t)crlaxMediaSubtype
{
  return (unint64_t)[(PHAsset *)self crlaxUnsignedIntegerValueForKey:@"mediaSubtypes"];
}

- (NSString)crlaxMediaTypeName
{
  unint64_t v2 = [(PHAsset *)self crlaxMediaType];
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = CRLAccessibilityLocalizedString(off_1014CBE28[v2]);
  }

  return (NSString *)v3;
}

- (NSString)crlaxMediaSubtypeName
{
  v3 = +[NSMutableString string];
  unsigned int v4 = [(PHAsset *)self crlaxMediaSubtype];
  if ((v4 & 2) != 0)
  {
    v5 = CRLAccessibilityLocalizedString(@"photos.asset.media.subtype.hdr");
    [v3 appendString:v5];
  }
  if (v4)
  {
    v6 = @"photos.asset.media.subtype.panorama";
  }
  else
  {
    if ((v4 & 0x40000) == 0) {
      goto LABEL_8;
    }
    v6 = @"photos.asset.media.subtype.timelapse";
  }
  uint64_t v7 = CRLAccessibilityLocalizedString(v6);
  [v3 appendString:v7];

LABEL_8:
  char v8 = +[NSString stringWithString:v3];

  return (NSString *)v8;
}

@end