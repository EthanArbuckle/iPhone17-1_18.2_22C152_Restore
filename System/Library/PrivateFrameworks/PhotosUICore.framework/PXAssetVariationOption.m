@interface PXAssetVariationOption
+ (id)_localizedNameForVariationType:(int64_t)a3;
+ (id)variationOptionWithType:(int64_t)a3 recommended:(BOOL)a4 current:(BOOL)a5;
- (BOOL)isCurrent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVariationOption:(id)a3;
- (BOOL)isRecommended;
- (NSString)localizedName;
- (int64_t)variationType;
- (unint64_t)hash;
@end

@implementation PXAssetVariationOption

- (void).cxx_destruct
{
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (BOOL)isRecommended
{
  return self->_recommended;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXAssetVariationOption;
  unint64_t v3 = [(PXAssetVariationOption *)&v7 hash];
  int64_t v4 = [(PXAssetVariationOption *)self variationType];
  int64_t v5 = v4 ^ [(PXAssetVariationOption *)self isRecommended];
  return v5 ^ [(PXAssetVariationOption *)self isCurrent] ^ v3;
}

- (BOOL)isEqualToVariationOption:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXAssetVariationOption *)self variationType];
  if (v5 == [v4 variationType]
    && (int v6 = [(PXAssetVariationOption *)self isRecommended],
        v6 == [v4 isRecommended]))
  {
    BOOL v8 = [(PXAssetVariationOption *)self isCurrent];
    int v7 = v8 ^ [v4 isCurrent] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToVariationOption:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)_localizedNameForVariationType:(int64_t)a3
{
  id v4 = @"PXAssetVariationTypeNone";
  switch(a3)
  {
    case -1:
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:a1 file:@"PXAssetVariationOption.m" lineNumber:76 description:@"Code which should be unreachable has been reached"];

      abort();
    case 0:
      goto LABEL_6;
    case 1:
      id v4 = @"PXAssetVariationTypeAutoloop";
      goto LABEL_6;
    case 2:
      id v4 = @"PXAssetVariationTypeMirror";
      goto LABEL_6;
    case 3:
      id v4 = @"PXAssetVariationTypeLongExposure";
LABEL_6:
      char v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
      break;
    default:
      char v5 = 0;
      break;
  }
  return v5;
}

+ (id)variationOptionWithType:(int64_t)a3 recommended:(BOOL)a4 current:(BOOL)a5
{
  v9 = objc_alloc_init((Class)a1);
  v9[2] = a3;
  uint64_t v10 = [a1 _localizedNameForVariationType:a3];
  v11 = (void *)v9[3];
  v9[3] = v10;

  *((unsigned char *)v9 + 8) = a4;
  *((unsigned char *)v9 + 9) = a5;
  return v9;
}

@end