@interface NTKComplicationControllerAssertion
- (BOOL)invalidated;
- (NTKComplicationController)controller;
- (NTKComplicationControllerAssertion)initWithController:(id)a3 dataMode:(int64_t)a4;
- (int64_t)dataMode;
- (void)dealloc;
- (void)invalidate;
- (void)setDataMode:(int64_t)a3;
@end

@implementation NTKComplicationControllerAssertion

- (NTKComplicationControllerAssertion)initWithController:(id)a3 dataMode:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKComplicationControllerAssertion;
  v8 = [(NTKComplicationControllerAssertion *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_lock_dataMode = a4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__NTKComplicationControllerAssertion_initWithController_dataMode___block_invoke;
    v11[3] = &unk_1E62C09C0;
    id v12 = v7;
    v13 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  return v9;
}

uint64_t __66__NTKComplicationControllerAssertion_initWithController_dataMode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Taking out controller assertion %@ for controller %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) addDataModeAssertion:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationControllerAssertion;
  [(NTKComplicationControllerAssertion *)&v4 dealloc];
}

- (void)setDataMode:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_dataMode = self->_lock_dataMode;
  self->_int64_t lock_dataMode = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_dataMode != a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__NTKComplicationControllerAssertion_setDataMode___block_invoke;
    v7[3] = &unk_1E62C2950;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __50__NTKComplicationControllerAssertion_setDataMode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    objc_super v4 = NTKFaceDataModeDescription(*(void *)(a1 + 40));
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Updating data mode for assertion %@ to %@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "updateDataModeAssertion:");
}

- (int64_t)dataMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_dataMode = self->_lock_dataMode;
  os_unfair_lock_unlock(p_lock);
  return lock_dataMode;
}

- (BOOL)invalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKComplicationControllerAssertion_invalidate__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__NTKComplicationControllerAssertion_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 32);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Invalding controller assertion %@ for controller %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeDataModeAssertion:");
}

- (NTKComplicationController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
}

@end