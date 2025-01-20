@interface PKSavingsAccountAssessmentManager
- (PKSavingsAccountAssessmentManager)initWithType:(int64_t)a3;
- (id)_serviceProviderIdentifierForAssessmentType;
- (int64_t)type;
- (void)_restartODIAssessment;
- (void)provideSessionFeedbackDiscarded;
- (void)provideSessionFeedbackIngested;
- (void)updateAssessmentType:(int64_t)a3;
- (void)waitForAssessmentWithCompletion:(id)a3;
@end

@implementation PKSavingsAccountAssessmentManager

- (PKSavingsAccountAssessmentManager)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSavingsAccountAssessmentManager;
  v4 = [(PKSavingsAccountAssessmentManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    [(PKSavingsAccountAssessmentManager *)v4 _restartODIAssessment];
  }
  return v5;
}

- (void)updateAssessmentType:(int64_t)a3
{
  self->_type = a3;
  [(PKSavingsAccountAssessmentManager *)self provideSessionFeedbackDiscarded];
  [(PKSavingsAccountAssessmentManager *)self _restartODIAssessment];
}

- (void)waitForAssessmentWithCompletion:(id)a3
{
  id v4 = a3;
  odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke;
  v7[3] = &unk_1E56EDD48;
  id v8 = v4;
  id v6 = v4;
  [(PKODIAssessment *)odiServiceProviderAssessment waitForAssessmentWithContinueBlock:v7];
}

void __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)provideSessionFeedbackDiscarded
{
}

- (void)provideSessionFeedbackIngested
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)_restartODIAssessment
{
  id v3 = [(PKSavingsAccountAssessmentManager *)self _serviceProviderIdentifierForAssessmentType];
  if (v3)
  {
    id v21 = v3;
    id v4 = [(PKODIServiceProviderAssessment *)self->_odiServiceProviderAssessment serviceIdentifier];
    char v5 = [v21 isEqualToString:v4];

    id v3 = v21;
    if ((v5 & 1) == 0)
    {
      id v6 = [PKODIServiceProviderAssessment alloc];
      id v7 = PKPassKitCoreBundle();
      id v8 = [(PKODIServiceProviderAssessment *)v6 initWithServiceProviderIdentifier:v21 locationBundle:v7];
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = v8;

      [(PKODIAssessment *)self->_odiServiceProviderAssessment startAssessment];
      v10 = +[PKAppleAccountManager sharedInstance];
      v11 = [v10 appleAccountInformation];

      v12 = +[PKAppleAccountManager sharedInstance];
      v13 = [v12 appleAccountInformation];
      v14 = [v13 aaDSID];

      v15 = [v11 firstName];
      v16 = [v11 lastName];
      v17 = [v11 primaryEmailAddress];
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v19 = v18;
      if (v14) {
        [v18 setObject:v14 forKey:*MEMORY[0x1E4F5CAA8]];
      }
      if (v15) {
        [v19 setObject:v15 forKey:*MEMORY[0x1E4F5CA90]];
      }
      if (v16) {
        [v19 setObject:v16 forKey:*MEMORY[0x1E4F5CAB0]];
      }
      if (v17) {
        [v19 setObject:v17 forKey:*MEMORY[0x1E4F5CA80]];
      }
      id v20 = objc_alloc_init(MEMORY[0x1E4F5C978]);
      [v20 setAttributes:v19];
      [(PKODIAssessment *)self->_odiServiceProviderAssessment updateAssessment:v20];
      [(PKODIAssessment *)self->_odiServiceProviderAssessment computeAssessment];

      id v3 = v21;
    }
  }
}

- (id)_serviceProviderIdentifierForAssessmentType
{
  unint64_t type = self->_type;
  if (type > 8) {
    id v3 = (id *)MEMORY[0x1E4F5CBA0];
  }
  else {
    id v3 = (id *)qword_1E56F5098[type];
  }
  return *v3;
}

- (void).cxx_destruct
{
}

@end