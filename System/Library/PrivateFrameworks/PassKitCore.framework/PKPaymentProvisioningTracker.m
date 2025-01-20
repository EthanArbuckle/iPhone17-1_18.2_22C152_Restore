@interface PKPaymentProvisioningTracker
- (BOOL)isCanceled;
- (PKPaymentProvisioningTracker)initWithPaymentProvisioningController:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation PKPaymentProvisioningTracker

- (PKPaymentProvisioningTracker)initWithPaymentProvisioningController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentProvisioningTracker;
  v5 = [(PKPaymentProvisioningTracker *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    [v4 _noteProvisioningDidBegin];
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _noteProvisioningDidEnd];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentProvisioningTracker;
  [(PKPaymentProvisioningTracker *)&v4 dealloc];
}

- (void)cancel
{
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _noteProvisioningDidEnd];

  objc_storeWeak((id *)p_controller, 0);
}

- (BOOL)isCanceled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  BOOL v3 = WeakRetained == 0;

  return v3;
}

- (void).cxx_destruct
{
}

@end