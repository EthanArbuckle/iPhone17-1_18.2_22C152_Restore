@interface VFXCamera
+ (BOOL)supportsSecureCoding;
+ (VFXCamera)cameraWithCameraRef:(__CFXCamera *)a3;
+ (VFXCamera)cameraWithMDLCamera:(id)a3;
+ (id)camera;
+ (id)keyPathsForValuesAffectingFieldOfView;
+ (id)keyPathsForValuesAffectingFocalLength;
+ (id)presentationCameraWithCameraRef:(__CFXCamera *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)automaticallyAdjustsZRange;
- (BOOL)hasCustomProjectionTransform;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)rawFloat2ForKey:(id)a3 value:;
- (BOOL)usesOrthographicProjection;
- (BOOL)wantsHDR;
- (CGAffineTransform)postProjectionTransform;
- (NSArray)animationKeys;
- (NSString)description;
- (NSString)name;
- (VFXCamera)init;
- (VFXCamera)initWithCameraRef:(__CFXCamera *)a3;
- (VFXCamera)initWithCoder:(id)a3;
- (VFXCameraEffectBloom)bloom;
- (VFXCameraEffectColorFringe)colorFringe;
- (VFXCameraEffectColorGrading)colorGrading;
- (VFXCameraEffectDepthOfField)depthOfField;
- (VFXCameraEffectExposure)exposure;
- (VFXCameraEffectGrain)grain;
- (VFXCameraEffectMotionBlur)motionBlur;
- (VFXCameraEffectToneMapping)toneMapping;
- (VFXCameraEffectVignetting)vignetting;
- (__CFXAnimationManager)animationManager;
- (__CFXCamera)cameraRef;
- (__CFXWorld)worldRef;
- (__n128)projectionTransformWithViewportSize:(uint64_t)a3;
- (double)filmOffset;
- (float)fieldOfView;
- (float)focalLength;
- (float)focusDistance;
- (float)orthographicScale;
- (float)sensorHeight;
- (float)zFar;
- (float)zNear;
- (id)_valueForSimdVectorKeyPath:(id)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)chromaticTransform;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)doughnutBokeh;
- (id)identifier;
- (id)initPresentationCameraWithCameraRef:(__CFXCamera *)a3;
- (id)lensBlur;
- (id)presentationCamera;
- (id)ssao;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)world;
- (int64_t)fillMode;
- (int64_t)projectionDirection;
- (uint64_t)projectionTransform;
- (uint64_t)setProjectionTransform:(uint64_t)a3;
- (unint64_t)categoryBitMask;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customEncodingOfVFXCamera:(id)a3;
- (void)_didDecodeVFXCamera:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateFieldOfView;
- (void)_updateFocalLength;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setAutomaticallyAdjustsZRange:(BOOL)a3;
- (void)setBloom:(id)a3;
- (void)setCategoryBitMask:(unint64_t)a3;
- (void)setChromaticTransform:(id)a3;
- (void)setColorFringe:(id)a3;
- (void)setColorGrading:(id)a3;
- (void)setDepthOfField:(id)a3;
- (void)setDoughnutBokeh:(id)a3;
- (void)setExposure:(id)a3;
- (void)setFieldOfView:(float)a3;
- (void)setFillMode:(int64_t)a3;
- (void)setFilmOffset:(VFXCamera *)self;
- (void)setFocalLength:(float)a3;
- (void)setFocusDistance:(float)a3;
- (void)setGrain:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLensBlur:(id)a3;
- (void)setMotionBlur:(id)a3;
- (void)setName:(id)a3;
- (void)setOrthographicScale:(float)a3;
- (void)setPostProjectionTransform:(CGAffineTransform *)a3;
- (void)setPostProjectionTransformScale:(VFXCamera *)self;
- (void)setPostProjectionTransformTranslation:(VFXCamera *)self;
- (void)setProjectionDirection:(int64_t)a3;
- (void)setSensorHeight:(float)a3;
- (void)setSsao:(id)a3;
- (void)setToneMapping:(id)a3;
- (void)setUsesOrthographicProjection:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setVignetting:(id)a3;
- (void)setWantsHDR:(BOOL)a3;
- (void)setZFar:(float)a3;
- (void)setZNear:(float)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXCamera

+ (VFXCamera)cameraWithMDLCamera:(id)a3
{
  v5 = (VFXCamera *)objc_msgSend_camera(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_focalLength(a3, v6, v7, v8);
  objc_msgSend_setFocalLength_(v5, v9, v10, v11);
  objc_msgSend_sensorVerticalAperture(a3, v12, v13, v14);
  objc_msgSend_setSensorHeight_(v5, v15, v16, v17);
  objc_msgSend_focusDistance(a3, v18, v19, v20);
  objc_msgSend_setFocusDistance_(v5, v21, v22, v23);
  uint64_t v27 = objc_msgSend_depthOfField(VFXCameraEffectDepthOfField, v24, v25, v26);
  objc_msgSend_setDepthOfField_(v5, v28, v27, v29);
  v33 = objc_msgSend_depthOfField(v5, v30, v31, v32);
  objc_msgSend_setEnabled_(v33, v34, 0, v35);
  objc_msgSend_fStop(a3, v36, v37, v38);
  int v40 = v39;
  v44 = objc_msgSend_depthOfField(v5, v41, v42, v43);
  LODWORD(v45) = v40;
  objc_msgSend_setFStop_(v44, v46, v47, v48, v45);
  uint64_t v52 = objc_msgSend_apertureBladeCount(a3, v49, v50, v51);
  v56 = objc_msgSend_depthOfField(v5, v53, v54, v55);
  objc_msgSend_setApertureBladeCount_(v56, v57, v52, v58);
  objc_msgSend_nearVisibilityDistance(a3, v59, v60, v61);
  objc_msgSend_setZNear_(v5, v62, v63, v64);
  objc_msgSend_farVisibilityDistance(a3, v65, v66, v67);
  objc_msgSend_setZFar_(v5, v68, v69, v70);
  BOOL v74 = objc_msgSend_projection(a3, v71, v72, v73) == 1;
  objc_msgSend_setUsesOrthographicProjection_(v5, v75, v74, v76);
  if (objc_msgSend_focalLengthAnimation(a3, v77, v78, v79))
  {
    objc_msgSend_focalLengthAnimation(a3, v80, v81, v82);
    v83 = objc_opt_class();
    uint64_t v84 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v83, v85, v84, v86))
    {
      v87 = objc_msgSend_focalLengthAnimation(a3, v80, v81, v82);
      v91 = objc_msgSend_values(v87, v88, v89, v90);
      uint64_t v95 = objc_msgSend_count(v91, v92, v93, v94);
      v98 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v96, v95, v97);
      objc_msgSend_sensorVerticalAperture(a3, v99, v100, v101);
      if (v95)
      {
        float v106 = v105;
        for (uint64_t i = 0; i != v95; ++i)
        {
          v108 = objc_msgSend_objectAtIndex_(v91, v102, i, v104);
          objc_msgSend_floatValue(v108, v109, v110, v111);
          *(float *)&double v113 = (float)(atanf(v106 / (float)(v112 + v112)) * 360.0) / 3.1416;
          uint64_t v117 = objc_msgSend_numberWithFloat_(NSNumber, v114, v115, v116, v113);
          objc_msgSend_addObject_(v98, v118, v117, v119);
        }
      }
      v120 = objc_msgSend_animation(MEMORY[0x1E4F39BD8], v102, v103, v104);
      objc_msgSend_setKeyPath_(v120, v121, @"fieldOfView", v122);
      objc_msgSend_setValues_(v120, v123, (uint64_t)v98, v124);
      uint64_t v128 = objc_msgSend_keyTimes(v87, v125, v126, v127);
      objc_msgSend_setKeyTimes_(v120, v129, v128, v130);
      objc_msgSend_duration(v87, v131, v132, v133);
      objc_msgSend_setDuration_(v120, v134, v135, v136);
      objc_msgSend_setRemovedOnCompletion_(v120, v137, 0, v138);
      objc_msgSend_addAnimation_forKey_(v5, v139, (uint64_t)v120, 0);
    }
  }
  if (objc_msgSend_focalDistanceAnimation(a3, v80, v81, v82))
  {
    uint64_t v143 = objc_msgSend_focalDistanceAnimation(a3, v140, v141, v142);
    objc_msgSend_addAnimation_forKey_(v5, v144, v143, @"focalDistance");
  }
  if (objc_msgSend_fStopAnimation(a3, v140, v141, v142))
  {
    uint64_t v148 = objc_msgSend_fStopAnimation(a3, v145, v146, v147);
    objc_msgSend_addAnimation_forKey_(v5, v149, v148, @"fstop");
  }
  return v5;
}

