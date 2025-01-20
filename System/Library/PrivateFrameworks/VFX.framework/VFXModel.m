@interface VFXModel
+ (BOOL)supportsSecureCoding;
+ (VFXModel)modelWithGeometryRef:(__CFXGeometry *)a3;
+ (VFXModel)modelWithMDLMesh:(id)a3;
+ (VFXModel)modelWithMDLMesh:(id)a3 options:(id)a4 context:(id)a5;
+ (VFXModel)modelWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5;
+ (VFXModel)modelWithMesh:(id)a3;
+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4;
+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5;
+ (id)capsuleWithRadius:(float)a3 height:(float)a4 options:(id)a5;
+ (id)coneWithHeight:(float)a3 topRadius:(float)a4 bottomRadius:(float)a5 options:(id)a6;
+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 cornerRadius:(float)a6 options:(id)a7;
+ (id)cylinderWithRadius:(float)a3 height:(float)a4 options:(id)a5;
+ (id)floorWithOptions:(id)a3;
+ (id)model;
+ (id)morpherWithMDLMesh:(id)a3;
+ (id)planeWithWidth:(float)a3 height:(float)a4 options:(id)a5;
+ (id)presentationModelWithGeometryRef:(__CFXGeometry *)a3;
+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5 options:(id)a6;
+ (id)sphereWithRadius:(float)a3 options:(id)a4;
+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4 options:(id)a5;
+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5 options:(id)a6;
- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_hasFixedBoundingBoxExtrema;
- (BOOL)getBoundingBoxMin:(VFXModel *)self max:(SEL)a2;
- (BOOL)getBoundingSphereCenter:(VFXModel *)self radius:(SEL)a2;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)isPresentationObject;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6;
- (BOOL)wantsAdaptiveSubdivision;
- (NSArray)animationKeys;
- (NSArray)bridgedComponentNames;
- (NSArray)levelsOfDetail;
- (NSArray)materials;
- (NSDictionary)shaderModifiers;
- (NSNumber)minimumLanguageVersion;
- (NSString)description;
- (NSString)name;
- (VFXBehaviorGraph)behaviorGraph;
- (VFXMaterial)firstMaterial;
- (VFXMesh)mesh;
- (VFXMeshElement)edgeCreasesElement;
- (VFXMeshSource)edgeCreasesSource;
- (VFXModel)init;
- (VFXModel)initWithCoder:(id)a3;
- (VFXModel)initWithGeometryRef:(__CFXGeometry *)a3;
- (VFXModelTessellator)tessellator;
- (VFXProgram)program;
- (__CFXAnimationManager)animationManager;
- (__CFXGeometry)geometryRef;
- (__CFXMaterial)materialRef;
- (__CFXMaterial)materialRefCreateIfNeeded;
- (__CFXWorld)worldRef;
- (double)boundingBox;
- (id)__shadableHelper;
- (id)_fetchMesh;
- (id)_firstMaterial;
- (id)_geometryByRemovingSkinnerSources;
- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(float)a3;
- (id)_geometryByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4;
- (id)_materialWithName:(id)a3;
- (id)_renderableCopy;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customMaterialAttributeNames;
- (id)customMaterialAttributes;
- (id)customMaterialProperties;
- (id)customMaterialPropertyNames;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3;
- (id)getBoundingBox;
- (id)getBoundingSphere;
- (id)identifier;
- (id)initPresentationModelWithGeometryRef:(__CFXGeometry *)a3;
- (id)interleavedCopy;
- (id)keyForNodeAttributes;
- (id)materialWithName:(id)a3;
- (id)modelDescription;
- (id)modelElementAtIndex:(int64_t)a3;
- (id)modelElements;
- (id)modelSourceChannels;
- (id)modelSources;
- (id)modelSourcesForSemantic:(id)a3;
- (id)mutableMaterials;
- (id)objectInMaterialsAtIndex:(unint64_t)a3;
- (id)presentationModel;
- (id)shaderModifiersArgumentWithName:(id)a3;
- (id)shaderModifiersArguments;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (int64_t)modelElementCount;
- (uint64_t)__createCFObject;
- (uint64_t)setBoundingBox:(float32x4_t)a3;
- (unint64_t)countOfMaterials;
- (unint64_t)subdivisionLevel;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_copyAttributesTo:(id)a3;
- (void)_customDecodingOfVFXModel:(id)a3;
- (void)_customEncodingOfVFXModel:(id)a3;
- (void)_discardOriginalTopology;
- (void)_expand;
- (void)_meshChanged;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_removeAllMaterials;
- (void)_setAttributes:(id)a3;
- (void)_setGeometryRef:(__CFXGeometry *)a3;
- (void)_setupObjCModelFrom:(id)a3;
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
- (void)enumerateDependencies:(id)a3;
- (void)insertMaterial:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4;
- (void)makeUniqueID;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAllMaterials;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)removeMaterial:(id)a3;
- (void)removeMaterialAtIndex:(unint64_t)a3;
- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3;
- (void)removeWorldReference:(id)a3;
- (void)replaceMaterial:(id)a3 with:(id)a4;
- (void)replaceMaterialAtIndex:(unint64_t)a3 withMaterial:(id)a4;
- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setBehaviorGraph:(id)a3;
- (void)setBoundingBoxMin:(VFXModel *)self max:(SEL)a2;
- (void)setEdgeCreasesElement:(id)a3;
- (void)setEdgeCreasesSource:(id)a3;
- (void)setFirstMaterial:(id)a3;
- (void)setGeometryRef:(__CFXGeometry *)a3;
- (void)setIdentifier:(id)a3;
- (void)setLevelsOfDetail:(id)a3;
- (void)setMaterials:(id)a3;
- (void)setMesh:(id)a3;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setProgram:(id)a3;
- (void)setShaderModifiers:(id)a3;
- (void)setSubdivisionLevel:(unint64_t)a3;
- (void)setTessellator:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5;
- (void)setWantsAdaptiveSubdivision:(BOOL)a3;
- (void)set_subdivisionSettings:(id)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXModel

- (uint64_t)__createCFObject
{
  if (qword_1EB9954B8 != -1) {
    dispatch_once(&qword_1EB9954B8, &unk_1F0FB5548);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB9954C0, 0xC0uLL);
  *(void *)(v0 + 80) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + 104) = 0;
  *(unsigned char *)(v0 + 200) = 0;
  sub_1B647F1B0(v0);
  return v0;
}

+ (VFXModel)modelWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5
{
  v5 = 0;
  if (a3 && a4)
  {
    if (objc_msgSend_indexCount(a4, a2, (uint64_t)a3, (uint64_t)a4))
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v12 = (char *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v15 = objc_msgSend_modelElementWithMDLSubmesh_(VFXMeshElement, v13, (uint64_t)a4, v14);
      if (v15) {
        objc_msgSend_addObject_(v9, v16, v15, v18);
      }
      uint64_t v19 = objc_msgSend_material(a4, v16, v17, v18);
      if (v19)
      {
        uint64_t v22 = objc_msgSend_materialWithMDLMaterial_options_(VFXMaterial, v20, v19, (uint64_t)a5);
        if (v22) {
          objc_msgSend_addObject_(v10, v23, v22, v21);
        }
      }
      v62[0] = 0;
      v62[1] = 0;
      v60[1] = 0;
      v61 = v62;
      v59 = (uint64_t *)v60;
      v60[0] = 0;
      sub_1B646CBBC(a4, (char *)&v61, &v59, v21);
      sub_1B646CD68(v11, v12, a3, (uint64_t)a5);
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      sub_1B646CF8C((uint64_t)v11, (uint64_t)&v59, a3, v24);
      sub_1B646D150((uint64_t)&v61, (char *)&v58, &v57, v25);
      v27 = objc_msgSend_meshWithSources_elements_(VFXMesh, v26, (uint64_t)v11, (uint64_t)v9);
      uint64_t v31 = objc_msgSend_name(a3, v28, v29, v30);
      objc_msgSend_setName_(v27, v32, v31, v33);
      v5 = (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v34, (uint64_t)v27, v35);
      uint64_t v39 = objc_msgSend_name(a3, v36, v37, v38);
      objc_msgSend_setName_(v5, v40, v39, v41);
      uint64_t v45 = objc_msgSend_name(v5, v42, v43, v44);
      objc_msgSend_setName_(v27, v46, v45, v47);
      objc_msgSend_setSubdivisionLevel_(v5, v48, 0, v49);
      objc_msgSend_setEdgeCreasesElement_(v5, v50, v57, v51);
      objc_msgSend_setEdgeCreasesSource_(v5, v52, v58, v53);
      objc_msgSend_setMaterials_(v5, v54, (uint64_t)v10, v55);

      sub_1B643670C((uint64_t)&v59, v60[0]);
      sub_1B643670C((uint64_t)&v61, v62[0]);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (VFXModel)modelWithMDLMesh:(id)a3
{
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, v3);

  return (VFXModel *)objc_msgSend_modelWithMDLMesh_options_context_(a1, v6, (uint64_t)a3, 0, v7);
}

+ (VFXModel)modelWithMDLMesh:(id)a3 options:(id)a4 context:(id)a5
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v151 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v147 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  obuint64_t j = (char *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v167[0] = 0;
  v167[1] = 0;
  uint64_t v165 = 0;
  v166 = v167;
  v163 = (uint64_t *)&v164;
  v164 = 0;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v152 = a3;
  id v10 = objc_msgSend_submeshes(a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v159, (uint64_t)v169, 16);
  if (!v15) {
    goto LABEL_20;
  }
  uint64_t v16 = *(void *)v160;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v160 != v16) {
        objc_enumerationMutation(v10);
      }
      uint64_t v18 = *(void **)(*((void *)&v159 + 1) + 8 * i);
      if (objc_msgSend_indexCount(v18, v12, v13, v14, v147))
      {
        uint64_t v20 = objc_msgSend_modelElementWithMDLSubmesh_(VFXMeshElement, v12, (uint64_t)v18, v14);
        if (v20) {
          objc_msgSend_addObject_(v151, v19, v20, v21);
        }
        uint64_t v22 = objc_msgSend_material(v18, v19, v20, v21);
        uint64_t v26 = (uint64_t)v22;
        if (v22)
        {
          uint64_t v28 = objc_msgSend_name(v22, v23, v24, v25);
          if (v28)
          {
            uint64_t v29 = objc_msgSend_valueForKey_(a5, v23, v28, v27);
            if (v29)
            {
LABEL_15:
              objc_msgSend_setValue_forKey_(a5, v23, v29, v28);
              goto LABEL_16;
            }
          }
          uint64_t v29 = objc_msgSend_materialWithMDLMaterial_options_(VFXMaterial, v23, v26, (uint64_t)a4);
          if (v29)
          {
            if (v28) {
              goto LABEL_15;
            }
LABEL_16:
            objc_msgSend_addObject_(v149, v23, v29, v25);
          }
        }
        objc_msgSend_topology(v18, v23, v24, v25);
        sub_1B646CBBC(v18, (char *)&v166, &v163, v30);
        continue;
      }
    }
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v159, (uint64_t)v169, 16);
  }
  while (v15);
