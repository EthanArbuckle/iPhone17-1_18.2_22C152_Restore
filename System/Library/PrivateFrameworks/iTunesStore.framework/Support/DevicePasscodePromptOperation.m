@interface DevicePasscodePromptOperation
- (DevicePasscodePromptOperation)initWithTitle:(id)a3 message:(id)a4;
- (id)tokenBlock;
- (int64_t)_keyboardType;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setTokenBlock:(id)a3;
@end

@implementation DevicePasscodePromptOperation

- (DevicePasscodePromptOperation)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DevicePasscodePromptOperation;
  v8 = [(DevicePasscodePromptOperation *)&v25 init];
  if (v8)
  {
    v9 = (ISDialog *)objc_alloc_init((Class)ISDialog);
    dialog = v8->_dialog;
    v8->_dialog = v9;

    [(ISDialog *)v8->_dialog setMessage:v7];
    [(ISDialog *)v8->_dialog setTitle:v6];
    id v22 = objc_alloc((Class)NSArray);
    id v23 = v7;
    id v24 = v6;
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"PASSCODE_CANCEL" value:&stru_1003B9B00 table:@"Mesa"];
    v13 = +[ISDialogButton buttonWithTitle:v12];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"PASSCODE_OK" value:&stru_1003B9B00 table:@"Mesa"];
    v16 = +[ISDialogButton buttonWithTitle:v15];
    id v17 = objc_msgSend(v22, "initWithObjects:", v13, v16, 0);

    [(ISDialog *)v8->_dialog setButtons:v17];
    [(ISDialog *)v8->_dialog setDefaultButtonIndex:1];
    id v18 = objc_alloc_init((Class)ISDialogTextField);
    objc_msgSend(v18, "setKeyboardType:", -[DevicePasscodePromptOperation _keyboardType](v8, "_keyboardType"));
    [v18 setSecure:1];
    v19 = v8->_dialog;
    id v26 = v18;
    v20 = +[NSArray arrayWithObjects:&v26 count:1];
    [(ISDialog *)v19 setTextFields:v20];

    id v6 = v24;
    id v7 = v23;
  }

  return v8;
}

- (void)setTokenBlock:(id)a3
{
  id v6 = a3;
  [(DevicePasscodePromptOperation *)self lock];
  if (self->_tokenBlock != v6)
  {
    id v4 = [v6 copy];
    id tokenBlock = self->_tokenBlock;
    self->_id tokenBlock = v4;
  }
  [(DevicePasscodePromptOperation *)self unlock];
}

- (id)tokenBlock
{
  [(DevicePasscodePromptOperation *)self lock];
  id v3 = [self->_tokenBlock copy];
  [(DevicePasscodePromptOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)run
{
  id v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  passcodeEntrySemaphore = self->_passcodeEntrySemaphore;
  self->_passcodeEntrySemaphore = v3;

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  id v5 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePINEntryViewController"];
  id v6 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v7 = objc_alloc_init((Class)BSMutableSettings);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001091B8;
  v31[3] = &unk_1003A69A0;
  v31[4] = self;
  v31[5] = &v32;
  id v8 = [objc_alloc((Class)BSAction) initWithInfo:v7 timeout:0 forResponseOnQueue:v31 withHandler:0.0];
  v9 = +[NSSet setWithObject:v8];
  [v6 setActions:v9];

  id v10 = +[SBSRemoteAlertHandle newHandleWithDefinition:v5 configurationContext:v6];
  v11 = v10;
  if (v10)
  {
    [v10 addObserver:self];
    [v11 activateWithContext:0];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_passcodeEntrySemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v12 = 0;
    uint64_t v13 = 3;
  }
  else
  {
    v14 = +[ISDialogOperation operationWithDialog:self->_dialog];
    id v30 = 0;
    unsigned int v15 = [(DevicePasscodePromptOperation *)self runSubOperation:v14 returningError:&v30];
    id v12 = v30;
    if (v15)
    {
      v16 = [v14 selectedButton];
      if (v16)
      {
        v28 = v16;
        id v17 = [(ISDialog *)self->_dialog buttons];
        id v18 = [v17 indexOfObjectIdenticalTo:v28];

        if (v18)
        {
          v19 = [v14 textFieldValues];
          if ([v19 count] == (id)1)
          {
            id v20 = [v19 objectAtIndex:0];
            id v21 = [v20 UTF8String];
            v33[3] = (uint64_t)v21;

            uint64_t v13 = 3;
          }
          else
          {
            uint64_t v13 = 2;
          }
        }
        else
        {
          uint64_t v13 = 0;
        }
        v16 = v28;
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 3;
    }
  }
  if (v33[3])
  {
    size_t v29 = 1024;
    id v22 = [objc_alloc((Class)NSMutableData) initWithLength:1024];
    id v23 = (const char *)v33[3];
    int v24 = strlen(v23);
    id v25 = v22;
    if (sub_1001E11A4(0, (uint64_t)v23, v24, 0, [v25 mutableBytes], &v29))
    {

      id v25 = 0;
      uint64_t v13 = 2;
    }
    else
    {
      [v25 setLength:v29];
      uint64_t v13 = 1;
    }
  }
  else
  {
    id v25 = 0;
  }
  [(DevicePasscodePromptOperation *)self setError:v12];
  [(DevicePasscodePromptOperation *)self setSuccess:v13 == 1];
  uint64_t v26 = [(DevicePasscodePromptOperation *)self tokenBlock];
  v27 = (void *)v26;
  if (v26) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v26 + 16))(v26, v13, v25, v12);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (int64_t)_keyboardType
{
  v2 = [(id)ISWeakLinkedClassForString() sharedConnection];
  int64_t v3 = 4 * ([v2 unlockScreenType] < 2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeEntrySemaphore, 0);
  objc_storeStrong(&self->_tokenBlock, 0);

  objc_storeStrong((id *)&self->_dialog, 0);
}

@end