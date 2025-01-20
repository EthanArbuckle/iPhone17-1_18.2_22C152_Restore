@interface SPUIResultsViewStateRestorationContext
+ (BOOL)supportsSecureCoding;
- (NSString)searchString;
- (SPSearchEntity)searchEntity;
- (SPUIResultsViewStateRestorationContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSearchEntity:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation SPUIResultsViewStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUIResultsViewStateRestorationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPUIResultsViewStateRestorationContext;
  v5 = [(SearchUICollectionResultsViewRestorationContext *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchEntity"];
    searchEntity = v5->_searchEntity;
    v5->_searchEntity = (SPSearchEntity *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPUIResultsViewStateRestorationContext;
  id v4 = a3;
  [(SearchUICollectionResultsViewRestorationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, @"searchString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_searchEntity forKey:@"searchEntity"];
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchString:(id)a3
{
}

- (SPSearchEntity)searchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end