LABEL_20:
  uint64_t v31 = v147;
  v32 = v152;
  sub_1B646CD68(v147, obj, v152, (uint64_t)a4);
  uint64_t v157 = 0;
  uint64_t v158 = 0;
  sub_1B646CF8C((uint64_t)v147, (uint64_t)&v163, v152, v33);
  sub_1B646D150((uint64_t)&v166, (char *)&v158, &v157, v34);
  uint64_t v38 = objc_msgSend_submeshes(v152, v35, v36, v37);
  if (objc_msgSend_count(v38, v39, v40, v41))
  {
    unsigned int v45 = 0;
    uint64_t v46 = *MEMORY[0x1E4F35B90];
    while (1)
    {
      uint64_t v47 = objc_msgSend_vertexDescriptor(v152, v42, v43, v44, v147);
      uint64_t v51 = objc_msgSend_attributes(v47, v48, v49, v50);
      if (objc_msgSend_count(v51, v52, v53, v54) <= (unint64_t)v45) {
        break;
      }
      uint64_t v58 = objc_msgSend_vertexDescriptor(v152, v55, v56, v57);
      v62 = objc_msgSend_attributes(v58, v59, v60, v61);
      v65 = objc_msgSend_objectAtIndexedSubscript_(v62, v63, v45, v64);
      v69 = objc_msgSend_name(v65, v66, v67, v68);
      if (objc_msgSend_containsString_(v69, v70, v46, v71)) {
        goto LABEL_28;
      }
      ++v45;
    }
    unsigned int v45 = 0;
LABEL_28:
    id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v153, (uint64_t)v168, 16);
    if (v85)
    {
      uint64_t v86 = *(void *)v154;
      do
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v154 != v86) {
            objc_enumerationMutation(obj);
          }
          v88 = *(void **)(*((void *)&v153 + 1) + 8 * j);
          unint64_t v89 = objc_msgSend_unsignedLongValue(v88, v82, v83, v84);
          v93 = objc_msgSend_submeshes(v152, v90, v91, v92);
          v96 = objc_msgSend_objectAtIndexedSubscript_(v93, v94, 0, v95);
          v100 = objc_msgSend_faceIndexing(v96, v97, v98, v99);
          if (v89 >= objc_msgSend_count(v100, v101, v102, v103))
          {
            uint64_t v121 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v104, v45, v106);
          }
          else
          {
            v107 = objc_msgSend_submeshes(v152, v104, v105, v106);
            v110 = objc_msgSend_objectAtIndexedSubscript_(v107, v108, 0, v109);
            v114 = objc_msgSend_faceIndexing(v110, v111, v112, v113);
            uint64_t v118 = objc_msgSend_integerValue(v88, v115, v116, v117);
            uint64_t v121 = objc_msgSend_objectAtIndexedSubscript_(v114, v119, v118, v120);
          }
          objc_msgSend_addObject_(v80, v122, v121, v123);
        }
        uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v82, (uint64_t)&v153, (uint64_t)v168, 16);
      }
      while (v85);
    }
    uint64_t v31 = v147;
    v32 = v152;
    if (v165)
    {
      uint64_t v124 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v82, v45, v84);
      objc_msgSend_addObject_(v80, v125, v124, v126);
    }
    v73 = objc_msgSend_meshWithSources_elements_sourceChannels_(VFXMesh, v82, (uint64_t)v147, (uint64_t)v151, v80);

    uint64_t v76 = objc_msgSend_modelWithMesh_(VFXModel, v127, (uint64_t)v73, v128, v147);
  }
  else
  {
    v73 = objc_msgSend_meshWithSources_elements_(VFXMesh, v42, (uint64_t)v147, (uint64_t)v151);
    uint64_t v76 = objc_msgSend_modelWithMesh_(VFXModel, v74, (uint64_t)v73, v75, v147);
  }
  v72 = (VFXModel *)v76;
  uint64_t v129 = objc_msgSend_name(v32, v77, v78, v79);
  objc_msgSend_setName_(v72, v130, v129, v131);
  uint64_t v135 = objc_msgSend_name(v72, v132, v133, v134);
  objc_msgSend_setName_(v73, v136, v135, v137);
  objc_msgSend_setSubdivisionLevel_(v72, v138, 0, v139);
  objc_msgSend_setEdgeCreasesElement_(v72, v140, v157, v141);
  objc_msgSend_setEdgeCreasesSource_(v72, v142, v158, v143);
  objc_msgSend_setMaterials_(v72, v144, (uint64_t)v149, v145);

  sub_1B643670C((uint64_t)&v163, v164);
  sub_1B643670C((uint64_t)&v166, v167[0]);
  return v72;
}

+ (id)morpherWithMDLMesh:(id)a3
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_vertexDescriptor(a3, a2, (uint64_t)a3, v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v11 = objc_msgSend_attributes(v5, v8, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v131, (uint64_t)v139, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v132;
    uint64_t v19 = *MEMORY[0x1E4F35B90];
    uint64_t v20 = *MEMORY[0x1E4F35B80];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v132 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v22 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        if (objc_msgSend_format(v22, v14, v15, v16))
        {
          v23 = objc_msgSend_name(v22, v14, v15, v16);
          if (objc_msgSend_containsString_(v23, v24, v19, v25)) {
            objc_msgSend_addObject_(v6, v26, (uint64_t)v22, v28);
          }
          uint64_t v29 = objc_msgSend_name(v22, v26, v27, v28);
          if (objc_msgSend_containsString_(v29, v30, v20, v31)) {
            objc_msgSend_addObject_(v7, v14, (uint64_t)v22, v16);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v131, (uint64_t)v139, 16);
    }
    while (v17);
  }
  if (objc_msgSend_count(v6, v14, v15, v16))
  {
    id v32 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v36 = objc_msgSend_count(v6, v33, v34, v35);
    uint64_t v39 = objc_msgSend_initWithCapacity_(v32, v37, v36, v38);
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v40, (uint64_t)&v127, (uint64_t)v138, 16);
    if (v41)
    {
      uint64_t v43 = v41;
      uint64_t v44 = *(void *)v128;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v128 != v44) {
            objc_enumerationMutation(v6);
          }
          uint64_t v46 = objc_msgSend_geometrySourceWithMDLVertexAttribute_mesh_(VFXMeshSource, v42, *(void *)(*((void *)&v127 + 1) + 8 * j), (uint64_t)a3);
          objc_msgSend_addObject_(v39, v47, v46, v48);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v42, (uint64_t)&v127, (uint64_t)v138, 16);
      }
      while (v43);
    }
    id v49 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v53 = objc_msgSend_count(v7, v50, v51, v52);
    uint64_t v56 = objc_msgSend_initWithCapacity_(v49, v54, v53, v55);
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v57, (uint64_t)&v123, (uint64_t)v137, 16);
    if (v58)
    {
      uint64_t v61 = v58;
      uint64_t v62 = *(void *)v124;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v124 != v62) {
            objc_enumerationMutation(v7);
          }
          uint64_t v64 = objc_msgSend_geometrySourceWithMDLVertexAttribute_mesh_(VFXMeshSource, v59, *(void *)(*((void *)&v123 + 1) + 8 * k), (uint64_t)a3);
          objc_msgSend_addObject_(v56, v65, v64, v66);
        }
        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v59, (uint64_t)&v123, (uint64_t)v137, 16);
      }
      while (v61);
    }
    uint64_t v67 = objc_msgSend_modelWithMDLMesh_(a1, v59, (uint64_t)a3, v60);
    id v68 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v72 = objc_msgSend_count(v39, v69, v70, v71);
    uint64_t v75 = objc_msgSend_initWithCapacity_(v68, v73, v72, v74);
    if (objc_msgSend_count(v6, v76, v77, v78) == 1)
    {
      uint64_t v82 = objc_msgSend_mesh(v67, v79, v80, v81);
      objc_msgSend_addObject_(v75, v83, v82, v84);
    }
    else
    {
      uint64_t v86 = objc_msgSend_count(v39, v79, v80, v81);
      uint64_t v90 = objc_msgSend_count(v56, v87, v88, v89);
      uint64_t v94 = objc_msgSend_count(v39, v91, v92, v93);
      if (v86 == v90)
      {
        if (v94)
        {
          unint64_t v97 = 0;
          do
          {
            v136[0] = objc_msgSend_objectAtIndexedSubscript_(v39, v95, v97, v96);
            v136[1] = objc_msgSend_objectAtIndexedSubscript_(v56, v98, v97, v99);
            uint64_t v101 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v100, (uint64_t)v136, 2);
            uint64_t v103 = objc_msgSend_meshWithSources_elements_(VFXMesh, v102, v101, 0);
            objc_msgSend_addObject_(v75, v104, v103, v105);
            ++v97;
          }
          while (v97 < objc_msgSend_count(v39, v106, v107, v108));
        }
      }
      else if (v94)
      {
        unint64_t v109 = 0;
        do
        {
          uint64_t v135 = objc_msgSend_objectAtIndexedSubscript_(v39, v95, v109, v96);
          uint64_t v111 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v110, (uint64_t)&v135, 1);
          uint64_t v113 = objc_msgSend_meshWithSources_elements_(VFXMesh, v112, v111, 0);
          objc_msgSend_addObject_(v75, v114, v113, v115);
          ++v109;
        }
        while (v109 < objc_msgSend_count(v39, v116, v117, v118));
      }
    }

    v119 = objc_alloc_init(VFXMorpher);
    objc_msgSend_setTargets_(v119, v120, (uint64_t)v75, v121);

    return v119;
  }
  else
  {

    return 0;
  }
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  id v5 = (id)objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_nodeWithModel_(VFXNode, v6, (uint64_t)v5, v7);

  return (id)MEMORY[0x1F4181798](v8, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v9);
}

