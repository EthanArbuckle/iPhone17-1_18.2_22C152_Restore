@interface VFXMaterial
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (id)material;
+ (id)materialWithColor:(id)a3;
+ (id)materialWithContents:(id)a3;
+ (id)materialWithMDLMaterial:(id)a3;
+ (id)materialWithMDLMaterial:(id)a3 options:(id)a4;
+ (id)materialWithMaterialRef:(__CFXMaterial *)a3;
+ (id)nullMaterial;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)avoidsOverLighting;
- (BOOL)isDoubleSided;
- (BOOL)isLitPerPixel;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)readsFromDepthBuffer;
- (BOOL)writesToDepthBuffer;
- (Class)_materialPropertyClass;
- (NSArray)animationKeys;
- (NSArray)bridgedComponentNames;
- (NSDictionary)shaderModifiers;
- (NSNumber)minimumLanguageVersion;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (VFXBehaviorGraph)behaviorGraph;
- (VFXMaterial)init;
- (VFXMaterial)initWithCoder:(id)a3;
- (VFXMaterial)initWithMaterialRef:(__CFXMaterial *)a3;
- (VFXMaterialProperty)ambientOcclusion;
- (VFXMaterialProperty)clearCoat;
- (VFXMaterialProperty)clearCoatNormal;
- (VFXMaterialProperty)clearCoatRoughness;
- (VFXMaterialProperty)diffuse;
- (VFXMaterialProperty)displacement;
- (VFXMaterialProperty)emission;
- (VFXMaterialProperty)metalness;
- (VFXMaterialProperty)multiply;
- (VFXMaterialProperty)normal;
- (VFXMaterialProperty)reflective;
- (VFXMaterialProperty)roughness;
- (VFXMaterialProperty)selfIllumination;
- (VFXMaterialProperty)specular;
- (VFXMaterialProperty)subsurface;
- (VFXMaterialProperty)subsurfaceRadius;
- (VFXMaterialProperty)transparent;
- (VFXProgram)program;
- (__CFXAnimationManager)animationManager;
- (__CFXCommonProfile)commonProfile;
- (__CFXMaterial)materialRef;
- (__CFXMaterial)materialRefCreateIfNeeded;
- (__CFXWorld)worldRef;
- (float)alphaCutoff;
- (float)fresnelExponent;
- (float)indexOfRefraction;
- (float)selfIlluminationOcclusion;
- (float)shininess;
- (id)__shadableHelper;
- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9;
- (id)_property:(id *)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)builtinProperties;
- (id)color;
- (id)contents;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customMaterialAttributeNames;
- (id)customMaterialAttributes;
- (id)customMaterialProperties;
- (id)customMaterialPropertyNames;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3;
- (id)initPresentationMaterialWithMaterialRef:(__CFXMaterial *)a3;
- (id)presentationMaterial;
- (id)properties;
- (id)propertyWithName:(id)a3;
- (id)shaderModifiersArgumentWithName:(id)a3;
- (id)shaderModifiersArguments;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (int64_t)blendMode;
- (int64_t)colorBufferWriteMask;
- (int64_t)cullMode;
- (int64_t)transparencyMode;
- (unint64_t)fillMode;
- (unint64_t)shadingModel;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_copyAttributes:(id)a3;
- (void)_customDecodingOfVFXMaterial:(id)a3;
- (void)_customEncodingOfVFXMaterial:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setAttributes:(id)a3;
- (void)_setupMaterialProperty:(id *)a3;
- (void)_setupShadableHelperIfNeeded;
- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)addWorldReference:(id)a3;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3;
- (void)dealloc;
- (void)didAttachToWorld:(id)a3;
- (void)didDetachFromWorld:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)removeWorldReference:(id)a3;
- (void)setAlphaCutoff:(float)a3;
- (void)setAvoidsOverLighting:(BOOL)a3;
- (void)setBehaviorGraph:(id)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setColor:(id)a3;
- (void)setColorBufferWriteMask:(int64_t)a3;
- (void)setContents:(id)a3;
- (void)setCullMode:(int64_t)a3;
- (void)setDoubleSided:(BOOL)a3;
- (void)setFillMode:(unint64_t)a3;
- (void)setFresnelExponent:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setIndexOfRefraction:(float)a3;
- (void)setLitPerPixel:(BOOL)a3;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setProgram:(id)a3;
- (void)setReadsFromDepthBuffer:(BOOL)a3;
- (void)setSelfIlluminationOcclusion:(float)a3;
- (void)setShaderModifiers:(id)a3;
- (void)setShadingModel:(unint64_t)a3;
- (void)setShininess:(float)a3;
- (void)setTransparencyMode:(int64_t)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWritesToDepthBuffer:(BOOL)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXMaterial

- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9
{
  int isEqualToString = objc_msgSend_isEqualToString_(a7, a2, *MEMORY[0x1E4F35B48], (uint64_t)a4);
  v19 = objc_msgSend_propertyNamed_(a3, v17, (uint64_t)a8, v18);
  if (!v19) {
    return 0;
  }
  v23 = v19;
  if (!objc_msgSend_textureSamplerValue(v19, v20, v21, v22)) {
    return 0;
  }
  v27 = objc_msgSend_textureSamplerValue(v23, v24, v25, v26);
  if (!objc_msgSend_texture(v27, v28, v29, v30)) {
    return 0;
  }
  if (a6)
  {
    uint64_t v34 = (*((uint64_t (**)(id, id))a6 + 2))(a6, a5);
  }
  else
  {
    v38 = NSString;
    v39 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v31, v32, v33);
    uint64_t v43 = objc_msgSend_UUIDString(v39, v40, v41, v42);
    uint64_t v34 = objc_msgSend_stringWithFormat_(v38, v44, @"/tmp/ModelKit_AO_%@.png", v45, v43);
  }
  uint64_t v46 = v34;
  if (objc_msgSend_isEqualToString_(a9, v35, (uint64_t)&stru_1F0FCDBB0, v36))
  {
    v50 = objc_msgSend_textureSamplerValue(v23, v47, v48, v49);
    v54 = objc_msgSend_texture(v50, v51, v52, v53);
    uint64_t v57 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v55, v46, v56);
    objc_msgSend_writeToURL_(v54, v58, v57, v59);
    objc_msgSend_setString_(a9, v60, v46, v61);
  }
  else
  {
    uint64_t v46 = (uint64_t)a9;
  }
  v62 = objc_msgSend_modelSourcesForSemantic_(a4, v47, @"kGeometrySourceSemanticTexcoord", v49);
  int v66 = objc_msgSend_count(v62, v63, v64, v65);
  int v70 = v66;
  if (v66 < 1)
  {
    LODWORD(v71) = 0;
  }
  else
  {
    uint64_t v71 = 0;
    uint64_t v72 = v66;
    while (1)
    {
      v73 = objc_msgSend_objectAtIndexedSubscript_(v62, v67, v71, v69);
      v77 = objc_msgSend_mkSemantic(v73, v74, v75, v76);
      if (objc_msgSend_isEqualToString_(v77, v78, (uint64_t)a7, v79)) {
        break;
      }
      if (v72 == ++v71)
      {
        LODWORD(v71) = v70;
        break;
      }
    }
  }
  if (isEqualToString)
  {
    v80 = objc_msgSend_ambientOcclusion(self, v67, v68, v69);
    objc_msgSend_setMappingChannel_(v80, v81, v71, v82);
    v86 = objc_msgSend_ambientOcclusion(self, v83, v84, v85);
  }
  else
  {
    v89 = objc_msgSend_selfIllumination(self, v67, v68, v69);
    objc_msgSend_setMappingChannel_(v89, v90, v71, v91);
    v86 = objc_msgSend_selfIllumination(self, v92, v93, v94);
  }
  objc_msgSend_setContents_(v86, v87, v46, v88);
  v97 = (void *)MEMORY[0x1E4F1CB10];

  return (id)objc_msgSend_fileURLWithPath_(v97, v95, v46, v96);
}

+ (id)materialWithMDLMaterial:(id)a3
{
  return (id)objc_msgSend_materialWithMDLMaterial_options_(a1, a2, (uint64_t)a3, 0);
}

