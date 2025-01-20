@interface URTAlertServiceDelegateProxy
- (URTAlertService)service;
- (URTAlertServiceDelegateProxy)initWithService:(id)a3;
- (void)dismissAlert:(id)a3;
- (void)presentAlert:(id)a3 preferringPresentationStyle:(id)a4;
@end

@implementation URTAlertServiceDelegateProxy

- (URTAlertServiceDelegateProxy)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)URTAlertServiceDelegateProxy;
  v5 = [(URTAlertServiceDelegateProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

- (void)presentAlert:(id)a3 preferringPresentationStyle:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(URTAlertServiceDelegateProxy *)self service];
  if (v7)
  {
    uint64_t v8 = [v6 unsignedIntegerValue];
    v9 = [MEMORY[0x263F2B9B8] currentContext];
    objc_msgSend(v7, "_connectionQueue_presentAlert:preferringPresentationStyle:forConnection:", v10, v8, v9);
  }
}

- (void)dismissAlert:(id)a3
{
  id v6 = a3;
  id v4 = [(URTAlertServiceDelegateProxy *)self service];
  if (v4)
  {
    v5 = [MEMORY[0x263F2B9B8] currentContext];
    objc_msgSend(v4, "_connectionQueue_dismissAlert:forConnection:", v6, v5);
  }
}

- (URTAlertService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (URTAlertService *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end