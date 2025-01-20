@interface PPEventCacheGuardedData
@end

@implementation PPEventCacheGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBackedPlists, 0);
  objc_storeStrong((id *)&self->_cachedEventHighlights, 0);
  objc_storeStrong((id *)&self->_cachedRanges, 0);
  objc_storeStrong((id *)&self->_cachedEvents, 0);
}

@end