- (id)debugQuickLookObject
{
  id v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);

  return (id)MEMORY[0x1F4181798](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);

  return UIImagePNGRepresentation(v4);
}

- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5
{
  uint64_t v7 = objc_msgSend_objectForKey_(a5, a2, (uint64_t)a4, (uint64_t)a4);
  if (v7)
  {
    objc_msgSend_setValue_forKey_(self, v8, v7, (uint64_t)a3);
  }
}

+ (id)planeWithWidth:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v7 = objc_msgSend_planeWithWidth_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, @"widthSegmentCount", @"kPrimitiveWidthSegments", a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, @"heightSegmentCount", @"kPrimitiveHeightSegments", a5);
  return v7;
}

+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 cornerRadius:(float)a6 options:(id)a7
{
  uint64_t v9 = objc_msgSend_cubeWithWidth_height_length_chamferRadius_(VFXParametricModel, a2, (uint64_t)a7, v7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v10, @"widthSegmentCount", @"kPrimitiveWidthSegments", a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v11, @"heightSegmentCount", @"kPrimitiveHeightSegments", a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v12, @"lengthSegmentCount", @"kPrimitiveLengthSegments", a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v13, @"chamferSegmentCount", @"kPrimitiveChamferSegments", a7);
  return v9;
}

+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5 options:(id)a6
{
  uint64_t v8 = objc_msgSend_pyramidWithWidth_height_length_(VFXParametricModel, a2, (uint64_t)a6, v6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v9, @"widthSegmentCount", @"kPrimitiveWidthSegments", a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v10, @"heightSegmentCount", @"kPrimitiveHeightSegments", a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v11, @"lengthSegmentCount", @"kPrimitiveLengthSegments", a6);
  return v8;
}

+ (id)sphereWithRadius:(float)a3 options:(id)a4
{
  uint64_t v6 = objc_msgSend_sphereWithRadius_(VFXParametricModel, a2, (uint64_t)a4, v4);
  objc_msgSend_setValueForKey_optionKey_options_(v6, v7, @"segmentCount", @"kPrimitiveRotationSegments", a4);
  uint64_t v10 = objc_msgSend_objectForKey_(a4, v8, @"kPrimitiveSphereType", v9);
  if (v10)
  {
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"kPrimitiveTypeGeosphere", v12);
    objc_msgSend_setGeodesic_(v6, v14, isEqualToString, v15);
  }
  return v6;
}

+ (id)cylinderWithRadius:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v7 = objc_msgSend_cylinderWithRadius_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, @"radialSegmentCount", @"kPrimitiveRotationSegments", a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, @"heightSegmentCount", @"kPrimitiveHeightSegments", a5);
  return v7;
}

+ (id)coneWithHeight:(float)a3 topRadius:(float)a4 bottomRadius:(float)a5 options:(id)a6
{
  *(float *)&double v9 = a4;
  *(float *)&double v10 = a5;
  *(float *)&double v11 = a3;
  uint64_t v12 = objc_msgSend_coneWithTopRadius_bottomRadius_height_(VFXParametricModel, a2, (uint64_t)a6, v6, v9, v10, v11);
  objc_msgSend_setValueForKey_optionKey_options_(v12, v13, @"radialSegmentCount", @"kPrimitiveRotationSegments", a6);
  objc_msgSend_setValueForKey_optionKey_options_(v12, v14, @"heightSegmentCount", @"kPrimitiveHeightSegments", a6);
  return v12;
}

+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5 options:(id)a6
{
  uint64_t v8 = objc_msgSend_tubeWithInnerRadius_outerRadius_height_(VFXParametricModel, a2, (uint64_t)a6, v6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v9, @"radialSegmentCount", @"kPrimitiveRotationSegments", a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v10, @"heightSegmentCount", @"kPrimitiveHeightSegments", a6);
  return v8;
}

+ (id)capsuleWithRadius:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v7 = objc_msgSend_capsuleWithCapRadius_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, @"radialSegmentCount", @"kPrimitiveRotationSegments", a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, @"heightSegmentCount", @"kPrimitiveHeightSegments", a5);
  return v7;
}

+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4 options:(id)a5
{
  uint64_t v7 = objc_msgSend_torusWithRingRadius_pipeRadius_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, @"radialSegmentCount", @"kPrimitiveRotationSegments", a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, @"pipeSegmentCount", @"kPrimitivePipeSegments", a5);
  return v7;
}

+ (id)floorWithOptions:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x1F4181798])(VFXFloor, sel_floor, a3);
}

- (VFXModel)init
{
  v15.receiver = self;
  v15.super_class = (Class)VFXModel;
  uint64_t v2 = [(VFXModel *)&v15 init];
  if (v2)
  {
    uint64_t v3 = -[VFXModel __createCFObject]_0();
    v2->_geometry = (__CFXGeometry *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXModel)initWithGeometryRef:(__CFXGeometry *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)VFXModel;
  uint64_t v4 = [(VFXModel *)&v20 init];
  if (v4)
  {
    uint64_t v5 = (__CFXGeometry *)CFRetain(a3);
    v4->_geometry = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    objc_msgSend_makeUniqueID(v4, v16, v17, v18);
  }
  return v4;
}

- (id)initPresentationModelWithGeometryRef:(__CFXGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXModel;
  uint64_t v4 = [(VFXModel *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_geometry = (__CFXGeometry *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXModel)modelWithMesh:(id)a3
{
  uint64_t v4 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v4, v5, (uint64_t)a3, v6);
  uint64_t v10 = objc_msgSend_material(VFXMaterial, v7, v8, v9);
  objc_msgSend_setFirstMaterial_(v4, v11, v10, v12);

  return v4;
}

+ (VFXModel)modelWithGeometryRef:(__CFXGeometry *)a3
{
  result = (VFXModel *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithGeometryRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXModel *)v9;
  }
  return result;
}

+ (id)model
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)dealloc
{
  geometry = self->_geometry;
  if (geometry)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      sub_1B6583684((uint64_t)geometry, 0, v2, v3, v4, v5, v6, v7);
      geometry = self->_geometry;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B651ABA4;
    v14[3] = &unk_1E6140A18;
    v14[4] = geometry;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v14);
  }
  objc_msgSend_clientWillDie_(self->_tessellator, a2, (uint64_t)self, v3);

  objc_msgSend_ownerWillDie(self->_shadableHelper, v10, v11, v12);
  free(*(void **)self->_fixedBoundingBoxExtrema);
  v13.receiver = self;
  v13.super_class = (Class)VFXModel;
  [(VFXModel *)&v13 dealloc];
}

