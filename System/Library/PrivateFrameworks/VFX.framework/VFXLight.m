@interface VFXLight
+ (BOOL)supportsSecureCoding;
+ (VFXLight)lightWithLightRef:(__CFXLight *)a3;
+ (VFXLight)lightWithMDLLight:(id)a3;
+ (VFXLight)lightWithMDLLightProbe:(id)a3;
+ (id)light;
+ (id)presentationLightWithLightRef:(__CFXLight *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)automaticallyAdjustsShadowProjection;
- (BOOL)castsShadow;
- (BOOL)doubleSided;
- (BOOL)drawsArea;
- (BOOL)forcesBackFaceCasters;
- (BOOL)hasGobo;
- (BOOL)isBaked;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)parallaxCorrectionEnabled;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (BOOL)sampleDistributedShadowMaps;
- (BOOL)shouldBakeDirectLighting;
- (BOOL)shouldBakeIndirectLighting;
- (CGSize)shadowMapSize;
- (NSArray)animationKeys;
- (NSArray)areaPolygonVertices;
- (NSData)sphericalHarmonicsCoefficients;
- (NSString)description;
- (NSString)name;
- (VFXLight)init;
- (VFXLight)initWithCoder:(id)a3;
- (VFXLight)initWithLightRef:(__CFXLight *)a3;
- (VFXMaterialProperty)gobo;
- (VFXMaterialProperty)probeEnvironment;
- (__CFXAnimationManager)animationManager;
- (__CFXLight)lightRef;
- (__CFXWorld)worldRef;
- (double)areaExtents;
- (double)extendedLinearSRGBColor;
- (double)parallaxCenterOffset;
- (double)parallaxExtentsFactor;
- (double)probeExtents;
- (double)probeOffset;
- (float)_shadowCascadeDebugFactor;
- (float)attenuationDistance;
- (float)intensity;
- (float)maximumShadowDistance;
- (float)orthographicScale;
- (float)shadowBias;
- (float)shadowCascadeSplittingFactor;
- (float)shadowIntensity;
- (float)shadowRadius;
- (float)spotFalloffExponent;
- (float)spotInnerAngle;
- (float)spotOuterAngle;
- (float)temperature;
- (float)zFar;
- (float)zNear;
- (id)IESProfile;
- (id)_valueForSimdVectorKeyPath:(id)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)color;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)initPresentationLightWithLightRef:(__CFXLight *)a3;
- (id)presentationLight;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)world;
- (int64_t)areaType;
- (int64_t)probeType;
- (int64_t)probeUpdateType;
- (int64_t)type;
- (unint64_t)categoryBitMask;
- (unint64_t)shadowCascadeCount;
- (unint64_t)shadowSampleCount;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfVFXLight:(id)a3;
- (void)_customEncodingOfVFXLight:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_resyncObjCModelOfPerTypeParametersWithOldType:(int)a3;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateProbeStamp;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setAreaExtents:(VFXLight *)self;
- (void)setAreaPolygonVertices:(id)a3;
- (void)setAreaType:(int64_t)a3;
- (void)setAttenuationDistance:(float)a3;
- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)a3;
- (void)setBaked:(BOOL)a3;
- (void)setCastsShadow:(BOOL)a3;
- (void)setCategoryBitMask:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setDoubleSided:(BOOL)a3;
- (void)setDrawsArea:(BOOL)a3;
- (void)setExtendedLinearSRGBColor:(VFXLight *)self;
- (void)setForcesBackFaceCasters:(BOOL)a3;
- (void)setIESProfile:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIntensity:(float)a3;
- (void)setMaximumShadowDistance:(float)a3;
- (void)setName:(id)a3;
- (void)setOrthographicScale:(float)a3;
- (void)setParallaxCenterOffset:(VFXLight *)self;
- (void)setParallaxCorrectionEnabled:(BOOL)a3;
- (void)setParallaxExtentsFactor:(VFXLight *)self;
- (void)setProbeExtents:(VFXLight *)self;
- (void)setProbeOffset:(VFXLight *)self;
- (void)setProbeType:(int64_t)a3;
- (void)setProbeUpdateType:(int64_t)a3;
- (void)setSampleDistributedShadowMaps:(BOOL)a3;
- (void)setShadowBias:(float)a3;
- (void)setShadowCascadeCount:(unint64_t)a3;
- (void)setShadowCascadeSplittingFactor:(float)a3;
- (void)setShadowIntensity:(float)a3;
- (void)setShadowMapSize:(CGSize)a3;
- (void)setShadowRadius:(float)a3;
- (void)setShadowSampleCount:(unint64_t)a3;
- (void)setShouldBakeDirectLighting:(BOOL)a3;
- (void)setShouldBakeIndirectLighting:(BOOL)a3;
- (void)setSphericalHarmonicsCoefficients:(id)a3;
- (void)setSpotFalloffExponent:(float)a3;
- (void)setSpotInnerAngle:(float)a3;
- (void)setSpotOuterAngle:(float)a3;
- (void)setTemperature:(float)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setZFar:(float)a3;
- (void)setZNear:(float)a3;
- (void)set_shadowCascadeDebugFactor:(float)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXLight

+ (VFXLight)lightWithMDLLight:(id)a3
{
  v5 = (VFXLight *)objc_msgSend_light(a1, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x1E4FB1618];
    uint64_t v10 = objc_msgSend_color(a3, v6, v7, v8);
    uint64_t v13 = objc_msgSend_colorWithCGColor_(v9, v11, v10, v12);
    objc_msgSend_setColor_(v5, v14, v13, v15);
    objc_msgSend_attenuationEndDistance(a3, v16, v17, v18);
    objc_msgSend_setAttenuationDistance_(v5, v19, v20, v21);
    objc_msgSend_innerConeAngle(a3, v22, v23, v24);
    objc_msgSend_setSpotInnerAngle_(v5, v25, v26, v27);
    objc_msgSend_outerConeAngle(a3, v28, v29, v30);
    objc_msgSend_setSpotOuterAngle_(v5, v31, v32, v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v37 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x1E4FB1618], v34, v35, v36, 0.0, 0.0, 0.0, 1.0);
      objc_msgSend_setColor_(v5, v38, v37, v39);
    }
  }
  unint64_t v42 = objc_msgSend_lightType(a3, v34, v35, v36) - 1;
  if (v42 <= 3) {
    objc_msgSend_setType_(v5, v40, qword_1B6E50DD8[v42], v41);
  }
  return v5;
}

