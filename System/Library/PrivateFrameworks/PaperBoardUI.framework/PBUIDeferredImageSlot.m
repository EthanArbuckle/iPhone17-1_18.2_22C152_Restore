@interface PBUIDeferredImageSlot
- (PBUIDeferredImageSlot)initWithLifetimeToken:(id)a3;
- (UIColor)fallbackColor;
- (void)addImageSlotObserver:(id)a3;
- (void)removeImageSlotObserver:(id)a3;
- (void)setFallbackColor:(id)a3;
- (void)updateWithImage:(id)a3;
@end

@implementation PBUIDeferredImageSlot

- (PBUIDeferredImageSlot)initWithLifetimeToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIDeferredImageSlot;
  return (PBUIDeferredImageSlot *)[(PBUIImageSlot *)&v4 _initWithImage:0 lifetimeToken:a3];
}

- (void)updateWithImage:(id)a3
{
  [(PBUIImageSlot *)self _setImage:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PBUIDeferredImageSlot_updateWithImage___block_invoke;
  block[3] = &unk_1E62B2798;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__PBUIDeferredImageSlot_updateWithImage___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        v9 = objc_msgSend(v8, "image", (void)v10);
        [v7 deferredImageSlot:v8 didUpdateImage:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)addImageSlotObserver:(id)a3
{
  id v4 = a3;
  imageSlotObservers = self->_imageSlotObservers;
  id v8 = v4;
  if (!imageSlotObservers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_imageSlotObservers;
    self->_imageSlotObservers = v6;

    id v4 = v8;
    imageSlotObservers = self->_imageSlotObservers;
  }
  [(NSHashTable *)imageSlotObservers addObject:v4];
}

- (void)removeImageSlotObserver:(id)a3
{
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void)setFallbackColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_imageSlotObservers, 0);
}

@end