- (BOOL)isPresentationObject
{
  return *((unsigned char *)self + 16) & 1;
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
      v15[2] = sub_1B651AC84;
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

- (void)_meshChanged
{
  mesh = self->_mesh;
  if (mesh)
  {
    world = self->_world;
    if (world)
    {
      objc_msgSend_removeWorldReference_(mesh, a2, (uint64_t)world, v2);
      mesh = self->_mesh;
    }

    self->_mesh = 0;
  }
}

- (id)_fetchMesh
{
  mesh = self->_mesh;
  if (mesh)
  {
    world = self->_world;
    if (world)
    {
      objc_msgSend_removeWorldReference_(mesh, a2, (uint64_t)world, v3);
      mesh = self->_mesh;
    }

    self->_mesh = 0;
  }
  uint64_t v11 = sub_1B63F4F54(&self->_geometry->var0.var0.var0, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  uint64_t v19 = v11;
  if (v11) {
    sub_1B64B0C28(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  uint64_t v20 = sub_1B63CCE68((uint64_t)self->_geometry, v12, v13, v14, v15, v16, v17, v18);
  if (v20) {
    self->_mesh = (VFXMesh *)(id)objc_msgSend_meshWithMeshRef_(VFXMesh, v21, v20, v23);
  }
  if (v19) {
    sub_1B64B0CB4(v19, (uint64_t)v21, v22, v23, v24, v25, v26, v27);
  }
  id result = self->_mesh;
  if (result)
  {
    uint64_t v29 = self->_world;
    if (v29)
    {
      objc_msgSend_addWorldReference_(result, v21, (uint64_t)v29, v23);
      return self->_mesh;
    }
  }
  return result;
}

- (VFXMesh)mesh
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_mesh;
  }
  uint64_t v10 = sub_1B63CCE68((uint64_t)self->_geometry, (uint64_t)a2, v2, v3, v4, v5, v6, v7);

  return (VFXMesh *)objc_msgSend_meshWithMeshRef_(VFXMesh, v9, v10, v11);
}

- (void)setMesh:(id)a3
{
  mesh = self->_mesh;
  if (mesh != a3)
  {

    self->_mesh = (VFXMesh *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B651B008;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)_syncObjCModel
{
  objc_msgSend__syncEntityObjCModel(self, a2, v2, v3);
  objc_msgSend__fetchMesh(self, v5, v6, v7);
  self->_subdivisionIsAdaptive = sub_1B647F50C((uint64_t)self->_geometry);
  self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)sub_1B647F580((uint64_t)self->_geometry);

  self->_edgeCreasesSource = 0;
  uint64_t v8 = (id *)sub_1B6451064((uint64_t)self->_geometry);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    uint64_t v10 = sub_1B6583674(v8);
    if (v10)
    {
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v12 = [VFXMeshSource alloc];
      uint64_t v11 = (VFXMeshSource *)objc_msgSend_initWithMeshSource_(v12, v13, v9, v14);
    }
    self->_edgeCreasesSource = v11;
  }

  self->_edgeCreasesElement = 0;
  uint64_t v15 = (id *)sub_1B63D0F30((uint64_t)self->_geometry);
  if (v15)
  {
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = sub_1B6583674(v15);
    if (v17)
    {
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v19 = [VFXMeshElement alloc];
      uint64_t v18 = (VFXMeshElement *)objc_msgSend_initWithMeshElement_(v19, v20, v16, v21);
    }
    self->_edgeCreasesElement = v18;
  }
}

- (id)modelDescription
{
  uint64_t v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v14);
  if (v13)
  {
    uint64_t v19 = objc_msgSend_name(self, v15, v16, v17);
    uint64_t v29 = objc_msgSend_mesh(self, v20, v21, v22);
    objc_msgSend_appendFormat_(v5, v23, @"%@: %p '%@' - mesh: %@", v24, v18, self, v19, v29);
  }
  else
  {
    uint64_t v28 = objc_msgSend_mesh(self, v15, v16, v17);
    objc_msgSend_appendFormat_(v5, v25, @"%@: %p - mesh: %@", v26, v18, self, v28);
  }
  return v5;
}

- (NSString)description
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_modelDescription(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v6, @"<%@>", v7, v5);
}

- (__CFXGeometry)geometryRef
{
  return self->_geometry;
}

- (void)_setGeometryRef:(__CFXGeometry *)a3
{
  uint64_t v8 = a3;
  geometry = self->_geometry;
  if (geometry)
  {
    sub_1B6583684((uint64_t)geometry, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
    uint64_t v11 = self->_geometry;
    if (v11 == v8) {
      goto LABEL_10;
    }
    if (v11)
    {
      CFRelease(v11);
      self->_geometry = 0;
    }
    if (!v8) {
      goto LABEL_9;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  uint64_t v8 = (__CFXGeometry *)CFRetain(v8);
LABEL_9:
  self->_geometry = v8;
LABEL_10:
  if (v8)
  {
    sub_1B6583684((uint64_t)v8, self, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
}

- (void)setGeometryRef:(__CFXGeometry *)a3
{
  if (self->_geometry != a3)
  {
    objc_msgSend__setGeometryRef_(self, a2, (uint64_t)a3, v3);
    objc_msgSend__fetchMesh(self, v5, v6, v7);
    objc_msgSend_willChangeValueForKey_(self, v8, @"materials", v9);
    objc_msgSend__removeAllMaterials(self, v10, v11, v12);
    objc_msgSend_didChangeValueForKey_(self, v13, @"materials", v14);
  }
}

- (id)presentationModel
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (id)((uint64_t (*)(__objc2_class *, char *, void))MEMORY[0x1F4181798])(VFXModel, sel_presentationModelWithGeometryRef_, *((void *)self + 1));
  }
  return self;
}

+ (id)presentationModelWithGeometryRef:(__CFXGeometry *)a3
{
  uint64_t v4 = [VFXModel alloc];
  inited = objc_msgSend_initPresentationModelWithGeometryRef_(v4, v5, (uint64_t)a3, v6);

  return inited;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)setBehaviorGraph:(id)a3
{
  if ((id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3) != a3)
  {

    self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B651B440;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  id result = self->_behaviorGraph;
  if (*((unsigned char *)self + 16)) {
    return (VFXBehaviorGraph *)((uint64_t (*)(VFXBehaviorGraph *, char *))MEMORY[0x1F4181798])(result, sel_presentationBehaviorGraph);
  }
  return result;
}

- (BOOL)_hasFixedBoundingBoxExtrema
{
  return *(void *)self->_fixedBoundingBoxExtrema != 0;
}

- (BOOL)getBoundingBoxMin:(VFXModel *)self max:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v7 = *(_OWORD **)self->_fixedBoundingBoxExtrema;
  if (v7 && (*((unsigned char *)self + 16) & 1) == 0)
  {
    if (v2) {
      *uint64_t v2 = *v7;
    }
    if (v3) {
      *uint64_t v3 = *(_OWORD *)(*(void *)self->_fixedBoundingBoxExtrema + 16);
    }
    return 1;
  }
  uint64_t v9 = objc_msgSend_worldRef(self, a2, (uint64_t)v2, (uint64_t)v3);
  uint64_t v17 = v9;
  if (v9) {
    sub_1B64B0C28(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
  }
  if (!objc_msgSend_geometryRef(self, v10, v11, v12))
  {
    char v8 = 0;
    if (!v17) {
      return v8;
    }
    goto LABEL_16;
  }
  DWORD2(v32) = 0;
  *(void *)&long long v32 = 0;
  DWORD2(v31) = 0;
  *(void *)&long long v31 = 0;
  uint64_t v25 = (const void *)objc_msgSend_geometryRef(self, v18, v19, v20);
  char v8 = sub_1B63F493C(v25, 1, (uint64_t)&v32, (uint64_t)&v31, v26, v27, v28, v29);
  if (v5) {
    _OWORD *v5 = v32;
  }
  if (v4) {
    _OWORD *v4 = v31;
  }
  if (v17) {
LABEL_16:
  }
    sub_1B64B0CB4(v17, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
  return v8;
}

- (void)setBoundingBoxMin:(VFXModel *)self max:(SEL)a2
{
  uint64_t v5 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
  if (v2 && (uint64_t v6 = v3) != 0)
  {
    uint64_t v7 = (uint64_t *)v2;
    if (v5)
    {
      int v11 = VFXVector3EqualToVector3(*v2, *v5);
      uint64_t v12 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
      if (v11)
      {
        if (VFXVector3EqualToVector3(*v6, v12[1])) {
          return;
        }
        uint64_t v12 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
      }
    }
    else
    {
      uint64_t v12 = (float32x4_t *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
      *(void *)self->_fixedBoundingBoxExtrema = v12;
    }
    float32x4_t *v12 = *(float32x4_t *)v7;
    *(float32x4_t *)(*(void *)self->_fixedBoundingBoxExtrema + 16) = *v6;
    uint64_t v18 = objc_msgSend_worldRef(self, v8, v9, v10, v6->i64[0], v6->i64[1], *v7, v7[1]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B651B748;
    v22[3] = &unk_1E6143058;
    long long v23 = v21;
    long long v24 = v20;
    uint64_t v25 = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v22);
  }
  else if (v5)
  {
    free(v5);
    *(void *)self->_fixedBoundingBoxExtrema = 0;
    uint64_t v16 = objc_msgSend_worldRef(self, v13, v14, v15);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B651B738;
    v26[3] = &unk_1E61411E0;
    v26[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v26);
  }
}

- (double)boundingBox
{
  int8x16_t v4 = 0u;
  long long v5 = 0u;
  if (objc_msgSend_getBoundingBoxMin_max_(a1, a2, (uint64_t)&v4, (uint64_t)&v5)) {
    unsigned int v2 = -1;
  }
  else {
    unsigned int v2 = 0;
  }
  *(void *)&double result = vbslq_s8((int8x16_t)vdupq_n_s32(v2), v4, (int8x16_t)VFXNullBoundingBox).u64[0];
  return result;
}

- (uint64_t)setBoundingBox:(float32x4_t)a3
{
  float32x4_t v6 = a2;
  float32x4_t v7 = a3;
  if (!VFXBoundingBoxIsNull(a2, a3)) {
    return objc_msgSend_setBoundingBoxMin_max_(a1, v4, (uint64_t)&v6, (uint64_t)&v7);
  }

  return objc_msgSend_setBoundingBoxMin_max_(a1, v4, 0, 0);
}

- (BOOL)getBoundingSphereCenter:(VFXModel *)self radius:(SEL)a2
{
  int8x16_t v4 = (_DWORD *)v3;
  long long v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v16 = (const void *)objc_msgSend_geometryRef(self, v8, v9, v10);
  long long v26 = 0uLL;
  if (!v16 || !sub_1B63F49F8(v16, 1, (uint64_t)&v26, v19, v20, v21, v22, v23))
  {
    BOOL v24 = 0;
    if (!v15) {
      return v24;
    }
LABEL_12:
    sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v24;
  }
  if (v5) {
    _OWORD *v5 = v26;
  }
  if (v4) {
    _DWORD *v4 = HIDWORD(v26);
  }
  BOOL v24 = 1;
  if (v15) {
    goto LABEL_12;
  }
  return v24;
}

- (id)getBoundingSphere
{
  int v13 = 0;
  double v12 = 0.0;
  int v11 = 0;
  if (!objc_msgSend_getBoundingSphereCenter_radius_(self, a2, (uint64_t)&v12, (uint64_t)&v11)) {
    return 0;
  }
  uint64_t v2 = objc_alloc_init(VFXBoundingSphere);
  objc_msgSend_setCenter_(v2, v3, v4, v5, v12);
  LODWORD(v6) = v11;
  objc_msgSend_setRadius_(v2, v7, v8, v9, v6);
  return v2;
}

- (id)getBoundingBox
{
  objc_msgSend_boundingBox(self, a2, v2, v3);
  double v14 = *(double *)v4.i64;
  double v15 = *(double *)v5.i64;
  v4.i32[3] = 0;
  v5.i32[3] = 0;
  if (VFXBoundingBoxIsNull(v4, v5)) {
    return 0;
  }
  uint64_t v7 = objc_alloc_init(VFXBoundingBox);
  objc_msgSend_setMin_(v7, v8, v9, v10, v14);
  objc_msgSend_setMax_(v7, v11, v12, v13, v15);

  return v7;
}

- (void)_setAttributes:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1B651BA7C;
  v4[3] = &unk_1E6141318;
  v4[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(a3, a2, (uint64_t)v4, v3);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v6, 1, v7);
  uint64_t v11 = objc_msgSend_mesh(a3, v8, v9, v10);
  objc_msgSend_setMesh_(self, v12, v11, v13);
  uint64_t v17 = objc_msgSend_levelsOfDetail(a3, v14, v15, v16);
  objc_msgSend_setLevelsOfDetail_(self, v18, v17, v19);
  uint64_t v23 = objc_msgSend_materials(a3, v20, v21, v22);
  objc_msgSend_setMaterials_(self, v24, v23, v25);
  uint64_t v29 = objc_msgSend_subdivisionLevel(a3, v26, v27, v28);
  objc_msgSend_setSubdivisionLevel_(self, v30, v29, v31);
  uint64_t v35 = objc_msgSend_wantsAdaptiveSubdivision(a3, v32, v33, v34);
  objc_msgSend_setWantsAdaptiveSubdivision_(self, v36, v35, v37);
  unsigned int v41 = objc_msgSend__subdivisionSettings(a3, v38, v39, v40);
  objc_msgSend_set_subdivisionSettings_(self, v42, v41, v43);
  objc_msgSend__copyAnimationsFrom_(self, v44, (uint64_t)a3, v45);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 40);
  uint64_t v46 = (void *)*((void *)a3 + 19);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = sub_1B651BBDC;
  v58[3] = &unk_1E6141318;
  v58[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v46, v47, (uint64_t)v58, v48);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 40);
  uint64_t v52 = objc_msgSend_tessellator(a3, v49, v50, v51);
  objc_msgSend_setTessellator_(self, v53, v52, v54);
  objc_msgSend_commitImmediate(VFXTransaction, v55, v56, v57);
}

- (void)_copyAttributesTo:(id)a3
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v13 = (id)objc_msgSend_mutableCopy(self->_valuesForUndefinedKeys, v6, v7, v8);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend__setAttributes_(a3, v9, (uint64_t)v13, v10);
  objc_msgSend_copyShaderModifiersAndLanguageVersionFrom_(a3, v11, (uint64_t)self, v12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = (const void *)objc_msgSend_geometryRef(self, a2, (uint64_t)a3, v3);
  id v13 = (const void *)sub_1B63CDB74(v5, v6, v7, v8, v9, v10, v11, v12);
  id v14 = objc_alloc((Class)objc_opt_class());
  uint64_t v19 = objc_msgSend_initWithGeometryRef_(v14, v15, (uint64_t)v13, v16);
  if (v13) {
    CFRelease(v13);
  }
  objc_msgSend__setupObjCModelFrom_(v19, v17, (uint64_t)self, v18);
  if (objc_msgSend_behaviorGraph(self, v20, v21, v22))
  {
    long long v26 = objc_msgSend_behaviorGraph(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);
    objc_msgSend_setBehaviorGraph_(v19, v31, v30, v32);
    uint64_t v36 = objc_msgSend_behaviorGraph(v19, v33, v34, v35);
    uint64_t v40 = objc_msgSend_entityObject(v36, v37, v38, v39);
    uint64_t v48 = objc_msgSend_identifier(self, v41, v42, v43);
    v49[0] = v19;
    uint64_t v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v44, (uint64_t)v49, (uint64_t)&v48, 1);
    objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v40, v46, (uint64_t)v19, v45);
  }
  objc_msgSend__copyAttributesTo_(self, v23, (uint64_t)v19, v25);
  return v19;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)enumerateDependencies:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend_materials(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
  }
  (*((void (**)(id, VFXMesh *))a3 + 2))(a3, self->_mesh);
}

