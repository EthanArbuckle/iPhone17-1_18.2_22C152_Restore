@interface VFXMaterialProperty
+ (BOOL)supportsSecureCoding;
+ (VFXMaterialProperty)materialPropertyWithContents:(id)a3;
+ (__CFXImage)_copyCFXImageFromImageData:(id)a3 typeID:(unint64_t)a4;
+ (__CFXImage)copyCFXImageFromImage:(id)a3;
+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4;
+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5;
+ (id)_copyImageFromCFXImage:(__CFXImage *)a3;
+ (id)captureDeviceOutputConsumer;
+ (id)captureDeviceOutputConsumerWithOptions:(id)a3;
+ (id)copyImageFromCFXImage:(__CFXImage *)a3;
+ (id)dvt_supportedTypesForPropertyContents;
+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4;
+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4;
+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_hasDefaultValues;
- (BOOL)isColorManaged;
- (BOOL)isPausedOrPausedByInheritance;
- (CFXColor4)color4;
- (CGContext)copyBitmap;
- (CGImage)contentsAsCGImage;
- (NSArray)animationKeys;
- (NSString)description;
- (VFXMaterialProperty)init;
- (VFXMaterialProperty)initWithCoder:(id)a3;
- (VFXMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4;
- (VFXMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4;
- (__CFXAnimationManager)animationManager;
- (__CFXCommonProfile)commonProfile;
- (__CFXMaterialProperty)materialProperty;
- (__CFXMaterialProperty)materialPropertyCreateIfNeeded:(BOOL)a3;
- (__CFXTextureSampler)textureSampler;
- (__CFXWorld)worldRef;
- (__n128)contentsTransform;
- (char)propertyType;
- (double)linearExtendedSRGBColor;
- (float)intensity;
- (float)maxAnisotropy;
- (id)UIView;
- (id)__runtimeResolvedURL;
- (id)_animationPathForKey:(id)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)assetValue;
- (id)avPlayer;
- (id)captureDevice;
- (id)captureDeviceOutputConsumerSource;
- (id)color;
- (id)contents;
- (id)contentsAbsoluteURL;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)floatValue;
- (id)image;
- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3;
- (id)layer;
- (id)mtlTexture;
- (id)parent;
- (id)precomputedLightingEnvironment;
- (id)presentationMaterialProperty;
- (id)presentationObject;
- (id)propertyName;
- (id)pvrtcData;
- (id)textureProvider;
- (id)valueForKey:(id)a3;
- (id)world;
- (int)_textureOptions;
- (int64_t)_presentationMappingChannel;
- (int64_t)magnificationFilter;
- (int64_t)mappingChannel;
- (int64_t)minificationFilter;
- (int64_t)mipFilter;
- (int64_t)textureComponents;
- (int64_t)wrapS;
- (int64_t)wrapT;
- (uint64_t)setContentsTransform:(__n128)a3;
- (void)__CFObject;
- (void)__allocateContentTransformIfNeeded;
- (void)_clearContents;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customEncodingOfVFXMaterialProperty:(id)a3;
- (void)_didDecodeVFXMaterialProperty:(id)a3;
- (void)_layerDidChange:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setCFXImageRef:(__CFXImage *)a3;
- (void)_setColor:(id)a3;
- (void)_setImagePath:(id)a3 withResolvedURL:(id)a4;
- (void)_setParent:(id)a3;
- (void)_setupContentsFromCFXImage;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateCFXImageWithContents:(id)a3;
- (void)_updateMaterialAVPlayer:(id)a3;
- (void)_updateMaterialAsset:(id)a3;
- (void)_updateMaterialCaptureDevice:(id)a3;
- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3;
- (void)_updateMaterialColor:(id)a3;
- (void)_updateMaterialFilters;
- (void)_updateMaterialImage:(id)a3;
- (void)_updateMaterialLayer:(id)a3;
- (void)_updateMaterialMTLTexture:(id)a3;
- (void)_updateMaterialNumber:(id)a3;
- (void)_updateMaterialPropertyTransform:(uint64_t)a3;
- (void)_updateMaterialTextureProvider:(id)a3;
- (void)_updateMaterialUIComponent:(id)a3;
- (void)_updatePrecomputedLightingEnvironment:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyPropertiesFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCFXImageRef;
- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4;
- (void)parentWillDie:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setAssetValue:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureDeviceOutputConsumerSource:(id)a3;
- (void)setColor:(id)a3;
- (void)setColorManaged:(BOOL)a3;
- (void)setContents:(id)a3;
- (void)setFloatValue:(id)a3;
- (void)setImage:(id)a3;
- (void)setIntensity:(float)a3;
- (void)setLayer:(id)a3;
- (void)setLinearExtendedSRGBColor:(VFXMaterialProperty *)self;
- (void)setMagnificationFilter:(int64_t)a3;
- (void)setMappingChannel:(int64_t)a3;
- (void)setMaxAnisotropy:(float)a3;
- (void)setMinificationFilter:(int64_t)a3;
- (void)setMipFilter:(int64_t)a3;
- (void)setMtlTexture:(id)a3;
- (void)setPrecomputedLightingEnvironment:(id)a3;
- (void)setTextureComponents:(int64_t)a3;
- (void)setTextureProvider:(id)a3;
- (void)setUIView:(id)a3;
- (void)setUIWindow:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWrapS:(int64_t)a3;
- (void)setWrapT:(int64_t)a3;
- (void)unbindAnimatablePath:(id)a3;
- (void)unlinkCustomPropertyWithParent:(id)a3;
@end

@implementation VFXMaterialProperty

+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, 1, a4);

  return (id)MEMORY[0x1F4181798](a1, sel_precomputedLightingEnvironmentContentsWithData_error_, v6, a4);
}

+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();

  return (id)objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v7, v8, (uint64_t)a3, a4);
}

+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v10 = [VFXWorld alloc];
  v80 = @"VFXWorldLoaderDisableVFXCoreSupport";
  v81[0] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v81, (uint64_t)&v80, 1);
  v15 = objc_msgSend_initWithOptions_(v10, v13, v12, v14);
  v19 = objc_msgSend_lightingEnvironment(v15, v16, v17, v18);
  objc_msgSend_setContents_(v19, v20, (uint64_t)a3, v21);
  uint64_t v32 = objc_msgSend_materialProperty(v19, v22, v23, v24);
  if (!v32) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v26, v27, v28, v29, v30, v31, (uint64_t)"materialProperty");
  }
  objc_msgSend_commit(VFXTransaction, v25, v26, v27);
  if (sub_1B6475F88(v32, v33, v34, v35, v36, v37, v38, v39))
  {
    v47 = objc_msgSend_rendererWithDevice_options_(VFXRenderer, v40, (uint64_t)a4, 0);
    v51 = objc_msgSend__renderContextMetal(v47, v48, v49, v50);
    objc_msgSend_beginFrame_(v51, v52, 0, v53);
    uint64_t v56 = objc_msgSend_radianceTextureForMaterialProperty_(v51, v54, v32, v55);
    uint64_t v59 = objc_msgSend_irradianceTextureForMaterialProperty_(v51, v57, v32, v58);
    uint64_t v79 = 5;
    objc_msgSend_endFrameWaitingUntilCompleted_status_error_(v51, v60, 1, (uint64_t)&v79, a5);
    v61 = 0;
    if (v56 && v59 && v79 == 4)
    {
      v62 = (void *)sub_1B64D98D8(v56);
      v63 = (void *)sub_1B64D98D8(v59);
      v61 = objc_alloc_init(VFXPrecomputedLightingEnvironment);
      objc_msgSend_setRadianceData_(v61, v64, (uint64_t)v62, v65);
      objc_msgSend_setIrradianceData_(v61, v66, (uint64_t)v63, v67);
    }
  }
  else
  {
    if (!sub_1B6477598(v32, (uint64_t)v40, v41, v42, v43, v44, v45, v46))
    {

      return 0;
    }
    v61 = (VFXPrecomputedLightingEnvironment *)sub_1B647761C(v32, v68, v69, v70, v71, v72, v73, v74);
    v75 = v61;
  }

  if (!v61) {
    return 0;
  }
  v77 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v76, (uint64_t)v61, 1, a5);

  return v77;
}

- (VFXMaterialProperty)init
{
  v8.receiver = self;
  v8.super_class = (Class)VFXMaterialProperty;
  v2 = [(VFXMaterialProperty *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_parent = 0;
    v2->_propertyType = 26;
    *((unsigned char *)v2 + 8) &= ~2u;
    v2->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B647541C(0, 26);
    v3->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v3, v4, v5, v6);
  }
  return v3;
}

+ (VFXMaterialProperty)materialPropertyWithContents:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v6 = (VFXMaterialProperty *)(id)objc_msgSend_initWithParent_propertyType_(v4, v5, 0, 26);
  objc_msgSend_setContents_(v6, v7, (uint64_t)a3, v8);
  return v6;
}

- (VFXMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4
{
  int v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VFXMaterialProperty;
  uint64_t v6 = [(VFXMaterialProperty *)&v16 init];
  v10 = v6;
  if (v6)
  {
    if (v6 == a3) {
      id v11 = 0;
    }
    else {
      id v11 = a3;
    }
    v6->_parent = v11;
    v6->_propertyType = v4;
    *((unsigned char *)v6 + 8) = *((unsigned char *)v6 + 8) & 0xFD | (2 * (v4 < 20));
    if (!v11) {
      v6->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B647541C(0, 26);
    }
    v10->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v10, v7, v8, v9);
    objc_msgSend__syncObjCAnimations(v10, v12, v13, v14);
  }
  return v10;
}

- (VFXMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)VFXMaterialProperty;
  uint64_t v6 = [(VFXMaterialProperty *)&v19 init];
  v10 = v6;
  if (v6)
  {
    if (v6 == a3) {
      id v11 = 0;
    }
    else {
      id v11 = a3;
    }
    v6->_parent = v11;
    v6->_propertyType = 26;
    v6->_customMaterialPropertyName = (NSString *)objc_msgSend_copy(a4, v7, v8, v9);
    *((unsigned char *)v10 + 8) &= ~2u;
    v10->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v10, v12, v13, v14);
    objc_msgSend__syncObjCAnimations(v10, v15, v16, v17);
  }
  return v10;
}

- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VFXMaterialProperty;
  v7 = [(VFXMaterialProperty *)&v15 init];
  if (v7)
  {
    if ((VFXMaterialProperty *)objc_msgSend_parent(a3, v4, v5, v6) == v7) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = objc_msgSend_parent(a3, v8, v9, v10);
    }
    v7->_parent = (id)v11;
    int v12 = objc_msgSend_propertyType(a3, v8, v9, v10);
    v7->_propertyType = v12;
    if (v12 >= 20) {
      char v13 = 1;
    }
    else {
      char v13 = 3;
    }
    *((unsigned char *)v7 + 8) = v13 | *((unsigned char *)v7 + 8) & 0xFC;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v7;
}

- (void)__allocateContentTransformIfNeeded
{
  if (!self->_contentTransform)
  {
    v3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
    self->_contentTransform = v3;
    *((_OWORD *)v3 + 2) = xmmword_1B6E51E80;
    *((_OWORD *)v3 + 3) = *(_OWORD *)&qword_1B6E51E90;
    *(_OWORD *)v3 = VFXMatrix4Identity;
    *((_OWORD *)v3 + 1) = *(_OWORD *)&qword_1B6E51E70;
  }
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  self->_runtimeResolvedURL = 0;
  objc_msgSend__clearContents(self, v8, v9, v10);

  free(self->_contentTransform);
  v11.receiver = self;
  v11.super_class = (Class)VFXMaterialProperty;
  [(VFXMaterialProperty *)&v11 dealloc];
}

- (id)contentsAbsoluteURL
{
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    return (id)sub_1B6439EF8((uint64_t)cfxImage, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = objc_msgSend_world(self, v11, v12, v13);
      uint64_t v18 = objc_msgSend_assetPathResolver(v14, v15, v16, v17);
      uint64_t v23 = objc_msgSend_filename(self->_contents, v19, v20, v21);
      return (id)objc_msgSend_absoluteURLForAssetPath_(v18, v22, v23, v24);
    }
    else
    {
      return self->_runtimeResolvedURL;
    }
  }
}

- (id)__runtimeResolvedURL
{
  return self->_runtimeResolvedURL;
}

- (void)_setParent:(id)a3
{
  self->_parent = a3;
}

- (void)unlinkCustomPropertyWithParent:(id)a3
{
  self->_customMaterialProperty->var13 = 0;
  objc_msgSend__setParent_(self, a2, 0, v3);
}

- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4
{
  if (a3 == self) {
    id v7 = 0;
  }
  else {
    id v7 = a3;
  }
  self->_parent = v7;

  objc_super v11 = (NSString *)objc_msgSend_copy(a4, v8, v9, v10);
  self->_customMaterialPropertyName = v11;
  self->_propertyType = 26;
  *((unsigned char *)self + 8) &= ~2u;
  if (v11 && !self->_customMaterialProperty) {
    self->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B647541C(0, 26);
  }
  if ((VFXMaterialProperty *)objc_msgSend___CFObject(a3, v12, v13, v14) == self) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = objc_msgSend___CFObject(a3, v15, v16, v17);
  }
  self->_customMaterialProperty->var13 = v18;
}

- (__CFXMaterialProperty)materialPropertyCreateIfNeeded:(BOOL)a3
{
  BOOL v8 = a3;
  switch(self->_propertyType)
  {
    case 0x15:
      result = (__CFXMaterialProperty *)objc_msgSend_lightRef(self->_parent, a2, a3, v3);
      if (result)
      {
        result = (__CFXMaterialProperty *)sub_1B6494EB8((uint64_t)result, v8, v11, v12, v13, v14, v15, v16);
      }
      break;
    case 0x17:
      result = (__CFXMaterialProperty *)objc_msgSend_worldRef(self->_parent, a2, a3, v3);
      if (result)
      {
        result = (__CFXMaterialProperty *)sub_1B64B27BC((uint64_t)result, v8);
      }
      break;
    case 0x18:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        result = (__CFXMaterialProperty *)objc_msgSend_worldRef(self->_parent, v23, v24, v25);
        if (result)
        {
          result = (__CFXMaterialProperty *)sub_1B64B2810((uint64_t)result, v8);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        result = (__CFXMaterialProperty *)objc_msgSend_lightRef(self->_parent, v26, v27, v28);
        if (result)
        {
          result = (__CFXMaterialProperty *)sub_1B6494F20((uint64_t)result, v8, v29, v30, v31, v32, v33, v34);
        }
      }
      break;
    case 0x19:
      sub_1B63F2F54(16, @"Error: custom color grading not implemented", a3, v3, v4, v5, v6, v7, v35);
LABEL_20:
      result = 0;
      break;
    case 0x1A:
      result = self->_customMaterialProperty;
      break;
    default:
      result = (__CFXMaterialProperty *)objc_msgSend_commonProfile(self, a2, a3, v3);
      if (result)
      {
        int propertyType = self->_propertyType;
        result = (__CFXMaterialProperty *)sub_1B6475290((uint64_t)result, propertyType, v8, v17, v18, v19, v20, v21);
      }
      break;
  }
  return result;
}

- (id)_animationPathForKey:(id)a3
{
  uint64_t v5 = objc_msgSend_materialPropertyName(self, a2, (uint64_t)a3, v3);
  BOOL v8 = objc_msgSend_stringByAppendingString_(v5, v6, @".", v7);

  return (id)objc_msgSend_stringByAppendingString_(v8, v9, (uint64_t)a3, v10);
}

- (void)_clearContents
{
  unsigned int contentType = self->_contentType;
  BOOL v6 = contentType > 0xA;
  int v7 = (1 << contentType) & 0x794;
  if (!v6 && v7 != 0)
  {
    id contents = self->_contents;
    if (contents)
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3052000000;
      v14[3] = sub_1B6508A18;
      v14[4] = sub_1B6508A28;
      v14[5] = contents;
      uint64_t v10 = objc_msgSend_worldRef(self, a2, v2, v3);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1B6508A34;
      v13[3] = &unk_1E6143A08;
      v13[4] = v14;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v13);
      _Block_object_dispose(v14, 8);
    }
  }
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    CFRelease(cfxImage);
    self->_cfxImage = 0;
  }

  self->_id contents = 0;
}

- (void)_setColor:(id)a3
{
  if (self->_contents != a3)
  {
    self->_id contents = a3;
    self->_unsigned int contentType = 0;
  }
}

- (void)setColor:(id)a3
{
  if ((*((unsigned char *)self + 8) & 1) != 0 || self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 0;
    if (a3)
    {
      uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
      uint64_t v12 = objc_msgSend__animationPathForKey_(self, v10, @"color", v11);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1B6508B9C;
      v14[3] = &unk_1E6141230;
      v14[4] = self;
      v14[5] = a3;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v13, v9, (uint64_t)self, v12, v14);
    }
  }
}

- (id)color
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15 && (uint64_t v23 = sub_1B6475E50(v15, (uint64_t)v16, v17, v18, v19, v20, v21, v22)) != 0)
    {
      uint64_t v24 = v23;
      uint64_t v25 = (void *)MEMORY[0x1E4FB1618];
      int isColorManaged = objc_msgSend_isColorManaged(self, v16, v17, v18);
      uint64_t v5 = objc_msgSend_vfx_colorWithCFXColor_ignoringColorSpace_(v25, v27, v24, isColorManaged ^ 1u);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      uint64_t v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  if (self->_contentType) {
    return 0;
  }
  id v29 = self->_contents;

  return v29;
}

- (double)linearExtendedSRGBColor
{
  uint64_t v4 = (const void *)objc_msgSend_color(a1, a2, a3, a4);

  return sub_1B64FA040(v4);
}

- (void)setLinearExtendedSRGBColor:(VFXMaterialProperty *)self
{
  CGColorRef v4 = sub_1B63C9830(v2);
  uint64_t v7 = objc_msgSend_colorWithCGColor_(MEMORY[0x1E4FB1618], v5, (uint64_t)v4, v6);
  objc_msgSend_setColor_(self, v8, v7, v9);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)setFloatValue:(id)a3
{
  id contents = self->_contents;
  if (contents != a3 && (objc_msgSend_isEqual_(contents, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend__clearContents(self, v7, v8, v9);
    self->_id contents = a3;
    self->_unsigned int contentType = 5;
    if (a3)
    {
      uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      uint64_t v16 = objc_msgSend__animationPathForKey_(self, v14, @"color", v15);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1B6508DFC;
      v18[3] = &unk_1E6141230;
      v18[4] = self;
      v18[5] = a3;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v17, v13, (uint64_t)self, v16, v18);
    }
  }
}

- (id)floatValue
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v15 = v7;
    if (v7) {
      sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v16 = objc_msgSend_materialProperty(self, v8, v9, v10);
    if (v16)
    {
      uint64_t v24 = v16;
      uint64_t v25 = (char *)sub_1B6475E50(v16, v17, v18, v19, v20, v21, v22, v23);
      if (v25)
      {
        int v26 = sub_1B6477D14(v24);
        uint64_t v31 = 12;
        if (v26 != 4) {
          uint64_t v31 = 0;
        }
        LODWORD(v30) = *(_DWORD *)&v25[v31];
        uint64_t v25 = (char *)objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29, v30);
      }
      if (!v15) {
        return v25;
      }
    }
    else
    {
      uint64_t v25 = 0;
      if (!v15) {
        return v25;
      }
    }
    sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v25;
  }
  if (self->_contentType != 5) {
    return 0;
  }
  id v5 = self->_contents;

  return v5;
}

- (void)setAssetValue:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 6;
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = objc_msgSend_rootLayer(a3, v6, v7, v8);
        if (v9)
        {
          uint64_t v17 = v9;
          uint64_t v18 = objc_msgSend_worldRef(self, v10, v11, v12);
          objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v23, v22[0], v22[1], v22[2], v22[3], v22[4], v22[5], MEMORY[0x1E4F143A8], 3221225472, sub_1B6509074, &unk_1E6141230, self, v17);
        }
        else
        {
          sub_1B63F2F54(16, @"Error: failed to decode CALayer", v11, v12, v13, v14, v15, v16, v25);
        }
      }
      else
      {
        uint64_t v20 = objc_msgSend_worldRef(self, v6, v7, v8);
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22, MEMORY[0x1E4F143A8], 3221225472, sub_1B6509080, &unk_1E6141230, self, a3, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5]);
      }
    }
  }
}

- (id)assetValue
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v15 = v7;
    if (v7) {
      sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v16 = objc_msgSend_materialProperty(self, v8, v9, v10);
    if (v16)
    {
      uint64_t v24 = (void *)sub_1B647702C(v16, v17, v18, v19, v20, v21, v22, v23);
      if (!v15) {
        return v24;
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (!v15) {
        return v24;
      }
    }
    sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v24;
  }
  if (self->_contentType != 6) {
    return 0;
  }
  id v5 = self->_contents;

  return v5;
}

