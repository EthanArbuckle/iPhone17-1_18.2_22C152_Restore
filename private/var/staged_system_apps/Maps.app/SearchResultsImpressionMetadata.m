@interface SearchResultsImpressionMetadata
- (BOOL)isEnriched;
- (NSString)query;
- (SearchResultsImpressionMetadata)initWithResultIndex:(unint64_t)a3 businessId:(unint64_t)a4 localSearchProviderId:(unsigned int)a5 query:(id)a6;
- (unint64_t)businessId;
- (unint64_t)resultIndex;
- (unsigned)localSearchProviderId;
- (void)setBusinessId:(unint64_t)a3;
- (void)setEnriched:(BOOL)a3;
- (void)setLocalSearchProviderId:(unsigned int)a3;
- (void)setQuery:(id)a3;
- (void)setResultIndex:(unint64_t)a3;
@end

@implementation SearchResultsImpressionMetadata

- (SearchResultsImpressionMetadata)initWithResultIndex:(unint64_t)a3 businessId:(unint64_t)a4 localSearchProviderId:(unsigned int)a5 query:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SearchResultsImpressionMetadata;
  v11 = [(SearchResultsImpressionMetadata *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_resultIndex = a3;
    v11->_businessId = a4;
    v11->_localSearchProviderId = a5;
    v13 = (NSString *)[v10 copy];
    query = v12->_query;
    v12->_query = v13;

    v12->_enriched = 0;
  }

  return v12;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (BOOL)isEnriched
{
  return self->_enriched;
}

- (void)setEnriched:(BOOL)a3
{
  self->_enriched = a3;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  self->_businessId = a3;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  self->_localSearchProviderId = a3;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end