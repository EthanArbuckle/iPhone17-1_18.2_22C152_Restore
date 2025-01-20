@interface MRVirtualOutputContextManager
+ (id)sharedManager;
- (NSArray)outputContext;
- (id)fetchForUID:(id)a3;
- (void)addOutputContext:(id)a3;
- (void)removeOutputContext:(id)a3;
@end

@implementation MRVirtualOutputContextManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_85);
  }
  v2 = (void *)sharedManager___sharedService;

  return v2;
}

uint64_t __46__MRVirtualOutputContextManager_sharedManager__block_invoke()
{
  sharedManager___sharedService = objc_alloc_init(MRVirtualOutputContextManager);

  return MEMORY[0x1F41817F8]();
}

- (id)fetchForUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_ouputContextMap objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)addOutputContext:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  ouputContextMap = v4->_ouputContextMap;
  v6 = [v7 uniqueIdentifier];
  [(NSMutableDictionary *)ouputContextMap setObject:v7 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (void)removeOutputContext:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_ouputContextMap setObject:0 forKeyedSubscript:v5];
  objc_sync_exit(v4);
}

- (NSArray)outputContext
{
  return self->_outputContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);

  objc_storeStrong((id *)&self->_ouputContextMap, 0);
}

@end