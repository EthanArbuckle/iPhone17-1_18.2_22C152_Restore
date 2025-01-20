@interface PKPaymentPassActionDataController
- (PKPaymentPassActionDataController)initWithPass:(id)a3 actions:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 actionType:(unint64_t)a7 balanceModel:(id)a8;
- (void)fetchViewController:(id)a3;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)selectActionViewControllerDidCancel:(id)a3;
- (void)selectActionViewControllerDidPerformAction:(id)a3;
@end

@implementation PKPaymentPassActionDataController

- (PKPaymentPassActionDataController)initWithPass:(id)a3 actions:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 actionType:(unint64_t)a7 balanceModel:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPassActionDataController;
  v18 = [(PKPaymentPassActionDataController *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_actions, a4);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v19->_webService, a6);
    v19->_actionType = a7;
    objc_storeStrong((id *)&v19->_balanceModel, a8);
  }

  return v19;
}

- (void)fetchViewController:(id)a3
{
  v4 = (void (**)(id, PKPerformActionViewController *, void *))a3;
  actions = self->_actions;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__PKPaymentPassActionDataController_fetchViewController___block_invoke;
  v17[3] = &unk_1E59DBD58;
  v17[4] = self;
  v6 = [(NSArray *)actions pk_objectsPassingTest:v17];
  v7 = v6;
  if (!v6)
  {
    v12 = 0;
    v13 = 0;
LABEL_13:
    v4[2](v4, v13, v12);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 count];
  if (v8)
  {
    if (v8 == 1)
    {
      v9 = [v7 firstObject];
      id v15 = 0;
      uint64_t v16 = 0;
      char v10 = [(PKPaymentPass *)self->_pass canPerformAction:v9 unableReason:&v16 displayableError:&v15];
      id v11 = v15;
      if ((v10 & 1) != 0 || v16 == 2)
      {
        v13 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:v9 paymentDataProvider:self->_paymentDataProvider];
        [(PKPerformActionViewController *)v13 setDelegate:self];
        [(PKPerformActionViewController *)v13 setWebService:self->_webService];
        v12 = 0;
      }
      else
      {
        v12 = +[PKPerformActionViewController alertControllerForUnableReason:v16 action:v9 displayableError:v11 addCardActionHandler:0];
        v13 = 0;
      }
    }
    else
    {
      v9 = [(PKTransitBalanceModel *)self->_balanceModel filteredActionsForDisplayableEntities];
      id v14 = [(PKTransitBalanceModel *)self->_balanceModel balancesAndCountPlansByID];
      v13 = [[PKSelectActionViewController alloc] initWithPass:self->_pass actions:v9 actionType:self->_actionType paymentDataProvider:self->_paymentDataProvider webService:self->_webService balanceDictionary:v14];
      [(PKPerformActionViewController *)v13 setDelegate:self];

      v12 = 0;
    }

    goto LABEL_13;
  }
  v4[2](v4, 0, 0);
LABEL_14:
}

uint64_t __57__PKPaymentPassActionDataController_fetchViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  if (v4 == *(void *)(*(void *)(a1 + 32) + 40))
  {
    if ((unint64_t)(v4 - 1) > 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v3 isActionAvailable];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)selectActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void)selectActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end