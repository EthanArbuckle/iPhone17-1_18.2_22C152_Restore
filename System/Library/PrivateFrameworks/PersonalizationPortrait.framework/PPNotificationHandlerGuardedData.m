@interface PPNotificationHandlerGuardedData
- (PPNotificationHandlerGuardedData)init;
@end

@implementation PPNotificationHandlerGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_blockMap, 0);
}

- (PPNotificationHandlerGuardedData)init
{
  v9.receiver = self;
  v9.super_class = (Class)PPNotificationHandlerGuardedData;
  v2 = [(PPNotificationHandlerGuardedData *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_delayedFiringInProgress = 0;
    v2->_lastFiringTimeSince1970 = 0.0;
    uint64_t v4 = objc_opt_new();
    objects = v3->_objects;
    v3->_objects = (NSMutableSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
    blockMap = v3->_blockMap;
    v3->_blockMap = (NSMapTable *)v6;
  }
  return v3;
}

@end