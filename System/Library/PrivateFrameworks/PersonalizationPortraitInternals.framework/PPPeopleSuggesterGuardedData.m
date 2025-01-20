@interface PPPeopleSuggesterGuardedData
@end

@implementation PPPeopleSuggesterGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheSweepDate, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
}

@end