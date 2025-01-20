@interface MTAlertController
- (BOOL)replacesExistingAlert;
- (MTAlertController)init;
- (id)alertIdentifier;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
- (void)setReplacesExistingAlert:(BOOL)a3;
@end

@implementation MTAlertController

- (MTAlertController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTAlertController;
  v2 = [(MTAlertController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MTAlertController *)v2 setReplacesExistingAlert:1];
    [(MTAlertController *)v3 _setIgnoreAppSupportedOrientations:1];
  }
  return v3;
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  v7 = objc_msgSend(MEMORY[0x1E4FB1EC0], "mt_rootViewController");
  v8 = objc_msgSend(v7, "mt_topViewController");

  if ([(MTAlertController *)self replacesExistingAlert]
    && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    v10 = [v9 alertIdentifier];
    v11 = [(MTAlertController *)self alertIdentifier];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      if (v6) {
        v6[2](v6);
      }
    }
    else
    {
      v13 = [v9 presentingViewController];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__MTAlertController_presentAnimated_completion___block_invoke;
      v15[3] = &unk_1E6E20398;
      id v16 = v13;
      v17 = self;
      BOOL v19 = v4;
      v18 = v6;
      id v14 = v13;
      [v14 dismissViewControllerAnimated:v4 completion:v15];
    }
  }
  else
  {
    [v8 presentViewController:self animated:v4 completion:v6];
  }
}

uint64_t __48__MTAlertController_presentAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (id)alertIdentifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  BOOL v4 = [(MTAlertController *)self title];
  objc_super v5 = [(MTAlertController *)self message];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(MTAlertController *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v6 appendString:@" "];
        v13 = [v12 title];
        [v6 appendString:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)replacesExistingAlert
{
  return self->_replacesExistingAlert;
}

- (void)setReplacesExistingAlert:(BOOL)a3
{
  self->_replacesExistingAlert = a3;
}

@end