- (void)didAttachToWorld:(id)a3
{
  float32x4_t v5 = objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  world = self->_world;

  objc_msgSend_wasAddedToWorld_(v5, v6, (uint64_t)world, v7);
}

- (void)didDetachFromWorld:(id)a3
{
  float32x4_t v5 = objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
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
    v8[2] = sub_1B651C034;
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
        v15[2] = sub_1B651C108;
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

- (id)keyForNodeAttributes
{
  return @"model";
}

- (void)_expand
{
  objc_sync_enter(self);
  objc_msgSend_willChangeValueForKey_(self, v3, @"materials", v4);
  if (self->_materials) {
    sub_1B63F2F54(16, @"Error: leaking materials array", v6, v7, v8, v9, v10, v11, v40);
  }
  uint64_t v12 = objc_msgSend_geometryRef(self, v5, v6, v7);
  uint64_t v20 = (uint64_t)sub_1B63CCEC4(v12, v13, v14, v15, v16, v17, v18, v19);
  id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
  self->_materials = (NSMutableArray *)objc_msgSend_initWithCapacity_(v21, v22, v20, v23);
  if (v20 >= 1)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      uint64_t v28 = objc_msgSend_geometryRef(self, v24, (uint64_t)v25, v26);
      CFArrayRef v25 = sub_1B63CCF34(v28, i, v29, v30, v31, v32, v33, v34);
      if (v25)
      {
        uint64_t v35 = objc_msgSend_materialWithMaterialRef_(VFXMaterial, v24, (uint64_t)v25, v26);
        uint64_t v38 = (uint64_t)v35;
        world = self->_world;
        if (world) {
          objc_msgSend_addWorldReference_(v35, v36, (uint64_t)world, v37);
        }
        objc_msgSend_addObject_(self->_materials, v36, v38, v37);
      }
    }
  }
  objc_msgSend_didChangeValueForKey_(self, v24, @"materials", v26);

  objc_sync_exit(self);
}

- (id)_materialWithName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = objc_msgSend_materials(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v19, (uint64_t)v23, 16);
  if (!v7) {
    return 0;
  }
  uint64_t v11 = v7;
  uint64_t v12 = *(void *)v20;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v20 != v12) {
      objc_enumerationMutation(v5);
    }
    uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
    uint64_t v15 = objc_msgSend_name(v14, v8, v9, v10);
    if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)a3, v17)) {
      return v14;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v11) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)materialWithName:(id)a3
{
  id result = (id)objc_msgSend__materialWithName_(self, a2, (uint64_t)a3, v3);
  if (*((unsigned char *)self + 16))
  {
    return (id)objc_msgSend_presentationMaterial(result, v6, v7, v8);
  }
  return result;
}

- (unint64_t)countOfMaterials
{
  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, v2, v3);
    materials = self->_materials;
  }

  return objc_msgSend_count(materials, a2, v2, v3);
}

- (id)objectInMaterialsAtIndex:(unint64_t)a3
{
  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, a3, v3);
    materials = self->_materials;
  }

  return (id)objc_msgSend_objectAtIndex_(materials, a2, a3, v3);
}

- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, a4, v4, v5, v6, v7, (uint64_t)"child");
  }
  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, (uint64_t)a3, a4);
    materials = self->_materials;
  }
  objc_msgSend_insertObject_atIndex_(materials, a2, (uint64_t)a3, a4);
  world = self->_world;
  if (world) {
    objc_msgSend_addWorldReference_(a3, v12, (uint64_t)world, v13);
  }
  uint64_t v15 = objc_msgSend_worldRef(self, v12, (uint64_t)world, v13);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B651C530;
  v17[3] = &unk_1E6143008;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = a4;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
}

- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3
{
  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, a3, v3);
    materials = self->_materials;
  }
  if (objc_msgSend_count(materials, a2, a3, v3) <= a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. removeObjectFromMaterialsAtIndex: index out of bounds", v8, v9, v10, v11, v12, v13, (uint64_t)"index < [_materials count]");
  }
  if (self->_world)
  {
    uint64_t v14 = objc_msgSend_objectAtIndex_(self->_materials, v7, a3, v9);
    objc_msgSend_removeWorldReference_(v14, v15, (uint64_t)self->_world, v16);
  }
  objc_msgSend_removeObjectAtIndex_(self->_materials, v7, a3, v9);
  uint64_t v20 = objc_msgSend_worldRef(self, v17, v18, v19);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B651C67C;
  v22[3] = &unk_1E61412A8;
  void v22[4] = self;
  v22[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
}

- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!a4) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", a3, 0, v4, v5, v6, v7, (uint64_t)"child");
  }
  if (!self->_materials) {
    objc_msgSend__expand(self, a2, a3, (uint64_t)a4);
  }
  uint64_t v11 = objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B651C794;
  v21[3] = &unk_1E6143008;
  v21[4] = self;
  v21[5] = a4;
  v21[6] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v21);
  world = self->_world;
  if (world)
  {
    objc_msgSend_addWorldReference_(a4, v13, (uint64_t)world, v14);
    uint64_t v18 = objc_msgSend_objectAtIndex_(self->_materials, v16, a3, v17);
    objc_msgSend_removeWorldReference_(v18, v19, (uint64_t)self->_world, v20);
  }
  objc_msgSend_replaceObjectAtIndex_withObject_(self->_materials, v13, a3, (uint64_t)a4);
}

