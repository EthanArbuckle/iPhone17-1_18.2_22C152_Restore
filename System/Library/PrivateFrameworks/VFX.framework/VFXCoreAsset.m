@interface VFXCoreAsset
+ (BOOL)supportsSecureCoding;
+ (id)assetWithEntityObject:(id)a3;
- (BOOL)isTextureSource;
- (NSString)identifier;
- (NSString)name;
- (VFXBehaviorGraph)behaviorGraph;
- (VFXCoreAsset)initWithCoder:(id)a3;
- (VFXCoreAsset)initWithEntityObject:(id)a3;
- (__CFXWorld)worldRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entityObject;
- (id)entityTag;
- (id)world;
- (void)addWorldReference:(id)a3;
- (void)dealloc;
- (void)didAttachToWorld:(id)a3;
- (void)didDetachFromWorld:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeWorldReference:(id)a3;
- (void)resolveTag:(id)a3 remap:(id)a4;
- (void)setBehaviorGraph:(id)a3;
- (void)setEntityHandle:(id)a3;
- (void)setIsTextureSource:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation VFXCoreAsset

- (BOOL)isTextureSource
{
  return self->_isTextureSource;
}

- (void)setIsTextureSource:(BOOL)a3
{
  self->_isTextureSource = a3;
}

- (VFXCoreAsset)initWithEntityObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXCoreAsset;
  v6 = [(VFXCoreAsset *)&v8 init];
  if (v6) {
    v6->_entityHandle = (VFXCoreEntityHandle *)(id)objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v4, (uint64_t)a3, v5);
  }
  return v6;
}

+ (id)assetWithEntityObject:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend_tag(self->_entityHandle, a2, v2, v3);
}

- (id)entityTag
{
  return (id)objc_msgSend_tag(self->_entityHandle, a2, v2, v3);
}

- (id)entityObject
{
  return (id)objc_msgSend_entityObject(self->_entityHandle, a2, v2, v3);
}

- (void)setEntityHandle:(id)a3
{
  entityHandle = self->_entityHandle;
  if (entityHandle != a3)
  {

    self->_entityHandle = (VFXCoreEntityHandle *)a3;
  }
}

- (void)resolveTag:(id)a3 remap:(id)a4
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXCoreAsset;
  [(VFXCoreAsset *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_name(self, v5, v6, v7);
  objc_msgSend_setName_(v4, v9, v8, v10);
  uint64_t isTextureSource = objc_msgSend_isTextureSource(self, v11, v12, v13);
  objc_msgSend_setIsTextureSource_(v4, v15, isTextureSource, v16);
  id v20 = (id)objc_msgSend_copy(self->_entityHandle, v17, v18, v19);
  objc_msgSend_setEntityHandle_(v4, v21, (uint64_t)v20, v22);
  return v4;
}

- (VFXBehaviorGraph)behaviorGraph
{
  result = self->_behaviorGraph;
  if (!result)
  {
    if (objc_msgSend_entityObject(self->_entityHandle, a2, v2, v3))
    {
      uint64_t v9 = objc_msgSend_entityObject(self->_entityHandle, v6, v7, v8);
      result = (VFXBehaviorGraph *)(id)objc_msgSend_behaviorGraphWithEntityObject_(VFXBehaviorGraph, v10, v9, v11);
      self->_behaviorGraph = result;
    }
    else
    {
      return self->_behaviorGraph;
    }
  }
  return result;
}

- (void)didAttachToWorld:(id)a3
{
  objc_msgSend_wasAddedToWorld_(self->_entityHandle, a2, (uint64_t)a3, v3);
}

- (void)didDetachFromWorld:(id)a3
{
  objc_msgSend_willBeRemovedFromWorld_(self->_entityHandle, a2, (uint64_t)a3, v3);
}

- (void)addWorldReference:(id)a3
{
  if (self->_world == a3)
  {
    ++self->_worldReferenceCounter;
  }
  else
  {
    self->_world = (VFXWorld *)a3;
    self->_worldReferenceCounter = 1;
    objc_msgSend_didAttachToWorld_(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6590F48;
    v8[3] = &unk_1E6142EC8;
    v8[4] = a3;
    objc_msgSend_enumerateDependencies_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)removeWorldReference:(id)a3
{
  world = self->_world;
  if (!a3 || world == a3)
  {
    unsigned int worldReferenceCounter = self->_worldReferenceCounter;
    if (worldReferenceCounter)
    {
      unsigned int v12 = worldReferenceCounter - 1;
      self->_unsigned int worldReferenceCounter = v12;
      if (!v12)
      {
        objc_msgSend_didDetachFromWorld_(self, a2, (uint64_t)world, v3);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = sub_1B659101C;
        v15[3] = &unk_1E6142EC8;
        v15[4] = a3;
        objc_msgSend_enumerateDependencies_(self, v13, (uint64_t)v15, v14);
        self->_world = 0;
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: Over-detach of instance %@ from world %@", (uint64_t)world, v3, v4, v5, v6, v7, (uint64_t)self);
    }
  }
}

- (id)world
{
  return self->_world;
}

- (__CFXWorld)worldRef
{
  return (__CFXWorld *)objc_msgSend___CFObject(self->_world, a2, v2, v3);
}

- (VFXCoreAsset)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VFXCoreAsset;
  uint64_t v6 = [(VFXCoreAsset *)&v24 init];
  if (v6)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, @"entityTag", v5))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"entityTag");
      uint64_t v10 = [VFXCoreEntityHandle alloc];
      uint64_t v13 = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v10, v11, v9, v12);
    }
    else
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v13 = (VFXCoreEntityHandle *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, @"entityHandle");
    }
    v6->_entityHandle = v13;
    uint64_t v16 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, @"name");
    uint64_t v20 = objc_msgSend_decodeBoolForKey_(a3, v18, @"isTextureSource", v19);
    objc_msgSend_setIsTextureSource_(v6, v21, v20, v22);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  entityHandle = self->_entityHandle;
  if (entityHandle) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)entityHandle, @"entityHandle");
  }
  name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)name, @"name");
  }
  uint64_t isTextureSource = objc_msgSend_isTextureSource(self, a2, (uint64_t)name, v3);

  objc_msgSend_encodeBool_forKey_(a3, v8, isTextureSource, @"isTextureSource");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setBehaviorGraph:(id)a3
{
}

@end