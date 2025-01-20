@interface SearchUICollectionViewLayoutConfiguration
- (NSSet)sectionIndexesForHeightMatching;
- (NSSet)sectionIndexesUsingListLayout;
- (SearchUICollectionViewLayoutConfiguration)initWithSnapshot:(id)a3;
@end

@implementation SearchUICollectionViewLayoutConfiguration

- (NSSet)sectionIndexesForHeightMatching
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (SearchUICollectionViewLayoutConfiguration)initWithSnapshot:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUICollectionViewLayoutConfiguration;
  v5 = [(SearchUICollectionViewLayoutConfiguration *)&v21 init];
  if (v5)
  {
    v6 = (NSSet *)objc_opt_new();
    v7 = (NSSet *)objc_opt_new();
    v8 = [v4 sectionIdentifiers];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        v11 = [v4 sectionIdentifiers];
        v12 = [v11 objectAtIndexedSubscript:v10];

        if ([v12 shouldHeightMatchSection])
        {
          v13 = [NSNumber numberWithUnsignedInteger:v10];
          [(NSSet *)v6 addObject:v13];
        }
        if ([v12 isMemberOfClass:objc_opt_class()])
        {
          v14 = [NSNumber numberWithUnsignedInteger:v10];
          [(NSSet *)v7 addObject:v14];
        }
        ++v10;
        v15 = [v4 sectionIdentifiers];
        unint64_t v16 = [v15 count];
      }
      while (v10 < v16);
    }
    sectionIndexesForHeightMatching = v5->_sectionIndexesForHeightMatching;
    v5->_sectionIndexesForHeightMatching = v6;
    v18 = v6;

    sectionIndexesUsingListLayout = v5->_sectionIndexesUsingListLayout;
    v5->_sectionIndexesUsingListLayout = v7;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexesUsingListLayout, 0);
  objc_storeStrong((id *)&self->_sectionIndexesForHeightMatching, 0);
}

- (NSSet)sectionIndexesUsingListLayout
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

@end