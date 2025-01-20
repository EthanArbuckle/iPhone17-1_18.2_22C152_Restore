@interface PUAssetExplorerAnalytics
- (PUAssetExplorerAnalytics)init;
- (void)sendEvent:(id)a3 view:(unint64_t)a4 source:(unint64_t)a5 currentAssetCount:(int64_t)a6;
@end

@implementation PUAssetExplorerAnalytics

- (void).cxx_destruct
{
}

- (void)sendEvent:(id)a3 view:(unint64_t)a4 source:(unint64_t)a5 currentAssetCount:(int64_t)a6
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (([(NSMutableSet *)self->_eventsSent containsObject:v10] & 1) == 0)
  {
    v16[0] = v10;
    v15[0] = @"eventName";
    v15[1] = @"view";
    if (a4 > 2) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E5F2B160[a4];
    }
    v16[1] = v11;
    v15[2] = @"source";
    if (a5 > 4) {
      v12 = @"unknown";
    }
    else {
      v12 = off_1E5F2B178[a5];
    }
    v16[2] = v12;
    v15[3] = @"currentAssetCount";
    v13 = [NSNumber numberWithInteger:a6];
    v16[3] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

    AnalyticsSendEvent();
    [(NSMutableSet *)self->_eventsSent addObject:v10];
  }
}

- (PUAssetExplorerAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUAssetExplorerAnalytics;
  v2 = [(PUAssetExplorerAnalytics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    eventsSent = v2->_eventsSent;
    v2->_eventsSent = v3;
  }
  return v2;
}

@end