- (void)_setCFXImageRef:(__CFXImage *)a3
{
  cfxImage = self->_cfxImage;
  if (cfxImage != a3)
  {
    if (cfxImage)
    {
      CFRelease(cfxImage);
      self->_cfxImage = 0;
    }
    if (a3) {
      uint64_t v6 = (__CFXImage *)CFRetain(a3);
    }
    else {
      uint64_t v6 = 0;
    }
    self->_cfxImage = v6;
  }
}

- (void)_setupContentsFromCFXImage
{
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    if (sub_1B643B19C((uint64_t)cfxImage))
    {

      id v18 = (id)sub_1B643B1AC((uint64_t)self->_cfxImage, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:
      self->_id contents = v18;
      self->_unsigned int contentType = 1;
      return;
    }
    uint64_t v19 = sub_1B6439EF8((uint64_t)self->_cfxImage, v4, v5, v6, v7, v8, v9, v10);
    if (v19
      || (uint64_t v19 = objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, v20, (uint64_t)self->_cfxImage, v21)) != 0)
    {
      uint64_t v22 = (void *)v19;

      id v18 = v22;
      goto LABEL_7;
    }
  }
}

- (void)getCFXImageRef
{
  return self->_cfxImage;
}

- (CGImage)contentsAsCGImage
{
  result = (CGImage *)self->_contents;
  if (result)
  {
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CGImageGetTypeID()) {
      return (CGImage *)self->_contents;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (CGContext)copyBitmap
{
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    return (CGContext *)sub_1B643BBE4((uint64_t)cfxImage, 1, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    uint64_t v11 = objc_msgSend_contentsAbsoluteURL(self, a2, v2, v3);
    if (v11
      && (uint64_t v12 = v11, v13 = objc_opt_class(),
                     (uint64_t v16 = objc_msgSend_copyCFXImageFromImage_(v13, v14, v12, v15)) != 0))
    {
      uint64_t v23 = (const void *)v16;
      uint64_t v24 = (CGContext *)sub_1B643BBE4(v16, 1, v17, v18, v19, v20, v21, v22);
      CFRelease(v23);
      return v24;
    }
    else
    {
      return 0;
    }
  }
}

- (CFXColor4)color4
{
  char v16 = 0;
  uint64_t v4 = (const void *)objc_msgSend_color(self, a2, v2, v3);
  uint64_t v5 = (void *)sub_1B64BB4BC(v4);
  uint64_t v7 = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v5, v6, 0, (uint64_t)&v16);
  if (v16) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v16) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v16) {
    uint64_t v12 = HIDWORD(v7);
  }
  else {
    uint64_t v12 = 0;
  }
  if (v16) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v10 | (v11 << 32);
  uint64_t v15 = v13 | (v12 << 32);
  *(void *)&result.var0.var1.var2 = v14;
  *(void *)result.var0.var0 = v15;
  return result;
}

- (int64_t)minificationFilter
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = (int)sub_1B643DDF4(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return *((unsigned char *)self + 58) & 3;
}

- (int64_t)magnificationFilter
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = (int)sub_1B643DE40(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 58) >> 2) & 3;
}

- (int64_t)mipFilter
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = (int)sub_1B643DE8C(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 58) >> 4) & 3;
}

- (void)setMinificationFilter:(int64_t)a3
{
  char v4 = *((unsigned char *)self + 58);
  if ((v4 & 3) != a3)
  {
    *((unsigned char *)self + 58) = v4 & 0xFC | a3 & 3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6509564;
    v8[3] = &unk_1E61411E0;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (void)setMagnificationFilter:(int64_t)a3
{
  unint64_t v4 = *((unsigned __int8 *)self + 58);
  if (((v4 >> 2) & 3) != a3)
  {
    *((unsigned char *)self + 58) = v4 & 0xF3 | (4 * (a3 & 3));
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6509620;
    v8[3] = &unk_1E61411E0;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (void)setMipFilter:(int64_t)a3
{
  unint64_t v4 = *((unsigned __int8 *)self + 58);
  if (((v4 >> 4) & 3) != a3)
  {
    *((unsigned char *)self + 58) = v4 & 0xCF | (16 * (a3 & 3));
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B65096DC;
    v8[3] = &unk_1E61411E0;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)_presentationMappingChannel
{
  uint64_t v4 = objc_msgSend_materialProperty(self, a2, v2, v3);
  if (!v4) {
    return -1;
  }

  return sub_1B647650C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (int64_t)mappingChannel
{
  if ((*((unsigned char *)self + 8) & 1) == 0) {
    return self->_mappingChannel;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    int64_t v18 = objc_msgSend__presentationMappingChannel(self, v15, v16, v17);
    sub_1B64B0CB4(v14, v19, v20, v21, v22, v23, v24, v25);
    return v18;
  }
  else
  {
    return objc_msgSend__presentationMappingChannel(self, v7, v8, v9);
  }
}

- (void)setMappingChannel:(int64_t)a3
{
  if (self->_mappingChannel != a3)
  {
    self->_mappingChannel = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6509844;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)textureComponents
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = sub_1B6477B64(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 15;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return LOBYTE(self->_intensity) & 0xF;
}

- (void)setTextureComponents:(int64_t)a3
{
  char intensity_low = LOBYTE(self->_intensity);
  if ((intensity_low & 0xF) != a3)
  {
    LOBYTE(self->_intensity) = intensity_low & 0xF0 | a3 & 0xF;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B65099CC;
    v9[3] = &unk_1E61412A8;
    v9[4] = self;
    v9[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setIntensity:(float)a3
{
  if ((*((unsigned char *)self + 8) & 1) != 0 || self->_maxAnisotropy != a3)
  {
    self->_maxAnisotropy = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    uint64_t v10 = objc_msgSend__animationPathForKey_(self, v8, @"intensity", v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B6509B04;
    v12[3] = &unk_1E6141208;
    v12[4] = self;
    float v13 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v11, v7, (uint64_t)self, v10, v12);
  }
}

- (float)intensity
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      float v5 = sub_1B64763AC(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      float v5 = 0.0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return self->_maxAnisotropy;
}

- (int64_t)wrapS
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = (int)sub_1B643DD10(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 1;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return *((unsigned char *)self + 59) & 7;
}

- (void)setWrapS:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    char v5 = *((unsigned char *)self + 59);
    if ((v5 & 7) != a3)
    {
      *((unsigned char *)self + 59) = v5 & 0xF8 | a3;
      uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B6509D1C;
      v8[3] = &unk_1E61411E0;
      v8[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
    }
  }
  else
  {
    NSLog(&cfstr_InvalidWrapsVa.isa, a2, a3);
  }
}

- (int64_t)wrapT
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      int64_t v5 = (int)sub_1B643DD5C(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 1;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 59) >> 3) & 7;
}

- (void)setWrapT:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    unint64_t v5 = *((unsigned __int8 *)self + 59);
    if (((v5 >> 3) & 7) != a3)
    {
      *((unsigned char *)self + 59) = v5 & 0xC7 | (8 * (a3 & 7));
      uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B6509E78;
      v8[3] = &unk_1E61411E0;
      v8[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
    }
  }
  else
  {
    NSLog(&cfstr_InvalidWraptVa.isa, a2, a3);
  }
}

- (BOOL)isColorManaged
{
  unsigned int v4 = *((unsigned __int8 *)self + 8);
  if (v4)
  {
    unint64_t v5 = self;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_materialProperty(v5, v7, v8, v9);
    LOBYTE(v5) = sub_1B6477D1C(v15);
    if (v14) {
      sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    LODWORD(v5) = (v4 >> 2) & 1;
  }
  return (char)v5;
}

- (void)setColorManaged:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 8);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 8) = v4 & 0xFB | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B6509FB0;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (int)_textureOptions
{
  uint64_t IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, a2, 0, v2);
  if (IfNeeded)
  {
    return sub_1B64778A8(IfNeeded);
  }
  else
  {
    int propertyType = self->_propertyType;
    int v7 = (*((unsigned __int8 *)self + 8) >> 2) & 1;
    return sub_1B6477D60(propertyType, v7);
  }
}

- (void)_updateCFXImageWithContents:(id)a3
{
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    CFRelease(cfxImage);
    self->_cfxImage = 0;
  }
  char v25 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_world(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_assetPathResolver(v9, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = objc_msgSend_absoluteURLForAssetPath_(v13, v6, (uint64_t)a3, v8);
      if (v14)
      {
        uint64_t v15 = (void *)v14;

        self->_runtimeResolvedURL = v15;
        a3 = v15;
      }
    }
  }
  uint64_t v16 = objc_msgSend__textureOptions(self, v6, v7, v8);
  uint64_t v18 = objc_msgSend_copyCFXImageFromImage_textureOptions_wasCached_(VFXMaterialProperty, v17, (uint64_t)a3, v16, &v25);
  uint64_t v22 = objc_msgSend_worldRef(self, v19, v20, v21);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B650A198;
  v24[3] = &unk_1E6141230;
  v24[4] = self;
  v24[5] = v18;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v23, v22, (uint64_t)self, v24);
}

- (void)setImage:(id)a3
{
  if (self->_contents == a3)
  {
    if (a3) {
      return;
    }
    cfxImage = self->_cfxImage;
    if (!cfxImage) {
      return;
    }
    goto LABEL_3;
  }
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
LABEL_3:
    CFRetain(cfxImage);
    objc_msgSend__clearContents(self, v7, v8, v9);
    self->_id contents = a3;
    self->_unsigned int contentType = 1;
    objc_msgSend__updateCFXImageWithContents_(self, v10, (uint64_t)a3, v11);
    CFRelease(cfxImage);
    return;
  }
  objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
  self->_id contents = a3;
  self->_unsigned int contentType = 1;

  objc_msgSend__updateCFXImageWithContents_(self, v12, (uint64_t)a3, v13);
}

- (id)image
{
  cfxImage = self->_cfxImage;
  if (cfxImage && (self->_contentType != 1 || !self->_contents))
  {
    uint64_t v5 = objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, a2, (uint64_t)cfxImage, v2);
    if (v5)
    {
      uint64_t v12 = (void *)v5;
      if (self->_contentType == 2) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. the cfxImage should have been cleared when setting a layer", v6, v7, v8, v9, v10, v11, (uint64_t)"_contentType != VFXContentTypeLayer");
      }

      self->_id contents = v12;
      self->_unsigned int contentType = 1;
    }
  }
  if (self->_contentType == 1) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (id)pvrtcData
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  cfxImage = self->_cfxImage;
  if (cfxImage && sub_1B643C788((uint64_t)cfxImage) == 1)
  {
    uint64_t v15 = (void *)sub_1B643B460((uint64_t)self->_cfxImage, v6, v7, v8, v9, v10, v11, v12);
    if (!v13) {
      return v15;
    }
    goto LABEL_8;
  }
  uint64_t v15 = 0;
  if (v13) {
LABEL_8:
  }
    sub_1B64B0CB4(v13, v6, v7, v8, v9, v10, v11, v12);
  return v15;
}

