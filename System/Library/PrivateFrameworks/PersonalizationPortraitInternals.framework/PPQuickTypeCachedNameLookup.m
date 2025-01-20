@interface PPQuickTypeCachedNameLookup
@end

@implementation PPQuickTypeCachedNameLookup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_sem, 0);
}

@end