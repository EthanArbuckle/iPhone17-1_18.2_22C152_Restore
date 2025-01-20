@interface PKAccountPayLaterCardMagnitudesProvider
- (PKAccountPayLaterCardMagnitudesProvider)initWithAccountIdentifier:(id)a3 accountService:(id)a4;
- (id)updateHandler;
- (void)_handleMagnitudesUpdate:(id)a3;
- (void)dealloc;
- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)refreshMagnitudes;
- (void)setUpdateHandler:(id)a3;
@end

@implementation PKAccountPayLaterCardMagnitudesProvider

- (PKAccountPayLaterCardMagnitudesProvider)initWithAccountIdentifier:(id)a3 accountService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPayLaterCardMagnitudesProvider;
  v8 = [(PKAccountPayLaterCardMagnitudesProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_accountService, a4);
    [(PKAccountService *)v8->_accountService registerObserver:v8];
    [(PKAccountPayLaterCardMagnitudesProvider *)v8 refreshMagnitudes];
  }

  return v8;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  accountService = self->_accountService;
  self->_accountService = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountPayLaterCardMagnitudesProvider;
  [(PKAccountPayLaterCardMagnitudesProvider *)&v5 dealloc];
}

- (void)setUpdateHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  id v6 = self->_updateHandler;
  if (v6)
  {
    id v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PKAccountPayLaterCardMagnitudesProvider_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__PKAccountPayLaterCardMagnitudesProvider_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[5];
  id v8 = *(id *)(a1[4] + 8);
  id v3 = v2;
  if (v8 == v3)
  {

LABEL_12:
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[6];
    [v6 _handleMagnitudesUpdate:v7];
    return;
  }
  if (v8) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int v5 = [v8 isEqualToString:v3];

    if (!v5) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)refreshMagnitudes
{
  accountIdentifier = self->_accountIdentifier;
  accountService = self->_accountService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke;
  v4[3] = &unk_1E56ED928;
  v4[4] = self;
  [(PKAccountService *)accountService payLaterCardMagnitudesForAccountIdentifier:accountIdentifier completion:v4];
}

void __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke_2;
  v5[3] = &unk_1E56D8A90;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMagnitudesUpdate:*(void *)(a1 + 40)];
}

- (void)_handleMagnitudesUpdate:(id)a3
{
  id v4 = (PKPayLaterCardMagnitudes *)a3;
  magnitudes = self->_magnitudes;
  v10 = v4;
  if (v4 && magnitudes)
  {
    char v6 = [(PKPayLaterCardMagnitudes *)magnitudes isEqual:v4];
    id v4 = v10;
    if (v6) {
      goto LABEL_8;
    }
  }
  else if (magnitudes == v4)
  {
    goto LABEL_8;
  }
  uint64_t v7 = (PKPayLaterCardMagnitudes *)[(PKPayLaterCardMagnitudes *)v4 copy];
  id v8 = self->_magnitudes;
  self->_magnitudes = v7;

  id v4 = v10;
  id updateHandler = (void (**)(id, PKPayLaterCardMagnitudes *))self->_updateHandler;
  if (updateHandler)
  {
    updateHandler[2](updateHandler, self->_magnitudes);
    id v4 = v10;
  }
LABEL_8:
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end