- (void)setLayer:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 2;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A45C;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)layer
{
  if (self->_contentType == 2) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setAvPlayer:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 7;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A544;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)avPlayer
{
  if (self->_contentType == 7) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDevice:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 8;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A62C;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)captureDevice
{
  if (self->_contentType == 8) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDeviceOutputConsumerSource:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 9;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A714;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)captureDeviceOutputConsumerSource
{
  if (self->_contentType == 9) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setTextureProvider:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 10;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A7FC;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)textureProvider
{
  if (self->_contentType == 10) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setPrecomputedLightingEnvironment:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 11;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650A8E4;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)precomputedLightingEnvironment
{
  if (self->_contentType == 11) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)_updateMaterialUIComponent:(id)a3
{
  uint64_t v6 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
    uint64_t v10 = v6;
    if (a3)
    {
      CFTypeRef v11 = sub_1B64F9F8C(a3);
      if (v11)
      {
        uint64_t v15 = v11;
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v15 = (const void *)sub_1B6451988(0);
        char v25 = objc_alloc_init(VFXUIKitSource);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setUiView_(v25, v26, (uint64_t)a3, v27);
        }
        else {
          objc_msgSend_setUiWindow_(v25, v26, (uint64_t)a3, v27);
        }
        objc_msgSend_connectToProxy_(v25, v28, (uint64_t)v15, v29);

        sub_1B64F9FC4(v15, a3);
        uint64_t v16 = v15;
      }
      double v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
      uint64_t v38 = sub_1B6451AA4((uint64_t)v15, v31, v32, v33, v34, v35, v36, v37);
      objc_msgSend_addObserver_selector_name_object_(v30, v39, (uint64_t)self, (uint64_t)sel__layerDidChange_, @"VFXUITreeDidChange", v38);
      sub_1B6477988(v10, v15, v40, v41, v42, v43, v44, v45, v46);
      if (v16)
      {
        CFRelease(v16);
      }
    }
    else
    {
      uint64_t v17 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
      objc_msgSend_removeObserver_name_object_(v17, v18, (uint64_t)self, @"VFXUITreeDidChange", 0);
      sub_1B6477988(v10, 0, v19, v20, v21, v22, v23, v24, v48);
    }
  }
}

- (void)setUIView:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 4;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650AB74;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)UIView
{
  if (self->_contentType == 4) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setUIWindow:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 4;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650AC5C;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)setContents:(id)a3
{
  if ((*((unsigned char *)self + 8) & 1) == 0 && (id)objc_msgSend_contents(self, a2, (uint64_t)a3, v3) == a3) {
    return;
  }

  self->_runtimeResolvedURL = 0;
  uint64_t v6 = (void *)sub_1B64BB4BC(a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_setColor_(self, v7, (uint64_t)v6, v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_setLayer_(self, v14, (uint64_t)v6, v15);
  }
  else if (objc_msgSend_conformsToProtocol_(v6, v14, (uint64_t)&unk_1F108B030, v15))
  {
    objc_msgSend_setMtlTexture_(self, v16, (uint64_t)v6, v17);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_setUIView_(self, v18, (uint64_t)v6, v19);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_setUIWindow_(self, v20, (uint64_t)v6, v21);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_setFloatValue_(self, v22, (uint64_t)v6, v23);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_setAssetValue_(self, v24, (uint64_t)v6, v25);
          }
          else
          {
            NSClassFromString(&cfstr_Avplayer.isa);
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_setAvPlayer_(self, v26, (uint64_t)v6, v27);
            }
            else
            {
              NSClassFromString(&cfstr_Avcapturedevic.isa);
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend_setCaptureDevice_(self, v28, (uint64_t)v6, v29);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_msgSend_setCaptureDeviceOutputConsumerSource_(self, v30, (uint64_t)v6, v31);
                }
                else if (objc_msgSend_conformsToProtocol_(v6, v30, (uint64_t)&unk_1F108B150, v31))
                {
                  objc_msgSend_setTextureProvider_(self, v32, (uint64_t)v6, v33);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
LABEL_8:
                    objc_msgSend_setImage_(self, v9, (uint64_t)v6, v10);
                    goto LABEL_9;
                  }
                  objc_msgSend_setPrecomputedLightingEnvironment_(self, v9, (uint64_t)v6, v10);
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id parent = self->_parent;
    MEMORY[0x1F4181798](parent, sel__updateProbeStamp, v11, v12);
  }
}

+ (id)dvt_supportedTypesForPropertyContents
{
  v4[12] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = NSClassFromString(&cfstr_Avplayer.isa);
  v4[9] = NSClassFromString(&cfstr_Avcapturedevic.isa);
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v4, 12);
}

