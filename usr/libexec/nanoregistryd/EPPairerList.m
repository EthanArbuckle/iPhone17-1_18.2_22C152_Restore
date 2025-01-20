@interface EPPairerList
- (BOOL)_hasPairer;
- (BOOL)hasPairer;
- (EPDeviceInfo)info;
- (EPPairer)pairer;
- (EPPairerList)initWithDeviceInfo:(id)a3 withDelegate:(id)a4;
- (EPPairerListDelegate)delegate;
- (EPPairerListDelegate)strongDelegate;
- (id)initBase;
- (id)newPairerWithDelegate:(id)a3 withParameters:(id)a4;
- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4;
- (void)dealloc;
- (void)pairer:(id)a3 completedWithError:(id)a4;
- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5;
- (void)pairerDidBeginToPair:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setInfo:(id)a3;
- (void)setPairer:(id)a3;
- (void)setStrongDelegate:(id)a3;
- (void)update;
@end

@implementation EPPairerList

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)EPPairerList;
  return [(EPPairerList *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EPPairerList;
  [(EPPairerList *)&v2 dealloc];
}

- (EPPairerList)initWithDeviceInfo:(id)a3 withDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(EPPairerList *)self initBase];
  v10 = (EPPairerList *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)newPairerWithDelegate:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EPDeviceInfo *)self->_info device];
  if (v8 && (id WeakRetained = objc_loadWeakRetained((id *)&self->_pairer), WeakRetained, !WeakRetained))
  {
    [v8 setParameters:v7];
    v10 = [[EPPairer alloc] initWithDevice:v8 withDelegate:v6 pairerList:self];
    objc_storeWeak((id *)&self->_pairer, v10);
    [(EPPairerList *)self update];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasPairer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairer);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)update
{
  BOOL v3 = [(EPPairerList *)self _hasPairer];
  if (self->_hasPairer != v3)
  {
    self->_hasPairer = v3;
    if (v3)
    {
      objc_storeStrong((id *)&self->me, self);
      id WeakRetained = (EPPairerListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
      strongDelegate = self->_strongDelegate;
      self->_strongDelegate = WeakRetained;

      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 pairerListDidBecomeNonEmpty:self];
    }
    else
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 pairerListDidBecomeEmpty:self];

      me = self->me;
      self->me = 0;

      id v6 = self->_strongDelegate;
      self->_strongDelegate = 0;
    }
  }
  id v9 = objc_loadWeakRetained((id *)&self->_pairer);
  [v9 update];
}

- (void)reset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairer);
  [WeakRetained reset];

  [(EPPairerList *)self update];
}

- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4
{
  p_pairer = &self->_pairer;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pairer);
  id v7 = [WeakRetained pairer:WeakRetained newEndpointWithDelegate:v5];

  return v7;
}

- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5
{
  p_pairer = &self->_pairer;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_pairer);
  [WeakRetained pairer:WeakRetained requestWithType:a4 passkey:v7];
}

- (void)pairer:(id)a3 completedWithError:(id)a4
{
  p_pairer = &self->_pairer;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pairer);
  [WeakRetained pairer:WeakRetained completedWithError:v6];

  [(EPPairerList *)self reset];
}

- (void)pairerDidBeginToPair:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairer);
  [WeakRetained pairerDidBeginToPair:WeakRetained];
}

- (EPPairerListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPPairerListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPPairerListDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void)setStrongDelegate:(id)a3
{
}

- (EPDeviceInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (EPPairer)pairer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairer);

  return (EPPairer *)WeakRetained;
}

- (void)setPairer:(id)a3
{
}

- (BOOL)hasPairer
{
  return self->_hasPairer;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairer);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->me, 0);
}

@end