@interface SUSUILaggardsUIAlertAction
- (SUDescriptor)descriptor;
- (SUSUILaggardsUIAlertAction)initWithDescriptor:(id)a3 completionBlock:(id)a4;
- (void)decodeFromCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadIfNecessary;
@end

@implementation SUSUILaggardsUIAlertAction

- (SUSUILaggardsUIAlertAction)initWithDescriptor:(id)a3 completionBlock:(id)a4
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  objc_storeStrong((id *)&v25->_descriptor, location[0]);
  id v22 = (id)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [(SUSUILaggardsUIAlertAction *)v25 encodeWithCoder:v22];
  id v21 = objc_alloc_init(MEMORY[0x263F29C78]);
  id v6 = v21;
  id v7 = (id)[v22 encodedData];
  objc_msgSend(v6, "setObject:forSetting:");

  v9 = v25;
  id v10 = v21;
  v8 = (void *)MEMORY[0x263F29BB8];
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  v17 = __65__SUSUILaggardsUIAlertAction_initWithDescriptor_completionBlock___block_invoke;
  v18 = &unk_26470C8C0;
  v19 = v25;
  id v20 = v23;
  id v11 = (id)objc_msgSend(v8, "responderWithHandler:");
  v25 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)SUSUILaggardsUIAlertAction;
  v25 = -[SUSUILaggardsUIAlertAction initWithInfo:responder:](&v13, sel_initWithInfo_responder_, v10);
  v12 = v25;

  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v12;
}

void __65__SUSUILaggardsUIAlertAction_initWithDescriptor_completionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_super v13 = a1;
  id v7 = (id)[location[0] info];
  [v7 flagForSetting:SUSUILaggardsUIAlertActionOutputSuccess];
  char IsYes = BSSettingFlagIsYes();

  char v12 = IsYes & 1;
  id v11 = SUSUILog();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    os_log_type_t type = v10;
    id v2 = (id)objc_opt_class();
    id v9 = v2;
    if (v12) {
      v3 = @"YES";
    }
    else {
      v3 = @"NO";
    }
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v2, (uint64_t)v3);
    _os_log_impl(&dword_224ECB000, log, type, "%@ got response: %@", v15, 0x16u);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v11, 0);
  if (a1[5]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (SUDescriptor)descriptor
{
  [(SUSUILaggardsUIAlertAction *)self loadIfNecessary];
  descriptor = self->_descriptor;

  return descriptor;
}

- (void)loadIfNecessary
{
  id v6 = self;
  v5[1] = (id)a2;
  if (!self->_loaded)
  {
    id v3 = (id)[(SUSUILaggardsUIAlertAction *)v6 info];
    v5[0] = (id)[v3 objectForSetting:SUSUILaggardsUIAlertActionInput];

    id v2 = objc_alloc(MEMORY[0x263F08928]);
    id v4 = (id)objc_msgSend(v2, "initForReadingFromData:error:", v5[0]);
    [(SUSUILaggardsUIAlertAction *)v6 decodeFromCoder:v4];
    [v4 finishDecoding];
    v6->_loaded = 1;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(v5, 0);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_descriptor) {
    [location[0] encodeObject:v4->_descriptor forKey:@"_susDescriptor"];
  }
  objc_storeStrong(location, 0);
}

- (void)decodeFromCoder:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (SUDescriptor *)(id)[location[0] decodeObjectOfClass:objc_opt_class() forKey:@"_susDescriptor"];
  descriptor = v6->_descriptor;
  v6->_descriptor = v3;

  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end