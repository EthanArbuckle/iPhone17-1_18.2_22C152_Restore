@interface PDHomeShareManagementService
- (PDHomeShareManagementService)init;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
@end

@implementation PDHomeShareManagementService

- (PDHomeShareManagementService)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDHomeShareManagementService;
  return [(PDHomeShareManagementService *)&v3 init];
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 homeInvite];
  uint64_t v46 = 0;
  v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_10002076C;
  v50 = sub_100020EA8;
  id v51 = 0;
  off_1008050E0();
  uint64_t v14 = objc_opt_class();
  v15 = v47;
  id v45 = v47[5];
  v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v14 fromData:v13 error:&v45];
  objc_storeStrong(v15 + 5, v45);
  if (!v16 || v47[5])
  {
    PDBasicError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v12 + 2))(v12, 0, 0, v17);
  }
  else
  {
    id v17 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_10002076C;
    v43[4] = sub_100020EA8;
    id v44 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100061BF0;
    v40[3] = &unk_100730D50;
    id v18 = objc_alloc_init((Class)PKHMHomeManager);
    id v41 = v18;
    v42 = v43;
    [v17 addOperation:v40];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_10002076C;
    v38[4] = sub_100020EA8;
    id v39 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100061D28;
    v33[3] = &unk_100730DA0;
    v35 = v43;
    id v34 = v16;
    v36 = v38;
    v37 = &v46;
    [v17 addOperation:v33];
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = sub_10002076C;
    v31[4] = sub_100020EA8;
    id v32 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100061F20;
    v27[3] = &unk_100730DC8;
    v29 = v31;
    id v28 = v9;
    v30 = v38;
    [v17 addOperation:v27];
    v19 = +[NSNull null];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100062014;
    v22[3] = &unk_100730DF0;
    v25 = &v46;
    v26 = v31;
    id v24 = v12;
    id v20 = v18;
    id v23 = v20;
    id v21 = [v17 evaluateWithInput:v19 completion:v22];

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(v43, 8);
  }

  _Block_object_dispose(&v46, 8);
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
}

- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
}

@end