+ (VFXLight)lightWithMDLLightProbe:(id)a3
{
  v4 = (VFXLight *)objc_msgSend_light(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setType_(v4, v5, 4, v6);
  return v4;
}

- (VFXLight)init
{
  v12.receiver = self;
  v12.super_class = (Class)VFXLight;
  v2 = [(VFXLight *)&v12 init];
  if (v2)
  {
    uint64_t v3 = sub_1B6494ADC();
    v2->_light = (__CFXLight *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (VFXLight)initWithLightRef:(__CFXLight *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXLight;
  v4 = [(VFXLight *)&v17 init];
  if (v4)
  {
    uint64_t v5 = (__CFXLight *)CFRetain(a3);
    v4->_light = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationLightWithLightRef:(__CFXLight *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXLight;
  v4 = [(VFXLight *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_light = (__CFXLight *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (__CFXLight)lightRef
{
  return self->_light;
}

+ (id)light
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (VFXLight)lightWithLightRef:(__CFXLight *)a3
{
  result = (VFXLight *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithLightRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXLight *)v9;
  }
  return result;
}

- (void)dealloc
{
  light = self->_light;
  if (light)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      sub_1B6583684((uint64_t)light, 0, v2, v3, v4, v5, v6, v7);
      light = self->_light;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B64BBD60;
    v15[3] = &unk_1E6140A18;
    v15[4] = light;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v15);
  }

  objc_msgSend_parentWillDie_(self->_gobo, v10, (uint64_t)self, v11);
  objc_msgSend_parentWillDie_(self->_probeEnvironment, v12, (uint64_t)self, v13);

  v14.receiver = self;
  v14.super_class = (Class)VFXLight;
  [(VFXLight *)&v14 dealloc];
}

- (NSString)description
{
  uint64_t v5 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  uint64_t v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v11);
  if (v9)
  {
    uint64_t v16 = objc_msgSend_name(self, v12, v13, v14);
    uint64_t v26 = objc_msgSend_type(self, v17, v18, v19);
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v20, @"<%@: %p '%@' | type=%d>", v21, v15, self, v16, v26);
  }
  else
  {
    uint64_t v25 = objc_msgSend_type(self, v12, v13, v14);
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v23, @"<%@: %p | type=%d>", v24, v15, self, v25);
  }
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
      v15[2] = sub_1B64BBED0;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      void v15[5] = a3;
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

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  self->_type = (int)sub_1B6496680((uint64_t)self->_light, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = sub_1B649553C((uint64_t)self->_light, v14, v15, v16, v17, v18, v19, v20);

  self->_color = (id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v22, v21, v23);
  self->_intensity = sub_1B6495E08((uint64_t)self->_light, v24, v25, v26, v27, v28, v29, v30);
  self->_temperature = sub_1B64965C8((uint64_t)self->_light, v31, v32, v33, v34, v35, v36, v37);
  self->_shadowIntensity = sub_1B6495588((uint64_t)self->_light, v38, v39, v40, v41, v42, v43, v44);
  if (sub_1B649535C((uint64_t)self->_light, v45, v46, v47, v48, v49, v50, v51)) {
    char v59 = 2;
  }
  else {
    char v59 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v59;
  self->_shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B649609C((uint64_t)self->_light, v52, v53, v54, v55, v56, v57, v58)));
  self->_shadowRadius = sub_1B6495408((uint64_t)self->_light, v60, v61, v62, v63, v64, v65, v66);
  self->_zNear = sub_1B6496784((uint64_t)self->_light, v67, v68, v69, v70, v71, v72, v73);
  self->_zFar = sub_1B64966CC((uint64_t)self->_light, v74, v75, v76, v77, v78, v79, v80);
  self->_shadowBias = sub_1B6495FE4((uint64_t)self->_light, v81, v82, v83, v84, v85, v86, v87);
  self->_spotInnerAngle = sub_1B6495B40((uint64_t)self->_light, v88, v89, v90, v91, v92, v93, v94);
  self->_spotOuterAngle = sub_1B649644C((uint64_t)self->_light, v95, v96, v97, v98, v99, v100, v101);
  self->_spotFalloffExponent = sub_1B6495918((uint64_t)self->_light, v102, v103, v104, v105, v106, v107, v108);
  *(&self->_spotFalloffExponent + 1) = sub_1B6496364((uint64_t)self->_light, v109, v110, v111, v112, v113, v114, v115);

  v122 = (VFXMaterialProperty *)sub_1B6494EB8((uint64_t)self->_light, 0, v116, v117, v118, v119, v120, v121);
  if (v122)
  {
    v129 = [VFXMaterialProperty alloc];
    v122 = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v129, v130, (uint64_t)self, 21);
  }
  self->_gobo = v122;
  float32x4_t v271 = 0u;
  long long v272 = 0u;
  long long v270 = 0u;
  sub_1B6497104((uint64_t)self->_light, v123, v124, v125, v126, v127, v128, (uint64_t)&v270);
  self->_areaType = v270;
  long long v131 = v270;
  *(float32x4_t *)self->_areaExtents = vaddq_f32(v271, v271);
  v269[0] = v131;
  v269[1] = v271;
  v269[2] = v272;
  self->_areaPolygonVertices = (NSArray *)sub_1B64BC388((uint64_t)v269, v132, v133, v134);
  self->_drawsArea = sub_1B6496EF8((uint64_t)self->_light, v135, v136, v137, v138, v139, v140, v141);
  self->_doubleSided = sub_1B64970A0((uint64_t)self->_light, v142, v143, v144, v145, v146, v147, v148);
  self->_categoryBitMask = sub_1B6495D3C((uint64_t)self->_light, v149, v150, v151, v152, v153, v154, v155);
  self->_orthographicScale = sub_1B6495F2C((uint64_t)self->_light, v156, v157, v158, v159, v160, v161, v162);
  self->_shadowSampleCount = sub_1B6496270((uint64_t)self->_light, v163, v164, v165, v166, v167, v168, v169);
  if (sub_1B64984F0((uint64_t)self->_light, v170, v171, v172, v173, v174, v175, v176)) {
    char v177 = 32;
  }
  else {
    char v177 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xDF | v177;
  self->_maximumShadowDistance = sub_1B64986EC((uint64_t)self->_light);
  self->_shadowCascadeCount = sub_1B64954A8((uint64_t)self->_light, v178, v179, v180, v181, v182, v183, v184);
  self->_shadowCascadeSplittingFactor = sub_1B649874C((uint64_t)self->_light, v185, v186, v187, v188, v189, v190, v191);
  if (sub_1B6498A28((uint64_t)self->_light, v192, v193, v194, v195, v196, v197, v198)) {
    char v199 = 64;
  }
  else {
    char v199 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xBF | v199;
  if (sub_1B6498AE0((uint64_t)self->_light)) {
    char v200 = 0x80;
  }
  else {
    char v200 = 0;
  }
  *((unsigned char *)self + 16) = v200 & 0x80 | *((unsigned char *)self + 16) & 0x7F;

  v207 = (VFXMaterialProperty *)sub_1B6494F20((uint64_t)self->_light, 0, v201, v202, v203, v204, v205, v206);
  if (v207)
  {
    v215 = [VFXMaterialProperty alloc];
    v207 = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v215, v216, (uint64_t)self, 24);
  }
  self->_probeEnvironment = v207;
  self->_probeType = sub_1B64975FC((uint64_t)self->_light, v208, v209, v210, v211, v212, v213, v214);
  self->_probeUpdateType = sub_1B64977A4((uint64_t)self->_light, v217, v218, v219, v220, v221, v222, v223);
  self->_parallaxCorrectionEnabled = sub_1B6497860((uint64_t)self->_light, v224, v225, v226, v227, v228, v229, v230);
  *(__n128 *)&self->_probeExtents[7] = sub_1B6497AB4((__n128 *)self->_light, v231, v232, v233, v234, v235, v236, v237);
  *(__n128 *)&self->_probeOffset[7] = sub_1B6497B74((__n128 *)self->_light, v238, v239, v240, v241, v242, v243, v244);
  *(__n128 *)&self->_parallaxExtentsFactor[7] = sub_1B64979E4((__n128 *)self->_light, v245, v246, v247, v248, v249, v250, v251);
  *(__n128 *)&self->_parallaxCenterOffset[7] = sub_1B6497928((__n128 *)self->_light, v252, v253, v254, v255, v256, v257, v258);
  objc_msgSend__syncEntityObjCModel(self, v259, v260, v261);
  if (v13) {
    sub_1B64B0CB4(v13, v262, v263, v264, v265, v266, v267, v268);
  }
}

- (id)presentationLight
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (id)((uint64_t (*)(__objc2_class *, char *, void))MEMORY[0x1F4181798])(VFXLight, sel_presentationLightWithLightRef_, *((void *)self + 1));
  }
  return self;
}

+ (id)presentationLightWithLightRef:(__CFXLight *)a3
{
  uint64_t v4 = [VFXLight alloc];
  inited = objc_msgSend_initPresentationLightWithLightRef_(v4, v5, (uint64_t)a3, v6);

  return inited;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
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
  return self->_light;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  if (self->_gobo != a4) {
    return 0;
  }
  uint64_t v6 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"%@.%@", (uint64_t)a4, @"gobo", a3);

  return sub_1B6500480(self, v6, v7, v8);
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
    v22[2] = sub_1B64BC78C;
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
  v12[2] = sub_1B64BC9A0;
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
  v14[2] = sub_1B64BCA68;
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
    v13[2] = sub_1B64BCB44;
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
    v15[2] = sub_1B64BCC28;
    v15[3] = &unk_1E6141258;
    v15[4] = self;
    void v15[5] = a3;
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
    v29[2] = sub_1B64BD168;
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
  v14[2] = sub_1B64BD2C4;
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
  v8[2] = sub_1B64BD3A0;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"areaExtents", v3))
  {
    objc_msgSend_areaExtents(self, v7, v8, v9);
LABEL_11:
    _OWORD *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"probeExtents", v9))
  {
    objc_msgSend_probeExtents(self, v11, v12, v13);
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(a3, v11, @"probeOffset", v13))
  {
    objc_msgSend_probeOffset(self, v14, v15, v16);
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(a3, v14, @"parallaxExtentsFactor", v16))
  {
    objc_msgSend_parallaxExtentsFactor(self, v17, v18, v19);
    goto LABEL_11;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(a3, v17, @"parallaxCenterOffset", v19);
  if (isEqualToString)
  {
    objc_msgSend_parallaxCenterOffset(self, v21, v22, v23);
    goto LABEL_11;
  }
  return isEqualToString;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  sub_1B64F9EE8(a3, (char *)&v26, (uint64_t *)&v25, v3);
  if (qword_1E9DDAF80 != -1) {
    dispatch_once(&qword_1E9DDAF80, &unk_1F0FB59A8);
  }
  if (!v25) {
    return 0;
  }
  if (!objc_msgSend_containsObject_((void *)qword_1E9DDAF78, v5, (uint64_t)v25, v6)) {
    return 0;
  }
  int v24 = 0;
  uint64_t v23 = 0;
  if (!objc_msgSend_rawFloat3ForKey_value_(self, v7, v26, (uint64_t)&v23)) {
    return 0;
  }
  if (objc_msgSend_isEqualToString_(v25, v8, @"x", v9))
  {
    LODWORD(v13) = v23;
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v13);
  }
  if (objc_msgSend_isEqualToString_(v25, v10, @"y", v12))
  {
    LODWORD(v18) = HIDWORD(v23);
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v15, v16, v17, v18);
  }
  if (!objc_msgSend_isEqualToString_(v25, v15, @"z", v17)) {
    return 0;
  }
  LODWORD(v22) = v24;
  return (id)objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22);
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
    v7.super_class = (Class)VFXLight;
    return [(VFXLight *)&v7 valueForKeyPath:a3];
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend_isEqual_(a3, a2, @"color", (uint64_t)a4))
  {
    objc_msgSend_setColor_(self, v11, (uint64_t)a4, v12);
  }
  else if ((objc_msgSend_isEqual_(a3, v11, @"image", v12) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXLight;
    [(VFXLight *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"areaExtents", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_areaExtents(self, v6, v7, v8);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, @"probeExtents", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_probeExtents(self, v13, v14, v15);
  }
  else if (objc_msgSend_isEqualToString_(a3, v13, @"probeOffset", v15))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_probeOffset(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a3, v16, @"parallaxCenterOffset", v18))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_parallaxCenterOffset(self, v19, v20, v21);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v19, @"parallaxExtentsFactor", v21))
    {
      v26.receiver = self;
      v26.super_class = (Class)VFXLight;
      return [(VFXLight *)&v26 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_parallaxExtentsFactor(self, v22, v23, v24);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"areaExtents", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setAreaExtents_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"probeExtents", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setProbeExtents_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"probeOffset", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setProbeOffset_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, @"parallaxCenterOffset", v21))
  {
    objc_msgSend_VFXFloat3Value(a3, v25, v26, v27);
    objc_msgSend_setParallaxCenterOffset_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, @"parallaxExtentsFactor", v27))
  {
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setParallaxExtentsFactor_(self, v34, v35, v36);
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)VFXLight;
    [(VFXLight *)&v37 setValue:a3 forKey:a4];
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  uint64_t v13 = objc_msgSend_color(self, v10, v11, v12);
  objc_msgSend_setColor_(v4, v14, v13, v15);
  uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_setName_(v4, v20, v19, v21);
  uint64_t v25 = objc_msgSend_type(self, v22, v23, v24);
  objc_msgSend_setType_(v4, v26, v25, v27);
  objc_msgSend_temperature(self, v28, v29, v30);
  objc_msgSend_setTemperature_(v4, v31, v32, v33);
  objc_msgSend_intensity(self, v34, v35, v36);
  objc_msgSend_setIntensity_(v4, v37, v38, v39);
  objc_msgSend_shadowIntensity(self, v40, v41, v42);
  objc_msgSend_setShadowIntensity_(v4, v43, v44, v45);
  objc_msgSend_shadowMapSize(self, v46, v47, v48);
  objc_msgSend_setShadowMapSize_(v4, v49, v50, v51);
  objc_msgSend_shadowRadius(self, v52, v53, v54);
  objc_msgSend_setShadowRadius_(v4, v55, v56, v57);
  uint64_t v61 = objc_msgSend_castsShadow(self, v58, v59, v60);
  objc_msgSend_setCastsShadow_(v4, v62, v61, v63);
  uint64_t v67 = objc_msgSend_shadowSampleCount(self, v64, v65, v66);
  objc_msgSend_setShadowSampleCount_(v4, v68, v67, v69);
  objc_msgSend_shadowBias(self, v70, v71, v72);
  objc_msgSend_setShadowBias_(v4, v73, v74, v75);
  objc_msgSend_orthographicScale(self, v76, v77, v78);
  objc_msgSend_setOrthographicScale_(v4, v79, v80, v81);
  objc_msgSend_zNear(self, v82, v83, v84);
  objc_msgSend_setZNear_(v4, v85, v86, v87);
  objc_msgSend_zFar(self, v88, v89, v90);
  objc_msgSend_setZFar_(v4, v91, v92, v93);
  uint64_t v97 = objc_msgSend_categoryBitMask(self, v94, v95, v96);
  objc_msgSend_setCategoryBitMask_(v4, v98, v97, v99);
  objc_msgSend_attenuationDistance(self, v100, v101, v102);
  objc_msgSend_setAttenuationDistance_(v4, v103, v104, v105);
  objc_msgSend_spotInnerAngle(self, v106, v107, v108);
  objc_msgSend_setSpotInnerAngle_(v4, v109, v110, v111);
  objc_msgSend_spotOuterAngle(self, v112, v113, v114);
  objc_msgSend_setSpotOuterAngle_(v4, v115, v116, v117);
  objc_msgSend_maximumShadowDistance(self, v118, v119, v120);
  objc_msgSend_setMaximumShadowDistance_(v4, v121, v122, v123);
  uint64_t v127 = objc_msgSend_sampleDistributedShadowMaps(self, v124, v125, v126);
  objc_msgSend_setSampleDistributedShadowMaps_(v4, v128, v127, v129);
  uint64_t v133 = objc_msgSend_forcesBackFaceCasters(self, v130, v131, v132);
  objc_msgSend_setForcesBackFaceCasters_(v4, v134, v133, v135);
  uint64_t v139 = objc_msgSend_automaticallyAdjustsShadowProjection(self, v136, v137, v138);
  objc_msgSend_setAutomaticallyAdjustsShadowProjection_(v4, v140, v139, v141);
  uint64_t v145 = objc_msgSend_shadowCascadeCount(self, v142, v143, v144);
  objc_msgSend_setShadowCascadeCount_(v4, v146, v145, v147);
  objc_msgSend_shadowCascadeSplittingFactor(self, v148, v149, v150);
  objc_msgSend_setShadowCascadeSplittingFactor_(v4, v151, v152, v153);
  if (self->_gobo)
  {
    uint64_t v157 = objc_msgSend_gobo(v4, v154, v155, v156);
    objc_msgSend_copyPropertiesFrom_(v157, v158, (uint64_t)self->_gobo, v159);
  }
  uint64_t v160 = objc_msgSend_IESProfile(self, v154, v155, v156);
  objc_msgSend_setIESProfile_(v4, v161, v160, v162);
  uint64_t v166 = objc_msgSend_areaType(self, v163, v164, v165);
  objc_msgSend_setAreaType_(v4, v167, v166, v168);
  objc_msgSend_areaExtents(self, v169, v170, v171);
  objc_msgSend_setAreaExtents_(v4, v172, v173, v174);
  uint64_t v178 = objc_msgSend_areaPolygonVertices(self, v175, v176, v177);
  objc_msgSend_setAreaPolygonVertices_(v4, v179, v178, v180);
  uint64_t v184 = objc_msgSend_drawsArea(self, v181, v182, v183);
  objc_msgSend_setDrawsArea_(v4, v185, v184, v186);
  uint64_t v190 = objc_msgSend_doubleSided(self, v187, v188, v189);
  objc_msgSend_setDoubleSided_(v4, v191, v190, v192);
  uint64_t v196 = objc_msgSend_probeType(self, v193, v194, v195);
  objc_msgSend_setProbeType_(v4, v197, v196, v198);
  uint64_t updated = objc_msgSend_probeUpdateType(self, v199, v200, v201);
  objc_msgSend_setProbeUpdateType_(v4, v203, updated, v204);
  objc_msgSend_probeExtents(self, v205, v206, v207);
  objc_msgSend_setProbeExtents_(v4, v208, v209, v210);
  objc_msgSend_probeOffset(self, v211, v212, v213);
  objc_msgSend_setProbeOffset_(v4, v214, v215, v216);
  uint64_t v220 = objc_msgSend_parallaxCorrectionEnabled(self, v217, v218, v219);
  objc_msgSend_setParallaxCorrectionEnabled_(v4, v221, v220, v222);
  uint64_t v226 = objc_msgSend_sphericalHarmonicsCoefficients(self, v223, v224, v225);
  objc_msgSend_setSphericalHarmonicsCoefficients_(v4, v227, v226, v228);
  if (self->_probeEnvironment)
  {
    uint64_t v232 = objc_msgSend_probeEnvironment(v4, v229, v230, v231);
    objc_msgSend_copyPropertiesFrom_(v232, v233, (uint64_t)self->_probeEnvironment, v234);
  }
  objc_msgSend__copyAnimationsFrom_(v4, v229, (uint64_t)self, v231);
  objc_msgSend_commitImmediate(VFXTransaction, v235, v236, v237);
  return v4;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonics;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics != a3)
  {

    self->_sphericalHarmonics = (NSData *)objc_msgSend_copy(a3, v6, v7, v8);
    uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B64BDDF4;
    v14[3] = &unk_1E6141230;
    v14[4] = self;
    void v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)shouldBakeDirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setShouldBakeDirectLighting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v3;
}

