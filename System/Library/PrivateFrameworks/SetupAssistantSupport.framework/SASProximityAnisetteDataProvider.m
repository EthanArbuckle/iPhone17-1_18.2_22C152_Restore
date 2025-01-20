@interface SASProximityAnisetteDataProvider
- (SASProximitySession)session;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setSession:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation SASProximityAnisetteDataProvider

- (void)provisionAnisetteWithCompletion:(id)a3
{
  v7 = (void (**)(id, uint64_t, void))a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  [(SASProximityAnisetteRequestAction *)v4 setRequest:0];
  v5 = [(SASProximityAnisetteDataProvider *)self session];
  id v6 = (id)[v5 sendAction:v4];

  if (v7) {
    v7[2](v7, [(SASProximityAnisetteRequestAction *)v4 success], 0);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  v10 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  v7 = objc_alloc_init(SASProximityAnisetteRequestAction);
  [(SASProximityAnisetteRequestAction *)v7 setRequest:1];
  [(SASProximityAnisetteRequestAction *)v7 setSim:v6];

  v8 = [(SASProximityAnisetteDataProvider *)self session];
  id v9 = (id)[v8 sendAction:v7];

  if (v10) {
    v10[2](v10, [(SASProximityAnisetteRequestAction *)v7 success], 0);
  }
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  v7 = (void (**)(id, uint64_t, void))a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  [(SASProximityAnisetteRequestAction *)v4 setRequest:2];
  v5 = [(SASProximityAnisetteDataProvider *)self session];
  id v6 = (id)[v5 sendAction:v4];

  if (v7) {
    v7[2](v7, [(SASProximityAnisetteRequestAction *)v4 success], 0);
  }
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v10 = (void (**)(id, void *, void))a4;
  id v6 = objc_alloc_init(SASProximityAnisetteRequestAction);
  [(SASProximityAnisetteRequestAction *)v6 setRequest:3];
  [(SASProximityAnisetteRequestAction *)v6 setShouldProvision:v4];
  v7 = [(SASProximityAnisetteDataProvider *)self session];
  id v8 = (id)[v7 sendAction:v6];

  if (v10)
  {
    id v9 = [(SASProximityAnisetteRequestAction *)v6 anisetteData];
    v10[2](v10, v9, 0);
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v9 = (void (**)(id, void *, void))a4;
  v5 = objc_alloc_init(SASProximityAnisetteRequestAction);
  [(SASProximityAnisetteRequestAction *)v5 setRequest:4];
  id v6 = [(SASProximityAnisetteDataProvider *)self session];
  id v7 = (id)[v6 sendAction:v5];

  if (v9)
  {
    id v8 = [(SASProximityAnisetteRequestAction *)v5 anisetteData];
    v9[2](v9, v8, 0);
  }
}

- (SASProximitySession)session
{
  return (SASProximitySession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end