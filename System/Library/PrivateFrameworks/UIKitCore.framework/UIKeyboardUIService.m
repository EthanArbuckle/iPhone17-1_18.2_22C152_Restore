@interface UIKeyboardUIService
+ (id)serviceInterface;
+ (id)sharedService;
- (CAContext)context;
- (UIKeyboardUIService)init;
- (int)createSlot:(CGSize)a3;
- (void)clearSlots;
- (void)createContext;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation UIKeyboardUIService

+ (id)sharedService
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (UIKeyboardUIService)init
{
  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardUIService;
  id v2 = [(UIKeyboardUIService *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.inputservice.keyboardui", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    slots = v2->_slots;
    v2->_slots = (NSMutableArray *)v7;

    v9 = (void *)MEMORY[0x1E4F628A0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __27__UIKeyboardUIService_init__block_invoke;
    v15[3] = &unk_1E5305928;
    v10 = v2;
    v16 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:v15];
    id v12 = v10[1];
    v10[1] = (id)v11;

    [v10[1] activate];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v10 selector:sel_clearSlots name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  }
  return v2;
}

void __27__UIKeyboardUIService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.inputservice.keyboardui"];
  [v3 setService:@"com.apple.inputservice.keyboardui"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(UIKeyboardUIService *)self clearSlots];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardUIService;
  [(UIKeyboardUIService *)&v3 dealloc];
}

- (void)clearSlots
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = self->_slots;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(UIKeyboardUIService *)self context];
        objc_msgSend(v9, "deleteSlot:", objc_msgSend(v8, "unsignedIntValue"));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (id)serviceInterface
{
  if (qword_1EB263580 != -1) {
    dispatch_once(&qword_1EB263580, &__block_literal_global_13_3);
  }
  id v2 = (void *)qword_1EB263578;
  return v2;
}

void __39__UIKeyboardUIService_serviceInterface__block_invoke()
{
  id v4 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:@"com.apple.inputservice.keyboardui"];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED6578B0];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED701180];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:1];
  uint64_t v2 = [v4 copy];
  objc_super v3 = (void *)qword_1EB263578;
  qword_1EB263578 = v2;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v7 = self->_dispatchQueue;
  v8 = [(id)objc_opt_class() serviceInterface];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke;
  uint64_t v15 = &unk_1E5308A78;
  v16 = self;
  id v17 = v6;
  v18 = v7;
  id v19 = v8;
  id v9 = v8;
  long long v10 = v7;
  id v11 = v6;
  [v11 configureConnection:&v12];
  objc_msgSend(v11, "activate", v12, v13, v14, v15, v16);
}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = [[UIKeyboardUIHandle alloc] initWithService:a1[4] connection:a1[5]];
  [v3 setTargetQueue:a1[6]];
  id v4 = [MEMORY[0x1E4F628B0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:a1[7]];
  [v3 setInterfaceTarget:v5];
  [v3 setInvalidationHandler:&__block_literal_global_26_5];
  [v3 setInterruptionHandler:&__block_literal_global_29_4];
}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = KeyboardUIServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = KeyboardUIServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Interrupting connection: %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 invalidate];
}

- (void)createContext
{
  v10[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  uint64_t v4 = *MEMORY[0x1E4F39E60];
  v9[0] = *MEMORY[0x1E4F39E80];
  v9[1] = v4;
  v10[0] = v3;
  v10[1] = @"SnapshotContext";
  uint64_t v5 = *MEMORY[0x1E4F39E78];
  v9[2] = *MEMORY[0x1E4F39E70];
  v9[3] = v5;
  v10[2] = v3;
  v10[3] = v3;
  v9[4] = *MEMORY[0x1E4F39E50];
  v10[4] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  uint64_t v7 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v6];
  context = self->_context;
  self->_context = v7;
}

- (CAContext)context
{
  context = self->_context;
  if (!context)
  {
    [(UIKeyboardUIService *)self createContext];
    context = self->_context;
  }
  return context;
}

- (int)createSlot:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ((unint64_t)[(NSMutableArray *)self->_slots count] >= 3)
  {
    uint64_t v6 = [(NSMutableArray *)self->_slots firstObject];
    uint64_t v7 = [v6 unsignedIntValue];

    v8 = [(UIKeyboardUIService *)self context];
    [v8 deleteSlot:v7];

    [(NSMutableArray *)self->_slots removeObjectAtIndex:0];
  }
  id v9 = [(UIKeyboardUIService *)self context];
  uint64_t v10 = objc_msgSend(v9, "createImageSlot:hasAlpha:", 1, width, height);

  slots = self->_slots;
  uint64_t v12 = [NSNumber numberWithUnsignedInt:v10];
  [(NSMutableArray *)slots addObject:v12];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bsConnectionlistener, 0);
}

@end