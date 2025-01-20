@interface AccessoryRegisterAction
+ (id)accessoryRegisterDigestForKey:(id)a3;
+ (id)contextKeyForAccessory:(id)a3;
+ (id)sharedAccessoryRegisterDigestSerialQueue;
+ (void)cleanupContextForAccessory:(id)a3;
+ (void)saveAccessoryRegisterDigest:(id)a3 forKey:(id)a4;
- (AccessoryRegisterAction)initWithAccount:(id)a3 accessory:(id)a4 cause:(id)a5 force:(BOOL)a6 serverInteractionController:(id)a7;
- (BOOL)_registerDeviceWithCause:(id)a3;
- (BOOL)force;
- (BOOL)includeDeviceState;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDAccount)account;
- (FMDInternalAccessory)accessory;
- (FMDRequestRegister)request;
- (FMDServerInteractionController)serverInteractionController;
- (NSString)cause;
- (id)actionType;
- (id)completion;
- (id)digestWithDeviceInfo:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCause:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setIncludeDeviceState:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)terminate;
@end

@implementation AccessoryRegisterAction

- (AccessoryRegisterAction)initWithAccount:(id)a3 accessory:(id)a4 cause:(id)a5 force:(BOOL)a6 serverInteractionController:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AccessoryRegisterAction;
  v16 = [(AccessoryRegisterAction *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(AccessoryRegisterAction *)v16 setAccount:v12];
    [(AccessoryRegisterAction *)v17 setAccessory:v13];
    [(AccessoryRegisterAction *)v17 setCause:v14];
    [(AccessoryRegisterAction *)v17 setForce:v8];
    [(AccessoryRegisterAction *)v17 setServerInteractionController:v15];
  }

  return v17;
}

+ (id)sharedAccessoryRegisterDigestSerialQueue
{
  if (qword_10031E7B0 != -1) {
    dispatch_once(&qword_10031E7B0, &stru_1002D9E40);
  }
  v2 = (void *)qword_10031E7B8;

  return v2;
}

- (id)actionType
{
  return @"AccessoryRegisterAction";
}

- (void)runWithCompletion:(id)a3
{
  id v7 = a3;
  [(AccessoryRegisterAction *)self setCompletion:v7];
  v4 = [(AccessoryRegisterAction *)self cause];
  unsigned __int8 v5 = [(AccessoryRegisterAction *)self _registerDeviceWithCause:v4];

  v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }
}

- (void)terminate
{
  uint64_t v4 = [(AccessoryRegisterAction *)self completion];
  [(AccessoryRegisterAction *)self setCompletion:0];
  v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v3 = (void *)v4;
  }
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [(AccessoryRegisterAction *)self accessory];
    v6 = [v5 accessoryIdentifier];
    id v7 = [v4 accessory];
    BOOL v8 = [v7 accessoryIdentifier];
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)_registerDeviceWithCause:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(AccessoryRegisterAction *)self accessory];
  v6 = [(AccessoryRegisterAction *)self account];
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1000213BC;
  v52[4] = sub_1000213CC;
  id v53 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 1;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1000213BC;
  v46 = sub_1000213CC;
  id v47 = 0;
  id v7 = +[AccessoryRegisterAction sharedAccessoryRegisterDigestSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000213D4;
  block[3] = &unk_1002D9E68;
  v39 = v52;
  block[4] = self;
  id v8 = v6;
  id v36 = v8;
  id v9 = v5;
  id v37 = v9;
  v40 = &v42;
  id v10 = v4;
  id v38 = v10;
  v41 = &v48;
  dispatch_sync(v7, block);

  if (*((unsigned char *)v49 + 24))
  {
    v11 = [(AccessoryRegisterAction *)self serverInteractionController];
    id v12 = [FMDActingRequestDecorator alloc];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000217A8;
    v32[3] = &unk_1002D9DF8;
    id v33 = v8;
    id v34 = v10;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002181C;
    v31[3] = &unk_1002D9E90;
    v31[4] = v52;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002182C;
    v29[3] = &unk_1002D9458;
    id v13 = v33;
    id v30 = v13;
    id v14 = [(FMDActingRequestDecorator *)v12 initWithDeviceContextGenerator:v32 deviceInfoGenerator:v31 serverContextGenerator:0 requestHeaderGenerator:v29];
    id v15 = [[FMDRequestRegister alloc] initWithAccount:v13];
    [(FMDRequest *)v15 setDecorator:v14];
    v16 = +[AccessoryRegisterAction contextKeyForAccessory:v9];
    [(FMDRequestRegister *)v15 setDigestKey:v16];

    [(FMDRequestRegister *)v15 setDigestData:v43[5]];
    objc_initWeak(&location, self);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10002189C;
    v23 = &unk_1002D9EB8;
    objc_copyWeak(&v27, &location);
    id v24 = v9;
    id v25 = v13;
    id v17 = v11;
    id v26 = v17;
    [(FMDRequest *)v15 setCompletionHandler:&v20];
    -[AccessoryRegisterAction setRequest:](self, "setRequest:", v15, v20, v21, v22, v23);
    unsigned __int8 v18 = [v17 enqueueRequest:v15];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v52, 8);

  return v18;
}

+ (id)contextKeyForAccessory:(id)a3
{
  v3 = [a3 accessoryIdentifier];
  id v4 = +[NSString stringWithFormat:@"%@:%@", @"AccessoryRegisterAction", v3];

  return v4;
}

+ (void)cleanupContextForAccessory:(id)a3
{
  id v3 = a3;
  id v4 = +[AccessoryRegisterAction sharedAccessoryRegisterDigestSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000220E8;
  block[3] = &unk_1002D9378;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (id)digestWithDeviceInfo:(id)a3
{
  id v4 = [a3 fm_flattenedArrayWithParentIndices:&off_1002F2D80];
  if ([v4 count])
  {
    id v12 = 0;
    id v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v12];
    id v6 = v12;
    if (v6)
    {
      id v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10023C374(self, (uint64_t)v6, v7);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  id v8 = v5;
  CC_SHA1([v8 bytes], (CC_LONG)[v8 length], md);
  id v9 = +[NSData dataWithBytes:md length:20];
  id v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10023C2FC((uint64_t)v9, v10);
  }

  return v9;
}

+ (id)accessoryRegisterDigestForKey:(id)a3
{
  return [(id)qword_10031E7A8 objectForKeyedSubscript:a3];
}

+ (void)saveAccessoryRegisterDigest:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = (void *)qword_10031E7A8;
  if (!qword_10031E7A8)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    id v8 = (void *)qword_10031E7A8;
    qword_10031E7A8 = v7;

    id v6 = (void *)qword_10031E7A8;
  }
  [v6 setObject:v9 forKeyedSubscript:v5];
}

- (BOOL)includeDeviceState
{
  return self->_includeDeviceState;
}

- (void)setIncludeDeviceState:(BOOL)a3
{
  self->_includeDeviceState = a3;
}

- (FMDRequestRegister)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);

  return (FMDServerInteractionController *)WeakRetained;
}

- (void)setServerInteractionController:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end