- (BOOL)shouldBakeIndirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 4) & 1;
}

- (void)setShouldBakeIndirectLighting:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xEF | v3;
}

- (void)_updateProbeStamp
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B64BDEE8;
  v7[3] = &unk_1E61411E0;
  v7[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
}

- (float)attenuationDistance
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_spotInnerAngle;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6495B40((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495B40((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setAttenuationDistance:(float)a3
{
  if (self->_spotInnerAngle != a3)
  {
    self->_spotInnerAngle = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BE034;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"attenuationDistance", v9);
  }
}

- (BOOL)isBaked
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B6495B8C((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      light = self->_light;
      LOBYTE(v5) = sub_1B6495B8C((uint64_t)light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 2) & 1;
  }
  return v5;
}

- (void)setBaked:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xFB | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64BE18C;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)castsShadow
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B649535C((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      light = self->_light;
      LOBYTE(v5) = sub_1B649535C((uint64_t)light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 1) & 1;
  }
  return v5;
}

- (void)setCastsShadow:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xFD | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64BE2E4;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_categoryBitMask;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    unint64_t v22 = sub_1B6495D3C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495D3C((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  if (self->_categoryBitMask != a3)
  {
    self->_categoryBitMask = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64BE420;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)color
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_color;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = sub_1B649553C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  int v5 = (void *)sub_1B64FA080(v15, v16, v17, v18);
  if (v14) {
    sub_1B64B0CB4(v14, v19, v20, v21, v22, v23, v24, v25);
  }
  return v5;
}

- (void)setColor:(id)a3
{
  id color = self->_color;
  if (color != a3)
  {

    self->_id color = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64BE554;
    v11[3] = &unk_1E6141230;
    v11[4] = a3;
    v11[5] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"color", v11);
  }
}

- (double)extendedLinearSRGBColor
{
  char v4 = (const void *)objc_msgSend_color(a1, a2, a3, a4);
  return COERCE_DOUBLE(sub_1B64FA004(v4, 0));
}

- (void)setExtendedLinearSRGBColor:(VFXLight *)self
{
  v10[0] = 0;
  v10[1] = 0;
  sub_1B63C8F2C((float *)v10, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2), 1.0);
  uint64_t v7 = sub_1B64FA080((uint64_t)v10, v4, v5, v6);
  objc_msgSend_setColor_(self, v8, v7, v9);
}

- (float)intensity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_intensity;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6495E08((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495E08((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setIntensity:(float)a3
{
  if (self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BE758;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
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
    float v22 = sub_1B6495F2C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495F2C((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setOrthographicScale:(float)a3
{
  if (self->_orthographicScale != a3)
  {
    self->_orthographicScale = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BE8AC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"orthographicScale", v9);
  }
}

- (float)shadowBias
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v5 = sub_1B6495FE4((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      return sub_1B6495FE4((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return self->_shadowBias;
  }
  return v5;
}

- (void)setShadowBias:(float)a3
{
  double v6 = a3;
  if (self->_shadowBias != v6)
  {
    self->_shadowBias = v6;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64BE9F0;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"shadowBias", v10);
  }
}

- (float)shadowIntensity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowIntensity;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6495588((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495588((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setShadowIntensity:(float)a3
{
  if (self->_shadowIntensity != a3)
  {
    self->_shadowIntensity = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v3, v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64BEB38;
    v8[3] = &unk_1E61411E0;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"shadowIntensity", v8);
  }
}

- (CGSize)shadowMapSize
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    CGSize shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B649609C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13)));
    if (v14)
    {
      CGSize v23 = shadowMapSize;
      sub_1B64B0CB4(v14, v15, v16, v17, v18, v19, v20, v21);
      CGSize shadowMapSize = v23;
    }
  }
  else
  {
    CGSize shadowMapSize = self->_shadowMapSize;
  }
  double height = shadowMapSize.height;
  result.width = shadowMapSize.width;
  result.double height = height;
  return result;
}

- (void)setShadowMapSize:(CGSize)a3
{
  unsigned int v5 = a3.width <= 0.0;
  if (a3.height <= 0.0) {
    unsigned int v5 = 1;
  }
  int32x2_t v6 = vdup_n_s32(v5);
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  CGFloat height = a3.height;
  float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), (int8x16_t)vdupq_n_s64(0x4090000000000000uLL), (int8x16_t)a3);
  int32x2_t v10 = vmovn_s64(vceqq_f64(v9, (float64x2_t)self->_shadowMapSize));
  if ((v10.i32[0] & v10.i32[1] & 1) == 0)
  {
    int8x8_t v12 = (int8x8_t)vadd_s32(vmovn_s64((int64x2_t)vcvtq_u64_f64(v9)), (int32x2_t)-1);
    int8x8_t v13 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v12, 1uLL), v12);
    int8x8_t v14 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v13, 2uLL), v13);
    int8x8_t v15 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v14, 4uLL), v14);
    int8x8_t v16 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v15, 8uLL), v15);
    int32x2_t v17 = vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v16, 0x10uLL), v16), (int32x2_t)0x100000001);
    v18.i64[0] = v17.u32[0];
    v18.i64[1] = v17.u32[1];
    self->_CGSize shadowMapSize = (CGSize)vcvtq_f64_u64(v18);
    uint64_t v19 = objc_msgSend_worldRef(self, a2, v3, v4);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1B64BECE4;
    v21[3] = &unk_1E61411E0;
    v21[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, (uint64_t)self, v21);
  }
}

