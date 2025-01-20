@interface PXDataSectionEnablementForwarder
- (PXDataSectionEnablementForwarder)initWithSourceDataSectionManager:(id)a3;
- (PXDataSectionManager)sourceDataSectionManager;
- (PXDataSectionManagerEnabling)enablementTarget;
- (void)_updateEnablement;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setEnablementTarget:(id)a3;
@end

@implementation PXDataSectionEnablementForwarder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enablementTarget);
  objc_storeStrong((id *)&self->_sourceDataSectionManager, 0);
}

- (PXDataSectionManagerEnabling)enablementTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enablementTarget);
  return (PXDataSectionManagerEnabling *)WeakRetained;
}

- (PXDataSectionManager)sourceDataSectionManager
{
  return self->_sourceDataSectionManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXDataSectionEnablementForwarderContext == a5) {
    [(PXDataSectionEnablementForwarder *)self _updateEnablement];
  }
}

- (void)_updateEnablement
{
  id v5 = [(PXDataSectionEnablementForwarder *)self sourceDataSectionManager];
  uint64_t v3 = [v5 isDataSectionEmpty] ^ 1;
  v4 = [(PXDataSectionEnablementForwarder *)self enablementTarget];
  [v4 setEnabled:v3];
}

- (void)setEnablementTarget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enablementTarget);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_enablementTarget, obj);
    [(PXDataSectionEnablementForwarder *)self _updateEnablement];
    id v5 = obj;
  }
}

- (PXDataSectionEnablementForwarder)initWithSourceDataSectionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDataSectionEnablementForwarder;
  v6 = [(PXDataSectionEnablementForwarder *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceDataSectionManager, a3);
    [v5 registerChangeObserver:v7 context:PXDataSectionEnablementForwarderContext];
  }

  return v7;
}

@end