+ (id)materialWithMDLMaterial:(id)a3 options:(id)a4
{
  if (!a3) {
    return 0;
  }
  id AssociatedObject = objc_getAssociatedObject(a3, @"VFXMDLAssociatedObject");
  objc_msgSend_scatteringFunction(a3, v8, v9, v10);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v15 = AssociatedObject;
  if (!AssociatedObject)
  {
    v15 = objc_msgSend_material(a1, v11, v12, v13);
    uint64_t v19 = objc_msgSend_name(a3, v16, v17, v18);
    objc_msgSend_setName_(v15, v20, v19, v21);
    objc_setAssociatedObject(a3, @"VFXMDLAssociatedObject", v15, (void *)0x301);
    objc_setAssociatedObject(v15, @"VFXMDLAssociatedObject", a3, 0);
  }
  objc_msgSend_setShadingModel_(v15, v11, (isKindOfClass & 1) == 0, v13);
  uint64_t v25 = objc_msgSend_emission(v15, v22, v23, v24);
  sub_1B646F084(v25, a3, 13, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v29 = objc_msgSend_diffuse(v15, v26, v27, v28);
  sub_1B646F084(v29, a3, 0, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v33 = objc_msgSend_specular(v15, v30, v31, v32);
  sub_1B646F084(v33, a3, 3, AssociatedObject == 0, (uint64_t)a4);
  v37 = objc_msgSend_reflective(v15, v34, v35, v36);
  sub_1B646F084(v37, a3, 32769, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v41 = objc_msgSend_transparent(v15, v38, v39, v40);
  sub_1B646F084(v41, a3, 15, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v45 = objc_msgSend_displacement(v15, v42, v43, v44);
  sub_1B646F084(v45, a3, 20, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v49 = objc_msgSend_normal(v15, v46, v47, v48);
  sub_1B646F084(v49, a3, 19, AssociatedObject == 0, (uint64_t)a4);
  uint64_t v53 = objc_msgSend_ambientOcclusion(v15, v50, v51, v52);
  sub_1B646F084(v53, a3, 22, AssociatedObject == 0, (uint64_t)a4);
  if (objc_msgSend_materialFace(a3, v54, v55, v56) == 2) {
    objc_msgSend_setDoubleSided_(v15, v57, 1, v59);
  }
  if (isKindOfClass)
  {
    BOOL v60 = AssociatedObject == 0;
    uint64_t v61 = objc_msgSend_metalness(v15, v57, v58, v59);
    sub_1B646F084(v61, a3, 2, v60, (uint64_t)a4);
    uint64_t v65 = objc_msgSend_roughness(v15, v62, v63, v64);
    sub_1B646F084(v65, a3, 6, v60, (uint64_t)a4);
  }
  else
  {
    int v66 = objc_msgSend_propertyWithSemantic_(a3, v57, 6, v59);
    objc_msgSend_floatValue(v66, v67, v68, v69);
    *(float *)&double v71 = (float)(2.0 / (float)(v70 * v70)) + -2.0;
    objc_msgSend_setShininess_(v15, v72, v73, v74, v71);
  }
  return v15;
}

- (VFXMaterial)init
{
  v15.receiver = self;
  v15.super_class = (Class)VFXMaterial;
  v2 = [(VFXMaterial *)&v15 init];
  if (v2)
  {
    uint64_t v3 = sub_1B64AED1C();
    v2->_material = (__CFXMaterial *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXMaterial)initWithMaterialRef:(__CFXMaterial *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)VFXMaterial;
  v4 = [(VFXMaterial *)&v20 init];
  if (v4)
  {
    uint64_t v5 = (__CFXMaterial *)CFRetain(a3);
    v4->_material = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    objc_msgSend_makeUniqueID(v4, v16, v17, v18);
  }
  return v4;
}

- (id)initPresentationMaterialWithMaterialRef:(__CFXMaterial *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXMaterial;
  v4 = [(VFXMaterial *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_isPresentationObject = 1;
    v4->_material = (__CFXMaterial *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (id)materialWithMaterialRef:(__CFXMaterial *)a3
{
  id result = sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithMaterialRef_(v6, v7, (uint64_t)a3, v8);
    return v9;
  }
  return result;
}

+ (id)material
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)materialWithColor:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  objc_msgSend_setColor_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

+ (id)materialWithContents:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  objc_msgSend_setContents_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

+ (id)nullMaterial
{
  return (id)objc_msgSend_nullMaterial(_VFXNullMaterial, a2, v2, v3);
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = objc_msgSend_properties(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_parentWillDie_(*(void **)(*((void *)&v24 + 1) + 8 * i), v8, (uint64_t)self, v10);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v11);
  }
  if (!self->_isPresentationObject) {
    objc_msgSend_ownerWillDie(self->_shadableHelper, v8, v9, v10);
  }

  material = self->_material;
  if (material)
  {
    if (!self->_isPresentationObject)
    {
      sub_1B6583684((uint64_t)material, 0, v15, v16, v17, v18, v19, v20);
      material = self->_material;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B64C2F58;
    v23[3] = &unk_1E6140A18;
    v23[4] = material;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, 0, 0, v23);
  }

  v22.receiver = self;
  v22.super_class = (Class)VFXMaterial;
  [(VFXMaterial *)&v22 dealloc];
}

- (void)didAttachToWorld:(id)a3
{
  uint64_t v5 = objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  world = self->_world;

  objc_msgSend_wasAddedToWorld_(v5, v6, (uint64_t)world, v7);
}

- (void)didDetachFromWorld:(id)a3
{
  uint64_t v5 = objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  world = self->_world;

  objc_msgSend_willBeRemovedFromWorld_(v5, v6, (uint64_t)world, v7);
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
    v8[2] = sub_1B64C3084;
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
        v15[2] = sub_1B64C3158;
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
      v15[2] = sub_1B64C3240;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      void v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  if (!self->_isPresentationObject) {
    return self->_name;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend___CFObject(self, v6, v7, v8);
  uint64_t v29 = (NSString *)sub_1B6583470(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);

  sub_1B65835F8(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (NSString)identifier
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (NSString *)sub_1B6583590(v4, v5, v6, v7, v8, v9, v10, v11);
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
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  self->_cullMode = (int)sub_1B64AF564(v14, v15, v16, v17, v18, v19, v20, v21);
  self->_writesToDepthBuffer = sub_1B64AF840(v14, v22, v23, v24, v25, v26, v27, v28);
  self->_readsFromDepthBuffer = sub_1B64AF978(v14, v29, v30, v31, v32, v33, v34, v35);
  self->_colorBufferWriteMask = sub_1B64AF894(v14, v36, v37, v38, v39, v40, v41, v42);
  self->_doubleSided = sub_1B64AF3EC(v14, v43, v44, v45, v46, v47, v48, v49);
  self->_fillMode = (int)sub_1B64AF5B0(v14, v50, v51, v52, v53, v54, v55, v56);
  self->_blendMode = (int)sub_1B64AF5FC(v14, v57, v58, v59, v60, v61, v62, v63);
  self->_alphaCutoff = sub_1B64AF648(v14, v64, v65, v66, v67, v68, v69, v70);
  v78 = (float *)sub_1B64AF43C(v14, v71, v72, v73, v74, v75, v76, v77);
  if (v78)
  {
    v86 = v78;
    self->_shininess = sub_1B64758EC(v78, 17, v80, v81, v82, v83, v84, v85);
    self->_indexOfRefraction = sub_1B64758EC(v86, 18, v87, v88, v89, v90, v91, v92);
    self->_fresnelExponent = sub_1B64758EC(v86, 19, v93, v94, v95, v96, v97, v98);
    self->_transparencyMode = sub_1B6476BAC((uint64_t)v86, v99, v100, v101, v102, v103, v104, v105);
    unsigned int v113 = sub_1B64757A4((uint64_t)v86, v106, v107, v108, v109, v110, v111, v112);
    self->_shadingModel = sub_1B64C3534(v113, v114, v115, v116, v117, v118, v119, v120);
    self->_litPerPixel = sub_1B6476B60((uint64_t)v86, v121, v122, v123, v124, v125, v126, v127);
    self->_avoidsOverLighting = sub_1B6476A84((uint64_t)v86, v128, v129, v130, v131, v132, v133, v134);
    self->_selfIlluminationOcclusion = sub_1B6476C88((uint64_t)v86);
  }
  objc_msgSend__syncEntityObjCModel(self, v79, v80, v81);
  if (v13)
  {
    sub_1B64B0CB4(v13, v135, v136, v137, v138, v139, v140, v141);
  }
}

- (id)presentationMaterial
{
  uint64_t v2 = self;
  if (!self->_isPresentationObject)
  {
    uint64_t v3 = [VFXMaterial alloc];
    uint64_t v6 = (id *)(id)objc_msgSend_initPresentationMaterialWithMaterialRef_(v3, v4, (uint64_t)v2->_material, v5);

    v6[32] = v2->_shadableHelper;
    return v6;
  }
  return v2;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__CFXMaterial)materialRef
{
  return self->_material;
}

- (__CFXCommonProfile)commonProfile
{
  uint64_t v4 = objc_msgSend_materialRef(self, a2, v2, v3);

  return (__CFXCommonProfile *)sub_1B64AF43C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (Class)_materialPropertyClass
{
  return (Class)objc_opt_class();
}

- (void)_setupMaterialProperty:(id *)a3
{
  if (a3)
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = objc_msgSend_commonProfile(self, v7, v8, v9, 0, 0);
    if (v15)
    {
      if (&self->_diffuse == (VFXMaterialProperty **)a3) {
        char v22 = 1;
      }
      else {
        char v22 = 20;
      }
      if (&self->_specular == (VFXMaterialProperty **)a3) {
        char v22 = 2;
      }
      if (&self->_emission == (VFXMaterialProperty **)a3) {
        char v22 = 0;
      }
      if (&self->_reflective == (VFXMaterialProperty **)a3) {
        char v22 = 3;
      }
      if (&self->_transparent == (VFXMaterialProperty **)a3) {
        char v22 = 4;
      }
      if (&self->_multiply == (VFXMaterialProperty **)a3) {
        char v22 = 5;
      }
      if (&self->_normal == (VFXMaterialProperty **)a3) {
        char v22 = 6;
      }
      if (&self->_selfIllumination == (VFXMaterialProperty **)a3) {
        char v22 = 8;
      }
      if (&self->_ambientOcclusion == (VFXMaterialProperty **)a3) {
        char v22 = 7;
      }
      if (&self->_metalness == (VFXMaterialProperty **)a3) {
        char v22 = 9;
      }
      if (&self->_roughness == (VFXMaterialProperty **)a3) {
        char v22 = 10;
      }
      if (&self->_displacement == (VFXMaterialProperty **)a3) {
        char v22 = 16;
      }
      if (&self->_clearCoat == (VFXMaterialProperty **)a3) {
        char v22 = 11;
      }
      if (&self->_clearCoatRoughness == (VFXMaterialProperty **)a3) {
        char v22 = 12;
      }
      if (&self->_clearCoatNormal == (VFXMaterialProperty **)a3) {
        char v22 = 13;
      }
      if (&self->_subsurface == (VFXMaterialProperty **)a3) {
        char v22 = 14;
      }
      if (&self->_subsurfaceRadius == (VFXMaterialProperty **)a3) {
        char v22 = 15;
      }
      uint64_t v23 = v22;
      if (v22 == 20)
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v32 = v15;
        uint64_t v33 = (uint64_t *)sub_1B6475DBC(v15, v22, v16, v17, v18, v19, v20, v21);
        uint64_t v24 = sub_1B647617C(v32, v23, v34, v35, v36, v37, v38, v39);
        if (v33) {
          goto LABEL_46;
        }
      }
      uint64_t v33 = &v60;
      sub_1B63C8F2C((float *)&v60, 0.5, 0.5, 0.5, 1.0);
LABEL_46:
      id v43 = objc_alloc((Class)objc_msgSend__materialPropertyClass(self, v40, v41, v42));
      uint64_t v45 = objc_msgSend_initWithParent_propertyType_(v43, v44, (uint64_t)self, v23);
      *a3 = v45;
      uint64_t v46 = (void *)MEMORY[0x1E4FB1618];
      int isColorManaged = objc_msgSend_isColorManaged(v45, v47, v48, v49);
      uint64_t v52 = objc_msgSend_vfx_colorWithCFXColor_ignoringColorSpace_(v46, v51, (uint64_t)v33, isColorManaged ^ 1u);
      objc_msgSend__setColor_(v45, v53, v52, v54);
      objc_msgSend__setCFXImageRef_(*a3, v55, v24, v56);
      objc_msgSend__setupContentsFromCFXImage(*a3, v57, v58, v59);
      if (!v14) {
        return;
      }
      goto LABEL_47;
    }
    sub_1B63F2F54(16, @"Unreachable code: _setupMaterialProperty -- should not reach", v16, v17, v18, v19, v20, v21, v60);
    if (v14) {
LABEL_47:
    }
      sub_1B64B0CB4(v14, v25, v26, v27, v28, v29, v30, v31);
  }
}

- (void)setColor:(id)a3
{
  uint64_t v5 = objc_msgSend_diffuse(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setColor_(v5, v6, (uint64_t)a3, v7);
}

- (id)color
{
  uint64_t v4 = objc_msgSend_diffuse(self, a2, v2, v3);

  return (id)objc_msgSend_color(v4, v5, v6, v7);
}

- (id)builtinProperties
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = objc_msgSend_initWithCapacity_(v3, v4, 18, v5);
  if (self->_diffuse)
  {
    uint64_t v10 = objc_msgSend_diffuse(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v11, v10, v12);
  }
  if (self->_specular)
  {
    uint64_t v13 = objc_msgSend_specular(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v14, v13, v15);
  }
  if (self->_emission)
  {
    uint64_t v16 = objc_msgSend_emission(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v17, v16, v18);
  }
  if (self->_transparent)
  {
    uint64_t v19 = objc_msgSend_transparent(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v20, v19, v21);
  }
  if (self->_reflective)
  {
    uint64_t v22 = objc_msgSend_reflective(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v23, v22, v24);
  }
  if (self->_multiply)
  {
    uint64_t v25 = objc_msgSend_multiply(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v26, v25, v27);
  }
  if (self->_normal)
  {
    uint64_t v28 = objc_msgSend_normal(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v29, v28, v30);
  }
  if (self->_ambientOcclusion)
  {
    uint64_t v31 = objc_msgSend_ambientOcclusion(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v32, v31, v33);
  }
  if (self->_selfIllumination)
  {
    uint64_t v34 = objc_msgSend_selfIllumination(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v35, v34, v36);
  }
  if (self->_metalness)
  {
    uint64_t v37 = objc_msgSend_metalness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v38, v37, v39);
  }
  if (self->_roughness)
  {
    uint64_t v40 = objc_msgSend_roughness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v41, v40, v42);
  }
  if (self->_displacement)
  {
    uint64_t v43 = objc_msgSend_displacement(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v44, v43, v45);
  }
  if (self->_clearCoat)
  {
    uint64_t v46 = objc_msgSend_clearCoat(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v47, v46, v48);
  }
  if (self->_clearCoatRoughness)
  {
    uint64_t v49 = objc_msgSend_clearCoatRoughness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v50, v49, v51);
  }
  if (self->_clearCoatNormal)
  {
    uint64_t v52 = objc_msgSend_clearCoatNormal(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v53, v52, v54);
  }
  if (self->_subsurface)
  {
    uint64_t v55 = objc_msgSend_subsurface(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v56, v55, v57);
  }
  if (self->_subsurfaceRadius)
  {
    uint64_t v58 = objc_msgSend_subsurfaceRadius(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v59, v58, v60);
  }

  return v9;
}

- (id)propertyWithName:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v6 = objc_msgSend_customMaterialProperties(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v72, (uint64_t)v76, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v73;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v73 != v13) {
        objc_enumerationMutation(v6);
      }
      uint64_t v15 = *(void **)(*((void *)&v72 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend_propertyName(v15, v9, v10, v11);
      if (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a3, v18)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v72, (uint64_t)v76, 16);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (objc_msgSend_isEqualToString_(a3, v9, @"diffuse", v11)) {
      return (id)objc_msgSend_diffuse(self, v19, v20, v21);
    }
    if (objc_msgSend_isEqualToString_(a3, v19, @"specular", v21)) {
      return (id)objc_msgSend_specular(self, v23, v24, v25);
    }
    if (objc_msgSend_isEqualToString_(a3, v23, @"emission", v25)) {
      return (id)objc_msgSend_emission(self, v26, v27, v28);
    }
    if (objc_msgSend_isEqualToString_(a3, v26, @"transparent", v28)) {
      return (id)objc_msgSend_transparent(self, v29, v30, v31);
    }
    if (objc_msgSend_isEqualToString_(a3, v29, @"reflective", v31)) {
      return (id)objc_msgSend_reflective(self, v32, v33, v34);
    }
    if (objc_msgSend_isEqualToString_(a3, v32, @"multiply", v34)) {
      return (id)objc_msgSend_multiply(self, v35, v36, v37);
    }
    if (objc_msgSend_isEqualToString_(a3, v35, @"normal", v37)) {
      return (id)objc_msgSend_normal(self, v38, v39, v40);
    }
    if (objc_msgSend_isEqualToString_(a3, v38, @"ambientOcclusion", v40)) {
      return (id)objc_msgSend_ambientOcclusion(self, v41, v42, v43);
    }
    if (objc_msgSend_isEqualToString_(a3, v41, @"selfIllumination", v43)) {
      return (id)objc_msgSend_selfIllumination(self, v44, v45, v46);
    }
    if (objc_msgSend_isEqualToString_(a3, v44, @"metalness", v46)) {
      return (id)objc_msgSend_metalness(self, v47, v48, v49);
    }
    if (objc_msgSend_isEqualToString_(a3, v47, @"roughness", v49)) {
      return (id)objc_msgSend_roughness(self, v50, v51, v52);
    }
    if (objc_msgSend_isEqualToString_(a3, v50, @"displacement", v52)) {
      return (id)objc_msgSend_displacement(self, v53, v54, v55);
    }
    if (objc_msgSend_isEqualToString_(a3, v53, @"clearCoat", v55)) {
      return (id)objc_msgSend_clearCoat(self, v56, v57, v58);
    }
    if (objc_msgSend_isEqualToString_(a3, v56, @"clearCoatRoughness", v58)) {
      return (id)objc_msgSend_clearCoatRoughness(self, v59, v60, v61);
    }
    if (objc_msgSend_isEqualToString_(a3, v59, @"clearCoatNormal", v61)) {
      return (id)objc_msgSend_clearCoatNormal(self, v62, v63, v64);
    }
    if (objc_msgSend_isEqualToString_(a3, v62, @"subsurface", v64)) {
      return (id)objc_msgSend_subsurface(self, v65, v66, v67);
    }
    if (!objc_msgSend_isEqualToString_(a3, v65, @"subsurfaceRadius", v67)) {
      return 0;
    }
    return (id)objc_msgSend_subsurfaceRadius(self, v68, v69, v70);
  }
  return v15;
}

- (id)properties
{
  uint64_t v5 = objc_msgSend_builtinProperties(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_customMaterialProperties(self, v6, v7, v8);
  if (!objc_msgSend_count(v9, v10, v11, v12)) {
    return v5;
  }

  return (id)objc_msgSend_arrayByAddingObjectsFromArray_(v5, v13, (uint64_t)v9, v14);
}

- (id)_property:(id *)a3
{
  if (!*a3) {
    objc_msgSend__setupMaterialProperty_(self, a2, (uint64_t)a3, v3);
  }
  id result = *a3;
  if (self->_isPresentationObject)
  {
    return (id)MEMORY[0x1F4181798](result, sel_presentationMaterialProperty, a3, v3);
  }
  return result;
}

- (VFXMaterialProperty)diffuse
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_diffuse);
}

- (VFXMaterialProperty)specular
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_specular);
}

- (VFXMaterialProperty)emission
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_emission);
}