- (NSArray)materials
{
  if (!self->_materials) {
    objc_msgSend__expand(self, a2, v2, v3);
  }
  materials = self->_materials;
  if (*((unsigned char *)self + 16))
  {
    uint64_t v11 = objc_msgSend_count(materials, a2, v2, v3);
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = (NSArray *)(id)objc_msgSend_initWithCapacity_(v12, v13, v11, v14);
    if (v11 >= 1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v19 = objc_msgSend_objectAtIndex_(self->_materials, v15, i, v17);
        uint64_t v23 = objc_msgSend_presentationMaterial(v19, v20, v21, v22);
        objc_msgSend_addObject_(v6, v24, v23, v25);
      }
    }
    uint64_t v10 = objc_msgSend_count(v6, v15, v16, v17);
  }
  else
  {
    uint64_t v6 = (NSArray *)(id)objc_msgSend_copy(materials, a2, v2, v3);
    uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);
  }
  if (v10) {
    return v6;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)mutableMaterials
{
  id result = self->_materials;
  if (!result)
  {
    objc_msgSend__expand(self, a2, v2, v3);
    return self->_materials;
  }
  return result;
}

- (id)_firstMaterial
{
  uint64_t v4 = objc_msgSend_mutableMaterials(self, a2, v2, v3);
  if (!v4) {
    return 0;
  }
  uint64_t v8 = v4;
  if (!objc_msgSend_count(v4, v5, v6, v7)) {
    return 0;
  }

  return (id)objc_msgSend_objectAtIndex_(v8, v9, 0, v10);
}

- (VFXMaterial)firstMaterial
{
  id result = (VFXMaterial *)objc_msgSend__firstMaterial(self, a2, v2, v3);
  if (*((unsigned char *)self + 16))
  {
    return (VFXMaterial *)objc_msgSend_presentationMaterial(result, v6, v7, v8);
  }
  return result;
}

- (void)setFirstMaterial:(id)a3
{
  if (a3)
  {
    uint64_t v6 = objc_msgSend_mutableMaterials(self, a2, (uint64_t)a3, v3);
    if (objc_msgSend_count(v6, v7, v8, v9))
    {
      MEMORY[0x1F4181798](self, sel_replaceObjectInMaterialsAtIndex_withObject_, 0, a3);
    }
    else
    {
      objc_msgSend_insertMaterial_atIndex_(self, v10, (uint64_t)a3, 0);
    }
  }
  else if (objc_msgSend_count(self->_materials, a2, 0, v3))
  {
    MEMORY[0x1F4181798](self, sel_removeMaterialAtIndex_, 0, v11);
  }
}

- (void)insertMaterial:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeMaterial:(id)a3
{
  uint64_t v6 = objc_msgSend_materials(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_indexOfObject_(v6, v7, (uint64_t)a3, v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    MEMORY[0x1F4181798](self, sel_removeObjectFromMaterialsAtIndex_, v9, v10);
  }
}

- (void)removeMaterialAtIndex:(unint64_t)a3
{
}

- (void)replaceMaterialAtIndex:(unint64_t)a3 withMaterial:(id)a4
{
}

- (void)replaceMaterial:(id)a3 with:(id)a4
{
  uint64_t v7 = objc_msgSend_materials(self, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_indexOfObject_(v7, v8, (uint64_t)a3, v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    MEMORY[0x1F4181798](self, sel_replaceObjectInMaterialsAtIndex_withObject_, v10, a4);
  }
}

- (void)_removeAllMaterials
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_world)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    materials = self->_materials;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(materials, a2, (uint64_t)&v10, (uint64_t)v14, 16);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(materials);
          }
          objc_msgSend_removeWorldReference_(*(void **)(*((void *)&v10 + 1) + 8 * i), a2, (uint64_t)self->_world, v3);
        }
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(materials, a2, (uint64_t)&v10, (uint64_t)v14, 16);
      }
      while (v7);
    }
  }
  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)removeAllMaterials
{
  objc_msgSend__removeAllMaterials(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B651CCB8;
  v10[3] = &unk_1E61411E0;
  v10[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  if (!self->_materials) {
    self->_materials = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
}

- (void)setMaterials:(id)a3
{
  objc_msgSend_removeAllMaterials(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_count(a3, v6, v7, v8);
  if (v9)
  {
    uint64_t v12 = v9;
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v14 = objc_msgSend_objectAtIndex_(a3, v10, i, v11);
      objc_msgSend_insertMaterial_atIndex_(self, v15, v14, i);
    }
  }
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BFF0, a2, (uint64_t)&v58, (uint64_t)v62, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v55 = a6;
    uint64_t v56 = a5;
    uint64_t v14 = *(void *)v59;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(&unk_1F103BFF0);
        }
        uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_stringByAppendingString_(v16, v11, @"[", v12);
        if (objc_msgSend_hasPrefix_(a3, v18, (uint64_t)v17, v19))
        {
          uint64_t v21 = objc_msgSend_length(v17, v11, v20, v12);
          uint64_t v25 = objc_msgSend_length(a4, v22, v23, v24);
          uint64_t v27 = objc_msgSend_substringWithRange_(a4, v26, v21, v25 - v21);
          uint64_t v30 = objc_msgSend_rangeOfString_(v27, v28, @"]", v29);
          if (v11 == (const char *)1)
          {
            uint64_t v31 = v30;
            uint64_t v32 = objc_msgSend_substringWithRange_(v27, (const char *)1, 0, v30);
            int v36 = objc_msgSend_intValue(v32, v33, v34, v35);
            uint64_t v39 = objc_msgSend_valueForKey_(self, v37, (uint64_t)v16, v38);
            if (objc_msgSend_count(v39, v40, v41, v42) > (unint64_t)v36)
            {
              uint64_t v46 = objc_msgSend_objectAtIndex_(v39, v11, v36, v12);
              if (v55)
              {
                unint64_t v47 = v21 + v31 + 2;
                if (v47 >= objc_msgSend_length(a4, v43, v44, v45))
                {
                  uint64_t v53 = 0;
                }
                else
                {
                  uint64_t v51 = objc_msgSend_length(a4, v48, v49, v50);
                  uint64_t v53 = objc_msgSend_substringWithRange_(a4, v52, v47, v51 - v47);
                }
                *uint64_t v55 = (id)v53;
              }
              *uint64_t v56 = (id)v46;
              LOBYTE(v10) = 1;
              return v10;
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BFF0, v11, (uint64_t)&v58, (uint64_t)v62, 16);
      uint64_t v13 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v10;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4)) {
    return 0;
  }
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  sub_1B64F9EE8(a3, (char *)&v90, &v89, v7);
  v87 = 0;
  uint64_t v88 = 0;
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v8, v90, (uint64_t)a3, &v87, &v88))
  {
    uint64_t v11 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v87, v9, v88, (uint64_t)a4);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = objc_msgSend_count(v12, v14, v15, v16);
      uint64_t v20 = objc_msgSend_initWithCapacity_(v13, v18, v17 + 1, v19);
      objc_msgSend_addObject_(v20, v21, v90, v22);
      objc_msgSend_addObjectsFromArray_(v20, v23, (uint64_t)v12, v24);

      return v20;
    }
    return 0;
  }
  v87 = objc_msgSend_valueForKey_(self, v9, v90, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v28 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v87, v25, v89, (uint64_t)a4)) != 0)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v33 = objc_msgSend_count(v28, v30, v31, v32);
    uint64_t v20 = objc_msgSend_initWithCapacity_(v29, v34, v33 + 1, v35);
    objc_msgSend_addObject_(v20, v36, v90, v37);
    objc_msgSend_addObjectsFromArray_(v20, v38, (uint64_t)v28, v39);
  }
  else
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      uint64_t v42 = objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v40, (uint64_t)a3, v41);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v42)
      {
        uint64_t v44 = sub_1B64FF504(a4);
        if (v44)
        {
          uint64_t v52 = sub_1B6604CE4(v44, v45, v46, v47, v48, v49, v50, v51);
          uint64_t v56 = objc_msgSend_worldRef(self, v53, v54, v55);
          if (v56)
          {
            uint64_t v64 = v56;
            sub_1B64B0C28(v56, (uint64_t)v57, v58, v59, v60, v61, v62, v63);
            objc_msgSend_begin(VFXTransaction, v65, v66, v67);
            objc_msgSend_setImmediateMode_(VFXTransaction, v68, 1, v69);
            objc_msgSend_setValue_forUndefinedKey_(self, v70, v52, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v71, v72, v73);
            sub_1B64B0CB4(v64, v74, v75, v76, v77, v78, v79, v80);
          }
          else
          {
            objc_msgSend_begin(VFXTransaction, v57, v58, v59);
            objc_msgSend_setImmediateMode_(VFXTransaction, v81, 1, v82);
            objc_msgSend_setValue_forUndefinedKey_(self, v83, v52, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v84, v85, v86);
          }
        }
        else
        {
          sub_1B63F2F54(0, @"Warning: can't prepare shadable animation with path %@", v46, v47, v48, v49, v50, v51, (uint64_t)a3);
        }
      }
    }
    return sub_1B6500480(self, (__CFString *)a3, v26, v27);
  }
  return v20;
}

- (void)setLevelsOfDetail:(id)a3
{
  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail != a3)
  {

    self->_levelsOfDetail = (NSArray *)objc_msgSend_copy(a3, v6, v7, v8);
    uint64_t v11 = objc_msgSend_sortedArrayUsingComparator_(a3, v9, (uint64_t)&unk_1F0FB5BC8, v10);
    uint64_t v15 = objc_msgSend_worldRef(self, v12, v13, v14);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1B651D328;
    v17[3] = &unk_1E6141230;
    v17[4] = v11;
    v17[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
  }
}