- (id)contents
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v15 = v7;
    if (v7) {
      sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, v8, 0, v10);
    uint64_t v24 = (void *)IfNeeded;
    if (IfNeeded)
    {
      uint64_t v25 = sub_1B6477464(IfNeeded, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
      if (v25)
      {
        id v33 = (id)sub_1B6451AA4(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      else
      {
        uint64_t v34 = sub_1B64761F0((uint64_t)v24, v26, v27, v28, v29, v30, v31, v32);
        if (v34)
        {
          id v33 = (id)objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, v35, v34, v37);
        }
        else
        {
          uint64_t v42 = sub_1B6475E50((uint64_t)v24, (uint64_t)v35, v36, v37, v38, v39, v40, v41);
          if (!v42)
          {
            uint64_t v24 = 0;
            if (!v15) {
              return v24;
            }
            goto LABEL_16;
          }
          id v33 = (id)sub_1B64FA080(v42, v17, v18, v19);
        }
      }
      uint64_t v24 = v33;
    }
    if (!v15) {
      return v24;
    }
LABEL_16:
    sub_1B64B0CB4(v15, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
    return v24;
  }
  id v5 = self->_contents;

  return v5;
}

- (void)_setImagePath:(id)a3 withResolvedURL:(id)a4
{
  objc_msgSend__updateCFXImageWithContents_(self, a2, (uint64_t)a4, (uint64_t)a4);
  objc_msgSend__clearContents(self, v7, v8, v9);
  self->_id contents = a3;
  self->_unsigned int contentType = 1;
  id runtimeResolvedURL = self->_runtimeResolvedURL;
  if (runtimeResolvedURL != a4)
  {

    self->_id runtimeResolvedURL = a4;
  }
}

- (float)maxAnisotropy
{
  if ((*((unsigned char *)self + 8) & 1) == 0) {
    return *(&self->_maxAnisotropy + 1);
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
  float v5 = sub_1B643DED8(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setMaxAnisotropy:(float)a3
{
  if (*(&self->_maxAnisotropy + 1) != a3)
  {
    *(&self->_maxAnisotropy + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B650B2FC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setMtlTexture:(id)a3
{
  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_id contents = a3;
    self->_unsigned int contentType = 3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B650B408;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)mtlTexture
{
  if (self->_contentType == 3) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (uint64_t)setContentsTransform:(__n128)a3
{
  uint64_t v6 = (__n128 *)a1[12];
  __n128 v24 = a4;
  __n128 v25 = a5;
  __n128 v20 = a2;
  __n128 v22 = a3;
  if (!v6
    || (uint64_t result = VFXMatrix4EqualToMatrix4(a2, a3, a4, a5, *v6, v6[1], v6[2], v6[3]),
        a2 = v20,
        a3 = v22,
        a4 = v24,
        a5 = v25,
        (result & 1) == 0))
  {
    if (VFXMatrix4IsIdentity(a2, a3, a4, a5))
    {
      uint64_t result = a1[12];
      if (!result) {
        return result;
      }
      free((void *)result);
      a1[12] = 0;
    }
    else
    {
      objc_msgSend___allocateContentTransformIfNeeded(a1, v8, v9, v10);
      uint64_t v14 = (__n128 *)a1[12];
      *uint64_t v14 = v20;
      v14[1] = v22;
      v14[2] = v24;
      v14[3] = v25;
    }
    uint64_t v15 = objc_msgSend_worldRef(a1, v11, v12, v13, *(_OWORD *)&v20, *(_OWORD *)&v22);
    uint64_t v18 = objc_msgSend__animationPathForKey_(a1, v16, @"contentsTransform", v17);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B650B56C;
    v26[3] = &unk_1E6141FF8;
    uint64_t v31 = a1;
    long long v27 = v21;
    long long v28 = v23;
    __n128 v29 = v24;
    __n128 v30 = v25;
    return objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v19, v15, (uint64_t)a1, v18, v26);
  }
  return result;
}

- (__n128)contentsTransform
{
  __n128 result = (__n128)VFXMatrix4Identity;
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 96);
    if (v6) {
      return *(__n128 *)v6;
    }
    return result;
  }
  uint64_t v7 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v16 = objc_msgSend_materialProperty((void *)a1, v8, v9, v10);
  if (!v16)
  {
    __n128 result = (__n128)VFXMatrix4Identity;
    if (!v15) {
      return result;
    }
    goto LABEL_10;
  }
  __n128 v24 = (__n128 *)sub_1B647721C(v16, v17, v18, v19, v20, v21, v22, v23);
  __n128 result = (__n128)VFXMatrix4Identity;
  if (v24) {
    __n128 result = *v24;
  }
  if (v15)
  {
LABEL_10:
    __n128 v25 = result;
    sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v25;
  }
  return result;
}

- (id)propertyName
{
  objc_msgSend_propertyType(self, a2, v2, v3);
  id result = @"diffuse";
  switch(@"diffuse")
  {
    case 0u:
      id result = @"emission";
      break;
    case 1u:
      return result;
    case 2u:
      id result = @"specular";
      break;
    case 3u:
      id result = @"reflective";
      break;
    case 4u:
      id result = @"transparent";
      break;
    case 5u:
      id result = @"multiply";
      break;
    case 6u:
      id result = @"normal";
      break;
    case 7u:
      id result = @"ambientOcclusion";
      break;
    case 8u:
      id result = @"selfIllumination";
      break;
    case 9u:
      id result = @"metalness";
      break;
    case 0xAu:
      id result = @"roughness";
      break;
    case 0xBu:
      id result = @"clearCoat";
      break;
    case 0xCu:
      id result = @"clearCoatRoughness";
      break;
    case 0xDu:
      id result = @"clearCoatNormal";
      break;
    case 0xEu:
      id result = @"subsurface";
      break;
    case 0xFu:
      id result = @"subsurfaceRadius";
      break;
    case 0x10u:
      id result = @"displacement";
      break;
    case 0x15u:
      id result = @"gobo";
      break;
    case 0x16u:
      id result = @"ies";
      break;
    case 0x17u:
      id result = @"background";
      break;
    case 0x18u:
      objc_msgSend_parent(self, v5, v6, v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id result = @"probeEnvironment";
      }
      else {
        id result = @"environment";
      }
      break;
    case 0x19u:
      id result = @"colorGrading";
      break;
    case 0x1Au:
      id result = self->_customMaterialPropertyName;
      break;
    default:
      int v9 = objc_msgSend_propertyType(self, v5, v6, v7);
      sub_1B63F2F54(16, @"Error: materialPropertyName %d not found", v10, v11, v12, v13, v14, v15, v9);
      id result = 0;
      break;
  }
  return result;
}

- (char)propertyType
{
  return self->_propertyType;
}

- (NSString)description
{
  uint64_t v5 = objc_msgSend_contents(self, a2, v2, v3);
  uint64_t v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v12 = objc_msgSend_propertyName(self, v9, v10, v11);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, v13, @"<data %p>", v14, v5);
  }
  return (NSString *)objc_msgSend_stringWithFormat_(v6, v13, @"<%@: %p | %@ contents=%@>", v14, v8, self, v12, v5);
}

+ (__CFXImage)_copyCFXImageFromImageData:(id)a3 typeID:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = a3;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend_count(a3, v18, v19, v20) == 6)
      {
        uint64_t v28 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v44 = 0u;
        do
        {
          uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(a3, v21, v28, v23, v44, v45, v46);
          uint64_t v32 = objc_msgSend_copyCFXImageFromImage_(a1, v30, v29, v31);
          *((void *)&v44 + v28) = v32;
          if (!v32) {
            sub_1B63F2F54(0, @"Warning: copyCFXImageFromImage: invalid sub-image\n", v33, v23, v34, v35, v36, v37, v44);
          }
          ++v28;
        }
        while (v28 != 6);
        uint64_t v38 = (__CFXImage *)sub_1B643A2A4((uint64_t *)&v44, (uint64_t)v21, v33, v23, v34, v35, v36, v37);
        for (uint64_t i = 0; i != 48; i += 8)
        {
          uint64_t v40 = *(const void **)((char *)&v44 + i);
          if (v40)
          {
            CFRelease(v40);
            *(void *)((char *)&v44 + i) = 0;
          }
        }
        return v38;
      }
      sub_1B63F2F54(16, @"Error: array for material property contents must have 6 elements", v22, v23, v24, v25, v26, v27, v44);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return (__CFXImage *)sub_1B643A098(a3);
      }
      if (CGImageGetTypeID() == a4)
      {
        return (__CFXImage *)sub_1B643AD04((CGImage *)a3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return (__CFXImage *)sub_1B643AE24(a3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return (__CFXImage *)sub_1B6464C54(a3, v41, v42, v43);
      }
    }
    return 0;
  }
  int v9 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v7, (uint64_t)a3, v8);
  if (objc_msgSend_scheme(v9, v10, v11, v12))
  {
    id v16 = v9;
LABEL_6:
    return (__CFXImage *)sub_1B643A054(v16);
  }

  return (__CFXImage *)sub_1B643AE68((uint64_t)a3, v13, v14, v15);
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5
{
  if (!a3) {
    return 0;
  }
  char v6 = a4;
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != sub_1B6439F58())
  {
    uint64_t v18 = (__CFXImage *)sub_1B643C53C(a3, v9, v10, v11, v12, v13, v14, v15);
    if (v18)
    {
      uint64_t v17 = v18;
      if (a5) {
        *a5 = 1;
      }
    }
    else
    {
      uint64_t v20 = objc_msgSend__copyCFXImageFromImageData_typeID_(a1, v19, (uint64_t)a3, v8);
      uint64_t v17 = (__CFXImage *)v20;
      if (v20)
      {
        if ((v6 & 2) != 0) {
          sub_1B643C038(v20);
        }
        if ((v6 & 8) != 0) {
          sub_1B643BF90((uint64_t)v17, v21, v22, v23, v24, v25, v26, v27);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          sub_1B643C59C(v17, a3, v28, v29, v30, v31, v32, v33);
        }
      }
      if (a5) {
        *a5 = 0;
      }
    }
    return v17;
  }

  return (__CFXImage *)a3;
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4
{
  return (__CFXImage *)objc_msgSend_copyCFXImageFromImage_textureOptions_wasCached_(a1, a2, (uint64_t)a3, *(uint64_t *)&a4, 0);
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3
{
  return (__CFXImage *)MEMORY[0x1F4181798](a1, sel_copyCFXImageFromImage_textureOptions_, a3, 0);
}

+ (id)_copyImageFromCFXImage:(__CFXImage *)a3
{
  CFTypeID v8 = sub_1B643AA68((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
  uint64_t v12 = objc_msgSend_initWithCGImage_(v9, v10, (uint64_t)v8, v11);
  CGImageRelease(v8);
  return v12;
}

+ (id)copyImageFromCFXImage:(__CFXImage *)a3
{
  if (sub_1B643B738((uint64_t)a3)) {
    return 0;
  }
  uint64_t v6 = sub_1B6540584();
  id v28 = (id)sub_1B65408B0(v6, a3, v7, v8, v9, v10, v11, v12);
  if (!v28)
  {
    uint64_t v5 = objc_msgSend__copyImageFromCFXImage_(a1, v13, (uint64_t)a3, v14);
    if (v5) {
      sub_1B6540954(v6, v5, a3, v23, v24, v25, v26, v27);
    }
    return v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB1818]);
    uint64_t v20 = objc_msgSend_path(v28, v16, v17, v18);
    return (id)objc_msgSend_initWithContentsOfFile_(v15, v19, v20, v21);
  }
  else
  {
    return v28;
  }
}

- (void)parentWillDie:(id)a3
{
  if (self->_parent != a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. inconsistency in VFXMaterialProperty::parentWillDie", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"parent == _parent");
  }
  self->_id parent = 0;
}

- (id)parent
{
  return self->_parent;
}

- (__CFXMaterialProperty)materialProperty
{
  return (__CFXMaterialProperty *)objc_msgSend_materialPropertyCreateIfNeeded_(self, a2, 1, v2);
}

- (__CFXCommonProfile)commonProfile
{
  if ((*((unsigned char *)self + 8) & 2) != 0) {
    return (__CFXCommonProfile *)objc_msgSend_commonProfile(self->_parent, a2, v2, v3);
  }
  else {
    return 0;
  }
}

- (__CFXTextureSampler)textureSampler
{
  id result = (__CFXTextureSampler *)objc_msgSend_materialProperty(self, a2, v2, v3);
  if (result)
  {
    return (__CFXTextureSampler *)sub_1B64765F4((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return (id)MEMORY[0x1F4181798](self->_parent, sel_copyAnimationChannelForKeyPath_property_, a3, self);
}

- (void)__CFObject
{
  return objc_msgSend___CFObject(self->_parent, a2, v2, v3);
}

- (__CFXAnimationManager)animationManager
{
  id result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return (__CFXAnimationManager *)sub_1B64B2008((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  }
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  if (!a4) {
    return 0;
  }
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v10 = objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  BOOL v16 = objc_msgSend_animation(v10, v11, v12, v13) == (void)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    uint64_t v20 = objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B6583B18(v20) & 1) == 0) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity", v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    }
    sub_1B6584118(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = (uint64_t)a4;
    if (!a4)
    {
      uint64_t v11 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, (uint64_t)a3, 0);
      uint64_t v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    uint64_t v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B650C230;
    v22[3] = &unk_1E61411B8;
    v22[4] = a3;
    v22[5] = self;
    void v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: attempt to add a null animation player on %@", 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = (uint64_t)a4;
    uint64_t v10 = (uint64_t)a3;
    if (!a4)
    {
      uint64_t v11 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, (uint64_t)a3, 0);
      uint64_t v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    }
    uint64_t v17 = objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: attempt to add a null animation on %@", 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
}

- (void)removeAllAnimations
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B650C444;
  v12[3] = &unk_1E61411E0;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B650C50C;
  v14[3] = &unk_1E6141208;
  v14[4] = self;
  float v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B650C5E8;
    v13[3] = &unk_1E6141230;
    v13[4] = self;
    void v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B650C6CC;
    v15[3] = &unk_1E6141258;
    v15[4] = self;
    v15[5] = a3;
    float v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10)) {
    return v7;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_syncObjCAnimations
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  uint64_t v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    uint64_t v25 = (uint64_t)v17;
    if ((sub_1B6583B18(v17) & 1) == 0) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. sync animations: cftype is not an entity", v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    }
    CFDictionaryRef v33 = sub_1B6583E9C(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      uint64_t v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B64FD41C(v34, (uint64_t)sub_1B64FF69C, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
  {
    sub_1B64B0CB4(v13, v18, v19, v20, v21, v22, v23, v24);
  }
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      uint64_t v9 = objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      id v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  uint64_t v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    uint64_t v13 = (void *)v9;
    uint64_t v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      uint64_t v15 = v14;
      double v19 = CACurrentMediaTime();
      sub_1B6424458(v15, v13, a4, v7, v5, v16, v17, v18, v19);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    uint64_t v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    uint64_t v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B650CC0C;
    v29[3] = &unk_1E6141280;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B650CD68;
  v14[3] = &unk_1E6141230;
  v14[4] = self;
  void v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  uint64_t v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B650CE44;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (__CFXWorld)worldRef
{
  return (__CFXWorld *)objc_msgSend_worldRef(self->_parent, a2, v2, v3);
}

- (id)world
{
  id result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return sub_1B6583674((id *)result);
  }
  return result;
}

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, v6, 0, v8);
  if (IfNeeded)
  {
    uint64_t v22 = IfNeeded;
    uint64_t v30 = sub_1B64765F4(IfNeeded, v15, v16, v17, v18, v19, v20, v21);
    if (v30 || (uint64_t v30 = sub_1B643DF24()) != 0)
    {
      *((unsigned char *)self + 58) = *((unsigned char *)self + 58) & 0xFC | sub_1B643DDF4(v30, (uint64_t)v23, v24, v25, v26, v27, v28, v29) & 3;
      *((unsigned char *)self + 58) = (4 * (sub_1B643DE40(v30, v31, v32, v33, v34, v35, v36, v37) & 3)) | *((unsigned char *)self + 58) & 0xF3;
      *((unsigned char *)self + 58) = (16 * (sub_1B643DE8C(v30, v38, v39, v40, v41, v42, v43, v44) & 3)) | *((unsigned char *)self + 58) & 0xCF;
      *((unsigned char *)self + 59) = *((unsigned char *)self + 59) & 0xF8 | sub_1B643DD10(v30, v45, v46, v47, v48, v49, v50, v51) & 7;
      *((unsigned char *)self + 59) = (8 * (sub_1B643DD5C(v30, v52, v53, v54, v55, v56, v57, v58) & 7)) | *((unsigned char *)self + 59) & 0xC7;
      *(&self->_maxAnisotropy + 1) = sub_1B643DED8(v30, v59, v60, v61, v62, v63, v64, v65);
    }
    self->_mappingChannel = objc_msgSend__presentationMappingChannel(self, v23, v24, v25);
    LOBYTE(self->_intensity) = LOBYTE(self->_intensity) & 0xF0 | sub_1B6477B64(v22, v66, v67, v68, v69, v70, v71, v72) & 0xF;
    self->_maxAnisotropy = sub_1B64763AC(v22, v73, v74, v75, v76, v77, v78, v79);
    if (sub_1B6477D1C(v22)) {
      char v80 = 4;
    }
    else {
      char v80 = 0;
    }
    *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v80;
    if (sub_1B6477268(v22))
    {
      objc_msgSend___allocateContentTransformIfNeeded(self, v81, v82, v83);
      v91 = (_OWORD *)sub_1B647721C(v22, v84, v85, v86, v87, v88, v89, v90);
      contentTransform = self->_contentTransform;
      long long v101 = v91[2];
      long long v100 = v91[3];
      long long v102 = v91[1];
      *(_OWORD *)contentTransform = *v91;
      *((_OWORD *)contentTransform + 1) = v102;
      *((_OWORD *)contentTransform + 2) = v101;
      *((_OWORD *)contentTransform + 3) = v100;
      if (!v13) {
        return;
      }
    }
    else
    {
      free(self->_contentTransform);
      self->_contentTransform = 0;
      if (!v13) {
        return;
      }
    }
    goto LABEL_22;
  }
  *((unsigned char *)self + 58) = *((unsigned char *)self + 58) & 0xC0 | 0x2A;
  *((unsigned char *)self + 59) = *((unsigned char *)self + 59) & 0xC0 | 9;
  *(void *)&self->_maxAnisotropy = 0x7F7FFFFF3F800000;
  unsigned int propertyType = self->_propertyType;
  if (propertyType == 16) {
    char v104 = 8;
  }
  else {
    char v104 = 15;
  }
  LOBYTE(self->_intensity) = LOBYTE(self->_intensity) & 0xF0 | v104;
  if (sub_1B6477CF4(propertyType)) {
    char v105 = 4;
  }
  else {
    char v105 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v105;
  if (v13)
  {
LABEL_22:
    sub_1B64B0CB4(v13, v92, v93, v94, v95, v96, v97, v98);
  }
}

- (void)copyPropertiesFrom:(id)a3
{
  if (*((void *)a3 + 13)
    && (objc_msgSend_contents(a3, a2, (uint64_t)a3, v3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = objc_msgSend_contents(a3, a2, (uint64_t)a3, v3);
    objc_msgSend__setImagePath_withResolvedURL_(self, v7, v6, *((void *)a3 + 13));
  }
  else
  {
    uint64_t v11 = objc_msgSend_contents(a3, a2, (uint64_t)a3, v3);
    objc_msgSend_setContents_(self, v12, v11, v13);
  }
  uint64_t v14 = objc_msgSend_minificationFilter(a3, v8, v9, v10);
  objc_msgSend_setMinificationFilter_(self, v15, v14, v16);
  uint64_t v20 = objc_msgSend_magnificationFilter(a3, v17, v18, v19);
  objc_msgSend_setMagnificationFilter_(self, v21, v20, v22);
  uint64_t v26 = objc_msgSend_mipFilter(a3, v23, v24, v25);
  objc_msgSend_setMipFilter_(self, v27, v26, v28);
  objc_msgSend_contentsTransform(a3, v29, v30, v31);
  objc_msgSend_setContentsTransform_(self, v32, v33, v34);
  uint64_t v38 = objc_msgSend_wrapS(a3, v35, v36, v37);
  objc_msgSend_setWrapS_(self, v39, v38, v40);
  uint64_t v44 = objc_msgSend_wrapT(a3, v41, v42, v43);
  objc_msgSend_setWrapT_(self, v45, v44, v46);
  objc_msgSend_intensity(a3, v47, v48, v49);
  objc_msgSend_setIntensity_(self, v50, v51, v52);
  uint64_t isColorManaged = objc_msgSend_isColorManaged(a3, v53, v54, v55);
  objc_msgSend_setColorManaged_(self, v57, isColorManaged, v58);
  uint64_t v62 = objc_msgSend_mappingChannel(a3, v59, v60, v61);
  objc_msgSend_setMappingChannel_(self, v63, v62, v64);
  uint64_t v68 = objc_msgSend_textureComponents(a3, v65, v66, v67);
  objc_msgSend_setTextureComponents_(self, v69, v68, v70);

  objc_msgSend__copyAnimationsFrom_(self, v71, (uint64_t)a3, v72);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_materialPropertyWithContents_(v4, v5, 0, v6);
  id v8 = v7;
  objc_msgSend_copyPropertiesFrom_(v7, v9, (uint64_t)self, v10);
  return v7;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)presentationMaterialProperty
{
  id v2 = self;
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    uint64_t v3 = [VFXMaterialProperty alloc];
    inited = objc_msgSend_initPresentationMaterialPropertyWithModelProperty_(v3, v4, (uint64_t)v2, v5);
    return inited;
  }
  return self;
}

- (id)presentationObject
{
  return (id)((uint64_t (*)(VFXMaterialProperty *, char *))MEMORY[0x1F4181798])(self, sel_presentationMaterialProperty);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_updateMaterialFilters
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    uint64_t v14 = sub_1B64765F4(v5, v6, v7, v8, v9, v10, v11, v12);
    unsigned int v22 = *((unsigned __int8 *)self + 58);
    int v23 = v22 & 3;
    int v24 = (v22 >> 2) & 3;
    int v25 = (v22 >> 4) & 3;
    unsigned int v26 = *((unsigned __int8 *)self + 59);
    int v27 = v26 & 7;
    int v28 = (v26 >> 3) & 7;
    if (v14) {
      int v29 = sub_1B643DDA8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else {
      int v29 = 2;
    }
    sub_1B643DC50(v23, v24, v25, v27, v28, v29, *(&self->_maxAnisotropy + 1));
    uint64_t v31 = v30;
    sub_1B64766D8(v13, v30, v32, v33, v34, v35, v36, v37, v38);
    CFRelease(v31);
  }
}

- (void)_updateMaterialPropertyTransform:(uint64_t)a3
{
  uint64_t v8 = objc_msgSend_materialProperty(a1, a2, a3, a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8);
  if (v8) {
    sub_1B6477278(v8, &v15, v9, v10, v11, v12, v13, v14);
  }
}

- (void)_layerDidChange:(id)a3
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_worldRef(self, v6, v7, v8);

  objc_msgSend_postNotificationName_object_(v5, v9, @"kCFXWorldDidUpdateNotification", v10);
}

- (void)_updateMaterialMTLTexture:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    sub_1B64778E8(v5, a3, v6, v7, v8, v9, v10, v11, v13);
  }
}