- (VFXMaterialProperty)reflective
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_reflective);
}

- (VFXMaterialProperty)transparent
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_transparent);
}

- (VFXMaterialProperty)multiply
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_multiply);
}

- (VFXMaterialProperty)normal
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_normal);
}

- (VFXMaterialProperty)ambientOcclusion
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_ambientOcclusion);
}

- (VFXMaterialProperty)selfIllumination
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_selfIllumination);
}

- (VFXMaterialProperty)metalness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_metalness);
}

- (VFXMaterialProperty)roughness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_roughness);
}

- (VFXMaterialProperty)displacement
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_displacement);
}

- (VFXMaterialProperty)clearCoat
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_clearCoat);
}

- (VFXMaterialProperty)clearCoatRoughness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_clearCoatRoughness);
}

- (VFXMaterialProperty)clearCoatNormal
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_clearCoatNormal);
}

- (VFXMaterialProperty)subsurface
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_subsurface);
}

- (VFXMaterialProperty)subsurfaceRadius
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1F4181798])(self, sel__property_, &self->_subsurfaceRadius);
}

- (void)setTransparencyMode:(int64_t)a3
{
  if (self->_transparencyMode != a3)
  {
    self->_transparencyMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4018;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)transparencyMode
{
  if (!self->_isPresentationObject) {
    return self->_transparencyMode;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    int64_t v22 = sub_1B6476BAC(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  int64_t v22 = 0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setShininess:(float)a3
{
  if (self->_shininess != a3)
  {
    self->_shininess = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64C4188;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"shininess", v9);
  }
}

- (float)shininess
{
  if (!self->_isPresentationObject) {
    return self->_shininess;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    float v22 = sub_1B64758EC(v14, 17, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  float v22 = 0.0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setIndexOfRefraction:(float)a3
{
  if (self->_indexOfRefraction != a3)
  {
    self->_indexOfRefraction = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64C430C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"indexOfRefraction", v9);
  }
}

- (float)indexOfRefraction
{
  if (!self->_isPresentationObject) {
    return self->_indexOfRefraction;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    float v22 = sub_1B64758EC(v14, 18, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  float v22 = 0.0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setFresnelExponent:(float)a3
{
  if (self->_fresnelExponent != a3)
  {
    self->_fresnelExponent = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64C4490;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fresnelExponent", v9);
  }
}

- (float)fresnelExponent
{
  if (!self->_isPresentationObject) {
    return self->_fresnelExponent;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    float v22 = sub_1B64758EC(v14, 19, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  float v22 = 0.0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setSelfIlluminationOcclusion:(float)a3
{
  if (self->_selfIlluminationOcclusion != a3)
  {
    self->_selfIlluminationOcclusion = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64C4614;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"selfIlluminationOcclusion", v9);
  }
}

- (float)selfIlluminationOcclusion
{
  if (!self->_isPresentationObject) {
    return self->_selfIlluminationOcclusion;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    float v22 = sub_1B6476C88(v14);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  float v22 = 0.0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setBlendMode:(int64_t)a3
{
  if (self->_blendMode != a3)
  {
    self->_blendMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4780;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)blendMode
{
  if (!self->_isPresentationObject) {
    return self->_blendMode;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  int64_t v29 = (int)sub_1B64AF5FC(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (float)alphaCutoff
{
  if (!self->_isPresentationObject) {
    return self->_alphaCutoff;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  float v29 = sub_1B64AF648(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setAlphaCutoff:(float)a3
{
  if (self->_isPresentationObject || self->_alphaCutoff != a3)
  {
    self->_alphaCutoff = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64C495C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"alphaCutoff", v9);
  }
}

- (void)setShadingModel:(unint64_t)a3
{
  if (self->_shadingModel != a3)
  {
    self->_shadingModel = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4A44;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)shadingModel
{
  if (!self->_isPresentationObject) {
    return self->_shadingModel;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  unsigned int v22 = sub_1B64757A4(v14, v15, v16, v17, v18, v19, v20, v21);
  unint64_t v37 = sub_1B64C3534(v22, v23, v24, v25, v26, v27, v28, v29);
  if (v13) {
    sub_1B64B0CB4(v13, v30, v31, v32, v33, v34, v35, v36);
  }
  return v37;
}

- (void)setLitPerPixel:(BOOL)a3
{
  if (self->_litPerPixel != a3)
  {
    self->_litPerPixel = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4BE0;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"litPerPixel", v8);
  }
}

- (BOOL)isLitPerPixel
{
  if (!self->_isPresentationObject) {
    return self->_litPerPixel;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    char v22 = sub_1B6476B60(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  char v22 = 0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setAvoidsOverLighting:(BOOL)a3
{
  if (self->_avoidsOverLighting != a3)
  {
    self->_avoidsOverLighting = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4D54;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)avoidsOverLighting
{
  if (!self->_isPresentationObject) {
    return self->_avoidsOverLighting;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    char v22 = sub_1B6476A84(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13) {
      return v22;
    }
    goto LABEL_9;
  }
  char v22 = 0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setWritesToDepthBuffer:(BOOL)a3
{
  if (self->_writesToDepthBuffer != a3)
  {
    self->_writesToDepthBuffer = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C4EC4;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)writesToDepthBuffer
{
  if (!self->_isPresentationObject) {
    return self->_writesToDepthBuffer;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    BOOL v21 = sub_1B64AF840((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    material = self->_material;
    return sub_1B64AF840((uint64_t)material, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setColorBufferWriteMask:(int64_t)a3
{
  if (self->_colorBufferWriteMask != a3)
  {
    self->_colorBufferWriteMask = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C5028;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)colorBufferWriteMask
{
  if (!self->_isPresentationObject) {
    return self->_colorBufferWriteMask;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5) {
    return sub_1B64AF894((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = v5;
  sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  int64_t v21 = sub_1B64AF894((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setReadsFromDepthBuffer:(BOOL)a3
{
  if (self->_readsFromDepthBuffer != a3)
  {
    self->_readsFromDepthBuffer = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C5180;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)readsFromDepthBuffer
{
  if (!self->_isPresentationObject) {
    return self->_readsFromDepthBuffer;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    BOOL v21 = sub_1B64AF978((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    material = self->_material;
    return sub_1B64AF978((uint64_t)material, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (id)contents
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  if (self->_diffuse)
  {
    if (!v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_msgSend__setupMaterialProperty_(self, v6, (uint64_t)&self->_diffuse, v8);
  if (v13) {
LABEL_5:
  }
    sub_1B64B0CB4(v13, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
LABEL_6:
  diffuse = self->_diffuse;

  return (id)objc_msgSend_contents(diffuse, v6, v7, v8);
}

- (void)setContents:(id)a3
{
  uint64_t v5 = objc_msgSend_diffuse(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setContents_(v5, v6, (uint64_t)a3, v7);
}

- (void)setDoubleSided:(BOOL)a3
{
  if (self->_doubleSided != a3)
  {
    self->_doubleSided = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C53B0;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"doubleSided", v8);
  }
}

- (BOOL)isDoubleSided
{
  if (!self->_isPresentationObject) {
    return self->_doubleSided;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    char v21 = sub_1B64AF3EC((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    material = self->_material;
    return sub_1B64AF3EC((uint64_t)material, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setCullMode:(int64_t)a3
{
  if (self->_cullMode != a3)
  {
    self->_cullMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C5524;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"cullMode", v8);
  }
}

- (int64_t)cullMode
{
  if (!self->_isPresentationObject) {
    return self->_cullMode;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5) {
    return (int)sub_1B64AF564((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = v5;
  sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  int64_t v21 = (int)sub_1B64AF564((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setFillMode:(unint64_t)a3
{
  if (self->_fillMode != a3)
  {
    self->_fillMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64C5680;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"fillMode", v8);
  }
}

- (unint64_t)fillMode
{
  if (!self->_isPresentationObject) {
    return self->_fillMode;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5) {
    return (int)sub_1B64AF5B0((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = v5;
  sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  unint64_t v21 = (int)sub_1B64AF5B0((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (NSString)description
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p", v7, v5, self);
  uint64_t v12 = objc_msgSend_name(self, v9, v10, v11);
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v8, v20, @" '%@'", v21, v19);
  }
  uint64_t v22 = objc_msgSend_properties(self, v16, v17, v18);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v24)
  {
    uint64_t v28 = v24;
    char v29 = 0;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v22);
        }
        uint64_t v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ((objc_msgSend__hasDefaultValues(v32, v25, v26, v27) & 1) == 0)
        {
          uint64_t v33 = objc_msgSend_propertyName(v32, v25, v26, v27);
          objc_msgSend_appendFormat_(v8, v34, @"\n  %@=%@", v35, v33, v32);
          char v29 = 1;
        }
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v28);
    if (v29) {
      objc_msgSend_appendString_(v8, v25, @"\n", v27);
    }
  }
  objc_msgSend_appendString_(v8, v25, @">", v27);
  return (NSString *)v8;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  uint64_t v6 = NSString;
  uint64_t v7 = objc_msgSend_materialPropertyName(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v6, v8, @"%@.%@", v9, @"commonProfile", v7);
  if (objc_msgSend_isEqualToString_(a3, v11, @"color", v12)
    || objc_msgSend_isEqualToString_(a3, v13, @"contents", v14)
    || objc_msgSend_isEqualToString_(a3, v13, @"content", v14))
  {
    uint64_t v15 = (__CFString *)objc_msgSend_stringByAppendingString_(v10, v13, @".color", v14);
  }
  else
  {
    uint64_t v15 = (__CFString *)objc_msgSend_stringByAppendingFormat_(v10, v13, @".%@", v14, a3);
  }

  return sub_1B6500480(self, v15, v16, v17);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  id result = (id)objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (result)
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      uint64_t v12 = objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v10, (uint64_t)a3, v11);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v12)
      {
        uint64_t v19 = sub_1B64FF504(a4);
        if (v19)
        {
          uint64_t v27 = sub_1B6604CE4(v19, v20, v21, v22, v23, v24, v25, v26);
          uint64_t v31 = objc_msgSend_worldRef(self, v28, v29, v30);
          if (v31)
          {
            uint64_t v39 = v31;
            sub_1B64B0C28(v31, (uint64_t)v32, v33, v34, v35, v36, v37, v38);
            objc_msgSend_begin(VFXTransaction, v40, v41, v42);
            objc_msgSend_setImmediateMode_(VFXTransaction, v43, 1, v44);
            objc_msgSend_setValue_forUndefinedKey_(self, v45, v27, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v46, v47, v48);
            sub_1B64B0CB4(v39, v49, v50, v51, v52, v53, v54, v55);
          }
          else
          {
            objc_msgSend_begin(VFXTransaction, v32, v33, v34);
            objc_msgSend_setImmediateMode_(VFXTransaction, v56, 1, v57);
            objc_msgSend_setValue_forUndefinedKey_(self, v58, v27, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v59, v60, v61);
          }
        }
        else
        {
          sub_1B63F2F54(0, @"Warning: can't prepare shadable animation with path %@", v21, v22, v23, v24, v25, v26, (uint64_t)a3);
        }
      }
    }
    id result = sub_1B6500480(self, (__CFString *)a3, v8, v9);
    if (!result)
    {
      sub_1B63F2F54(16, @"Error: Material : %@ is not an animatable path", v13, v14, v15, v16, v17, v18, (uint64_t)a3);
      return 0;
    }
  }
  return result;
}

- (void)__CFObject
{
  return self->_material;
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
    v22[2] = sub_1B64C5D18;
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
  v12[2] = sub_1B64C5F2C;
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
  v14[2] = sub_1B64C5FF4;
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
    v13[2] = sub_1B64C60D0;
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
    v15[2] = sub_1B64C61B4;
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
    v29[2] = sub_1B64C66F4;
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
  v14[2] = sub_1B64C6850;
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
  v8[2] = sub_1B64C692C;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_setAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_valueForKey_(a3, v9, v14, v10);
        objc_msgSend_setValue_forKey_(self, v16, v15, v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v11);
  }
}

- (void)_copyAttributes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, 0);
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
        uint64_t v15 = objc_msgSend_valueForKey_(a3, v9, v14, v10);
        long long v19 = objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_setValue_forKey_(self, v20, (uint64_t)v19, v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v172[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  uint64_t v13 = objc_msgSend_name(self, v10, v11, v12);
  objc_msgSend_setName_(v4, v14, v13, v15);
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  long long v19 = objc_msgSend_mutableCopy(self->_valuesForUndefinedKeys, v16, v17, v18);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  objc_msgSend__copyAttributes_(v4, v20, (uint64_t)v19, v21);

  objc_msgSend_shininess(self, v22, v23, v24);
  objc_msgSend_setShininess_(v4, v25, v26, v27);
  uint64_t v31 = objc_msgSend_transparencyMode(self, v28, v29, v30);
  objc_msgSend_setTransparencyMode_(v4, v32, v31, v33);
  uint64_t v37 = objc_msgSend_shadingModel(self, v34, v35, v36);
  objc_msgSend_setShadingModel_(v4, v38, v37, v39);
  uint64_t isLitPerPixel = objc_msgSend_isLitPerPixel(self, v40, v41, v42);
  objc_msgSend_setLitPerPixel_(v4, v44, isLitPerPixel, v45);
  uint64_t isDoubleSided = objc_msgSend_isDoubleSided(self, v46, v47, v48);
  objc_msgSend_setDoubleSided_(v4, v50, isDoubleSided, v51);
  uint64_t v55 = objc_msgSend_cullMode(self, v52, v53, v54);
  objc_msgSend_setCullMode_(v4, v56, v55, v57);
  uint64_t v61 = objc_msgSend_program(self, v58, v59, v60);
  objc_msgSend_setProgram_(v4, v62, v61, v63);
  uint64_t v67 = objc_msgSend_avoidsOverLighting(self, v64, v65, v66);
  objc_msgSend_setAvoidsOverLighting_(v4, v68, v67, v69);
  uint64_t v73 = objc_msgSend_fillMode(self, v70, v71, v72);
  objc_msgSend_setFillMode_(v4, v74, v73, v75);
  objc_msgSend_fresnelExponent(self, v76, v77, v78);
  objc_msgSend_setFresnelExponent_(v4, v79, v80, v81);
  uint64_t v85 = objc_msgSend_writesToDepthBuffer(self, v82, v83, v84);
  objc_msgSend_setWritesToDepthBuffer_(v4, v86, v85, v87);
  uint64_t v91 = objc_msgSend_readsFromDepthBuffer(self, v88, v89, v90);
  objc_msgSend_setReadsFromDepthBuffer_(v4, v92, v91, v93);
  uint64_t v97 = objc_msgSend_colorBufferWriteMask(self, v94, v95, v96);
  objc_msgSend_setColorBufferWriteMask_(v4, v98, v97, v99);
  uint64_t v103 = objc_msgSend_blendMode(self, v100, v101, v102);
  objc_msgSend_setBlendMode_(v4, v104, v103, v105);
  objc_msgSend_alphaCutoff(self, v106, v107, v108);
  objc_msgSend_setAlphaCutoff_(v4, v109, v110, v111);
  uint64_t v115 = objc_msgSend_properties(self, v112, v113, v114);
  uint64_t v119 = objc_msgSend_count(v115, v116, v117, v118);
  if (v119)
  {
    uint64_t v123 = v119;
    for (uint64_t i = 0; i != v123; ++i)
    {
      uint64_t v125 = objc_msgSend_objectAtIndex_(v115, v120, i, v122);
      uint64_t v129 = objc_msgSend_propertyName(v125, v126, v127, v128);
      uint64_t v139 = objc_msgSend_propertyWithName_(v4, v130, v129, v131);
      if (!v139 && (byte_1E9DDAF88 & 1) == 0)
      {
        byte_1E9DDAF88 = 1;
        sub_1B63F2F54(16, @"Error: missing target material description", v133, v134, v135, v136, v137, v138, v170);
      }
      objc_msgSend_copyPropertiesFrom_(v139, v132, (uint64_t)v125, v134);
    }
  }
  if (objc_msgSend_behaviorGraph(self, v120, v121, v122))
  {
    v143 = objc_msgSend_behaviorGraph(self, v140, v141, v142);
    id v147 = (id)objc_msgSend_copy(v143, v144, v145, v146);
    objc_msgSend_setBehaviorGraph_(v4, v148, (uint64_t)v147, v149);
    v153 = objc_msgSend_behaviorGraph(v4, v150, v151, v152);
    v157 = objc_msgSend_entityObject(v153, v154, v155, v156);
    uint64_t v171 = objc_msgSend_identifier(self, v158, v159, v160);
    v172[0] = v4;
    uint64_t v162 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v161, (uint64_t)v172, (uint64_t)&v171, 1);
    objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v157, v163, (uint64_t)v4, v162);
  }
  objc_msgSend__copyAnimationsFrom_(v4, v140, (uint64_t)self, v142);
  objc_msgSend_copyShaderModifiersAndLanguageVersionFrom_(v4, v164, (uint64_t)self, v165);
  objc_msgSend_commitImmediate(VFXTransaction, v166, v167, v168);
  return v4;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (__CFXMaterial)materialRefCreateIfNeeded
{
  return self->_material;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  if (self->_isPresentationObject)
  {
    CFStringRef v5 = sub_1B660CA68(self->_material, (CFStringRef)a3, 0);
    if (v5)
    {
      CFStringRef v13 = v5;
      if (sub_1B660F8C4((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
      {
        uint64_t v21 = (double *)sub_1B660F8C4((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        uint64_t v29 = (const char *)sub_1B660FA40((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        uint64_t v33 = (void *)sub_1B6604BA0(v21, v29, v32, v30, v31);
        CFRelease(v13);
        return v33;
      }
      CFRelease(v13);
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v37 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v35, (uint64_t)a3, v36);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);

  return v37;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v10 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v8, (uint64_t)a4, v9);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
    objc_msgSend_willChangeValueForKey_(self, v14, @"customMaterialProperties", v15);
    objc_msgSend_willChangeValueForKey_(self, v16, @"customMaterialAttributes", v17);
    os_unfair_lock_lock(p_valuesForUndefinedKeysLock);
  }
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (a3)
  {
    if (!valuesForUndefinedKeys)
    {
      valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
    }
    objc_msgSend_setObject_forKey_(valuesForUndefinedKeys, v11, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(valuesForUndefinedKeys, v11, (uint64_t)a4, v12);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_didChangeValueForKey_(self, v19, @"customMaterialProperties", v21);
    objc_msgSend_didChangeValueForKey_(self, v22, @"customMaterialAttributes", v23);
  }
  uint64_t v24 = objc_msgSend___CFObject(self, v19, v20, v21);
  objc_opt_class();
  id v27 = a4;
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_unlinkCustomPropertyWithParent_(v10, v25, (uint64_t)self, v26);
    id v27 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_linkCustomPropertyWithParent_andCustomName_(a3, v28, (uint64_t)self, (uint64_t)a4);
    double v32 = (const void *)objc_msgSend_materialProperty(a3, v29, v30, v31);
    if (v32) {
      uint64_t v36 = (uint64_t)CFRetain(v32);
    }
    else {
      uint64_t v36 = 0;
    }
    id v27 = 0;
  }
  else
  {
    uint64_t v36 = sub_1B6604FE8(self, a4);
    if (!v36)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v36 = (uint64_t)sub_1B6604B4C(a3, v57, v58, v59);
        if (!v36) {
          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v36 = 0;
          goto LABEL_20;
        }
        cf[0] = sub_1B64FA004(a3, 0);
        cf[1] = v60;
        uint64_t v36 = sub_1B65623D0(9, 1, v61, v62, v63, v64, v65, v66);
        sub_1B656264C(v36, cf, v67, v68, v69, v70, v71, v72);
        if (!v36) {
          goto LABEL_20;
        }
      }
    }
    if (!v10)
    {
      int v41 = sub_1B65625B4(v36, (uint64_t)v33, v34, v35, v37, v38, v39, v40);
      uint64_t v49 = sub_1B65624DC(v41, v42, v43, v44, v45, v46, v47, v48);
      uint64_t v53 = objc_msgSend_worldRef(self, v50, v51, v52);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = sub_1B64C72C4;
      v74[3] = &unk_1E6142EF0;
      v74[4] = a4;
      v74[5] = v24;
      v74[6] = v49;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v54, v53, (uint64_t)self, v74);
    }
  }
LABEL_20:
  uint64_t v55 = objc_msgSend_worldRef(self, v33, v34, v35);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = sub_1B64C7318;
  v73[3] = &unk_1E6142F18;
  v73[6] = v36;
  v73[7] = v24;
  v73[4] = a4;
  v73[5] = a3;
  objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v56, v55, (uint64_t)self, v27, v73);
}

- (id)customMaterialPropertyNames
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B64C7460;
  v16[3] = &unk_1E6141318;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialProperties
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  uint64_t v15 = objc_msgSend_allKeys(self->_valuesForUndefinedKeys, v12, v13, v14);
  uint64_t v18 = objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_1F0FB59C8, v17);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v29;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v18);
        }
        uint64_t v26 = objc_msgSend_valueForKey_(self->_valuesForUndefinedKeys, v21, *(void *)(*((void *)&v28 + 1) + 8 * v25), v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_addObject_(v11, v21, v26, v22);
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v23);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributeNames
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B64C7708;
  v16[3] = &unk_1E6141318;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributes
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B64C78F4;
  v16[3] = &unk_1E6141318;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (void)_setupShadableHelperIfNeeded
{
  if (!self->_shadableHelper)
  {
    uint64_t v3 = [VFXShadableHelper alloc];
    self->_shadableHelper = (VFXShadableHelper *)objc_msgSend_initWithOwner_(v3, v4, (uint64_t)self, v5);
  }
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

- (VFXProgram)program
{
  return (VFXProgram *)objc_msgSend_program(self->_shadableHelper, a2, v2, v3);
}

- (void)setShaderModifiers:(id)a3
{
  if (a3) {
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  }
  shadableHelper = self->_shadableHelper;

  objc_msgSend_setShaderModifiers_(shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  if (objc_msgSend_shaderModifiers(a3, a2, (uint64_t)a3, v3)) {
    objc_msgSend__setupShadableHelperIfNeeded(self, v6, v7, v8);
  }
  uint64_t v9 = objc_msgSend___shadableHelper(a3, v6, v7, v8);
  objc_msgSend_copyModifiersFrom_(self->_shadableHelper, v10, (uint64_t)v9, v11);
  uint64_t v16 = objc_msgSend_minimumLanguageVersion(v9, v12, v13, v14);
  shadableHelper = self->_shadableHelper;

  objc_msgSend_setMinimumLanguageVersion_(shadableHelper, v15, v16, v17);
}

- (NSDictionary)shaderModifiers
{
  return (NSDictionary *)objc_msgSend_shaderModifiers(self->_shadableHelper, a2, v2, v3);
}

- (void)setMinimumLanguageVersion:(id)a3
{
  if (a3) {
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  }
  shadableHelper = self->_shadableHelper;

  objc_msgSend_setMinimumLanguageVersion_(shadableHelper, a2, (uint64_t)a3, v3);
}

- (NSNumber)minimumLanguageVersion
{
  return (NSNumber *)objc_msgSend_minimumLanguageVersion(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArguments
{
  return (id)objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArgumentWithName:(id)a3
{
  uint64_t v5 = objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, (uint64_t)a3, v3);

  return (id)objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)a3, v7);
}

- (void)setProgram:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
    shadableHelper = self->_shadableHelper;
    a3 = v5;
  }
  else
  {
    shadableHelper = self->_shadableHelper;
  }

  objc_msgSend_setProgram_(shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
}

- (void)setBehaviorGraph:(id)a3
{
  id v6 = (id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    uint64_t v10 = v6;
    uint64_t v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      uint64_t v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);

      self->_behaviorGraph = (VFXBehaviorGraph *)a3;
      objc_msgSend_wasAddedToWorld_(a3, v15, v14, v16);
    }
    else
    {

      self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    }
    uint64_t v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B64C7C3C;
    v22[3] = &unk_1E6141230;
    v22[4] = self;
    v22[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  id result = self->_behaviorGraph;
  if (self->_isPresentationObject) {
    return (VFXBehaviorGraph *)((uint64_t (*)(VFXBehaviorGraph *, char *))MEMORY[0x1F4181798])(result, sel_presentationBehaviorGraph);
  }
  return result;
}

- (void)_customDecodingOfVFXMaterial:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_setWithObject_(v5, v7, v6, v8);
  uint64_t v10 = sub_1B64FB420();
  uint64_t v12 = objc_msgSend_vfx_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(a3, v11, v9, v10, @"valuesForUndefinedKeys");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = (id)objc_msgSend_mutableCopy(v12, v13, v14, v15);
    objc_msgSend__setAttributes_(self, v16, (uint64_t)v17, v18);
  }
}

- (void)_customEncodingOfVFXMaterial:(id)a3
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)valuesForUndefinedKeys, @"valuesForUndefinedKeys");
  }

  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (self->_isPresentationObject) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXMaterial_(self, a2, (uint64_t)a3, v3);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = objc_msgSend_builtinProperties(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v51, (uint64_t)v55, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ((objc_msgSend__hasDefaultValues(v18, v12, v13, v14) & 1) == 0)
        {
          uint64_t v19 = objc_msgSend_propertyName(v18, v12, v13, v14);
          objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)v18, v19);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v51, (uint64_t)v55, 16);
    }
    while (v15);
  }
  uint64_t name = self->_name;
  objc_opt_class();
  sub_1B64FBEF4(a3, (const char *)name);
  *(float *)&double v22 = self->_shininess;
  objc_msgSend_encodeFloat_forKey_(a3, v23, @"shininess", v24, v22);
  if (self->_alphaCutoff != -1.0) {
    objc_msgSend_encodeFloat_forKey_(a3, v25, @"alphaCutoff", v26);
  }
  *(float *)&double v27 = self->_indexOfRefraction;
  objc_msgSend_encodeFloat_forKey_(a3, v25, @"indexOfRefraction", v26, v27);
  *(float *)&double v28 = self->_fresnelExponent;
  objc_msgSend_encodeFloat_forKey_(a3, v29, @"fresnelExponent", v30, v28);
  objc_msgSend_encodeInteger_forKey_(a3, v31, self->_transparencyMode, @"transparencyMode");
  unint64_t shadingModel = self->_shadingModel;
  if (shadingModel) {
    objc_msgSend_encodeInteger_forKey_(a3, v32, shadingModel, @"shadingModel");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v32, self->_cullMode, @"cullMode");
  shadableHelper = self->_shadableHelper;
  if (shadableHelper) {
    objc_msgSend_encodeObject_forKey_(a3, v34, (uint64_t)shadableHelper, @"shadableHelper");
  }
  objc_msgSend_encodeBool_forKey_(a3, v34, self->_litPerPixel, @"litPerPixel");
  objc_msgSend_encodeBool_forKey_(a3, v36, self->_doubleSided, @"doubleSided");
  objc_msgSend_encodeBool_forKey_(a3, v37, self->_avoidsOverLighting, @"avoidsOverLighting");
  objc_msgSend_encodeBool_forKey_(a3, v38, self->_writesToDepthBuffer, @"writesToDepthBuffer");
  objc_msgSend_encodeBool_forKey_(a3, v39, self->_readsFromDepthBuffer, @"readsFromDepthBuffer");
  objc_msgSend_encodeInteger_forKey_(a3, v40, self->_colorBufferWriteMask, @"colorBufferWriteMask");
  objc_msgSend_encodeInteger_forKey_(a3, v41, qword_1B6E512F8[self->_fillMode], @"fillMode");
  objc_msgSend_encodeInteger_forKey_(a3, v42, self->_blendMode, @"blendMode");
  *(float *)&double v43 = self->_selfIlluminationOcclusion;
  objc_msgSend_encodeFloat_forKey_(a3, v44, @"selfIlluminationOcclusion", v45, v43);
  behaviorGraph = self->_behaviorGraph;
  if (behaviorGraph) {
    objc_msgSend_encodeObject_forKey_(a3, v46, (uint64_t)behaviorGraph, @"behaviorGraph");
  }
  sub_1B64FAB54(a3, self, (uint64_t)behaviorGraph, v47);
  sub_1B64FAEBC(a3, self, v49, v50);
}

- (VFXMaterial)initWithCoder:(id)a3
{
  v193.receiver = self;
  v193.super_class = (Class)VFXMaterial;
  uint64_t v7 = [(VFXMaterial *)&v193 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v11 = sub_1B64AED1C();
    v7->_material = (__CFXMaterial *)v11;
    if (v11) {
      sub_1B6583684(v11, v7, v13, v14, v15, v16, v17, v18);
    }
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    v7->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__customDecodingOfVFXMaterial_(v7, v19, (uint64_t)a3, v20);
    if (objc_msgSend_containsValueForKey_(a3, v21, @"diffuse", v22))
    {
      uint64_t v25 = objc_opt_class();
      v7->_diffuse = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, @"diffuse");
    }
    if (objc_msgSend_containsValueForKey_(a3, v23, @"specular", v24))
    {
      uint64_t v29 = objc_opt_class();
      v7->_specular = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, @"specular");
    }
    if (objc_msgSend_containsValueForKey_(a3, v27, @"emission", v28))
    {
      uint64_t v33 = objc_opt_class();
      v7->_emission = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, @"emission");
    }
    if (objc_msgSend_containsValueForKey_(a3, v31, @"transparent", v32))
    {
      uint64_t v37 = objc_opt_class();
      v7->_transparent = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, @"transparent");
    }
    if (objc_msgSend_containsValueForKey_(a3, v35, @"reflective", v36))
    {
      uint64_t v41 = objc_opt_class();
      v7->_reflective = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, @"reflective");
    }
    if (objc_msgSend_containsValueForKey_(a3, v39, @"multiply", v40))
    {
      uint64_t v45 = objc_opt_class();
      v7->_multiply = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v46, v45, @"multiply");
    }
    if (objc_msgSend_containsValueForKey_(a3, v43, @"normal", v44))
    {
      uint64_t v49 = objc_opt_class();
      v7->_normal = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v50, v49, @"normal");
    }
    if (objc_msgSend_containsValueForKey_(a3, v47, @"ambientOcclusion", v48))
    {
      uint64_t v53 = objc_opt_class();
      v7->_ambientOcclusion = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, @"ambientOcclusion");
    }
    if (objc_msgSend_containsValueForKey_(a3, v51, @"selfIllumination", v52))
    {
      uint64_t v57 = objc_opt_class();
      v7->_selfIllumination = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v58, v57, @"selfIllumination");
    }
    if (objc_msgSend_containsValueForKey_(a3, v55, @"metalness", v56))
    {
      uint64_t v61 = objc_opt_class();
      v7->_metalness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v62, v61, @"metalness");
    }
    if (objc_msgSend_containsValueForKey_(a3, v59, @"roughness", v60))
    {
      uint64_t v65 = objc_opt_class();
      v7->_roughness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v66, v65, @"roughness");
    }
    if (objc_msgSend_containsValueForKey_(a3, v63, @"displacement", v64))
    {
      uint64_t v69 = objc_opt_class();
      v7->_displacement = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v70, v69, @"displacement");
    }
    if (objc_msgSend_containsValueForKey_(a3, v67, @"clearCoat", v68))
    {
      uint64_t v73 = objc_opt_class();
      v7->_clearCoat = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, @"clearCoat");
    }
    if (objc_msgSend_containsValueForKey_(a3, v71, @"clearCoatRoughness", v72))
    {
      uint64_t v77 = objc_opt_class();
      v7->_clearCoatRoughness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v78, v77, @"clearCoatRoughness");
    }
    if (objc_msgSend_containsValueForKey_(a3, v75, @"clearCoatNormal", v76))
    {
      uint64_t v81 = objc_opt_class();
      v7->_clearCoatNormal = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v82, v81, @"clearCoatNormal");
    }
    if (objc_msgSend_containsValueForKey_(a3, v79, @"subsurface", v80))
    {
      uint64_t v85 = objc_opt_class();
      v7->_subsurface = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v86, v85, @"subsurface");
    }
    if (objc_msgSend_containsValueForKey_(a3, v83, @"subsurfaceRadius", v84))
    {
      uint64_t v89 = objc_opt_class();
      v7->_subsurfaceRadius = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v90, v89, @"subsurfaceRadius");
    }
    if (objc_msgSend_containsValueForKey_(a3, v87, @"alphaCutoff", v88))
    {
      objc_msgSend_decodeFloatForKey_(a3, v91, @"alphaCutoff", v92);
      objc_msgSend_setAlphaCutoff_(v7, v93, v94, v95);
    }
    uint64_t v96 = objc_opt_class();
    uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v97, v96, @"name");
    objc_msgSend_setName_(v7, v99, v98, v100);
    objc_msgSend_decodeFloatForKey_(a3, v101, @"shininess", v102);
    objc_msgSend_setShininess_(v7, v103, v104, v105);
    objc_msgSend_decodeFloatForKey_(a3, v106, @"indexOfRefraction", v107);
    objc_msgSend_setIndexOfRefraction_(v7, v108, v109, v110);
    objc_msgSend_decodeFloatForKey_(a3, v111, @"fresnelExponent", v112);
    objc_msgSend_setFresnelExponent_(v7, v113, v114, v115);
    uint64_t v118 = objc_msgSend_decodeIntegerForKey_(a3, v116, @"transparencyMode", v117);
    objc_msgSend_setTransparencyMode_(v7, v119, v118, v120);
    uint64_t v123 = objc_msgSend_decodeIntegerForKey_(a3, v121, @"shadingModel", v122);
    objc_msgSend_setShadingModel_(v7, v124, v123, v125);
    uint64_t v128 = objc_msgSend_decodeIntegerForKey_(a3, v126, @"cullMode", v127);
    objc_msgSend_setCullMode_(v7, v129, v128, v130);
    uint64_t v131 = objc_opt_class();
    uint64_t v133 = (VFXShadableHelper *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v132, v131, @"shadableHelper");
    v7->_shadableHelper = v133;
    if ((VFXMaterial *)objc_msgSend_owner(v133, v134, v135, v136) != v7)
    {

      v7->_shadableHelper = 0;
    }
    uint64_t v139 = objc_msgSend_decodeBoolForKey_(a3, v137, @"litPerPixel", v138);
    objc_msgSend_setLitPerPixel_(v7, v140, v139, v141);
    uint64_t v144 = objc_msgSend_decodeBoolForKey_(a3, v142, @"doubleSided", v143);
    objc_msgSend_setDoubleSided_(v7, v145, v144, v146);
    uint64_t v149 = objc_msgSend_decodeBoolForKey_(a3, v147, @"avoidsOverLighting", v148);
    objc_msgSend_setAvoidsOverLighting_(v7, v150, v149, v151);
    uint64_t v154 = objc_msgSend_decodeBoolForKey_(a3, v152, @"writesToDepthBuffer", v153);
    objc_msgSend_setWritesToDepthBuffer_(v7, v155, v154, v156);
    if (objc_msgSend_containsValueForKey_(a3, v157, @"colorBufferWriteMask", v158))
    {
      uint64_t v161 = objc_msgSend_decodeIntegerForKey_(a3, v159, @"colorBufferWriteMask", v160);
      objc_msgSend_setColorBufferWriteMask_(v7, v162, v161, v163);
    }
    uint64_t v164 = objc_msgSend_decodeBoolForKey_(a3, v159, @"readsFromDepthBuffer", v160);
    objc_msgSend_setReadsFromDepthBuffer_(v7, v165, v164, v166);
    uint64_t v169 = objc_msgSend_decodeIntegerForKey_(a3, v167, @"fillMode", v168);
    uint64_t v172 = 2;
    if (v169 < 2) {
      uint64_t v172 = v169;
    }
    objc_msgSend_setFillMode_(v7, v170, qword_1B6E51308[v172 & ~(v172 >> 63)], v171);
    uint64_t v175 = objc_msgSend_decodeIntegerForKey_(a3, v173, @"blendMode", v174);
    objc_msgSend_setBlendMode_(v7, v176, v175, v177);
    objc_msgSend_decodeFloatForKey_(a3, v178, @"selfIlluminationOcclusion", v179);
    objc_msgSend_setSelfIlluminationOcclusion_(v7, v180, v181, v182);
    if (objc_msgSend_containsValueForKey_(a3, v183, @"behaviorGraph", v184))
    {
      uint64_t v185 = objc_opt_class();
      uint64_t v187 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v186, v185, @"behaviorGraph");
      objc_msgSend_setBehaviorGraph_(v7, v188, v187, v189);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v190, v8, v191);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  LODWORD(v4) = 1.0;
  uint64_t v7 = objc_msgSend_sphereWithRadius_(VFXParametricModel, a2, (uint64_t)a3, v3, v4);
  id v11 = (id)objc_msgSend_copy(self, v8, v9, v10);
  objc_msgSend_setFirstMaterial_(v7, v12, (uint64_t)v11, v13);

  return (id)MEMORY[0x1F4181798](v7, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v14);
}

- (id)debugQuickLookObject
{
  uint64_t v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);

  return (id)MEMORY[0x1F4181798](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  double v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);

  return UIImagePNGRepresentation(v4);
}

- (NSArray)bridgedComponentNames
{
  uint64_t v2 = (void *)sub_1B6E31C18();

  return (NSArray *)v2;
}

@end