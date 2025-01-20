@interface MAAssetDiff
+ (BOOL)supportsSecureCoding;
+ (id)allowEverythingDifferent;
+ (id)defaultAllowedDifferences;
+ (id)requireSameAssetTypeAndAllAttributes;
+ (id)requireSameAssetTypeAndAssetId;
+ (id)requireSameAssetTypeAndDownloadContent;
- (BOOL)hasOnlyAllowedDifferences:(id)a3;
- (BOOL)isAnythingDifferent;
- (BOOL)isSameAssetId;
- (BOOL)isSameAssetType;
- (BOOL)isSameDownloadContent;
- (BOOL)isSameDownloadPolicy;
- (BOOL)isSameDownloadUrl;
- (BOOL)isSameForAllAttributes;
- (BOOL)isSameForNonAssetIdAttributes;
- (MAAssetDiff)initWithCoder:(id)a3;
- (MAAssetDiff)initWithPlist:(id)a3;
- (id)description;
- (id)encodeAsPlist;
- (id)initDifferentAssetType:(BOOL)a3 assetId:(BOOL)a4 attributes:(BOOL)a5 assetIdAttributes:(BOOL)a6 dynamicAssetId:(BOOL)a7 nonIdAttributes:(BOOL)a8 content:(BOOL)a9 url:(BOOL)a10 policy:(BOOL)a11;
- (id)initFromDiff:(unint64_t)a3;
- (id)initFromInverseOfCategories:(unint64_t)a3;
- (id)summary;
- (unint64_t)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAssetDiff

+ (id)requireSameAssetTypeAndAssetId
{
  __int16 v2 = categoryInverse(3);
  return allowableDiffFromCategories(v2);
}

+ (id)requireSameAssetTypeAndDownloadContent
{
  __int16 v2 = categoryInverse(33);
  return allowableDiffFromCategories(v2);
}

+ (id)requireSameAssetTypeAndAllAttributes
{
  return allowableDiffFromCategories(0);
}

+ (id)defaultAllowedDifferences
{
  return allowableDiffFromCategories(0);
}

+ (id)allowEverythingDifferent
{
  __int16 v2 = categoryInverse(0);
  return allowableDiffFromCategories(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAssetDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAssetDiff;
  v5 = [(MAAssetDiff *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diffBits"];
    v5->_diffRaw = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diffMask"];
    v5->_mask = [v7 unsignedIntegerValue];

    v5->_diff = v5->_mask & v5->_diffRaw;
  }

  return v5;
}

- (MAAssetDiff)initWithPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAssetDiff;
  v5 = [(MAAssetDiff *)&v9 init];
  if (v5)
  {
    v6 = getPlistNumber(v4, @"diffBits");
    v5->_diffRaw = [v6 unsignedIntegerValue];

    v7 = getPlistNumber(v4, @"diffMask");
    v5->_mask = [v7 unsignedIntegerValue];

    v5->_diff = v5->_mask & v5->_diffRaw;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t diff = self->_diff;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInteger:diff];
  [v6 encodeObject:v7 forKey:@"diffBits"];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_mask];
  [v6 encodeObject:v8 forKey:@"diffMask"];
}

- (id)encodeAsPlist
{
  v3 = objc_opt_new();
  id v4 = [NSNumber numberWithUnsignedInteger:self->_diff];
  [v3 setValue:v4 forKey:@"diffBits"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_mask];
  [v3 setValue:v5 forKey:@"diffMask"];

  return v3;
}

- (id)initDifferentAssetType:(BOOL)a3 assetId:(BOOL)a4 attributes:(BOOL)a5 assetIdAttributes:(BOOL)a6 dynamicAssetId:(BOOL)a7 nonIdAttributes:(BOOL)a8 content:(BOOL)a9 url:(BOOL)a10 policy:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  if (!a3)
  {
    uint64_t v17 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v17 = categoryUnion(0, 1);
  if (v15) {
LABEL_5:
  }
    uint64_t v17 = categoryUnion(v17, 2);
LABEL_6:
  if (v14)
  {
    uint64_t v17 = categoryUnion(v17, 4);
    if (!v13)
    {
LABEL_8:
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if (!v13)
  {
    goto LABEL_8;
  }
  uint64_t v17 = categoryUnion(v17, 8);
  if (!v11)
  {
LABEL_9:
    if (!a9) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v17 = categoryUnion(v17, 16);
  if (!a9)
  {
LABEL_10:
    if (!a10) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v17 = categoryUnion(v17, 32);
  if (!a10)
  {
LABEL_11:
    if (!a11) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v17 = categoryUnion(v17, 64);
  if (!a11)
  {
LABEL_12:
    if (!v12) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  uint64_t v17 = categoryUnion(v17, 128);
  if (v12) {
LABEL_13:
  }
    uint64_t v17 = categoryUnion(v17, 256);
LABEL_14:
  return [(MAAssetDiff *)self initFromDiff:v17];
}

- (id)initFromDiff:(unint64_t)a3
{
  __int16 v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAssetDiff;
  id v4 = [(MAAssetDiff *)&v7 init];
  if (v4)
  {
    uint64_t v5 = categoryClean(v3);
    v4->_mask = 511;
    v4->_diffRaw = v5;
    v4->_unint64_t diff = v5 & 0x1FF;
  }
  return v4;
}

- (id)initFromInverseOfCategories:(unint64_t)a3
{
  uint64_t v4 = categoryInverse(a3);
  return [(MAAssetDiff *)self initFromDiff:v4];
}

- (BOOL)isAnythingDifferent
{
  return !isCategoryNone(self->_diff);
}

- (BOOL)isSameAssetType
{
  return !isCategoryIn(1, self->_diff);
}

- (BOOL)isSameForAllAttributes
{
  return !isCategoryIn(4, self->_diff);
}

- (BOOL)isSameAssetId
{
  return !isCategoryIn(2, self->_diff);
}

- (BOOL)isSameForNonAssetIdAttributes
{
  return !isCategoryIn(16, self->_diff);
}

- (BOOL)isSameDownloadContent
{
  return !isCategoryIn(32, self->_diff);
}

- (BOOL)isSameDownloadUrl
{
  return !isCategoryIn(64, self->_diff);
}

- (BOOL)isSameDownloadPolicy
{
  return !isCategoryIn(128, self->_diff);
}

- (BOOL)hasOnlyAllowedDifferences:(id)a3
{
  if (a3) {
    int v4 = [a3 category];
  }
  else {
    int v4 = 0;
  }
  unsigned int v5 = categoryInverse(v4);
  __int16 v6 = categoryIntersection(self->_diff, v5);
  return isCategoryNone(v6);
}

- (unint64_t)category
{
  return self->_diff;
}

- (id)summary
{
  return categorySimpleName(self->_diff);
}

- (id)description
{
  return categoryAssessDiffAndMask(self->_diff, self->_mask);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assessment, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end