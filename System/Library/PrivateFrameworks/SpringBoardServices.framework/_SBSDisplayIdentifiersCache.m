@interface _SBSDisplayIdentifiersCache
+ (id)sharedInstance;
- (_SBSDisplayIdentifiersCache)init;
- (id)displayIdentifiers;
- (void)_queue_noteChanged;
- (void)dealloc;
- (void)registerChangedBlock:(id)a3;
@end

@implementation _SBSDisplayIdentifiersCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___SBSDisplayIdentifiersCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

- (_SBSDisplayIdentifiersCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)_SBSDisplayIdentifiersCache;
  v2 = [(_SBSDisplayIdentifiersCache *)&v10 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    objc_initWeak(&location, v2);
    v5 = v2->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___SBSDisplayIdentifiersCache_init__block_invoke;
    v7[3] = &unk_1E566DBD0;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.springboard.display-identifiers.changed", &v2->_changedToken, v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_changedToken);
  v3.receiver = self;
  v3.super_class = (Class)_SBSDisplayIdentifiersCache;
  [(_SBSDisplayIdentifiersCache *)&v3 dealloc];
}

- (id)displayIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  objc_super v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___SBSDisplayIdentifiersCache_displayIdentifiers__block_invoke;
  v5[3] = &unk_1E566D960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)registerChangedBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___SBSDisplayIdentifiersCache_registerChangedBlock___block_invoke;
  v7[3] = &unk_1E566DBF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_queue_noteChanged
{
  id v3 = self->_displayIdentifiers;
  displayIdentifiers = self->_displayIdentifiers;
  self->_displayIdentifiers = 0;

  if (self->_changedBlock)
  {
    v5 = (void *)MEMORY[0x192FC0DF0]();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49___SBSDisplayIdentifiersCache__queue_noteChanged__block_invoke;
    v7[3] = &unk_1E566B4B0;
    id v9 = v5;
    id v8 = v3;
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedBlock, 0);
  objc_storeStrong((id *)&self->_displayIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end