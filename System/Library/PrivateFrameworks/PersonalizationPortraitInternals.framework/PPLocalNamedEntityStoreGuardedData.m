@interface PPLocalNamedEntityStoreGuardedData
@end

@implementation PPLocalNamedEntityStoreGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSearchQueryResult, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end