- (VFXCamera)init
{
  v13.receiver = self;
  v13.super_class = (Class)VFXCamera;
  v2 = [(VFXCamera *)&v13 init];
  if (v2)
  {
    double v11 = sub_1B649A528();
    v2->_camera = (__CFXCamera *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6, v11);
  }
  return v2;
}

- (VFXCamera)initWithCameraRef:(__CFXCamera *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXCamera;
  v4 = [(VFXCamera *)&v17 init];
  if (v4)
  {
    uint64_t v5 = (__CFXCamera *)CFRetain(a3);
    v4->_camera = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationCameraWithCameraRef:(__CFXCamera *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXCamera;
  v4 = [(VFXCamera *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_camera = (__CFXCamera *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXCamera)cameraWithCameraRef:(__CFXCamera *)a3
{
  result = (VFXCamera *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithCameraRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXCamera *)v9;
  }
  return result;
}

+ (id)camera
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)dealloc
{
  camera = self->_camera;
  if (camera)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      sub_1B6583684((uint64_t)camera, 0, v2, v3, v4, v5, v6, v7);
      camera = self->_camera;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B4DA8;
    v11[3] = &unk_1E6140A18;
    v11[4] = camera;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXCamera;
  [(VFXCamera *)&v10 dealloc];
}

- (NSString)description
{
  uint64_t v5 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  objc_super v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  uint64_t v16 = v12;
  if (!v9) {
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v13, @"<%@: %p>", v15, v12, self);
  }
  uint64_t v20 = objc_msgSend_name(self, v13, v14, v15);
  return (NSString *)objc_msgSend_stringWithFormat_(v10, v17, @"<%@: %p '%@'>", v18, v16, self, v20);
}

- (void)setName:(id)a3
{
  uint64_t name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_uint64_t name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1B64B4F04;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_name;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  uint64_t v5 = (NSString *)sub_1B6583470(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);

  sub_1B65835F8(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return sub_1B6583590(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_uint64_t name = (NSString *)(id)sub_1B6583470(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v5, v6, v7);
  uint64_t v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);

  sub_1B65835F8(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (__CFXWorld)worldRef
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (__CFXWorld *)sub_1B63F4F54(v4, v5, v6, v7, v8, v9, v10, v11);
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

- (void)__CFObject
{
  return self->_camera;
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
    v22[2] = sub_1B64B5304;
    v22[3] = &unk_1E61411B8;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
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
  v12[2] = sub_1B64B5518;
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
  v14[2] = sub_1B64B55E0;
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
    v13[2] = sub_1B64B56BC;
    v13[3] = &unk_1E6141230;
    v13[4] = self;
    v13[5] = a3;
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
    v15[2] = sub_1B64B57A0;
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
    v29[2] = sub_1B64B5CE0;
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
  v14[2] = sub_1B64B5E3C;
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
  v8[2] = sub_1B64B5F18;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  self->_sensorSize = sub_1B649C638((uint64_t)self->_camera, v6, v7, v8, v9, v10, v11, v12);
  *(double *)&self->_filmOffset[4] = sub_1B649C3B0((uint64_t)self->_camera, v14, v15, v16, v17, v18, v19, v20);
  *(double *)&self->_postProjectionTransformTranslation[4] = sub_1B649C454((uint64_t)self->_camera, v21, v22, v23, v24, v25, v26, v27);
  *(double *)&self->_postProjectionTransformScale[4] = sub_1B649C4F8((uint64_t)self->_camera, v28, v29, v30, v31, v32, v33, v34);
  uint64_t v42 = sub_1B649D3DC((uint64_t)self->_camera, v35, v36, v37, v38, v39, v40, v41);
  self->_orthographicScale = sub_1B649CCB4(v42, v43, v44, v45, v46, v47, v48, v49);
  uint64_t v57 = sub_1B649D3DC((uint64_t)self->_camera, v50, v51, v52, v53, v54, v55, v56);
  self->_zFar = sub_1B649CC68(v57, v58, v59, v60, v61, v62, v63, v64);
  uint64_t v72 = sub_1B649D3DC((uint64_t)self->_camera, v65, v66, v67, v68, v69, v70, v71);
  self->_zNear = sub_1B649CC1C(v72, v73, v74, v75, v76, v77, v78, v79);
  self->_focalLength = sub_1B649C080((uint64_t)self->_camera, v80, v81, v82, v83, v84, v85, v86);
  *(float *)&self->_categoryBitMask = sub_1B649C30C((uint64_t)self->_camera, v87, v88, v89, v90, v91, v92, v93);
  LOBYTE(self[1].super.isa) = sub_1B649BF98((uint64_t)self->_camera, v94, v95, v96, v97, v98, v99, v100);
  *((unsigned char *)self + 16) = (16 * (sub_1B649C25C((uint64_t)self->_camera, v101, v102, v103, v104, v105, v106, v107) & 7)) | *((unsigned char *)self + 16) & 0x8F;
  self->_fieldOfView = sub_1B649C16C((uint64_t)self->_camera, v108, v109, v110, v111, v112, v113, v114);
  uint64_t v122 = (unsigned char *)sub_1B649D3DC((uint64_t)self->_camera, v115, v116, v117, v118, v119, v120, v121);
  if (sub_1B649CD00(v122, v123, v124, v125, v126, v127, v128, v129)) {
    char v133 = 4;
  }
  else {
    char v133 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v133;
  objc_msgSend__updateFocalLength(self, v130, v131, v132);
  objc_msgSend__syncEntityObjCModel(self, v134, v135, v136);
  if (v13)
  {
    sub_1B64B0CB4(v13, v137, v138, v139, v140, v141, v142, v143);
  }
}

- (id)presentationCamera
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (id)((uint64_t (*)(__objc2_class *, char *, void))MEMORY[0x1F4181798])(VFXCamera, sel_presentationCameraWithCameraRef_, *((void *)self + 1));
  }
  return self;
}

+ (id)presentationCameraWithCameraRef:(__CFXCamera *)a3
{
  uint64_t v4 = [VFXCamera alloc];
  inited = objc_msgSend_initPresentationCameraWithCameraRef_(v4, v5, (uint64_t)a3, v6);

  return inited;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (BOOL)hasCustomProjectionTransform
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (BOOL)automaticallyAdjustsZRange
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B649BD18((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      camera = self->_camera;
      LOBYTE(v5) = sub_1B649BD18((uint64_t)camera, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 3) & 1;
  }
  return v5;
}

- (void)setAutomaticallyAdjustsZRange:(BOOL)a3
{
  char v6 = *((unsigned char *)self + 16);
  if ((v6 & 1) != 0 || ((((v6 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v6 & 0xF7 | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B6254;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(void *)self->_anon_80;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    unint64_t v22 = sub_1B649BDD0((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camera = self->_camera;
    return sub_1B649BDD0((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || *(void *)self->_anon_80 != a3)
  {
    *(void *)self->_anon_80 = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64B639C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)orthographicScale
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_orthographicScale;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649BE6C((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camera = self->_camera;
    return sub_1B649BE6C((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setOrthographicScale:(float)a3
{
  char v7 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_orthographicScale != a3)
  {
    self->_orthographicScale = a3;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B64FC;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"orthographicScale", v10);
  }
}

- (BOOL)usesOrthographicProjection
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B649BEB8((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      camera = self->_camera;
      LOBYTE(v5) = sub_1B649BEB8((uint64_t)camera, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 2) & 1;
  }
  return v5;
}

- (void)setUsesOrthographicProjection:(BOOL)a3
{
  char v6 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v6 & 0xFD;
  if ((v6 & 1) != 0 || ((((v6 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v6 & 0xF9 | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B6664;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)wantsHDR
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (BOOL)self[1].super.isa;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    char v22 = sub_1B649BF98((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camera = self->_camera;
    return sub_1B649BF98((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setWantsHDR:(BOOL)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || LOBYTE(self[1].super.isa) != a3)
  {
    LOBYTE(self[1].super.isa) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64B67B0;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)zFar
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zFar;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649BFE8((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camera = self->_camera;
    return sub_1B649BFE8((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setZFar:(float)a3
{
  char v7 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v7 & 0xFD;
  double v8 = a3;
  if ((v7 & 1) != 0 || self->_zFar != v8)
  {
    self->_zFar = v8;
    uint64_t v9 = objc_msgSend_worldRef(self, a2, v3, v4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B6920;
    v11[3] = &unk_1E6141208;
    v11[4] = self;
    float v12 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"zFar", v11);
  }
}

- (float)zNear
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zNear;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649C034((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camera = self->_camera;
    return sub_1B649C034((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setZNear:(float)a3
{
  float v9 = a3;
  char v11 = *((unsigned char *)self + 16);
  char v12 = v11 & 0xFD;
  *((unsigned char *)self + 16) = v11 & 0xFD;
  int v13 = v11 & 4;
  if (a3 == 0.0 && v13 == 0)
  {
    sub_1B63F2F54(0, @"Warning: %@: zNear of 0 is not allowed", v3, v4, v5, v6, v7, v8, (uint64_t)self);
    char v12 = *((unsigned char *)self + 16);
    float v9 = 0.0001;
  }
  double v15 = v9;
  if ((v12 & 1) != 0 || self->_zNear != v15)
  {
    self->_zNear = v15;
    uint64_t v16 = objc_msgSend_worldRef(self, a2, v3, v4);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B64B6AC0;
    v18[3] = &unk_1E6141208;
    v18[4] = self;
    float v19 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, @"zNear", v18);
  }
}

- (double)filmOffset
{
  if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
    return *(double *)(a1 + 88);
  }
  uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    double v22 = sub_1B649C3B0(*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t v30 = *(void *)(a1 + 8);
    return sub_1B649C3B0(v30, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setFilmOffset:(VFXCamera *)self
{
  float32x2_t v5 = v4;
  if ((*((unsigned char *)self + 16) & 1) != 0
    || (uint32x2_t v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_filmOffset[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_filmOffset[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B6C2C;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    void v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"filmOffset", v10);
  }
}

- (CGAffineTransform)postProjectionTransform
{
  float32x2_t v5 = self;
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->CGFloat a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  if (LOBYTE(self->c))
  {
    uint64_t v11 = objc_msgSend_worldRef(self, a3, v3, v4);
    uint64_t v19 = v11;
    if (v11) {
      sub_1B64B0C28(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    double v35 = sub_1B649C454(*(void *)&v5->b, v12, v13, v14, v15, v16, v17, v18);
    double v34 = sub_1B649C4F8(*(void *)&v5->b, v20, v21, v22, v23, v24, v25, v26);
    retstr->ty = *((float *)&v35 + 1);
    retstr->CGFloat a = *(float *)&v34;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&v34, *(int8x8_t *)&v35, 4uLL));
    if (v19)
    {
      return (CGAffineTransform *)sub_1B64B0CB4(v19, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  else
  {
    CGFloat a = self[2].a;
    CGFloat b = self[2].b;
    retstr->ty = *((float *)&a + 1);
    retstr->CGFloat a = *(float *)&b;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&b, *(int8x8_t *)&a, 4uLL));
  }
  return self;
}

- (void)setPostProjectionTransform:(CGAffineTransform *)a3
{
  v5.f64[0] = a3->a;
  v5.f64[1] = a3->d;
  float32x2_t v6 = vcvt_f32_f64(*(float64x2_t *)&a3->tx);
  char v7 = *((unsigned char *)self + 16);
  if ((v7 & 1) != 0
    || (uint32x2_t v8 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v6)),
        (vpmax_u32(v8, v8).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v6;
    uint64_t v9 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3, *(_OWORD *)&v5);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1B64B6EC0;
    v17[3] = &unk_1E61412A8;
    v17[4] = self;
    v17[5] = v6;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"postProjectionTransformTranslation", v17);
    float64x2_t v5 = v15;
    char v7 = *((unsigned char *)self + 16);
  }
  float32x2_t v11 = vcvt_f32_f64(v5);
  if ((v7 & 1) != 0
    || (uint32x2_t v12 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v11)),
        (vpmax_u32(v12, v12).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformScale[4] = v11;
    uint64_t v13 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B64B6ED4;
    v16[3] = &unk_1E61412A8;
    v16[4] = self;
    v16[5] = v11;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, @"postProjectionTransformScale", v16);
  }
}

- (void)setPostProjectionTransformTranslation:(VFXCamera *)self
{
  float32x2_t v5 = v4;
  if ((*((unsigned char *)self + 16) & 1) != 0
    || (uint32x2_t v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B6FB8;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    void v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"postProjectionTransformTranslation", v10);
  }
}

- (void)setPostProjectionTransformScale:(VFXCamera *)self
{
  float32x2_t v5 = v4;
  if ((*((unsigned char *)self + 16) & 1) != 0
    || (uint32x2_t v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformScale[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64B709C;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    void v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"postProjectionTransformScale", v10);
  }
}

- (void)_updateFieldOfView
{
  float focalLength = self->_focalLength;
  if (focalLength <= 0.0)
  {
    double v5 = 3.14159274;
  }
  else
  {
    long double v4 = atan(self->_sensorSize * 0.5 / focalLength);
    *(float *)&long double v4 = v4 + v4;
    double v5 = *(float *)&v4;
  }
  float v6 = v5 / 3.14159265 * 180.0;
  self->_fieldOfView = v6;
}

- (void)_updateFocalLength
{
  float v3 = self->_fieldOfView / 180.0 * 3.14159265;
  double v4 = self->_sensorSize * 0.5;
  float v5 = v4 / tanf(v3 * 0.5);
  self->_float focalLength = v5;
}

+ (id)keyPathsForValuesAffectingFieldOfView
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"focalLength", v2, @"sensorHeight", 0);
}

+ (id)keyPathsForValuesAffectingFocalLength
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"fieldOfView", v2, 0);
}

- (float)fieldOfView
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_fieldOfView;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649C16C((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camerCGFloat a = self->_camera;
    return sub_1B649C16C((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setFieldOfView:(float)a3
{
  char v7 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_fieldOfView != a3)
  {
    self->_fieldOfView = a3;
    objc_msgSend__updateFocalLength(self, a2, v3, v4);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B64B7378;
    v13[3] = &unk_1E6141208;
    v13[4] = self;
    float v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, @"fieldOfView", v13);
  }
}

- (float)sensorHeight
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_sensorSize;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649C638((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camerCGFloat a = self->_camera;
    return sub_1B649C638((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSensorHeight:(float)a3
{
  char v7 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_sensorSize != a3)
  {
    self->_sensorSize = a3;
    objc_msgSend__updateFieldOfView(self, a2, v3, v4);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B64B74E8;
    v13[3] = &unk_1E6141208;
    v13[4] = self;
    float v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, @"sensorHeight", v13);
  }
}

- (float)focalLength
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_focalLength;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649C080((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camerCGFloat a = self->_camera;
    return sub_1B649C080((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setFocalLength:(float)a3
{
  char v7 = *((unsigned char *)self + 16);
  *((unsigned char *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_focalLength != a3)
  {
    self->_float focalLength = a3;
    objc_msgSend__updateFieldOfView(self, a2, v3, v4);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B64B7658;
    v13[3] = &unk_1E6141208;
    v13[4] = self;
    float v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, @"focalLength", v13);
  }
}

- (float)focusDistance
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(float *)&self->_categoryBitMask;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649C30C((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    camerCGFloat a = self->_camera;
    return sub_1B649C30C((uint64_t)camera, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setFocusDistance:(float)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || *(float *)&self->_categoryBitMask != a3)
  {
    *(float *)&self->_categoryBitMask = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64B77B8;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"focusDistance", v9);
  }
}

- (int64_t)fillMode
{
  unint64_t v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) == 0) {
    return (v4 >> 4) & 7;
  }
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v7) {
    return (int)sub_1B649C25C((uint64_t)self->_camera, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = v7;
  sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
  int64_t v5 = (int)sub_1B649C25C((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
  sub_1B64B0CB4(v15, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setFillMode:(int64_t)a3
{
  unint64_t v6 = *((unsigned __int8 *)self + 16);
  if ((v6 & 1) != 0 || ((v6 >> 4) & 7) != a3)
  {
    *((unsigned char *)self + 16) = v6 & 0x8F | (16 * (a3 & 7));
    uint64_t v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64B78F8;
    v9[3] = &unk_1E61412A8;
    v9[4] = self;
    void v9[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (int64_t)projectionDirection
{
  return objc_msgSend_fillMode(self, a2, v2, v3) != 2;
}

- (void)setProjectionDirection:(int64_t)a3
{
  if (a3 == 1) {
    objc_msgSend_setFillMode_(self, a2, 3, v3);
  }
  else {
    objc_msgSend_setFillMode_(self, a2, 2, v3);
  }
}

- (__CFXCamera)cameraRef
{
  return self->_camera;
}

- (uint64_t)setProjectionTransform:(uint64_t)a3
{
  unsigned __int8 v9 = a1[1].n128_u8[0];
  a1[1].n128_u8[0] = v9 | 2;
  __n128 v17 = a7;
  __n128 v19 = a8;
  __n128 v13 = a5;
  __n128 v15 = a6;
  if ((v9 & 2) == 0
    || (uint64_t result = VFXMatrix4EqualToMatrix4(a5, a6, a7, a8, a1[8], a1[9], a1[10], a1[11]),
        a5 = v13,
        a6 = v15,
        a7 = v17,
        a8 = v19,
        (result & 1) == 0))
  {
    a1[8] = a5;
    a1[9] = a6;
    a1[10] = a7;
    a1[11] = a8;
    uint64_t v11 = objc_msgSend_worldRef(a1, a2, a3, a4, *(_OWORD *)&v13, *(_OWORD *)&v15, *(_OWORD *)&v17, *(_OWORD *)&v19);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1B64B7A38;
    v21[3] = &unk_1E6141FF8;
    uint64_t v26 = a1;
    long long v22 = v14;
    long long v23 = v16;
    long long v24 = v18;
    long long v25 = v20;
    return objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)a1, @"projectionTransform", v21);
  }
  return result;
}

- (uint64_t)projectionTransform
{
  return objc_msgSend_projectionTransformWithViewportSize_(a1, a2, a3, a4, 1.0, 1.0);
}

- (__n128)projectionTransformWithViewportSize:(uint64_t)a3
{
  unsigned int v11 = *(unsigned __int8 *)(a1 + 16);
  if (v11)
  {
    unint64_t v43 = *(void *)&a9.f64[0];
    uint64_t v15 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    uint64_t v23 = v15;
    if (v15) {
      sub_1B64B0C28(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    *(void *)&v24.f64[0] = v43;
    v24.f64[1] = a10;
    float32x4_t v45 = vcvt_hight_f32_f64(0, v24);
    long long v25 = (unsigned __int8 *)sub_1B649D3DC(*(void *)(a1 + 8), v16, v17, v18, v19, v20, v21, v22);
    uint64_t v32 = sub_1B649CD50(v25, (uint64_t)&v45, v26, v27, v28, v29, v30, v31);
    uint64_t v40 = (__n128 *)&VFXMatrix4Identity;
    if (v32) {
      uint64_t v40 = (__n128 *)v32;
    }
    __n128 result = *v40;
    if (v23)
    {
      __n128 v41 = *v40;
      sub_1B64B0CB4(v23, v33, v34, v35, v36, v37, v38, v39);
      return v41;
    }
  }
  else if ((v11 & 2) != 0)
  {
    return *(__n128 *)(a1 + 128);
  }
  else
  {
    float32x4_t v45 = 0u;
    long long v46 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    v45.i8[0] = (v11 >> 1) & 0x38 | ((v11 & 4) != 0);
    *(float32x2_t *)&v45.i32[1] = vcvt_f32_f64(*(float64x2_t *)(a1 + 56));
    int v12 = *(_DWORD *)(a1 + 72);
    DWORD2(v47) = *(_DWORD *)(a1 + 48);
    HIDWORD(v47) = v12;
    uint64_t v13 = *(void *)(a1 + 96);
    *(void *)&long long v46 = *(void *)(a1 + 88);
    *((void *)&v46 + 1) = v13;
    *(void *)&long long v47 = *(void *)(a1 + 104);
    a9.f64[1] = a10;
    float32x4_t v44 = vcvt_hight_f32_f64(0, a9);
    return *(__n128 *)sub_1B649CD50((unsigned __int8 *)&v45, (uint64_t)&v44, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

- (VFXCameraEffectMotionBlur)motionBlur
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectMotionBlur *)self->_grain;
  }
  __n128 result = (VFXCameraEffectMotionBlur *)sub_1B649A798((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectMotionBlur *)MEMORY[0x1F4181798](VFXCameraEffectMotionBlur, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setMotionBlur:(id)a3
{
  grain = self->_grain;
  if (grain != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_grain = (VFXCameraEffectGrain *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B7CA8;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectDepthOfField)depthOfField
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectDepthOfField *)self->_motionBlur;
  }
  __n128 result = (VFXCameraEffectDepthOfField *)sub_1B649A680((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectDepthOfField *)MEMORY[0x1F4181798](VFXCameraEffectDepthOfField, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setDepthOfField:(id)a3
{
  motionBlur = self->_motionBlur;
  if (motionBlur != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_motionBlur = (VFXCameraEffectMotionBlur *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B7DFC;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectGrain)grain
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectGrain *)self->_exposure;
  }
  __n128 result = (VFXCameraEffectGrain *)sub_1B649A8B0((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectGrain *)MEMORY[0x1F4181798](VFXCameraEffectGrain, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setGrain:(id)a3
{
  exposure = self->_exposure;
  if (exposure != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_exposure = (VFXCameraEffectExposure *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B7F50;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectExposure)exposure
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectExposure *)self->_toneMapping;
  }
  __n128 result = (VFXCameraEffectExposure *)sub_1B649A9C8((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectExposure *)MEMORY[0x1F4181798](VFXCameraEffectExposure, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setExposure:(id)a3
{
  toneMapping = self->_toneMapping;
  if (toneMapping != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_toneMapping = (VFXCameraEffectToneMapping *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B80A4;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectToneMapping)toneMapping
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectToneMapping *)self->_bloom;
  }
  __n128 result = (VFXCameraEffectToneMapping *)sub_1B649AAE0((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectToneMapping *)MEMORY[0x1F4181798](VFXCameraEffectToneMapping, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setToneMapping:(id)a3
{
  bloom = self->_bloom;
  if (bloom != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_bloom = (VFXCameraEffectBloom *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B81F8;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectBloom)bloom
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectBloom *)self->_colorGrading;
  }
  __n128 result = (VFXCameraEffectBloom *)sub_1B649ABF8((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectBloom *)MEMORY[0x1F4181798](VFXCameraEffectBloom, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setBloom:(id)a3
{
  colorGrading = self->_colorGrading;
  if (colorGrading != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_colorGrading = (VFXCameraEffectColorGrading *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B834C;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectVignetting)vignetting
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectVignetting *)self->_lensBlur;
  }
  __n128 result = (VFXCameraEffectVignetting *)sub_1B649AD10((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectVignetting *)MEMORY[0x1F4181798](VFXCameraEffectVignetting, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setVignetting:(id)a3
{
  lensBlur = self->_lensBlur;
  if (lensBlur != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_lensBlur = (VFXCameraEffectLensBlur *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B84A0;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)lensBlur
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_chromaticTransform;
  }
  id result = (id)sub_1B649AE28((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (id)MEMORY[0x1F4181798](VFXCameraEffectLensBlur, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setLensBlur:(id)a3
{
  chromaticTransform = self->_chromaticTransform;
  if (chromaticTransform != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_chromaticTransform = (VFXCameraEffectChromaticTransform *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B85F4;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectColorFringe)colorFringe
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectColorFringe *)self->_vignetting;
  }
  id result = (VFXCameraEffectColorFringe *)sub_1B649B058((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectColorFringe *)MEMORY[0x1F4181798](VFXCameraEffectColorFringe, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setColorFringe:(id)a3
{
  vignetting = self->_vignetting;
  if (vignetting != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_vignetting = (VFXCameraEffectVignetting *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B8748;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectColorGrading)colorGrading
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (VFXCameraEffectColorGrading *)self->_colorFringe;
  }
  id result = (VFXCameraEffectColorGrading *)sub_1B649AF40((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXCameraEffectColorGrading *)MEMORY[0x1F4181798](VFXCameraEffectColorGrading, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setColorGrading:(id)a3
{
  colorFringe = self->_colorFringe;
  if (colorFringe != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_colorFringe = (VFXCameraEffectColorFringe *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B889C;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)chromaticTransform
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_doughnutBokeh;
  }
  id result = (id)sub_1B649B170((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (id)MEMORY[0x1F4181798](VFXCameraEffectChromaticTransform, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setChromaticTransform:(id)a3
{
  doughnutBokeh = self->_doughnutBokeh;
  if (doughnutBokeh != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_doughnutBokeh = (VFXCameraEffectDoughnutBokeh *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B89F0;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)doughnutBokeh
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_ssao;
  }
  id result = (id)sub_1B649B288((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (id)MEMORY[0x1F4181798](VFXCameraEffectDoughnutBokeh, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setDoughnutBokeh:(id)a3
{
  ssao = self->_ssao;
  if (ssao != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    self->_ssao = (VFXCameraEffectSSAO *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B8B44;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)ssao
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(id *)&self->_wantsHDR;
  }
  id result = (id)sub_1B649B3A0((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (id)MEMORY[0x1F4181798](VFXCameraEffectSSAO, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  }
  return result;
}

- (void)setSsao:(id)a3
{
  id v3 = *(id *)&self->_wantsHDR;
  if (v3 != a3 && (*((unsigned char *)self + 16) & 1) == 0)
  {

    *(void *)&self->_wantsHDR = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64B8C98;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v4 = (void *)v3;
  int isEqualToString = objc_msgSend_isEqualToString_(a3, a2, @"filmOffset", v3);
  if (isEqualToString)
  {
    objc_msgSend_filmOffset(self, v6, v7, v8);
    void *v4 = v10;
  }
  return isEqualToString;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  sub_1B64F9EE8(a3, (char *)&v20, (uint64_t *)&v19, v3);
  if (qword_1E9DDAF58 != -1) {
    dispatch_once(&qword_1E9DDAF58, &unk_1F0FB5988);
  }
  if (!v19) {
    return 0;
  }
  if (!objc_msgSend_containsObject_((void *)qword_1E9DDAF50, v5, (uint64_t)v19, v6)) {
    return 0;
  }
  double v18 = 0.0;
  if (!objc_msgSend_rawFloat2ForKey_value_(self, v7, v20, (uint64_t)&v18)) {
    return 0;
  }
  if (objc_msgSend_isEqualToString_(v19, v8, @"x", v9)) {
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v18);
  }
  if (!objc_msgSend_isEqualToString_(v19, v10, @"y", v12)) {
    return 0;
  }
  LODWORD(v17) = HIDWORD(v18);
  return (id)objc_msgSend_numberWithFloat_(NSNumber, v14, v15, v16, v17);
}

- (id)valueForKeyPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, a2, (uint64_t)a3, v3);
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)VFXCamera;
    return [(VFXCamera *)&v7 valueForKeyPath:a3];
  }
  return result;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"filmOffset", v3))
  {
    uint64_t v9 = MEMORY[0x1E4F29238];
    objc_msgSend_filmOffset(self, v6, v7, v8);
    return (id)MEMORY[0x1F4181798](v9, sel_valueWithVFXFloat2_, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCamera;
    return [(VFXCamera *)&v13 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"filmOffset", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat2Value(a3, v7, v8, v9);
    objc_msgSend_setFilmOffset_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCamera;
    [(VFXCamera *)&v13 setValue:a3 forKey:a4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  uint64_t v13 = objc_msgSend_name(self, v10, v11, v12);
  objc_msgSend_setName_(v4, v14, v13, v15);
  uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_setName_(v4, v20, v19, v21);
  objc_msgSend_focusDistance(self, v22, v23, v24);
  objc_msgSend_setFocusDistance_(v4, v25, v26, v27);
  objc_msgSend_sensorHeight(self, v28, v29, v30);
  objc_msgSend_setSensorHeight_(v4, v31, v32, v33);
  objc_msgSend_fieldOfView(self, v34, v35, v36);
  objc_msgSend_setFieldOfView_(v4, v37, v38, v39);
  objc_msgSend_filmOffset(self, v40, v41, v42);
  objc_msgSend_setFilmOffset_(v4, v43, v44, v45);
  if (self)
  {
    objc_msgSend_postProjectionTransform(self, v46, v47, v48);
  }
  else
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v118 = 0u;
  }
  v117[0] = v118;
  v117[1] = v119;
  v117[2] = v120;
  objc_msgSend_setPostProjectionTransform_(v4, v46, (uint64_t)v117, v48);
  uint64_t v52 = objc_msgSend_fillMode(self, v49, v50, v51);
  objc_msgSend_setFillMode_(v4, v53, v52, v54);
  objc_msgSend_zNear(self, v55, v56, v57);
  objc_msgSend_setZNear_(v4, v58, v59, v60);
  objc_msgSend_zFar(self, v61, v62, v63);
  objc_msgSend_setZFar_(v4, v64, v65, v66);
  objc_msgSend_orthographicScale(self, v67, v68, v69);
  objc_msgSend_setOrthographicScale_(v4, v70, v71, v72);
  uint64_t v76 = objc_msgSend_automaticallyAdjustsZRange(self, v73, v74, v75);
  objc_msgSend_setAutomaticallyAdjustsZRange_(v4, v77, v76, v78);
  uint64_t v82 = objc_msgSend_usesOrthographicProjection(self, v79, v80, v81);
  objc_msgSend_setUsesOrthographicProjection_(v4, v83, v82, v84);
  uint64_t v88 = objc_msgSend_wantsHDR(self, v85, v86, v87);
  objc_msgSend_setWantsHDR_(v4, v89, v88, v90);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v91, (uint64_t)&v113, (uint64_t)v121, 16);
  if (v92)
  {
    uint64_t v96 = v92;
    uint64_t v97 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v114 != v97) {
          objc_enumerationMutation(&unk_1F103BF60);
        }
        uint64_t v99 = *(void *)(*((void *)&v113 + 1) + 8 * i);
        uint64_t v100 = objc_msgSend_valueForKey_(self, v93, v99, v95);
        if (v100)
        {
          id v102 = (id)objc_msgSend_copy(v100, v93, v101, v95);
          objc_msgSend_setValue_forKey_(v4, v103, (uint64_t)v102, v99);
        }
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v93, (uint64_t)&v113, (uint64_t)v121, 16);
    }
    while (v96);
  }
  uint64_t v104 = objc_msgSend_categoryBitMask(self, v93, v94, v95);
  objc_msgSend_setCategoryBitMask_(v4, v105, v104, v106);
  objc_msgSend__copyAnimationsFrom_(v4, v107, (uint64_t)self, v108);
  objc_msgSend_commitImmediate(VFXTransaction, v109, v110, v111);
  return v4;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customEncodingOfVFXCamera:(id)a3
{
  if ((*((unsigned char *)self + 16) & 2) != 0) {
    sub_1B64FA3B8(a3, (const char *)@"projectionTransform", *(__n128 *)&self->_anon_80[8], *(__n128 *)&self->_anon_80[24], *(__n128 *)&self->_anon_80[40], *(__n128 *)&self->_anon_80[56]);
  }
}

- (void)_didDecodeVFXCamera:(id)a3
{
  if (objc_msgSend_containsValueForKey_(a3, a2, @"projectionTransform", v3))
  {
    sub_1B64FA4B4(a3, (const char *)@"projectionTransform");
    MEMORY[0x1F4181798](self, sel_setProjectionTransform_, v6, v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 16)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXCamera_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 16) >> 2) & 1, @"usesOrthographicProjection");
  objc_msgSend_encodeInt_forKey_(a3, v7, (*((unsigned __int8 *)self + 16) >> 3) & 1, @"automaticallyAdjustsZRange");
  objc_msgSend_encodeInt_forKey_(a3, v8, (*((unsigned __int8 *)self + 16) >> 4) & 7, @"fill");
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)name, @"name");
  }
  *(float *)&double v11 = self->_fieldOfView;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"fov", v10, v11);
  *(float *)&double v13 = self->_sensorSize;
  objc_msgSend_encodeFloat_forKey_(a3, v14, @"sensorSize", v15, v13);
  uint32x2_t v18 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_filmOffset[4]));
  if ((vpmax_u32(v18, v18).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, @"filmOffsetX", v17);
    LODWORD(v19) = *(_DWORD *)self->_postProjectionTransformTranslation;
    objc_msgSend_encodeFloat_forKey_(a3, v20, @"filmOffsetY", v21, v19);
  }
  uint32x2_t v22 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4]));
  if ((vpmax_u32(v22, v22).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, @"postProjectionTransformTranslationX", v17);
    LODWORD(v23) = *(_DWORD *)self->_postProjectionTransformScale;
    objc_msgSend_encodeFloat_forKey_(a3, v24, @"postProjectionTransformTranslationY", v25, v23);
  }
  double v26 = *(double *)&self->_postProjectionTransformScale[4];
  __asm { FMOV            V1.2S, #1.0 }
  uint32x2_t v32 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v26, _D1));
  if ((vpmax_u32(v32, v32).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, @"postProjectionTransformScaleX", v17);
    *(float *)&double v33 = self->_focusDistance;
    objc_msgSend_encodeFloat_forKey_(a3, v34, @"postProjectionTransformScaleY", v35, v33);
  }
  *(float *)&double v26 = self->_orthographicScale;
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"orthographicScale", v17, v26);
  double zNear = self->_zNear;
  *(float *)&double zNear = zNear;
  objc_msgSend_encodeFloat_forKey_(a3, v37, @"zNear", v38, zNear);
  double zFar = self->_zFar;
  *(float *)&double zFar = zFar;
  objc_msgSend_encodeFloat_forKey_(a3, v40, @"zFar", v41, zFar);
  LODWORD(v42) = self->_categoryBitMask;
  objc_msgSend_encodeFloat_forKey_(a3, v43, @"focusDistance", v44, v42);
  objc_msgSend_encodeBool_forKey_(a3, v45, LOBYTE(self[1].super.isa), @"HDR");
  objc_msgSend_encodeInteger_forKey_(a3, v46, *(void *)self->_anon_80, @"categoryBitMask");
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v47, (uint64_t)&v59, (uint64_t)v63, 16);
  if (v48)
  {
    uint64_t v52 = v48;
    uint64_t v53 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(&unk_1F103BF60);
        }
        uint64_t v55 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v56 = objc_msgSend_valueForKey_(self, v49, v55, v51);
        if (v56) {
          objc_msgSend_encodeObject_forKey_(a3, v49, v56, v55);
        }
      }
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v49, (uint64_t)&v59, (uint64_t)v63, 16);
    }
    while (v52);
  }
  sub_1B64FAB54(a3, self, v50, v51);
  sub_1B64FAEBC(a3, self, v57, v58);
}

- (VFXCamera)initWithCoder:(id)a3
{
  uint64_t v457 = *MEMORY[0x1E4F143B8];
  v455.receiver = self;
  v455.super_class = (Class)VFXCamera;
  uint64_t v7 = [(VFXCamera *)&v455 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    double v19 = sub_1B649A528();
    v7->_camerCGFloat a = (__CFXCamera *)v11;
    if (v11) {
      sub_1B6583684(v11, v7, v13, v14, v15, v16, v17, v18);
    }
    objc_msgSend__syncObjCModel(v7, v12, v13, v14, v19);
    BOOL v22 = objc_msgSend_decodeIntForKey_(a3, v20, @"usesOrthographicProjection", v21) != 0;
    objc_msgSend_setUsesOrthographicProjection_(v7, v23, v22, v24);
    BOOL v27 = objc_msgSend_decodeIntForKey_(a3, v25, @"automaticallyAdjustsZRange", v26) != 0;
    objc_msgSend_setAutomaticallyAdjustsZRange_(v7, v28, v27, v29);
    if (objc_msgSend_containsValueForKey_(a3, v30, @"projectionDirection", v31))
    {
      int v34 = objc_msgSend_decodeIntForKey_(a3, v32, @"projectionDirection", v33);
      objc_msgSend_setProjectionDirection_(v7, v35, v34, v36);
    }
    else
    {
      int v37 = objc_msgSend_decodeIntForKey_(a3, v32, @"fill", v33);
      objc_msgSend_setFillMode_(v7, v38, v37, v39);
    }
    uint64_t v40 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, @"name");
    objc_msgSend_setName_(v7, v43, v42, v44);
    objc_msgSend_decodeFloatForKey_(a3, v45, @"sensorSize", v46);
    objc_msgSend_setSensorHeight_(v7, v47, v48, v49);
    objc_msgSend_decodeFloatForKey_(a3, v50, @"fov", v51);
    objc_msgSend_setFieldOfView_(v7, v52, v53, v54);
    if (objc_msgSend_containsValueForKey_(a3, v55, @"filmOffsetX", v56))
    {
      objc_msgSend_decodeFloatForKey_(a3, v57, @"filmOffsetX", v58);
      unsigned int v447 = v59;
      objc_msgSend_decodeFloatForKey_(a3, v60, @"filmOffsetY", v61);
      objc_msgSend_setFilmOffset_(v7, v62, v63, v64, COERCE_DOUBLE(__PAIR64__(v65, v447)));
    }
    else
    {
      *(void *)&v7->_filmOffset[4] = 0;
    }
    if (objc_msgSend_containsValueForKey_(a3, v57, @"postProjectionTransformTranslationX", v58))
    {
      objc_msgSend_decodeFloatForKey_(a3, v66, @"postProjectionTransformTranslationX", v67);
      unsigned int v448 = v68;
      objc_msgSend_decodeFloatForKey_(a3, v69, @"postProjectionTransformTranslationY", v70);
      objc_msgSend_setPostProjectionTransformTranslation_(v7, v71, v72, v73, COERCE_DOUBLE(__PAIR64__(v74, v448)));
    }
    else
    {
      *(void *)&v7->_postProjectionTransformTranslation[4] = 0;
    }
    if (objc_msgSend_containsValueForKey_(a3, v66, @"postProjectionTransformScaleX", v67))
    {
      objc_msgSend_decodeFloatForKey_(a3, v75, @"postProjectionTransformScaleX", v76);
      unsigned int v449 = v77;
      objc_msgSend_decodeFloatForKey_(a3, v78, @"postProjectionTransformScaleY", v79);
      objc_msgSend_setPostProjectionTransformScale_(v7, v80, v81, v82, COERCE_DOUBLE(__PAIR64__(v83, v449)));
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)&v7->_postProjectionTransformScale[4] = _D0;
    }
    objc_msgSend_decodeFloatForKey_(a3, v75, @"orthographicScale", v76);
    objc_msgSend_setOrthographicScale_(v7, v89, v90, v91);
    objc_msgSend_decodeFloatForKey_(a3, v92, @"zNear", v93);
    objc_msgSend_setZNear_(v7, v94, v95, v96);
    objc_msgSend_decodeFloatForKey_(a3, v97, @"zFar", v98);
    objc_msgSend_setZFar_(v7, v99, v100, v101);
    objc_msgSend_decodeFloatForKey_(a3, v102, @"focusDistance", v103);
    objc_msgSend_setFocusDistance_(v7, v104, v105, v106);
    uint64_t v109 = objc_msgSend_decodeIntegerForKey_(a3, v107, @"categoryBitMask", v108);
    objc_msgSend_setCategoryBitMask_(v7, v110, v109, v111);
    int v114 = objc_msgSend_containsValueForKey_(a3, v112, @"HDR", v113);
    uint64_t v117 = objc_msgSend_decodeBoolForKey_(a3, v115, @"HDR", v116);
    objc_msgSend_setWantsHDR_(v7, v118, v117, v119);
    if (v114)
    {
      long long v453 = 0u;
      long long v454 = 0u;
      long long v451 = 0u;
      long long v452 = 0u;
      uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v120, (uint64_t)&v451, (uint64_t)v456, 16);
      if (v122)
      {
        uint64_t v123 = v122;
        uint64_t v124 = *(void *)v452;
        do
        {
          for (uint64_t i = 0; i != v123; ++i)
          {
            if (*(void *)v452 != v124) {
              objc_enumerationMutation(&unk_1F103BF60);
            }
            uint64_t v126 = *(void *)(*((void *)&v451 + 1) + 8 * i);
            if (objc_msgSend_containsValueForKey_(a3, v120, v126, v121))
            {
              uint64_t v127 = objc_opt_class();
              uint64_t v129 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v128, v127, v126);
              objc_msgSend_setValue_forKey_(v7, v130, v129, v126);
            }
          }
          uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BF60, v120, (uint64_t)&v451, (uint64_t)v456, 16);
        }
        while (v123);
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v120, @"wantsHDR", v121))
    {
      uint64_t v133 = objc_msgSend_decodeBoolForKey_(a3, v131, @"wantsHDR", v132);
      objc_msgSend_setWantsHDR_(v7, v134, v133, v135);
      objc_msgSend_decodeFloatForKey_(a3, v136, @"dofIntensity", v137);
      if (v141 > 0.0)
      {
        uint64_t v142 = objc_msgSend_depthOfField(VFXCameraEffectDepthOfField, v138, v139, v140);
        objc_msgSend_setDepthOfField_(v7, v143, v142, v144);
        objc_msgSend_decodeFloatForKey_(a3, v145, @"fStop", v146);
        int v148 = v147;
        v152 = objc_msgSend_depthOfField(v7, v149, v150, v151);
        LODWORD(v153) = v148;
        objc_msgSend_setFStop_(v152, v154, v155, v156, v153);
        if (objc_msgSend_containsValueForKey_(a3, v157, @"bladeCount", v158))
        {
          uint64_t v161 = objc_msgSend_decodeIntegerForKey_(a3, v159, @"bladeCount", v160);
          v165 = objc_msgSend_depthOfField(v7, v162, v163, v164);
          objc_msgSend_setApertureBladeCount_(v165, v166, v161, v167);
        }
        if (objc_msgSend_containsValueForKey_(a3, v159, @"focalBlurSampleCount", v160))
        {
          uint64_t v168 = objc_msgSend_decodeIntegerForKey_(a3, v138, @"focalBlurSampleCount", v140);
          v172 = objc_msgSend_depthOfField(v7, v169, v170, v171);
          objc_msgSend_setFocalBlurSampleCount_(v172, v173, v168, v174);
        }
      }
      objc_msgSend_decodeFloatForKey_(a3, v138, @"exposureOffset", v140);
      if (v178 != 0.0)
      {
        float v179 = v178;
        uint64_t v180 = objc_msgSend_exposure(VFXCameraEffectExposure, v175, v176, v177);
        objc_msgSend_setExposure_(v7, v181, v180, v182);
        v186 = objc_msgSend_exposure(v7, v183, v184, v185);
        *(float *)&double v187 = v179;
        objc_msgSend_setOffset_(v186, v188, v189, v190, v187);
      }
      if (objc_msgSend_containsValueForKey_(a3, v175, @"toneMappingMode", v177))
      {
        int v194 = objc_msgSend_decodeIntegerForKey_(a3, v191, @"toneMappingMode", v192);
        if (v194)
        {
          uint64_t v195 = objc_msgSend_toneMapping(VFXCameraEffectToneMapping, v191, v193, v192);
          objc_msgSend_setToneMapping_(v7, v196, v195, v197);
          v201 = objc_msgSend_toneMapping(v7, v198, v199, v200);
          objc_msgSend_setMode_(v201, v202, v194 - 1, v203);
          objc_msgSend_decodeFloatForKey_(a3, v204, @"toneMappingToeStrength", v205);
          int v207 = v206;
          v211 = objc_msgSend_toneMapping(v7, v208, v209, v210);
          LODWORD(v212) = v207;
          objc_msgSend_setToeStrength_(v211, v213, v214, v215, v212);
          objc_msgSend_decodeFloatForKey_(a3, v216, @"toneMappingToeLength", v217);
          int v219 = v218;
          v223 = objc_msgSend_toneMapping(v7, v220, v221, v222);
          LODWORD(v224) = v219;
          objc_msgSend_setToeLength_(v223, v225, v226, v227, v224);
          objc_msgSend_decodeFloatForKey_(a3, v228, @"toneMappingShoulderStrength", v229);
          int v231 = v230;
          v235 = objc_msgSend_toneMapping(v7, v232, v233, v234);
          LODWORD(v236) = v231;
          objc_msgSend_setShoulderStrength_(v235, v237, v238, v239, v236);
          objc_msgSend_decodeFloatForKey_(a3, v240, @"toneMappingShoulderLength", v241);
          int v243 = v242;
          v247 = objc_msgSend_toneMapping(v7, v244, v245, v246);
          LODWORD(v248) = v243;
          objc_msgSend_setShoulderLength_(v247, v249, v250, v251, v248);
          objc_msgSend_decodeFloatForKey_(a3, v252, @"toneMappingShoulderAngle", v253);
          int v255 = v254;
          v259 = objc_msgSend_toneMapping(v7, v256, v257, v258);
          LODWORD(v260) = v255;
          objc_msgSend_setShoulderAngle_(v259, v261, v262, v263, v260);
          objc_msgSend_decodeFloatForKey_(a3, v264, @"toneMappingGamma", v265);
          int v267 = v266;
          v271 = objc_msgSend_toneMapping(v7, v268, v269, v270);
          LODWORD(v272) = v267;
          objc_msgSend_setGamma_(v271, v273, v274, v275, v272);
        }
      }
      objc_msgSend_decodeFloatForKey_(a3, v191, @"bloomIntensity", v192);
      if (v277 > 0.0)
      {
        float v278 = v277;
        uint64_t v279 = objc_msgSend_bloom(VFXCameraEffectBloom, v131, v276, v132);
        objc_msgSend_setBloom_(v7, v280, v279, v281);
        v285 = objc_msgSend_bloom(v7, v282, v283, v284);
        *(float *)&double v286 = v278;
        objc_msgSend_setIntensity_(v285, v287, v288, v289, v286);
        objc_msgSend_decodeFloatForKey_(a3, v290, @"bloomThreshold", v291);
        int v293 = v292;
        v297 = objc_msgSend_bloom(v7, v294, v295, v296);
        LODWORD(v298) = v293;
        objc_msgSend_setThreshold_(v297, v299, v300, v301, v298);
        if (objc_msgSend_containsValueForKey_(a3, v302, @"bloomThresholdSmoothness", v303))
        {
          objc_msgSend_decodeFloatForKey_(a3, v304, @"bloomThresholdSmoothness", v305);
          int v307 = v306;
          v311 = objc_msgSend_bloom(v7, v308, v309, v310);
          LODWORD(v312) = v307;
          objc_msgSend_setThresholdSmoothness_(v311, v313, v314, v315, v312);
        }
        if (objc_msgSend_containsValueForKey_(a3, v304, @"bloomUseHighQuality", v305))
        {
          uint64_t v318 = objc_msgSend_decodeBoolForKey_(a3, v316, @"bloomUseHighQuality", v317);
          v322 = objc_msgSend_bloom(v7, v319, v320, v321);
          objc_msgSend_setUseHighQuality_(v322, v323, v318, v324);
          double v450 = sub_1B64FA42C(a3, (const char *)@"bloomColorFilter");
          v328 = objc_msgSend_bloom(v7, v325, v326, v327);
          objc_msgSend_setColorFilter_(v328, v329, v330, v331, v450);
          objc_msgSend_decodeFloatForKey_(a3, v332, @"bloomContrast", v333);
          int v335 = v334;
          v339 = objc_msgSend_bloom(v7, v336, v337, v338);
          LODWORD(v340) = v335;
          objc_msgSend_setContrast_(v339, v341, v342, v343, v340);
          objc_msgSend_decodeFloatForKey_(a3, v344, @"bloomSaturation", v345);
          int v347 = v346;
          v351 = objc_msgSend_bloom(v7, v348, v349, v350);
          LODWORD(v352) = v347;
          objc_msgSend_setSaturation_(v351, v353, v354, v355, v352);
        }
        uint64_t v356 = objc_msgSend_decodeIntegerForKey_(a3, v316, @"bloomIteration", v317);
        v360 = objc_msgSend_bloom(v7, v357, v358, v359);
        objc_msgSend_setIterationCount_(v360, v361, v356, v362);
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v131, @"vignettingIntensity", v132))
    {
      objc_msgSend_decodeFloatForKey_(a3, v363, @"vignettingIntensity", v364);
      if (v366 > 0.0)
      {
        float v367 = v366;
        uint64_t v368 = objc_msgSend_vignetting(VFXCameraEffectVignetting, v363, v365, v364);
        objc_msgSend_setVignetting_(v7, v369, v368, v370);
        v374 = objc_msgSend_vignetting(v7, v371, v372, v373);
        *(float *)&double v375 = v367;
        objc_msgSend_setIntensity_(v374, v376, v377, v378, v375);
        if (objc_msgSend_containsValueForKey_(a3, v379, @"vignettingAnamorphic", v380))
        {
          objc_msgSend_decodeFloatForKey_(a3, v363, @"vignettingAnamorphic", v364);
          int v382 = v381;
          v386 = objc_msgSend_vignetting(v7, v383, v384, v385);
          LODWORD(v387) = v382;
          objc_msgSend_setAnamorphic_(v386, v388, v389, v390, v387);
          objc_msgSend_decodeFloatForKey_(a3, v391, @"vignettingSoftness", v392);
          int v394 = v393;
          v398 = objc_msgSend_vignetting(v7, v395, v396, v397);
          LODWORD(v399) = v394;
          objc_msgSend_setSoftness_(v398, v400, v401, v402, v399);
          objc_msgSend_decodeFloatForKey_(a3, v403, @"vignettingRadius", v404);
          int v406 = v405;
          v410 = objc_msgSend_vignetting(v7, v407, v408, v409);
          LODWORD(v411) = v406;
          objc_msgSend_setRadius_(v410, v412, v413, v414, v411);
        }
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v363, @"lensBlurRadius", v364))
    {
      objc_msgSend_decodeFloatForKey_(a3, v415, @"lensBlurRadius", v416);
      if (v420 > 0.0)
      {
        float v421 = v420;
        uint64_t v422 = objc_msgSend_lensBlur(VFXCameraEffectLensBlur, v417, v418, v419);
        objc_msgSend_setLensBlur_(v7, v423, v422, v424);
        v428 = objc_msgSend_lensBlur(v7, v425, v426, v427);
        *(float *)&double v429 = v421;
        objc_msgSend_setRadius_(v428, v430, v431, v432, v429);
        uint64_t v435 = objc_msgSend_decodeIntegerForKey_(a3, v433, @"lensBlurFilterQuality", v434);
        v439 = objc_msgSend_lensBlur(v7, v436, v437, v438);
        objc_msgSend_setFilterQuality_(v439, v440, v435, v441);
      }
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend__didDecodeVFXCamera_(v7, v442, (uint64_t)a3, v443);
    objc_msgSend_setImmediateMode_(VFXTransaction, v444, v8, v445);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObject
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_worldWithWorldRef_(VFXWorld, v6, v5, v7);
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = sub_1B64E5800;
  uint64_t v25 = sub_1B64E5810;
  uint64_t v26 = 0;
  uint64_t v12 = objc_msgSend_rootNode(v8, v9, v10, v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B64E581C;
  v20[3] = &unk_1E6142760;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend_enumerateChildNodesUsingBlock_(v12, v13, (uint64_t)v20, v14);
  uint64_t v17 = v22[5];
  if (!v17)
  {
    _Block_object_dispose(&v21, 8);
    return 0;
  }
  uint64_t v18 = objc_msgSend_debugQuickLookObjectWithPointOfView_(v8, v15, v17, v16);
  _Block_object_dispose(&v21, 8);
  return v18;
}

- (id)debugQuickLookData
{
  id v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);

  return UIImagePNGRepresentation(v4);
}

@end