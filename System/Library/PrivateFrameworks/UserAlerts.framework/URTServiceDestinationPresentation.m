@interface URTServiceDestinationPresentation
- (BSServiceConnection)connection;
- (NSString)description;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)remoteTargetQueue;
- (URTAlert)alert;
- (URTDestinationPresentationDelegate)delegate;
- (URTServiceDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5;
- (int64_t)destination;
- (int64_t)preferredPresentationStyle;
- (void)_handleConnectionActivated;
- (void)_handleConnectionInterrupted;
- (void)dismiss;
- (void)handleCancelAction;
- (void)handleDefaultAction;
- (void)handleOtherAction;
- (void)invalidate;
- (void)present;
- (void)setDelegate:(id)a3;
@end

@implementation URTServiceDestinationPresentation

- (URTServiceDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v38.receiver = self;
  v38.super_class = (Class)URTServiceDestinationPresentation;
  v10 = [(URTServiceDestinationPresentation *)&v38 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_alert, a3);
    v11->_destination = a4;
    v11->_preferredPresentationStyle = a5;
    v12 = [MEMORY[0x263F29C50] serial];
    uint64_t v13 = BSDispatchQueueCreate();
    remoteTargetQueue = v11->_remoteTargetQueue;
    v11->_remoteTargetQueue = (OS_dispatch_queue *)v13;

    v15 = [(URTServiceDestinationPresentation *)v11 remoteTargetQueue];
    dispatch_suspend(v15);

    v16 = [MEMORY[0x263F29C50] serial];
    uint64_t v17 = BSDispatchQueueCreate();
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)v17;

    v19 = URTMachPortNameForAlertDestination(a4);
    v20 = (void *)MEMORY[0x263F2B9C0];
    v21 = +[URTAlertServiceSpecification identifier];
    v22 = [v9 identifier];
    v23 = [v20 endpointForMachName:v19 service:v21 instance:v22];

    uint64_t v24 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v23];
    connection = v11->_connection;
    v11->_connection = (BSServiceConnection *)v24;

    objc_initWeak(&location, v11);
    v26 = v11->_connection;
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke;
    v34 = &unk_26479AB88;
    v35 = v11;
    objc_copyWeak(v36, &location);
    v36[1] = (id)a4;
    [(BSServiceConnection *)v26 configureConnection:&v31];
    v27 = URTLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = URTDescriptionForAlertDestination(a4);
      v29 = v11->_connection;
      *(_DWORD *)buf = 138412546;
      v40 = v28;
      __int16 v41 = 2112;
      v42 = v29;
      _os_log_impl(&dword_2262C3000, v27, OS_LOG_TYPE_DEFAULT, "Activating %@ connection: %@", buf, 0x16u);
    }
    [(BSServiceConnection *)v11->_connection activate];
    objc_destroyWeak(v36);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[URTAlertServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 48)];
  v5 = +[URTAlertServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_2;
  v9[3] = &unk_26479A908;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  [v3 setActivationHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3;
  v7[3] = &unk_26479AB40;
  v8[1] = *(id *)(a1 + 48);
  objc_copyWeak(v8, (id *)(a1 + 40));
  [v3 setInterruptionHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_8;
  v6[3] = &__block_descriptor_40_e29_v16__0__BSServiceConnection_8l;
  v6[4] = *(void *)(a1 + 48);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(v8);
  objc_destroyWeak(&v10);
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_8_cold_1(a1);
  }
}

- (void)present
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = URTLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(URTServiceDestinationPresentation *)self description];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2262C3000, v3, OS_LOG_TYPE_DEFAULT, "attempting to present %@", buf, 0xCu);
  }
  v5 = [(URTServiceDestinationPresentation *)self remoteTargetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__URTServiceDestinationPresentation_present__block_invoke;
  block[3] = &unk_26479AA18;
  block[4] = self;
  dispatch_async(v5, block);
}

void __44__URTServiceDestinationPresentation_present__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) connection];
  v2 = [v5 remoteTarget];
  id v3 = [*(id *)(a1 + 32) alert];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "preferredPresentationStyle"));
  [v2 presentAlert:v3 preferringPresentationStyle:v4];
}

- (void)dismiss
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = URTLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(URTServiceDestinationPresentation *)self description];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2262C3000, v3, OS_LOG_TYPE_DEFAULT, "attempting to dismiss %@", buf, 0xCu);
  }
  id v5 = [(URTServiceDestinationPresentation *)self remoteTargetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__URTServiceDestinationPresentation_dismiss__block_invoke;
  block[3] = &unk_26479AA18;
  block[4] = self;
  dispatch_async(v5, block);
}

void __44__URTServiceDestinationPresentation_dismiss__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) connection];
  v2 = [v4 remoteTarget];
  id v3 = [*(id *)(a1 + 32) alert];
  [v2 dismissAlert:v3];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = URTLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    id v5 = [(URTServiceDestinationPresentation *)self description];
    int v6 = 138412546;
    v7 = connection;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2262C3000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@ for %@", (uint8_t *)&v6, 0x16u);
  }
  [(BSServiceConnection *)self->_connection invalidate];
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)URTServiceDestinationPresentation;
  id v4 = [(URTServiceDestinationPresentation *)&v9 description];
  id v5 = URTDescriptionForAlertDestination([(URTServiceDestinationPresentation *)self destination]);
  int v6 = [(URTServiceDestinationPresentation *)self alert];
  v7 = [v3 stringWithFormat:@"%@ destination: %@, alert: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (void)handleCancelAction
{
  id v3 = [(URTServiceDestinationPresentation *)self connectionQueue];
  BSDispatchQueueAssert();

  id v4 = [(URTServiceDestinationPresentation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 handleCancelActionForAlertPresentation:self];
  }
}

- (void)handleDefaultAction
{
  id v3 = [(URTServiceDestinationPresentation *)self connectionQueue];
  BSDispatchQueueAssert();

  id v4 = [(URTServiceDestinationPresentation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 handleDefaultActionForAlertPresentation:self];
  }
}

- (void)handleOtherAction
{
  id v3 = [(URTServiceDestinationPresentation *)self connectionQueue];
  BSDispatchQueueAssert();

  id v4 = [(URTServiceDestinationPresentation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 handleOtherActionForAlertPresentation:self];
  }
}

- (void)_handleConnectionActivated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = URTLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    id v5 = [(URTServiceDestinationPresentation *)self description];
    int v7 = 138412546;
    __int16 v8 = connection;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2262C3000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated %@ for %@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [(URTServiceDestinationPresentation *)self remoteTargetQueue];
  dispatch_resume(v6);
}

- (void)_handleConnectionInterrupted
{
  int v7 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_2262C3000, v1, v2, "Connection interrupted! Reactivating %@ for %@", v3, v4, v5, v6, 2u);
}

- (URTAlert)alert
{
  return self->_alert;
}

- (int64_t)destination
{
  return self->_destination;
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (URTDestinationPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (URTDestinationPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)remoteTargetQueue
{
  return self->_remoteTargetQueue;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_remoteTargetQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alert, 0);
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = URTDescriptionForAlertDestination(*(void *)(a1 + 40));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2262C3000, v2, v3, "Connection for %@ interrupted! %@", v4, v5, v6, v7, v8);
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_8_cold_1(uint64_t a1)
{
  uint64_t v1 = URTDescriptionForAlertDestination(*(void *)(a1 + 32));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2262C3000, v2, v3, "Connection for %@ invalidated! %@", v4, v5, v6, v7, v8);
}

@end