- (float)shadowRadius
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowRadius;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6495408((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495408((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setShadowRadius:(float)a3
{
  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BEE38;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"shadowRadius", v9);
  }
}

- (unint64_t)shadowSampleCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowSampleCount;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B6496270((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  unint64_t v5 = sub_1B6496270((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setShadowSampleCount:(unint64_t)a3
{
  if (a3 >= 0x40) {
    unint64_t v4 = 64;
  }
  else {
    unint64_t v4 = a3;
  }
  if (v4 != self->_shadowSampleCount)
  {
    self->_shadowSampleCount = v4;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64BEF6C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)spotFalloffExponent
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(&self->_spotFalloffExponent + 1);
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6496364((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6496364((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSpotFalloffExponent:(float)a3
{
  if (*(&self->_spotFalloffExponent + 1) != a3)
  {
    *(&self->_spotFalloffExponent + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BF0C0;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"spotFalloffExponent", v9);
  }
}

- (float)spotInnerAngle
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_spotOuterAngle;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649644C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B649644C((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSpotInnerAngle:(float)a3
{
  if (self->_spotOuterAngle != a3)
  {
    self->_spotOuterAngle = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BF214;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"spotInnerAngle", v9);
  }
}

- (float)spotOuterAngle
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_spotFalloffExponent;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B6495918((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6495918((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSpotOuterAngle:(float)a3
{
  if (self->_spotFalloffExponent != a3)
  {
    self->_spotFalloffExponent = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BF368;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"spotOuterAngle", v9);
  }
}

- (float)temperature
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_temperature;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B64965C8((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B64965C8((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setTemperature:(float)a3
{
  if (self->_temperature != a3)
  {
    self->_temperature = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BF4BC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"temperature", v9);
  }
}

- (void)_resyncObjCModelOfPerTypeParametersWithOldType:(int)a3
{
  self->_spotOuterAngle = 45.0;
  self->_spotFalloffExponent = 60.0;
  *((_DWORD *)&self->_spotFalloffExponent + 1) = 0x40000000;
  self->_drawsArea = 1;
  self->_doubleSided = 0;
  *(void *)&long long v4 = 0x3F0000003F000000;
  *((void *)&v4 + 1) = 0x3F0000003F000000;
  *(_OWORD *)self->_areaExtents = v4;
  self->_areaType = 1;
  self->_probeType = 0;
  self->_probeUpdateType = 0;
  self->_parallaxCorrectionEnabled = 0;
  *(_OWORD *)&self->_probeExtents[7] = xmmword_1B6E51180;
  *(_OWORD *)&self->_probeOffset[7] = xmmword_1B6E51170;
  *(_OWORD *)&self->_parallaxExtentsFactor[7] = xmmword_1B6E511A0;
  *(_OWORD *)&self->_parallaxCenterOffset[7] = xmmword_1B6E51190;
  unsigned int type = self->_type;
  float intensity = self->_intensity;
  float v7 = intensity / sub_1B6494804(a3);
  self->_float intensity = v7 * sub_1B6494804(type);

  self->_IESProfile = 0;
}

- (int64_t)type
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_type;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return (int)sub_1B6496680((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = (int)sub_1B6496680((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setType:(int64_t)a3
{
  int64_t type = self->_type;
  if (type != a3)
  {
    self->_int64_t type = a3;
    objc_msgSend__resyncObjCModelOfPerTypeParametersWithOldType_(self, a2, type, v3);
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64BF70C;
    v12[3] = &unk_1E61412A8;
    v12[4] = self;
    void v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
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
    float v22 = sub_1B64966CC((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B64966CC((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setZFar:(float)a3
{
  double v6 = a3;
  if (self->_zFar != v6)
  {
    self->_zFar = v6;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64BFA94;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"zFar", v10);
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
    float v22 = sub_1B6496784((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6496784((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setZNear:(float)a3
{
  double v6 = a3;
  if (self->_zNear != v6)
  {
    self->_zNear = v6;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64BFBF0;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"zNear", v10);
  }
}

- (unint64_t)shadowCascadeCount
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unsigned int v5 = sub_1B64954A8((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      return sub_1B64954A8((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return self->_shadowCascadeCount;
  }
  return v5;
}

- (void)setShadowCascadeCount:(unint64_t)a3
{
  if (self->_shadowCascadeCount != a3)
  {
    if ((a3 & 0xFC) != 0) {
      unsigned __int8 v5 = 4;
    }
    else {
      unsigned __int8 v5 = a3;
    }
    self->_shadowCascadeCount = v5;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64BFD2C;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    unsigned __int8 v9 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)automaticallyAdjustsShadowProjection
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B64984F0((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      light = self->_light;
      LOBYTE(v5) = sub_1B64984F0((uint64_t)light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 5) & 1;
  }
  return v5;
}

- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 32;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xDF | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64BFE84;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)maximumShadowDistance
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_maximumShadowDistance;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v15 = sub_1B64986EC((uint64_t)self->_light);
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v15;
  }
  else
  {
    light = self->_light;
    return sub_1B64986EC((uint64_t)light);
  }
}

- (void)setMaximumShadowDistance:(float)a3
{
  float v5 = a3;
  LOBYTE(a3) = self->_shadowCascadeCount;
  if ((float)LODWORD(a3) != v5)
  {
    self->_maximumShadowDistance = v5;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64BFFDC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (BOOL)forcesBackFaceCasters
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v23 = sub_1B6498A28((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      light = self->_light;
      LOBYTE(v5) = sub_1B6498A28((uint64_t)light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 6) & 1;
  }
  return v5;
}

- (void)setForcesBackFaceCasters:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 64;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xBF | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0134;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)sampleDistributedShadowMaps
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      uint64_t v15 = v7;
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
      char v16 = sub_1B6498AE0((uint64_t)self->_light);
      sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
      LOBYTE(v5) = v16;
    }
    else
    {
      light = self->_light;
      LOBYTE(v5) = sub_1B6498AE0((uint64_t)light);
    }
  }
  else
  {
    return v4 >> 7;
  }
  return v5;
}

- (void)setSampleDistributedShadowMaps:(BOOL)a3
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (a3 != v4 >> 7)
  {
    if (a3) {
      char v7 = 0x80;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 16) = v7 & 0x80 | v4 & 0x7F;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0280;
    v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)shadowCascadeSplittingFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowCascadeSplittingFactor;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649874C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B649874C((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setShadowCascadeSplittingFactor:(float)a3
{
  double v6 = a3;
  if (self->_shadowCascadeSplittingFactor != v6)
  {
    self->_shadowCascadeSplittingFactor = v6;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C03D4;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)_shadowCascadeDebugFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_cascadeDebugFactor;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B649885C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B649885C((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)set_shadowCascadeDebugFactor:(float)a3
{
  double v6 = a3;
  if (self->_cascadeDebugFactor != v6)
  {
    self->_cascadeDebugFactor = v6;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0530;
    v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"shadowCascadeDebugFactor", v10);
  }
}

- (int64_t)probeType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_probeType;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B64975FC((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = sub_1B64975FC((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setProbeType:(int64_t)a3
{
  if (self->_probeType != a3)
  {
    self->_probeType = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C065C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)probeUpdateType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_probeUpdateType;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B64977A4((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = sub_1B64977A4((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setProbeUpdateType:(int64_t)a3
{
  if (self->_probeUpdateType != a3)
  {
    self->_probeUpdateType = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C0788;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)parallaxCorrectionEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_parallaxCorrectionEnabled;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    BOOL v22 = sub_1B6497860((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6497860((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setParallaxCorrectionEnabled:(BOOL)a3
{
  if (self->_parallaxCorrectionEnabled != a3)
  {
    self->_parallaxCorrectionEnabled = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C08C8;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (double)parallaxCenterOffset
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v30 = sub_1B6497928((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v30;
    }
    else
    {
      *(void *)&long long v5 = sub_1B6497928((__n128 *)*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 240);
  }
  return *(double *)&v5;
}

- (void)setParallaxCenterOffset:(VFXLight *)self
{
  uint32x4_t v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxCenterOffset[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_parallaxCenterOffset[7] = v4;
    float32x4_t v9 = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0A08;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    float32x4_t v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)parallaxExtentsFactor
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v30 = sub_1B64979E4((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v30;
    }
    else
    {
      *(void *)&long long v5 = sub_1B64979E4((__n128 *)*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 224);
  }
  return *(double *)&v5;
}

- (void)setParallaxExtentsFactor:(VFXLight *)self
{
  uint32x4_t v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxExtentsFactor[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_parallaxExtentsFactor[7] = v4;
    float32x4_t v9 = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0B48;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    float32x4_t v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)probeExtents
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v30 = sub_1B6497AB4((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v30;
    }
    else
    {
      *(void *)&long long v5 = sub_1B6497AB4((__n128 *)*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 192);
  }
  return *(double *)&v5;
}

- (void)setProbeExtents:(VFXLight *)self
{
  uint32x4_t v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeExtents[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_probeExtents[7] = v4;
    float32x4_t v9 = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0C88;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    float32x4_t v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)probeOffset
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v30 = sub_1B6497B74((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v30;
    }
    else
    {
      *(void *)&long long v5 = sub_1B6497B74((__n128 *)*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 208);
  }
  return *(double *)&v5;
}

- (void)setProbeOffset:(VFXLight *)self
{
  uint32x4_t v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeOffset[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_probeOffset[7] = v4;
    float32x4_t v9 = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C0DC8;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    float32x4_t v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (VFXMaterialProperty)probeEnvironment
{
  CGSize result = self->_probeEnvironment;
  if (!result)
  {
    uint64_t v6 = [VFXMaterialProperty alloc];
    CGSize result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v6, v7, (uint64_t)self, 24);
    self->_probeEnvironment = result;
  }
  if (*((unsigned char *)self + 16))
  {
    return (VFXMaterialProperty *)MEMORY[0x1F4181798](result, sel_presentationMaterialProperty, v2, v3);
  }
  return result;
}

- (int64_t)areaType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_areaType;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    sub_1B6497104((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, (uint64_t)v29);
    int64_t v5 = v29[0];
    sub_1B64B0CB4(v14, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    sub_1B6497104((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, (uint64_t)v29);
    return v29[0];
  }
  return v5;
}

- (void)setAreaType:(int64_t)a3
{
  if (self->_areaType != a3)
  {
    self->_areaType = a3;
    uint64_t v5 = objc_msgSend_worldRef(self, a2, a3, v3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1B64C0F60;
    v7[3] = &unk_1E61411E0;
    v7[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
  }
}

- (double)areaExtents
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v31 = sub_1B6496FB0((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v31;
    }
    else
    {
      uint64_t v29 = *(__n128 **)(a1 + 8);
      *(void *)&long long v5 = sub_1B6496FB0(v29, v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 320);
  }
  return *(double *)&v5;
}

- (void)setAreaExtents:(VFXLight *)self
{
  uint32x4_t v5 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_areaExtents, v4);
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)self->_areaExtents = v4;
    float32x4_t v9 = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = sub_1B64C10F0;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    float32x4_t v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (BOOL)drawsArea
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_drawsArea;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    char v22 = sub_1B6496EF8((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B6496EF8((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setDrawsArea:(BOOL)a3
{
  if (objc_msgSend_drawsArea(self, a2, a3, v3) != a3)
  {
    self->_drawsArea = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64C1234;
    v11[3] = &unk_1E6141190;
    v11[4] = self;
    BOOL v12 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (BOOL)doubleSided
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_doubleSided;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    char v22 = sub_1B64970A0((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    light = self->_light;
    return sub_1B64970A0((uint64_t)light, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setDoubleSided:(BOOL)a3
{
  if (objc_msgSend_doubleSided(self, a2, a3, v3) != a3)
  {
    self->_doubleSided = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64C1378;
    v11[3] = &unk_1E6141190;
    v11[4] = self;
    BOOL v12 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (NSArray)areaPolygonVertices
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_areaPolygonVertices;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  sub_1B6497104((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, (uint64_t)&v27);
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  uint32x4_t v5 = (NSArray *)sub_1B64BC388((uint64_t)v26, v15, v16, v17);
  if (v14) {
    sub_1B64B0CB4(v14, v18, v19, v20, v21, v22, v23, v24);
  }
  return v5;
}

- (void)setAreaPolygonVertices:(id)a3
{
  areaPolygonVertices = self->_areaPolygonVertices;
  if (areaPolygonVertices != a3)
  {

    self->_areaPolygonVertices = (NSArray *)objc_msgSend_copy(a3, v6, v7, v8);
    uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B64C14D4;
    v14[3] = &unk_1E61411E0;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)hasGobo
{
  return self->_gobo != 0;
}

- (VFXMaterialProperty)gobo
{
  CGSize result = self->_gobo;
  if (!result)
  {
    uint64_t v6 = [VFXMaterialProperty alloc];
    CGSize result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v6, v7, (uint64_t)self, 21);
    self->_gobo = result;
  }
  if (*((unsigned char *)self + 16))
  {
    return (VFXMaterialProperty *)MEMORY[0x1F4181798](result, sel_presentationMaterialProperty, v2, v3);
  }
  return result;
}

- (id)IESProfile
{
  return self->_IESProfile;
}

- (void)setIESProfile:(id)a3
{
  IESProfile = self->_IESProfile;
  if (IESProfile != a3)
  {

    self->_IESProfile = (VFXIESProfile *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64C1620;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    void v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)_customEncodingOfVFXLight:(id)a3
{
  objc_msgSend_attenuationDistance(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"attenuationDistance", v7);
  objc_msgSend_spotInnerAngle(self, v8, v9, v10);
  objc_msgSend_encodeFloat_forKey_(a3, v11, @"spotInnerAngle", v12);
  objc_msgSend_spotOuterAngle(self, v13, v14, v15);
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"spotOuterAngle", v17);
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_categoryBitMask, @"lightCategoryBitMask");
  LODWORD(v19) = *((_DWORD *)&self->_spotFalloffExponent + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v20, @"spotFallOffExponent", v21, v19);
  if (self->_type == 4)
  {
    objc_msgSend_encodeInt_forKey_(a3, v22, LODWORD(self->_probeType), @"probeType");
    objc_msgSend_encodeInt_forKey_(a3, v24, LODWORD(self->_probeUpdateType), @"probeUpdateType");
    objc_msgSend_encodeBool_forKey_(a3, v25, self->_parallaxCorrectionEnabled, @"parallaxCorrectionEnabled");
    LODWORD(v26) = *(_DWORD *)&self->_probeExtents[7];
    objc_msgSend_encodeFloat_forKey_(a3, v27, @"probeExtentsX", v28, v26);
    LODWORD(v29) = *(_DWORD *)&self->_probeExtents[11];
    objc_msgSend_encodeFloat_forKey_(a3, v30, @"probeExtentsY", v31, v29);
    LODWORD(v32) = *(_DWORD *)&self->_probeExtents[15];
    objc_msgSend_encodeFloat_forKey_(a3, v33, @"probeExtentsZ", v34, v32);
    if (COERCE_FLOAT(*(_OWORD *)&self->_probeOffset[7]) == 0.0)
    {
      LODWORD(v35) = HIDWORD(*(void *)&self->_probeOffset[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"probeOffsetX", v23);
      float v35 = *(float *)&self->_probeOffset[11];
    }
    if (v35 != 0.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"probeOffsetY", v23);
    }
    if (*(float *)&self->_probeOffset[15] != 0.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"probeOffsetZ", v23);
    }
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxCenterOffset[7]) == 0.0)
    {
      LODWORD(v36) = HIDWORD(*(void *)&self->_parallaxCenterOffset[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxOffsetX", v23);
      float v36 = *(float *)&self->_parallaxCenterOffset[11];
    }
    if (v36 != 0.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxOffsetY", v23);
    }
    if (*(float *)&self->_parallaxCenterOffset[15] != 0.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxOffsetZ", v23);
    }
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxExtentsFactor[7]) == 1.0)
    {
      LODWORD(v37) = HIDWORD(*(void *)&self->_parallaxExtentsFactor[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxExtentsFactorX", v23);
      float v37 = *(float *)&self->_parallaxExtentsFactor[11];
    }
    if (v37 != 1.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxExtentsFactorY", v23);
    }
    if (*(float *)&self->_parallaxExtentsFactor[15] != 1.0) {
      objc_msgSend_encodeFloat_forKey_(a3, v22, @"parallaxExtentsFactorZ", v23);
    }
  }
  double maximumShadowDistance = self->_maximumShadowDistance;
  *(float *)&double maximumShadowDistance = maximumShadowDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v22, @"maximumShadowDistance", v23, maximumShadowDistance);
  objc_msgSend_encodeBool_forKey_(a3, v39, (*((unsigned __int8 *)self + 16) >> 5) & 1, @"autoShadowProjection");
  objc_msgSend_encodeInt_forKey_(a3, v40, self->_shadowCascadeCount, @"shadowCascadeCount");
  double shadowCascadeSplittingFactor = self->_shadowCascadeSplittingFactor;
  *(float *)&double shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v42, @"shadowCascadeSplittingFactor", v43, shadowCascadeSplittingFactor);
  objc_msgSend_encodeBool_forKey_(a3, v44, (*((unsigned __int8 *)self + 16) >> 6) & 1, @"forcesBackFaceCasters");
  objc_msgSend_encodeBool_forKey_(a3, v45, *((unsigned __int8 *)self + 16) >> 7, @"sampleDistributedShadowMaps");

  objc_msgSend_encodeInt32_forKey_(a3, v46, 1, @"version");
}

- (void)_customDecodingOfVFXLight:(id)a3
{
  if (objc_msgSend_containsValueForKey_(a3, a2, @"attenuationDistance", v3))
  {
    objc_msgSend_decodeFloatForKey_(a3, v6, @"attenuationDistance", v7);
    objc_msgSend_setAttenuationDistance_(self, v8, v9, v10);
  }
  objc_msgSend_decodeFloatForKey_(a3, v6, @"spotInnerAngle", v7);
  objc_msgSend_setSpotInnerAngle_(self, v11, v12, v13);
  objc_msgSend_decodeFloatForKey_(a3, v14, @"spotOuterAngle", v15);
  objc_msgSend_setSpotOuterAngle_(self, v16, v17, v18);
  if (objc_msgSend_containsValueForKey_(a3, v19, @"maximumShadowDistance", v20))
  {
    objc_msgSend_decodeFloatForKey_(a3, v21, @"maximumShadowDistance", v22);
    objc_msgSend_setMaximumShadowDistance_(self, v23, v24, v25);
  }
  if (objc_msgSend_containsValueForKey_(a3, v21, @"autoShadowProjection", v22))
  {
    uint64_t v28 = objc_msgSend_decodeBoolForKey_(a3, v26, @"autoShadowProjection", v27);
    objc_msgSend_setAutomaticallyAdjustsShadowProjection_(self, v29, v28, v30);
  }
  if (objc_msgSend_containsValueForKey_(a3, v26, @"forcesBackFaceCasters", v27))
  {
    uint64_t v33 = objc_msgSend_decodeBoolForKey_(a3, v31, @"forcesBackFaceCasters", v32);
    objc_msgSend_setForcesBackFaceCasters_(self, v34, v33, v35);
  }
  if (objc_msgSend_containsValueForKey_(a3, v31, @"sampleDistributedShadowMaps", v32))
  {
    uint64_t v38 = objc_msgSend_decodeBoolForKey_(a3, v36, @"sampleDistributedShadowMaps", v37);
    objc_msgSend_setSampleDistributedShadowMaps_(self, v39, v38, v40);
  }
  if (objc_msgSend_containsValueForKey_(a3, v36, @"shadowCascadeCount", v37))
  {
    int v43 = objc_msgSend_decodeIntForKey_(a3, v41, @"shadowCascadeCount", v42);
    objc_msgSend_setShadowCascadeCount_(self, v44, v43, v45);
  }
  if (objc_msgSend_containsValueForKey_(a3, v41, @"shadowCascadeSplittingFactor", v42))
  {
    objc_msgSend_decodeFloatForKey_(a3, v46, @"shadowCascadeSplittingFactor", v47);
    objc_msgSend_setShadowCascadeSplittingFactor_(self, v48, v49, v50);
  }
  if (objc_msgSend_containsValueForKey_(a3, v46, @"spotFallOffExponent", v47))
  {
    objc_msgSend_decodeFloatForKey_(a3, v51, @"spotFallOffExponent", v52);
    objc_msgSend_setSpotFalloffExponent_(self, v53, v54, v55);
  }
  if (objc_msgSend_containsValueForKey_(a3, v51, @"lightCategoryBitMask", v52))
  {
    uint64_t v59 = objc_msgSend_decodeIntegerForKey_(a3, v56, @"lightCategoryBitMask", v57);
    objc_msgSend_setCategoryBitMask_(self, v58, v59, v60);
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXLight_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 16) >> 1) & 1, @"castsShadow");
  objc_msgSend_encodeInt_forKey_(a3, v7, (*((unsigned __int8 *)self + 16) >> 2) & 1, @"baked");
  objc_msgSend_encodeInt_forKey_(a3, v8, (*((unsigned __int8 *)self + 16) >> 3) & 1, @"shouldBakeDirectLighting");
  objc_msgSend_encodeInt_forKey_(a3, v9, (*((unsigned __int8 *)self + 16) >> 4) & 1, @"shouldBakeIndirectLighting");
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)sphericalHarmonics, @"sphericalHarmonics");
  }
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)name, @"name");
  }
  int64_t type = self->_type;
  if (type) {
    objc_msgSend_encodeInt_forKey_(a3, v10, type, @"lightType");
  }
  id color = (const char *)self->_color;
  if (color)
  {
    sub_1B64FAC90(a3, color, @"color");
    sub_1B64FA18C(a3, self->_color, @"vfxcolor");
  }
  *(float *)&double v12 = self->_shadowIntensity;
  objc_msgSend_encodeFloat_forKey_(a3, color, @"shadowIntensity", v11, v12);
  *(float *)&double v17 = self->_shadowRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"shadowRadius", v19, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"intensity", v21, self->_intensity);
  objc_msgSend_encodeDouble_forKey_(a3, v22, @"temperature", v23, self->_temperature);
  *(float *)&double v24 = self->_orthographicScale;
  objc_msgSend_encodeFloat_forKey_(a3, v25, @"orthographicScale", v26, v24);
  objc_msgSend_encodeInteger_forKey_(a3, v27, self->_shadowSampleCount, @"shadowSampleCount");
  uint64_t v31 = objc_msgSend_valueWithCGSize_(MEMORY[0x1E4F29238], v28, v29, v30, self->_shadowMapSize.width, self->_shadowMapSize.height);
  objc_msgSend_encodeObject_forKey_(a3, v32, v31, @"shadowMapSize");
  double zNear = self->_zNear;
  *(float *)&double zNear = zNear;
  objc_msgSend_encodeFloat_forKey_(a3, v34, @"zNear", v35, zNear);
  double zFar = self->_zFar;
  *(float *)&double zFar = zFar;
  objc_msgSend_encodeFloat_forKey_(a3, v37, @"zFar", v38, zFar);
  objc_msgSend_encodeDouble_forKey_(a3, v39, @"shadowBias", v40, self->_shadowBias);
  gobo = self->_gobo;
  if (gobo) {
    objc_msgSend_encodeObject_forKey_(a3, v41, (uint64_t)gobo, @"gobo");
  }
  IESProfile = self->_IESProfile;
  if (IESProfile) {
    objc_msgSend_encodeObject_forKey_(a3, v41, (uint64_t)IESProfile, @"IESProfile");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v41, self->_areaType, @"areaType");
  LODWORD(v44) = *(_DWORD *)self->_areaExtents;
  objc_msgSend_encodeFloat_forKey_(a3, v45, @"areaExtentsX", v46, v44);
  LODWORD(v47) = *(_DWORD *)&self->_areaExtents[4];
  objc_msgSend_encodeFloat_forKey_(a3, v48, @"areaExtentsY", v49, v47);
  LODWORD(v50) = *(_DWORD *)&self->_areaExtents[8];
  objc_msgSend_encodeFloat_forKey_(a3, v51, @"areaExtentsZ", v52, v50);
  objc_msgSend_encodeObject_forKey_(a3, v53, (uint64_t)self->_areaPolygonVertices, @"areaPolygonVertices");
  objc_msgSend_encodeBool_forKey_(a3, v54, self->_drawsArea, @"drawsArea");
  objc_msgSend_encodeBool_forKey_(a3, v55, self->_doubleSided, @"doubleSided");
  probeEnvironment = self->_probeEnvironment;
  if (probeEnvironment) {
    objc_msgSend_encodeObject_forKey_(a3, v56, (uint64_t)probeEnvironment, @"probeEnvironment");
  }
  sub_1B64FAB54(a3, self, (uint64_t)probeEnvironment, v57);

  sub_1B64FAEBC(a3, self, v59, v60);
}

- (VFXLight)initWithCoder:(id)a3
{
  v256.receiver = self;
  v256.super_class = (Class)VFXLight;
  uint64_t v7 = [(VFXLight *)&v256 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v11 = sub_1B6494ADC();
    v7->_light = (__CFXLight *)v11;
    if (v11) {
      sub_1B6583684(v11, v7, v13, v14, v15, v16, v17, v18);
    }
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"type");
    if (v21) {
      uint64_t v26 = sub_1B64FA090(v21, v22, v23, v24);
    }
    else {
      uint64_t v26 = (int)objc_msgSend_decodeIntForKey_(a3, v22, @"lightType", v24);
    }
    objc_msgSend_setType_(v7, v25, v26, v27);
    objc_msgSend__customDecodingOfVFXLight_(v7, v28, (uint64_t)a3, v29);
    BOOL v32 = objc_msgSend_decodeIntForKey_(a3, v30, @"castsShadow", v31) != 0;
    objc_msgSend_setCastsShadow_(v7, v33, v32, v34);
    BOOL v37 = objc_msgSend_decodeIntForKey_(a3, v35, @"baked", v36) != 0;
    objc_msgSend_setBaked_(v7, v38, v37, v39);
    BOOL v42 = objc_msgSend_decodeIntForKey_(a3, v40, @"shouldBakeDirectLighting", v41) != 0;
    objc_msgSend_setShouldBakeDirectLighting_(v7, v43, v42, v44);
    BOOL v47 = objc_msgSend_decodeIntForKey_(a3, v45, @"shouldBakeIndirectLighting", v46) != 0;
    objc_msgSend_setShouldBakeIndirectLighting_(v7, v48, v47, v49);
    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, @"sphericalHarmonics");
    objc_msgSend_set_sphericalHarmonics_(v7, v53, v52, v54);
    uint64_t v55 = objc_opt_class();
    uint64_t v57 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v56, v55, @"name");
    objc_msgSend_setName_(v7, v58, v57, v59);
    if (v7->_type == 4)
    {
      int v62 = objc_msgSend_decodeIntForKey_(a3, v60, @"probeType", v61);
      objc_msgSend_setProbeType_(v7, v63, v62, v64);
      int v67 = objc_msgSend_decodeIntForKey_(a3, v65, @"probeUpdateType", v66);
      objc_msgSend_setProbeUpdateType_(v7, v68, v67, v69);
      uint64_t v72 = objc_msgSend_decodeBoolForKey_(a3, v70, @"parallaxCorrectionEnabled", v71);
      objc_msgSend_setParallaxCorrectionEnabled_(v7, v73, v72, v74);
      objc_msgSend_decodeFloatForKey_(a3, v75, @"probeExtentsX", v76);
      unsigned int v251 = v77;
      objc_msgSend_decodeFloatForKey_(a3, v78, @"probeExtentsY", v79);
      unsigned int v247 = v80;
      objc_msgSend_decodeFloatForKey_(a3, v81, @"probeExtentsZ", v82);
      objc_msgSend_setProbeExtents_(v7, v83, v84, v85, COERCE_DOUBLE(__PAIR64__(v247, v251)));
      objc_msgSend_decodeFloatForKey_(a3, v86, @"probeOffsetX", v87);
      unsigned int v252 = v88;
      objc_msgSend_decodeFloatForKey_(a3, v89, @"probeOffsetX", v90);
      unsigned int v248 = v91;
      objc_msgSend_decodeFloatForKey_(a3, v92, @"probeOffsetX", v93);
      objc_msgSend_setProbeOffset_(v7, v94, v95, v96, COERCE_DOUBLE(__PAIR64__(v248, v252)));
      objc_msgSend_decodeFloatForKey_(a3, v97, @"parallaxOffsetX", v98);
      unsigned int v253 = v99;
      objc_msgSend_decodeFloatForKey_(a3, v100, @"parallaxOffsetY", v101);
      unsigned int v249 = v102;
      objc_msgSend_decodeFloatForKey_(a3, v103, @"parallaxOffsetZ", v104);
      objc_msgSend_setParallaxCenterOffset_(v7, v105, v106, v107, COERCE_DOUBLE(__PAIR64__(v249, v253)));
      if (objc_msgSend_containsValueForKey_(a3, v108, @"parallaxExtentsFactorX", v109))
      {
        objc_msgSend_decodeFloatForKey_(a3, v110, @"parallaxExtentsFactorX", v111);
        __asm { FMOV            V1.4S, #1.0 }
        LODWORD(_Q1) = v117;
        *(void *)&double v254 = _Q1;
      }
      else
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(void *)&double v254 = _Q0;
      }
      if (objc_msgSend_containsValueForKey_(a3, v110, @"parallaxExtentsFactorY", v111))
      {
        objc_msgSend_decodeFloatForKey_(a3, v119, @"parallaxExtentsFactorY", v120);
        *(void *)&double v254 = __PAIR64__(v121, LODWORD(v254));
      }
      if (objc_msgSend_containsValueForKey_(a3, v119, @"parallaxExtentsFactorZ", v120)) {
        objc_msgSend_decodeFloatForKey_(a3, v122, @"parallaxExtentsFactorZ", v124);
      }
      objc_msgSend_setParallaxExtentsFactor_(v7, v122, v123, v124, v254);
    }
    if (objc_msgSend_containsValueForKey_(a3, v60, @"vfxcolor", v61))
    {
      uint64_t v125 = sub_1B64FA21C(a3, (const char *)@"vfxcolor");
    }
    else
    {
      uint64_t v128 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v129 = objc_opt_class();
      uint64_t v132 = objc_msgSend_setWithObject_(v128, v130, v129, v131);
      uint64_t v125 = sub_1B64FAD0C(a3, @"color", v132);
    }
    objc_msgSend_setColor_(v7, v126, v125, v127);
    objc_msgSend_decodeFloatForKey_(a3, v133, @"shadowIntensity", v134);
    objc_msgSend_setShadowIntensity_(v7, v135, v136, v137);
    objc_msgSend_decodeFloatForKey_(a3, v138, @"shadowRadius", v139);
    objc_msgSend_setShadowRadius_(v7, v140, v141, v142);
    if (objc_msgSend_containsValueForKey_(a3, v143, @"intensity", v144))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v145, @"intensity", v146);
      *(float *)&double v147 = v147;
      objc_msgSend_setIntensity_(v7, v148, v149, v150, v147);
    }
    if (objc_msgSend_containsValueForKey_(a3, v145, @"temperature", v146))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v151, @"temperature", v152);
      *(float *)&double v153 = v153;
      objc_msgSend_setTemperature_(v7, v154, v155, v156, v153);
    }
    objc_msgSend_decodeFloatForKey_(a3, v151, @"orthographicScale", v152);
    objc_msgSend_setOrthographicScale_(v7, v157, v158, v159);
    uint64_t v162 = objc_msgSend_decodeIntegerForKey_(a3, v160, @"shadowSampleCount", v161);
    objc_msgSend_setShadowSampleCount_(v7, v163, v162, v164);
    uint64_t v165 = objc_opt_class();
    uint64_t v167 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v166, v165, @"shadowMapSize");
    objc_msgSend_CGSizeValue(v167, v168, v169, v170);
    objc_msgSend_setShadowMapSize_(v7, v171, v172, v173);
    objc_msgSend_decodeFloatForKey_(a3, v174, @"zNear", v175);
    objc_msgSend_setZNear_(v7, v176, v177, v178);
    objc_msgSend_decodeFloatForKey_(a3, v179, @"zFar", v180);
    objc_msgSend_setZFar_(v7, v181, v182, v183);
    objc_msgSend_decodeDoubleForKey_(a3, v184, @"shadowBias", v185);
    *(float *)&double v186 = v186;
    objc_msgSend_setShadowBias_(v7, v187, v188, v189, v186);
    uint64_t v190 = objc_opt_class();
    v7->_gobo = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v191, v190, @"gobo");
    uint64_t v192 = objc_opt_class();
    v7->_probeEnvironment = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v193, v192, @"probeEnvironment");
    if (objc_msgSend_containsValueForKey_(a3, v194, @"IESProfile", v195))
    {
      uint64_t v198 = objc_opt_class();
      uint64_t v200 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v199, v198, @"IESProfile");
      objc_msgSend_setIESProfile_(v7, v201, v200, v202);
    }
    if (objc_msgSend_containsValueForKey_(a3, v196, @"areaType", v197))
    {
      uint64_t v205 = objc_msgSend_decodeIntegerForKey_(a3, v203, @"areaType", v204);
      objc_msgSend_setAreaType_(v7, v206, v205, v207);
      objc_msgSend_decodeFloatForKey_(a3, v208, @"areaExtentsX", v209);
      unsigned int v255 = v210;
      objc_msgSend_decodeFloatForKey_(a3, v211, @"areaExtentsY", v212);
      unsigned int v250 = v213;
      objc_msgSend_decodeFloatForKey_(a3, v214, @"areaExtentsZ", v215);
      objc_msgSend_setAreaExtents_(v7, v216, v217, v218, COERCE_DOUBLE(__PAIR64__(v250, v255)));
      uint64_t v219 = objc_opt_class();
      uint64_t v221 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v220, v219, @"areaPolygonVertices");
      objc_msgSend_setAreaPolygonVertices_(v7, v222, v221, v223);
      uint64_t v226 = objc_msgSend_decodeBoolForKey_(a3, v224, @"drawsArea", v225);
      objc_msgSend_setDrawsArea_(v7, v227, v226, v228);
      uint64_t v231 = objc_msgSend_decodeBoolForKey_(a3, v229, @"doubleSided", v230);
      objc_msgSend_setDoubleSided_(v7, v232, v231, v233);
    }
    else
    {
      objc_msgSend_setAreaType_(v7, v203, 4, v204);
      __asm { FMOV            V0.4S, #1.0 }
      objc_msgSend_setAreaExtents_(v7, v235, v236, v237, *(double *)&_Q0);
      objc_msgSend_setAreaPolygonVertices_(v7, v238, 0, v239);
      objc_msgSend_setDrawsArea_(v7, v240, 1, v241);
      objc_msgSend_setDoubleSided_(v7, v242, 0, v243);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v244, v8, v245);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end