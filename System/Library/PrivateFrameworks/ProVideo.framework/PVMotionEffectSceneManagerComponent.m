@interface PVMotionEffectSceneManagerComponent
- (NSMutableDictionary)handleToOZID;
- (PVMotionEffectSceneManagerComponent)initWithMotionEffect:(id)a3;
- (id)handleForOZID:(unsigned int)a3;
- (void)add3DObject:(id)a3 handle:(id)a4;
- (void)deleteObjectsWithHandles:(id)a3;
@end

@implementation PVMotionEffectSceneManagerComponent

- (PVMotionEffectSceneManagerComponent)initWithMotionEffect:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVMotionEffectSceneManagerComponent;
  v5 = [(PVMotionEffectComponent *)&v9 initWithMotionEffect:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    handleToOZID = v5->_handleToOZID;
    v5->_handleToOZID = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)add3DObject:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PVMotionEffectComponent *)self motionEffect];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = *(void *)"";
  v11[2] = __58__PVMotionEffectSceneManagerComponent_add3DObject_handle___block_invoke;
  v11[3] = &unk_1E6169040;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 runEnsuringDocumentReadyAndLockingDocument:v11];
}

uint64_t __58__PVMotionEffectSceneManagerComponent_add3DObject_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "add3DObject_noLock:handle:documentInfo:", *(void *)(a1 + 40), *(void *)(a1 + 48), a2);
}

- (void)deleteObjectsWithHandles:(id)a3
{
  id v4 = a3;
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __64__PVMotionEffectSceneManagerComponent_deleteObjectsWithHandles___block_invoke;
  v7[3] = &unk_1E6169498;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v7];
}

uint64_t __64__PVMotionEffectSceneManagerComponent_deleteObjectsWithHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObjects_noLock:documentInfo:", *(void *)(a1 + 40), a2);
}

- (id)handleForOZID:(unsigned int)a3
{
  handleToOZID = self->_handleToOZID;
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)handleToOZID allKeysForObject:v4];

  id v6 = [v5 firstObject];

  return v6;
}

- (NSMutableDictionary)handleToOZID
{
  return self->_handleToOZID;
}

- (void).cxx_destruct
{
}

@end