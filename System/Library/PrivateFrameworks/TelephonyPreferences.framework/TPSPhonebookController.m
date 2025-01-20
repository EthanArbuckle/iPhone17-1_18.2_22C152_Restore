@interface TPSPhonebookController
- (BOOL)isSubscriptionEditable;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSString)localizedSubscriptionTelephoneNumber;
- (NSString)subscriptionISOCountryCode;
- (TPSPhonebookController)init;
- (TPSPhonebookController)initWithSubscriptionContext:(id)a3;
- (TPSPhonebookControllerDelegate)delegate;
- (TPSPhonebookTelephonyController)telephonyClient;
- (void)phonebookController:(id)a3 didChangePhoneNumberInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateSubscriptionTelephoneNumber:(id)a3 completion:(id)a4;
@end

@implementation TPSPhonebookController

- (TPSPhonebookController)init
{
  return 0;
}

- (TPSPhonebookController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSPhonebookController;
  v6 = [(TPSPhonebookController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = [[TPSPhonebookTelephonyController alloc] initWithSubscriptionContext:v5];
    telephonyClient = v7->_telephonyClient;
    v7->_telephonyClient = v8;

    [(TPSController *)v7->_telephonyClient addDelegate:v7 queue:MEMORY[0x1E4F14428]];
  }

  return v7;
}

- (BOOL)isSubscriptionEditable
{
  v2 = [(TPSPhonebookController *)self telephonyClient];
  v3 = [v2 phoneNumberInfo];
  char v4 = [v3 isEditable];

  return v4;
}

- (NSString)subscriptionISOCountryCode
{
  subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  if (!subscriptionISOCountryCode)
  {
    char v4 = [(TPSPhonebookController *)self subscriptionContext];
    objc_msgSend(v4, "tps_isoCountryCode");
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_subscriptionISOCountryCode;
    self->_subscriptionISOCountryCode = v5;

    subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  }
  return subscriptionISOCountryCode;
}

- (NSString)localizedSubscriptionTelephoneNumber
{
  v3 = [(TPSPhonebookController *)self telephonyClient];
  char v4 = [v3 phoneNumberInfo];
  id v5 = [v4 displayPhoneNumber];

  if (v5)
  {
    v6 = [(TPSPhonebookController *)self subscriptionISOCountryCode];
    v7 = TPSLocalizedPhoneNumberString(v5, v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)updateSubscriptionTelephoneNumber:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TPSPhonebookController *)self subscriptionISOCountryCode];
  v9 = TPSNormalizedPhoneNumberString(v7, v8);

  v10 = [(TPSPhonebookController *)self telephonyClient];
  objc_super v11 = [v10 phoneNumberInfo];

  v12 = [v11 number];
  unint64_t v13 = v9;
  unint64_t v14 = v12;
  if (v13 | v14)
  {
    v15 = (void *)v14;
    if (v14)
    {
      char v16 = [(id)v13 isEqualToString:v14];

      if (v16) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v17 = [(TPSPhonebookController *)self telephonyClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke;
    v18[3] = &unk_1E6EB2828;
    id v19 = v6;
    [v17 updatePhoneNumberInfo:v11 label:@"My Number" number:v13 completion:v18];
  }
LABEL_7:
}

void __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke_2;
  v6[3] = &unk_1E6EB2800;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)phonebookController:(id)a3 didChangePhoneNumberInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "Phone number info changed to %@.", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:TPSPhonebookControllerSubscriptionDidChangeNotification object:self];
}

- (TPSPhonebookControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSPhonebookControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TPSPhonebookTelephonyController)telephonyClient
{
  return self->_telephonyClient;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionISOCountryCode, 0);
}

@end