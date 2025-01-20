@interface _PXImportConcurrentActionManager
+ (id)sharedInstance;
- (_PXImportConcurrentActionManager)init;
- (void)addOperation:(id)a3;
- (void)removeOperation:(id)a3;
@end

@implementation _PXImportConcurrentActionManager

- (void).cxx_destruct
{
}

- (void)removeOperation:(id)a3
{
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  [(NSMutableArray *)self->_operations addObject:v5];
  id v4 = (id)[v5 performAction];
}

- (_PXImportConcurrentActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXImportConcurrentActionManager;
  v2 = [(_PXImportConcurrentActionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    operations = v2->_operations;
    v2->_operations = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_36277 != -1) {
    dispatch_once(&sharedInstance_onceToken_36277, &__block_literal_global_36278);
  }
  v2 = (void *)sharedInstance_sharedInstance_36279;
  return v2;
}

@end