@interface PKMotionManager
+ (id)sharedManager;
- (BOOL)isMonitoring;
- (CMDeviceMotion)motion;
- (PKMotionManager)init;
- (id)_init;
- (void)dealloc;
- (void)registerClient:(id)a3;
- (void)unregisterClient:(id)a3;
- (void)updateWithMotion:(id)a3;
@end

@implementation PKMotionManager

uint64_t __32__PKMotionManager_sharedManager__block_invoke()
{
  sharedManager_manager = [[PKMotionManager alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)PKMotionManager;
  v2 = [(PKMotionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    v5 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
    motionManager = v2->_motionManager;
    v2->_motionManager = v5;

    [(CMMotionManager *)v2->_motionManager setDeviceMotionUpdateInterval:0.0333333333];
  }
  return v2;
}

void __34__PKMotionManager_registerClient___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 24))
    {
      id v6 = v4;
      objc_storeStrong((id *)(v5 + 32), a2);
      [*(id *)(a1 + 32) updateWithMotion:v6];
      id v4 = v6;
    }
  }
}

- (void)updateWithMotion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "motionManager:didReceiveMotion:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSHashTable *)self->_clients addObject:v4];
    if (self->_monitoring)
    {
      if (self->_motion) {
        objc_msgSend(v4, "motionManager:didReceiveMotion:", self);
      }
    }
    else
    {
      self->_monitoring = 1;
      motionManager = self->_motionManager;
      uint64_t v6 = [MEMORY[0x263F08A48] mainQueue];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __34__PKMotionManager_registerClient___block_invoke;
      v7[3] = &unk_2644F9638;
      v7[4] = self;
      [(CMMotionManager *)motionManager startDeviceMotionUpdatesToQueue:v6 withHandler:v7];
    }
  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

- (PKMotionManager)init
{
  return 0;
}

- (void)dealloc
{
  if (self->_monitoring) {
    [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKMotionManager;
  [(PKMotionManager *)&v3 dealloc];
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_clients removeObject:v4];
    id v4 = [(NSHashTable *)self->_clients anyObject];
    if (v4)
    {
    }
    else
    {
      id v5 = v7;
      if (!self->_monitoring) {
        goto LABEL_7;
      }
      self->_monitoring = 0;
      motion = self->_motion;
      self->_motion = 0;

      id v4 = (id)[(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
    }
    id v5 = v7;
  }
LABEL_7:

  MEMORY[0x270F9A758](v4, v5);
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (CMDeviceMotion)motion
{
  return self->_motion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end