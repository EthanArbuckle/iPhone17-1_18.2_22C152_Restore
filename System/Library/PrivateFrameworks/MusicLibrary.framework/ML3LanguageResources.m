@interface ML3LanguageResources
+ (BOOL)supportsSecureCoding;
- (ML3LanguageResources)initWithCoder:(id)a3;
- (ML3LanguageResources)initWithSectionsInfo:(id)a3 sortingDetails:(id)a4 canonicalLanguageIdentifier:(id)a5;
- (NSDictionary)sectionsInfo;
- (NSDictionary)sortingDetails;
- (NSString)canonicalLanguageIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3LanguageResources

- (ML3LanguageResources)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3LanguageResources;
  v5 = [(ML3LanguageResources *)&v17 init];
  if (v5)
  {
    v6 = MSVPropertyListDataClasses();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ML3LanguageResourcesSectionsInfoKey"];
    uint64_t v8 = [v7 copy];
    sectionsInfo = v5->_sectionsInfo;
    v5->_sectionsInfo = (NSDictionary *)v8;

    v10 = [v4 decodeObjectOfClasses:v6 forKey:@"ML3LanguageResourcesSortingDetailsKey"];
    uint64_t v11 = [v10 copy];
    sortingDetails = v5->_sortingDetails;
    v5->_sortingDetails = (NSDictionary *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ML3LanguageResourcesCanonicalLanguageIdentifierKey"];
    uint64_t v14 = [v13 copy];
    canonicalLanguageIdentifier = v5->_canonicalLanguageIdentifier;
    v5->_canonicalLanguageIdentifier = (NSString *)v14;
  }
  return v5;
}

- (NSString)canonicalLanguageIdentifier
{
  return self->_canonicalLanguageIdentifier;
}

- (NSDictionary)sectionsInfo
{
  return self->_sectionsInfo;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)sortingDetails
{
  return self->_sortingDetails;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"ML3LanguageResources.m", 56, @"Encoder %@ does not support keyed coding", v6 object file lineNumber description];
  }
  [v6 encodeObject:self->_sectionsInfo forKey:@"ML3LanguageResourcesSectionsInfoKey"];
  [v6 encodeObject:self->_sortingDetails forKey:@"ML3LanguageResourcesSortingDetailsKey"];
  [v6 encodeObject:self->_canonicalLanguageIdentifier forKey:@"ML3LanguageResourcesCanonicalLanguageIdentifierKey"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalLanguageIdentifier, 0);
  objc_storeStrong((id *)&self->_sortingDetails, 0);

  objc_storeStrong((id *)&self->_sectionsInfo, 0);
}

- (ML3LanguageResources)initWithSectionsInfo:(id)a3 sortingDetails:(id)a4 canonicalLanguageIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ML3LanguageResources;
  uint64_t v11 = [(ML3LanguageResources *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sectionsInfo = v11->_sectionsInfo;
    v11->_sectionsInfo = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    sortingDetails = v11->_sortingDetails;
    v11->_sortingDetails = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    canonicalLanguageIdentifier = v11->_canonicalLanguageIdentifier;
    v11->_canonicalLanguageIdentifier = (NSString *)v16;
  }
  return v11;
}

@end