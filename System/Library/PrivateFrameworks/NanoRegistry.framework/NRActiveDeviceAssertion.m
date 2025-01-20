@interface NRActiveDeviceAssertion
- (BOOL)isActive;
- (NRDevice)device;
- (id)description;
- (id)initWithDevice:(void *)a3 identifier:;
- (void)_invalidate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NRActiveDeviceAssertion

- (id)initWithDevice:(void *)a3 identifier:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)NRActiveDeviceAssertion;
    v8 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.nanoregistry.activeDeviceAssertion.%p", a1);
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v11 = v9;
      dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v10);
      id v13 = a1[3];
      a1[3] = v12;
    }
  }

  return a1;
}

- (void)dealloc
{
  -[NRActiveDeviceAssertion _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRActiveDeviceAssertion;
  [(NRActiveDeviceAssertion *)&v3 dealloc];
}

- (void)_invalidate
{
  if (a1)
  {
    id v2 = +[NRPairedDeviceRegistry sharedInstance];
    [v2 _invalidateActiveDeviceAssertionWithIdentifier:*(void *)(a1 + 16)];
  }
}

- (id)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__NRActiveDeviceAssertion_description__block_invoke;
  v5[3] = &unk_1E5B00198;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__NRActiveDeviceAssertion_description__block_invoke(uint64_t a1)
{
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:@"pairingID"];
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier = %@; pairingID = %@>",
    objc_opt_class(),
    *(void *)(a1 + 32),
    *(void *)(*(void *)(a1 + 32) + 16),
  uint64_t v2 = v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isActive
{
  uint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  LOBYTE(self) = [v3 isAssertionActive:self->_identifier];

  return (char)self;
}

- (NRDevice)device
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NRActiveDeviceAssertion_device__block_invoke;
  v5[3] = &unk_1E5B00C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NRDevice *)v3;
}

void __33__NRActiveDeviceAssertion_device__block_invoke(uint64_t a1)
{
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NRActiveDeviceAssertion_invalidate__block_invoke;
  block[3] = &unk_1E5B00230;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__NRActiveDeviceAssertion_invalidate__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end