- (void)_updateMaterialLayer:(id)a3
{
  uint64_t v6 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    if (a3)
    {
      float32x4_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
      objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, (uint64_t)sel__layerDidChange_, @"VFXLayerTreeDidChange", a3);
      CFTypeRef v17 = sub_1B64F9F8C(a3);
      if (v17)
      {
        sub_1B6477988(v14, v17, v18, v19, v20, v21, v22, v23, v43);
      }
      else
      {
        int v29 = (const void *)sub_1B6451988(0);
        uint64_t v30 = objc_alloc_init(VFXCoreAnimationSource);
        objc_msgSend_setLayer_(v30, v31, (uint64_t)a3, v32);
        objc_msgSend_connectToProxy_(v30, v33, (uint64_t)v29, v34);

        sub_1B64F9FC4(v29, a3);
        sub_1B6477988(v14, v29, v35, v36, v37, v38, v39, v40, v41);
        if (v29)
        {
          CFRelease(v29);
        }
      }
    }
    else
    {
      sub_1B6477988(v6, 0, v8, v9, v10, v11, v12, v13, v41);
      int v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_removeObserver_name_object_(v27, v28, (uint64_t)self, @"VFXLayerTreeDidChange", 0);
    }
  }
}

- (void)_updateMaterialAVPlayer:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (!v5) {
    return;
  }
  uint64_t v12 = v5;
  if (!a3)
  {
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  CFTypeRef v13 = sub_1B64F9F8C(a3);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v5 = v12;
LABEL_6:
    sub_1B6477988(v5, v14, v6, v7, v8, v9, v10, v11, v29);
    return;
  }
  float32x4_t v15 = (const void *)sub_1B6451988(1);
  uint64_t v16 = objc_alloc_init(VFXAVPlayerSource);
  objc_msgSend_setPlayer_(v16, v17, (uint64_t)a3, v18);
  objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

  sub_1B64F9FC4(v15, a3);
  sub_1B6477988(v12, v15, v21, v22, v23, v24, v25, v26, v27);
  if (v15)
  {
    CFRelease(v15);
  }
}

