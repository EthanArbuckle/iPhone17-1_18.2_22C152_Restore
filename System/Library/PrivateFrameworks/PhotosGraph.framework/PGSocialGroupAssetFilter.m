@interface PGSocialGroupAssetFilter
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)asset:(id)a3 passesForPersonLocalIdentifiersInSocialGroup:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PGSocialGroupAssetFilter)init;
- (double)minimumRatioOfFacesComingFromSocialGroup;
- (double)minimumRatioOfPersonsInSocialGroupPresent;
- (id)filteredAssetsFromAssets:(id)a3 withPersonLocalIdentifiersInSocialGroup:(id)a4;
@end

@implementation PGSocialGroupAssetFilter

- (double)minimumRatioOfPersonsInSocialGroupPresent
{
  return self->_minimumRatioOfPersonsInSocialGroupPresent;
}

- (double)minimumRatioOfFacesComingFromSocialGroup
{
  return self->_minimumRatioOfFacesComingFromSocialGroup;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGSocialGroupAssetFilter;
  v4 = [(PGSocialGroupAssetFilter *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ minimumRatioOfFacesComingFromSocialGroup: %f minimumRatioOfPersonsInSocialGroupPresent: %f", v4, *(void *)&self->_minimumRatioOfFacesComingFromSocialGroup, *(void *)&self->_minimumRatioOfPersonsInSocialGroupPresent];

  return (NSString *)v5;
}

- (BOOL)asset:(id)a3 passesForPersonLocalIdentifiersInSocialGroup:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = a4;
  v9 = [v6 clsPersonLocalIdentifiers];
  v10 = [v7 setWithArray:v9];

  [v10 intersectSet:v8];
  unint64_t v11 = [v10 count];
  unint64_t v12 = [v8 count];

  if (v11 >= (unint64_t)fmax(ceil(self->_minimumRatioOfPersonsInSocialGroupPresent * (double)v12), 2.0))
  {
    v14 = [v6 clsFaceInformationSummary];
    unsigned int v15 = [v14 numberOfFaces];

    BOOL v13 = v11 >= vcvtpd_u64_f64(self->_minimumRatioOfFacesComingFromSocialGroup * (double)v15);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)filteredAssetsFromAssets:(id)a3 withPersonLocalIdentifiersInSocialGroup:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[PGSocialGroupAssetFilter asset:passesForPersonLocalIdentifiersInSocialGroup:](self, "asset:passesForPersonLocalIdentifiersInSocialGroup:", v14, v7, (void)v16))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (PGSocialGroupAssetFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGSocialGroupAssetFilter;
  result = [(PGSocialGroupAssetFilter *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_minimumRatioOfFacesComingFromSocialGroup = xmmword_1D1F4F0B0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)criteriaWithDictionary:(id)a3
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"SocialGroup";
}

@end