- (NSArray)levelsOfDetail
{
  return self->_levelsOfDetail;
}

- (VFXModelTessellator)tessellator
{
  return self->_tessellator;
}

- (void)setTessellator:(id)a3
{
  tessellator = self->_tessellator;
  if (tessellator != a3)
  {
    objc_msgSend_removeClient_(tessellator, a2, (uint64_t)self, v3);

    uint64_t v7 = (VFXModelTessellator *)a3;
    self->_tessellator = v7;
    MEMORY[0x1F4181798](v7, sel_addClient_, self, v8);
  }
}

- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings
{
  return ($DCA043AFB23218D33360BC4455B4EE77)self->_subdivisionSettings;
}

- (void)set_subdivisionSettings:(id)a3
{
  $DCA043AFB23218D33360BC4455B4EE77 v10 = a3;
  if (a3 != *(_DWORD *)&self->_subdivisionSettings)
  {
    self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, *(uint64_t *)&a3.var0, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B651D548;
    v8[3] = &unk_1E6141208;
    v8[4] = self;
    $DCA043AFB23218D33360BC4455B4EE77 v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)subdivisionLevel
{
  return self->_subdivisionLevel;
}

- (void)setSubdivisionLevel:(unint64_t)a3
{
  if (a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v11[10] = v4;
    v11[11] = v5;
    if (self->_subdivisionLevel != a3)
    {
      self->_subdivisionLevel = a3;
      tessellator = self->_tessellator;
      if (tessellator) {
        objc_msgSend_tessellatorValueDidChangeForClient_(tessellator, a2, (uint64_t)self, v3);
      }
      uint64_t v9 = objc_msgSend_worldRef(self, a2, a3, v3);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1B651D66C;
      v11[3] = &unk_1E61412A8;
      v11[4] = self;
      v11[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
    }
  }
}

- (BOOL)wantsAdaptiveSubdivision
{
  return self->_subdivisionIsAdaptive;
}

- (void)setWantsAdaptiveSubdivision:(BOOL)a3
{
  if (self->_subdivisionIsAdaptive != a3)
  {
    self->_subdivisionIsAdaptive = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B651D770;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (VFXMeshElement)edgeCreasesElement
{
  return self->_edgeCreasesElement;
}

- (void)setEdgeCreasesElement:(id)a3
{
  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement != a3)
  {
    if (!a3)
    {
LABEL_5:

      self->_edgeCreasesElement = (VFXMeshElement *)a3;
      uint64_t v16 = objc_msgSend_worldRef(self, v13, v14, v15);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1B651D8B8;
      v18[3] = &unk_1E61411E0;
      v18[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v18);
      return;
    }
    if (objc_msgSend_primitiveType(a3, a2, (uint64_t)a3, v3) == 2)
    {
      edgeCreasesElement = self->_edgeCreasesElement;
      goto LABEL_5;
    }
    sub_1B63F2F54(16, @"Error: Cannot set edge creases element because its primitive type is not VFXMeshPrimitiveTypeLine", v7, v8, v9, v10, v11, v12, v20);
  }
}

- (VFXMeshSource)edgeCreasesSource
{
  return self->_edgeCreasesSource;
}

- (void)setEdgeCreasesSource:(id)a3
{
  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource != a3)
  {
    if (!a3)
    {
LABEL_5:

      self->_edgeCreasesSource = (VFXMeshSource *)a3;
      uint64_t v19 = objc_msgSend_worldRef(self, v16, v17, v18);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1B651DA20;
      v21[3] = &unk_1E61411E0;
      v21[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, (uint64_t)self, v21);
      return;
    }
    uint64_t v7 = objc_msgSend_semantic(a3, a2, (uint64_t)a3, v3);
    if (objc_msgSend_isEqualToString_(v7, v8, @"kGeometrySourceSemanticEdgeCrease", v9))
    {
      edgeCreasesSource = self->_edgeCreasesSource;
      goto LABEL_5;
    }
    sub_1B63F2F54(16, @"Error: Cannot set edge creases source because its semantic is not VFXMeshSourceSemanticEdgeCrease", v10, v11, v12, v13, v14, v15, v23);
  }
}

- (__CFXMaterial)materialRefCreateIfNeeded
{
  uint64_t v4 = objc_msgSend_geometryRef(self, a2, v2, v3);
  uint64_t v12 = (__CFXMaterial *)sub_1B63CD09C((uint64_t)v4);
  if (!v12)
  {
    if ((uint64_t)sub_1B63CCEC4((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11) >= 1
      && (CFArrayRef v19 = sub_1B63CCF34((uint64_t)v4, 0, v13, v14, v15, v16, v17, v18)) != 0)
    {
      uint64_t v27 = (__CFXMaterial *)sub_1B64AEE44((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      uint64_t v27 = (__CFXMaterial *)sub_1B64AED1C();
    }
    uint64_t v12 = v27;
    sub_1B63CE978(v4, v27, v28, v29, v30, v31, v32, v33);
  }
  return v12;
}

- (__CFXMaterial)materialRef
{
  uint64_t v4 = objc_msgSend_geometryRef(self, a2, v2, v3);

  return (__CFXMaterial *)sub_1B63CD09C(v4);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (objc_msgSend_hasPrefix_(a4, a2, @"materials[", (uint64_t)a4))
  {
    uint64_t v10 = 0;
    if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v7, (uint64_t)a4, (uint64_t)a4, &v10, 0)&& v10)
    {
      if (a3) {
        objc_msgSend_replaceMaterial_with_(self, v8, v10, (uint64_t)a3);
      }
      else {
        objc_msgSend_removeMaterial_(self, v8, v10, v9);
      }
    }
  }
  else
  {
    MEMORY[0x1F4181798](self, sel__shadableSetValue_forUndefinedKey_, a3, a4);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v8 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    uint64_t v16 = v8;
    if (v8) {
      sub_1B64B0C28(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v17 = (void *)sub_1B6584D68((uint64_t)self->_geometry, a3, v10, v11, v12, v13, v14, v15);
    uint64_t v7 = v17;
    if (v17)
    {
      uint64_t v25 = (double *)sub_1B6562568((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      uint64_t v33 = (const char *)sub_1B65625B4((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);
      uint64_t v7 = (void *)sub_1B6604BA0(v25, v33, v36, v34, v35);
    }
    if (v16) {
      sub_1B64B0CB4(v16, v18, v19, v20, v21, v22, v23, v24);
    }
    if (v7) {
      return v7;
    }
    CFStringRef v37 = sub_1B660CA68(&self->_geometry->var0.var0.var0, (CFStringRef)a3, 0);
    if (v37)
    {
      CFStringRef v44 = v37;
      if (sub_1B660F8C4((uint64_t)v37, v38, v39, v3, v40, v41, v42, v43))
      {
        uint64_t v52 = (double *)sub_1B660F8C4((uint64_t)v44, v45, v46, v47, v48, v49, v50, v51);
        uint64_t v60 = (const char *)sub_1B660FA40((uint64_t)v44, v53, v54, v55, v56, v57, v58, v59);
        uint64_t v64 = (void *)sub_1B6604BA0(v52, v60, v63, v61, v62);
        CFRelease(v44);
        return v64;
      }
      CFRelease(v44);
    }
  }
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v69 = 0;
  sub_1B64F9EE8(a3, (char *)&v70, &v69, v3);
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v6, v70, (uint64_t)a3, &v71, 0))return v71; {
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  }
  id v68 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v66, (uint64_t)a3, v67);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v68;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
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
    uint64_t v32 = (const void *)objc_msgSend_materialProperty(a3, v29, v30, v31);
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
      v74[2] = sub_1B651E080;
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
  v73[2] = sub_1B651E0D4;
  v73[3] = &unk_1E6142F18;
  v73[6] = v36;
  v73[7] = v24;
  v73[4] = a4;
  v73[5] = a3;
  objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v56, v55, (uint64_t)self, v27, v73);
}

- (id)customMaterialPropertyNames
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B651E21C;
  v16[3] = &unk_1E6141318;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialProperties
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  uint64_t v15 = objc_msgSend_allKeys(self->_valuesForUndefinedKeys, v12, v13, v14);
  uint64_t v18 = objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_1F0FB7008, v17);
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
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B651E4C4;
  v16[3] = &unk_1E6141318;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributes
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B651E5D4;
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

- (void)__CFObject
{
  return self->_geometry;
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
  p_animationsLocuint64_t k = &self->_animationsLock;
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
    v22[2] = sub_1B651EA30;
    v22[3] = &unk_1E61411B8;
    void v22[4] = a3;
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
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B651EC44;
  v12[3] = &unk_1E61411E0;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B651ED0C;
  v14[3] = &unk_1E6141208;
  v14[4] = self;
  float v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B651EDE8;
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
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B651EECC;
    v15[3] = &unk_1E6141258;
    v15[4] = self;
    void v15[5] = a3;
    float v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  p_animationsLocuint64_t k = &self->_animationsLock;
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
    p_animationsLocuint64_t k = &self->_animationsLock;
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
    p_animationsLocuint64_t k = &self->_animationsLock;
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
    v29[2] = sub_1B651F40C;
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
  v14[2] = sub_1B651F568;
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
  v8[2] = sub_1B651F644;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_customEncodingOfVFXModel:(id)a3
{
  if (!self->_materials) {
    objc_msgSend__expand(self, a2, (uint64_t)a3, v3);
  }
  uint64_t v6 = *(double **)self->_fixedBoundingBoxExtrema;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E4F29238], a2, (uint64_t)a3, v3, *v6);
    objc_msgSend_encodeObject_forKey_(a3, v8, v7, @"fixedBoundingBoxExtrema[0]");
    uint64_t v12 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E4F29238], v9, v10, v11, *(double *)(*(void *)self->_fixedBoundingBoxExtrema + 16));
    objc_msgSend_encodeObject_forKey_(a3, v13, v12, @"fixedBoundingBoxExtrema[1]");
  }
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_mesh, @"mesh");
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys) {
    objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)valuesForUndefinedKeys, @"valuesForUndefinedKeys");
  }

  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)_customDecodingOfVFXModel:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_containsValueForKey_(a3, a2, @"fixedBoundingBoxExtrema[0]", v3))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, @"fixedBoundingBoxExtrema[0]");
    objc_msgSend_VFXFloat3Value(v10, v11, v12, v13);
    long long v51 = v14;
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"fixedBoundingBoxExtrema[1]", v51);
    objc_msgSend_VFXFloat3Value(v17, v18, v19, v20);
    long long v52 = v21;
    objc_msgSend_setBoundingBoxMin_max_(self, v22, (uint64_t)&v51, (uint64_t)&v52);
  }
  if ((objc_msgSend_containsValueForKey_(a3, v6, @"kGeometrySourceSemanticVertex", v7) & 1) != 0
    || objc_msgSend_containsValueForKey_(a3, v23, @"kGeometrySourceSemanticPosition", v24))
  {
    uint64_t v27 = objc_alloc_init(VFXMesh);
    objc_msgSend_decodeMeshWithCoder_(v27, v28, (uint64_t)a3, v29);
    objc_msgSend_setMesh_(self, v30, (uint64_t)v27, v31);
  }
  else if (objc_msgSend_containsValueForKey_(a3, v25, @"mesh", v26))
  {
    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v47, v46, @"mesh");
    objc_msgSend_setMesh_(self, v49, v48, v50);
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  uint64_t v36 = objc_msgSend_setWithObject_(v32, v34, v33, v35);
  uint64_t v37 = sub_1B64FB420();
  uint64_t v39 = objc_msgSend_vfx_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(a3, v38, v36, v37, @"valuesForUndefinedKeys");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = (id)objc_msgSend_mutableCopy(v39, v40, v41, v42);
    objc_msgSend__setAttributes_(self, v44, (uint64_t)v43, v45);
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXModel_(self, a2, (uint64_t)a3, v3);
  materials = self->_materials;
  if (materials) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)materials, @"materials");
  }
  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)levelsOfDetail, @"levelsOfDetail");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_subdivisionLevel, @"subdivisionLevel");
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_subdivisionIsAdaptive, @"wantsAdaptiveSubdivision");
  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)edgeCreasesSource, @"edgeCreasesSource");
  }
  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)edgeCreasesElement, @"edgeCreasesElement");
  }
  shadableHelper = self->_shadableHelper;
  if (shadableHelper) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)shadableHelper, @"shadableHelper");
  }
  objc_msgSend_encodeBytes_length_forKey_(a3, v10, (uint64_t)&self->_subdivisionSettings, 4, @"subdivisionSettings");
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)name, @"name");
  }
  sub_1B64FAB54(a3, self, (uint64_t)name, v15);
  sub_1B64FAEBC(a3, self, v17, v18);
  tessellator = self->_tessellator;

  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)tessellator, @"tessellator");
}

