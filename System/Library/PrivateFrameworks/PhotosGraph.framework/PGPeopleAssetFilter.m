@interface PGPeopleAssetFilter
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
- (BOOL)asset:(id)a3 passesForPersonOrPetLocalIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PGPeopleAssetFilter)initWithCoder:(id)a3;
- (PGPeopleAssetFilter)initWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3;
- (id)filteredAssetsFromAssets:(id)a3 withPersonOrPetLocalIdentifier:(id)a4;
- (id)initForPetWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3;
- (unint64_t)maximumNumberOfOtherFacesPresent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PGPeopleAssetFilter

- (unint64_t)maximumNumberOfOtherFacesPresent
{
  return self->_maximumNumberOfOtherFacesPresent;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGPeopleAssetFilter *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t maximumNumberOfOtherFacesPresent = self->_maximumNumberOfOtherFacesPresent;
      BOOL v6 = maximumNumberOfOtherFacesPresent == [(PGPeopleAssetFilter *)v4 maximumNumberOfOtherFacesPresent];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGPeopleAssetFilter;
  v4 = [(PGPeopleAssetFilter *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@: %d", v4, @"maximumNumberOfOtherFacesPresent", self->_maximumNumberOfOtherFacesPresent];

  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PGPeopleAssetFilter)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"maximumNumberOfOtherFacesPresent"];
  return [(PGPeopleAssetFilter *)self initWithMaximumNumberOfOtherFacesPresent:v4];
}

- (BOOL)asset:(id)a3 passesForPersonOrPetLocalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_petFilter)
  {
    v8 = [v6 clsPetLocalIdentifiers];
    int v9 = [v8 containsObject:v7];

    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  v14 = [v6 clsConsolidatedPersonLocalIdentifiers];
  char v15 = [v14 containsObject:v7];

  if ((v15 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (self->_maximumNumberOfOtherFacesPresent == -1)
  {
    BOOL v16 = 1;
  }
  else
  {
    BOOL petFilter = self->_petFilter;
    v11 = [v6 clsFaceInformationSummary];
    v12 = v11;
    if (petFilter) {
      unsigned int v13 = [v11 numberOfFacesIncludingPets];
    }
    else {
      unsigned int v13 = [v11 numberOfFaces];
    }
    unsigned int v17 = v13;

    BOOL v16 = self->_maximumNumberOfOtherFacesPresent + 1 >= v17;
  }
LABEL_11:

  return v16;
}

- (id)filteredAssetsFromAssets:(id)a3 withPersonOrPetLocalIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
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
        if (-[PGPeopleAssetFilter asset:passesForPersonOrPetLocalIdentifier:](self, "asset:passesForPersonOrPetLocalIdentifier:", v14, v7, (void)v16))
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

- (id)initForPetWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3
{
  id result = [(PGPeopleAssetFilter *)self initWithMaximumNumberOfOtherFacesPresent:a3];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (PGPeopleAssetFilter)initWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGPeopleAssetFilter;
  id result = [(PGPeopleAssetFilter *)&v5 init];
  if (result) {
    result->_unint64_t maximumNumberOfOtherFacesPresent = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"People";
}

@end