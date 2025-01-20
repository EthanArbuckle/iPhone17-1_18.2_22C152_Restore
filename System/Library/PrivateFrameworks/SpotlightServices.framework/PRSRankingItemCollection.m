@interface PRSRankingItemCollection
- (NSArray)arrayOfRankingItems;
- (NSDictionary)mapResultIdToProtectionClass;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)countOfVisibleResults;
- (void)setArrayOfRankingItems:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCountOfVisibleResults:(unint64_t)a3;
- (void)setMapResultIdToProtectionClass:(id)a3;
@end

@implementation PRSRankingItemCollection

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PRSRankingItemCollection;
  v4 = [(PRSRankingItemCollection *)&v10 description];
  v5 = [(PRSRankingItemCollection *)self bundleIdentifier];
  unint64_t v6 = [(PRSRankingItemCollection *)self countOfVisibleResults];
  v7 = [(PRSRankingItemCollection *)self arrayOfRankingItems];
  v8 = [v3 stringWithFormat:@"%@ %@ visible:%llu items:%llu", v4, v5, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (NSArray)arrayOfRankingItems
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setArrayOfRankingItems:(id)a3
{
}

- (unint64_t)countOfVisibleResults
{
  return self->_countOfVisibleResults;
}

- (void)setCountOfVisibleResults:(unint64_t)a3
{
  self->_countOfVisibleResults = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSDictionary)mapResultIdToProtectionClass
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMapResultIdToProtectionClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapResultIdToProtectionClass, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_arrayOfRankingItems, 0);
}

@end