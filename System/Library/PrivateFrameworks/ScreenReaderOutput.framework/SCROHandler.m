@interface SCROHandler
- (SCROHandler)init;
- (id)callbackDelegate;
- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5;
- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6;
- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4;
- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4;
- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5;
- (void)invalidate;
- (void)lock;
- (void)setCallbackDelegate:(id)a3;
- (void)unlock;
@end

@implementation SCROHandler

- (SCROHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCROHandler;
  v2 = [(SCROHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)invalidate
{
  self->isInvalid = 1;
}

- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4
{
  return 2;
}

- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return 2;
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return [(SCROHandler *)self handleGetValue:a3 forKey:*(void *)&a4 withObject:0 trusted:a5];
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6
{
  return 2;
}

- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4
{
  return 2;
}

- (id)callbackDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_callbackDelegate);

  return WeakRetained;
}

- (void)setCallbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_callbackDelegate);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end