- (void)_updateMaterialCaptureDevice:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (!v5) {
    return;
  }
  uint64_t v12 = v5;
  if (!a3)
  {
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  CFTypeRef v13 = sub_1B64F9F8C(a3);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v5 = v12;
LABEL_6:
    sub_1B6477988(v5, v14, v6, v7, v8, v9, v10, v11, v29);
    return;
  }
  float32x4_t v15 = (const void *)sub_1B6451988(2);
  uint64_t v16 = objc_alloc_init(VFXCaptureDeviceSource);
  objc_msgSend_setCaptureDevice_(v16, v17, (uint64_t)a3, v18);
  objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

  sub_1B64F9FC4(v15, a3);
  sub_1B6477988(v12, v15, v21, v22, v23, v24, v25, v26, v27);
  if (v15)
  {
    CFRelease(v15);
  }
}

- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (!v5) {
    return;
  }
  uint64_t v12 = v5;
  if (!a3)
  {
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  CFTypeRef v13 = sub_1B64F9F8C(a3);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v5 = v12;
LABEL_6:
    sub_1B6477988(v5, v14, v6, v7, v8, v9, v10, v11, v26);
    return;
  }
  float32x4_t v15 = (const void *)sub_1B6451988(3);
  objc_msgSend_connectToProxy_(a3, v16, (uint64_t)v15, v17);
  sub_1B64F9FC4(v15, a3);
  sub_1B6477988(v12, v15, v18, v19, v20, v21, v22, v23, v24);
  if (v15)
  {
    CFRelease(v15);
  }
}

- (void)_updateMaterialTextureProvider:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (!v5) {
    return;
  }
  uint64_t v12 = v5;
  if (!a3)
  {
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  CFTypeRef v13 = sub_1B64F9F8C(a3);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v5 = v12;
LABEL_6:
    sub_1B6477988(v5, v14, v6, v7, v8, v9, v10, v11, v29);
    return;
  }
  float32x4_t v15 = (const void *)sub_1B6451988(0);
  uint64_t v16 = objc_alloc_init(VFXMaterialPropertyTextureProviderSource);
  objc_msgSend_setTextureProvider_(v16, v17, (uint64_t)a3, v18);
  objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

  sub_1B64F9FC4(v15, a3);
  sub_1B6477988(v12, v15, v21, v22, v23, v24, v25, v26, v27);
  if (v15)
  {
    CFRelease(v15);
  }
}

- (void)_updatePrecomputedLightingEnvironment:(id)a3
{
  uint64_t v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    sub_1B6477A70(v5, a3, v6, v7, v8, v9, v10, v11, v13);
  }
}

- (void)_updateMaterialImage:(id)a3
{
  objc_msgSend__setCFXImageRef_(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_materialProperty(self, v6, v7, v8);
  if (v9)
  {
    sub_1B64762E4(v9, a3, v10, v11, v12, v13, v14, v15, v17);
  }
}

- (void)_updateMaterialAsset:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"asset");
  }
  uint64_t v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
  {
    sub_1B647708C(v10, a3, v11, v12, v13, v14, v15, v16, v18);
  }
}

- (void)_updateMaterialNumber:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"value");
  }
  uint64_t v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
  {
    uint64_t v14 = v10;
    objc_msgSend_floatValue(a3, v11, v12, v13);
    int32x2_t v28 = v15;
    if (sub_1B6477D14(v14) == 4)
    {
      int32x4_t v22 = vdupq_lane_s32(v28, 0);
    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.i32[0] = v28.i32[0];
      int32x4_t v22 = vzip1q_s32(_Q0, _Q0);
      v22.i32[2] = v28.i32[0];
    }
    int32x4_t v29 = v22;
    sub_1B64754D0(v14, (float *)v29.i32, v16, v17, v18, v19, v20, v21);
  }
}

- (void)_updateMaterialColor:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"color");
  }
  uint64_t v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
  {
    uint64_t v11 = v10;
    unsigned int v12 = sub_1B6477D14(v10);
    uint64_t v13 = sub_1B6477D94(v12);
    v21[0] = sub_1B64FA004(a3, v13);
    v21[1] = v14;
    sub_1B64754D0(v11, (float *)v21, v15, v16, v17, v18, v19, v20);
  }
}

+ (id)captureDeviceOutputConsumer
{
  return (id)((uint64_t (*)(id, char *, void))MEMORY[0x1F4181798])(a1, sel_captureDeviceOutputConsumerWithOptions_, 0);
}

+ (id)captureDeviceOutputConsumerWithOptions:(id)a3
{
  uint64_t v4 = [VFXCaptureDeviceOutputConsumerSource alloc];
  uint64_t v7 = objc_msgSend_initWithOptions_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"contentsTransform", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_contentsTransform(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, @"linearExtendedSRGBColor", v8))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_linearExtendedSRGBColor(self, v14, v15, v16);
    return (id)objc_msgSend_valueWithVFXFloat4_(v17, v18, v19, v20);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)VFXMaterialProperty;
    return [(VFXMaterialProperty *)&v21 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"contentsTransform", (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    objc_msgSend_setContentsTransform_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"linearExtendedSRGBColor", v9))
  {
    objc_msgSend_VFXFloat4Value(a3, v13, v14, v15);
    MEMORY[0x1F4181798](self, sel_setLinearExtendedSRGBColor_, v16, v17);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VFXMaterialProperty;
    [(VFXMaterialProperty *)&v18 setValue:a3 forKey:a4];
  }
}

- (void)_customEncodingOfVFXMaterialProperty:(id)a3
{
  contentTransform = self->_contentTransform;
  if (contentTransform) {
    sub_1B64FA3B8(a3, (const char *)@"contentsTransform", *(__n128 *)contentTransform, *((__n128 *)contentTransform + 1), *((__n128 *)contentTransform + 2), *((__n128 *)contentTransform + 3));
  }
  if (self->_contents)
  {
    int contentType = self->_contentType;
    if (contentType == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        sub_1B64FC890(a3, (const char *)@"imageArray", self->_contents, v8);
        goto LABEL_17;
      }
    }
    else if (contentType == 6)
    {
      objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_contents, @"asset");
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t v13 = objc_msgSend_options(a3, v10, v11, v12),
          uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"VFXWorldExportEmbedImages", v15), !objc_msgSend_BOOLValue(v16, v17, v18, v19))|| (contents = self->_runtimeResolvedURL) == 0)
    {
      id contents = self->_contents;
    }
    goto LABEL_16;
  }
  id contents = self->_contents;
  if (!contents)
  {
    cfxImage = self->_cfxImage;
    if (!cfxImage) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
  int v31 = self->_contentType;
  if (v31 == 1)
  {
LABEL_16:
    sub_1B64FC36C(a3, @"image", contents);
    goto LABEL_17;
  }
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
LABEL_36:
    sub_1B64FBD7C(a3, @"image", (uint64_t)cfxImage);
    goto LABEL_17;
  }
  if (!self->_contentType)
  {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)contents, @"color");
    int v31 = self->_contentType;
  }
  if (v31 == 5)
  {
    objc_msgSend_floatValue(self->_contents, v7, (uint64_t)contents, v9);
    objc_msgSend_encodeFloat_forKey_(a3, v33, @"float", v34);
    int v31 = self->_contentType;
  }
  if (v31 == 2)
  {
    sub_1B64FAC90(a3, (const char *)self->_contents, @"layer");
    int v31 = self->_contentType;
  }
  if (v31 == 3)
  {
    sub_1B64FAC24(a3, (uint64_t)self->_contents, @"data");
    int v31 = self->_contentType;
  }
  if (v31 == 11) {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_contents, @"precomputedLightingEnvironment");
  }
LABEL_17:
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_mappingChannel, @"mappingChannel");
  char intensity_low = LOBYTE(self->_intensity);
  if ((intensity_low & 0xF) != 0xF) {
    objc_msgSend_encodeInteger_forKey_(a3, v21, intensity_low & 0xF, @"textureComponents");
  }
  LODWORD(v23) = *((_DWORD *)&self->_maxAnisotropy + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v21, @"maxAnisotropy", v22, v23);
  objc_msgSend_encodeInteger_forKey_(a3, v25, *((unsigned char *)self + 58) & 3, @"minificationFilter");
  objc_msgSend_encodeInteger_forKey_(a3, v26, ((unint64_t)*((unsigned __int8 *)self + 58) >> 2) & 3, @"magnificationFilter");
  objc_msgSend_encodeInteger_forKey_(a3, v27, ((unint64_t)*((unsigned __int8 *)self + 58) >> 4) & 3, @"mipFilter");
  objc_msgSend_encodeInteger_forKey_(a3, v28, *((unsigned char *)self + 59) & 7, @"wrapS");
  unint64_t v30 = ((unint64_t)*((unsigned __int8 *)self + 59) >> 3) & 7;

  objc_msgSend_encodeInteger_forKey_(a3, v29, v30, @"wrapT");
}

- (void)_didDecodeVFXMaterialProperty:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (self->_customMaterialPropertyName && !self->_customMaterialProperty) {
    self->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B647541C(0, 26);
  }
  id v5 = sub_1B64FBCA0(a3, @"image");
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = objc_msgSend_valueForKey_(VFXTransaction, v6, @"VFXWorldLoadingContextKey", v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"VFXWorldLoaderAssetPathResolver", v11);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_absoluteURLForAssetPath_(v13, v14, (uint64_t)v8, v15);
        if (v16)
        {
          objc_msgSend__setImagePath_withResolvedURL_(self, v17, (uint64_t)v8, v16);
          goto LABEL_30;
        }
      }
    }
    uint64_t v20 = (void *)sub_1B64AE6F4((uint64_t)a3);
    if (v20)
    {
      double v23 = VFXResolveImageContents(v8, v20);
      if (v23)
      {
        uint64_t v24 = (uint64_t)v23;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v24 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v25, v24, v26);
        }
        objc_msgSend__setImagePath_withResolvedURL_(self, v25, (uint64_t)v8, v24);
        goto LABEL_30;
      }
    }
LABEL_29:
    objc_msgSend_setContents_(self, v21, (uint64_t)v8, v22);
    goto LABEL_30;
  }
  uint64_t v27 = objc_opt_class();
  uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, @"asset");
  if (v29
    || (uint64_t v32 = objc_opt_class(),
        (uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, @"data")) != 0))
  {
    objc_msgSend_setContents_(self, v30, v29, v31);
    goto LABEL_30;
  }
  uint64_t v34 = sub_1B64FC9D0(a3, (const char *)@"imageArray");
  if (v34)
  {
    uint64_t v8 = v34;
    uint64_t v35 = sub_1B64AE6F4((uint64_t)a3);
    if (v35)
    {
      uint64_t v36 = (void *)v35;
      uint64_t v37 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v21, 6, v22);
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v38, (uint64_t)&v116, (uint64_t)v120, 16);
      if (!v39)
      {
LABEL_28:
        objc_msgSend__updateCFXImageWithContents_(self, v40, (uint64_t)v37, v41);
        objc_msgSend__clearContents(self, v47, v48, v49);
        self->_id contents = v8;
        self->_int contentType = 1;
        goto LABEL_30;
      }
      uint64_t v42 = v39;
      uint64_t v43 = *(void *)v117;
