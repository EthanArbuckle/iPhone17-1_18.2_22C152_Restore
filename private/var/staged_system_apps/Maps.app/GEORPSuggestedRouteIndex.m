@interface GEORPSuggestedRouteIndex
- (void)setRideSelections:(id)a3;
@end

@implementation GEORPSuggestedRouteIndex

- (void)setRideSelections:(id)a3
{
  id v4 = a3;
  [(GEORPSuggestedRouteIndex *)self clearClusteredRouteRideSelections];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [self addClusteredRouteRideSelections:[*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) unsignedIntegerValue]];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end