@interface VFXLayerAsset
+ (BOOL)supportsSecureCoding;
- (CALayer)rootLayer;
- (VFXLayerAsset)initWithCoder:(id)a3;
- (id)activeStateName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stateController;
- (id)world;
- (void)addWorldReference:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeWorldReference:(id)a3;
- (void)setActiveStateName:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)updateActiveState;
@end

@implementation VFXLayerAsset

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXLayerAsset;
  [(VFXFileAsset *)&v3 dealloc];
}

- (id)world
{
  return self->_world;
}

- (void)addWorldReference:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (void)removeWorldReference:(id)a3
{
  self->_world = 0;
}

- (id)stateController
{
  id result = self->_stateController;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F39CB0]);
    uint64_t v8 = objc_msgSend_rootLayer(self, v5, v6, v7);
    id result = (id)objc_msgSend_initWithLayer_(v4, v9, v8, v10);
    self->_stateController = (CAStateController *)result;
  }
  return result;
}

- (void)updateActiveState
{
  world = self->_world;
  if (world)
  {
    uint64_t v6 = objc_msgSend_clock(world, a2, v2, v3);
    objc_msgSend_speed(v6, v7, v8, v9);
  }
  if (self->_activeStateName)
  {
    uint64_t v10 = objc_msgSend_rootLayer(self, a2, v2, v3);
    uint64_t v13 = objc_msgSend_stateWithName_(v10, v11, (uint64_t)self->_activeStateName, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = objc_msgSend_stateController(self, a2, v2, v3);
  uint64_t v18 = objc_msgSend_rootLayer(self, v15, v16, v17);

  MEMORY[0x1F4181798](v14, sel_setState_ofLayer_transitionSpeed_, v13, v18);
}

- (CALayer)rootLayer
{
  if (!self->_loaded)
  {
    self->_loaded = 1;
    v5 = objc_msgSend_world(self, a2, v2, v3);
    uint64_t v12 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);
    if (!v12)
    {
      uint64_t v13 = objc_msgSend_valueForKey_(VFXTransaction, v9, @"VFXWorldLoadingContextKey", v11);
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"VFXWorldLoaderAssetPathResolver", v15);
    }
    uint64_t v16 = objc_msgSend_filename(self, v9, v10, v11);
    uint64_t v19 = objc_msgSend_absoluteURLForAssetPath_(v12, v17, v16, v18);
    if (v19)
    {
      v23 = objc_msgSend_packageWithContentsOfURL_type_options_error_(MEMORY[0x1E4F39C38], v20, v19, *MEMORY[0x1E4F3A4C0], 0, 0);
      self->_rootLayer = (CALayer *)(id)objc_msgSend_rootLayer(v23, v24, v25, v26);
    }
    objc_msgSend_updateActiveState(self, v20, v21, v22);
  }
  return self->_rootLayer;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VFXLayerAsset;
  id v4 = [(VFXFileAsset *)&v6 copyWithZone:a3];
  v4[64] = self->_loaded;
  *((void *)v4 + 9) = self->_rootLayer;
  *((void *)v4 + 10) = self->_stateController;
  return v4;
}

- (id)activeStateName
{
  return self->_activeStateName;
}

- (void)setActiveStateName:(id)a3
{
  activeStateName = self->_activeStateName;
  if (activeStateName != a3)
  {

    self->_activeStateName = (NSString *)a3;
    objc_msgSend_updateActiveState(self, v6, v7, v8);
  }
}

- (VFXLayerAsset)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VFXLayerAsset;
  id v4 = -[VFXFileAsset initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"activeStateName");
    objc_msgSend_setActiveStateName_(v4, v8, v7, v9);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (objc_msgSend_activeStateName(self, a2, (uint64_t)a3, v3))
  {
    uint64_t active = objc_msgSend_activeStateName(self, v6, v7, v8);
    objc_msgSend_encodeObject_forKey_(a3, v10, active, @"activeStateName");
  }
  v11.receiver = self;
  v11.super_class = (Class)VFXLayerAsset;
  [(VFXFileAsset *)&v11 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRootLayer:(id)a3
{
}

@end