LABEL_22:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v117 != v43) {
          objc_enumerationMutation(v8);
        }
        uint64_t v45 = VFXResolveImageContents(*(void **)(*((void *)&v116 + 1) + 8 * v44), v36);
        if (!v45) {
          break;
        }
        objc_msgSend_addObject_(v37, v21, (uint64_t)v45, v22);
        if (v42 == ++v44)
        {
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v46, (uint64_t)&v116, (uint64_t)v120, 16);
          if (v42) {
            goto LABEL_22;
          }
          goto LABEL_28;
        }
      }
    }
    goto LABEL_29;
  }
  uint64_t v79 = objc_opt_class();
  uint64_t v81 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v80, v79, @"color");
  if (v81)
  {
    objc_msgSend_setColor_(self, v82, v81, v83);
  }
  else
  {
    int v87 = pthread_main_np();
    if (!v87)
    {
      objc_msgSend_begin(MEMORY[0x1E4F39CF8], v84, v85, v86);
      objc_msgSend_activateBackground_(MEMORY[0x1E4F39CF8], v88, 1, v89);
    }
    uint64_t v90 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v91 = objc_opt_class();
    uint64_t v94 = objc_msgSend_setWithObject_(v90, v92, v91, v93);
    uint64_t v95 = sub_1B64FAD0C(a3, @"layer", v94);
    if (v95)
    {
      objc_msgSend_setLayer_(self, v96, v95, v98);
      if (!v87) {
        objc_msgSend_commit(MEMORY[0x1E4F39CF8], v18, v99, v19);
      }
    }
    else
    {
      if (!v87) {
        objc_msgSend_commit(MEMORY[0x1E4F39CF8], v96, v97, v98);
      }
      if (objc_msgSend_containsValueForKey_(a3, v96, @"float", v98))
      {
        objc_msgSend_decodeFloatForKey_(a3, v100, @"float", v101);
        uint64_t v105 = objc_msgSend_numberWithFloat_(NSNumber, v102, v103, v104);
        objc_msgSend_setFloatValue_(self, v106, v105, v107);
      }
      else if (objc_msgSend_containsValueForKey_(a3, v100, @"precomputedLightingEnvironment", v101))
      {
        v108 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v109 = objc_opt_class();
        v112 = objc_msgSend_setWithObject_(v108, v110, v109, v111);
        uint64_t v113 = sub_1B64FAD0C(a3, @"precomputedLightingEnvironment", v112);
        objc_msgSend_setPrecomputedLightingEnvironment_(self, v114, v113, v115);
      }
    }
  }
LABEL_30:
  uint64_t v50 = objc_msgSend_decodeIntegerForKey_(a3, v18, @"mappingChannel", v19);
  if (v50 != -1) {
    objc_msgSend_setMappingChannel_(self, v51, v50, v52);
  }
  if (objc_msgSend_containsValueForKey_(a3, v51, @"textureComponents", v52))
  {
    uint64_t v55 = objc_msgSend_decodeIntegerForKey_(a3, v53, @"textureComponents", v54);
    objc_msgSend_setTextureComponents_(self, v56, v55, v57);
  }
  *((unsigned char *)self + 58) = *((unsigned char *)self + 58) & 0xFC | objc_msgSend_decodeIntegerForKey_(a3, v53, @"minificationFilter", v54) & 3;
  *((unsigned char *)self + 58) = (4
                         * (objc_msgSend_decodeIntegerForKey_(a3, v58, @"magnificationFilter", v59) & 3)) | *((unsigned char *)self + 58) & 0xF3;
  *((unsigned char *)self + 58) = (16 * (objc_msgSend_decodeIntegerForKey_(a3, v60, @"mipFilter", v61) & 3)) | *((unsigned char *)self + 58) & 0xCF;
  *((unsigned char *)self + 59) = *((unsigned char *)self + 59) & 0xF8 | objc_msgSend_decodeIntegerForKey_(a3, v62, @"wrapS", v63) & 7;
  *((unsigned char *)self + 59) = (8 * (objc_msgSend_decodeIntegerForKey_(a3, v64, @"wrapT", v65) & 7)) | *((unsigned char *)self + 59) & 0xC7;
  objc_msgSend__updateMaterialFilters(self, v66, v67, v68);
  *((_DWORD *)&self->_maxAnisotropy + 1) = 2139095039;
  if (objc_msgSend_containsValueForKey_(a3, v69, @"maxAnisotropy", v70))
  {
    objc_msgSend_decodeFloatForKey_(a3, v71, @"maxAnisotropy", v72);
    if (v74 != 3.4028e38) {
      objc_msgSend_setMaxAnisotropy_(self, v71, v73, v72);
    }
  }
  if (objc_msgSend_containsValueForKey_(a3, v71, @"contentsTransform", v72))
  {
    *(void *)&double v75 = sub_1B64FA4B4(a3, (const char *)@"contentsTransform").n128_u64[0];
    objc_msgSend_setContentsTransform_(self, v76, v77, v78, v75);
  }
}

- (BOOL)_hasDefaultValues
{
  if ((*((unsigned char *)self + 8) & 2) == 0
    || self->_customMaterialPropertyName
    || objc_msgSend_count(self->_animations, a2, v2, v3)
    || self->_contentType
    || self->_mappingChannel
    || self->_maxAnisotropy != 1.0
    || (*((unsigned char *)self + 58) & 0x3F) != 0x2A
    || (*((unsigned char *)self + 59) & 0x3F) != 9)
  {
    return 0;
  }
  int v5 = LOBYTE(self->_intensity) & 0xF;
  if (v5 == 15 || (BOOL result = 0, v5 == 8) && self->_propertyType == 16)
  {
    if (!self->_contentTransform && *(&self->_maxAnisotropy + 1) == 3.4028e38)
    {
      if (!self->_contents) {
        return 1;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = (float *)sub_1B6475264(self->_propertyType);
        char v11 = 1;
        v10[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(self->_contents, v8, 1, (uint64_t)&v11);
        v10[1] = v9;
        if (v11)
        {
          if (sub_1B63C8E10((float *)v10, v7)) {
            return 1;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 8)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXMaterialProperty_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 8) >> 1) & 1, @"isCommonProfileProperty");
  id parent = self->_parent;
  if (parent) {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)parent, @"parent");
  }
  unsigned int propertyType = self->_propertyType;
  if (propertyType < 0x1B && ((0x7E1FFFFu >> propertyType) & 1) != 0)
  {
    objc_msgSend_encodeInteger_forKey_(a3, v7, qword_1B6E51C50[(char)propertyType], @"propertyType");
  }
  else
  {
    sub_1B63F2F54(16, @"Error: unknown material property type for archiving", (uint64_t)parent, v8, v9, v10, v11, v12, v27);
    objc_msgSend_encodeInteger_forKey_(a3, v15, 0, @"propertyType");
  }
  customMaterialPropertyName = self->_customMaterialPropertyName;
  if (customMaterialPropertyName) {
    objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)customMaterialPropertyName, @"customMaterialPropertyName");
  }
  *(float *)&double v18 = self->_maxAnisotropy;
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"intensity", v17, v18);
  if (objc_msgSend_materialPropertyCreateIfNeeded_(self, v20, 0, v21))
  {
    uint64_t isColorManaged = objc_msgSend_isColorManaged(self, v22, v23, v24);
    objc_msgSend_encodeBool_forKey_(a3, v26, isColorManaged, @"isColorManaged");
  }

  sub_1B64FAEBC(a3, self, v23, v24);
}

- (VFXMaterialProperty)initWithCoder:(id)a3
{
  v55[5] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)VFXMaterialProperty;
  uint64_t v7 = [(VFXMaterialProperty *)&v54 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *((unsigned char *)v7 + 8) |= 8u;
    unint64_t v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"propertyType", v12);
    if (v13 < 0x19 && ((0x17FFFFDu >> v13) & 1) != 0)
    {
      char v20 = byte_1B6E51D28[v13];
    }
    else
    {
      sub_1B63F2F54(16, @"Error: unknown archived material property type", v14, v15, v16, v17, v18, v19, (uint64_t)v54.receiver);
      char v20 = 0;
    }
    v7->_unsigned int propertyType = v20;
    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    v55[2] = objc_opt_class();
    v55[3] = objc_opt_class();
    v55[4] = objc_opt_class();
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v55, 5);
    uint64_t v26 = objc_msgSend_setWithArray_(v21, v24, v23, v25);
    uint64_t v28 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v27, v26, @"parent");
    if ((VFXMaterialProperty *)v28 == v7) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = v28;
    }
    v7->_id parent = (id)v31;
    objc_msgSend__customDecodingOfVFXMaterialProperty_(v7, v29, (uint64_t)a3, v30);
    *((unsigned char *)v7 + 8) = (2
                        * (objc_msgSend_decodeIntForKey_(a3, v32, @"isCommonProfileProperty", v33) & 1)) | *((unsigned char *)v7 + 8) & 0xFD;
    uint64_t v34 = objc_opt_class();
    v7->_customMaterialPropertyName = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v35, v34, @"customMaterialPropertyName");
    objc_msgSend_decodeFloatForKey_(a3, v36, @"intensity", v37);
    objc_msgSend_setIntensity_(v7, v38, v39, v40);
    uint64_t v41 = @"sRGB";
    if ((objc_msgSend_containsValueForKey_(a3, v42, @"sRGB", v43) & 1) != 0
      || (uint64_t v41 = @"colorManaged",
          objc_msgSend_containsValueForKey_(a3, v44, @"colorManaged", v45)))
    {
      uint64_t v46 = objc_msgSend_decodeBoolForKey_(a3, v44, (uint64_t)v41, v45);
      objc_msgSend_setColorManaged_(v7, v47, v46, v48);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FB19C(a3, v7);
    objc_msgSend__didDecodeVFXMaterialProperty_(v7, v49, (uint64_t)a3, v50);
    *((unsigned char *)v7 + 8) &= ~8u;
    objc_msgSend_setImmediateMode_(VFXTransaction, v51, v8, v52);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end