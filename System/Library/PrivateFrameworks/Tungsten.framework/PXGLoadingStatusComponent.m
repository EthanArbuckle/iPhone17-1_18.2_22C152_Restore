@interface PXGLoadingStatusComponent
+ (BOOL)shouldDiffForChanges;
+ (unint64_t)elementSize;
- ($A5A652246548B43F8BC05201A1C72A70)mutableStates;
- ($A5A652246548B43F8BC05201A1C72A70)stateForEntity:(id)a3;
- (PXGLoadingStatusComponent)initWithDataStore:(id)a3;
- (const)states;
- (id)errorForEntity:(id)a3;
- (void)performChanges:(id)a3;
- (void)setError:(id)a3 forEntity:(id)a4;
- (void)setState:(id)a3 forEntities:(id *)a4 count:(unint64_t)a5;
- (void)setState:(id)a3 forEntity:(id)a4;
- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4;
@end

@implementation PXGLoadingStatusComponent

- ($A5A652246548B43F8BC05201A1C72A70)mutableStates
{
  id v2 = [(PXGComponent *)self mutableDataStore];
  v3 = ($A5A652246548B43F8BC05201A1C72A70 *)[v2 mutableContents];

  return v3;
}

+ (unint64_t)elementSize
{
  return 1;
}

- (PXGLoadingStatusComponent)initWithDataStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXGLoadingStatusComponent;
  v3 = [(PXGComponent *)&v7 initWithDataStore:a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    errorByEntity = v3->_errorByEntity;
    v3->_errorByEntity = v4;
  }
  return v3;
}

+ (BOOL)shouldDiffForChanges
{
  return 1;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGLoadingStatusComponent;
  [(PXGComponent *)&v3 performChanges:a3];
}

- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4
{
  if ([(NSMutableDictionary *)self->_errorByEntity count]) {
    BOOL v7 = a4 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    int64_t v8 = a4;
    do
    {
      errorByEntity = self->_errorByEntity;
      unsigned int var0 = a3->var0;
      ++a3;
      v11 = [NSNumber numberWithUnsignedInt:var0];
      [(NSMutableDictionary *)errorByEntity removeObjectForKey:v11];

      --v8;
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)PXGLoadingStatusComponent;
  [(PXGComponent *)&v12 willDestroyEntities:a3 count:a4];
}

- (void).cxx_destruct
{
}

- (void)setState:(id)a3 forEntities:(id *)a4 count:(unint64_t)a5
{
  for (i = [(PXGLoadingStatusComponent *)self mutableStates]; a5; --a5)
  {
    unsigned int var0 = a4->var0;
    ++a4;
    i[var0] = a3;
  }
}

- (void)setState:(id)a3 forEntity:(id)a4
{
  [(PXGLoadingStatusComponent *)self mutableStates][a4.var0] = a3;
}

- ($A5A652246548B43F8BC05201A1C72A70)stateForEntity:(id)a3
{
  return [(PXGLoadingStatusComponent *)self states][a3.var0];
}

- (const)states
{
  id v2 = [(PXGComponent *)self dataStore];
  objc_super v3 = (const $A5A652246548B43F8BC05201A1C72A70 *)[v2 contents];

  return v3;
}

- (void)setError:(id)a3 forEntity:(id)a4
{
  uint64_t v4 = *(void *)&a4.var0;
  errorByEntity = self->_errorByEntity;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)errorByEntity setObject:v7 forKeyedSubscript:v8];
}

- (id)errorForEntity:(id)a3
{
  errorByEntity = self->_errorByEntity;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3.var0];
  v5 = [(NSMutableDictionary *)errorByEntity objectForKeyedSubscript:v4];

  return v5;
}

@end