- (VFXModel)initWithCoder:(id)a3
{
  v76.receiver = self;
  v76.super_class = (Class)VFXModel;
  uint64_t v7 = [(VFXModel *)&v76 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    *((void *)v7 + 1) = CFObject;
    if (CFObject) {
      sub_1B6583684(CFObject, v7, v16, v17, v18, v19, v20, v21);
    }
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    *((_DWORD *)v7 + 40) = 0;
    objc_msgSend__customDecodingOfVFXModel_(v7, v22, (uint64_t)a3, v23);
    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_containingNestedContainersForKey_(a3, v25, v24, @"materials");
    objc_msgSend_setMaterials_(v7, v27, v26, v28);
    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v30, v29, @"levelsOfDetail");
    objc_msgSend_setLevelsOfDetail_(v7, v32, v31, v33);
    uint64_t v36 = objc_msgSend_decodeIntegerForKey_(a3, v34, @"subdivisionLevel", v35);
    objc_msgSend_setSubdivisionLevel_(v7, v37, v36, v38);
    uint64_t v41 = objc_msgSend_decodeBoolForKey_(a3, v39, @"wantsAdaptiveSubdivision", v40);
    objc_msgSend_setWantsAdaptiveSubdivision_(v7, v42, v41, v43);
    uint64_t v44 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v45, v44, @"edgeCreasesSource");
    objc_msgSend_setEdgeCreasesSource_(v7, v47, v46, v48);
    uint64_t v49 = objc_opt_class();
    uint64_t v51 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v50, v49, @"edgeCreasesElement");
    objc_msgSend_setEdgeCreasesElement_(v7, v52, v51, v53);
    uint64_t v54 = objc_opt_class();
    id v56 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v55, v54, @"shadableHelper");
    *((void *)v7 + 15) = v56;
    if ((char *)objc_msgSend_owner(v56, v57, v58, v59) != v7)
    {

      *((void *)v7 + 15) = 0;
    }
    uint64_t v75 = 0;
    uint64_t v61 = (_DWORD *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v60, @"subdivisionSettings", (uint64_t)&v75);
    if (v75 == 4) {
      *(_DWORD *)(v7 + 97) = *v61;
    }
    uint64_t v62 = objc_opt_class();
    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v63, v62, @"name");
    objc_msgSend_setName_(v7, v65, v64, v66);
    *((_DWORD *)v7 + 14) = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    uint64_t v67 = objc_opt_class();
    uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v68, v67, @"tessellator");
    objc_msgSend_setTessellator_(v7, v70, v69, v71);
    objc_msgSend_setImmediateMode_(VFXTransaction, v72, v8, v73);
  }
  return (VFXModel *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4
{
  uint64_t v5 = objc_msgSend_meshWithSources_elements_(VFXMesh, a2, (uint64_t)a3, (uint64_t)a4);

  return (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v4, v5, v6);
}

+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  uint64_t v6 = objc_msgSend_meshWithSources_elements_sourceChannels_(VFXMesh, a2, (uint64_t)a3, (uint64_t)a4, a5);

  return (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v5, v6, v7);
}

- (id)modelSources
{
  return (id)objc_msgSend_meshSources(self->_mesh, a2, v2, v3);
}

- (id)modelSourcesForSemantic:(id)a3
{
  return (id)objc_msgSend_meshSourcesForSemantic_(self->_mesh, a2, (uint64_t)a3, v3);
}

- (id)modelElements
{
  return (id)objc_msgSend_meshElements(self->_mesh, a2, v2, v3);
}

- (int64_t)modelElementCount
{
  return objc_msgSend_meshElementCount(self->_mesh, a2, v2, v3);
}

- (id)modelElementAtIndex:(int64_t)a3
{
  return (id)objc_msgSend_meshElementAtIndex_(self->_mesh, a2, a3, v3);
}

- (id)modelSourceChannels
{
  return (id)objc_msgSend_meshSourceChannels(self->_mesh, a2, v2, v3);
}

- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(float)a3
{
  uint64_t v7 = objc_msgSend_mesh(self, a2, v3, v4);
  *(float *)&double v8 = a3;
  uint64_t v12 = objc_msgSend__meshByUnifyingNormalsWithCreaseThreshold_(v7, v9, v10, v11, v8);
  uint64_t v15 = objc_msgSend_modelWithMesh_(VFXModel, v13, v12, v14);
  uint64_t v19 = objc_msgSend_materials(self, v16, v17, v18);
  objc_msgSend_setMaterials_(v15, v20, v19, v21);
  return v15;
}

- (id)_geometryByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4
{
  uint64_t v9 = objc_msgSend_mesh(self, a2, v4, v5);
  *(float *)&double v10 = a3;
  *(float *)&double v11 = a4;
  uint64_t v15 = objc_msgSend__meshByWeldingVerticesWithThreshold_normalThreshold_(v9, v12, v13, v14, v10, v11);
  uint64_t v18 = objc_msgSend_modelWithMesh_(VFXModel, v16, v15, v17);
  uint64_t v22 = objc_msgSend_materials(self, v19, v20, v21);
  objc_msgSend_setMaterials_(v18, v23, v22, v24);
  return v18;
}

- (id)_geometryByRemovingSkinnerSources
{
  uint64_t v5 = objc_msgSend_mesh(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__meshByRemovingSkinnerSources(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_modelWithMesh_(VFXModel, v10, v9, v11);
  uint64_t v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v12, v17, v16, v18);
  return v12;
}

- (void)_discardOriginalTopology
{
  uint64_t v4 = objc_msgSend_mesh(self, a2, v2, v3);

  MEMORY[0x1F4181798](v4, sel__discardOriginalTopology, v5, v6);
}

- (id)interleavedCopy
{
  uint64_t v5 = objc_msgSend_mesh(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_interleavedCopy(v5, v6, v7, v8);
  double v10 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v10, v11, (uint64_t)v9, v12);
  uint64_t v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v10, v17, v16, v18);

  return v10;
}

- (id)_renderableCopy
{
  uint64_t v5 = objc_msgSend_mesh(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__renderableCopy(v5, v6, v7, v8);
  double v10 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v10, v11, (uint64_t)v9, v12);
  uint64_t v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v10, v17, v16, v18);

  return v10;
}

- (NSArray)bridgedComponentNames
{
  uint64_t v2 = (void *)sub_1B6E31C18();

  return (NSArray *)v2;
}

@end