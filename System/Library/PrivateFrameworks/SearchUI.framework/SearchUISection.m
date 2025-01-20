@interface SearchUISection
+ (SearchUISection)sectionWithResultSection:(id)a3 collectionCardSection:(id)a4 sectionIdentifier:(id)a5;
+ (SearchUISection)sectionWithResultSection:(id)a3 sectionIdentifier:(id)a4;
+ (id)reuseIdentifierForCollectionSection;
+ (id)reuseIdentifierForSectionResult;
- (NSString)reuseIdentifier;
- (NSString)sectionIdentifier;
- (SFCollectionCardSection)collectionSection;
- (SFResultSection)resultSection;
- (SearchUISection)initWithResultSection:(id)a3 collectionSection:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation SearchUISection

- (SFResultSection)resultSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 8, 1);
}

- (SFCollectionCardSection)collectionSection
{
  return (SFCollectionCardSection *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sectionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)reuseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

+ (id)reuseIdentifierForSectionResult
{
  return @"resultSection";
}

+ (id)reuseIdentifierForCollectionSection
{
  return @"collectionSection";
}

+ (SearchUISection)sectionWithResultSection:(id)a3 collectionCardSection:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SearchUISection alloc] initWithResultSection:v9 collectionSection:v8 sectionIdentifier:v7];

  return v10;
}

- (SearchUISection)initWithResultSection:(id)a3 collectionSection:(id)a4 sectionIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SearchUISection;
  v12 = [(SearchUISection *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resultSection, a3);
    objc_storeStrong((id *)&v13->_collectionSection, a4);
    objc_storeStrong((id *)&v13->_sectionIdentifier, a5);
    v14 = objc_opt_class();
    if (v10) {
      [v14 reuseIdentifierForCollectionSection];
    }
    else {
    uint64_t v15 = [v14 reuseIdentifierForSectionResult];
    }
    reuseIdentifier = v13->_reuseIdentifier;
    v13->_reuseIdentifier = (NSString *)v15;
  }
  return v13;
}

+ (SearchUISection)sectionWithResultSection:(id)a3 sectionIdentifier:(id)a4
{
  v4 = (SearchUISection *)a3;
  if (a3)
  {
    id v5 = a4;
    v6 = v4;
    v4 = [[SearchUISection alloc] initWithResultSection:v6 collectionSection:0 sectionIdentifier:v5];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionSection, 0);
  objc_storeStrong((id *)&self->_resultSection, 0);
}

@end