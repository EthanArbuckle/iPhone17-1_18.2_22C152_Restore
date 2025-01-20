@interface ULBGSystemTask
- (BOOL)shouldCancel;
- (ULBGSystemTask)initWithUnderlyingTask:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
@end

@implementation ULBGSystemTask

- (ULBGSystemTask)initWithUnderlyingTask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULBGSystemTask;
  v5 = [(ULBGSystemTask *)&v10 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__ULBGSystemTask_initWithUnderlyingTask___block_invoke;
    v7[3] = &unk_2653F9200;
    objc_copyWeak(&v8, &location);
    [v4 setExpirationHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __41__ULBGSystemTask_initWithUnderlyingTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setShouldCancel:1];
    id WeakRetained = v2;
  }
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

@end