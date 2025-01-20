@interface PKSecureElement_HWManagerEventListener
- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4;
@end

@implementation PKSecureElement_HWManagerEventListener

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__526;
  v19 = __Block_byref_object_dispose__527;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __SharedHardwareManagerEventListenerCopy_block_invoke;
  v14[3] = &unk_1E56E3FD8;
  v14[4] = &v15;
  _SharedHardwareManagerEventListenerAccess(0, v14);
  id v6 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "secureElement:didChangeRestrictedMode:", v5, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }
}

@end