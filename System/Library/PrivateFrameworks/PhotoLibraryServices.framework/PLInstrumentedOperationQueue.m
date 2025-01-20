@interface PLInstrumentedOperationQueue
- (PLInstrumentedOperationQueue)init;
- (id)pl_operationCountChangedBlock;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPl_operationCountChangedBlock:(id)a3;
@end

@implementation PLInstrumentedOperationQueue

- (void).cxx_destruct
{
}

- (void)setPl_operationCountChangedBlock:(id)a3
{
}

- (id)pl_operationCountChangedBlock
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &sOperationCountContext)
  {
    v7 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F284C8], a4);
    uint64_t v8 = [v7 unsignedIntegerValue];

    v9 = [(PLInstrumentedOperationQueue *)self pl_operationCountChangedBlock];
    if (v9)
    {
      id v10 = v9;
      v9[2](v9, v8);
      v9 = (void (**)(void, void))v10;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PLInstrumentedOperationQueue;
    -[PLInstrumentedOperationQueue observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  [(PLInstrumentedOperationQueue *)self removeObserver:self forKeyPath:@"operationCount"];
  v3.receiver = self;
  v3.super_class = (Class)PLInstrumentedOperationQueue;
  [(PLInstrumentedOperationQueue *)&v3 dealloc];
}

- (PLInstrumentedOperationQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLInstrumentedOperationQueue;
  v2 = [(PLInstrumentedOperationQueue *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(PLInstrumentedOperationQueue *)v2 addObserver:v2 forKeyPath:@"operationCount" options:1 context:&sOperationCountContext];
    v4 = v3;
  }

  return v3;
}

@end