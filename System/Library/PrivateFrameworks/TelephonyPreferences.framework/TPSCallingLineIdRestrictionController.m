@interface TPSCallingLineIdRestrictionController
- (BOOL)isEditable;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (TPSCallingLineIdRestrictionController)init;
- (TPSCallingLineIdRestrictionController)initWithSubscriptionContext:(id)a3;
- (TPSCallingLineIdRestrictionControllerDelegate)delegate;
- (TPSCallingLineIdRestrictionRequestController)requestController;
- (int64_t)state;
- (void)requestController:(id)a3 didReceiveResponse:(id)a4;
- (void)requestStateChange:(int64_t)a3;
- (void)requestStateForSubscriptionContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation TPSCallingLineIdRestrictionController

- (TPSCallingLineIdRestrictionController)init
{
  return 0;
}

- (TPSCallingLineIdRestrictionController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSCallingLineIdRestrictionController;
  v6 = [(TPSCallingLineIdRestrictionController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_state = 0;
    v8 = objc_alloc_init(TPSCallingLineIdRestrictionRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v8;

    [(TPSRequestController *)v7->_requestController addDelegate:v7 queue:MEMORY[0x1E4F14428]];
    [(TPSCallingLineIdRestrictionController *)v7 requestStateForSubscriptionContext:v5];
  }

  return v7;
}

- (void)requestStateForSubscriptionContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[TPSCallingLineIdRestrictionRequest alloc] initWithSubscriptionContext:v4];

  v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "Sending caller line ID restriction request %@.", (uint8_t *)&v7, 0xCu);
  }

  [(TPSRequestController *)self->_requestController addRequest:v5];
}

- (void)requestStateChange:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(TPSCallingLineIdRestrictionController *)self state] != a3)
  {
    [(TPSCallingLineIdRestrictionController *)self setState:0];
    id v5 = [TPSCallingLineIdRestrictionSetRequest alloc];
    v6 = [(TPSCallingLineIdRestrictionController *)self subscriptionContext];
    int v7 = [(TPSCallingLineIdRestrictionSetRequest *)v5 initWithSubscriptionContext:v6 state:a3];

    v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      objc_super v11 = v7;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Sending caller line ID restriction set request %@.", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = [(TPSCallingLineIdRestrictionController *)self requestController];
    [v9 addRequest:v7];
  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v5;
    id v7 = v14;
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", (uint8_t *)&v13, 0x16u);
  }
  -[TPSCallingLineIdRestrictionController setEditable:](self, "setEditable:", [v5 isEditable]);
  -[TPSCallingLineIdRestrictionController setState:](self, "setState:", [v5 state]);
  v8 = [(TPSCallingLineIdRestrictionController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(TPSCallingLineIdRestrictionController *)self delegate];
    uint64_t v11 = [v5 state];
    uint64_t v12 = [v5 error];
    [v10 callingLineIdController:self didChangeState:v11 error:v12];
  }
}

- (TPSCallingLineIdRestrictionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSCallingLineIdRestrictionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TPSCallingLineIdRestrictionRequestController)requestController
{
  return self->_requestController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end