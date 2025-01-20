@interface VFXNode
+ (BOOL)supportsSecureCoding;
+ (VFXNode)nodeWithMDLAsset:(id)a3;
+ (VFXNode)nodeWithMDLObject:(id)a3;
+ (VFXNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 worldNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9 context:(id)a10;
+ (VFXNode)nodeWithMDLObject:(id)a3 options:(id)a4 context:(id)a5;
+ (VFXNode)nodeWithModel:(id)a3;
+ (VFXNode)nodeWithNodeRef:(__CFXNode *)a3;
+ (VFXNode)nodeWithSceneKitNode:(id)a3 options:(id)a4;
+ (double)localFront;
+ (double)localRight;
+ (double)localUp;
+ (id)_cloneSharable:(id)a3 remap:(__CFDictionary *)a4;
+ (id)_dumpNodeTree:(id)a3 tab:(id)a4;
+ (id)keyPathsForValuesAffectingEulerAngles;
+ (id)keyPathsForValuesAffectingOrientation;
+ (id)keyPathsForValuesAffectingPosition;
+ (id)keyPathsForValuesAffectingRotation;
+ (id)keyPathsForValuesAffectingScale;
+ (id)keyPathsForValuesAffectingTransform;
+ (id)localFrontValue;
+ (id)localRightValue;
+ (id)localUpValue;
+ (id)node;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5;
- (BOOL)_enumerateChildNodesUsingBlock:(id)a3;
- (BOOL)_isAReference;
- (BOOL)_isEffectivelyHidden;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)canAddChildNode:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)castsShadow;
- (BOOL)editorLocked;
- (BOOL)getBoundingBoxMin:(VFXNode *)self max:(SEL)a2;
- (BOOL)getBoundingSphereCenter:(VFXNode *)self radius:(SEL)a2;
- (BOOL)getFrustum:(id *)a3 withViewport:;
- (BOOL)hasAncestor:(id)a3;
- (BOOL)hasPhysicBody;
- (BOOL)isAuthoring;
- (BOOL)isFocusInteractionEnabled;
- (BOOL)isGizmo;
- (BOOL)isHidden;
- (BOOL)isHiddenOrHasHiddenAncestor;
- (BOOL)isHittable;
- (BOOL)isJoint;
- (BOOL)isPaused;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)isPresentationObject;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (BOOL)rawFloat4ForKey:(id)a3 value:;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)usesDepthPrePass;
- (CGRect)_focusFrameInView:(id)a3;
- (CGRect)frame;
- (NSArray)animationKeys;
- (NSArray)bridgedComponentNames;
- (NSArray)childNodes;
- (NSArray)constraints;
- (NSArray)filters;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)name;
- (UICoordinateSpace)coordinateSpace;
- (UIFocusEnvironment)parentFocusEnvironment;
- (VFXBehaviorGraph)behaviorGraph;
- (VFXCamera)camera;
- (VFXForceField)forceField;
- (VFXLight)light;
- (VFXModel)model;
- (VFXMorpher)morpher;
- (VFXNode)init;
- (VFXNode)initWithCoder:(id)a3;
- (VFXNode)initWithNodeRef:(__CFXNode *)a3;
- (VFXNode)parentNode;
- (VFXNode)presentationNode;
- (VFXParticleEmitter)particleEmitter;
- (VFXPhysicsBody)physicsBody;
- (VFXSkinner)skinner;
- (__CFXAnimationManager)animationManager;
- (__CFXNode)nodeRef;
- (__CFXWorld)worldRef;
- (double)_euler;
- (double)_quaternion;
- (double)boundingBox;
- (double)convertPosition:(void *)a3 fromNode:(uint64_t)a4;
- (double)convertPosition:(void *)a3 toNode:(uint64_t)a4;
- (double)convertTransform:(void *)a3 fromNode:(uint64_t)a4;
- (double)convertVector:(void *)a3 fromNode:(uint64_t)a4;
- (double)convertVector:(void *)a3 toNode:(uint64_t)a4;
- (double)eulerAngles;
- (double)orientation;
- (double)pivot;
- (double)position;
- (double)rotation;
- (double)scale;
- (double)transform;
- (double)worldFront;
- (double)worldOrientation;
- (double)worldPosition;
- (double)worldRight;
- (double)worldTransform;
- (double)worldUp;
- (float)opacity;
- (float32x4_t)convertTransform:(void *)a3 toNode:(uint64_t)a4;
- (float32x4_t)setTransform:(uint64_t)a3;
- (id)__camera;
- (id)__light;
- (id)__model;
- (id)__morpher;
- (id)__skinner;
- (id)_audioPlayers;
- (id)_cloneWithOption:(unint64_t)a3 remapTable:(__CFDictionary *)a4;
- (id)_copyRecursively:(unint64_t)a3 remapOut:(__CFDictionary *)a4;
- (id)_deepCloneWithRemapTableOut:(__CFDictionary *)a3;
- (id)_dumpTree;
- (id)_findComponentWithType:(int64_t)a3;
- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3;
- (id)_valueForSimdVectorKeyPath:(id)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)audioPlayers;
- (id)authoringTargetNode;
- (id)childNodeWithName:(id)a3;
- (id)childNodeWithName:(id)a3 recursively:(BOOL)a4;
- (id)childNodesPassingTest:(id)a3;
- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4;
- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4;
- (id)clone;
- (id)cloneWithOption:(unint64_t)a3;
- (id)convertPositionValue:(id)a3 fromNode:(id)a4;
- (id)convertPositionValue:(id)a3 toNode:(id)a4;
- (id)convertTransformValue:(id)a3 fromNode:(id)a4;
- (id)convertTransformValue:(id)a3 toNode:(id)a4;
- (id)convertVectorValue:(id)a3 fromNode:(id)a4;
- (id)convertVectorValue:(id)a3 toNode:(id)a4;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3;
- (id)deepClone;
- (id)deformers;
- (id)eulerAnglesValue;
- (id)flattenedClone;
- (id)flattenedCopy;
- (id)focusItemsInRect:(CGRect)a3;
- (id)getBoundingBox;
- (id)getBoundingSphere;
- (id)hitTestWithSegmentFrom:(id)a3 toPoint:(id)a4 options:(id)a5;
- (id)hitTestWithSegmentFromPoint:(VFXNode *)self toPoint:(SEL)a2 options:(id)a3;
- (id)identifier;
- (id)initPresentationNodeWithNodeRef:(__CFXNode *)a3;
- (id)jsChildNodesWithAttribute:(id)a3;
- (id)mutableChildNodes;
- (id)objectInAudioPlayersAtIndex:(unint64_t)a3;
- (id)objectInChildNodesAtIndex:(unint64_t)a3;
- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4;
- (id)objectInChildNodesWithName:(id)a3;
- (id)orientationValue;
- (id)particleCollider;
- (id)pivotValue;
- (id)positionValue;
- (id)prefab;
- (id)rotationValue;
- (id)scaleValue;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (id)worldFrontValue;
- (id)worldOrientationValue;
- (id)worldPositionValue;
- (id)worldRightValue;
- (id)worldTransformValue;
- (id)worldUpValue;
- (int64_t)authoringCameraType;
- (int64_t)focusBehavior;
- (int64_t)renderingOrder;
- (int64_t)rotationRepresentation;
- (uint64_t)_setQuaternion:(uint64_t)a3;
- (uint64_t)localRotateBy:(uint64_t)a3;
- (uint64_t)rotateBy:(uint64_t)a3 aroundTarget:(uint64_t)a4;
- (uint64_t)setBoundingBox:(float32x4_t)a3;
- (uint64_t)setWorldOrientation:(uint64_t)a3;
- (uint64_t)setWorldTransform:(uint64_t)a3;
- (unint64_t)categoryBitMask;
- (unint64_t)countOfAudioPlayers;
- (unint64_t)countOfChildNodes;
- (unint64_t)indexOfChildNode:(id)a3;
- (void)__CFObject;
- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3;
- (void)_addSkinnerWithMDLMesh:(id)a3 worldNodes:(id)a4;
- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5;
- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4;
- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10;
- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_copyWithOptions:(unint64_t)a3 to:(id)a4 remap:(__CFDictionary *)a5;
- (void)_customDecodingOfVFXNode:(id)a3;
- (void)_customEncodingOfVFXNode:(id)a3 usePresentationObject:(BOOL)a4;
- (void)_didDecodeVFXNode:(id)a3;
- (void)_dump:(id)a3;
- (void)_encodeNodePropertiesWithCoder:(id)a3;
- (void)_initChildNodesArray;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_reSyncModelTree;
- (void)_removeComponentWithType:(int64_t)a3;
- (void)_removeFromParentNodeWithoutRemovingWorldReference;
- (void)_setAttributes:(id)a3;
- (void)_setComponent:(id)a3 withType:(int64_t)a4;
- (void)_setHasFocusableChild;
- (void)_setParent:(id)a3;
- (void)_setPausedOrPausedByInheritance:(BOOL)a3;
- (void)_setPosition:(VFXNode *)self;
- (void)_setScale:(VFXNode *)self;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateAffine;
- (void)_updateFocusableCache;
- (void)_updateTransform;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)addAudioPlayer:(id)a3;
- (void)addChildNode:(id)a3;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyWithOptions:(unint64_t)a3 to:(id)a4;
- (void)dealloc;
- (void)dump;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChildNodesUsingBlock:(id)a3;
- (void)enumerateHierarchyUsingBlock:(id)a3;
- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4;
- (void)localRotateByValue:(id)a3;
- (void)localTranslateBy:(VFXNode *)self;
- (void)localTranslateByValue:(id)a3;
- (void)lookAt:(VFXNode *)self;
- (void)lookAt:(VFXNode *)self up:(SEL)a2 localFront:;
- (void)lookAtLocation:(id)a3;
- (void)lookAtLocation:(id)a3 up:(id)a4 localFront:(id)a5;
- (void)makeUniqueID;
- (void)modelChanged;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllAudioPlayers;
- (void)removeAllBindings;
- (void)removeAllChilds;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)removeAudioPlayer:(id)a3;
- (void)removeFromParentNode;
- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3;
- (void)removeObjectFromChildNodesAtIndex:(unint64_t)a3;
- (void)replaceChildNode:(id)a3 with:(id)a4;
- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)rotateBy:(id)a3 around:(id)a4;
- (void)setAuthoringCameraType:(int64_t)a3;
- (void)setAuthoringTargetNode:(id)a3;
- (void)setBehaviorGraph:(id)a3;
- (void)setBoundingBoxMin:(VFXNode *)self max:(SEL)a2;
- (void)setCamera:(id)a3;
- (void)setCastsShadow:(BOOL)a3;
- (void)setCategoryBitMask:(unint64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setDeformers:(id)a3;
- (void)setEditorLocked:(BOOL)a3;
- (void)setEulerAngles:(VFXNode *)self;
- (void)setEulerAnglesValue:(id)a3;
- (void)setFilters:(id)a3;
- (void)setFocusBehavior:(int64_t)a3;
- (void)setForceField:(id)a3;
- (void)setGizmo:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHittable:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAuthoring:(BOOL)a3;
- (void)setIsJoint:(BOOL)a3;
- (void)setLight:(id)a3;
- (void)setModel:(id)a3;
- (void)setMorpher:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setOpacity:(float)a3;
- (void)setOrientation:(uint64_t)a3;
- (void)setOrientationValue:(id)a3;
- (void)setParticleCollider:(id)a3;
- (void)setParticleEmitter:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPhysicsBody:(id)a3;
- (void)setPivot:(float32x4_t)a3;
- (void)setPivotValue:(id)a3;
- (void)setPosition:(VFXNode *)self;
- (void)setPositionValue:(id)a3;
- (void)setPrefab:(id)a3;
- (void)setRenderingOrder:(int64_t)a3;
- (void)setRotation:(VFXNode *)self;
- (void)setRotationValue:(id)a3;
- (void)setScale:(VFXNode *)self;
- (void)setScaleValue:(id)a3;
- (void)setSkinner:(id)a3;
- (void)setUsesDepthPrePass:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWorld:(id)a3;
- (void)setWorldOrientationValue:(id)a3;
- (void)setWorldPosition:(VFXNode *)self;
- (void)setWorldPositionValue:(id)a3;
- (void)setWorldTransformValue:(id)a3;
- (void)unbindAnimatablePath:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation VFXNode

- (int64_t)authoringCameraType
{
  id AssociatedObject = objc_getAssociatedObject(self, sel_authoringCameraType);

  return objc_msgSend_integerValue(AssociatedObject, v3, v4, v5);
}

- (void)setAuthoringCameraType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);

  objc_setAssociatedObject(self, sel_authoringCameraType, v5, (void *)0x301);
}

+ (VFXNode)nodeWithMDLAsset:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
        uint64_t v16 = objc_msgSend_nodeWithMDLObject_options_context_(VFXNode, v15, v13, 0, v14);
        objc_msgSend_addChildNode_(v4, v17, v16, v18);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }
  return (VFXNode *)v4;
}

+ (VFXNode)nodeWithMDLObject:(id)a3
{
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, v3);

  return (VFXNode *)objc_msgSend_nodeWithMDLObject_options_context_(a1, v6, (uint64_t)a3, 0, v7);
}

+ (VFXNode)nodeWithMDLObject:(id)a3 options:(id)a4 context:(id)a5
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v12 = objc_msgSend_name(a3, v9, v10, v11);
  objc_msgSend_setName_(v8, v13, v12, v14);
  if (objc_msgSend_transform(a3, v15, v16, v17))
  {
    long long v21 = objc_msgSend_transform(a3, v18, v19, v20);
    objc_msgSend_matrix(v21, v22, v23, v24);
    objc_msgSend_setTransform_(v8, v25, v26, v27);
    objc_msgSend_transform(a3, v28, v29, v30);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v35 = objc_msgSend_transform(a3, v32, v33, v34);
    if (isKindOfClass)
    {
LABEL_5:
      v42 = objc_msgSend_transformAnimation(v35, v36, v37, v38);
      if (v42)
      {
        uint64_t v46 = (uint64_t)v42;
        objc_msgSend_duration(v42, v43, v44, v45);
        if (v48 != 0.0) {
          objc_msgSend_addAnimation_forKey_(v8, v47, v46, @"transform");
        }
      }
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = objc_msgSend_transform(a3, v39, v40, v41);
      goto LABEL_5;
    }
  }
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v52 = objc_msgSend_submeshes(a3, v49, v50, v51);
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v126, (uint64_t)v132, 16);
    if (v54)
    {
      uint64_t v58 = v54;
      int v59 = 0;
      uint64_t v60 = *(void *)v127;
      while (2)
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v127 != v60) {
            objc_enumerationMutation(v52);
          }
          v62 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          if (objc_msgSend_faceIndexing(v62, v55, v56, v57) && objc_msgSend_geometryType(v62, v63, v64, v65) != 5) {
            return 0;
          }
          if (objc_msgSend_faceIndexing(v62, v63, v64, v65)) {
            ++v59;
          }
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v126, (uint64_t)v132, 16);
        if (v58) {
          continue;
        }
        break;
      }
      if (v59 >= 2)
      {
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        obuint64_t j = (id)objc_msgSend_submeshes(a3, v55, v56, v57);
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v93, (uint64_t)&v122, (uint64_t)v131, 16);
        if (v94)
        {
          uint64_t v95 = v94;
          uint64_t v96 = *(void *)v123;
          do
          {
            for (uint64_t j = 0; j != v95; ++j)
            {
              if (*(void *)v123 != v96) {
                objc_enumerationMutation(obj);
              }
              uint64_t v98 = *(void *)(*((void *)&v122 + 1) + 8 * j);
              v99 = objc_msgSend_node(a1, v70, v71, v72);
              v100 = NSString;
              uint64_t v104 = objc_msgSend_name(a3, v101, v102, v103);
              uint64_t v107 = objc_msgSend_stringWithFormat_(v100, v105, @"%@_%d", v106, v104, 0);
              objc_msgSend_setName_(v99, v108, v107, v109);
              uint64_t v111 = objc_msgSend_modelWithMDLMesh_submesh_options_(VFXModel, v110, (uint64_t)a3, v98, a4);
              objc_msgSend_setModel_(v99, v112, v111, v113);
              objc_msgSend_addChildNode_(v8, v114, (uint64_t)v99, v115);
            }
            uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v122, (uint64_t)v131, 16);
          }
          while (v95);
        }
        goto LABEL_29;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v67 = objc_msgSend_modelWithMDLMesh_options_context_(VFXModel, v66, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_setModel_(v8, v68, v67, v69);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v75 = objc_msgSend_lightWithMDLLight_(VFXLight, v73, (uint64_t)a3, v74);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v90 = objc_msgSend_cameraWithMDLCamera_(VFXCamera, v70, (uint64_t)a3, v72);
          objc_msgSend_setCamera_(v8, v91, v90, v92);
        }
        goto LABEL_29;
      }
      uint64_t v75 = objc_msgSend_lightWithMDLLightProbe_(VFXLight, v78, (uint64_t)a3, v79);
    }
    objc_msgSend_setLight_(v8, v76, v75, v77);
  }
LABEL_29:
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  v80 = objc_msgSend_children(a3, v70, v71, v72);
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v118, (uint64_t)v130, 16);
  if (v82)
  {
    uint64_t v84 = v82;
    uint64_t v85 = *(void *)v119;
    do
    {
      for (uint64_t k = 0; k != v84; ++k)
      {
        if (*(void *)v119 != v85) {
          objc_enumerationMutation(v80);
        }
        uint64_t v87 = objc_msgSend_nodeWithMDLObject_options_context_(VFXNode, v83, *(void *)(*((void *)&v118 + 1) + 8 * k), (uint64_t)a4, a5);
        if (v87) {
          objc_msgSend_addChildNode_(v8, v83, v87, v88);
        }
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v118, (uint64_t)v130, 16);
    }
    while (v84);
  }
  return v8;
}

+ (VFXNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 worldNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9 context:(id)a10
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_transform(a3, v14, v15, v16))
  {
    uint64_t v20 = objc_msgSend_transform(a3, v17, v18, v19);
    objc_msgSend_matrix(v20, v21, v22, v23);
    objc_msgSend_setTransform_(v13, v24, v25, v26);
    objc_msgSend_transform(a3, v27, v28, v29);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v37 = objc_msgSend_transform(a3, v31, v32, v33);
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v37 = objc_msgSend_transform(a3, v17, v18, v19);
    }
    uint64_t v38 = objc_msgSend_transformAnimation(v37, v34, v35, v36);
    if (v38)
    {
      v39 = v38;
      objc_msgSend_duration(v38, v17, v18, v19);
      if (v40 != 0.0)
      {
        uint64_t v41 = objc_msgSend_valueForKey_(a9, v17, @"kSceneSourceAnimationLoadingMode", v19);
        if (v41)
        {
          uint64_t v46 = (void *)v41;
          objc_msgSend_setRemovedOnCompletion_(v39, v42, 1, v44);
          int isEqualToString = objc_msgSend_isEqualToString_(v46, v47, @"playRepeatedly", v48);
          LODWORD(v53) = 2139095040;
          if (!isEqualToString) {
            *(float *)&double v53 = 0.0;
          }
          objc_msgSend_setRepeatCount_(v39, v50, v51, v52, v53);
          uint64_t v56 = objc_msgSend_isEqualToString_(v46, v54, @"playRepeatedly", v55) ^ 1;
          objc_msgSend_setRemovedOnCompletion_(v39, v57, v56, v58);
        }
        else
        {
          LODWORD(v45) = 2139095040;
          objc_msgSend_setRepeatCount_(v39, v42, v43, v44, v45);
          objc_msgSend_setRemovedOnCompletion_(v39, v62, 0, v63);
        }
        objc_msgSend_endTime(a8, v59, v60, v61);
        double v65 = v64;
        objc_msgSend_startTime(a8, v66, v67, v68);
        double v73 = v65 - v72;
        if (v65 - v72 > 0.0)
        {
          objc_msgSend_duration(v39, v69, v70, v71);
          double v75 = v74;
          objc_msgSend_beginTime(v39, v76, v77, v78);
          if (v75 < v73 - v81)
          {
            objc_msgSend_beginTime(v39, v69, v79, v80);
            objc_msgSend_setDuration_(v39, v83, v84, v85, v73 - v82);
          }
        }
        objc_msgSend_addAnimation_forKey_(v13, v69, (uint64_t)v39, @"transform");
      }
    }
  }
LABEL_16:
  uint64_t v86 = objc_msgSend_name(a3, v17, v18, v19);
  objc_msgSend_setName_(v13, v87, v86, v88);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v92 = objc_msgSend_path(a3, v89, v90, v91);
    uint64_t v95 = objc_msgSend_objectForKey_(a4, v93, v92, v94);
    if (v95)
    {
      objc_msgSend_setModel_(v13, v96, v95, v97);
    }
    else
    {
      uint64_t v108 = objc_msgSend_modelWithMDLMesh_options_context_(VFXModel, v96, (uint64_t)a3, (uint64_t)a9, a10);
      objc_msgSend_setModel_(v13, v109, v108, v110);
      uint64_t v113 = objc_msgSend_componentConformingToProtocol_(a3, v111, (uint64_t)&unk_1F108B090, v112);
      if (v113)
      {
        v116 = v113;
        id v117 = sub_1B6465A34(v113);
        objc_msgSend_setMorpher_(v13, v118, (uint64_t)v117, v119);
        sub_1B6465D68(v116, v13, a9, v120);
      }
      if (objc_msgSend_componentConformingToProtocol_(a3, v114, (uint64_t)&unk_1F108B0F0, v115)) {
        objc_msgSend_addObject_(a6, v121, (uint64_t)a3, v123);
      }
      if (objc_msgSend_subdivisionScheme(a3, v121, v122, v123))
      {
        long long v127 = objc_msgSend_model(v13, v124, v125, v126);
        objc_msgSend_setSubdivisionLevel_(v127, v128, 1, v129);
        uint64_t v133 = objc_msgSend_model(v13, v130, v131, v132);
        objc_msgSend_setWantsAdaptiveSubdivision_(v133, v134, 1, v135);
        v136 = objc_opt_new();
        v140 = objc_msgSend_model(v13, v137, v138, v139);
        objc_msgSend_setTessellator_(v140, v141, (uint64_t)v136, v142);
      }
      uint64_t v143 = objc_msgSend_model(v13, v124, v125, v126);
      objc_msgSend_setObject_forKey_(a4, v144, v143, v92);
    }
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v103 = objc_msgSend_lightWithMDLLight_(VFXLight, v101, (uint64_t)a3, v102);
LABEL_23:
    objc_msgSend_setLight_(v13, v104, v103, v105);
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v103 = objc_msgSend_lightWithMDLLightProbe_(VFXLight, v106, (uint64_t)a3, v107);
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v147 = objc_msgSend_cameraWithMDLCamera_(VFXCamera, v145, (uint64_t)a3, v146);
    objc_msgSend_setCamera_(v13, v148, v147, v149);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      sub_1B646B4A4(v13, (uint64_t *)a3, (uint64_t **)a7);
    }
  }
LABEL_35:
  if (objc_msgSend_instance(a3, v98, v99, v100))
  {
    uint64_t v153 = objc_msgSend_instance(a3, v150, v151, v152);
    uint64_t v155 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v154, v153, (uint64_t)a4, a5, a6, a7, a8, a9, a10);
    objc_msgSend_addChildNode_(v13, v156, v155, v157);
  }
  uint64_t v158 = objc_msgSend_path(a3, v150, v151, v152);
  v159 = v13;
  objc_msgSend_setObject_forKey_(a5, v160, (uint64_t)v13, v158);
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v179 = a3;
  v164 = objc_msgSend_children(a3, v161, v162, v163);
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v165, (uint64_t)&v183, (uint64_t)v187, 16);
  if (v166)
  {
    uint64_t v170 = v166;
    uint64_t v171 = *(void *)v184;
    do
    {
      for (uint64_t i = 0; i != v170; ++i)
      {
        if (*(void *)v184 != v171) {
          objc_enumerationMutation(v164);
        }
        uint64_t v173 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v167, *(void *)(*((void *)&v183 + 1) + 8 * i), (uint64_t)a4, a5, a6, a7, a8, a9, a10);
        if (v173) {
          objc_msgSend_addChildNode_(v159, v167, v173, v174);
        }
      }
      uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v167, (uint64_t)&v183, (uint64_t)v187, 16);
    }
    while (v170);
  }
  uint64_t v175 = objc_msgSend_hidden(v179, v167, v168, v169);
  objc_msgSend_setHidden_(v159, v176, v175, v177);
  return v159;
}

- (void)_addSkinnerWithMDLMesh:(id)a3 worldNodes:(id)a4
{
  uint64_t v7 = objc_msgSend_componentConformingToProtocol_(a3, a2, (uint64_t)&unk_1F108B0F0, (uint64_t)a4);
  if (v7)
  {
    uint64_t v11 = (void *)v7;
    uint64_t v12 = objc_msgSend_model(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_mesh(v12, v13, v14, v15);
    id v19 = sub_1B6465664(v11, (char *)a4, v17, v18);
    id v20 = sub_1B64657A4(v11);
    uint64_t v24 = sub_1B646B964(a3, v21, v22, v23);
    uint64_t v28 = sub_1B646BA10(a3, v25, v26, v27);
    uint64_t v31 = objc_msgSend_skinnerWithBaseMesh_bones_boneInverseBindTransforms_boneWeights_boneIndices_(VFXSkinner, v29, v16, (uint64_t)v19, v20, v24, v28);
    objc_msgSend_setSkinner_(self, v30, v31, v32);
  }
}

- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v31[0] = self;
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v31, 1);
  id v19 = VFXNodesToMDLAsset(v18);
  id v20 = VFXNodesToMDLAsset(a3);
  long long v21 = sub_1B6464F04(v20);
  uint64_t v22 = sub_1B6464F04(v19);
  uint64_t v23 = sub_1B6465234(v19);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1B646BC5C;
  v30[3] = &unk_1E61424A0;
  v30[4] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B646BCDC;
  block[3] = &unk_1E6142518;
  BOOL v28 = a6;
  BOOL v29 = a5;
  float v26 = a7;
  float v27 = a8;
  block[4] = v21;
  block[5] = v22;
  block[6] = v23;
  block[7] = v20;
  block[8] = v30;
  block[9] = a9;
  block[10] = a10;
  dispatch_async(global_queue, block);
}

- (VFXNode)init
{
  v12.receiver = self;
  v12.super_class = (Class)VFXNode;
  v2 = [(VFXNode *)&v12 init];
  if (v2)
  {
    uint64_t v3 = sub_1B64A0828();
    v2->_node = (__CFXNode *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    *((unsigned char *)v2 + 48) |= 0x3Eu;
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valueForKeyLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (id)initPresentationNodeWithNodeRef:(__CFXNode *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXNode;
  id v4 = [(VFXNode *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 48) |= 1u;
    v4->_node = (__CFXNode *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valueForKeyLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (VFXNode)initWithNodeRef:(__CFXNode *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VFXNode;
  id v4 = [(VFXNode *)&v19 init];
  if (v4)
  {
    CFTypeRef v5 = CFRetain(a3);
    *((void *)v4 + 1) = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    *((_DWORD *)v4 + 52) = 0;
    *((_DWORD *)v4 + 64) = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    if (sub_1B64A180C(*((void *)v4 + 1)))
    {
      *((void *)v4 + 4) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = *((void *)v4 + 1);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1B64C8AF4;
      v18[3] = &unk_1E6142F98;
      v18[4] = v4;
      sub_1B649FD10(v16, (uint64_t)v18);
    }
  }
  return (VFXNode *)v4;
}

- (void)_initChildNodesArray
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  node = self->_node;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B64C8BFC;
  v22[3] = &unk_1E6142F98;
  v22[4] = self;
  sub_1B649FD10((uint64_t)node, (uint64_t)v22);
  if (v13) {
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  }
}

+ (id)node
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (VFXNode)nodeWithModel:(id)a3
{
  uint64_t v5 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setModel_(v5, v6, (uint64_t)a3, v7);
  return v5;
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 48) & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    childNodes = self->_childNodes;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, a2, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(childNodes);
          }
          objc_msgSend__setParent_(*(void **)(*((void *)&v27 + 1) + 8 * i), a2, 0, v3);
        }
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, a2, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v7);
    }
  }
  if (objc_msgSend_hasPhysicBody(self, a2, v2, v3))
  {
    uint64_t v13 = objc_msgSend_physicsBody(self, v10, v11, v12);
    objc_msgSend__ownerWillDie(v13, v14, v15, v16);
  }

  self->_components = 0;
  node = self->_node;
  if (node)
  {
    if ((*((unsigned char *)self + 48) & 1) == 0)
    {
      sub_1B6583684((uint64_t)node, 0, v18, v19, v20, v21, v22, v23);
      node = self->_node;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B64C8ED0;
    v26[3] = &unk_1E6140A18;
    v26[4] = node;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, 0, 0, v26);
  }

  free(*(void **)self->_fixedBoundingBoxExtrema);
  v25.receiver = self;
  v25.super_class = (Class)VFXNode;
  [(VFXNode *)&v25 dealloc];
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
      v15[2] = sub_1B64C8FA4;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
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
  *(double *)&long long v14 = sub_1B649FE9C((uint64_t)self->_node, v6, v7, v8, v9, v10, v11, v12);
  *(_OWORD *)&self->_anon_40[2] = v14;
  *(_OWORD *)&self->_anon_40[18] = v15;
  *(_OWORD *)&self->_anon_40[34] = v16;
  *(_OWORD *)&self->_anon_40[50] = v17;
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xFC | 2;
  self->_opacity = sub_1B64A0C9C((uint64_t)self->_node, v18, v19, v20, v21, v22, v23, v24);
  self->_renderingOrder = (int64_t)sub_1B64A34FC((uint64_t)self->_node, v25, v26, v27, v28, v29, v30, v31);
  if (sub_1B649F390((uint64_t)self->_node, v32, v33, v34, v35, v36, v37, v38)) {
    char v46 = 0x80;
  }
  else {
    char v46 = 0;
  }
  *((unsigned char *)self + 49) = v46 & 0x80 | *((unsigned char *)self + 49) & 0x7F;
  *((unsigned char *)self + 50) = *((unsigned char *)self + 50) & 0xFE | sub_1B64A3638((uint64_t)self->_node, v39, v40, v41, v42, v43, v44, v45);
  self->_categoryBitMasuint64_t k = sub_1B64A3808((uint64_t)self->_node, v47, v48, v49, v50, v51, v52, v53);
  if (sub_1B64A38FC((uint64_t)self->_node)) {
    char v61 = 8;
  }
  else {
    char v61 = 0;
  }
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xF7 | v61;
  if (sub_1B64A0A1C((uint64_t)self->_node, v54, v55, v56, v57, v58, v59, v60)) {
    char v62 = 4;
  }
  else {
    char v62 = 0;
  }
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xFB | v62;
  if (sub_1B64A3928((uint64_t)self->_node)) {
    char v66 = 16;
  }
  else {
    char v66 = 0;
  }
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xEF | v66;
  objc_msgSend__syncEntityObjCModel(self, v63, v64, v65);
  if (v13)
  {
    sub_1B64B0CB4(v13, v67, v68, v69, v70, v71, v72, v73);
  }
}

- (BOOL)isPresentationObject
{
  return *((unsigned char *)self + 48) & 1;
}

- (VFXNode)presentationNode
{
  uint64_t v2 = self;
  if ((*((unsigned char *)self + 48) & 1) == 0)
  {
    self = self->_presentationObject;
    if (!self)
    {
      uint64_t v3 = [VFXNode alloc];
      self = (VFXNode *)objc_msgSend_initPresentationNodeWithNodeRef_(v3, v4, (uint64_t)v2->_node, v5);
      v2->_presentationObject = self;
    }
  }
  return self;
}

- (__CFXWorld)worldRef
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (__CFXWorld *)sub_1B63F4F54(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)setWorld:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  world = self->_world;
  if (world == a3) {
    return;
  }
  if (world)
  {
    if (objc_msgSend_particleEmitter(self, a2, (uint64_t)a3, v3))
    {
      uint64_t v10 = objc_msgSend_particleEmitter(self, v7, v8, v9);
    }
    else if (objc_msgSend_particleCollider(self, v7, v8, v9))
    {
      uint64_t v10 = objc_msgSend_particleCollider(self, v13, v14, v15);
    }
    else
    {
      if (!objc_msgSend_behaviorGraph(self, v13, v14, v15)) {
        goto LABEL_10;
      }
      uint64_t v10 = objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
    }
    objc_msgSend_willBeRemovedFromWorld_(v10, v11, (uint64_t)self->_world, v12);
LABEL_10:
    if (self->_world)
    {
      long long v16 = objc_msgSend_model(self, a2, (uint64_t)a3, v3);
      objc_msgSend_removeWorldReference_(v16, v17, (uint64_t)self->_world, v18);
    }
  }
  self->_world = (VFXWorld *)a3;
  if (a3)
  {
    uint64_t v19 = objc_msgSend_model(self, a2, (uint64_t)a3, v3);
    objc_msgSend_addWorldReference_(v19, v20, (uint64_t)a3, v21);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v22 = objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v24)
  {
    uint64_t v28 = v24;
    uint64_t v29 = *(void *)v44;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_setWorld_(*(void **)(*((void *)&v43 + 1) + 8 * v30++), v25, (uint64_t)a3, v27);
      }
      while (v28 != v30);
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v28);
  }
  if (a3)
  {
    if (objc_msgSend_particleEmitter(self, v25, v26, v27))
    {
      uint64_t v34 = objc_msgSend_particleEmitter(self, v31, v32, v33);
    }
    else if (objc_msgSend_particleCollider(self, v31, v32, v33))
    {
      uint64_t v34 = objc_msgSend_particleCollider(self, v37, v38, v39);
    }
    else
    {
      if (!objc_msgSend_behaviorGraph(self, v37, v38, v39)) {
        return;
      }
      uint64_t v34 = objc_msgSend_behaviorGraph(self, v40, v41, v42);
    }
    objc_msgSend_wasAddedToWorld_(v34, v35, (uint64_t)self->_world, v36);
  }
}

- (id)world
{
  return self->_world;
}

- (void)_dump:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_defaultCStringEncoding(NSString, a2, (uint64_t)a3, v3);
  uint64_t v9 = (const char *)objc_msgSend_cStringUsingEncoding_(a3, v7, v6, v8);
  uint64_t v13 = objc_msgSend_description(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_defaultCStringEncoding(NSString, v14, v15, v16);
  uint64_t v20 = (const char *)objc_msgSend_cStringUsingEncoding_(v13, v18, v17, v19);
  printf("%s%s {\n", v9, v20);
  uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v21, @"\t%@", v22, a3);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v27 = objc_msgSend_childNodes(self, v24, v25, v26);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v29)
  {
    uint64_t v33 = v29;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend__dump_(*(void **)(*((void *)&v40 + 1) + 8 * i), v30, v23, v32);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v33);
  }
  uint64_t v36 = objc_msgSend_defaultCStringEncoding(NSString, v30, v31, v32);
  uint64_t v39 = (const char *)objc_msgSend_cStringUsingEncoding_(a3, v37, v36, v38);
  printf("%s}\n", v39);
}

- (void)dump
{
  uint64_t v5 = objc_msgSend_name(self, a2, v2, v3);
  NSLog(&cfstr_DumpNodeTree.isa, v5);
  objc_msgSend__dump_(self, v6, (uint64_t)&stru_1F0FCDBB0, v7);
  NSLog(&stru_1F0FDB750.isa);
}

+ (id)_dumpNodeTree:(id)a3 tab:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSString;
  if (objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4)) {
    uint64_t v11 = objc_msgSend_name(a3, v8, v9, v10);
  }
  else {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%p>", v10, a3);
  }
  uint64_t v14 = objc_msgSend_stringWithFormat_(v7, v12, @"%@%@\n", v13, a4, v11);
  uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v15, @"\t%@", v16, a4);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v21 = objc_msgSend_childNodes(a3, v18, v19, v20);
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v33;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend__dumpNodeTree_tab_(a1, v24, *(void *)(*((void *)&v32 + 1) + 8 * v27), v17);
        uint64_t v14 = objc_msgSend_stringByAppendingString_(v14, v29, v28, v30);
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v25);
  }
  return v14;
}

- (id)_dumpTree
{
  uint64_t v3 = objc_opt_class();

  return (id)objc_msgSend__dumpNodeTree_tab_(v3, v4, (uint64_t)self, (uint64_t)&stru_1F0FCDBB0);
}

- (void)_setAttributes:(id)a3
{
  p_valueForKeyLocuint64_t k = &self->_valueForKeyLock;
  os_unfair_lock_lock(&self->_valueForKeyLock);

  self->_valueForKey = (NSMutableDictionary *)a3;

  os_unfair_lock_unlock(p_valueForKeyLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)((uint64_t (*)(VFXNode *, char *, void))MEMORY[0x1F4181798])(self, sel_copyWithOptions_, 0);
}

- (id)copyWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyWithOptions_to_(self, v6, a3, (uint64_t)v5);
  return v5;
}

+ (id)_cloneSharable:(id)a3 remap:(__CFDictionary *)a4
{
  if (a4)
  {
    id result = (id)CFDictionaryGetValue(a4, a3);
    if (result) {
      return result;
    }
    uint64_t v10 = objc_msgSend_copy(a3, v7, v8, v9);
    CFDictionarySetValue(a4, a3, v10);
  }
  else
  {
    uint64_t v10 = objc_msgSend_copy(a3, a2, (uint64_t)a3, 0);
  }

  return v10;
}

- (void)copyWithOptions:(unint64_t)a3 to:(id)a4
{
}

- (void)_copyWithOptions:(unint64_t)a3 to:(id)a4 remap:(__CFDictionary *)a5
{
  char v7 = a3;
  v385[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_begin(VFXTransaction, a2, a3, (uint64_t)a4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
  uint64_t v14 = objc_msgSend_name(self, v11, v12, v13);
  objc_msgSend_setName_(a4, v15, v14, v16);
  if (*((unsigned char *)self + 49))
  {
    objc_msgSend_position(self, v17, v18, v19);
    objc_msgSend_setPosition_(a4, v26, v27, v28);
    objc_msgSend_scale(self, v29, v30, v31);
    objc_msgSend_setScale_(a4, v32, v33, v34);
    int v35 = (*((unsigned __int8 *)self + 49) >> 5) & 3;
    switch(v35)
    {
      case 2:
        objc_msgSend_orientation(self, v23, v24, v25);
        objc_msgSend_setOrientation_(a4, v39, v40, v41);
        break;
      case 1:
        objc_msgSend_rotation(self, v23, v24, v25);
        objc_msgSend_setRotation_(a4, v42, v43, v44);
        break;
      case 0:
        objc_msgSend_eulerAngles(self, v23, v24, v25);
        objc_msgSend_setEulerAngles_(a4, v36, v37, v38);
        break;
    }
  }
  else
  {
    objc_msgSend_transform(self, v17, v18, v19);
    objc_msgSend_setTransform_(a4, v20, v21, v22);
  }
  if ((*((unsigned char *)self + 49) & 4) != 0)
  {
    objc_msgSend_pivot(self, v23, v24, v25);
    objc_msgSend_setPivot_(a4, v45, v46, v47);
  }
  uint64_t isHidden = objc_msgSend_isHidden(self, v23, v24, v25);
  objc_msgSend_setHidden_(a4, v49, isHidden, v50);
  objc_msgSend_opacity(self, v51, v52, v53);
  objc_msgSend_setOpacity_(a4, v54, v55, v56);
  uint64_t v60 = objc_msgSend_renderingOrder(self, v57, v58, v59);
  objc_msgSend_setRenderingOrder_(a4, v61, v60, v62);
  uint64_t v66 = objc_msgSend_categoryBitMask(self, v63, v64, v65);
  objc_msgSend_setCategoryBitMask_(a4, v67, v66, v68);
  uint64_t v72 = objc_msgSend_light(self, v69, v70, v71);
  if (objc_msgSend_type(v72, v73, v74, v75) == 4)
  {
    uint64_t v79 = objc_msgSend_light(self, v76, v77, v78);
    v83 = objc_msgSend_copy(v79, v80, v81, v82);
    objc_msgSend_setLight_(a4, v84, (uint64_t)v83, v85);

    if ((v7 & 2) != 0) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  uint64_t v89 = objc_msgSend_light(self, v76, v77, v78);
  if ((v7 & 4) != 0) {
    uint64_t v89 = objc_msgSend__cloneSharable_remap_(VFXNode, v90, v89, (uint64_t)a5);
  }
  objc_msgSend_setLight_(a4, v90, v89, v91);
  if ((v7 & 2) == 0)
  {
LABEL_17:
    uint64_t v92 = objc_msgSend_particleEmitter(self, v86, v87, v88);
    id v96 = (id)objc_msgSend_copy(v92, v93, v94, v95);
    objc_msgSend_setParticleEmitter_(a4, v97, (uint64_t)v96, v98);
    uint64_t v102 = objc_msgSend_particleCollider(self, v99, v100, v101);
    id v106 = (id)objc_msgSend_copy(v102, v103, v104, v105);
    objc_msgSend_setParticleCollider_(a4, v107, (uint64_t)v106, v108);
    if (objc_msgSend_behaviorGraph(self, v109, v110, v111))
    {
      if (objc_msgSend_particleEmitter(a4, v86, v87, v88) || objc_msgSend_particleCollider(a4, v112, v113, v114))
      {
        uint64_t v115 = objc_msgSend_particleCollider(a4, v112, v113, v114);
        uint64_t v119 = objc_msgSend_coreEntityHandle(v115, v116, v117, v118);
        if (!v119)
        {
          uint64_t v123 = objc_msgSend_particleEmitter(a4, v120, v121, v122);
          uint64_t v119 = objc_msgSend_coreEntityHandle(v123, v124, v125, v126);
        }
        uint64_t v127 = objc_msgSend_entityObject(v119, v120, v121, v122);
        id v130 = (id)objc_msgSend_behaviorGraphWithEntityObject_(VFXBehaviorGraph, v128, v127, v129);
      }
      else
      {
        v364 = objc_msgSend_behaviorGraph(self, v112, v113, v114);
        id v130 = (id)objc_msgSend_copy(v364, v365, v366, v367);
      }
      objc_msgSend_setBehaviorGraph_(a4, v131, (uint64_t)v130, v132);
      v136 = objc_msgSend_behaviorGraph(a4, v133, v134, v135);
      v140 = objc_msgSend_entityObject(v136, v137, v138, v139);
      uint64_t v384 = objc_msgSend_identifier(self, v141, v142, v143);
      v385[0] = a4;
      uint64_t v145 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v144, (uint64_t)v385, (uint64_t)&v384, 1);
      objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v140, v146, (uint64_t)a4, v145);
    }
  }
LABEL_24:
  uint64_t v147 = objc_msgSend_camera(self, v86, v87, v88);
  if ((v7 & 4) != 0) {
    uint64_t v147 = objc_msgSend__cloneSharable_remap_(VFXNode, v148, v147, (uint64_t)a5);
  }
  objc_msgSend_setCamera_(a4, v148, v147, v149);
  uint64_t v153 = objc_msgSend_forceField(self, v150, v151, v152);
  id v157 = (id)objc_msgSend_copy(v153, v154, v155, v156);
  objc_msgSend_setForceField_(a4, v158, (uint64_t)v157, v159);
  uint64_t v163 = objc_msgSend_castsShadow(self, v160, v161, v162);
  objc_msgSend_setCastsShadow_(a4, v164, v163, v165);
  uint64_t v169 = objc_msgSend_usesDepthPrePass(self, v166, v167, v168);
  objc_msgSend_setUsesDepthPrePass_(a4, v170, v169, v171);
  if (objc_msgSend_constraints(self, v172, v173, v174))
  {
    v178 = objc_msgSend_constraints(self, v175, v176, v177);
    if (objc_msgSend_count(v178, v179, v180, v181))
    {
      v182 = (void *)MEMORY[0x1E4F1CA48];
      long long v183 = objc_msgSend_constraints(self, v175, v176, v177);
      uint64_t v187 = objc_msgSend_count(v183, v184, v185, v186);
      v190 = objc_msgSend_arrayWithCapacity_(v182, v188, v187, v189);
      long long v377 = 0u;
      long long v378 = 0u;
      long long v379 = 0u;
      long long v380 = 0u;
      v194 = objc_msgSend_constraints(self, v191, v192, v193);
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v377, (uint64_t)v383, 16);
      if (v196)
      {
        uint64_t v200 = v196;
        uint64_t v201 = *(void *)v378;
        do
        {
          for (uint64_t i = 0; i != v200; ++i)
          {
            if (*(void *)v378 != v201) {
              objc_enumerationMutation(v194);
            }
            v203 = objc_msgSend_copy(*(void **)(*((void *)&v377 + 1) + 8 * i), v197, v198, v199);
            objc_msgSend_addObject_(v190, v204, (uint64_t)v203, v205);
          }
          uint64_t v200 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v197, (uint64_t)&v377, (uint64_t)v383, 16);
        }
        while (v200);
      }
      objc_msgSend_setConstraints_(a4, v197, (uint64_t)v190, v199);
    }
  }
  v206 = objc_msgSend_deformers(self, v175, v176, v177);
  if (objc_msgSend_count(v206, v207, v208, v209))
  {
    if ((v7 & 4) != 0)
    {
      v216 = (void *)MEMORY[0x1E4F1CA48];
      v217 = objc_msgSend_deformers(self, v210, v211, v212);
      uint64_t v221 = objc_msgSend_count(v217, v218, v219, v220);
      v224 = objc_msgSend_arrayWithCapacity_(v216, v222, v221, v223);
      long long v373 = 0u;
      long long v374 = 0u;
      long long v375 = 0u;
      long long v376 = 0u;
      v228 = objc_msgSend_deformers(self, v225, v226, v227);
      uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v229, (uint64_t)&v373, (uint64_t)v382, 16);
      if (v230)
      {
        uint64_t v233 = v230;
        uint64_t v234 = *(void *)v374;
        do
        {
          for (uint64_t j = 0; j != v233; ++j)
          {
            if (*(void *)v374 != v234) {
              objc_enumerationMutation(v228);
            }
            objc_msgSend_addObject_(v224, v231, *(void *)(*((void *)&v373 + 1) + 8 * j), v232);
          }
          uint64_t v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v231, (uint64_t)&v373, (uint64_t)v382, 16);
        }
        while (v233);
      }
      objc_msgSend_setConstraints_(a4, v231, (uint64_t)v224, v232);
    }
    else
    {
      uint64_t v213 = objc_msgSend_deformers(self, v210, v211, v212);
      objc_msgSend_setDeformers_(a4, v214, v213, v215);
    }
  }
  uint64_t isAuthoring = objc_msgSend_isAuthoring(self, v210, v211, v212);
  objc_msgSend_setIsAuthoring_(a4, v237, isAuthoring, v238);
  uint64_t v242 = objc_msgSend_editorLocked(self, v239, v240, v241);
  objc_msgSend_setEditorLocked_(a4, v243, v242, v244);
  uint64_t v248 = objc_msgSend_focusBehavior(self, v245, v246, v247);
  objc_msgSend_setFocusBehavior_(a4, v249, v248, v250);
  if (objc_msgSend_isAuthoring(self, v251, v252, v253)
    && objc_msgSend_authoringTargetNode(self, v254, v255, v256))
  {
    uint64_t v257 = objc_msgSend_authoringTargetNode(self, v254, v255, v256);
    objc_msgSend_setAuthoringTargetNode_(a4, v258, v257, v259);
  }
  uint64_t isGizmo = objc_msgSend_isGizmo(self, v254, v255, v256);
  objc_msgSend_setGizmo_(a4, v261, isGizmo, v262);
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  v372[0] = MEMORY[0x1E4F143A8];
  v372[1] = 3221225472;
  v372[2] = sub_1B64CA240;
  v372[3] = &unk_1E6141318;
  v372[4] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valueForKey, v264, (uint64_t)v372, v265);
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if ((v7 & 1) == 0) {
    objc_msgSend__copyAnimationsFrom_(a4, v266, (uint64_t)self, v268);
  }
  objc_msgSend_commitImmediate(VFXTransaction, v266, v267, v268);
  if (objc_msgSend_model(self, v269, v270, v271))
  {
    if ((v7 & 4) != 0)
    {
      uint64_t v278 = objc_msgSend_model(self, v272, v273, v274);
      uint64_t v280 = objc_msgSend__cloneSharable_remap_(VFXNode, v279, v278, (uint64_t)a5);
      objc_msgSend_setModel_(a4, v281, v280, v282);
      if (a5)
      {
        id v283 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v287 = objc_msgSend_model(a4, v284, v285, v286);
        v291 = objc_msgSend_materials(v287, v288, v289, v290);
        uint64_t v295 = objc_msgSend_count(v291, v292, v293, v294);
        v298 = objc_msgSend_initWithCapacity_(v283, v296, v295, v297);
        long long v368 = 0u;
        long long v369 = 0u;
        long long v370 = 0u;
        long long v371 = 0u;
        v302 = objc_msgSend_model(a4, v299, v300, v301, 0);
        v306 = objc_msgSend_materials(v302, v303, v304, v305);
        uint64_t v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v307, (uint64_t)&v368, (uint64_t)v381, 16);
        if (v308)
        {
          uint64_t v312 = v308;
          uint64_t v313 = *(void *)v369;
          do
          {
            for (uint64_t k = 0; k != v312; ++k)
            {
              if (*(void *)v369 != v313) {
                objc_enumerationMutation(v306);
              }
              v315 = *(void **)(*((void *)&v368 + 1) + 8 * k);
              id Value = (id)CFDictionaryGetValue(a5, v315);
              if (!Value)
              {
                id Value = (id)objc_msgSend_copy(v315, v316, v317, v318);
                CFDictionaryAddValue(a5, v315, Value);
              }
              objc_msgSend_addObject_(v298, v316, (uint64_t)Value, v318);
            }
            uint64_t v312 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v320, (uint64_t)&v368, (uint64_t)v381, 16);
          }
          while (v312);
        }
        v321 = objc_msgSend_model(a4, v309, v310, v311);
        objc_msgSend_setMaterials_(v321, v322, (uint64_t)v298, v323);
      }
    }
    else
    {
      uint64_t v275 = objc_msgSend_model(self, v272, v273, v274);
      objc_msgSend_setModel_(a4, v276, v275, v277);
    }
  }
  if (objc_msgSend_morpher(self, v272, v273, v274))
  {
    v327 = objc_msgSend_morpher(self, v324, v325, v326);
    id v331 = (id)objc_msgSend_copy(v327, v328, v329, v330);
    objc_msgSend_setMorpher_(a4, v332, (uint64_t)v331, v333);
  }
  if (objc_msgSend_skinner(self, v324, v325, v326))
  {
    v337 = objc_msgSend_skinner(self, v334, v335, v336);
    id v341 = (id)objc_msgSend_copy(v337, v338, v339, v340);
    objc_msgSend_setSkinner_(a4, v342, (uint64_t)v341, v343);
  }
  if (objc_msgSend_physicsBody(self, v334, v335, v336))
  {
    v347 = objc_msgSend_physicsBody(self, v344, v345, v346);
    id v351 = (id)objc_msgSend_copy(v347, v348, v349, v350);
    objc_msgSend_setPhysicsBody_(a4, v352, (uint64_t)v351, v353);
  }
  if (objc_msgSend_prefab(self, v344, v345, v346))
  {
    v357 = objc_msgSend_prefab(self, v354, v355, v356);
    id v361 = (id)objc_msgSend_copy(v357, v358, v359, v360);
    objc_msgSend_setPrefab_(a4, v362, (uint64_t)v361, v363);
  }
  *((unsigned char *)a4 + 49) = *((unsigned char *)a4 + 49) & 0xF7 | *((unsigned char *)self + 49) & 8;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)_copyRecursively:(unint64_t)a3 remapOut:(__CFDictionary *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend__copyWithOptions_to_remap_(self, v8, a3, (uint64_t)v7, a4);
  if (a4)
  {
    CFDictionarySetValue(a4, self, v7);
    if (objc_msgSend_physicsBody(v7, v12, v13, v14))
    {
      uint64_t v18 = (const void *)objc_msgSend_physicsBody(self, v15, v16, v17);
      uint64_t v22 = (const void *)objc_msgSend_physicsBody(v7, v19, v20, v21);
      CFDictionarySetValue(a4, v18, v22);
    }
    if (objc_msgSend_behaviorGraph(v7, v15, v16, v17))
    {
      uint64_t v23 = objc_msgSend_behaviorGraph(self, v9, v10, v11);
      uint64_t v27 = (const void *)objc_msgSend_coreEntityHandle(v23, v24, v25, v26);
      uint64_t v31 = objc_msgSend_behaviorGraph(v7, v28, v29, v30);
      int v35 = (const void *)objc_msgSend_coreEntityHandle(v31, v32, v33, v34);
      CFDictionarySetValue(a4, v27, v35);
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v36 = objc_msgSend_childNodes(self, v9, v10, v11, 0);
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v38)
  {
    uint64_t v42 = v38;
    uint64_t v43 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(v36);
        }
        uint64_t v45 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ((objc_msgSend_isGizmo(v45, v39, v40, v41) & 1) == 0)
        {
          uint64_t v46 = objc_msgSend__copyRecursively_remapOut_(v45, v39, a3, (uint64_t)a4);
          objc_msgSend_addChildNode_(v7, v47, (uint64_t)v46, v48);
        }
      }
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v42);
  }
  return v7;
}

- (id)_cloneWithOption:(unint64_t)a3 remapTable:(__CFDictionary *)a4
{
  uint64_t v6 = objc_msgSend__copyRecursively_remapOut_(self, a2, a3 | 1, (uint64_t)a4);
  sub_1B64CA4D8(v6, a4, v7, v8);
  if (a4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B64CA700;
    v18[3] = &unk_1E6142FB8;
    v18[4] = a4;
    objc_msgSend_enumerateHierarchyUsingBlock_(v6, v9, (uint64_t)v18, v11);
  }
  sub_1B64CA7F0(self, v6, v10, v11, v12, v13, v14, v15, v17);
  return v6;
}

- (id)cloneWithOption:(unint64_t)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  uint64_t v7 = objc_msgSend__cloneWithOption_remapTable_(self, v6, a3, (uint64_t)Mutable);
  CFRelease(Mutable);
  return v7;
}

- (id)clone
{
  return (id)((uint64_t (*)(VFXNode *, char *, void))MEMORY[0x1F4181798])(self, sel_cloneWithOption_, 0);
}

- (id)_deepCloneWithRemapTableOut:(__CFDictionary *)a3
{
  return (id)objc_msgSend__cloneWithOption_remapTable_(self, a2, 4, (uint64_t)a3);
}

- (id)deepClone
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  uint64_t v6 = objc_msgSend__deepCloneWithRemapTableOut_(self, v4, (uint64_t)Mutable, v5);
  CFRelease(Mutable);
  return v6;
}

- (BOOL)_isAReference
{
  return 0;
}

+ (VFXNode)nodeWithNodeRef:(__CFXNode *)a3
{
  id result = (VFXNode *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithNodeRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXNode *)v9;
  }
  return result;
}

- (id)childNodeWithName:(id)a3
{
  return (id)objc_msgSend_childNodeWithName_recursively_(self, a2, (uint64_t)a3, 1);
}

- (id)childNodeWithName:(id)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_childNodes(self, a2, (uint64_t)a3, a4);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v35, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v31;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v6);
      }
      uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend_name(v15, v9, v10, v11);
      if (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a3, v18)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v35, 16);
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
    uint64_t v15 = 0;
  }
  if (!v15 && v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v34, 16);
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v6);
          }
          uint64_t v24 = objc_msgSend_childNodeWithName_recursively_(*(void **)(*((void *)&v26 + 1) + 8 * i), v20, (uint64_t)a3, 1);
          if (v24) {
            return v24;
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v20, (uint64_t)&v26, (uint64_t)v34, 16);
        uint64_t v15 = 0;
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

- (id)objectInChildNodesWithName:(id)a3
{
  return (id)objc_msgSend_childNodeWithName_recursively_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v26 = 0;
  if ((*((unsigned int (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v26)) {
    objc_msgSend_addObject_(a5, v9, (uint64_t)self, v11);
  }
  if (v26) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v6;
  }
  if (v12) {
    return v26 != 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = objc_msgSend_childNodes(self, v9, v10, v11, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, (uint64_t)v27, 16);
  if (!v15) {
    return v26 != 0;
  }
  uint64_t v17 = v15;
  uint64_t v18 = *(void *)v23;
  BOOL v19 = 1;
LABEL_9:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v23 != v18) {
      objc_enumerationMutation(v13);
    }
    char v26 = objc_msgSend__childNodesPassingTest_recursively_output_(*(void **)(*((void *)&v22 + 1) + 8 * v20), v16, (uint64_t)a3, 1, a5);
    if (v26) {
      return v19;
    }
    if (v17 == ++v20)
    {
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v22, (uint64_t)v27, 16);
      if (v17) {
        goto LABEL_9;
      }
      return v26 != 0;
    }
  }
}

- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = objc_msgSend_childNodes(self, v8, v9, v10, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v20;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v20 != v16) {
        objc_enumerationMutation(v11);
      }
      if (objc_msgSend__childNodesPassingTest_recursively_output_(*(void **)(*((void *)&v19 + 1) + 8 * v17), v14, (uint64_t)a3, v4, v7))break; {
      if (v15 == ++v17)
      }
      {
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v19, (uint64_t)v23, 16);
        if (v15) {
          goto LABEL_3;
        }
        return v7;
      }
    }
  }
  return v7;
}

- (id)childNodesPassingTest:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_childNodesPassingTest_recursively_, a3, 1);
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v21 = 0;
  (*((void (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v21);
  if (!v21)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend_childNodes(self, v5, v6, v7, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v22, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v9);
          }
          char v21 = objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((void *)&v17 + 1) + 8 * i), v12, (uint64_t)a3, v13);
          if (v21) {
            return 1;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, (uint64_t)v22, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  return v21 != 0;
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((void *)&v13 + 1) + 8 * v12), v8, (uint64_t)a3, v9))break; {
      if (v10 == ++v12)
      }
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v10) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(id)a3
{
  char v7 = 0;
  (*((void (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v7);
  if (!v7) {
    objc_msgSend_enumerateChildNodesUsingBlock_(self, v5, (uint64_t)a3, v6);
  }
}

- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = objc_msgSend_childNodes(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        if ((Class)objc_opt_class() == a3 && objc_msgSend_camera(v14, v15, v16, v17)
          || (Class)objc_opt_class() == a3 && objc_msgSend_light(v14, v18, v19, v20)
          || (Class)objc_opt_class() == a3 && objc_msgSend_model(v14, v21, v22, v23)
          || (Class)objc_opt_class() == a3 && objc_msgSend_morpher(v14, v24, v25, v26)
          || (Class)objc_opt_class() == a3 && objc_msgSend_skinner(v14, v27, v28, v29))
        {
          objc_msgSend_addObject_(a4, v27, (uint64_t)v14, v30);
        }
        if (v5) {
          objc_msgSend__childNodesWithAttribute_output_recursively_(v14, v27, (uint64_t)a3, (uint64_t)a4, 1);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v27, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v11);
  }
}

- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, a4);
  objc_msgSend__childNodesWithAttribute_output_recursively_(self, v8, (uint64_t)a3, (uint64_t)v7, v4);
  return v7;
}

- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  BOOL v11 = a4;
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B64CB3D4;
  v9[3] = &unk_1E6142FE0;
  v9[4] = a3;
  v9[5] = v10;
  objc_msgSend__childNodesPassingTest_recursively_output_(self, v7, (uint64_t)v9, 1, v6);
  _Block_object_dispose(v10, 8);
  return v6;
}

- (id)jsChildNodesWithAttribute:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_objectInChildNodesWithAttribute_firstOnly_, a3, 0);
}

- (id)_findComponentWithType:(int64_t)a3
{
  if (*((unsigned char *)self + 48))
  {
    switch(a3)
    {
      case 0:
        CFDictionaryRef v15 = sub_1B649F640((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v15) {
          goto LABEL_15;
        }
        return (id)MEMORY[0x1F4181798](VFXLight, sel_presentationLightWithLightRef_, v15, v3);
      case 1:
LABEL_15:
        CFDictionaryRef v16 = sub_1B64A3B48((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v16) {
          return 0;
        }
        id result = (id)MEMORY[0x1F4181798](VFXCamera, sel_presentationCameraWithCameraRef_, v16, v17);
        break;
      case 2:
        uint64_t v18 = sub_1B649F5F4((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v18) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXModel, sel_presentationModelWithGeometryRef_, v18, v19);
      case 3:
        uint64_t v20 = sub_1B64A16A0((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v20) {
          return 0;
        }
        return (id)objc_msgSend_skinnerWithSkinnerRef_(VFXSkinner, v21, v20, v22);
      case 4:
        uint64_t v23 = sub_1B64A14EC((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v23) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXMorpher, sel_presentationMorpherWithMorpherRef_, v23, v24);
      case 5:
        node = self->_node;
        return (id)sub_1B64A0448((uint64_t)node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
      case 6:
        return 0;
      case 7:
        id result = sub_1B64A47D0((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!result) {
          return 0;
        }
        return result;
      case 8:
        CFDictionaryRef v26 = sub_1B64A4A00((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v26) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXForceField, sel_presentationForceFieldWithForceFieldRef_, v26, v27);
      case 9:
        uint64_t v28 = self->_node;
        return (id)sub_1B64A3CC0((uint64_t)v28, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
      case 10:
        CFDictionaryRef v29 = sub_1B64A4B14((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v29) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXBehaviorGraph, sel_presentationBehaviorGraphWithCoreEntityHandleRef_, v29, v30);
      case 11:
        CFDictionaryRef v31 = sub_1B64A04D4((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v31) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXParticleEmitter, sel_presentationParticleEmitterWithCoreEntityHandleRef_, v31, v32);
      case 12:
        CFDictionaryRef v33 = sub_1B64A4AF4((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v33) {
          return 0;
        }
        return (id)MEMORY[0x1F4181798](VFXParticleCollider, sel_presentationParticleColliderWithCoreEntityHandleRef_, v33, v34);
      default:
        sub_1B63F2F54(16, @"Error: unknown component type : %d", a3, v3, v4, v5, v6, v7, a3);
        return 0;
    }
  }
  else if ((((*((_WORD *)self + 26) & 0x3FFFu) >> a3) & 1) != 0 && (components = self->_components) != 0)
  {
    while (objc_msgSend_type(components, a2, a3, v3) != a3)
    {
      id result = (id)objc_msgSend_next(components, v11, v12, v13);
      components = result;
      if (!result) {
        return result;
      }
    }
    return (id)objc_msgSend_component(components, v11, v12, v13);
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)_removeComponentWithType:(int64_t)a3
{
  components = self->_components;
  if (components)
  {
    if (objc_msgSend_type(self->_components, a2, a3, v3) == a3)
    {
      uint64_t v10 = 0;
LABEL_7:
      CFDictionaryRef v16 = objc_msgSend_next(components, v7, v8, v9);
      if (v10)
      {
        objc_msgSend_setNext_(v10, v17, (uint64_t)v16, v18);
      }
      else
      {
        self->_components = (VFXNodeComponent *)v16;
      }
      *((_WORD *)self + 26) &= (unsigned __int16)~(1 << a3) | 0xC000;
    }
    else
    {
      BOOL v11 = components;
      while (1)
      {
        uint64_t v12 = (VFXNodeComponent *)objc_msgSend_next(v11, v7, v8, v9);
        if (!v12) {
          break;
        }
        components = v12;
        uint64_t v10 = v11;
        BOOL v11 = v12;
        if (objc_msgSend_type(v12, v13, v14, v15) == a3) {
          goto LABEL_7;
        }
      }
    }
  }
}

- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4
{
  int v7 = 1 << a4;
  if ((*((_WORD *)self + 26) & (unsigned __int16)(1 << a4) & 0x3FFF) != 0 && (components = self->_components) != 0)
  {
    while (objc_msgSend_type(components, a2, (uint64_t)a3, a4) != a4)
    {
      components = objc_msgSend_next(components, v9, v10, v11);
      if (!components) {
        goto LABEL_5;
      }
    }
    objc_msgSend_setComponent_(components, v9, (uint64_t)a3, v11);
  }
  else
  {
LABEL_5:
    uint64_t v12 = [VFXNodeComponent alloc];
    uint64_t v14 = (VFXNodeComponent *)objc_msgSend_initWithType_component_(v12, v13, a4, (uint64_t)a3);
    objc_msgSend_setNext_(v14, v15, (uint64_t)self->_components, v16);

    self->_components = v14;
    *((_WORD *)self + 26) |= v7 & 0x3FFF;
  }
}

- (id)__light
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 0, v2);
  uint64_t v8 = (void *)ComponentWithType;
  if ((*((unsigned char *)self + 48) & 2) == 0 && !ComponentWithType)
  {
    uint64_t v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    *((unsigned char *)self + 48) |= 2u;
    CFDictionaryRef v18 = sub_1B649F640((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v8 = objc_msgSend_lightWithLightRef_(VFXLight, v5, (uint64_t)v18, v7);
      objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 0);
      if (!v17) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    uint64_t v8 = 0;
    if (v17) {
LABEL_7:
    }
      sub_1B64B0CB4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
  }
LABEL_8:
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return v8;
  }

  return (id)objc_msgSend_presentationLight(v8, v5, v6, v7);
}

- (id)__camera
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 1, v2);
  uint64_t v8 = (void *)ComponentWithType;
  if ((*((unsigned char *)self + 48) & 8) == 0 && !ComponentWithType)
  {
    uint64_t v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    *((unsigned char *)self + 48) |= 8u;
    CFDictionaryRef v18 = sub_1B64A3B48((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v8 = objc_msgSend_cameraWithCameraRef_(VFXCamera, v5, (uint64_t)v18, v7);
      objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 1);
      if (!v17) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    uint64_t v8 = 0;
    if (v17) {
LABEL_7:
    }
      sub_1B64B0CB4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
  }
LABEL_8:
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return v8;
  }

  return (id)objc_msgSend_presentationCamera(v8, v5, v6, v7);
}

- (id)__model
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 2, v2);
  uint64_t v8 = (void *)ComponentWithType;
  if ((*((unsigned char *)self + 48) & 4) == 0 && !ComponentWithType)
  {
    *((unsigned char *)self + 48) |= 4u;
    uint64_t v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v18 = sub_1B649F5F4((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v8 = objc_msgSend_modelWithGeometryRef_(VFXModel, v5, v18, v7);
      objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 2);
      if (!v17) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    uint64_t v8 = 0;
    if (v17) {
LABEL_7:
    }
      sub_1B64B0CB4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
  }
LABEL_8:
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return v8;
  }

  return (id)objc_msgSend_presentationModel(v8, v5, v6, v7);
}

- (id)__skinner
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 3, v2);
  uint64_t v8 = (void *)ComponentWithType;
  if ((*((unsigned char *)self + 48) & 0x10) == 0 && !ComponentWithType)
  {
    uint64_t v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    *((unsigned char *)self + 48) |= 0x10u;
    uint64_t v18 = sub_1B64A16A0((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (!v18)
    {
      uint64_t v8 = 0;
      if (!v17) {
        return v8;
      }
      goto LABEL_9;
    }
    uint64_t v8 = objc_msgSend_skinnerWithSkinnerRef_(VFXSkinner, v19, v18, v21);
    if (objc_msgSend_model(self, v26, v27, v28))
    {
      uint64_t v32 = objc_msgSend_model(self, v29, v30, v31);
      uint64_t v36 = objc_msgSend_mesh(v32, v33, v34, v35);
      objc_msgSend__setBaseMesh_(v8, v37, v36, v38);
    }
    objc_msgSend__setComponent_withType_(self, v29, (uint64_t)v8, 3);
    if (v17) {
LABEL_9:
    }
      sub_1B64B0CB4(v17, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
  }
  return v8;
}

- (id)__morpher
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 4, v2);
  uint64_t v8 = (void *)ComponentWithType;
  if ((*((unsigned char *)self + 48) & 0x20) == 0 && !ComponentWithType)
  {
    uint64_t v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    *((unsigned char *)self + 48) |= 0x20u;
    uint64_t v18 = sub_1B64A14EC((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v23 = sub_1B63CD09C(v18);
      uint64_t v8 = objc_msgSend_morpherWithMorphRef_(VFXMorpher, v24, v23, v25);
      objc_msgSend__setComponent_withType_(self, v26, (uint64_t)v8, 4);
      if (!v17) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    uint64_t v8 = 0;
    if (v17) {
LABEL_7:
    }
      sub_1B64B0CB4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
  }
LABEL_8:
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return v8;
  }

  return (id)objc_msgSend_presentationObject(v8, v5, v6, v7);
}

- (__CFXNode)nodeRef
{
  return self->_node;
}

- (id)hitTestWithSegmentFromPoint:(VFXNode *)self toPoint:(SEL)a2 options:(id)a3
{
  double v63 = v4;
  double v64 = v5;
  uint64_t v8 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  if (v8)
  {
    uint64_t v16 = (__n128 *)v8;
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    memset(v67, 0, sizeof(v67));
    if (a3)
    {
      uint64_t v23 = objc_msgSend_objectForKey_(a3, v17, @"kHitTestRootNode", v19);
      uint64_t v24 = self;
      if (v23) {
        uint64_t v24 = objc_msgSend_objectForKey_(a3, v20, @"kHitTestRootNode", v22);
      }
      uint64_t v25 = objc_msgSend_nodeRef(v24, v20, v21, v22);
      id v29 = (id)objc_msgSend_mutableCopy(a3, v26, v27, v28);
      objc_msgSend_setObject_forKey_(v29, v30, v25, @"kHitTestRootNode");
    }
    else
    {
      uint64_t v35 = objc_msgSend_nodeRef(self, v17, v18, v19);
      id v29 = (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v36, v37, v38);
      objc_msgSend_setObject_forKey_(v29, v39, v35, @"kHitTestRootNode");
    }
    objc_msgSend_convertPosition_toNode_(self, v31, 0, v32, v63);
    long long v66 = v40;
    objc_msgSend_convertPosition_toNode_(self, v41, 0, v42, v64);
    __n128 v65 = v43;
    sub_1B6456E10(v67, &v66, &v65);
    uint64_t v49 = (const void *)sub_1B63D9CE8(v16, v67, (CFDictionaryRef)v29, v44, v45, v46, v47, v48);
    CFDictionaryRef v33 = objc_msgSend_hitTestResultsFromHitTestResultRef_(VFXHitTestResult, v50, (uint64_t)v49, v51);
    if (v49) {
      CFRelease(v49);
    }
    sub_1B64B0CB4((uint64_t)v16, v52, v53, v54, v55, v56, v57, v58);
    uint64_t v34 = objc_msgSend_count(v33, v59, v60, v61);
  }
  else
  {
    CFDictionaryRef v33 = 0;
    uint64_t v34 = objc_msgSend_count(0, v9, v10, v11);
  }
  if (v34) {
    return v33;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_updateTransform
{
  unsigned int v9 = *((unsigned __int8 *)self + 49);
  if ((v9 & 1) == 0)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. cannot update matrix without affine", v2, v3, v4, v5, v6, v7, (uint64_t)"_affineUpToDate");
    unsigned int v9 = *((unsigned __int8 *)self + 49);
  }
  int v10 = (v9 >> 5) & 3;
  if (v10 == 2)
  {
    float32x4_t v27 = *(float32x4_t *)&self->_anon_90[2];
    float32x4_t v28 = vmulq_f32(v27, v27);
    float32x4_t v29 = vmulq_laneq_f32(v27, v27, 3);
    float v30 = vmulq_lane_f32(v27, *(float32x2_t *)v27.f32, 1).f32[0];
    v28.f32[0] = 0.5 - v28.f32[0];
    float32x2_t v31 = vmul_laneq_f32(*(float32x2_t *)v27.f32, v27, 2);
    v32.i32[3] = 0;
    v32.f32[0] = (float)(0.5 - v28.f32[1]) - v28.f32[2];
    v32.f32[1] = v30 + v29.f32[2];
    v32.f32[2] = v31.f32[0] - v29.f32[1];
    v33.i32[3] = 0;
    float32x4_t v11 = vaddq_f32(v32, v32);
    v33.f32[0] = v30 - v29.f32[2];
    v33.f32[1] = v28.f32[0] - v28.f32[2];
    v33.f32[2] = v31.f32[1] + v29.f32[0];
    *(int32x2_t *)v29.f32 = vrev64_s32(*(int32x2_t *)v29.f32);
    v34.i32[0] = vadd_f32(v31, *(float32x2_t *)v29.f32).u32[0];
    v34.i32[1] = vsub_f32(v31, *(float32x2_t *)&v29).i32[1];
    v34.f32[2] = v28.f32[0] - v28.f32[1];
    float32x4_t v12 = vaddq_f32(v33, v33);
    v34.i32[3] = 0;
    float32x4_t v13 = vaddq_f32(v34, v34);
LABEL_13:
    int v14 = 1065353216;
    goto LABEL_14;
  }
  if (v10 == 1)
  {
    float32x4_t v35 = *(float32x4_t *)&self->_anon_90[2];
    float32x4_t v36 = vmulq_f32(v35, v35);
    v36.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u64[0];
    float32x4_t v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0);
    v37.i32[3] = 0;
    float32x4_t v38 = vrsqrteq_f32(v37);
    float32x4_t v39 = vmulq_f32(v38, vrsqrtsq_f32(v37, vmulq_f32(v38, v38)));
    int8x16_t v40 = (int8x16_t)vmulq_f32(v39, vrsqrtsq_f32(v37, vmulq_f32(v39, v39)));
    int32x4_t v41 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v36.f32[0] != 0.0)), 0x1FuLL));
    v41.i32[3] = 0;
    __asm { FMOV            V4.4S, #1.0 }
    float32x4_t v65 = vmulq_f32(v35, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v41), v40, _Q4));
    float32x4_t v67 = (float32x4_t)_Q4;
    __float2 v47 = __sincosf_stret(v35.f32[3]);
    float32x4_t v48 = v65;
    float32x4_t v49 = vmulq_f32(v48, v48);
    int8x16_t v50 = (int8x16_t)vmlaq_n_f32(v49, vsubq_f32(v67, v49), v47.__cosval);
    float v51 = (float)(1.0 - v47.__cosval) * vmulq_lane_f32(v48, *(float32x2_t *)v48.f32, 1).f32[0];
    float32x4_t v52 = vmulq_n_f32(v65, -v47.__sinval);
    *(float *)&unsigned int v53 = v51 - v52.f32[2];
    v48.f32[0] = v51 + v52.f32[2];
    float32x2_t v54 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v65.f32, v65, 2), 1.0 - v47.__cosval);
    *(float *)&unsigned int v55 = v54.f32[0] + v52.f32[1];
    *(float *)&unsigned int v56 = v54.f32[1] - v52.f32[0];
    *(int32x2_t *)v52.f32 = vrev64_s32(*(int32x2_t *)v52.f32);
    v13.i32[0] = vsub_f32(v54, *(float32x2_t *)v52.f32).u32[0];
    v13.i32[1] = vadd_f32(v54, *(float32x2_t *)&v52).i32[1];
    v11.i64[0] = __PAIR64__(v53, v50.u32[0]);
    v11.i64[1] = v55;
    v12.i64[0] = __PAIR64__(v50.u32[1], v48.u32[0]);
    v12.i64[1] = v56;
    v13.i64[1] = vextq_s8(v50, v50, 8uLL).u32[0];
    goto LABEL_13;
  }
  float32x4_t v11 = 0uLL;
  float32x4_t v12 = 0uLL;
  float32x4_t v13 = 0uLL;
  int v14 = 0;
  if (!v10)
  {
    __float2 v15 = __sincosf_stret(*(float *)&self->_anon_90[2]);
    v16.i32[0] = 0;
    v16.i32[1] = LODWORD(v15.__cosval);
    v16.i64[1] = LODWORD(v15.__sinval);
    v17.i32[0] = 0;
    v17.f32[1] = -v15.__sinval;
    v17.i64[1] = LODWORD(v15.__cosval);
    float32x4_t v64 = v17;
    float32x4_t v66 = v16;
    __float2 v18 = __sincosf_stret(*(float *)&self->_anon_90[6]);
    v19.i32[3] = 0;
    v19.i64[0] = LODWORD(v18.__cosval);
    v19.f32[2] = -v18.__sinval;
    v20.i64[0] = LODWORD(v18.__sinval);
    v20.i64[1] = LODWORD(v18.__cosval);
    float32x4_t v62 = v20;
    float32x4_t v63 = v19;
    __float2 v21 = __sincosf_stret(*(float *)&self->_anon_90[10]);
    uint64_t v22 = 0;
    v23.i32[1] = 0;
    v23.i64[1] = 0;
    long long v68 = xmmword_1B6E4F300;
    float32x4_t v69 = v66;
    float32x4_t v70 = v64;
    long long v71 = 0u;
    float32x4_t v72 = 0u;
    float32x4_t v73 = 0u;
    do
    {
      *(long long *)((char *)&v71 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(long long *)((char *)&v68 + v22))), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)((char *)&v68 + v22), 1), v62, *(float32x4_t *)((char *)&v68 + v22), 2);
      v22 += 16;
    }
    while (v22 != 48);
    uint64_t v24 = 0;
    float32x4_t cosval_low = (float32x4_t)LODWORD(v21.__cosval);
    cosval_low.i32[1] = LODWORD(v21.__sinval);
    cosval_low.i32[2] = 0;
    v23.f32[0] = -v21.__sinval;
    float32x4_t v26 = v23;
    v26.i32[1] = LODWORD(v21.__cosval);
    v26.i32[2] = 0;
    long long v68 = v71;
    float32x4_t v69 = v72;
    float32x4_t v70 = v73;
    long long v71 = 0u;
    float32x4_t v72 = 0u;
    float32x4_t v73 = 0u;
    do
    {
      *(long long *)((char *)&v71 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(long long *)((char *)&v68 + v24))), v26, *(float32x2_t *)((char *)&v68 + v24), 1), (float32x4_t)xmmword_1B6E4F2E0, *(float32x4_t *)((char *)&v68 + v24), 2);
      v24 += 16;
    }
    while (v24 != 48);
    float32x4_t v11 = (float32x4_t)v71;
    float32x4_t v12 = v72;
    float32x4_t v13 = v73;
    v11.i32[3] = 0;
    v12.i32[3] = 0;
    int v14 = 1065353216;
    v13.i32[3] = 0;
  }
LABEL_14:
  float32x4_t v57 = *(float32x4_t *)&self->_scale[2];
  float32x4_t v58 = vmulq_n_f32(v11, v57.f32[0]);
  float32x4_t v59 = vmulq_lane_f32(v12, *(float32x2_t *)v57.f32, 1);
  float32x4_t v60 = vmulq_laneq_f32(v13, v57, 2);
  long long v61 = *(_OWORD *)&self->_position[2];
  HIDWORD(v61) = v14;
  *(float32x4_t *)&self->_anon_40[2] = v58;
  *(float32x4_t *)&self->_anon_40[18] = v59;
  *(float32x4_t *)&self->_anon_40[34] = v60;
  *(_OWORD *)&self->_anon_40[50] = v61;
  *((unsigned char *)self + 49) = v9 | 2;
}

- (void)_updateAffine
{
  if ((*((unsigned char *)self + 49) & 2) == 0) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. cannot update affine without matrix", v2, v3, v4, v5, v6, v7, (uint64_t)"_transformUpToDate");
  }
  sub_1B64CC360((float32x4_t *)&self->_anon_90[2], (__n128 *)&self->_position[2], (float32x4_t *)&self->_scale[2], *(float32x4_t *)&self->_anon_40[2], *(float32x4_t *)&self->_anon_40[18], *(float32x4_t *)&self->_anon_40[34], *(__n128 *)&self->_anon_40[50]);
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0x9E | 0x41;
}

- (int64_t)rotationRepresentation
{
  return ((unint64_t)*((unsigned __int8 *)self + 49) >> 5) & 3;
}

- (double)_quaternion
{
  unsigned int v5 = a1[3].u8[1];
  if ((v5 & 1) == 0)
  {
    objc_msgSend__updateAffine(a1, a2, a3, a4);
    unsigned int v5 = a1[3].u8[1];
  }
  int v6 = (v5 >> 5) & 3;
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend_rotation(a1, a2, a3, a4);
      float32x4_t v21 = vmulq_f32(v20, v20);
      v21.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).u64[0];
      float32x4_t v22 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 0);
      v22.i32[3] = 0;
      float32x4_t v23 = vrsqrteq_f32(v22);
      float32x4_t v24 = vmulq_f32(v23, vrsqrtsq_f32(v22, vmulq_f32(v23, v23)));
      int8x16_t v25 = (int8x16_t)vmulq_f32(v24, vrsqrtsq_f32(v22, vmulq_f32(v24, v24)));
      int32x4_t v26 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v21.f32[0] != 0.0)), 0x1FuLL));
      v26.i32[3] = 0;
      __asm { FMOV            V3.4S, #1.0 }
      v7.i64[0] = vmulq_n_f32(vmulq_f32(v20, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v26), v25, _Q3)), __sincosf_stret(vmuls_lane_f32(0.5, v20, 3)).__sinval).u64[0];
    }
    else
    {
      v7.i64[0] = 0;
      if (v6 == 2) {
        float32x4_t v7 = a1[9];
      }
    }
  }
  else
  {
    v8.i64[0] = 0x3F0000003F000000;
    v8.i64[1] = 0x3F0000003F000000;
    simd_float4 v9 = (simd_float4)vmulq_f32(a1[9], v8);
    v9.i32[3] = 0;
    simd_float4 x = v9;
    simd_float4 v30 = _simd_cos_f4(v9);
    _Q1 = _simd_sin_f4(x);
    _Q7 = v30;
    v7.f32[0] = vmlas_n_f32(-(float)(v30.f32[0] * vmuls_lane_f32(_Q1.f32[1], (float32x4_t)_Q1, 2)), vmuls_lane_f32(v30.f32[1], (float32x4_t)v30, 2), _Q1.f32[0]);
    _S4 = vmuls_lane_f32(v30.f32[0], *(float32x2_t *)_Q1.f32, 1);
    __asm { FMLA            S5, S4, V7.S[2] }
    _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
    __asm { FMLA            S6, S4, V1.S[2] }
    v7.i32[1] = _S5;
  }
  return *(double *)v7.i64;
}

- (uint64_t)_setQuaternion:(uint64_t)a3
{
  if ((*(unsigned char *)(a1 + 49) & 1) == 0) {
    objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
  }
  uint64_t result = objc_msgSend__quaternion((void *)a1, a2, a3, a4, *(_OWORD *)&a5);
  if ((vminvq_u32((uint32x4_t)vceqq_f32(v19, v9)) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_((void *)a1, v7, @"orientation", v8);
    char v10 = *(unsigned char *)(a1 + 49);
    *(float32x4_t *)(a1 + 144) = v19;
    *(unsigned char *)(a1 + 49) = v10 & 0x9D | 0x40;
    uint64_t v14 = objc_msgSend_worldRef((void *)a1, v11, v12, v13);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B64CC93C;
    v20[3] = &unk_1E61412D0;
    float32x4_t v21 = v19;
    uint64_t v22 = a1;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v15, v14, a1, @"orientation", v20);
    return objc_msgSend_didChangeValueForKey_((void *)a1, v16, @"orientation", v17);
  }
  return result;
}

- (double)_euler
{
  char v5 = *(unsigned char *)(a1 + 49);
  if ((v5 & 1) == 0)
  {
    objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    char v5 = *(unsigned char *)(a1 + 49);
  }
  if ((v5 & 0x60) != 0)
  {
    objc_msgSend__quaternion((void *)a1, a2, a3, a4);
    _Q2 = v6;
    int8x16_t v8 = (int8x16_t)vmulq_f32(v6, v6);
    float v9 = vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)));
    *(void *)&long long v10 = 0;
    if (v9 != 0.0)
    {
      float v11 = _Q2.f32[3];
      _S9 = _Q2.f32[1];
      float v13 = _Q2.f32[2];
      __asm { FMLA            S1, S9, V2.S[3] }
      float v19 = _S1 / v9;
      double v20 = (float)(_S1 / v9);
      if (v20 <= 0.4999)
      {
        if (v20 >= -0.4999)
        {
          float v24 = *(float *)&v8.i32[1];
          uint64_t v25 = v8.i64[1];
          float v27 = _Q2.f32[0];
          float v28 = *(float *)v8.i32;
          float v30 = atan2f((float)((float)(_Q2.f32[0] * _Q2.f32[3]) + (float)(_Q2.f32[1] * _Q2.f32[2]))+ (float)((float)(_Q2.f32[0] * _Q2.f32[3]) + (float)(_Q2.f32[1] * _Q2.f32[2])), *(float *)&v8.i32[3]+ (float)(*(float *)&v8.i32[2] + (float)((float)-*(float *)v8.i32 - *(float *)&v8.i32[1])));
          float v29 = asinf(v19 + v19);
          atan2f((float)((float)(v13 * v11) + (float)(v27 * _S9)) + (float)((float)(v13 * v11) + (float)(v27 * _S9)), *((float *)&v25 + 1) + (float)((float)(v28 - v24) - *(float *)&v25));
          *(void *)&long long v10 = __PAIR64__(LODWORD(v29), LODWORD(v30));
          return *(double *)&v10;
        }
        float v23 = atan2f(_Q2.f32[0], _Q2.f32[3]);
        *(float *)&long long v10 = v23 + v23;
        uint64_t v22 = &dword_1B6E500B0;
      }
      else
      {
        float v21 = atan2f(_Q2.f32[0], _Q2.f32[3]);
        *(float *)&long long v10 = v21 + v21;
        uint64_t v22 = &dword_1B6E500B4;
      }
      DWORD1(v10) = *v22;
    }
  }
  else
  {
    long long v10 = *(_OWORD *)(a1 + 144);
  }
  return *(double *)&v10;
}

- (void)_setPosition:(VFXNode *)self
{
  float32x4_t v14 = v4;
  if ((*((unsigned char *)self + 49) & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    float32x4_t v4 = v14;
  }
  uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_position[2], v4);
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, @"position", v3);
    *((unsigned char *)self + 49) &= ~2u;
    *(float32x4_t *)&self->_position[2] = v14;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B64CCBE8;
    v15[3] = &unk_1E61412D0;
    uint64_t v17 = self;
    float32x4_t v16 = v14;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"translation", v15);
    objc_msgSend_didChangeValueForKey_(self, v12, @"position", v13);
  }
}

- (void)_setScale:(VFXNode *)self
{
  float32x4_t v14 = v4;
  if ((*((unsigned char *)self + 49) & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    float32x4_t v4 = v14;
  }
  uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_scale[2], v4);
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, @"scale", v3);
    *((unsigned char *)self + 49) &= ~2u;
    *(float32x4_t *)&self->_scale[2] = v14;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B64CCD10;
    v15[3] = &unk_1E61412D0;
    uint64_t v17 = self;
    float32x4_t v16 = v14;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"scale", v15);
    objc_msgSend_didChangeValueForKey_(self, v12, @"scale", v13);
  }
}

+ (id)keyPathsForValuesAffectingPosition
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"transform", v2, 0);
}

+ (id)keyPathsForValuesAffectingTransform
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"position", v2, @"rotation", @"eulerAngles", @"orientation", @"scale", 0);
}

+ (id)keyPathsForValuesAffectingRotation
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"eulerAngles", v2, @"orientation", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingEulerAngles
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"rotation", v2, @"orientation", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingOrientation
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"rotation", v2, @"eulerAngles", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingScale
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"transform", v2, 0);
}

- (BOOL)isHittable
{
  return sub_1B64A38D0((uint64_t)self->_node);
}

- (void)setHittable:(BOOL)a3
{
}

- (BOOL)castsShadow
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return *((unsigned char *)self + 50) & 1;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    char v22 = sub_1B64A3638((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    node = self->_node;
    return sub_1B64A3638((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setCastsShadow:(BOOL)a3
{
  char v6 = *((unsigned char *)self + 50);
  if ((v6 & 1) == 0) == a3 || (*((unsigned char *)self + 48))
  {
    *((unsigned char *)self + 50) = v6 & 0xFE | a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64CD020;
    v9[3] = &unk_1E6141190;
    v9[4] = self;
    BOOL v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (BOOL)usesDepthPrePass
{
  if (*((unsigned char *)self + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      char v22 = sub_1B64A04E4((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
      LOBYTE(v5) = v22;
    }
    else
    {
      node = self->_node;
      LOBYTE(v5) = sub_1B64A04E4((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 50) >> 1) & 1;
  }
  return v5;
}

- (void)setUsesDepthPrePass:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 50);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 50) = v4 & 0xFD | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64CD180;
    void v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return self->_categoryBitMask;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    unint64_t v22 = sub_1B64A3808((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    node = self->_node;
    return sub_1B64A3808((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  if (self->_categoryBitMask != a3)
  {
    self->_categoryBitMasuint64_t k = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64CD2BC;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)isHidden
{
  if (*((unsigned char *)self + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      char v22 = sub_1B649F390((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
      LOBYTE(v5) = v22;
    }
    else
    {
      node = self->_node;
      LOBYTE(v5) = sub_1B649F390((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return *((unsigned __int8 *)self + 49) >> 7;
  }
  return v5;
}

- (void)setHidden:(BOOL)a3
{
  unsigned int v6 = *((unsigned __int8 *)self + 49);
  if (a3 != v6 >> 7 || (*((unsigned char *)self + 48) & 1) != 0)
  {
    if (a3) {
      char v7 = 0x80;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 49) = v7 & 0x80 | v6 & 0x7F;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64CD41C;
    void v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"hidden", v10);
  }
}

- (BOOL)isHiddenOrHasHiddenAncestor
{
  if (objc_msgSend_isHidden(self, a2, v2, v3)) {
    return 1;
  }
  uint64_t v9 = objc_msgSend_parentNode(self, v5, v6, v7);

  return MEMORY[0x1F4181798](v9, sel_isHiddenOrHasHiddenAncestor, v10, v11);
}

- (float)opacity
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return self->_opacity;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B64A0C9C((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    node = self->_node;
    return sub_1B64A0C9C((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setOpacity:(float)a3
{
  double v6 = a3;
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  float v7 = fmax(v6, 0.0);
  if (self->_opacity != v7 || (*((unsigned char *)self + 48) & 1) != 0)
  {
    self->_opacity = v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64CD5E4;
    void v10[3] = &unk_1E6141208;
    v10[4] = self;
    float v11 = v7;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"opacity", v10);
  }
}

- (int64_t)renderingOrder
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    return self->_renderingOrder;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    CFDictionaryRef v22 = sub_1B64A34FC((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return (int64_t)v22;
  }
  else
  {
    node = self->_node;
    return (int64_t)sub_1B64A34FC((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setRenderingOrder:(int64_t)a3
{
  if (self->_renderingOrder != a3 || (*((unsigned char *)self + 48) & 1) != 0)
  {
    self->_renderingOrder = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64CD72C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (VFXNode)parentNode
{
  if (*((unsigned char *)self + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = sub_1B64A1E7C((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
    if (v15)
    {
      int v5 = (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v16, v15, v18);
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return self->_parent;
}

- (NSArray)childNodes
{
  if (*((unsigned char *)self + 48))
  {
    uint64_t v10 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v18 = v10;
    if (v10) {
      sub_1B64B0C28(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    unsigned int v19 = sub_1B64A180C((uint64_t)self->_node);
    uint64_t v20 = v19;
    uint64_t v9 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v21, v19, v22);
    if (v19)
    {
      uint64_t v30 = 0;
      do
      {
        uint64_t v31 = sub_1B64A1A44((uint64_t)self->_node, v30);
        uint64_t v34 = objc_msgSend_nodeWithNodeRef_(VFXNode, v32, v31, v33);
        objc_msgSend_addObject_(v9, v35, v34, v36);
        ++v30;
      }
      while (v20 != v30);
    }
    if (v18) {
      sub_1B64B0CB4(v18, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    int v5 = (NSArray *)(id)objc_msgSend_copy(self->_childNodes, a2, v2, v3);
    if (objc_msgSend_count(v5, v6, v7, v8)) {
      return v5;
    }
    else {
      return (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v9;
}

- (id)mutableChildNodes
{
  return self->_childNodes;
}

- (void)_setComponent:(id)a3 withType:(int64_t)a4
{
  if (a3) {
    objc_msgSend__assignComponent_toContainerWithType_(self, a2, (uint64_t)a3, a4);
  }
  else {
    objc_msgSend__removeComponentWithType_(self, a2, a4, a4);
  }
}

- (void)setLight:(id)a3
{
  if ((id)objc_msgSend_light(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 0);
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64CD97C;
    v12[3] = &unk_1E6141230;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (VFXLight)light
{
  return (VFXLight *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel___light);
}

- (VFXSkinner)skinner
{
  return (VFXSkinner *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel___skinner);
}

- (BOOL)isJoint
{
  return (*((unsigned __int8 *)self + 49) >> 3) & 1;
}

- (void)setIsJoint:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xF7 | v3;
}

- (BOOL)isGizmo
{
  return (*((unsigned __int8 *)self + 49) >> 4) & 1;
}

- (void)setGizmo:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 49);
  if (((((v4 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 49) = v4 & 0xEF | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64CDAC8;
    void v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (id)prefab
{
  return (id)objc_msgSend__findComponentWithType_(self, a2, 13, v2);
}

- (void)setPrefab:(id)a3
{
}

- (void)setSkinner:(id)a3
{
  if ((id)objc_msgSend_skinner(self, a2, (uint64_t)a3, v3) != a3)
  {
    if (objc_msgSend_model(self, v6, v7, v8))
    {
      uint64_t v12 = objc_msgSend_model(self, v9, v10, v11);
      uint64_t v16 = objc_msgSend_mesh(v12, v13, v14, v15);
      objc_msgSend__setBaseMesh_(a3, v17, v16, v18);
    }
    objc_msgSend__setComponent_withType_(self, v9, (uint64_t)a3, 3);
    uint64_t v22 = objc_msgSend_worldRef(self, v19, v20, v21);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B64CDBCC;
    v24[3] = &unk_1E6141230;
    v24[4] = self;
    v24[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v23, v22, (uint64_t)self, v24);
  }
}

- (VFXMorpher)morpher
{
  return (VFXMorpher *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel___morpher);
}

- (void)setMorpher:(id)a3
{
  if ((id)objc_msgSend_morpher(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 4);
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64CDCCC;
    v12[3] = &unk_1E6141230;
    v12[4] = a3;
    v12[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (id)deformers
{
  id result = (id)objc_msgSend__findComponentWithType_(self, a2, 9, v2);
  if (!result) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (void)setDeformers:(id)a3
{
  if ((id)objc_msgSend_deformers(self, a2, (uint64_t)a3, v3) != a3)
  {
    uint64_t v9 = objc_msgSend_copy(a3, v6, v7, v8);
    objc_msgSend__setComponent_withType_(self, v10, (uint64_t)v9, 9);
    uint64_t v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B64CDE34;
    v16[3] = &unk_1E6141230;
    v16[4] = self;
    v16[5] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (void)setCamera:(id)a3
{
  if ((id)objc_msgSend_camera(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 1);
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64CDEFC;
    v12[3] = &unk_1E6141230;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (VFXCamera)camera
{
  return (VFXCamera *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel___camera);
}

- (VFXModel)model
{
  return (VFXModel *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel___model);
}

- (void)setModel:(id)a3
{
  id v6 = (id)objc_msgSend_model(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    if (v6)
    {
      world = self->_world;
      if (world) {
        objc_msgSend_removeWorldReference_(v6, v7, (uint64_t)world, v8);
      }
    }
    objc_msgSend__setComponent_withType_(self, v7, (uint64_t)a3, 2);
    uint64_t v12 = self->_world;
    if (v12) {
      objc_msgSend_addWorldReference_(a3, v10, (uint64_t)v12, v11);
    }
    uint64_t v13 = objc_msgSend_skinner(self, v10, (uint64_t)v12, v11);
    if (v13)
    {
      uint64_t v17 = (void *)v13;
      uint64_t v18 = objc_msgSend_mesh(a3, v14, v15, v16);
      objc_msgSend__setBaseMesh_(v17, v19, v18, v20);
    }
    uint64_t v21 = objc_msgSend_worldRef(self, v14, v15, v16);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1B64CE064;
    v34[3] = &unk_1E6141230;
    v34[4] = self;
    v34[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v34);
    uint64_t v26 = objc_msgSend_physicsBody(self, v23, v24, v25);
    if (v26)
    {
      uint64_t v30 = v26;
      if (objc_msgSend_hasDefaultShape(v26, v27, v28, v29)) {
        objc_msgSend_updateDefaultShape(v30, v31, v32, v33);
      }
    }
  }
}

- (void)modelChanged
{
  char v4 = objc_msgSend_physicsBody(self, a2, v2, v3);
  if (v4)
  {
    uint64_t v8 = v4;
    if (objc_msgSend_hasDefaultShape(v4, v5, v6, v7))
    {
      objc_msgSend_updateDefaultShape(v8, v9, v10, v11);
    }
  }
}

- (void)setFilters:(id)a3
{
  if ((id)objc_msgSend_filters(self, a2, (uint64_t)a3, v3) != a3)
  {
    id v9 = (id)objc_msgSend_copy(a3, v6, v7, v8);
    objc_msgSend__setComponent_withType_(self, v10, (uint64_t)v9, 5);
    uint64_t v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B64CE1BC;
    v16[3] = &unk_1E6141230;
    v16[4] = self;
    v16[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (NSArray)filters
{
  if (*((unsigned char *)self + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v22 = (NSArray *)sub_1B64A0448((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
      return v22;
    }
    else
    {
      node = self->_node;
      return (NSArray *)sub_1B64A0448((uint64_t)node, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return (NSArray *)objc_msgSend__findComponentWithType_(self, a2, 5, v3);
  }
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
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 10);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 10);
    }
    uint64_t v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B64CE35C;
    v23[3] = &unk_1E6141230;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  id result = (VFXBehaviorGraph *)objc_msgSend__findComponentWithType_(self, a2, 10, v2);
  if (*((unsigned char *)self + 48))
  {
    return (VFXBehaviorGraph *)MEMORY[0x1F4181798](result, sel_presentationBehaviorGraph, v5, v6);
  }
  return result;
}

- (void)setParticleEmitter:(id)a3
{
  id v6 = (id)objc_msgSend_particleEmitter(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    uint64_t v10 = v6;
    uint64_t v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      uint64_t v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 11);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 11);
    }
    uint64_t v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B64CE4EC;
    v23[3] = &unk_1E6141230;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (VFXParticleEmitter)particleEmitter
{
  return (VFXParticleEmitter *)objc_msgSend__findComponentWithType_(self, a2, 11, v2);
}

- (void)setParticleCollider:(id)a3
{
  id v6 = (id)objc_msgSend_particleCollider(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    uint64_t v10 = v6;
    uint64_t v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      uint64_t v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 12);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 12);
    }
    uint64_t v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B64CE630;
    v23[3] = &unk_1E6141230;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (id)particleCollider
{
  return (id)objc_msgSend__findComponentWithType_(self, a2, 12, v2);
}

- (NSString)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p", v7, v5, self);
  uint64_t v12 = objc_msgSend_name(self, v9, v10, v11);
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v8, v20, @" '%@'", v21, v19);
  }
  objc_msgSend_position(self, v16, v17, v18);
  if (*(float *)&v25 != 0.0 || *((float *)&v25 + 1) != 0.0 || v26 != 0.0) {
    objc_msgSend_appendFormat_(v8, v22, @" pos(%f %f %f)", v24, *(float *)&v25, *((float *)&v25 + 1), v26);
  }
  objc_msgSend_rotation(self, v22, v23, v24);
  BOOL v33 = *(float *)&v31 == 0.0 && *((float *)&v30 + 1) == 0.0 && *(float *)&v30 == 0.0;
  if (!v33 && *((float *)&v31 + 1) != 0.0) {
    objc_msgSend_appendFormat_(v8, v27, @" rot(%f %f %f %f)", v29, *(float *)&v30, *((float *)&v30 + 1), *(float *)&v31, *((float *)&v31 + 1));
  }
  objc_msgSend_scale(self, v27, v28, v29);
  if (*(float *)&v37 != 1.0 || *((float *)&v37 + 1) != 1.0 || v38 != 1.0) {
    objc_msgSend_appendFormat_(v8, v34, @" scale(%f %f %f)", v36, *(float *)&v37, *((float *)&v37 + 1), v38);
  }
  if (objc_msgSend_light(self, v34, v35, v36)
    || objc_msgSend_camera(self, v39, v40, v41)
    || objc_msgSend_model(self, v39, v42, v41))
  {
    objc_msgSend_appendString_(v8, v39, @" |", v41);
  }
  if (objc_msgSend_light(self, v39, v43, v41))
  {
    uint64_t v47 = objc_msgSend_light(self, v44, v45, v46);
    objc_msgSend_appendFormat_(v8, v48, @" light=%@", v49, v47);
  }
  if (objc_msgSend_camera(self, v44, v45, v46))
  {
    uint64_t v53 = objc_msgSend_camera(self, v50, v51, v52);
    objc_msgSend_appendFormat_(v8, v54, @" camera=%@", v55, v53);
  }
  if (objc_msgSend_model(self, v50, v51, v52))
  {
    uint64_t v59 = objc_msgSend_model(self, v56, v57, v58);
    objc_msgSend_appendFormat_(v8, v60, @" model=%@", v61, v59);
  }
  float32x4_t v62 = objc_msgSend_childNodes(self, v56, v57, v58);
  uint64_t v66 = objc_msgSend_count(v62, v63, v64, v65);
  if (v66 == 1)
  {
    objc_msgSend_appendString_(v8, v67, @" | 1 child", v68);
  }
  else if (v66)
  {
    objc_msgSend_appendFormat_(v8, v67, @" | %d children", v68, v66);
  }
  else
  {
    objc_msgSend_appendString_(v8, v67, @" | no child", v68);
  }
  objc_msgSend_appendString_(v8, v69, @">", v70);
  return (NSString *)v8;
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  if (!objc_msgSend_hasPrefix_(a3, a2, @"/", (uint64_t)a4))
  {
    uint64_t v16 = objc_msgSend_rangeOfString_(a3, v8, @"[", v10);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    uint64_t v20 = v16;
    uint64_t v21 = v16 + 1;
    if (v16 + 1 >= (unint64_t)objc_msgSend_length(a3, v17, v18, v19)) {
      goto LABEL_12;
    }
    uint64_t v24 = (__CFString *)objc_msgSend_substringToIndex_(a3, v22, v20, v23);
    uint64_t v27 = objc_msgSend_substringFromIndex_(a3, v25, v21, v26);
    uint64_t v30 = objc_msgSend_rangeOfString_(v27, v28, @"]", v29);
    if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    BOOL v33 = objc_msgSend_substringToIndex_(v27, v31, v30, v32);
    int v37 = objc_msgSend_intValue(v33, v34, v35, v36);
    if ((objc_msgSend_isEqualToString_(v24, v38, (uint64_t)&stru_1F0FCDBB0, v39) & 1) != 0
      || objc_msgSend_isEqualToString_(v24, v40, @"nodes", v41))
    {
      uint64_t v24 = @"childNodes";
    }
    uint64_t v42 = objc_msgSend_valueForKey_(self, v40, (uint64_t)v24, v41);
    if (objc_msgSend_count(v42, v43, v44, v45) <= (unint64_t)v37)
    {
LABEL_12:
      LOBYTE(v15) = 0;
      return (char)v15;
    }
    uint64_t v15 = objc_msgSend_objectAtIndex_(v42, v46, v37, v47);
    goto LABEL_3;
  }
  uint64_t v11 = objc_msgSend_length(a3, v8, v9, v10);
  uint64_t v13 = objc_msgSend_substringWithRange_(a3, v12, 1, v11 - 1);
  uint64_t v15 = objc_msgSend_childNodeWithName_recursively_(self, v14, v13, 1);
  if (v15)
  {
LABEL_3:
    *a5 = v15;
    LOBYTE(v15) = 1;
  }
  return (char)v15;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"transform", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_transform(self, v6, v7, v8);
LABEL_3:
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, @"position", v8))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_position(self, v14, v15, v16);
LABEL_20:
    return (id)objc_msgSend_valueWithVFXFloat3_(v17, v18, v19, v20);
  }
  if (objc_msgSend_isEqualToString_(a3, v14, @"scale", v16))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_scale(self, v21, v22, v23);
    goto LABEL_20;
  }
  if (objc_msgSend_isEqualToString_(a3, v21, @"orientation", v23))
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_orientation(self, v24, v25, v26);
  }
  else
  {
    if (objc_msgSend_isEqualToString_(a3, v24, @"eulerAngles", v26)) {
      goto LABEL_19;
    }
    if (objc_msgSend_isEqualToString_(a3, v31, @"rotation", v33))
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_rotation(self, v34, v35, v36);
      goto LABEL_15;
    }
    if (objc_msgSend_isEqualToString_(a3, v34, @"euler", v36))
    {
LABEL_19:
      uint64_t v17 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_eulerAngles(self, v31, v32, v33);
      goto LABEL_20;
    }
    if (objc_msgSend_isEqualToString_(a3, v31, @"pivot", v33))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_pivot(self, v37, v38, v39);
      goto LABEL_3;
    }
    if (objc_msgSend_isEqualToString_(a3, v37, @"worldTransform", v39))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_worldTransform(self, v40, v41, v42);
      goto LABEL_3;
    }
    if (objc_msgSend_isEqualToString_(a3, v40, @"worldPosition", v42))
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_worldPosition(self, v43, v44, v45);
      goto LABEL_20;
    }
    if (!objc_msgSend_isEqualToString_(a3, v43, @"worldOrientation", v45))
    {
      v49.receiver = self;
      v49.super_class = (Class)VFXNode;
      return [(VFXNode *)&v49 valueForKey:a3];
    }
    uint64_t v27 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_worldOrientation(self, v46, v47, v48);
  }
LABEL_15:

  return (id)objc_msgSend_valueWithVFXFloat4_(v27, v28, v29, v30);
}

- (BOOL)rawFloat4ForKey:(id)a3 value:
{
  char v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"orientation", v3))
  {
    objc_msgSend_orientation(self, v7, v8, v9);
LABEL_7:
    *char v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"rotation", v9))
  {
    objc_msgSend_rotation(self, v11, v12, v13);
    goto LABEL_7;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(a3, v11, @"worldOrientation", v13);
  if (isEqualToString)
  {
    objc_msgSend_worldOrientation(self, v15, v16, v17);
    goto LABEL_7;
  }
  return isEqualToString;
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  char v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"position", v3))
  {
    objc_msgSend_position(self, v7, v8, v9);
  }
  else if (objc_msgSend_isEqualToString_(a3, v7, @"scale", v9))
  {
    objc_msgSend_scale(self, v11, v12, v13);
  }
  else if (objc_msgSend_isEqualToString_(a3, v11, @"eulerAngles", v13) {
         || objc_msgSend_isEqualToString_(a3, v14, @"euler", v16))
  }
  {
    objc_msgSend_eulerAngles(self, v14, v15, v16);
  }
  else
  {
    int isEqualToString = objc_msgSend_isEqualToString_(a3, v14, @"worldPosition", v16);
    if (!isEqualToString) {
      return isEqualToString;
    }
    objc_msgSend_worldPosition(self, v18, v19, v20);
  }
  *char v4 = v10;
  LOBYTE(isEqualToString) = 1;
  return isEqualToString;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"transform", (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    objc_msgSend_setTransform_(self, v10, v11, v12);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v7, @"position", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setPosition_(self, v16, v17, v18);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v13, @"scale", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setScale_(self, v22, v23, v24);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v19, @"orientation", v21))
  {
    objc_msgSend_VFXFloat4Value(a3, v25, v26, v27);
    objc_msgSend_setOrientation_(self, v28, v29, v30);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v25, @"eulerAngles", v27)) {
    goto LABEL_23;
  }
  if (objc_msgSend_isEqualToString_(a4, v31, @"rotation", v33))
  {
    objc_msgSend_VFXFloat4Value(a3, v34, v35, v36);
    objc_msgSend_setRotation_(self, v37, v38, v39);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v34, @"euler", v36))
  {
LABEL_23:
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setEulerAngles_(self, v40, v41, v42);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, @"pivot", v33))
  {
    objc_msgSend_VFXMatrix4Value(a3, v43, v44, v45);
    objc_msgSend_setPivot_(self, v46, v47, v48);
  }
  else if (objc_msgSend_isEqualToString_(a4, v43, @"worldTransform", v45))
  {
    objc_msgSend_VFXMatrix4Value(a3, v49, v50, v51);
    objc_msgSend_setWorldTransform_(self, v52, v53, v54);
  }
  else if (objc_msgSend_isEqualToString_(a4, v49, @"worldPosition", v51))
  {
    objc_msgSend_VFXFloat3Value(a3, v55, v56, v57);
    objc_msgSend_setWorldPosition_(self, v58, v59, v60);
  }
  else if (objc_msgSend_isEqualToString_(a4, v55, @"worldOrientation", v57))
  {
    objc_msgSend_VFXFloat4Value(a3, v61, v62, v63);
    objc_msgSend_setWorldOrientation_(self, v64, v65, v66);
  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)VFXNode;
    [(VFXNode *)&v67 setValue:a3 forKey:a4];
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4)) {
    return 0;
  }
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  sub_1B64F9EE8(a3, (char *)&v42, &v41, v7);
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, v8, v42, (uint64_t)a3, &v43)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v11 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v43, v9, v41, (uint64_t)a4);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = objc_msgSend_count(v12, v14, v15, v16);
      uint64_t v20 = objc_msgSend_initWithCapacity_(v13, v18, v17 + 1, v19);
      objc_msgSend_addObject_(v20, v21, v42, v22);
      objc_msgSend_addObjectsFromArray_(v20, v23, (uint64_t)v12, v24);

      return v20;
    }
    return 0;
  }
  uint64_t v43 = objc_msgSend_valueForKey_(self, v9, v42, v10);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return sub_1B6500480(self, (__CFString *)a3, v26, v27);
  }
  uint64_t v28 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v43, v25, v41, (uint64_t)a4);
  if (!v28) {
    return sub_1B6500480(self, (__CFString *)a3, v26, v27);
  }
  id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v33 = objc_msgSend_count(v28, v30, v31, v32);
  uint64_t v20 = objc_msgSend_initWithCapacity_(v29, v34, v33 + 1, v35);
  objc_msgSend_addObject_(v20, v36, v42, v37);
  objc_msgSend_addObjectsFromArray_(v20, v38, (uint64_t)v28, v39);

  return v20;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_hasPrefix_(a4, a2, @"filters.", (uint64_t)a4))
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    sub_1B64F9EE8(a4, (char *)&v42, (uint64_t *)&v41, v7);
    if (v41)
    {
      CFStringRef v8 = sub_1B660CA68(&self->_node->var0.var0.var0, (CFStringRef)a4, 0);
      if (v8)
      {
        CFStringRef v16 = v8;
        if (sub_1B660F8C4((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
        {
          if (a3)
          {
            if (a4)
            {
              uint64_t v39 = 0;
              uint64_t v40 = 0;
              sub_1B64F9EE8(v41, (char *)&v40, &v39, v17);
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              uint64_t v21 = objc_msgSend_filters(self, v18, v19, v20);
              uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, (uint64_t)v43, 16);
              if (v23)
              {
                uint64_t v27 = v23;
                uint64_t v28 = *(void *)v36;
                while (2)
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v36 != v28) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                    uint64_t v31 = objc_msgSend_name(v30, v24, v25, v26);
                    if (objc_msgSend_isEqualToString_(v31, v32, v40, v33))
                    {
                      objc_msgSend_setValue_forKey_(v30, v24, (uint64_t)a3, v39);
                      goto LABEL_18;
                    }
                  }
                  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, (uint64_t)v43, 16);
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
        }
LABEL_18:
        CFRelease(v16);
      }
    }
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)VFXNode;
    [(VFXNode *)&v34 setValue:a3 forKeyPath:a4];
  }
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (objc_msgSend_hasPrefix_(a3, a2, @"filters.", v3))
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v9 = objc_msgSend_length(@"filters.", v6, v7, v8);
    uint64_t v12 = objc_msgSend_substringFromIndex_(a3, v10, v9, v11);
    sub_1B64F9EE8(v12, (char *)&v36, &v35, v13);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v17 = objc_msgSend_filters(self, v14, v15, v16);
    id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v31, (uint64_t)v37, 16);
    if (result)
    {
      id v23 = result;
      uint64_t v24 = *(void *)v32;
      while (2)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v25);
          uint64_t v27 = objc_msgSend_name(v26, v20, v21, v22);
          if (objc_msgSend_isEqualToString_(v27, v28, v36, v29)) {
            return (id)objc_msgSend_valueForKey_(v26, v20, v35, v22);
          }
          uint64_t v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v31, (uint64_t)v37, 16);
        id v23 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, v6, (uint64_t)a3, v8);
    if (!result)
    {
      v30.receiver = self;
      v30.super_class = (Class)VFXNode;
      return [(VFXNode *)&v30 valueForKeyPath:a3];
    }
  }
  return result;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v45 = 0;
  uint64_t v44 = 0;
  sub_1B64F9EE8(a3, (char *)&v45, (uint64_t *)&v44, v3);
  if (qword_1E9DDAFA8 != -1) {
    dispatch_once(&qword_1E9DDAFA8, &unk_1F0FB59E8);
  }
  if (!v44 || !objc_msgSend_containsObject_((void *)qword_1E9DDAFA0, v5, (uint64_t)v44, v6)) {
    return 0;
  }
  int v43 = 0;
  uint64_t v42 = 0;
  if (objc_msgSend_rawFloat3ForKey_value_(self, v7, v45, (uint64_t)&v42))
  {
    if (objc_msgSend_isEqualToString_(v44, v8, @"x", v9))
    {
      LODWORD(v13) = v42;
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v13);
    }
    if (objc_msgSend_isEqualToString_(v44, v10, @"y", v12))
    {
      LODWORD(v18) = HIDWORD(v42);
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v15, v16, v17, v18);
    }
    if (objc_msgSend_isEqualToString_(v44, v15, @"z", v17))
    {
      LODWORD(v21) = v43;
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v8, v19, v20, v21);
    }
  }
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if (!objc_msgSend_rawFloat4ForKey_value_(self, v8, v45, (uint64_t)&v40)) {
    return 0;
  }
  if (objc_msgSend_isEqualToString_(v44, v22, @"x", v23))
  {
    LODWORD(v27) = v40;
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v24, v25, v26, v27);
  }
  if (objc_msgSend_isEqualToString_(v44, v24, @"y", v26))
  {
    LODWORD(v31) = HIDWORD(v40);
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v28, v29, v30, v31);
  }
  if (objc_msgSend_isEqualToString_(v44, v28, @"z", v30))
  {
    LODWORD(v35) = v41;
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v32, v33, v34, v35);
  }
  if (!objc_msgSend_isEqualToString_(v44, v32, @"w", v34)) {
    return 0;
  }
  LODWORD(v39) = HIDWORD(v41);
  return (id)objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v38, v39);
}

- (id)valueForUndefinedKey:(id)a3
{
  if ((*((unsigned char *)self + 48) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = (void *)sub_1B6584D68((uint64_t)self->_node, a3, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = v15;
  if (v15)
  {
    uint64_t v23 = (double *)sub_1B6562568((uint64_t)v15, (uint64_t)a2, v16, v17, v18, v19, v20, v21);
    double v31 = (const char *)sub_1B65625B4((uint64_t)v22, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v22 = (void *)sub_1B6604BA0(v23, v31, v34, v32, v33);
  }
  if (v14) {
    sub_1B64B0CB4(v14, (uint64_t)a2, v16, v17, v18, v19, v20, v21);
  }
  if (!v22)
  {
LABEL_9:
    double v39 = 0;
    if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, a2, (uint64_t)a3, (uint64_t)a3, &v39))
    {
      return v39;
    }
    else
    {
      os_unfair_lock_lock(&self->_valueForKeyLock);
      id v37 = (id)objc_msgSend_objectForKey_(self->_valueForKey, v35, (uint64_t)a3, v36);
      os_unfair_lock_unlock(&self->_valueForKeyLock);
      if (v37) {
        return v37;
      }
      else {
        return 0;
      }
    }
  }
  return v22;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v7 = (__int16 *)sub_1B6604FE8(self, a4);
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  if (a3)
  {
    if (!valueForKey)
    {
      valueForKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_valueForKey = valueForKey;
    }
    objc_msgSend_setObject_forKey_(valueForKey, v8, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(valueForKey, v8, (uint64_t)a4, v9);
  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  uint64_t v11 = sub_1B6604FE8(self, a4);
  uint64_t v17 = (void *)v11;
  if (v7 && v11)
  {
    node = self->_node;
    sub_1B6584BAC((uint64_t)node, a4, v7, v12, v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_stringByAppendingString_(@"customProperty", v19, @".", v20);
    uint64_t v24 = objc_msgSend_stringByAppendingString_(v21, v22, (uint64_t)a4, v23);
    uint64_t v28 = objc_msgSend_worldRef(self, v25, v26, v27);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1B64CFA74;
    v30[3] = &unk_1E6143008;
    void v30[5] = v17;
    v30[6] = node;
    v30[4] = a4;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v29, v28, (uint64_t)self, v24, v30);
  }
}

- (void)__CFObject
{
  return self->_node;
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
    v22[2] = sub_1B64CFC98;
    v22[3] = &unk_1E61411B8;
    v22[4] = a3;
    void v22[5] = self;
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
    if (objc_msgSend_isPausedOrPausedByInheritance(self, v22, v23, v24))
    {
      objc_msgSend__pauseAnimation_forKey_pausedByNode_(self, v25, 1, v9, 1);
    }
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
  v12[2] = sub_1B64CFECC;
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
  v14[2] = sub_1B64CFF94;
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
    v13[2] = sub_1B64D0070;
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
    v15[2] = sub_1B64D0154;
    v15[3] = &unk_1E6141258;
    void v15[4] = self;
    v15[5] = a3;
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
    v29[2] = sub_1B64D0694;
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
  v14[2] = sub_1B64D07F0;
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
  v8[2] = sub_1B64D08CC;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_setParent:(id)a3
{
  self->_parent = (VFXNode *)a3;
}

- (unint64_t)countOfChildNodes
{
  return objc_msgSend_count(self->_childNodes, a2, v2, v3);
}

- (id)objectInChildNodesAtIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  uint64_t v7 = objc_msgSend_objectAtIndex_(self->_childNodes, v5, a3, v6);
  objc_sync_exit(self);
  return v7;
}

- (void)_reSyncModelTree
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend_removeAllObjects(self->_childNodes, a2, v2, v3);
  node = self->_node;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B64D0AA4;
  v19[3] = &unk_1E6142F98;
  v19[4] = self;
  sub_1B649FD10((uint64_t)node, (uint64_t)v19);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  childNodes = self->_childNodes;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v7, (uint64_t)&v15, (uint64_t)v20, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(childNodes);
        }
        objc_msgSend__reSyncModelTree(*(void **)(*((void *)&v15 + 1) + 8 * v14++), v9, v10, v11);
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v9, (uint64_t)&v15, (uint64_t)v20, 16);
    }
    while (v12);
  }
}

- (BOOL)canAddChildNode:(id)a3
{
  for (BOOL i = self == 0; self; BOOL i = self == 0)
  {
    if (self == a3) {
      break;
    }
    self = (VFXNode *)objc_msgSend_parentNode(self, a2, (uint64_t)a3, v3);
  }
  return i;
}

- (void)addChildNode:(id)a3
{
  objc_sync_enter(self);
  uint64_t v8 = objc_msgSend_countOfChildNodes(self, v5, v6, v7);
  objc_msgSend_insertObject_inChildNodesAtIndex_(self, v9, (uint64_t)a3, v8);

  objc_sync_exit(self);
}

- (void)insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4
{
  if (a3)
  {
    objc_sync_enter(self);
    if (!self->_childNodes) {
      self->_childNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (objc_msgSend_canAddChildNode_(self, v7, (uint64_t)a3, v8))
    {
      if ((VFXNode *)objc_msgSend_parentNode(a3, v9, v10, v11) != self)
      {
        id v16 = a3;
        uint64_t v20 = objc_msgSend_world(self, v17, v18, v19);
        if (v20 == objc_msgSend_world(a3, v21, v22, v23)) {
          objc_msgSend__removeFromParentNodeWithoutRemovingWorldReference(a3, v24, v25, v26);
        }
        else {
          objc_msgSend_removeFromParentNode(a3, v24, v25, v26);
        }
        objc_msgSend__setParent_(a3, v27, (uint64_t)self, v28);
        uint64_t v32 = objc_msgSend_world(self, v29, v30, v31);
        objc_msgSend_setWorld_(a3, v33, v32, v34);
        objc_msgSend_insertObject_atIndex_(self->_childNodes, v35, (uint64_t)a3, a4);
        if ((*((unsigned char *)a3 + 50) & 0x10) != 0) {
          objc_msgSend__setHasFocusableChild(self, v36, v37, v38);
        }
        if (a4) {
          uint64_t v39 = objc_msgSend_objectAtIndex_(self->_childNodes, v36, a4 - 1, v38);
        }
        else {
          uint64_t v39 = 0;
        }
        uint64_t v40 = objc_msgSend_worldRef(self, v36, v37, v38);
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = (uint64_t)sub_1B64D0D90;
        v44[3] = (uint64_t)&unk_1E6143030;
        v44[4] = v39;
        v44[5] = (uint64_t)self;
        v44[6] = (uint64_t)a3;
        v44[7] = a4;
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v41, v40, (uint64_t)self, v44);
        if (*((char *)self + 48) < 0) {
          objc_msgSend__setPausedOrPausedByInheritance_(a3, v42, 1, v43);
        }
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: attempt to add a parent node as a child node", v10, v11, v12, v13, v14, v15, v44[0]);
    }
    objc_sync_exit(self);
  }
}

- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  uint64_t v5 = self;
  if (objc_msgSend_count(self->_childNodes, v6, v7, v8) <= a3)
  {
    sub_1B63F2F54(16, @"Error: removeChildNodeAtIndex - index out of bounds", v10, v11, v12, v13, v14, v15, v26);
  }
  else
  {
    id v16 = objc_msgSend_objectAtIndex_(self->_childNodes, v9, a3, v11);
    uint64_t v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B64D0F78;
    v27[3] = &unk_1E61411E0;
    v27[4] = v16;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v27);
    objc_msgSend__setParent_(v16, v22, 0, v23);
    objc_msgSend_removeObjectAtIndex_(self->_childNodes, v24, a3, v25);
  }
  objc_sync_exit(self);
}

- (void)removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
}

- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4
{
  objc_sync_enter(self);
  if (a4)
  {
    if (objc_msgSend_canAddChildNode_(self, v7, (uint64_t)a4, v8))
    {
      uint64_t v22 = objc_msgSend_objectAtIndex_(self->_childNodes, v9, a3, v11);
      if (v22)
      {
        id v23 = a4;
        objc_msgSend_removeFromParentNode(a4, v24, v25, v26);
        objc_msgSend__setParent_(v22, v27, 0, v28);
        objc_msgSend__setParent_(a4, v29, (uint64_t)self, v30);
        uint64_t v34 = objc_msgSend_worldRef(self, v31, v32, v33);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = sub_1B64D1140;
        v38[3] = &unk_1E61411B8;
        v38[4] = v22;
        v38[5] = a4;
        v38[6] = self;
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v35, v34, (uint64_t)self, v38);
        objc_msgSend_replaceObjectAtIndex_withObject_(self->_childNodes, v36, a3, (uint64_t)a4);
      }
      else
      {
        sub_1B63F2F54(16, @"Unreachable code: error in replaceObjectInChildNodesAtIndex -> index out of bounds", v16, v17, v18, v19, v20, v21, v37);
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Unreachable code: circular reference found when trying to add %@ as a child node of %@", v10, v11, v12, v13, v14, v15, (uint64_t)a4);
    }
  }
  else
  {
    objc_msgSend_removeObjectFromChildNodesAtIndex_(self, v7, a3, v8);
  }
  objc_sync_exit(self);
}

- (void)_removeFromParentNodeWithoutRemovingWorldReference
{
  if ((*((unsigned char *)self + 48) & 0xC0) == 0x80) {
    objc_msgSend__setPausedOrPausedByInheritance_(self, a2, 0, v3);
  }
  if ((*((unsigned char *)self + 50) & 0x10) != 0) {
    objc_msgSend__updateFocusableCache(self->_parent, a2, v2, v3);
  }
  objc_sync_enter(self);
  parent = self->_parent;
  if (parent)
  {
    objc_sync_enter(self->_parent);
    uint64_t v12 = objc_msgSend_indexOfChildNode_(self->_parent, v9, (uint64_t)self, v10);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      sub_1B63F2F54(16, @"Error: error in removeFromParentNode : inconsistent tree", 0x7FFFFFFFFFFFFFFFLL, v13, v14, v15, v16, v17, v31);
    }
    else {
      objc_msgSend_removeObjectFromChildNodesAtIndex_(self->_parent, v11, v12, v13);
    }
    objc_sync_exit(parent);
  }
  else
  {
    uint64_t v18 = objc_msgSend_world(self, v5, v6, v7);
    if ((VFXNode *)objc_msgSend_rootNode(v18, v19, v20, v21) == self)
    {
      uint64_t v25 = objc_msgSend_world(self, v22, v23, v24);
      uint64_t v29 = objc_msgSend_node(VFXNode, v26, v27, v28);
      objc_msgSend_setRootNode_forLayer_(v25, v30, v29, 0);
    }
  }

  objc_sync_exit(self);
}

- (void)removeFromParentNode
{
  objc_msgSend__removeFromParentNodeWithoutRemovingWorldReference(self, a2, v2, v3);

  objc_msgSend_setWorld_(self, v5, 0, v6);
}

- (unint64_t)indexOfChildNode:(id)a3
{
  childNodes = self->_childNodes;
  uint64_t v6 = objc_msgSend_count(childNodes, a2, (uint64_t)a3, v3);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v9 = v6;
  unint64_t v10 = 0;
  while ((id)objc_msgSend_objectAtIndex_(childNodes, v7, v10, v8) != a3)
  {
    if (v9 == ++v10) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v10;
}

- (void)removeAllChilds
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend_childNodes(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_removeFromParentNode(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)hasAncestor:(id)a3
{
  id v5 = (id)objc_msgSend_parentNode(self, a2, (uint64_t)a3, v3);
  for (BOOL i = v5 != 0; v5 != a3 && v5; BOOL i = v5 != 0)
    id v5 = (id)objc_msgSend_parentNode(v5, v6, v7, v8);
  return i;
}

- (void)replaceChildNode:(id)a3 with:(id)a4
{
  uint64_t v6 = objc_msgSend_indexOfChildNode_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    MEMORY[0x1F4181798](self, sel_replaceObjectInChildNodesAtIndex_withObject_, v6, a4);
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

- (BOOL)getBoundingBoxMin:(VFXNode *)self max:(SEL)a2
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!self->_node || *((char *)self + 49) < 0) {
    return 0;
  }
  long long v5 = (float32x4_t *)v3;
  float32x4_t v6 = v2;
  v76.i32[2] = 0;
  v76.i64[0] = 0;
  v75.i32[2] = 0;
  v75.i64[0] = 0;
  if (*((unsigned char *)self + 48))
  {
    uint64_t v9 = objc_msgSend_worldRef(self, a2, (uint64_t)v2, v3);
    if (v9)
    {
      uint64_t v17 = v9;
      sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
      int v22 = sub_1B63F493C(self->_node, 1, (uint64_t)&v76, (uint64_t)&v75, v18, v19, v20, v21);
      sub_1B64B0CB4(v17, v23, v24, v25, v26, v27, v28, v29);
      if (v22)
      {
LABEL_11:
        if (v6) {
          *float32x4_t v6 = v76;
        }
        if (!v5) {
          return 1;
        }
        float32x4_t v8 = v75;
        goto LABEL_15;
      }
    }
    else if (sub_1B63F493C(self->_node, 1, (uint64_t)&v76, (uint64_t)&v75, v13, v14, v15, v16))
    {
      goto LABEL_11;
    }
    return 0;
  }
  v74.i32[2] = 0;
  v74.i64[0] = 0;
  v73.i32[2] = 0;
  v73.i64[0] = 0;
  float32x4_t v7 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
  if (v7)
  {
    if (v2) {
      float32x4_t *v2 = *v7;
    }
    if (!v3) {
      return 1;
    }
    float32x4_t v8 = *(float32x4_t *)(*(void *)self->_fixedBoundingBoxExtrema + 16);
LABEL_15:
    *long long v5 = v8;
    return 1;
  }
  uint64_t v31 = objc_msgSend_model(self, a2, (uint64_t)v2, v3);
  if (v31 && objc_msgSend_getBoundingBoxMin_max_(v31, v32, (uint64_t)v6, (uint64_t)v5))
  {
    if (v6) {
      float32x4_t v76 = *v6;
    }
    if (v5) {
      float32x4_t v75 = *v5;
    }
    BOOL v30 = 1;
  }
  else
  {
    BOOL v30 = 0;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v36 = objc_msgSend_childNodes(self, v32, v33, v34);
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v69, (uint64_t)v82, 16);
  if (v38)
  {
    uint64_t v40 = v38;
    uint64_t v41 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v70 != v41) {
          objc_enumerationMutation(v36);
        }
        uint64_t v43 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if (objc_msgSend_getBoundingBoxMin_max_(v43, v39, (uint64_t)&v74, (uint64_t)&v73))
        {
          float32x4_t v67 = v73;
          float32x4_t v68 = v74;
          long long v65 = 0u;
          long long v66 = 0u;
          float32x4_t v63 = 0u;
          long long v64 = 0u;
          objc_msgSend_pivot(v43, v39, v44, v45);
          simd_float4x4 v85 = __invert_f4(v84);
          float32x4_t v61 = (float32x4_t)v85.columns[1];
          float32x4_t v62 = (float32x4_t)v85.columns[0];
          float32x4_t v59 = (float32x4_t)v85.columns[3];
          float32x4_t v60 = (float32x4_t)v85.columns[2];
          objc_msgSend_transform(v43, v46, v47, v48);
          uint64_t v49 = 0;
          v77[0] = v50;
          v77[1] = v51;
          v77[2] = v52;
          v77[3] = v53;
          float32x4_t v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v78 + v49 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v62, COERCE_FLOAT(v77[v49])), v61, *(float32x2_t *)&v77[v49], 1), v60, (float32x4_t)v77[v49], 2), v59, (float32x4_t)v77[v49], 3);
            ++v49;
          }
          while (v49 != 4);
          float32x4_t v63 = v78;
          long long v64 = v79;
          long long v65 = v80;
          long long v66 = v81;
          sub_1B649F958(&v68, &v67, &v68, &v67, &v63);
          float32x4_t v54 = v68;
          if (v30)
          {
            float32x4_t v56 = v75;
            float32x4_t v55 = v76;
            v54.i32[3] = 0;
            v55.i32[3] = 0;
            float32x4_t v54 = vminnmq_f32(v54, v55);
            float32x4_t v57 = v67;
            v57.i32[3] = 0;
            v56.i32[3] = 0;
            float32x4_t v58 = vmaxnmq_f32(v57, v56);
          }
          else
          {
            float32x4_t v58 = v67;
          }
          float32x4_t v75 = v58;
          float32x4_t v76 = v54;
          BOOL v30 = 1;
        }
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v69, (uint64_t)v82, 16);
    }
    while (v40);
  }
  if (v30)
  {
    if (v6) {
      *float32x4_t v6 = v76;
    }
    if (v5) {
      *long long v5 = v75;
    }
  }
  return v30;
}

- (void)setBoundingBoxMin:(VFXNode *)self max:(SEL)a2
{
  long long v5 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
  if (v2 && (float32x4_t v6 = v3) != 0)
  {
    float32x4_t v7 = (uint64_t *)v2;
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
    *uint64_t v12 = *(float32x4_t *)v7;
    *(float32x4_t *)(*(void *)self->_fixedBoundingBoxExtrema + 16) = *v6;
    uint64_t v18 = objc_msgSend_worldRef(self, v8, v9, v10, v6->i64[0], v6->i64[1], *v7, v7[1]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B64D1B14;
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
    v26[2] = sub_1B64D1B00;
    v26[3] = &unk_1E61411E0;
    v26[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v26);
  }
}

- (BOOL)getFrustum:(id *)a3 withViewport:
{
  __n128 v80 = v4;
  __n128 v83 = v4;
  if (objc_msgSend_isPresentationObject(self, a2, (uint64_t)a3, v3))
  {
    uint64_t v10 = objc_msgSend_nodeRef(self, v7, v8, v9);
    LOBYTE(v17) = sub_1B63E0138(v10, (float32x4_t *)a3, v11, v12, v13, v14, v15, v16, v80);
  }
  else
  {
    uint64_t v17 = objc_msgSend_camera(self, v7, v8, v9);
    if (v17)
    {
      uint64_t v21 = objc_msgSend_cameraRef(v17, v18, v19, v20);
      uint64_t v29 = (_OWORD *)sub_1B649D3DC(v21, v22, v23, v24, v25, v26, v27, v28);
      long long v31 = v29[1];
      long long v30 = v29[2];
      v82[0] = *v29;
      v82[1] = v31;
      v82[2] = v30;
      long long v32 = v29[6];
      long long v34 = v29[3];
      long long v33 = v29[4];
      v82[5] = v29[5];
      v82[6] = v32;
      v82[3] = v34;
      v82[4] = v33;
      long long v35 = v29[10];
      long long v37 = v29[7];
      long long v36 = v29[8];
      v82[9] = v29[9];
      v82[10] = v35;
      v82[7] = v37;
      v82[8] = v36;
      uint64_t v44 = sub_1B649CD50((unsigned __int8 *)v82, (uint64_t)&v83, v38, v39, v40, v41, v42, v43);
      float32x4_t v79 = *((float32x4_t *)v44 + 1);
      float32x4_t v81 = *(float32x4_t *)v44;
      float32x4_t v77 = *((float32x4_t *)v44 + 3);
      float32x4_t v78 = *((float32x4_t *)v44 + 2);
      objc_msgSend_worldTransform(self, v45, v46, v47);
      simd_float4x4 v91 = __invert_f4(v90);
      uint64_t v53 = 0;
      simd_float4x4 v84 = v91;
      int32x4_t v85 = 0u;
      int32x4_t v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v85 + v53 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&v84.columns[v53])), v79, *(float32x2_t *)v84.columns[v53].f32, 1), v78, (float32x4_t)v84.columns[v53], 2), v77, (float32x4_t)v84.columns[v53], 3);
        ++v53;
      }
      while (v53 != 4);
      v48.f32[0] = *(float *)&v85.i32[3] - *(float *)v85.i32;
      v48.f32[1] = *(float *)&v86.i32[3] - *(float *)v86.i32;
      v48.f32[2] = *((float *)&v87 + 3) - *(float *)&v87;
      int32x4_t v54 = (int32x4_t)vmulq_f32(v48, v48);
      v48.f32[3] = *((float *)&v88 + 3) - *(float *)&v88;
      v49.f32[0] = *(float *)&v85.i32[3] + *(float *)v85.i32;
      v49.f32[1] = *(float *)&v86.i32[3] + *(float *)v86.i32;
      v49.f32[2] = *((float *)&v87 + 3) + *(float *)&v87;
      int32x4_t v55 = (int32x4_t)vmulq_f32(v49, v49);
      v49.f32[3] = *((float *)&v88 + 3) + *(float *)&v88;
      v50.f32[0] = *(float *)&v85.i32[3] + *(float *)&v85.i32[1];
      v50.f32[1] = *(float *)&v86.i32[3] + *(float *)&v86.i32[1];
      v50.f32[2] = *((float *)&v87 + 3) + *((float *)&v87 + 1);
      int32x4_t v56 = (int32x4_t)vmulq_f32(v50, v50);
      v50.f32[3] = *((float *)&v88 + 3) + *((float *)&v88 + 1);
      v51.f32[0] = *(float *)&v85.i32[3] - *(float *)&v85.i32[1];
      v51.f32[1] = *(float *)&v86.i32[3] - *(float *)&v86.i32[1];
      v51.f32[2] = *((float *)&v87 + 3) - *((float *)&v87 + 1);
      int32x4_t v57 = (int32x4_t)vmulq_f32(v51, v51);
      v51.f32[3] = *((float *)&v88 + 3) - *((float *)&v88 + 1);
      v52.f32[0] = *(float *)&v85.i32[3] - *(float *)&v85.i32[2];
      v52.f32[1] = *(float *)&v86.i32[3] - *(float *)&v86.i32[2];
      v52.f32[2] = *((float *)&v87 + 3) - *((float *)&v87 + 2);
      float32x4_t v58 = v52;
      v58.f32[3] = *((float *)&v88 + 3) - *((float *)&v88 + 2);
      float32x4_t v59 = (float32x4_t)vzip2q_s32(v85, v86);
      v59.i32[2] = DWORD2(v87);
      int32x4_t v60 = (int32x4_t)vmulq_f32(v59, v59);
      v59.i32[3] = DWORD2(v88);
      unsigned __int32 v61 = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v54, 2), vadd_f32(*(float32x2_t *)v54.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v54.i8, 1))).u32[0];
      int32x4_t v62 = (int32x4_t)vmulq_f32(v52, v52);
      float32x2_t v63 = vrsqrte_f32((float32x2_t)v61);
      float32x2_t v64 = vmul_f32(v63, vrsqrts_f32((float32x2_t)v61, vmul_f32(v63, v63)));
      float32x4_t v65 = vmulq_n_f32(v48, vmul_f32(v64, vrsqrts_f32((float32x2_t)v61, vmul_f32(v64, v64))).f32[0]);
      v64.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v55, 2), vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v55.i8, 1))).u32[0];
      float32x2_t v66 = vrsqrte_f32((float32x2_t)v64.u32[0]);
      float32x2_t v67 = vmul_f32(v66, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v66, v66)));
      float32x4_t v68 = vmulq_n_f32(v49, vmul_f32(v67, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v67, v67))).f32[0]);
      v67.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v56, 2), vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v56.i8, 1))).u32[0];
      float32x2_t v69 = vrsqrte_f32((float32x2_t)v67.u32[0]);
      float32x2_t v70 = vmul_f32(v69, vrsqrts_f32((float32x2_t)v67.u32[0], vmul_f32(v69, v69)));
      v67.i32[0] = vmul_f32(v70, vrsqrts_f32((float32x2_t)v67.u32[0], vmul_f32(v70, v70))).u32[0];
      v70.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v57, 2), vadd_f32(*(float32x2_t *)v57.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v57.i8, 1))).u32[0];
      float32x2_t v71 = vrsqrte_f32((float32x2_t)v70.u32[0]);
      float32x2_t v72 = vmul_f32(v71, vrsqrts_f32((float32x2_t)v70.u32[0], vmul_f32(v71, v71)));
      v70.i32[0] = vmul_f32(v72, vrsqrts_f32((float32x2_t)v70.u32[0], vmul_f32(v72, v72))).u32[0];
      v60.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v60, 2), vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v60.i8, 1))).u32[0];
      float32x2_t v73 = vrsqrte_f32((float32x2_t)v60.u32[0]);
      float32x2_t v74 = vmul_f32(v73, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(v73, v73)));
      float32x4_t v75 = vmulq_n_f32(v59, vmul_f32(v74, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(v74, v74))).f32[0]);
      v60.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1))).u32[0];
      *(float32x2_t *)v62.i8 = vrsqrte_f32((float32x2_t)v60.u32[0]);
      *(float32x2_t *)v62.i8 = vmul_f32(*(float32x2_t *)v62.i8, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(*(float32x2_t *)v62.i8, *(float32x2_t *)v62.i8)));
      *(float32x4_t *)a3 = v65;
      *((float32x4_t *)a3 + 1) = v68;
      *((float32x4_t *)a3 + 2) = vmulq_n_f32(v50, v67.f32[0]);
      *((float32x4_t *)a3 + 3) = vmulq_n_f32(v51, v70.f32[0]);
      *((float32x4_t *)a3 + 4) = v75;
      *((float32x4_t *)a3 + 5) = vmulq_n_f32(v58, vmul_f32(*(float32x2_t *)v62.i8, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(*(float32x2_t *)v62.i8, *(float32x2_t *)v62.i8))).f32[0]);
      LOBYTE(v17) = 1;
    }
  }
  return (char)v17;
}

- (id)getBoundingSphere
{
  int v13 = 0;
  double v12 = 0.0;
  int v11 = 0;
  if (!objc_msgSend_getBoundingSphereCenter_radius_(self, a2, (uint64_t)&v12, (uint64_t)&v11)) {
    return 0;
  }
  unsigned int v2 = objc_alloc_init(VFXBoundingSphere);
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
  float32x4_t v7 = objc_alloc_init(VFXBoundingBox);
  objc_msgSend_setMin_(v7, v8, v9, v10, v14);
  objc_msgSend_setMax_(v7, v11, v12, v13, v15);

  return v7;
}

- (id)flattenedClone
{
  float32x4_t v5 = objc_msgSend_copy(self, a2, v2, v3);
  double v6 = objc_alloc_init(VFXModel);
  objc_msgSend_setModel_(v5, v7, (uint64_t)v6, v8);
  node = self->_node;
  uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B64D20A0;
  v16[3] = &unk_1E6141230;
  v16[4] = node;
  v16[5] = v5;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)v5, v16);
  return v5;
}

- (id)flattenedCopy
{
  float32x4_t v4 = objc_msgSend_flattenedClone(self, a2, v2, v3);

  return v4;
}

- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3
{
  unsigned __int16 v4 = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  double v15 = sub_1B64A11C0((uint64_t)self->_node, v4, v8, v9, v10, v11, v12, v13);
  uint64_t v21 = objc_msgSend_nodeWithNodeRef_(VFXNode, v16, (uint64_t)v15, v17);
  if (v15) {
    CFRelease(v15);
  }
  if (objc_msgSend_skinner(v21, v18, v19, v20))
  {
    uint64_t v25 = objc_msgSend_skinner(self, v22, v23, v24);
    uint64_t v29 = objc_msgSend_skeleton(v25, v26, v27, v28);
    long long v33 = objc_msgSend_skinner(v21, v30, v31, v32);
    objc_msgSend_setSkeleton_(v33, v34, v29, v35);
  }
  objc_msgSend__copyAnimationsFrom_(v21, v22, (uint64_t)self, v24);
  if (v14) {
    sub_1B64B0CB4(v14, v36, v37, v38, v39, v40, v41, v42);
  }
  return v21;
}

- (void)_setPausedOrPausedByInheritance:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *((unsigned __int8 *)self + 48);
  if (a3 != v4 >> 7)
  {
    BOOL v5 = a3;
    char v7 = a3 ? 0x80 : 0;
    *((unsigned char *)self + 48) = v7 & 0x80 | v4 & 0x7F;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B64D2394;
    v27[3] = &unk_1E6141190;
    v27[4] = self;
    BOOL v28 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v27);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = objc_msgSend_childNodes(self, v10, v11, v12, 0);
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v23, (uint64_t)v29, 16);
    if (v15)
    {
      uint64_t v19 = v15;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend_isPaused(v22, v16, v17, v18) & 1) == 0) {
            objc_msgSend__setPausedOrPausedByInheritance_(v22, v16, v5, v18);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v23, (uint64_t)v29, 16);
      }
      while (v19);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 48);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = a3;
    if (a3) {
      char v7 = 64;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 48) = v4 & 0xBF | v7;
    uint64_t v8 = objc_msgSend_parentNode(self, a2, a3, v3);
    uint64_t v13 = objc_msgSend_isPausedOrPausedByInheritance(v8, v9, v10, v11) | v5;
    objc_msgSend__setPausedOrPausedByInheritance_(self, v12, v13, v14);
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return *((unsigned __int8 *)self + 48) >> 7;
}

- (BOOL)isPaused
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (CGRect)_focusFrameInView:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  DWORD2(v36) = 0;
  *(void *)&long long v36 = 0;
  DWORD2(v35) = 0;
  *(void *)&long long v35 = 0;
  if (objc_msgSend_getBoundingBoxMin_max_(self, a2, (uint64_t)&v36, (uint64_t)&v35))
  {
    long long v8 = v36;
    long long v9 = v36;
    DWORD1(v9) = DWORD1(v35);
    v37[0] = v36;
    v37[2] = v9;
    long long v10 = v35;
    DWORD2(v10) = DWORD2(v36);
    long long v11 = v35;
    DWORD1(v11) = DWORD1(v36);
    long long v12 = v35;
    LODWORD(v12) = v36;
    long long v13 = v36;
    LODWORD(v8) = v35;
    v37[1] = v8;
    DWORD2(v13) = DWORD2(v35);
    v37[3] = v10;
    v37[4] = v13;
    v37[5] = v11;
    v37[6] = v12;
    v37[7] = v35;
    objc_msgSend_worldTransform(self, v5, v6, v7);
    float32x4_t v33 = v18;
    float32x4_t v34 = v17;
    float32x4_t v31 = v20;
    float32x4_t v32 = v19;
    for (uint64_t i = 0; i != 8; ++i)
    {
      objc_msgSend_projectPoint_(a3, v14, v15, v16, *(double *)vaddq_f32(v31, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(v37[i])), v33, *(float32x2_t *)&v37[i], 1), v32, (float32x4_t)v37[i], 2)).i64, *(_OWORD *)&v31, *(_OWORD *)&v32, *(_OWORD *)&v33, *(_OWORD *)&v34);
      v37[i] = v22;
    }
    float64x2_t v23 = vcvtq_f64_f32(*(float32x2_t *)&v37[0]);
    uint64_t v24 = 1;
    double v25 = v23.f64[0];
    int8x16_t v26 = (int8x16_t)v23;
    do
    {
      int8x16_t v27 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&v37[v24]);
      int8x16_t v26 = vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)v27, (float64x2_t)v26), v26, v27);
      if (v25 < *(double *)v27.i64) {
        double v25 = *(double *)v27.i64;
      }
      ++v24;
    }
    while (v24 != 8);
    double v28 = v25 - *(double *)v26.i64;
    double v29 = *(double *)&v26.i64[1];
    double v30 = vsubq_f64(v23, *(float64x2_t *)&v26).f64[1];
  }
  else
  {
    v26.i64[0] = 0;
    double v29 = 0.0;
    double v28 = 0.0;
    double v30 = 0.0;
  }
  result.origin.simd_float4 x = *(double *)v26.i64;
  result.size.height = v30;
  result.size.width = v28;
  result.origin.y = v29;
  return result;
}

- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 50) & 0x10) != 0)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    if (objc_msgSend_isFocusInteractionEnabled(self, a2, (uint64_t)a4, (uint64_t)a5))
    {
      if ((objc_msgSend__isEffectivelyHidden(self, v12, v13, v14) & 1) == 0)
      {
        objc_msgSend__focusFrameInView_(self, v12, (uint64_t)a4, v15);
        v30.origin.double x = x;
        v30.origin.double y = y;
        v30.size.double width = width;
        v30.size.double height = height;
        if (CGRectIntersectsRect(v29, v30)) {
          objc_msgSend_addObject_(a5, v12, (uint64_t)self, v16);
        }
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    childNodes = self->_childNodes;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v12, (uint64_t)&v23, (uint64_t)v27, 16);
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(childNodes);
          }
          objc_msgSend__appendFocusableNodesInRect_ofView_toFocusItems_(*(void **)(*((void *)&v23 + 1) + 8 * v22++), v19, (uint64_t)a4, (uint64_t)a5, x, y, width, height);
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v19, (uint64_t)&v23, (uint64_t)v27, 16);
      }
      while (v20);
    }
  }
}

- (int64_t)focusBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 50) >> 2) & 3;
}

- (void)_setHasFocusableChild
{
  if ((*((unsigned char *)self + 50) & 0x10) == 0)
  {
    *((unsigned char *)self + 50) |= 0x10u;
    objc_msgSend__setHasFocusableChild(self->_parent, a2, v2, v3);
  }
}

- (void)_updateFocusableCache
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v9 = *((unsigned char *)self + 50);
  if ((v9 & 0x10) == 0)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. _updateFocusableCache - invoked on a non focusable node (waste of time)", v2, v3, v4, v5, v6, v7, (uint64_t)"_isFocusableOrHasFocusableChild");
    char v9 = *((unsigned char *)self + 50);
  }
  if ((v9 & 0xC) == 0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v10 = objc_msgSend_childNodes(self, a2, v2, v3);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, (uint64_t)v23, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v10);
          }
          if ((*(unsigned char *)(*(void *)(*((void *)&v19 + 1) + 8 * i) + 50) & 0x10) != 0)
          {
            objc_msgSend__setHasFocusableChild(self, v13, v14, v15);
            return;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v19, (uint64_t)v23, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
    *((unsigned char *)self + 50) &= ~0x10u;
    objc_msgSend__updateFocusableCache(self->_parent, v13, v14, v15);
  }
}

- (void)setFocusBehavior:(int64_t)a3
{
  unint64_t v4 = *((unsigned __int8 *)self + 50);
  if (((v4 >> 2) & 3) != a3)
  {
    char v5 = v4 & 0xF3 | (4 * (a3 & 3));
    *((unsigned char *)self + 50) = v5;
    if ((a3 & 3) != 0)
    {
      *((unsigned char *)self + 50) = v5 | 0x10;
      objc_msgSend__setHasFocusableChild(self->_parent, a2, a3, v3);
    }
    else
    {
      objc_msgSend__updateFocusableCache(self, a2, a3, v3);
    }
  }
}

- (BOOL)canBecomeFocused
{
  return (*((unsigned char *)self + 50) & 0xC) == 8;
}

- (BOOL)isFocusInteractionEnabled
{
  return (*((unsigned char *)self + 50) & 0xC) != 0;
}

- (BOOL)_isEffectivelyHidden
{
  char v5 = objc_msgSend_parentNode(self, a2, v2, v3);
  if ((objc_msgSend__isEffectivelyHidden(v5, v6, v7, v8) & 1) != 0
    || (objc_msgSend_isHidden(self, v9, v10, v11) & 1) != 0)
  {
    return 1;
  }
  objc_msgSend_opacity(self, v12, v13, v14);
  return v16 <= 0.00000011921;
}

- (NSArray)preferredFocusEnvironments
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self;
  return (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v3, 1);
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  if (objc_msgSend_parentNode(self, a2, v2, v3))
  {
    return (UIFocusEnvironment *)objc_msgSend_parentNode(self, v5, v6, v7);
  }
  else
  {
    return (UIFocusEnvironment *)objc_msgSend__currentVFXViewFocusEnvironment(VFXView, v5, v6, v7);
  }
}

- (void)setNeedsFocusUpdate
{
  uint64_t v4 = objc_msgSend_focusSystemForEnvironment_(MEMORY[0x1E4FB1790], a2, (uint64_t)self, v2);

  MEMORY[0x1F4181798](v4, sel_requestFocusUpdateToEnvironment_, self, v5);
}

- (void)updateFocusIfNeeded
{
  uint64_t v3 = objc_msgSend_focusSystemForEnvironment_(MEMORY[0x1E4FB1790], a2, (uint64_t)self, v2);

  MEMORY[0x1F4181798](v3, sel_updateFocusIfNeeded, v4, v5);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ((*((unsigned char *)self + 50) & 0x10) != 0) {
    return objc_msgSend__isEffectivelyHidden(self, a2, v2, v3) ^ 1;
  }
  else {
    return 0;
  }
}

- (CGRect)frame
{
  uint64_t v5 = objc_msgSend__currentVFXViewFocusEnvironment(VFXView, a2, v2, v3);
  char v9 = objc_msgSend_focusItemContainer(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_coordinateSpace(v9, v10, v11, v12);
  if (v13 != objc_msgSend_coordinateSpace(v5, v14, v15, v16)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Coordinate space inconsistency", v18, v19, v20, v21, v22, v23, (uint64_t)"self.focusItemContainer.coordinateSpace == focusEnvironmentView.coordinateSpace");
  }

  objc_msgSend__focusFrameInView_(self, v17, (uint64_t)v5, v19);
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  uint64_t v4 = objc_msgSend__currentVFXViewFocusEnvironment(VFXView, a2, v2, v3);
  uint64_t v8 = objc_msgSend_focusItemContainer(v4, v5, v6, v7);

  return (UICoordinateSpace *)objc_msgSend_coordinateSpace(v8, v9, v10, v11);
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSArray)constraints
{
  uint64_t ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 6, v2);
  uint64_t v7 = objc_msgSend_copy(ComponentWithType, v4, v5, v6);

  return (NSArray *)v7;
}

- (void)setConstraints:(id)a3
{
  id ComponentWithType = (id)objc_msgSend__findComponentWithType_(self, a2, 6, v3);
  if (ComponentWithType != a3)
  {
    if (ComponentWithType) {
      objc_msgSend__removeComponentWithType_(self, v7, 6, v9);
    }
    if (a3)
    {
      id v10 = (id)objc_msgSend_mutableCopy(a3, v7, v8, v9);
      objc_msgSend__assignComponent_toContainerWithType_(self, v11, (uint64_t)v10, 6);
    }
    uint64_t v12 = objc_msgSend_worldRef(self, v7, v8, v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B64D2D94;
    v14[3] = &unk_1E6141230;
    v14[4] = a3;
    void v14[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (VFXPhysicsBody)physicsBody
{
  return (VFXPhysicsBody *)objc_msgSend__findComponentWithType_(self, a2, 7, v2);
}

- (void)setPhysicsBody:(id)a3
{
  id v6 = (id)objc_msgSend_physicsBody(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    id v10 = v6;
    if (v6)
    {
      if ((VFXNode *)objc_msgSend__owner(v6, v7, v8, v9) != self)
      {
        objc_msgSend__owner(v10, v11, v12, v13);
        sub_1B63F2F54(16, @"Error: Physics body %@ 's owner (%@) should be %@", v14, v15, v16, v17, v18, v19, (uint64_t)v10);
      }
      objc_msgSend__removeOwner(v10, v11, v12, v13);
      objc_msgSend__removeComponentWithType_(self, v20, 7, v21);
      objc_msgSend_transform(self, v22, v23, v24);
      long long v50 = v26;
      long long v51 = v25;
      long long v48 = v28;
      long long v49 = v27;
      uint64_t v32 = objc_msgSend_worldRef(self, v29, v30, v31);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = sub_1B64D309C;
      v52[3] = &unk_1E6141FF8;
      int32x4_t v57 = self;
      long long v53 = v51;
      long long v54 = v50;
      long long v55 = v49;
      long long v56 = v48;
      objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v33, v32, (uint64_t)self, @"transform", v52);
    }
    if (a3)
    {
      if (objc_msgSend__owner(a3, v7, v8, v9))
      {
        objc_msgSend__owner(a3, v34, v35, v36);
        sub_1B63F2F54(16, @"Error: Physics body %@ already has a owner: %@ that is not %@", v37, v38, v39, v40, v41, v42, (uint64_t)a3);
      }
      objc_msgSend__assignComponent_toContainerWithType_(self, v34, (uint64_t)a3, 7);
      objc_msgSend__setOwner_(a3, v43, (uint64_t)self, v44);
      objc_msgSend_resetTransform(a3, v45, v46, v47);
    }
  }
}

- (VFXForceField)forceField
{
  CGRect result = (VFXForceField *)objc_msgSend__findComponentWithType_(self, a2, 8, v2);
  if (*((unsigned char *)self + 48))
  {
    return (VFXForceField *)objc_msgSend_presentationObject(result, v5, v6, v7);
  }
  return result;
}

- (void)setForceField:(id)a3
{
  if ((id)objc_msgSend_forceField(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 8);
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64D31B8;
    v12[3] = &unk_1E6141230;
    v12[4] = self;
    void v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (id)_audioPlayers
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_nodeRef(self, v6, v7, v8);
  if (!v14)
  {
    id v26 = 0;
    if (!v13) {
      return v26;
    }
    goto LABEL_5;
  }
  CFDictionaryRef v22 = sub_1B64A3E10(v14, v15, v16, v17, v18, v19, v20, v21);
  id v26 = (id)objc_msgSend_copy(v22, v23, v24, v25);
  if (v13) {
LABEL_5:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v26;
}

- (id)audioPlayers
{
  return (id)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1F4181798])(self, sel__audioPlayers);
}

- (void)addAudioPlayer:(id)a3
{
  if (a3)
  {
    uint64_t v10 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64D3324;
    v12[3] = &unk_1E6141230;
    v12[4] = a3;
    void v12[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: attempt to add a null audio player on %@", 0, v3, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)removeAllAudioPlayers
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B64D341C;
  v7[3] = &unk_1E61411E0;
  v7[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
}

- (void)removeAudioPlayer:(id)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B64D34E4;
  v8[3] = &unk_1E6141230;
  v8[4] = self;
  void v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (unint64_t)countOfAudioPlayers
{
  uint64_t v4 = objc_msgSend_audioPlayers(self, a2, v2, v3);

  return objc_msgSend_count(v4, v5, v6, v7);
}

- (id)objectInAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_audioPlayers(self, a2, a3, v3);

  return (id)objc_msgSend_objectAtIndex_(v5, v6, a3, v7);
}

- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B64D3630;
  v9[3] = &unk_1E6143008;
  v9[4] = self;
  void v9[5] = a3;
  void v9[6] = a4;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B64D3708;
  v8[3] = &unk_1E61412A8;
  v8[4] = self;
  void v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!a4) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", a3, 0, v4, v5, v6, v7, (uint64_t)"system");
  }
  uint64_t v11 = objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B64D3810;
  v13[3] = &unk_1E6143008;
  v13[4] = self;
  v13[5] = a4;
  void v13[6] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (void)_customEncodingOfVFXNode:(id)a3 usePresentationObject:(BOOL)a4
{
  BOOL v4 = a4;
  if ((*((unsigned char *)self + 49) & 1) == 0) {
    objc_msgSend__updateAffine(self, a2, (uint64_t)a3, a4);
  }
  if ((*((unsigned char *)self + 50) & 0x40) != 0)
  {
    uint64_t v7 = objc_msgSend_editorLocked(self, a2, (uint64_t)a3, a4);
    objc_msgSend_encodeBool_forKey_(a3, v8, v7, @"locked");
  }
  if ((objc_msgSend__isAReference(self, a2, (uint64_t)a3, a4) & 1) == 0)
  {
    if (objc_msgSend_light(self, v9, v10, v11))
    {
      uint64_t v15 = objc_msgSend_light(self, v12, v13, v14);
      uint64_t v18 = (uint64_t)v15;
      if (v4) {
        uint64_t v18 = objc_msgSend_presentationLight(v15, v16, (uint64_t)v15, v17);
      }
      objc_msgSend_encodeObject_forKey_(a3, v16, v18, @"light");
    }
    if (objc_msgSend_model(self, v12, v13, v14))
    {
      CFDictionaryRef v22 = objc_msgSend_model(self, v19, v20, v21);
      uint64_t v25 = (uint64_t)v22;
      if (v4) {
        uint64_t v25 = objc_msgSend_presentationModel(v22, v23, (uint64_t)v22, v24);
      }
      objc_msgSend_encodeObject_forKey_(a3, v23, v25, @"model");
    }
    if (objc_msgSend_camera(self, v19, v20, v21))
    {
      CGRect v29 = objc_msgSend_camera(self, v26, v27, v28);
      uint64_t v32 = (uint64_t)v29;
      if (v4) {
        uint64_t v32 = objc_msgSend_presentationCamera(v29, v30, (uint64_t)v29, v31);
      }
      objc_msgSend_encodeObject_forKey_(a3, v30, v32, @"camera");
    }
    if (objc_msgSend_skinner(self, v26, v27, v28))
    {
      uint64_t v36 = objc_msgSend_skinner(self, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(a3, v37, v36, @"skinner");
    }
    if (objc_msgSend_morpher(self, v33, v34, v35))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (a3
        && (isKindOfClass & 1) != 0
        && (uint64_t v45 = objc_msgSend_options(a3, v42, v43, v44),
            long long v48 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"VFXWorldExportCompressMorphTargets", v47), objc_msgSend_BOOLValue(v48, v49, v50, v51))&& sub_1B6560100(a3, self, v43, v44))
      {
        objc_msgSend_setSkipMorphTargets_(a3, v42, 1, v44);
        uint64_t v55 = objc_msgSend_morpher(self, v52, v53, v54);
        objc_msgSend_encodeObject_forKey_(a3, v56, v55, @"morpher");
        objc_msgSend_setSkipMorphTargets_(a3, v57, 0, v58);
      }
      else
      {
        uint64_t v59 = objc_msgSend_morpher(self, v42, v43, v44);
        objc_msgSend_encodeObject_forKey_(a3, v60, v59, @"morpher");
      }
    }
    uint64_t v61 = objc_msgSend_deformers(self, v38, v39, v40);
    if (v61) {
      objc_msgSend_encodeObject_forKey_(a3, v62, v61, @"deformers");
    }
    if (objc_msgSend_filters(self, v62, v63, v64))
    {
      uint64_t v68 = objc_msgSend_filters(self, v65, v66, v67);
      objc_msgSend_encodeObject_forKey_(a3, v69, v68, @"filters");
    }
    if (objc_msgSend_constraints(self, v65, v66, v67))
    {
      uint64_t v73 = objc_msgSend_constraints(self, v70, v71, v72);
      objc_msgSend_encodeObject_forKey_(a3, v74, v73, @"constraints");
    }
    if (objc_msgSend_physicsBody(self, v70, v71, v72))
    {
      uint64_t v78 = objc_msgSend_physicsBody(self, v75, v76, v77);
      objc_msgSend_encodeObject_forKey_(a3, v79, v78, @"physicsBody");
    }
    if (objc_msgSend_forceField(self, v75, v76, v77))
    {
      uint64_t v83 = objc_msgSend_forceField(self, v80, v81, v82);
      objc_msgSend_encodeObject_forKey_(a3, v84, v83, @"forceField");
    }
    if (objc_msgSend_behaviorGraph(self, v80, v81, v82))
    {
      uint64_t v88 = objc_msgSend_behaviorGraph(self, v85, v86, v87);
      objc_msgSend_encodeObject_forKey_(a3, v89, v88, @"behaviorGraph");
    }
    if (objc_msgSend_particleEmitter(self, v85, v86, v87))
    {
      uint64_t v93 = objc_msgSend_particleEmitter(self, v90, v91, v92);
      objc_msgSend_encodeObject_forKey_(a3, v94, v93, @"emitter");
    }
    if (objc_msgSend_particleCollider(self, v90, v91, v92))
    {
      uint64_t v98 = objc_msgSend_particleCollider(self, v95, v96, v97);
      objc_msgSend_encodeObject_forKey_(a3, v99, v98, @"collider");
    }
    uint64_t v100 = *(double **)self->_fixedBoundingBoxExtrema;
    if (v100)
    {
      uint64_t v101 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E4F29238], v95, v96, v97, *v100);
      objc_msgSend_encodeObject_forKey_(a3, v102, v101, @"fixedBoundingBoxExtrema[0]");
      uint64_t v106 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E4F29238], v103, v104, v105, *(double *)(*(void *)self->_fixedBoundingBoxExtrema + 16));
      objc_msgSend_encodeObject_forKey_(a3, v107, v106, @"fixedBoundingBoxExtrema[1]");
    }
    objc_msgSend_encodeBool_forKey_(a3, v95, (*((unsigned __int8 *)self + 48) >> 6) & 1, @"paused");
    uint64_t v110 = (*((unsigned __int8 *)self + 50) >> 2) & 3;
    if (v110) {
      objc_msgSend_encodeInt_forKey_(a3, v108, v110, @"focusBehavior");
    }
    if ((*((unsigned char *)self + 49) & 4) != 0)
    {
      uint64_t v111 = self;
      if (v4) {
        uint64_t v111 = objc_msgSend_presentationNode(self, v108, v110, v109);
      }
      uint64_t v112 = objc_msgSend_valueForKey_(v111, v108, @"kPivotKey", v109);
      if (v112)
      {
        objc_msgSend_VFXMatrix4Value(v112, v113, v114, v115);
        sub_1B64FA3B8(a3, (const char *)@"pivot", v116, v117, v118, v119);
      }
    }
  }
  os_unfair_lock_lock(&self->_valueForKeyLock);
  if (objc_msgSend_count(self->_valueForKey, v120, v121, v122))
  {
    uint64_t v126 = objc_msgSend_mutableCopy(self->_valueForKey, v123, v124, v125);
    objc_msgSend_removeObjectForKey_(v126, v127, @"kPivotKey", v128);
    if (objc_msgSend_count(v126, v129, v130, v131)) {
      objc_msgSend_encodeObject_forKey_(a3, v132, (uint64_t)v126, @"clientAttributes");
    }
  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if (objc_msgSend__isAReference(self, v133, v134, v135)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v139 = objc_msgSend_options(a3, v136, v137, v138);
    uint64_t v142 = objc_msgSend_objectForKeyedSubscript_(v139, v140, @"VFXWorldExportEmbedReferences", v141);
    int v146 = objc_msgSend_BOOLValue(v142, v143, v144, v145);
  }
  else
  {
    int v146 = 0;
  }
  if (objc_msgSend_childNodes(self, v136, v137, v138)
    && (objc_msgSend__isAReference(self, v147, v148, v149) ^ 1 | v146) == 1)
  {
    uint64_t v154 = objc_msgSend_childNodes(self, v150, v151, v152);
    objc_msgSend_encodeObject_forKey_(a3, v153, v154, @"childNodes");
  }
}

- (void)_customDecodingOfVFXNode:(id)a3
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_containsValueForKey_(a3, a2, @"paused", v3))
  {
    if (objc_msgSend_decodeBoolForKey_(a3, v6, @"paused", v7)) {
      char v8 = 64;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xBF | v8;
  }
  int v9 = objc_msgSend_decodeIntForKey_(a3, v6, @"focusBehavior", v7);
  objc_msgSend_setFocusBehavior_(self, v10, v9, v11);
  uint64_t v14 = objc_msgSend_decodeBoolForKey_(a3, v12, @"locked", v13);
  objc_msgSend_setEditorLocked_(self, v15, v14, v16);
  *(_OWORD *)&self->_anon_40[2] = xmmword_1B6E4F300;
  *(_OWORD *)&self->_anon_40[18] = xmmword_1B6E4F320;
  *(_OWORD *)&self->_anon_40[34] = xmmword_1B6E4F2E0;
  *(_OWORD *)&self->_anon_40[50] = xmmword_1B6E4F370;
  *((unsigned char *)self + 49) |= 2u;
  *((unsigned char *)self + 48) |= 0x3Eu;
  if (objc_msgSend_containsValueForKey_(a3, v17, @"fixedBoundingBoxExtrema[0]", v18))
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"fixedBoundingBoxExtrema[0]");
    objc_msgSend_VFXFloat3Value(v21, v22, v23, v24);
    long long v160 = v25;
    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, @"fixedBoundingBoxExtrema[1]");
    objc_msgSend_VFXFloat3Value(v28, v29, v30, v31);
    long long v161 = v32;
    objc_msgSend_setBoundingBoxMin_max_(self, v33, (uint64_t)&v160, (uint64_t)&v161);
  }
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  objc_msgSend_vfx_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(a3, v36, v34, v35, @"whatever");
  uint64_t v37 = sub_1B64FAE78();
  uint64_t v39 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v38, v37, @"clientAttributes");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = (id)objc_msgSend_mutableCopy(v39, v40, v41, v42);
    objc_msgSend__setAttributes_(self, v44, (uint64_t)v43, v45);
  }
  if (objc_msgSend_containsValueForKey_(a3, v40, @"pivot", v42))
  {
    *(void *)&double v46 = sub_1B64FA4B4(a3, (const char *)@"pivot").n128_u64[0];
    objc_msgSend_setPivot_(self, v47, v48, v49, v46);
  }
  uint64_t v50 = objc_opt_class();
  uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, @"light");
  objc_msgSend_setLight_(self, v53, v52, v54);
  uint64_t v55 = objc_opt_class();
  uint64_t v57 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v56, v55, @"model");
  objc_msgSend_setModel_(self, v58, v57, v59);
  uint64_t v60 = objc_opt_class();
  uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v61, v60, @"camera");
  objc_msgSend_setCamera_(self, v63, v62, v64);
  uint64_t v65 = objc_opt_class();
  uint64_t v67 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v66, v65, @"skinner");
  objc_msgSend_setSkinner_(self, v68, v67, v69);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float32x2_t v70 = sub_1B65607B4(a3, self);
    objc_msgSend_setAllTargetsFromAnimCodec_(a3, v71, (uint64_t)v70, v72);
    uint64_t v73 = objc_opt_class();
    uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, @"morpher");
    objc_msgSend_setMorpher_(self, v76, v75, v77);
    objc_msgSend_setAllTargetsFromAnimCodec_(a3, v78, 0, v79);
  }
  else
  {
    uint64_t v80 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v81, v80, @"morpher");
    objc_msgSend_setMorpher_(self, v83, v82, v84);
  }
  uint64_t v85 = objc_opt_class();
  uint64_t v87 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v86, v85, @"deformers");
  objc_msgSend_setDeformers_(self, v88, v87, v89);
  uint64_t v90 = objc_opt_class();
  uint64_t v92 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v91, v90, @"filters");
  objc_msgSend_setFilters_(self, v93, v92, v94);
  uint64_t v95 = objc_opt_class();
  uint64_t v97 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v96, v95, @"constraints");
  objc_msgSend_setConstraints_(self, v98, v97, v99);
  uint64_t v100 = objc_opt_class();
  uint64_t v102 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v101, v100, @"forceField");
  objc_msgSend_setForceField_(self, v103, v102, v104);
  if (objc_msgSend_containsValueForKey_(a3, v105, @"effect", v106))
  {
    uint64_t v107 = objc_opt_class();
    uint64_t v109 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v108, v107, @"effect");
    uint64_t v110 = [VFXBehaviorGraph alloc];
    uint64_t v114 = objc_msgSend_tag(v109, v111, v112, v113);
    id v117 = (id)objc_msgSend_initWithTag_(v110, v115, v114, v116);
    objc_msgSend_setBehaviorGraph_(self, v118, (uint64_t)v117, v119);
    uint64_t v120 = [VFXParticleEmitter alloc];
    uint64_t v124 = objc_msgSend_tag(v109, v121, v122, v123);
    id v127 = (id)objc_msgSend_initWithTag_(v120, v125, v124, v126);
    objc_msgSend_setParticleEmitter_(self, v128, (uint64_t)v127, v129);
  }
  else
  {
    uint64_t v130 = objc_opt_class();
    uint64_t v132 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v131, v130, @"behaviorGraph");
    objc_msgSend_setBehaviorGraph_(self, v133, v132, v134);
    uint64_t v135 = objc_opt_class();
    uint64_t v137 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v136, v135, @"emitter");
    objc_msgSend_setParticleEmitter_(self, v138, v137, v139);
    uint64_t v140 = objc_opt_class();
    uint64_t v142 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v141, v140, @"collider");
    objc_msgSend_setParticleCollider_(self, v143, v142, v144);
  }
  uint64_t v145 = objc_opt_class();
  uint64_t v147 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v146, v145, @"childNodes");
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v148, (uint64_t)&v155, (uint64_t)v159, 16);
  if (v149)
  {
    uint64_t v152 = v149;
    uint64_t v153 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v152; ++i)
      {
        if (*(void *)v156 != v153) {
          objc_enumerationMutation(v147);
        }
        objc_msgSend_addChildNode_(self, v150, *(void *)(*((void *)&v155 + 1) + 8 * i), v151);
      }
      uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v150, (uint64_t)&v155, (uint64_t)v159, 16);
    }
    while (v152);
  }
}

- (void)_didDecodeVFXNode:(id)a3
{
  if (!objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3))
  {
    char v8 = objc_msgSend_particleEmitter(self, v5, v6, v7);
    uint64_t v15 = objc_msgSend_tag(v8, v9, v10, v11);
    if (v15
      || (uint64_t v16 = objc_msgSend_particleCollider(self, v12, v13, v14),
          (uint64_t v15 = objc_msgSend_tag(v16, v17, v18, v19)) != 0)
      || (uint64_t v15 = objc_msgSend_valueForUndefinedKey_(self, v20, @"_entityTagIdentifier", v21)) != 0)
    {
      CFDictionaryRef v22 = [VFXBehaviorGraph alloc];
      id v26 = (id)objc_msgSend_initWithTag_(v22, v23, v15, v24);
      objc_msgSend_setBehaviorGraph_(self, v25, (uint64_t)v26, v27);
    }
  }
}

- (void)_encodeNodePropertiesWithCoder:(id)a3
{
  sub_1B64FA2F4(a3, (const char *)@"position", *(__n128 *)&self->_position[2]);
  int v8 = (*((unsigned __int8 *)self + 49) >> 5) & 3;
  switch(v8)
  {
    case 2:
      __n128 v9 = *(__n128 *)&self->_anon_90[2];
      uint64_t v10 = @"orientation";
LABEL_7:
      sub_1B64FA35C(a3, (const char *)v10, v9);
      break;
    case 1:
      __n128 v9 = *(__n128 *)&self->_anon_90[2];
      uint64_t v10 = @"rotation";
      goto LABEL_7;
    case 0:
      sub_1B64FA2F4(a3, (const char *)@"eulerAngles", *(__n128 *)&self->_anon_90[2]);
      break;
  }
  if ((*((unsigned char *)self + 49) & 0x60) != 0x20)
  {
    objc_msgSend_rotation(self, v5, v6, v7);
    sub_1B64FA35C(a3, (const char *)@"rotation", v11);
  }
  sub_1B64FA2F4(a3, (const char *)@"scale", *(__n128 *)&self->_scale[2]);
  *(float *)&double v12 = self->_opacity;
  objc_msgSend_encodeFloat_forKey_(a3, v13, @"opacity", v14, v12);
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->_categoryBitMask, @"categoryBitMask");
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_renderingOrder, @"renderingOrder");
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)name, @"name");
  }
  objc_msgSend_encodeBool_forKey_(a3, v17, *((unsigned __int8 *)self + 49) >> 7, @"hidden");
  objc_msgSend_encodeBool_forKey_(a3, v19, *((unsigned char *)self + 50) & 1, @"castsShadow");
  uint64_t v21 = (*((unsigned __int8 *)self + 50) >> 1) & 1;

  objc_msgSend_encodeBool_forKey_(a3, v20, v21, @"depthPrePass");
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v8 = objc_msgSend_options(a3, v5, v6, v7),
        __n128 v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"VFXWorldExportPresentationTree", v10), objc_msgSend_BOOLValue(v11, v12, v13, v14)))
  {
    uint64_t v17 = objc_msgSend_presentationNode(self, v5, v15, v16);
    objc_msgSend__syncObjCModel(v17, v18, v19, v20);
    objc_msgSend__updateAffine(v17, v21, v22, v23);
    objc_msgSend__customEncodingOfVFXNode_usePresentationObject_(self, v24, (uint64_t)a3, 1);
    objc_msgSend__encodeNodePropertiesWithCoder_(v17, v25, (uint64_t)a3, v26);
    sub_1B64FAB54(a3, self, v27, v28);
  }
  else
  {
    objc_msgSend__customEncodingOfVFXNode_usePresentationObject_(self, v5, (uint64_t)a3, 0);
    objc_msgSend__encodeNodePropertiesWithCoder_(self, v29, (uint64_t)a3, v30);
    sub_1B64FAB54(a3, self, v31, v32);
    sub_1B64FAEBC(a3, self, v33, v34);
  }
}

- (VFXNode)initWithCoder:(id)a3
{
  v92.receiver = self;
  v92.super_class = (Class)VFXNode;
  uint64_t v7 = [(VFXNode *)&v92 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v11 = sub_1B64A0828();
    v7->_node = (__CFXNode *)v11;
    if (v11) {
      sub_1B6583684(v11, v7, v13, v14, v15, v16, v17, v18);
    }
    v7->_valueForKeyLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"name");
    objc_msgSend_setName_(v7, v22, v21, v23);
    objc_msgSend__customDecodingOfVFXNode_(v7, v24, (uint64_t)a3, v25);
    double v26 = sub_1B64FA42C(a3, (const char *)@"position");
    objc_msgSend_setPosition_(v7, v27, v28, v29, v26);
    if (objc_msgSend_containsValueForKey_(a3, v30, @"orientation", v31))
    {
      *(void *)&double v34 = sub_1B64FA474(a3, (const char *)@"orientation").n128_u64[0];
      objc_msgSend_setOrientation_(v7, v35, v36, v37, v34);
    }
    else if (objc_msgSend_containsValueForKey_(a3, v32, @"eulerAngles", v33))
    {
      double v38 = sub_1B64FA42C(a3, (const char *)@"eulerAngles");
      objc_msgSend_setEulerAngles_(v7, v39, v40, v41, v38);
    }
    else
    {
      *(void *)&double v42 = sub_1B64FA474(a3, (const char *)@"rotation").n128_u64[0];
      objc_msgSend_setRotation_(v7, v43, v44, v45, v42);
    }
    double v46 = sub_1B64FA42C(a3, (const char *)@"scale");
    objc_msgSend_setScale_(v7, v47, v48, v49, v46);
    objc_msgSend_decodeFloatForKey_(a3, v50, @"opacity", v51);
    objc_msgSend_setOpacity_(v7, v52, v53, v54);
    uint64_t v57 = objc_msgSend_decodeIntegerForKey_(a3, v55, @"categoryBitMask", v56);
    objc_msgSend_setCategoryBitMask_(v7, v58, v57, v59);
    uint64_t v62 = objc_msgSend_decodeIntegerForKey_(a3, v60, @"renderingOrder", v61);
    objc_msgSend_setRenderingOrder_(v7, v63, v62, v64);
    uint64_t v67 = objc_msgSend_decodeBoolForKey_(a3, v65, @"hidden", v66);
    objc_msgSend_setHidden_(v7, v68, v67, v69);
    uint64_t v72 = objc_msgSend_decodeBoolForKey_(a3, v70, @"castsShadow", v71);
    objc_msgSend_setCastsShadow_(v7, v73, v72, v74);
    if (objc_msgSend_containsValueForKey_(a3, v75, @"depthPrePass", v76))
    {
      uint64_t v79 = objc_msgSend_decodeBoolForKey_(a3, v77, @"depthPrePass", v78);
      objc_msgSend_setUsesDepthPrePass_(v7, v80, v79, v81);
    }
    uint64_t v82 = objc_opt_class();
    uint64_t v84 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v83, v82, @"physicsBody");
    objc_msgSend_setPhysicsBody_(v7, v85, v84, v86);
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend__didDecodeVFXNode_(v7, v87, (uint64_t)a3, v88);
    objc_msgSend_setImmediateMode_(VFXTransaction, v89, v8, v90);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isAuthoring
{
  return (*((unsigned __int8 *)self + 50) >> 5) & 1;
}

- (void)setIsAuthoring:(BOOL)a3
{
  if (a3) {
    char v4 = 32;
  }
  else {
    char v4 = 0;
  }
  *((unsigned char *)self + 50) = *((unsigned char *)self + 50) & 0xDF | v4;
  if (a3) {
    objc_msgSend_setCastsShadow_(self, a2, 0, v3);
  }
}

- (BOOL)editorLocked
{
  return (*((unsigned __int8 *)self + 50) >> 6) & 1;
}

- (void)setEditorLocked:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 50);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 64;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 50) = v4 & 0xBF | v7;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B64D4A54;
    void v10[3] = &unk_1E6141190;
    v10[4] = self;
    BOOL v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (id)authoringTargetNode
{
  return objc_getAssociatedObject(self, &unk_1E9DDAFB0);
}

- (void)setAuthoringTargetNode:(id)a3
{
}

- (BOOL)getBoundingSphereCenter:(VFXNode *)self radius:(SEL)a2
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (self->_node)
  {
    char v4 = (_DWORD *)v3;
    uint64_t v5 = (float32x4_t *)v2;
    float32x4_t v76 = 0uLL;
    if (*((unsigned char *)self + 48))
    {
      uint64_t v14 = objc_msgSend_worldRef(self, a2, v2, v3);
      uint64_t v22 = v14;
      if (v14) {
        sub_1B64B0C28(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      char v12 = sub_1B63F49F8(self->_node, 1, (uint64_t)&v76, v17, v18, v19, v20, v21);
      if (v5) {
        *uint64_t v5 = v76;
      }
      if (v4) {
        *char v4 = v76.i32[3];
      }
      if (v22) {
        sub_1B64B0CB4(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      uint64_t v60 = (_DWORD *)v3;
      float32x4_t v75 = 0uLL;
      char v7 = objc_msgSend_model(self, a2, v2, v3);
      v74.i32[2] = 0;
      v74.i64[0] = 0;
      __int32 v73 = 0;
      if (v7)
      {
        v78.i32[2] = 0;
        v78.i64[0] = 0;
        v77.columns[0].i32[0] = 0;
        int BoundingSphereCenter_radius = objc_msgSend_getBoundingSphereCenter_radius_(v7, v8, (uint64_t)&v78, (uint64_t)&v77);
        char v12 = BoundingSphereCenter_radius;
        if (BoundingSphereCenter_radius)
        {
          float32x4_t v13 = v78;
          v13.i32[3] = v77.columns[0].i32[0];
          float32x4_t v76 = v13;
        }
      }
      else
      {
        char v12 = 0;
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v30 = objc_msgSend_childNodes(self, v8, v9, v10);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v69, (uint64_t)v82, 16);
      if (v32)
      {
        uint64_t v34 = v32;
        uint64_t v35 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v70 != v35) {
              objc_enumerationMutation(v30);
            }
            uint64_t v37 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            int v38 = objc_msgSend_getBoundingSphereCenter_radius_(v37, v33, (uint64_t)&v74, (uint64_t)&v73);
            float32x4_t v41 = v74;
            v41.i32[3] = v73;
            float32x4_t v75 = v41;
            if (v38)
            {
              float32x4_t v67 = 0u;
              long long v68 = 0u;
              float32x4_t v65 = 0u;
              float32x4_t v66 = 0u;
              objc_msgSend_transform(v37, v33, v39, v40);
              float32x4_t v63 = v43;
              float32x4_t v64 = v42;
              float32x4_t v61 = v45;
              float32x4_t v62 = v44;
              objc_msgSend_pivot(v37, v46, v47, v48);
              simd_float4x4 v85 = __invert_f4(v84);
              uint64_t v54 = 0;
              simd_float4x4 v77 = v85;
              float32x4_t v78 = 0u;
              float32x4_t v79 = 0u;
              float32x4_t v80 = 0u;
              long long v81 = 0u;
              do
              {
                *(float32x4_t *)((char *)&v78 + v54 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v77.columns[v54])), v63, *(float32x2_t *)v77.columns[v54].f32, 1), v62, (float32x4_t)v77.columns[v54], 2), v61, (float32x4_t)v77.columns[v54], 3);
                ++v54;
              }
              while (v54 != 4);
              float32x4_t v65 = v78;
              float32x4_t v66 = v79;
              float32x4_t v67 = v80;
              long long v68 = v81;
              float32x4_t v55 = vmulq_f32(v65, v65);
              __n128 v56 = (__n128)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1)));
              float32x4_t v57 = vmulq_f32(v66, v66);
              v56.n128_f32[0] = sqrtf(v56.n128_f32[0]);
              float32x4_t v58 = vmulq_f32(v67, v67);
              v56.n128_u32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
              v56.n128_u32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1))).f32[0]);
              sub_1B63DAB1C(&v75, &v65, (uint64_t)&v75, v49, v50, v51, v52, v53, v56);
              if (v12) {
                sub_1B6403B98(&v76, &v75, &v76);
              }
              else {
                float32x4_t v76 = v75;
              }
              char v12 = 1;
            }
          }
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v69, (uint64_t)v82, 16);
        }
        while (v34);
      }
      if (v12)
      {
        if (v5) {
          *uint64_t v5 = v76;
        }
        if (v60) {
          *uint64_t v60 = v76.i32[3];
        }
      }
    }
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (double)pivot
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v15 = (long long *)sub_1B64A0B00(*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    if (v15)
    {
      long long v5 = *v15;
      if (!v14) {
        return *(double *)&v5;
      }
    }
    else
    {
      *(void *)&long long v5 = 1065353216;
      if (!v14) {
        return *(double *)&v5;
      }
    }
    uint64_t v28 = v5;
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
    *(void *)&long long v5 = v28;
    return *(double *)&v5;
  }
  if ((*(unsigned char *)(a1 + 49) & 4) != 0)
  {
    uint64_t v23 = objc_msgSend_valueForKey_((void *)a1, a2, @"kPivotKey", a4);
    if (v23) {
      objc_msgSend_VFXMatrix4Value(v23, v24, v25, v26);
    }
    else {
      *(void *)&long long v5 = 1065353216;
    }
  }
  else
  {
    *(void *)&long long v5 = 1065353216;
  }
  return *(double *)&v5;
}

- (BOOL)hasPhysicBody
{
  if (*((unsigned char *)self + 48)) {
    LOBYTE(v8) = sub_1B64A4838((uint64_t)self->_node, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return (*((unsigned __int16 *)self + 26) >> 7) & 1;
  }
  return v8;
}

- (void)setPivot:(float32x4_t)a3
{
  uint64_t v9 = objc_msgSend_valueForKey_(a1, a2, @"kPivotKey", a8);
  if (v9)
  {
    objc_msgSend_VFXMatrix4Value(v9, v10, v11, v12);
  }
  else
  {
    float32x4_t v15 = (float32x4_t)xmmword_1B6E51390;
    float32x4_t v16 = (float32x4_t)unk_1B6E513A0;
    float32x4_t v13 = (float32x4_t)xmmword_1B6E51370;
    float32x4_t v14 = (float32x4_t)unk_1B6E51380;
  }
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v13, a3), (int8x16_t)vceqq_f32(v14, a4)), vandq_s8((int8x16_t)vceqq_f32(v15, a5), (int8x16_t)vceqq_f32(v16, a6)))) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(a1, v10, @"pivot", v12);
    float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
    int v21 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v20, vabdq_f32(a4, *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16))), (int8x16_t)vcgeq_f32(v20, vabdq_f32(a3, *MEMORY[0x1E4F149A0]))), vandq_s8((int8x16_t)vcgeq_f32(v20, vabdq_f32(a5, *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32))), (int8x16_t)vcgeq_f32(v20, vabdq_f32(a6, *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48))))));
    a1[49] = (a1[49] & 0xFB | (4 * (v21 < 0))) ^ 4;
    if (v21 < 0)
    {
      objc_msgSend_setValue_forKey_(a1, v17, 0, @"kPivotKey");
    }
    else
    {
      uint64_t v22 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E4F29238], v17, v18, v19);
      objc_msgSend_setValue_forKey_(a1, v23, v22, @"kPivotKey");
    }
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x6010000000;
    v43[3] = "";
    float32x4_t v44 = a3;
    float32x4_t v45 = a4;
    float32x4_t v46 = a5;
    float32x4_t v47 = a6;
    uint64_t v27 = objc_msgSend_worldRef(a1, v24, v25, v26);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_1B64D5140;
    v42[3] = &unk_1E6143080;
    v42[4] = a1;
    v42[5] = v43;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v28, v27, (uint64_t)a1, @"pivot", v42);
    if (objc_msgSend_hasPhysicBody(a1, v29, v30, v31))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_(a1, v32, 7, v33);
      objc_msgSend_resetTransform(ComponentWithType, v35, v36, v37);
    }
    objc_msgSend_didChangeValueForKey_(a1, v32, @"pivot", v33);
    _Block_object_dispose(v43, 8);
  }
}

- (double)transform
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v30 = sub_1B649FE9C(*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(double *)&long long v5 = v30;
    }
    else
    {
      *(double *)&long long v5 = sub_1B649FE9C(*(void *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    if ((*(unsigned char *)(a1 + 49) & 2) == 0) {
      objc_msgSend__updateTransform((void *)a1, a2, a3, a4);
    }
    long long v5 = *(_OWORD *)(a1 + 64);
  }
  return *(double *)&v5;
}

- (float32x4_t)setTransform:(uint64_t)a3
{
  uint64_t v8 = result;
  float32x4_t v62 = a5;
  float32x4_t v63 = a6;
  float32x4_t v64 = a7;
  __n128 v65 = a8;
  if (result[3].i8[0])
  {
    uint64_t v39 = objc_msgSend_worldRef(result, a2, a3, a4);
    if (v39)
    {
      uint64_t v47 = v39;
      sub_1B64B0C28(v39, v40, v41, v42, v43, v44, v45, v46);
      sub_1B64A2614(v8->i64[1], (uint64_t)&v62);
      return (float32x4_t *)sub_1B64B0CB4(v47, v48, v49, v50, v51, v52, v53, v54);
    }
    else
    {
      return (float32x4_t *)sub_1B64A2614(v8->i64[1], (uint64_t)&v62);
    }
  }
  else if ((result[3].i8[1] & 2) == 0 {
         || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a6, result[5]), (int8x16_t)vceqq_f32(a5, result[4])), vandq_s8((int8x16_t)vceqq_f32(a7, result[6]), (int8x16_t)vceqq_f32((float32x4_t)a8, result[7])))) & 0x80000000) == 0)
  }
  {
    v55.i64[1] = a5.i64[1];
    objc_msgSend_willChangeValueForKey_(result, a2, @"transform", a4, a5.i64[0]);
    v61.n128_u32[2] = 0;
    v61.n128_u64[0] = 0;
    v60.i32[2] = 0;
    v60.i64[0] = 0;
    float32x4_t v59 = 0uLL;
    sub_1B64CC360(&v59, &v61, &v60, v55, a6, a7, a8);
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v59), (int8x16_t)vcgezq_f32(v59)))) & 0x80000000) != 0)
    {
      sub_1B63F2F54(16, @"Error: node::setTransform - invalid matrix", v10, v11, v12, v13, v14, v15, v55.i64[0]);
      float32x4_t v59 = (float32x4_t)xmmword_1B6E4F370;
    }
    uint32x4_t v16 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v60), (int8x16_t)vcgezq_f32(v60)));
    v16.i32[3] = v16.i32[2];
    if ((vmaxvq_u32(v16) & 0x80000000) != 0)
    {
      sub_1B63F2F54(16, @"Error: node::setTransform - invalid matrix (nan in scale)", v10, v11, v12, v13, v14, v15, v55.i64[0]);
      __asm { FMOV            V0.4S, #1.0 }
      float32x4_t v60 = _Q0;
    }
    objc_msgSend__setPosition_(v8, v9, v10, v11, v61.n128_f64[0]);
    objc_msgSend__setQuaternion_(v8, v22, v23, v24, *(double *)v59.i64);
    objc_msgSend__setScale_(v8, v25, v26, v27, *(double *)v60.i64);
    float32x4_t v28 = v63;
    v8[4] = v62;
    void v8[5] = v28;
    __n128 v29 = v65;
    void v8[6] = v64;
    v8[7] = (float32x4_t)v29;
    v8[3].i8[1] |= 2u;
    if (objc_msgSend_hasPhysicBody(v8, v30, v31, v32))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_(v8, v33, 7, v34);
      objc_msgSend_resetTransform(ComponentWithType, v36, v37, v38);
    }
    return (float32x4_t *)objc_msgSend_didChangeValueForKey_(v8, v33, @"transform", v34);
  }
  return result;
}

- (double)position
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v24 = sub_1B64A230C(*(__n128 **)(a1 + 8));
      sub_1B64B0CB4(v14, v15, v16, v17, v18, v19, v20, v21);
      *(double *)&long long v5 = v24;
    }
    else
    {
      uint64_t v22 = *(__n128 **)(a1 + 8);
      *(double *)&long long v5 = sub_1B64A230C(v22);
    }
  }
  else
  {
    if ((*(unsigned char *)(a1 + 49) & 1) == 0) {
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    }
    long long v5 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v5;
}

- (void)setPosition:(VFXNode *)self
{
  if (*((unsigned char *)self + 48))
  {
    float32x4_t v32 = v4;
    uint64_t v15 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v15)
    {
      uint64_t v23 = v15;
      sub_1B64B0C28(v15, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64A2314((__n128 *)self->_node, v32);
      sub_1B64B0CB4(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    else
    {
      node = self->_node;
      sub_1B64A2314((__n128 *)node, v32);
    }
  }
  else
  {
    objc_msgSend__setPosition_(self, a2, v2, v3);
    if (objc_msgSend_hasPhysicBody(self, v6, v7, v8))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_(self, v9, 7, v10);
      objc_msgSend_resetTransform(ComponentWithType, v12, v13, v14);
    }
  }
}

- (double)rotation
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v8)
    {
      uint64_t v16 = v8;
      sub_1B64B0C28(v8, v9, v10, v11, v12, v13, v14, v15);
      sub_1B64A2508(*(float32x4_t **)(a1 + 8), v17, v18, v19, v20, v21, v22, v23);
      uint64_t v39 = v24;
      sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
      *(void *)&long long v7 = v39;
    }
    else
    {
      float32x4_t v32 = *(float32x4_t **)(a1 + 8);
      sub_1B64A2508(v32, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    unsigned int v5 = *(unsigned __int8 *)(a1 + 49);
    if ((v5 & 1) == 0)
    {
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
      unsigned int v5 = *(unsigned __int8 *)(a1 + 49);
    }
    int v6 = (v5 >> 5) & 3;
    if (v6)
    {
      if (v6 == 2)
      {
        float32x4_t v33 = *(float32x4_t *)(a1 + 144);
        float32x4_t v34 = vmulq_f32(v33, v33);
        LODWORD(v35) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).u32[0];
        float32x2_t v36 = vrsqrte_f32((float32x2_t)LODWORD(v35));
        float32x2_t v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)LODWORD(v35), vmul_f32(v36, v36)));
        unint64_t v40 = vmulq_n_f32(v33, vmul_f32(v37, vrsqrts_f32((float32x2_t)LODWORD(v35), vmul_f32(v37, v37))).f32[0]).u64[0];
        atan2f(sqrtf(v35), v33.f32[3]);
        *(void *)&long long v7 = v40;
      }
      else
      {
        *(void *)&long long v7 = 0;
        if (v6 == 1) {
          long long v7 = *(_OWORD *)(a1 + 144);
        }
      }
    }
    else
    {
      float32x4_t v41 = 0u;
      float32x4_t v42 = 0u;
      sub_1B63F8DB8(&v42, (float32x4_t)*(unsigned int *)(a1 + 144), *(float32_t *)(a1 + 148), *(float32_t *)(a1 + 152));
      sub_1B63F89FC(&v42, &v41);
      *(void *)&long long v7 = v41.i64[0];
    }
  }
  return *(double *)&v7;
}

- (void)setRotation:(VFXNode *)self
{
  char v6 = *((unsigned char *)self + 49);
  float32x4_t v27 = v4;
  if ((v6 & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    float32x4_t v4 = v27;
    char v6 = *((unsigned char *)self + 49);
  }
  if ((v6 & 0x60) != 0x20
    || (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_90[2], v4)) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, @"rotation", v3, *(_OWORD *)&v27);
    char v10 = *((unsigned char *)self + 49);
    *(float32x4_t *)&self->_anon_90[2] = v28;
    *((unsigned char *)self + 49) = v10 & 0x9D | 0x20;
    uint32x4_t v11 = (uint32x4_t)vceqzq_f32(v28);
    v11.i32[3] = v11.i32[2];
    if ((vminvq_u32(v11) & 0x80000000) != 0)
    {
      float32x4_t v15 = v28;
    }
    else
    {
      int32x4_t v12 = (int32x4_t)vmulq_f32(v28, v28);
      v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
      float32x2_t v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
      float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
      float32x4_t v15 = vmulq_n_f32(v28, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
    }
    v15.i32[3] = v28.i32[3];
    uint64_t v16 = objc_msgSend_worldRef(self, v7, v8, v9, *(_OWORD *)&v15);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1B64D5814;
    v30[3] = &unk_1E61412D0;
    float32x4_t v32 = self;
    long long v31 = v29;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, @"rotation", v30);
    if (objc_msgSend_hasPhysicBody(self, v18, v19, v20))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_(self, v21, 7, v22);
      objc_msgSend_resetTransform(ComponentWithType, v24, v25, v26);
    }
    objc_msgSend_didChangeValueForKey_(self, v21, @"rotation", v22);
  }
}

- (double)orientation
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v29 = sub_1B64A2500(*(float32x4_t **)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      return v29;
    }
    else
    {
      return sub_1B64A2500(*(float32x4_t **)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    objc_msgSend__quaternion((void *)a1, a2, a3, a4);
  }
  return result;
}

- (void)setOrientation:(uint64_t)a3
{
  if (*(unsigned char *)(a1 + 48))
  {
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)a9), (int8x16_t)vcgezq_f32((float32x4_t)a9)))) & 0x80000000) != 0)
    {
      if ((byte_1E9DDAFB1 & 1) == 0)
      {
        byte_1E9DDAFB1 = 1;
        sub_1B63F2F54(16, @"Error: attempt to set NaN to node's quaternion", a3, a4, a5, a6, a7, a8, a10);
      }
    }
    else
    {
      uint64_t v20 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
      if (v20)
      {
        uint64_t v28 = v20;
        sub_1B64B0C28(v20, v21, v22, v23, v24, v25, v26, v27);
        sub_1B64A2590(*(float32x4_t **)(a1 + 8), v29, v30, v31, v32, v33, v34, v35, a9);
        sub_1B64B0CB4(v28, v36, v37, v38, v39, v40, v41, v42);
      }
      else
      {
        uint64_t v43 = *(float32x4_t **)(a1 + 8);
        sub_1B64A2590(v43, v21, v22, v23, v24, v25, v26, v27, a9);
      }
    }
  }
  else
  {
    objc_msgSend__setQuaternion_((void *)a1, a2, a3, a4);
    if (objc_msgSend_hasPhysicBody((void *)a1, v11, v12, v13))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_((void *)a1, v14, 7, v15);
      objc_msgSend_resetTransform(ComponentWithType, v17, v18, v19);
    }
  }
}

- (double)eulerAngles
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v30 = sub_1B64A254C(*(float32x4_t **)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
    else
    {
      uint64_t v29 = *(float32x4_t **)(a1 + 8);
      return sub_1B64A254C(v29, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    objc_msgSend__euler((void *)a1, a2, a3, a4);
  }
  return result;
}

- (void)setEulerAngles:(VFXNode *)self
{
  __n128 v49 = v4;
  if (*((unsigned char *)self + 48))
  {
    uint64_t v25 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v25)
    {
      uint64_t v33 = v25;
      sub_1B64B0C28(v25, v26, v27, v28, v29, v30, v31, v32);
      sub_1B64A2554((uint64_t)self->_node, v34, v35, v36, v37, v38, v39, v40, v49);
      sub_1B64B0CB4(v33, v41, v42, v43, v44, v45, v46, v47);
    }
    else
    {
      node = self->_node;
      sub_1B64A2554((uint64_t)node, v26, v27, v28, v29, v30, v31, v32, v49);
    }
  }
  else
  {
    if ((*((unsigned char *)self + 49) & 1) == 0) {
      objc_msgSend__updateAffine(self, a2, v2, v3);
    }
    objc_msgSend__euler(self, a2, v2, v3, *(_OWORD *)&v49);
    uint32x4_t v9 = (uint32x4_t)vceqq_f32(v8, v50);
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, @"eulerAngles", v7);
      char v10 = *((unsigned char *)self + 49);
      *(float32x4_t *)&self->_anon_90[2] = v50;
      *((unsigned char *)self + 49) = v10 & 0x9D;
      uint64_t v14 = objc_msgSend_worldRef(self, v11, v12, v13);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_1B64D5C20;
      v51[3] = &unk_1E61412D0;
      uint64_t v53 = self;
      float32x4_t v52 = v50;
      objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, @"eulerAngles", v51);
      if (objc_msgSend_hasPhysicBody(self, v16, v17, v18))
      {
        id ComponentWithType = objc_msgSend__findComponentWithType_(self, v19, 7, v20);
        objc_msgSend_resetTransform(ComponentWithType, v22, v23, v24);
      }
      objc_msgSend_didChangeValueForKey_(self, v19, @"eulerAngles", v20);
    }
  }
}

- (double)scale
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      double v31 = sub_1B64A2478(*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(double *)&long long v5 = v31;
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 8);
      *(double *)&long long v5 = sub_1B64A2478(v29, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    if ((*(unsigned char *)(a1 + 49) & 1) == 0) {
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    }
    long long v5 = *(_OWORD *)(a1 + 160);
  }
  return *(double *)&v5;
}

- (void)setScale:(VFXNode *)self
{
  if (*((unsigned char *)self + 48))
  {
    float32x4_t v39 = v4;
    uint64_t v15 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v15)
    {
      uint64_t v23 = v15;
      sub_1B64B0C28(v15, v16, v17, v18, v19, v20, v21, v22);
      sub_1B64A2480((uint64_t)self->_node, v24, v25, v26, v27, v28, v29, v30, v39);
      sub_1B64B0CB4(v23, v31, v32, v33, v34, v35, v36, v37);
    }
    else
    {
      node = self->_node;
      sub_1B64A2480((uint64_t)node, v16, v17, v18, v19, v20, v21, v22, v39);
    }
  }
  else
  {
    objc_msgSend__setScale_(self, a2, v2, v3);
    if (objc_msgSend_hasPhysicBody(self, v6, v7, v8))
    {
      id ComponentWithType = objc_msgSend__findComponentWithType_(self, v9, 7, v10);
      objc_msgSend_resetTransform(ComponentWithType, v12, v13, v14);
    }
  }
}

- (double)worldPosition
{
  objc_msgSend_worldTransform(a1, a2, a3, a4);
  return v4;
}

- (void)setWorldPosition:(VFXNode *)self
{
  float32x4_t v14 = v4;
  if (objc_msgSend_parentNode(self, a2, v2, v3))
  {
    uint64_t v9 = objc_msgSend_parentNode(self, v6, v7, v8);
    objc_msgSend_worldTransform(v9, v10, v11, v12);
    simd_float4x4 v17 = __invert_f4(v16);
    *(void *)&double v13 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v17.columns[3], (float32x4_t)v17.columns[2], v14, 2), (float32x4_t)v17.columns[1], *(float32x2_t *)v14.f32, 1), (float32x4_t)v17.columns[0], v14.f32[0]).u64[0];
  }
  else
  {
    double v13 = *(double *)v14.i64;
  }

  objc_msgSend_setPosition_(self, v6, v7, v8, v13);
}

- (double)worldOrientation
{
  objc_msgSend_worldTransform(a1, a2, a3, a4);
  int32x4_t v5 = (int32x4_t)vmulq_f32(v4, v4);
  int32x4_t v7 = (int32x4_t)vmulq_f32(v6, v6);
  int32x4_t v9 = (int32x4_t)vmulq_f32(v8, v8);
  int32x4_t v10 = vzip2q_s32(v5, v9);
  float32x4_t v11 = (float32x4_t)vzip1q_s32(vzip1q_s32(v5, v9), v7);
  float32x4_t v12 = (float32x4_t)vtrn2q_s32(v5, v7);
  v12.i32[2] = v9.i32[1];
  float32x4_t v13 = vaddq_f32((float32x4_t)vzip1q_s32(v10, vdupq_laneq_s32(v7, 2)), vaddq_f32(v11, v12));
  v12.i64[0] = 0x80000000800000;
  v12.i64[1] = 0x80000000800000;
  int8x16_t v14 = (int8x16_t)vcgeq_f32(v12, v13);
  v13.i32[3] = 0;
  float32x4_t v15 = vrsqrteq_f32(v13);
  float32x4_t v16 = vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)));
  int32x4_t v17 = (int32x4_t)v14;
  v17.i32[3] = 0;
  float32x4_t v18 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v17), (int8x16_t)v13, (int8x16_t)vmulq_f32(v16, vrsqrtsq_f32(v13, vmulq_f32(v16, v16))));
  float32x4_t v19 = vmulq_n_f32(v4, v18.f32[0]);
  float32x4_t v20 = vmulq_lane_f32(v6, *(float32x2_t *)v18.f32, 1);
  float32x4_t v21 = vmulq_laneq_f32(v8, v18, 2);
  int8x16_t v22 = (int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21);
  int8x16_t v23 = (int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20);
  int32x4_t v24 = (int32x4_t)v19;
  if (v14.i32[0])
  {
    int8x16_t v25 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v22, (int8x16_t)v21, 0xCuLL), vnegq_f32(v20)), v21, (float32x4_t)vextq_s8(v23, (int8x16_t)v20, 0xCuLL));
    int32x4_t v24 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), v25, 0xCuLL);
  }
  int8x16_t v26 = (int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19);
  float32x4_t v27 = v20;
  if (v14.i32[1])
  {
    int8x16_t v28 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v26, (int8x16_t)v19, 0xCuLL), vnegq_f32(v21)), v19, (float32x4_t)vextq_s8(v22, (int8x16_t)v21, 0xCuLL));
    float32x4_t v27 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), v28, 0xCuLL);
  }
  if (v14.i32[2])
  {
    int8x16_t v14 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v23, (int8x16_t)v20, 0xCuLL), vnegq_f32(v19)), v20, (float32x4_t)vextq_s8(v26, (int8x16_t)v19, 0xCuLL));
    float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), v14, 0xCuLL);
  }
  float v29 = (float)(*(float *)v24.i32 + v27.f32[1]) + v21.f32[2];
  if (v29 > 0.0)
  {
    float32x4_t v30 = (float32x4_t)vzip2q_s32((int32x4_t)v27, vuzp1q_s32((int32x4_t)v27, (int32x4_t)v21));
    v30.i32[2] = v24.i32[1];
    float v31 = sqrtf(v29 + 1.0);
    float32x4_t v32 = (float32x4_t)vtrn2q_s32((int32x4_t)v21, vzip2q_s32((int32x4_t)v21, v24));
    v32.i32[2] = v27.i32[0];
    float32x4_t v34 = vsubq_f32(v30, v32);
    v30.f32[3] = v31;
    v32.f32[3] = v31;
    float32x4_t v33 = vmulq_f32(v30, v32);
    v34.i32[3] = v33.i32[3];
LABEL_18:
    v33.f32[0] = 0.5 / v31;
    float32x4_t v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
    goto LABEL_19;
  }
  if (*(float *)v24.i32 < v27.f32[1] || *(float *)v24.i32 < v21.f32[2])
  {
    if (v27.f32[1] <= v21.f32[2])
    {
      float v31 = sqrtf((float)((float)(v21.f32[2] + 1.0) - *(float *)v24.i32) - v27.f32[1]);
      *(float32x2_t *)v34.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v24, (int32x4_t)v27), *(float32x2_t *)v21.f32);
      float32x2_t v45 = (float32x2_t)__PAIR64__(v24.u32[1], LODWORD(v31));
      float32x2_t v46 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0);
      *(float32x2_t *)v33.f32 = vsub_f32(*(float32x2_t *)v24.i8, v46);
      v46.f32[0] = v31;
      v46.i32[0] = vmul_f32(v45, v46).u32[0];
      v46.i32[1] = v33.i32[1];
      *(float32x2_t *)&v34.u32[2] = v46;
      goto LABEL_18;
    }
    float v38 = sqrtf((float)((float)(v27.f32[1] + 1.0) - *(float *)v24.i32) - v21.f32[2]);
    *(int32x2_t *)v14.i8 = vdup_laneq_s32((int32x4_t)v27, 2);
    int8x16_t v36 = v14;
    *(float *)v36.i32 = v38;
    v36.i32[0] = vmul_f32(*(float32x2_t *)v36.i8, (float32x2_t)__PAIR64__(v21.u32[1], LODWORD(v38))).u32[0];
    v36.i32[1] = vadd_f32(*(float32x2_t *)&v14, *(float32x2_t *)&v21).i32[1];
    int8x16_t v37 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.i8, 1), v27);
    int32x2_t v43 = (int32x2_t)vsubq_f32(v21, (float32x4_t)vdupq_laneq_s32(v24, 2)).u64[0];
    float32x4_t v44 = (float32x4_t)vextq_s8(vextq_s8(v37, v37, 4uLL), v36, 0xCuLL);
    v44.i32[3] = v43.i32[0];
  }
  else
  {
    float v38 = sqrtf((float)((float)(*(float *)v24.i32 + 1.0) - v27.f32[1]) - v21.f32[2]);
    float32x2_t v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0);
    float32x2_t v40 = vadd_f32(*(float32x2_t *)v24.i8, v39);
    v39.f32[0] = v38;
    v44.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v24.u32[1], LODWORD(v38)), v39).u32[0];
    v44.i32[1] = v40.i32[1];
    float32x2_t v41 = (float32x2_t)vzip2q_s32(v24, (int32x4_t)v27).u64[0];
    LODWORD(v42) = vadd_f32(v41, *(float32x2_t *)v21.f32).u32[0];
    int32x2_t v43 = (int32x2_t)vsub_f32(v41, *(float32x2_t *)v21.f32);
    HIDWORD(v42) = v43.i32[1];
    v44.i64[1] = v42;
  }
  *(float *)v43.i32 = 0.5 / v38;
  float32x4_t v34 = (float32x4_t)vdupq_lane_s32(v43, 0);
LABEL_19:
  *(void *)&double result = vmulq_f32(v34, v44).u64[0];
  return result;
}

- (uint64_t)setWorldOrientation:(uint64_t)a3
{
  if (!objc_msgSend_parentNode(a1, a2, a3, a4))
  {
    unint64_t v39 = a5.i64[0];
    goto LABEL_20;
  }
  int32x4_t v9 = objc_msgSend_parentNode(a1, v6, v7, v8);
  objc_msgSend_worldTransform(v9, v10, v11, v12);
  simd_float4x4 v66 = __invert_f4(v65);
  v66.columns[3] = (simd_float4)vmulq_f32((float32x4_t)v66.columns[0], (float32x4_t)v66.columns[0]);
  int32x4_t v13 = (int32x4_t)vmulq_f32((float32x4_t)v66.columns[1], (float32x4_t)v66.columns[1]);
  int32x4_t v14 = (int32x4_t)vmulq_f32((float32x4_t)v66.columns[2], (float32x4_t)v66.columns[2]);
  int32x4_t v15 = vzip2q_s32((int32x4_t)v66.columns[3], v14);
  float32x4_t v16 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v66.columns[3], v14), v13);
  v66.columns[3] = (simd_float4)vtrn2q_s32((int32x4_t)v66.columns[3], v13);
  v66.columns[3].i32[2] = v14.i32[1];
  float32x4_t v17 = vaddq_f32((float32x4_t)vzip1q_s32(v15, vdupq_laneq_s32(v13, 2)), vaddq_f32(v16, (float32x4_t)v66.columns[3]));
  v66.columns[3].i64[0] = 0x80000000800000;
  v66.columns[3].i64[1] = 0x80000000800000;
  int8x16_t v18 = (int8x16_t)vcgeq_f32((float32x4_t)v66.columns[3], v17);
  v17.i32[3] = 0;
  float32x4_t v19 = vrsqrteq_f32(v17);
  float32x4_t v20 = vmulq_f32(v19, vrsqrtsq_f32(v17, vmulq_f32(v19, v19)));
  int32x4_t v21 = (int32x4_t)v18;
  v21.i32[3] = 0;
  float32x4_t v22 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v21), (int8x16_t)v17, (int8x16_t)vmulq_f32(v20, vrsqrtsq_f32(v17, vmulq_f32(v20, v20))));
  float32x4_t v23 = vmulq_n_f32((float32x4_t)v66.columns[0], v22.f32[0]);
  float32x4_t v24 = vmulq_lane_f32((float32x4_t)v66.columns[1], *(float32x2_t *)v22.f32, 1);
  float32x4_t v25 = vmulq_laneq_f32((float32x4_t)v66.columns[2], v22, 2);
  int8x16_t v26 = (int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25);
  int8x16_t v27 = (int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24);
  int32x4_t v28 = (int32x4_t)v23;
  if (v18.i32[0])
  {
    int8x16_t v29 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v26, (int8x16_t)v25, 0xCuLL), vnegq_f32(v24)), v25, (float32x4_t)vextq_s8(v27, (int8x16_t)v24, 0xCuLL));
    int32x4_t v28 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), v29, 0xCuLL);
  }
  int8x16_t v30 = (int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23);
  float32x4_t v31 = v24;
  if (v18.i32[1])
  {
    int8x16_t v32 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v30, (int8x16_t)v23, 0xCuLL), vnegq_f32(v25)), v23, (float32x4_t)vextq_s8(v26, (int8x16_t)v25, 0xCuLL));
    float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), v32, 0xCuLL);
  }
  if (v18.i32[2])
  {
    int8x16_t v18 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v27, (int8x16_t)v24, 0xCuLL), vnegq_f32(v23)), v24, (float32x4_t)vextq_s8(v30, (int8x16_t)v23, 0xCuLL));
    float32x4_t v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), v18, 0xCuLL);
  }
  float v33 = (float)(*(float *)v28.i32 + v31.f32[1]) + v25.f32[2];
  if (v33 <= 0.0)
  {
    if (*(float *)v28.i32 < v31.f32[1] || *(float *)v28.i32 < v25.f32[2])
    {
      float32x4_t v41 = a5;
      if (v31.f32[1] <= v25.f32[2])
      {
        *(float32x2_t *)v25.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v28, (int32x4_t)v31), *(float32x2_t *)v25.f32);
        float32x2_t v60 = (float32x2_t)__PAIR64__(v28.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v25.f32[2] + 1.0) - *(float *)v28.i32) - v31.f32[1])));
        float32x2_t v61 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.f32, 0);
        int32x2_t v62 = (int32x2_t)vsub_f32(*(float32x2_t *)v28.i8, v61);
        v61.i32[0] = v60.i32[0];
        v61.i32[0] = vmul_f32(v60, v61).u32[0];
        v61.i32[1] = v62.i32[1];
        *(float32x2_t *)&v37.u32[2] = v61;
        *(float *)v62.i32 = 0.5 / v60.f32[0];
        float32x4_t v38 = (float32x4_t)vdupq_lane_s32(v62, 0);
      }
      else
      {
        float v42 = sqrtf((float)((float)(v31.f32[1] + 1.0) - *(float *)v28.i32) - v25.f32[2]);
        *(int32x2_t *)v18.i8 = vdup_laneq_s32((int32x4_t)v31, 2);
        int8x16_t v43 = v18;
        *(float *)v43.i32 = v42;
        v43.i32[0] = vmul_f32(*(float32x2_t *)v43.i8, (float32x2_t)__PAIR64__(v25.u32[1], LODWORD(v42))).u32[0];
        v43.i32[1] = vadd_f32(*(float32x2_t *)&v18, *(float32x2_t *)&v25).i32[1];
        int8x16_t v44 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.i8, 1), v31);
        int32x2_t v45 = (int32x2_t)vsubq_f32(v25, (float32x4_t)vdupq_laneq_s32(v28, 2)).u64[0];
        float32x4_t v38 = (float32x4_t)vextq_s8(vextq_s8(v44, v44, 4uLL), v43, 0xCuLL);
        v38.i32[3] = v45.i32[0];
        *(float *)v45.i32 = 0.5 / v42;
        float32x4_t v37 = (float32x4_t)vdupq_lane_s32(v45, 0);
      }
      goto LABEL_19;
    }
    float v46 = sqrtf((float)((float)(*(float *)v28.i32 + 1.0) - v31.f32[1]) - v25.f32[2]);
    float32x2_t v47 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.f32, 0);
    float32x2_t v48 = vadd_f32(*(float32x2_t *)v28.i8, v47);
    v47.f32[0] = v46;
    v38.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v46)), v47).u32[0];
    v38.i32[1] = v48.i32[1];
    float32x2_t v49 = (float32x2_t)vzip2q_s32(v28, (int32x4_t)v31).u64[0];
    LODWORD(v50) = vadd_f32(v49, *(float32x2_t *)v25.f32).u32[0];
    int32x2_t v51 = (int32x2_t)vsub_f32(v49, *(float32x2_t *)v25.f32);
    HIDWORD(v50) = v51.i32[1];
    v38.i64[1] = v50;
    *(float *)v51.i32 = 0.5 / v46;
    float32x4_t v37 = (float32x4_t)vdupq_lane_s32(v51, 0);
  }
  else
  {
    float32x4_t v34 = (float32x4_t)vzip2q_s32((int32x4_t)v31, vuzp1q_s32((int32x4_t)v31, (int32x4_t)v25));
    v34.i32[2] = v28.i32[1];
    float32x4_t v35 = (float32x4_t)vtrn2q_s32((int32x4_t)v25, vzip2q_s32((int32x4_t)v25, v28));
    v35.i32[2] = v31.i32[0];
    float32x4_t v37 = vsubq_f32(v34, v35);
    v34.i32[3] = sqrtf(v33 + 1.0);
    v35.i32[3] = v34.i32[3];
    float32x4_t v36 = vmulq_f32(v34, v35);
    v37.i32[3] = v36.i32[3];
    v36.f32[0] = 0.5 / v34.f32[3];
    float32x4_t v38 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0);
  }
  float32x4_t v41 = a5;
LABEL_19:
  _Q1 = vmulq_f32(v37, v38);
  _S2 = v41.i32[3];
  int8x16_t v54 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v41, (int32x4_t)v41), (int8x16_t)v41, 0xCuLL), vnegq_f32(_Q1)), v41, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q1, (int32x4_t)_Q1), (int8x16_t)_Q1, 0xCuLL));
  unint64_t v39 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q1, v41, 3), v41, _Q1, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v54, (int32x4_t)v54), v54, 0xCuLL)).u64[0];
  __asm { FMLA            S3, S2, V1.S[3] }
LABEL_20:

  return objc_msgSend_setOrientation_(a1, v6, v7, v8, *(double *)&v39);
}

- (double)worldTransform
{
  if (*(unsigned char *)(a1 + 48))
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v23 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v23)
    {
      uint64_t v31 = v23;
      sub_1B64B0C28(v23, v24, v25, v26, v27, v28, v29, v30);
      sub_1B64A27C4(*(void *)(a1 + 8), (uint64_t)&v66, v32, v33, v34, v35, v36, v37);
      sub_1B64B0CB4(v31, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      sub_1B64A27C4(*(void *)(a1 + 8), (uint64_t)&v66, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend_parentNode((void *)a1, a2, a3, a4);
    if (v5)
    {
      int32x4_t v9 = (void *)v5;
      long long v66 = 0u;
      long long v67 = 0u;
      objc_msgSend_transform((void *)a1, v6, v7, v8);
      long long v60 = v13;
      long long v63 = v14;
      long long v54 = v15;
      long long v57 = v16;
      if ((*(unsigned char *)(a1 + 49) & 4) != 0)
      {
        objc_msgSend_pivot((void *)a1, v10, v11, v12);
        simd_float4x4 v79 = __invert_f4(v78);
        uint64_t v17 = 0;
        long long v70 = v54;
        long long v71 = v57;
        long long v72 = v60;
        long long v73 = v63;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        do
        {
          *(long long *)((char *)&v74 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v79.columns[0], COERCE_FLOAT(*(long long *)((char *)&v70 + v17))), (float32x4_t)v79.columns[1], *(float32x2_t *)((char *)&v70 + v17), 1), (float32x4_t)v79.columns[2], *(float32x4_t *)((char *)&v70 + v17), 2), (float32x4_t)v79.columns[3], *(float32x4_t *)((char *)&v70 + v17), 3);
          v17 += 16;
        }
        while (v17 != 64);
        long long v57 = v75;
        long long v60 = v76;
        long long v63 = v77;
        long long v66 = v74;
        long long v54 = v74;
      }
      objc_msgSend_worldTransform(v9, v10, v11, v12, v54, v57, v60, v63, v66);
      uint64_t v22 = 0;
      long long v70 = v55;
      long long v71 = v58;
      long long v72 = v61;
      long long v73 = v64;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      do
      {
        *(long long *)((char *)&v74 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(long long *)((char *)&v70 + v22))), v19, *(float32x2_t *)((char *)&v70 + v22), 1), v20, *(float32x4_t *)((char *)&v70 + v22), 2), v21, *(float32x4_t *)((char *)&v70 + v22), 3);
        v22 += 16;
      }
      while (v22 != 64);
      goto LABEL_15;
    }
    objc_msgSend_transform((void *)a1, v6, v7, v8);
    long long v66 = v48;
    long long v67 = v49;
    long long v68 = v50;
    long long v69 = v51;
    if ((*(unsigned char *)(a1 + 49) & 4) != 0)
    {
      long long v56 = v48;
      long long v59 = v49;
      long long v62 = v50;
      long long v65 = v51;
      objc_msgSend_pivot((void *)a1, v45, v46, v47);
      simd_float4x4 v81 = __invert_f4(v80);
      uint64_t v52 = 0;
      long long v70 = v56;
      long long v71 = v59;
      long long v72 = v62;
      long long v73 = v65;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      do
      {
        *(long long *)((char *)&v74 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v81.columns[0], COERCE_FLOAT(*(long long *)((char *)&v70 + v52))), (float32x4_t)v81.columns[1], *(float32x2_t *)((char *)&v70 + v52), 1), (float32x4_t)v81.columns[2], *(float32x4_t *)((char *)&v70 + v52), 2), (float32x4_t)v81.columns[3], *(float32x4_t *)((char *)&v70 + v52), 3);
        v52 += 16;
      }
      while (v52 != 64);
LABEL_15:
      long long v66 = v74;
      long long v67 = v75;
      long long v68 = v76;
      long long v69 = v77;
    }
  }
  return *(double *)&v66;
}

- (uint64_t)setWorldTransform:(uint64_t)a3
{
  if (objc_msgSend_parentNode(a1, a2, a3, a4))
  {
    uint64_t v12 = objc_msgSend_parentNode(a1, v9, v10, v11);
    objc_msgSend_convertTransform_fromNode_(v12, v13, 0, v14, a5, a6, a7, a8);
  }
  else
  {
    double v18 = a8;
    double v16 = a6;
    double v17 = a7;
    double v15 = a5;
  }

  return objc_msgSend_setTransform_(a1, v9, v10, v11, v15, v16, v17, v18);
}

- (double)convertPosition:(void *)a3 toNode:(uint64_t)a4
{
  v6.columns[3].i64[0] = a5.i64[0];
  uint64_t v8 = (uint64_t)a3;
  if (!a3)
  {
    int32x4_t v9 = objc_msgSend_world(a1, a2, 0, a4);
    uint64_t v8 = objc_msgSend_rootNode(v9, v10, v11, v12);
    v6.columns[3].i64[0] = a5.i64[0];
  }
  if ((void *)v8 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v6.columns[3] = (simd_float4)vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v6.columns[3], (float32x4_t)v6.columns[2], a5, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)a5.f32, 1), (float32x4_t)v6.columns[0], a5.f32[0]);
    if (a3)
    {
      float32x4_t v18 = (float32x4_t)v6.columns[3];
      objc_msgSend_worldTransform(a3, v13, v14, v15);
      simd_float4x4 v6 = __invert_f4(v19);
      v6.columns[3].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v6.columns[3], (float32x4_t)v6.columns[2], v18, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)v18.f32, 1), (float32x4_t)v6.columns[0], v18.f32[0]).u64[0];
    }
  }
  return *(double *)v6.columns[3].i64;
}

- (double)convertPosition:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v7 = (uint64_t)a3;
  float32x4_t v26 = (float32x4_t)a5.columns[0];
  if (!a3)
  {
    uint64_t v8 = objc_msgSend_world(a1, a2, 0, a4);
    uint64_t v7 = objc_msgSend_rootNode(v8, v9, v10, v11);
    a5.columns[0].i64[0] = v26.i64[0];
  }
  if ((void *)v7 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    a5 = __invert_f4(v27);
    float32x4_t v15 = (float32x4_t)a5.columns[3];
    if (a3)
    {
      simd_float4 v24 = a5.columns[3];
      simd_float4 v25 = a5.columns[0];
      simd_float4 v22 = a5.columns[2];
      simd_float4 v23 = a5.columns[1];
      objc_msgSend_worldTransform(a3, v12, v13, v14);
      float32x4_t v19 = vmlaq_lane_f32(vmlaq_laneq_f32(v17, v16, v26, 2), v18, *(float32x2_t *)v26.f32, 1);
      a5.columns[1] = v23;
      float32x4_t v15 = (float32x4_t)v24;
      a5.columns[3] = (simd_float4)vmlaq_n_f32(v19, v20, v26.f32[0]);
      a5.columns[2] = v22;
      a5.columns[0] = v25;
    }
    else
    {
      a5.columns[3] = (simd_float4)v26;
    }
    a5.columns[0].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v15, (float32x4_t)a5.columns[2], (float32x4_t)a5.columns[3], 2), (float32x4_t)a5.columns[1], *(float32x2_t *)a5.columns[3].f32, 1), (float32x4_t)a5.columns[0], a5.columns[3].f32[0]).u64[0];
  }
  return *(double *)a5.columns[0].i64;
}

- (double)convertVector:(void *)a3 toNode:(uint64_t)a4
{
  v6.columns[2].i64[0] = a5.i64[0];
  uint64_t v8 = (uint64_t)a3;
  if (!a3)
  {
    int32x4_t v9 = objc_msgSend_world(a1, a2, 0, a4);
    uint64_t v8 = objc_msgSend_rootNode(v9, v10, v11, v12);
    v6.columns[2].i64[0] = a5.i64[0];
  }
  if ((void *)v8 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v6.columns[2] = (simd_float4)vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v6.columns[2], a5, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)a5.f32, 1), (float32x4_t)v6.columns[0], a5.f32[0]);
    if (a3)
    {
      float32x4_t v18 = (float32x4_t)v6.columns[2];
      objc_msgSend_worldTransform(a3, v13, v14, v15);
      simd_float4x4 v6 = __invert_f4(v19);
      v6.columns[2].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v6.columns[2], v18, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)v18.f32, 1), (float32x4_t)v6.columns[0], v18.f32[0]).u64[0];
    }
  }
  return *(double *)v6.columns[2].i64;
}

- (double)convertVector:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v7 = (uint64_t)a3;
  float32x4_t v21 = (float32x4_t)a5.columns[0];
  if (!a3)
  {
    uint64_t v8 = objc_msgSend_world(a1, a2, 0, a4);
    uint64_t v7 = objc_msgSend_rootNode(v8, v9, v10, v11);
    a5.columns[0].i64[0] = v21.i64[0];
  }
  if ((void *)v7 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    a5 = __invert_f4(v22);
    a5.columns[3] = a5.columns[0];
    if (a3)
    {
      simd_float4 v19 = a5.columns[1];
      simd_float4 v20 = a5.columns[0];
      simd_float4 v18 = a5.columns[2];
      objc_msgSend_worldTransform(a3, v12, v13, v14);
      float32x4_t v15 = vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)a5.columns[2], v21, 2), (float32x4_t)a5.columns[1], *(float32x2_t *)v21.f32, 1);
      a5.columns[2] = v18;
      a5.columns[1] = v19;
      float32x4_t v16 = vmlaq_n_f32(v15, (float32x4_t)a5.columns[0], v21.f32[0]);
      a5.columns[3] = v20;
    }
    else
    {
      float32x4_t v16 = v21;
    }
    a5.columns[0].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)a5.columns[2], v16, 2), (float32x4_t)a5.columns[1], *(float32x2_t *)v16.f32, 1), (float32x4_t)a5.columns[3], v16.f32[0]).u64[0];
  }
  return *(double *)a5.columns[0].i64;
}

- (float32x4_t)convertTransform:(void *)a3 toNode:(uint64_t)a4
{
  if (a3)
  {
    if (a3 == a1) {
      return result;
    }
    float32x4_t v33 = result;
    __n128 v34 = a6;
    __n128 v35 = a7;
    __n128 v36 = a8;
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    __n128 v31 = v11;
    float32x4_t v32 = v10;
    __n128 v29 = v13;
    __n128 v30 = v12;
    objc_msgSend_worldTransform(a3, v14, v15, v16);
    simd_float4x4 v46 = __invert_f4(v45);
    unint64_t v17 = 0;
    float32x4_t v37 = v32;
    __n128 v38 = v31;
    __n128 v39 = v30;
    __n128 v40 = v29;
    float32x4_t v41 = 0u;
    float32x4_t v42 = 0u;
    float32x4_t v43 = 0u;
    float32x4_t v44 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v41 + v17) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v46.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v37 + v17))), (float32x4_t)v46.columns[1], *(float32x2_t *)&v37.f32[v17 / 4], 1), (float32x4_t)v46.columns[2], *(float32x4_t *)((char *)&v37 + v17), 2), (float32x4_t)v46.columns[3], *(float32x4_t *)((char *)&v37 + v17), 3);
      v17 += 16;
    }
    while (v17 != 64);
    double result = v41;
    float32x4_t v18 = v42;
    float32x4_t v19 = v43;
    float32x4_t v20 = v44;
  }
  else
  {
    float32x4_t v33 = result;
    __n128 v34 = a6;
    __n128 v35 = a7;
    __n128 v36 = a8;
    float32x4_t v21 = objc_msgSend_world(a1, a2, 0, a4);
    if (objc_msgSend_rootNode(v21, v22, v23, v24) == a1) {
      return v33;
    }
    objc_msgSend_worldTransform(a1, v25, v26, v27);
  }
  unint64_t v28 = 0;
  float32x4_t v37 = v33;
  __n128 v38 = v34;
  __n128 v39 = v35;
  __n128 v40 = v36;
  float32x4_t v41 = 0u;
  float32x4_t v42 = 0u;
  float32x4_t v43 = 0u;
  float32x4_t v44 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v41 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(result, COERCE_FLOAT(*(_OWORD *)((char *)&v37 + v28))), v18, *(float32x2_t *)&v37.f32[v28 / 4], 1), v19, *(float32x4_t *)((char *)&v37 + v28), 2), v20, *(float32x4_t *)((char *)&v37 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  result.i64[0] = v41.i64[0];
  return result;
}

- (double)convertTransform:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v10 = (uint64_t)a3;
  __n128 v30 = a5;
  if (!a3)
  {
    __n128 v11 = objc_msgSend_world(a1, a2, 0, a4);
    uint64_t v10 = objc_msgSend_rootNode(v11, v12, v13, v14);
    a5.n128_u64[0] = v30.n128_u64[0];
  }
  if ((void *)v10 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    simd_float4x4 v43 = __invert_f4(v42);
    float32x4_t v18 = (float32x4_t)v43.columns[2];
    if (a3)
    {
      float32x4_t v28 = (float32x4_t)v43.columns[1];
      float32x4_t v29 = (float32x4_t)v43.columns[0];
      float32x4_t v26 = (float32x4_t)v43.columns[3];
      float32x4_t v27 = (float32x4_t)v43.columns[2];
      objc_msgSend_worldTransform(a3, v15, v16, v17);
      unint64_t v19 = 0;
      __n128 v34 = v20;
      __n128 v35 = v21;
      __n128 v36 = v22;
      __n128 v37 = v23;
      simd_float4 v38 = 0u;
      simd_float4 v39 = 0u;
      float32x4_t v40 = 0u;
      simd_float4 v41 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v38 + v19) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v19))), v28, (float32x2_t)v34.n128_u64[v19 / 8], 1), v27, *(float32x4_t *)((char *)&v34 + v19), 2), v26, *(float32x4_t *)((char *)&v34 + v19), 3);
        v19 += 16;
      }
      while (v19 != 64);
      v43.columns[0] = v38;
      v43.columns[1] = v39;
      float32x4_t v18 = v40;
      v43.columns[3] = v41;
    }
    unint64_t v24 = 0;
    __n128 v34 = v30;
    __n128 v35 = a6;
    __n128 v36 = a7;
    __n128 v37 = a8;
    simd_float4 v38 = 0u;
    simd_float4 v39 = 0u;
    float32x4_t v40 = 0u;
    simd_float4 v41 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v38 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v43.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v24))), (float32x4_t)v43.columns[1], (float32x2_t)v34.n128_u64[v24 / 8], 1), v18, *(float32x4_t *)((char *)&v34 + v24), 2), (float32x4_t)v43.columns[3], *(float32x4_t *)((char *)&v34 + v24), 3);
      v24 += 16;
    }
    while (v24 != 64);
    a5.n128_u64[0] = v38.i64[0];
  }
  return a5.n128_f64[0];
}

+ (double)localUp
{
  return 0.0078125;
}

+ (double)localRight
{
  *(void *)&double result = 1065353216;
  return result;
}

+ (double)localFront
{
  return 0.0;
}

- (double)worldUp
{
  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  float32x4_t v21 = v4;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_localUp(v5, v6, v7, v8);
  float32x4_t v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v10 = (int8x16_t)vnegq_f32(v9);
  int8x16_t v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, (int32x4_t)v10));
  float32x4_t v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  float32x4_t v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  float32x4_t v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  int8x16_t v16 = (int8x16_t)vnegq_f32(v15);
  int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, (int32x4_t)v16));
  float32x4_t v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (double)worldRight
{
  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  float32x4_t v21 = v4;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_localRight(v5, v6, v7, v8);
  float32x4_t v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v10 = (int8x16_t)vnegq_f32(v9);
  int8x16_t v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, (int32x4_t)v10));
  float32x4_t v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  float32x4_t v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  float32x4_t v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  int8x16_t v16 = (int8x16_t)vnegq_f32(v15);
  int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, (int32x4_t)v16));
  float32x4_t v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (double)worldFront
{
  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  float32x4_t v21 = v4;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_localFront(v5, v6, v7, v8);
  float32x4_t v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v10 = (int8x16_t)vnegq_f32(v9);
  int8x16_t v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, (int32x4_t)v10));
  float32x4_t v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  float32x4_t v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  float32x4_t v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  int8x16_t v16 = (int8x16_t)vnegq_f32(v15);
  int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, (int32x4_t)v16));
  float32x4_t v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (void)lookAt:(VFXNode *)self
{
  objc_msgSend_worldUp(self, a2, v2, v3);
  objc_msgSend_localFront(VFXNode, v5, v6, v7);

  MEMORY[0x1F4181798](self, sel_lookAt_up_localFront_, v8, v9);
}

- (void)lookAt:(VFXNode *)self up:(SEL)a2 localFront:
{
  float32x4_t v125 = v5;
  float32x4_t v127 = v6;
  float32x4_t v130 = v4;
  objc_msgSend_worldPosition(self, a2, v2, v3);
  uint32x4_t v9 = (uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32(v130, v8));
  v9.i32[3] = v9.i32[2];
  if ((vminvq_u32(v9) & 0x80000000) != 0) {
    return;
  }
  float32x4_t v10 = vsubq_f32(v130, v8);
  int32x4_t v11 = (int32x4_t)vmulq_f32(v10, v10);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  float32x4_t v14 = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
  float32x4_t v15 = vmulq_f32(v127, v14);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0] >= 0.0)
  {
    float32x4_t v48 = vaddq_f32(v127, v14);
    int32x4_t v49 = (int32x4_t)vmulq_f32(v48, v48);
    v49.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1))).u32[0];
    float32x2_t v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
    float32x2_t v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
    float32x4_t v52 = vmulq_n_f32(v48, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]);
    int8x16_t v53 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v52, (int32x4_t)v52), (int8x16_t)v52, 0xCuLL), vnegq_f32(v127)), v52, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
    float32x4_t v47 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v53, (int32x4_t)v53), v53, 0xCuLL);
    float32x4_t v54 = vmulq_f32(v127, v52);
    v47.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).u32[0];
    float32x4_t v55 = vmulq_f32(v14, v14);
    int32x2_t v124 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1))).u64[0];
  }
  else
  {
    int32x4_t v16 = (int32x4_t)vmulq_f32(v127, v127);
    v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
    float32x2_t v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
    float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
    float32x4_t v19 = vmulq_n_f32(v127, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
    float32x4_t v20 = vmulq_f32(v14, v14);
    unint64_t v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
    float32x2_t v22 = vrsqrte_f32((float32x2_t)v21);
    float32x2_t v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21, vmul_f32(v22, v22)));
    float32x4_t v24 = vaddq_f32(v19, vmulq_n_f32(v14, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21, vmul_f32(v23, v23))).f32[0]));
    float32x4_t v25 = vmulq_f32(v24, v24);
    float v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0];
    int32x2_t v124 = (int32x2_t)v21;
    if (v26 <= 1.4211e-14)
    {
      float32x4_t v108 = vabsq_f32(v127);
      float v109 = v108.f32[1];
      float v110 = v108.f32[2];
      if (v108.f32[0] > v108.f32[1] || v108.f32[0] > v108.f32[2])
      {
        float32x4_t v116 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL);
        float32x4_t v56 = v125;
        if (v109 <= v110)
        {
          float32x4_t v117 = vmulq_f32(v127, (float32x4_t)xmmword_1B6E4F4F0);
          float32x4_t v118 = (float32x4_t)xmmword_1B6E4F320;
        }
        else
        {
          float32x4_t v117 = vmulq_f32(v127, (float32x4_t)xmmword_1B6E4F4C0);
          float32x4_t v118 = (float32x4_t)xmmword_1B6E4F2E0;
        }
        float32x4_t v119 = vmlaq_f32(v117, v118, v116);
        float32x4_t v120 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v119, (int32x4_t)v119), (int8x16_t)v119, 0xCuLL);
        int32x4_t v121 = (int32x4_t)vmulq_f32(v119, v119);
        v121.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v121.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v121, 2), *(float32x2_t *)v121.i8)).u32[0];
        float32x2_t v122 = vrsqrte_f32((float32x2_t)v121.u32[0]);
        float32x2_t v123 = vmul_f32(v122, vrsqrts_f32((float32x2_t)v121.u32[0], vmul_f32(v122, v122)));
        float32x4_t v47 = vmulq_n_f32(v120, vmul_f32(v123, vrsqrts_f32((float32x2_t)v121.u32[0], vmul_f32(v123, v123))).f32[0]);
        v47.i32[3] = 0;
        goto LABEL_8;
      }
      float32x4_t v111 = vmlaq_f32(vmulq_f32(v127, (float32x4_t)xmmword_1B6E4F4D0), (float32x4_t)xmmword_1B6E4F300, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
      float32x4_t v112 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v111, (int32x4_t)v111), (int8x16_t)v111, 0xCuLL);
      int32x4_t v113 = (int32x4_t)vmulq_f32(v111, v111);
      v113.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v113.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v113, 2), *(float32x2_t *)v113.i8)).u32[0];
      float32x2_t v114 = vrsqrte_f32((float32x2_t)v113.u32[0]);
      float32x2_t v115 = vmul_f32(v114, vrsqrts_f32((float32x2_t)v113.u32[0], vmul_f32(v114, v114)));
      float32x4_t v47 = vmulq_n_f32(v112, vmul_f32(v115, vrsqrts_f32((float32x2_t)v113.u32[0], vmul_f32(v115, v115))).f32[0]);
      v47.i32[3] = 0;
    }
    else
    {
      uint64_t v27 = LODWORD(v26);
      float32x2_t v28 = vrsqrte_f32((float32x2_t)LODWORD(v26));
      float32x2_t v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27, vmul_f32(v28, v28)));
      float32x4_t v30 = vmulq_n_f32(v24, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27, vmul_f32(v29, v29))).f32[0]);
      float32x4_t v31 = vaddq_f32(v127, v30);
      int32x4_t v32 = (int32x4_t)vmulq_f32(v31, v31);
      v32.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), vadd_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1))).u32[0];
      float32x2_t v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
      float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
      float32x4_t v35 = vmulq_n_f32(v31, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
      float32x4_t v36 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL), vnegq_f32(v127)), v35, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
      float32x4_t v37 = vmulq_f32(v127, v35);
      float32x4_t v38 = vaddq_f32(v14, v30);
      int32x4_t v39 = (int32x4_t)vmulq_f32(v38, v38);
      v39.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))).u32[0];
      *(float32x2_t *)v32.i8 = vrsqrte_f32((float32x2_t)v39.u32[0]);
      *(float32x2_t *)v32.i8 = vmul_f32(*(float32x2_t *)v32.i8, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v32.i8)));
      float32x4_t v40 = vmulq_n_f32(v38, vmul_f32(*(float32x2_t *)v32.i8, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v32.i8))).f32[0]);
      int8x16_t v41 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v40, (int32x4_t)v40), (int8x16_t)v40, 0xCuLL), vnegq_f32(v30)), v40, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL));
      float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v41, (int32x4_t)v41), v41, 0xCuLL);
      float32x4_t v43 = vmulq_f32(v30, v40);
      v42.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).u32[0];
      int8x16_t v44 = (int8x16_t)vnegq_f32(v42);
      int8x16_t v45 = (int8x16_t)vtrn2q_s32((int32x4_t)v42, vtrn1q_s32((int32x4_t)v42, (int32x4_t)v44));
      float32x4_t v46 = (float32x4_t)vrev64q_s32((int32x4_t)v42);
      v46.i32[0] = v44.i32[1];
      v46.i32[3] = v44.i32[2];
      float32x4_t v47 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]), v46, *(float32x2_t *)v36.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v42, v44, 8uLL), v36.f32[0]), (float32x4_t)vextq_s8(v45, v45, 8uLL), v36, 2));
    }
  }
  float32x4_t v56 = v125;
LABEL_8:
  float32x4_t v57 = vmulq_f32(v47, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v58 = (int8x16_t)vnegq_f32(v57);
  float32x4_t v59 = v47;
  float32x4_t v131 = v47;
  int8x16_t v60 = (int8x16_t)vtrn2q_s32((int32x4_t)v57, vtrn1q_s32((int32x4_t)v57, (int32x4_t)v58));
  float32x4_t v61 = (float32x4_t)vextq_s8((int8x16_t)v57, v58, 8uLL);
  float32x4_t v62 = (float32x4_t)vrev64q_s32((int32x4_t)v57);
  v62.i32[0] = v58.i32[1];
  v62.i32[3] = v58.i32[2];
  float32x4_t v63 = vmlaq_f32(vmlaq_f32(v61, (float32x4_t)0, (float32x4_t)vextq_s8(v60, v60, 8uLL)), (float32x4_t)0, v62);
  int8x16_t v64 = (int8x16_t)vnegq_f32(v63);
  int8x16_t v65 = (int8x16_t)vtrn2q_s32((int32x4_t)v63, vtrn1q_s32((int32x4_t)v63, (int32x4_t)v64));
  float32x4_t v66 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v63, v64, 8uLL), *(float32x2_t *)v59.f32, 1), (float32x4_t)vextq_s8(v65, v65, 8uLL), v59.f32[0]);
  float32x4_t v67 = (float32x4_t)vrev64q_s32((int32x4_t)v63);
  v67.i32[0] = v64.i32[1];
  v67.i32[3] = v64.i32[2];
  float32x4_t v68 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v63, v59, 3), v67, v59, 2), v66);
  float32x4_t v69 = vmulq_f32(v14, v68);
  float32x4_t v70 = vmlsq_lane_f32(v68, v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))), 0);
  float32x4_t v71 = vmulq_f32(v70, v70);
  v71.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v71, 2), vaddq_f32(v71, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v71.f32, 1))).u64[0];
  float32x4_t v72 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v71.f32, 0);
  v72.i32[3] = 0;
  float32x4_t v73 = vrsqrteq_f32(v72);
  float32x4_t v74 = vmulq_f32(v73, vrsqrtsq_f32(v72, vmulq_f32(v73, v73)));
  float32x4_t v75 = vmulq_f32(v74, vrsqrtsq_f32(v72, vmulq_f32(v74, v74)));
  int32x4_t v76 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v71.f32[0] != 0.0)), 0x1FuLL));
  v76.i32[3] = 0;
  float32x4_t v77 = vmulq_f32(v14, v56);
  float32x4_t v78 = vmlsq_lane_f32(v56, v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))), 0);
  float32x4_t v79 = vmulq_f32(v78, v78);
  v79.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 2), vaddq_f32(v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 1))).u64[0];
  float32x4_t v80 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 0);
  float32x4_t v81 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v76), (int8x16_t)vmulq_f32(v75, v70), (int8x16_t)v70);
  v80.i32[3] = 0;
  float32x4_t v82 = vrsqrteq_f32(v80);
  float32x4_t v83 = vmulq_f32(v82, vrsqrtsq_f32(v80, vmulq_f32(v82, v82)));
  int32x4_t v84 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v79.f32[0] != 0.0)), 0x1FuLL));
  v84.i32[3] = 0;
  float32x4_t v85 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v84), (int8x16_t)vmulq_f32(v78, vmulq_f32(v83, vrsqrtsq_f32(v80, vmulq_f32(v83, v83)))), (int8x16_t)v78);
  int8x16_t v86 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL), vnegq_f32(v81)), v85, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v81, (int32x4_t)v81), (int8x16_t)v81, 0xCuLL));
  float32x4_t v126 = v14;
  float32x4_t v128 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v86, (int32x4_t)v86), v86, 0xCuLL);
  float32x4_t v87 = vmulq_f32(v85, v81);
  float v88 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).f32[0], -1.0), 1.0));
  float32x4_t v89 = vmulq_f32(v126, v128);
  BOOL v90 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v89, 2), vaddq_f32(v89, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v89.f32, 1))).f32[0] <= 0.0;
  float32x4_t v91 = (float32x4_t)vdupq_lane_s32(v124, 0);
  if (v90) {
    float v88 = -v88;
  }
  v91.i32[3] = 0;
  float32x4_t v92 = vrsqrteq_f32(v91);
  float32x4_t v93 = vmulq_f32(v92, vrsqrtsq_f32(v91, vmulq_f32(v92, v92)));
  int8x16_t v94 = (int8x16_t)vmulq_f32(v126, vmulq_f32(v93, vrsqrtsq_f32(v91, vmulq_f32(v93, v93))));
  int32x4_t v95 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v124.i32 != 0.0)), 0x1FuLL));
  v95.i32[3] = 0;
  float32x4_t v129 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v95), v94, (int8x16_t)v126);
  _KR00_8 = __sincosf_stret(v88 * 0.5);
  _Q2 = vmulq_n_f32(v129, _KR00_8.__sinval);
  _Q6 = (int32x4_t)v131;
  int8x16_t v102 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v131, 0xCuLL), vnegq_f32(_Q2)), v131, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q2, (int32x4_t)_Q2), (int8x16_t)_Q2, 0xCuLL));
  *(void *)&double v103 = vaddq_f32(vmlaq_n_f32(vmulq_laneq_f32(_Q2, v131, 3), v131, _KR00_8.__cosval), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v102, (int32x4_t)v102), v102, 0xCuLL)).u64[0];
  __asm { FMLA            S2, S1, V6.S[3] }

  objc_msgSend_setWorldOrientation_(self, v96, *(void *)&v97, *(void *)&v98, v103);
}

- (void)localTranslateBy:(VFXNode *)self
{
  float32x4_t v24 = v4;
  objc_msgSend_orientation(self, a2, v2, v3);
  float32x4_t v7 = vmulq_f32(v6, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v8 = (int8x16_t)vnegq_f32(v7);
  int8x16_t v9 = (int8x16_t)vtrn2q_s32((int32x4_t)v7, vtrn1q_s32((int32x4_t)v7, (int32x4_t)v8));
  float32x4_t v10 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v7, v8, 8uLL), *(float32x2_t *)v24.f32, 1), (float32x4_t)vextq_s8(v9, v9, 8uLL), v24.f32[0]);
  float32x4_t v11 = (float32x4_t)vrev64q_s32((int32x4_t)v7);
  v11.i32[0] = v8.i32[1];
  v11.i32[3] = v8.i32[2];
  float32x4_t v12 = vmlaq_laneq_f32(v10, v11, v24, 2);
  int8x16_t v13 = (int8x16_t)vnegq_f32(v12);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v12, vtrn1q_s32((int32x4_t)v12, (int32x4_t)v13));
  float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v12);
  v15.i32[0] = v13.i32[1];
  v15.i32[3] = v13.i32[2];
  float32x4_t v25 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v12, v6, 3), v15, v6, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v12, v13, 8uLL), *(float32x2_t *)v6.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v6.f32[0]));
  objc_msgSend_position(self, v16, v17, v18);
  *(void *)&double v23 = vaddq_f32(v22, v25).u64[0];

  objc_msgSend_setPosition_(self, v19, v20, v21, v23);
}

- (uint64_t)localRotateBy:(uint64_t)a3
{
  objc_msgSend_orientation(a1, a2, a3, a4);
  _S2 = a5.u32[3];
  int8x16_t v11 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a5, a5), (int8x16_t)a5, 0xCuLL), vnegq_f32(_Q0)), (float32x4_t)a5, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q0, (int32x4_t)_Q0), (int8x16_t)_Q0, 0xCuLL));
  *(void *)&double v12 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q0, (float32x4_t)a5, 3), (float32x4_t)a5, _Q0, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL)).u64[0];
  __asm { FMLA            S3, S2, V0.S[3] }

  return objc_msgSend_setOrientation_(a1, v6, v7, v8, v12);
}

- (uint64_t)rotateBy:(uint64_t)a3 aroundTarget:(uint64_t)a4
{
  uint64_t v7 = 0;
  float32x4_t v8 = vmulq_f32(a5, a5);
  float32x4_t v9 = vmulq_laneq_f32(a5, a5, 3);
  float v10 = vmulq_lane_f32(a5, *(float32x2_t *)a5.f32, 1).f32[0];
  v8.f32[0] = 0.5 - v8.f32[0];
  float32x2_t v11 = vmul_laneq_f32(*(float32x2_t *)a5.f32, a5, 2);
  v12.i32[3] = 0;
  v12.f32[0] = (float)(0.5 - v8.f32[1]) - v8.f32[2];
  v12.f32[1] = v10 + v9.f32[2];
  v12.f32[2] = v11.f32[0] - v9.f32[1];
  v13.i32[3] = 0;
  v13.f32[0] = v10 - v9.f32[2];
  v13.f32[1] = v8.f32[0] - v8.f32[2];
  v13.f32[2] = v11.f32[1] + v9.f32[0];
  *(int32x2_t *)v9.f32 = vrev64_s32(*(int32x2_t *)v9.f32);
  v14.i32[0] = vadd_f32(v11, *(float32x2_t *)v9.f32).u32[0];
  v14.i32[1] = vsub_f32(v11, *(float32x2_t *)&v9).i32[1];
  v14.f32[2] = v8.f32[0] - v8.f32[1];
  v14.i32[3] = 0;
  float32x4_t v15 = vnegq_f32(a6);
  v15.i32[3] = 1.0;
  float32x4_t v16 = vaddq_f32(v12, v12);
  float32x4_t v17 = vaddq_f32(v13, v13);
  float32x4_t v18 = vaddq_f32(v14, v14);
  long long v37 = xmmword_1B6E4F300;
  long long v38 = xmmword_1B6E4F320;
  long long v39 = xmmword_1B6E4F2E0;
  float32x4_t v40 = v15;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  float32x4_t v44 = 0u;
  do
  {
    *(long long *)((char *)&v41 + v7) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(*(long long *)((char *)&v37 + v7))), v17, *(float32x2_t *)((char *)&v37 + v7), 1), v18, *(float32x4_t *)((char *)&v37 + v7), 2), (float32x4_t)xmmword_1B6E4F370, *(float32x4_t *)((char *)&v37 + v7), 3);
    v7 += 16;
  }
  while (v7 != 64);
  uint64_t v19 = 0;
  a6.i32[3] = 1.0;
  long long v37 = v41;
  long long v38 = v42;
  long long v39 = v43;
  float32x4_t v40 = v44;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  float32x4_t v44 = 0u;
  do
  {
    *(long long *)((char *)&v41 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6E4F300, COERCE_FLOAT(*(long long *)((char *)&v37 + v19))), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)((char *)&v37 + v19), 1), (float32x4_t)xmmword_1B6E4F2E0, *(float32x4_t *)((char *)&v37 + v19), 2), a6, *(float32x4_t *)((char *)&v37 + v19), 3);
    v19 += 16;
  }
  while (v19 != 64);
  float32x4_t v35 = (float32x4_t)v42;
  float32x4_t v36 = (float32x4_t)v41;
  float32x4_t v33 = v44;
  float32x4_t v34 = (float32x4_t)v43;
  objc_msgSend_worldTransform(a1, a2, a3, a4);
  uint64_t v23 = 0;
  long long v37 = v24;
  long long v38 = v25;
  long long v39 = v26;
  float32x4_t v40 = v27;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  float32x4_t v44 = 0u;
  do
  {
    *(long long *)((char *)&v41 + v23) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(long long *)((char *)&v37 + v23))), v35, *(float32x2_t *)((char *)&v37 + v23), 1), v34, *(float32x4_t *)((char *)&v37 + v23), 2), v33, *(float32x4_t *)((char *)&v37 + v23), 3);
    v23 += 16;
  }
  while (v23 != 64);
  double v28 = *(double *)&v43;
  double v29 = *(double *)v44.i64;
  double v30 = *(double *)&v41;
  double v31 = *(double *)&v42;

  return objc_msgSend_setWorldTransform_(a1, v20, v21, v22, v30, v31, v28, v29);
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  float32x4_t v5 = objc_msgSend_deepClone(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setHidden_(v5, v6, 0, v7);
  float32x2_t v11 = objc_msgSend_world(VFXWorld, v8, v9, v10);
  float32x4_t v15 = objc_msgSend_rootNode(v11, v12, v13, v14);
  objc_msgSend_addChildNode_(v15, v16, (uint64_t)v5, v17);
  if (a3)
  {
    objc_msgSend_setAssetPathResolver_(v11, v18, (uint64_t)a3, v20);
    long long v24 = objc_msgSend_rootNode(v11, v21, v22, v23);
    objc_msgSend_enumerateHierarchyUsingBlock_(v24, v25, (uint64_t)&unk_1F0FB5AA8, v26);
  }

  return (id)objc_msgSend_debugQuickLookObject(v11, v18, v19, v20);
}

- (id)debugQuickLookObject
{
  float32x4_t v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);

  return (id)MEMORY[0x1F4181798](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  float32x4_t v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);

  return UIImagePNGRepresentation(v4);
}

- (id)positionValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_position(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_position(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  float32x4_t v18 = NSNumber;
  objc_msgSend_position(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setPositionValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setPosition_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)rotationValue
{
  v37[4] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_rotation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_rotation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_rotation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_rotation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v37, 4);
}

- (void)setRotationValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v34 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v33 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);

  objc_msgSend_setRotation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)orientationValue
{
  v37[4] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_orientation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_orientation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_orientation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_orientation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v37, 4);
}

- (void)setOrientationValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v34 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v33 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);

  objc_msgSend_setOrientation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)worldOrientationValue
{
  v37[4] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldOrientation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_worldOrientation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_worldOrientation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_worldOrientation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v37, 4);
}

- (void)setWorldOrientationValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v34 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v33 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);

  objc_msgSend_setWorldOrientation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)eulerAnglesValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_eulerAngles(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_eulerAngles(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  float32x4_t v18 = NSNumber;
  objc_msgSend_eulerAngles(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setEulerAnglesValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setEulerAngles_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)scaleValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_scale(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_scale(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  float32x4_t v18 = NSNumber;
  objc_msgSend_scale(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setScaleValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setScale_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)worldPositionValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldPosition(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_worldPosition(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  float32x4_t v18 = NSNumber;
  objc_msgSend_worldPosition(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setWorldPositionValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setWorldPosition_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)pivotValue
{
  v142[16] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_pivot(self, a2, v2, v3);
  v142[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_pivot(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v142[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_pivot(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v142[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_pivot(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v142[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  float32x4_t v35 = NSNumber;
  objc_msgSend_pivot(self, v36, v37, v38);
  v142[4] = objc_msgSend_numberWithFloat_(v35, v39, v40, v41, v42);
  long long v43 = NSNumber;
  objc_msgSend_pivot(self, v44, v45, v46);
  LODWORD(v48) = v47;
  v142[5] = objc_msgSend_numberWithFloat_(v43, v49, v50, v51, v48);
  float32x4_t v52 = NSNumber;
  objc_msgSend_pivot(self, v53, v54, v55);
  LODWORD(v57) = v56;
  v142[6] = objc_msgSend_numberWithFloat_(v52, v58, v59, v60, v57);
  float32x4_t v61 = NSNumber;
  objc_msgSend_pivot(self, v62, v63, v64);
  LODWORD(v66) = v65;
  v142[7] = objc_msgSend_numberWithFloat_(v61, v67, v68, v69, v66);
  float32x4_t v70 = NSNumber;
  objc_msgSend_pivot(self, v71, v72, v73);
  v142[8] = objc_msgSend_numberWithFloat_(v70, v74, v75, v76, v77);
  float32x4_t v78 = NSNumber;
  objc_msgSend_pivot(self, v79, v80, v81);
  LODWORD(v83) = v82;
  v142[9] = objc_msgSend_numberWithFloat_(v78, v84, v85, v86, v83);
  float32x4_t v87 = NSNumber;
  objc_msgSend_pivot(self, v88, v89, v90);
  LODWORD(v92) = v91;
  v142[10] = objc_msgSend_numberWithFloat_(v87, v93, v94, v95, v92);
  uint64_t v96 = NSNumber;
  objc_msgSend_pivot(self, v97, v98, v99);
  LODWORD(v101) = v100;
  v142[11] = objc_msgSend_numberWithFloat_(v96, v102, v103, v104, v101);
  uint64_t v105 = NSNumber;
  objc_msgSend_pivot(self, v106, v107, v108);
  v142[12] = objc_msgSend_numberWithFloat_(v105, v109, v110, v111, v112);
  int32x4_t v113 = NSNumber;
  objc_msgSend_pivot(self, v114, v115, v116);
  LODWORD(v118) = v117;
  v142[13] = objc_msgSend_numberWithFloat_(v113, v119, v120, v121, v118);
  float32x2_t v122 = NSNumber;
  objc_msgSend_pivot(self, v123, v124, v125);
  LODWORD(v127) = v126;
  v142[14] = objc_msgSend_numberWithFloat_(v122, v128, v129, v130, v127);
  float32x4_t v131 = NSNumber;
  objc_msgSend_pivot(self, v132, v133, v134);
  LODWORD(v136) = v135;
  v142[15] = objc_msgSend_numberWithFloat_(v131, v137, v138, v139, v136);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v140, (uint64_t)v142, 16);
}

- (void)setPivotValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v120 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v117 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  double v121 = COERCE_DOUBLE(__PAIR64__(v117, v120));
  uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(a3, v30, 4, v31);
  objc_msgSend_floatValue(v32, v33, v34, v35);
  unsigned int v118 = v36;
  long long v39 = objc_msgSend_objectAtIndexedSubscript_(a3, v37, 5, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  unsigned int v114 = v43;
  uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(a3, v44, 6, v45);
  objc_msgSend_floatValue(v46, v47, v48, v49);
  float32x4_t v52 = objc_msgSend_objectAtIndexedSubscript_(a3, v50, 7, v51);
  objc_msgSend_floatValue(v52, v53, v54, v55);
  double v119 = COERCE_DOUBLE(__PAIR64__(v114, v118));
  int8x16_t v58 = objc_msgSend_objectAtIndexedSubscript_(a3, v56, 8, v57);
  objc_msgSend_floatValue(v58, v59, v60, v61);
  unsigned int v115 = v62;
  int v65 = objc_msgSend_objectAtIndexedSubscript_(a3, v63, 9, v64);
  objc_msgSend_floatValue(v65, v66, v67, v68);
  unsigned int v112 = v69;
  uint64_t v72 = objc_msgSend_objectAtIndexedSubscript_(a3, v70, 10, v71);
  objc_msgSend_floatValue(v72, v73, v74, v75);
  float32x4_t v78 = objc_msgSend_objectAtIndexedSubscript_(a3, v76, 11, v77);
  objc_msgSend_floatValue(v78, v79, v80, v81);
  double v116 = COERCE_DOUBLE(__PAIR64__(v112, v115));
  int32x4_t v84 = objc_msgSend_objectAtIndexedSubscript_(a3, v82, 12, v83);
  objc_msgSend_floatValue(v84, v85, v86, v87);
  unsigned int v113 = v88;
  int v91 = objc_msgSend_objectAtIndexedSubscript_(a3, v89, 13, v90);
  objc_msgSend_floatValue(v91, v92, v93, v94);
  unsigned int v111 = v95;
  uint64_t v98 = objc_msgSend_objectAtIndexedSubscript_(a3, v96, 14, v97);
  objc_msgSend_floatValue(v98, v99, v100, v101);
  uint64_t v104 = objc_msgSend_objectAtIndexedSubscript_(a3, v102, 15, v103);
  objc_msgSend_floatValue(v104, v105, v106, v107);

  objc_msgSend_setPivot_(self, v108, v109, v110, v121, v119, v116, COERCE_DOUBLE(__PAIR64__(v111, v113)));
}

- (id)worldTransformValue
{
  v142[16] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldTransform(self, a2, v2, v3);
  v142[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_worldTransform(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v142[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_worldTransform(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v142[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_worldTransform(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v142[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  uint64_t v35 = NSNumber;
  objc_msgSend_worldTransform(self, v36, v37, v38);
  v142[4] = objc_msgSend_numberWithFloat_(v35, v39, v40, v41, v42);
  unsigned int v43 = NSNumber;
  objc_msgSend_worldTransform(self, v44, v45, v46);
  LODWORD(v48) = v47;
  v142[5] = objc_msgSend_numberWithFloat_(v43, v49, v50, v51, v48);
  float32x4_t v52 = NSNumber;
  objc_msgSend_worldTransform(self, v53, v54, v55);
  LODWORD(v57) = v56;
  v142[6] = objc_msgSend_numberWithFloat_(v52, v58, v59, v60, v57);
  uint64_t v61 = NSNumber;
  objc_msgSend_worldTransform(self, v62, v63, v64);
  LODWORD(v66) = v65;
  v142[7] = objc_msgSend_numberWithFloat_(v61, v67, v68, v69, v66);
  float32x4_t v70 = NSNumber;
  objc_msgSend_worldTransform(self, v71, v72, v73);
  v142[8] = objc_msgSend_numberWithFloat_(v70, v74, v75, v76, v77);
  float32x4_t v78 = NSNumber;
  objc_msgSend_worldTransform(self, v79, v80, v81);
  LODWORD(v83) = v82;
  v142[9] = objc_msgSend_numberWithFloat_(v78, v84, v85, v86, v83);
  uint64_t v87 = NSNumber;
  objc_msgSend_worldTransform(self, v88, v89, v90);
  LODWORD(v92) = v91;
  v142[10] = objc_msgSend_numberWithFloat_(v87, v93, v94, v95, v92);
  uint64_t v96 = NSNumber;
  objc_msgSend_worldTransform(self, v97, v98, v99);
  LODWORD(v101) = v100;
  v142[11] = objc_msgSend_numberWithFloat_(v96, v102, v103, v104, v101);
  uint64_t v105 = NSNumber;
  objc_msgSend_worldTransform(self, v106, v107, v108);
  v142[12] = objc_msgSend_numberWithFloat_(v105, v109, v110, v111, v112);
  unsigned int v113 = NSNumber;
  objc_msgSend_worldTransform(self, v114, v115, v116);
  LODWORD(v118) = v117;
  v142[13] = objc_msgSend_numberWithFloat_(v113, v119, v120, v121, v118);
  float32x2_t v122 = NSNumber;
  objc_msgSend_worldTransform(self, v123, v124, v125);
  LODWORD(v127) = v126;
  v142[14] = objc_msgSend_numberWithFloat_(v122, v128, v129, v130, v127);
  float32x4_t v131 = NSNumber;
  objc_msgSend_worldTransform(self, v132, v133, v134);
  LODWORD(v136) = v135;
  v142[15] = objc_msgSend_numberWithFloat_(v131, v137, v138, v139, v136);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v140, (uint64_t)v142, 16);
}

- (void)setWorldTransformValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v120 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v117 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  double v121 = COERCE_DOUBLE(__PAIR64__(v117, v120));
  uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(a3, v30, 4, v31);
  objc_msgSend_floatValue(v32, v33, v34, v35);
  unsigned int v118 = v36;
  long long v39 = objc_msgSend_objectAtIndexedSubscript_(a3, v37, 5, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  unsigned int v114 = v43;
  uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(a3, v44, 6, v45);
  objc_msgSend_floatValue(v46, v47, v48, v49);
  float32x4_t v52 = objc_msgSend_objectAtIndexedSubscript_(a3, v50, 7, v51);
  objc_msgSend_floatValue(v52, v53, v54, v55);
  double v119 = COERCE_DOUBLE(__PAIR64__(v114, v118));
  int8x16_t v58 = objc_msgSend_objectAtIndexedSubscript_(a3, v56, 8, v57);
  objc_msgSend_floatValue(v58, v59, v60, v61);
  unsigned int v115 = v62;
  int v65 = objc_msgSend_objectAtIndexedSubscript_(a3, v63, 9, v64);
  objc_msgSend_floatValue(v65, v66, v67, v68);
  unsigned int v112 = v69;
  uint64_t v72 = objc_msgSend_objectAtIndexedSubscript_(a3, v70, 10, v71);
  objc_msgSend_floatValue(v72, v73, v74, v75);
  float32x4_t v78 = objc_msgSend_objectAtIndexedSubscript_(a3, v76, 11, v77);
  objc_msgSend_floatValue(v78, v79, v80, v81);
  double v116 = COERCE_DOUBLE(__PAIR64__(v112, v115));
  int32x4_t v84 = objc_msgSend_objectAtIndexedSubscript_(a3, v82, 12, v83);
  objc_msgSend_floatValue(v84, v85, v86, v87);
  unsigned int v113 = v88;
  int v91 = objc_msgSend_objectAtIndexedSubscript_(a3, v89, 13, v90);
  objc_msgSend_floatValue(v91, v92, v93, v94);
  unsigned int v111 = v95;
  uint64_t v98 = objc_msgSend_objectAtIndexedSubscript_(a3, v96, 14, v97);
  objc_msgSend_floatValue(v98, v99, v100, v101);
  uint64_t v104 = objc_msgSend_objectAtIndexedSubscript_(a3, v102, 15, v103);
  objc_msgSend_floatValue(v104, v105, v106, v107);

  objc_msgSend_setWorldTransform_(self, v108, v109, v110, v121, v119, v116, COERCE_DOUBLE(__PAIR64__(v111, v113)));
}

- (id)convertPositionValue:(id)a3 toNode:(id)a4
{
  v94[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v91 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v88 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertPosition_toNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  uint64_t v31 = NSNumber;
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v92 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v89 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertPosition_toNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  int8x16_t v58 = NSNumber;
  uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  unsigned int v93 = v65;
  uint64_t v68 = objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  unsigned int v90 = v72;
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertPosition_toNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v86, (uint64_t)v94, 3);
}

- (id)convertPositionValue:(id)a3 fromNode:(id)a4
{
  v94[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v91 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v88 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertPosition_fromNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  uint64_t v31 = NSNumber;
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v92 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v89 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertPosition_fromNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  int8x16_t v58 = NSNumber;
  uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  unsigned int v93 = v65;
  uint64_t v68 = objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  unsigned int v90 = v72;
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertPosition_fromNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v86, (uint64_t)v94, 3);
}

- (id)convertVectorValue:(id)a3 toNode:(id)a4
{
  v94[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v91 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v88 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertVector_toNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  uint64_t v31 = NSNumber;
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v92 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v89 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertVector_toNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  int8x16_t v58 = NSNumber;
  uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  unsigned int v93 = v65;
  uint64_t v68 = objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  unsigned int v90 = v72;
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertVector_toNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v86, (uint64_t)v94, 3);
}

- (id)convertVectorValue:(id)a3 fromNode:(id)a4
{
  v94[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v91 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v88 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertVector_fromNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  uint64_t v31 = NSNumber;
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v92 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v89 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertVector_fromNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  int8x16_t v58 = NSNumber;
  uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  unsigned int v93 = v65;
  uint64_t v68 = objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  unsigned int v90 = v72;
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertVector_fromNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v86, (uint64_t)v94, 3);
}

- (id)convertTransformValue:(id)a3 toNode:(id)a4
{
  v1894[16] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v1877 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v1859 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(a3, v26, 3, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  *(void *)&double v1878 = __PAIR64__(v1859, v1877);
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 4, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v1860 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 5, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v1841 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 6, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  double v54 = objc_msgSend_objectAtIndexedSubscript_(a3, v52, 7, v53);
  objc_msgSend_floatValue(v54, v55, v56, v57);
  *(void *)&double v1861 = __PAIR64__(v1841, v1860);
  uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(a3, v58, 8, v59);
  objc_msgSend_floatValue(v60, v61, v62, v63);
  unsigned int v1842 = v64;
  uint64_t v67 = objc_msgSend_objectAtIndexedSubscript_(a3, v65, 9, v66);
  objc_msgSend_floatValue(v67, v68, v69, v70);
  unsigned int v1809 = v71;
  uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_(a3, v72, 10, v73);
  objc_msgSend_floatValue(v74, v75, v76, v77);
  uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(a3, v78, 11, v79);
  objc_msgSend_floatValue(v80, v81, v82, v83);
  *(void *)&double v1843 = __PAIR64__(v1809, v1842);
  uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(a3, v84, 12, v85);
  objc_msgSend_floatValue(v86, v87, v88, v89);
  unsigned int v1810 = v90;
  unsigned int v93 = objc_msgSend_objectAtIndexedSubscript_(a3, v91, 13, v92);
  objc_msgSend_floatValue(v93, v94, v95, v96);
  unsigned int v1793 = v97;
  uint64_t v100 = objc_msgSend_objectAtIndexedSubscript_(a3, v98, 14, v99);
  objc_msgSend_floatValue(v100, v101, v102, v103);
  uint64_t v106 = objc_msgSend_objectAtIndexedSubscript_(a3, v104, 15, v105);
  objc_msgSend_floatValue(v106, v107, v108, v109);
  objc_msgSend_convertTransform_toNode_(self, v110, (uint64_t)a4, v111, v1878, v1861, v1843, COERCE_DOUBLE(__PAIR64__(v1793, v1810)));
  v1894[0] = objc_msgSend_numberWithFloat_(v7, v112, v113, v114);
  unsigned int v115 = NSNumber;
  unsigned int v118 = objc_msgSend_objectAtIndexedSubscript_(a3, v116, 0, v117);
  objc_msgSend_floatValue(v118, v119, v120, v121);
  LODWORD(v1878) = v122;
  uint64_t v125 = objc_msgSend_objectAtIndexedSubscript_(a3, v123, 1, v124);
  objc_msgSend_floatValue(v125, v126, v127, v128);
  LODWORD(v1861) = v129;
  uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(a3, v130, 2, v131);
  objc_msgSend_floatValue(v132, v133, v134, v135);
  uint64_t v138 = objc_msgSend_objectAtIndexedSubscript_(a3, v136, 3, v137);
  objc_msgSend_floatValue(v138, v139, v140, v141);
  *(void *)&double v1879 = __PAIR64__(LODWORD(v1861), LODWORD(v1878));
  uint64_t v144 = objc_msgSend_objectAtIndexedSubscript_(a3, v142, 4, v143);
  objc_msgSend_floatValue(v144, v145, v146, v147);
  LODWORD(v1861) = v148;
  uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(a3, v149, 5, v150);
  objc_msgSend_floatValue(v151, v152, v153, v154);
  LODWORD(v1843) = v155;
  long long v158 = objc_msgSend_objectAtIndexedSubscript_(a3, v156, 6, v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  v164 = objc_msgSend_objectAtIndexedSubscript_(a3, v162, 7, v163);
  objc_msgSend_floatValue(v164, v165, v166, v167);
  *(void *)&double v1862 = __PAIR64__(LODWORD(v1843), LODWORD(v1861));
  uint64_t v170 = objc_msgSend_objectAtIndexedSubscript_(a3, v168, 8, v169);
  objc_msgSend_floatValue(v170, v171, v172, v173);
  LODWORD(v1843) = v174;
  uint64_t v177 = objc_msgSend_objectAtIndexedSubscript_(a3, v175, 9, v176);
  objc_msgSend_floatValue(v177, v178, v179, v180);
  unsigned int v1811 = v181;
  long long v184 = objc_msgSend_objectAtIndexedSubscript_(a3, v182, 10, v183);
  objc_msgSend_floatValue(v184, v185, v186, v187);
  v190 = objc_msgSend_objectAtIndexedSubscript_(a3, v188, 11, v189);
  objc_msgSend_floatValue(v190, v191, v192, v193);
  *(void *)&double v1844 = __PAIR64__(v1811, LODWORD(v1843));
  uint64_t v196 = objc_msgSend_objectAtIndexedSubscript_(a3, v194, 12, v195);
  objc_msgSend_floatValue(v196, v197, v198, v199);
  unsigned int v1812 = v200;
  v203 = objc_msgSend_objectAtIndexedSubscript_(a3, v201, 13, v202);
  objc_msgSend_floatValue(v203, v204, v205, v206);
  unsigned int v1794 = v207;
  v210 = objc_msgSend_objectAtIndexedSubscript_(a3, v208, 14, v209);
  objc_msgSend_floatValue(v210, v211, v212, v213);
  v216 = objc_msgSend_objectAtIndexedSubscript_(a3, v214, 15, v215);
  objc_msgSend_floatValue(v216, v217, v218, v219);
  objc_msgSend_convertTransform_toNode_(self, v220, (uint64_t)a4, v221, v1879, v1862, v1844, COERCE_DOUBLE(__PAIR64__(v1794, v1812)));
  LODWORD(v222) = HIDWORD(v222);
  v1894[1] = objc_msgSend_numberWithFloat_(v115, v223, v224, v225, v222);
  uint64_t v226 = NSNumber;
  v229 = objc_msgSend_objectAtIndexedSubscript_(a3, v227, 0, v228);
  objc_msgSend_floatValue(v229, v230, v231, v232);
  LODWORD(v1879) = v233;
  v236 = objc_msgSend_objectAtIndexedSubscript_(a3, v234, 1, v235);
  objc_msgSend_floatValue(v236, v237, v238, v239);
  LODWORD(v1862) = v240;
  v243 = objc_msgSend_objectAtIndexedSubscript_(a3, v241, 2, v242);
  objc_msgSend_floatValue(v243, v244, v245, v246);
  v249 = objc_msgSend_objectAtIndexedSubscript_(a3, v247, 3, v248);
  objc_msgSend_floatValue(v249, v250, v251, v252);
  *(void *)&double v1880 = __PAIR64__(LODWORD(v1862), LODWORD(v1879));
  uint64_t v255 = objc_msgSend_objectAtIndexedSubscript_(a3, v253, 4, v254);
  objc_msgSend_floatValue(v255, v256, v257, v258);
  LODWORD(v1862) = v259;
  uint64_t v262 = objc_msgSend_objectAtIndexedSubscript_(a3, v260, 5, v261);
  objc_msgSend_floatValue(v262, v263, v264, v265);
  LODWORD(v1844) = v266;
  v269 = objc_msgSend_objectAtIndexedSubscript_(a3, v267, 6, v268);
  objc_msgSend_floatValue(v269, v270, v271, v272);
  uint64_t v275 = objc_msgSend_objectAtIndexedSubscript_(a3, v273, 7, v274);
  objc_msgSend_floatValue(v275, v276, v277, v278);
  *(void *)&double v1863 = __PAIR64__(LODWORD(v1844), LODWORD(v1862));
  v281 = objc_msgSend_objectAtIndexedSubscript_(a3, v279, 8, v280);
  objc_msgSend_floatValue(v281, v282, v283, v284);
  LODWORD(v1844) = v285;
  v288 = objc_msgSend_objectAtIndexedSubscript_(a3, v286, 9, v287);
  objc_msgSend_floatValue(v288, v289, v290, v291);
  unsigned int v1813 = v292;
  uint64_t v295 = objc_msgSend_objectAtIndexedSubscript_(a3, v293, 10, v294);
  objc_msgSend_floatValue(v295, v296, v297, v298);
  uint64_t v301 = objc_msgSend_objectAtIndexedSubscript_(a3, v299, 11, v300);
  objc_msgSend_floatValue(v301, v302, v303, v304);
  *(void *)&double v1845 = __PAIR64__(v1813, LODWORD(v1844));
  v307 = objc_msgSend_objectAtIndexedSubscript_(a3, v305, 12, v306);
  objc_msgSend_floatValue(v307, v308, v309, v310);
  unsigned int v1814 = v311;
  v314 = objc_msgSend_objectAtIndexedSubscript_(a3, v312, 13, v313);
  objc_msgSend_floatValue(v314, v315, v316, v317);
  unsigned int v1795 = v318;
  v321 = objc_msgSend_objectAtIndexedSubscript_(a3, v319, 14, v320);
  objc_msgSend_floatValue(v321, v322, v323, v324);
  v327 = objc_msgSend_objectAtIndexedSubscript_(a3, v325, 15, v326);
  objc_msgSend_floatValue(v327, v328, v329, v330);
  objc_msgSend_convertTransform_toNode_(self, v331, (uint64_t)a4, v332, v1880, v1863, v1845, COERCE_DOUBLE(__PAIR64__(v1795, v1814)));
  LODWORD(v334) = v333;
  v1894[2] = objc_msgSend_numberWithFloat_(v226, v335, v336, v337, v334);
  v338 = NSNumber;
  id v341 = objc_msgSend_objectAtIndexedSubscript_(a3, v339, 0, v340);
  objc_msgSend_floatValue(v341, v342, v343, v344);
  LODWORD(v1880) = v345;
  v348 = objc_msgSend_objectAtIndexedSubscript_(a3, v346, 1, v347);
  objc_msgSend_floatValue(v348, v349, v350, v351);
  LODWORD(v1863) = v352;
  uint64_t v355 = objc_msgSend_objectAtIndexedSubscript_(a3, v353, 2, v354);
  objc_msgSend_floatValue(v355, v356, v357, v358);
  id v361 = objc_msgSend_objectAtIndexedSubscript_(a3, v359, 3, v360);
  objc_msgSend_floatValue(v361, v362, v363, v364);
  *(void *)&double v1881 = __PAIR64__(LODWORD(v1863), LODWORD(v1880));
  uint64_t v367 = objc_msgSend_objectAtIndexedSubscript_(a3, v365, 4, v366);
  objc_msgSend_floatValue(v367, v368, v369, v370);
  LODWORD(v1863) = v371;
  long long v374 = objc_msgSend_objectAtIndexedSubscript_(a3, v372, 5, v373);
  objc_msgSend_floatValue(v374, v375, v376, v377);
  LODWORD(v1845) = v378;
  v381 = objc_msgSend_objectAtIndexedSubscript_(a3, v379, 6, v380);
  objc_msgSend_floatValue(v381, v382, v383, v384);
  v387 = objc_msgSend_objectAtIndexedSubscript_(a3, v385, 7, v386);
  objc_msgSend_floatValue(v387, v388, v389, v390);
  *(void *)&double v1864 = __PAIR64__(LODWORD(v1845), LODWORD(v1863));
  v393 = objc_msgSend_objectAtIndexedSubscript_(a3, v391, 8, v392);
  objc_msgSend_floatValue(v393, v394, v395, v396);
  LODWORD(v1845) = v397;
  v400 = objc_msgSend_objectAtIndexedSubscript_(a3, v398, 9, v399);
  objc_msgSend_floatValue(v400, v401, v402, v403);
  unsigned int v1815 = v404;
  v407 = objc_msgSend_objectAtIndexedSubscript_(a3, v405, 10, v406);
  objc_msgSend_floatValue(v407, v408, v409, v410);
  v413 = objc_msgSend_objectAtIndexedSubscript_(a3, v411, 11, v412);
  objc_msgSend_floatValue(v413, v414, v415, v416);
  *(void *)&double v1846 = __PAIR64__(v1815, LODWORD(v1845));
  v419 = objc_msgSend_objectAtIndexedSubscript_(a3, v417, 12, v418);
  objc_msgSend_floatValue(v419, v420, v421, v422);
  unsigned int v1816 = v423;
  v426 = objc_msgSend_objectAtIndexedSubscript_(a3, v424, 13, v425);
  objc_msgSend_floatValue(v426, v427, v428, v429);
  unsigned int v1796 = v430;
  v433 = objc_msgSend_objectAtIndexedSubscript_(a3, v431, 14, v432);
  objc_msgSend_floatValue(v433, v434, v435, v436);
  v439 = objc_msgSend_objectAtIndexedSubscript_(a3, v437, 15, v438);
  objc_msgSend_floatValue(v439, v440, v441, v442);
  objc_msgSend_convertTransform_toNode_(self, v443, (uint64_t)a4, v444, v1881, v1864, v1846, COERCE_DOUBLE(__PAIR64__(v1796, v1816)));
  LODWORD(v446) = v445;
  v1894[3] = objc_msgSend_numberWithFloat_(v338, v447, v448, v449, v446);
  v450 = NSNumber;
  v453 = objc_msgSend_objectAtIndexedSubscript_(a3, v451, 0, v452);
  objc_msgSend_floatValue(v453, v454, v455, v456);
  LODWORD(v1881) = v457;
  v460 = objc_msgSend_objectAtIndexedSubscript_(a3, v458, 1, v459);
  objc_msgSend_floatValue(v460, v461, v462, v463);
  LODWORD(v1864) = v464;
  v467 = objc_msgSend_objectAtIndexedSubscript_(a3, v465, 2, v466);
  objc_msgSend_floatValue(v467, v468, v469, v470);
  v473 = objc_msgSend_objectAtIndexedSubscript_(a3, v471, 3, v472);
  objc_msgSend_floatValue(v473, v474, v475, v476);
  *(void *)&double v1882 = __PAIR64__(LODWORD(v1864), LODWORD(v1881));
  v479 = objc_msgSend_objectAtIndexedSubscript_(a3, v477, 4, v478);
  objc_msgSend_floatValue(v479, v480, v481, v482);
  LODWORD(v1864) = v483;
  v486 = objc_msgSend_objectAtIndexedSubscript_(a3, v484, 5, v485);
  objc_msgSend_floatValue(v486, v487, v488, v489);
  LODWORD(v1846) = v490;
  v493 = objc_msgSend_objectAtIndexedSubscript_(a3, v491, 6, v492);
  objc_msgSend_floatValue(v493, v494, v495, v496);
  v499 = objc_msgSend_objectAtIndexedSubscript_(a3, v497, 7, v498);
  objc_msgSend_floatValue(v499, v500, v501, v502);
  *(void *)&double v1865 = __PAIR64__(LODWORD(v1846), LODWORD(v1864));
  v505 = objc_msgSend_objectAtIndexedSubscript_(a3, v503, 8, v504);
  objc_msgSend_floatValue(v505, v506, v507, v508);
  LODWORD(v1846) = v509;
  v512 = objc_msgSend_objectAtIndexedSubscript_(a3, v510, 9, v511);
  objc_msgSend_floatValue(v512, v513, v514, v515);
  unsigned int v1817 = v516;
  v519 = objc_msgSend_objectAtIndexedSubscript_(a3, v517, 10, v518);
  objc_msgSend_floatValue(v519, v520, v521, v522);
  v525 = objc_msgSend_objectAtIndexedSubscript_(a3, v523, 11, v524);
  objc_msgSend_floatValue(v525, v526, v527, v528);
  *(void *)&double v1847 = __PAIR64__(v1817, LODWORD(v1846));
  v531 = objc_msgSend_objectAtIndexedSubscript_(a3, v529, 12, v530);
  objc_msgSend_floatValue(v531, v532, v533, v534);
  unsigned int v1818 = v535;
  v538 = objc_msgSend_objectAtIndexedSubscript_(a3, v536, 13, v537);
  objc_msgSend_floatValue(v538, v539, v540, v541);
  unsigned int v1797 = v542;
  v545 = objc_msgSend_objectAtIndexedSubscript_(a3, v543, 14, v544);
  objc_msgSend_floatValue(v545, v546, v547, v548);
  v551 = objc_msgSend_objectAtIndexedSubscript_(a3, v549, 15, v550);
  objc_msgSend_floatValue(v551, v552, v553, v554);
  objc_msgSend_convertTransform_toNode_(self, v555, (uint64_t)a4, v556, v1882, v1865, v1847, COERCE_DOUBLE(__PAIR64__(v1797, v1818)));
  v1894[4] = objc_msgSend_numberWithFloat_(v450, v557, v558, v559, v560);
  v561 = NSNumber;
  v564 = objc_msgSend_objectAtIndexedSubscript_(a3, v562, 0, v563);
  objc_msgSend_floatValue(v564, v565, v566, v567);
  LODWORD(v1882) = v568;
  v571 = objc_msgSend_objectAtIndexedSubscript_(a3, v569, 1, v570);
  objc_msgSend_floatValue(v571, v572, v573, v574);
  LODWORD(v1865) = v575;
  v578 = objc_msgSend_objectAtIndexedSubscript_(a3, v576, 2, v577);
  objc_msgSend_floatValue(v578, v579, v580, v581);
  v584 = objc_msgSend_objectAtIndexedSubscript_(a3, v582, 3, v583);
  objc_msgSend_floatValue(v584, v585, v586, v587);
  *(void *)&double v1883 = __PAIR64__(LODWORD(v1865), LODWORD(v1882));
  v590 = objc_msgSend_objectAtIndexedSubscript_(a3, v588, 4, v589);
  objc_msgSend_floatValue(v590, v591, v592, v593);
  LODWORD(v1865) = v594;
  v597 = objc_msgSend_objectAtIndexedSubscript_(a3, v595, 5, v596);
  objc_msgSend_floatValue(v597, v598, v599, v600);
  LODWORD(v1847) = v601;
  v604 = objc_msgSend_objectAtIndexedSubscript_(a3, v602, 6, v603);
  objc_msgSend_floatValue(v604, v605, v606, v607);
  v610 = objc_msgSend_objectAtIndexedSubscript_(a3, v608, 7, v609);
  objc_msgSend_floatValue(v610, v611, v612, v613);
  *(void *)&double v1866 = __PAIR64__(LODWORD(v1847), LODWORD(v1865));
  v616 = objc_msgSend_objectAtIndexedSubscript_(a3, v614, 8, v615);
  objc_msgSend_floatValue(v616, v617, v618, v619);
  LODWORD(v1847) = v620;
  v623 = objc_msgSend_objectAtIndexedSubscript_(a3, v621, 9, v622);
  objc_msgSend_floatValue(v623, v624, v625, v626);
  unsigned int v1819 = v627;
  v630 = objc_msgSend_objectAtIndexedSubscript_(a3, v628, 10, v629);
  objc_msgSend_floatValue(v630, v631, v632, v633);
  v636 = objc_msgSend_objectAtIndexedSubscript_(a3, v634, 11, v635);
  objc_msgSend_floatValue(v636, v637, v638, v639);
  *(void *)&double v1848 = __PAIR64__(v1819, LODWORD(v1847));
  v642 = objc_msgSend_objectAtIndexedSubscript_(a3, v640, 12, v641);
  objc_msgSend_floatValue(v642, v643, v644, v645);
  unsigned int v1820 = v646;
  v649 = objc_msgSend_objectAtIndexedSubscript_(a3, v647, 13, v648);
  objc_msgSend_floatValue(v649, v650, v651, v652);
  unsigned int v1798 = v653;
  v656 = objc_msgSend_objectAtIndexedSubscript_(a3, v654, 14, v655);
  objc_msgSend_floatValue(v656, v657, v658, v659);
  v662 = objc_msgSend_objectAtIndexedSubscript_(a3, v660, 15, v661);
  objc_msgSend_floatValue(v662, v663, v664, v665);
  objc_msgSend_convertTransform_toNode_(self, v666, (uint64_t)a4, v667, v1883, v1866, v1848, COERCE_DOUBLE(__PAIR64__(v1798, v1820)));
  LODWORD(v669) = v668;
  v1894[5] = objc_msgSend_numberWithFloat_(v561, v670, v671, v672, v669);
  v673 = NSNumber;
  v676 = objc_msgSend_objectAtIndexedSubscript_(a3, v674, 0, v675);
  objc_msgSend_floatValue(v676, v677, v678, v679);
  LODWORD(v1883) = v680;
  v683 = objc_msgSend_objectAtIndexedSubscript_(a3, v681, 1, v682);
  objc_msgSend_floatValue(v683, v684, v685, v686);
  LODWORD(v1866) = v687;
  v690 = objc_msgSend_objectAtIndexedSubscript_(a3, v688, 2, v689);
  objc_msgSend_floatValue(v690, v691, v692, v693);
  v696 = objc_msgSend_objectAtIndexedSubscript_(a3, v694, 3, v695);
  objc_msgSend_floatValue(v696, v697, v698, v699);
  *(void *)&double v1884 = __PAIR64__(LODWORD(v1866), LODWORD(v1883));
  v702 = objc_msgSend_objectAtIndexedSubscript_(a3, v700, 4, v701);
  objc_msgSend_floatValue(v702, v703, v704, v705);
  LODWORD(v1866) = v706;
  v709 = objc_msgSend_objectAtIndexedSubscript_(a3, v707, 5, v708);
  objc_msgSend_floatValue(v709, v710, v711, v712);
  LODWORD(v1848) = v713;
  v716 = objc_msgSend_objectAtIndexedSubscript_(a3, v714, 6, v715);
  objc_msgSend_floatValue(v716, v717, v718, v719);
  v722 = objc_msgSend_objectAtIndexedSubscript_(a3, v720, 7, v721);
  objc_msgSend_floatValue(v722, v723, v724, v725);
  *(void *)&double v1867 = __PAIR64__(LODWORD(v1848), LODWORD(v1866));
  v728 = objc_msgSend_objectAtIndexedSubscript_(a3, v726, 8, v727);
  objc_msgSend_floatValue(v728, v729, v730, v731);
  LODWORD(v1848) = v732;
  v735 = objc_msgSend_objectAtIndexedSubscript_(a3, v733, 9, v734);
  objc_msgSend_floatValue(v735, v736, v737, v738);
  unsigned int v1821 = v739;
  v742 = objc_msgSend_objectAtIndexedSubscript_(a3, v740, 10, v741);
  objc_msgSend_floatValue(v742, v743, v744, v745);
  v748 = objc_msgSend_objectAtIndexedSubscript_(a3, v746, 11, v747);
  objc_msgSend_floatValue(v748, v749, v750, v751);
  *(void *)&double v1849 = __PAIR64__(v1821, LODWORD(v1848));
  v754 = objc_msgSend_objectAtIndexedSubscript_(a3, v752, 12, v753);
  objc_msgSend_floatValue(v754, v755, v756, v757);
  unsigned int v1822 = v758;
  v761 = objc_msgSend_objectAtIndexedSubscript_(a3, v759, 13, v760);
  objc_msgSend_floatValue(v761, v762, v763, v764);
  unsigned int v1799 = v765;
  v768 = objc_msgSend_objectAtIndexedSubscript_(a3, v766, 14, v767);
  objc_msgSend_floatValue(v768, v769, v770, v771);
  v774 = objc_msgSend_objectAtIndexedSubscript_(a3, v772, 15, v773);
  objc_msgSend_floatValue(v774, v775, v776, v777);
  objc_msgSend_convertTransform_toNode_(self, v778, (uint64_t)a4, v779, v1884, v1867, v1849, COERCE_DOUBLE(__PAIR64__(v1799, v1822)));
  LODWORD(v781) = v780;
  v1894[6] = objc_msgSend_numberWithFloat_(v673, v782, v783, v784, v781);
  v785 = NSNumber;
  v788 = objc_msgSend_objectAtIndexedSubscript_(a3, v786, 0, v787);
  objc_msgSend_floatValue(v788, v789, v790, v791);
  LODWORD(v1884) = v792;
  v795 = objc_msgSend_objectAtIndexedSubscript_(a3, v793, 1, v794);
  objc_msgSend_floatValue(v795, v796, v797, v798);
  LODWORD(v1867) = v799;
  v802 = objc_msgSend_objectAtIndexedSubscript_(a3, v800, 2, v801);
  objc_msgSend_floatValue(v802, v803, v804, v805);
  v808 = objc_msgSend_objectAtIndexedSubscript_(a3, v806, 3, v807);
  objc_msgSend_floatValue(v808, v809, v810, v811);
  *(void *)&double v1885 = __PAIR64__(LODWORD(v1867), LODWORD(v1884));
  v814 = objc_msgSend_objectAtIndexedSubscript_(a3, v812, 4, v813);
  objc_msgSend_floatValue(v814, v815, v816, v817);
  LODWORD(v1867) = v818;
  v821 = objc_msgSend_objectAtIndexedSubscript_(a3, v819, 5, v820);
  objc_msgSend_floatValue(v821, v822, v823, v824);
  LODWORD(v1849) = v825;
  v828 = objc_msgSend_objectAtIndexedSubscript_(a3, v826, 6, v827);
  objc_msgSend_floatValue(v828, v829, v830, v831);
  v834 = objc_msgSend_objectAtIndexedSubscript_(a3, v832, 7, v833);
  objc_msgSend_floatValue(v834, v835, v836, v837);
  *(void *)&double v1868 = __PAIR64__(LODWORD(v1849), LODWORD(v1867));
  v840 = objc_msgSend_objectAtIndexedSubscript_(a3, v838, 8, v839);
  objc_msgSend_floatValue(v840, v841, v842, v843);
  LODWORD(v1849) = v844;
  v847 = objc_msgSend_objectAtIndexedSubscript_(a3, v845, 9, v846);
  objc_msgSend_floatValue(v847, v848, v849, v850);
  unsigned int v1823 = v851;
  v854 = objc_msgSend_objectAtIndexedSubscript_(a3, v852, 10, v853);
  objc_msgSend_floatValue(v854, v855, v856, v857);
  v860 = objc_msgSend_objectAtIndexedSubscript_(a3, v858, 11, v859);
  objc_msgSend_floatValue(v860, v861, v862, v863);
  *(void *)&double v1850 = __PAIR64__(v1823, LODWORD(v1849));
  v866 = objc_msgSend_objectAtIndexedSubscript_(a3, v864, 12, v865);
  objc_msgSend_floatValue(v866, v867, v868, v869);
  unsigned int v1824 = v870;
  v873 = objc_msgSend_objectAtIndexedSubscript_(a3, v871, 13, v872);
  objc_msgSend_floatValue(v873, v874, v875, v876);
  unsigned int v1800 = v877;
  v880 = objc_msgSend_objectAtIndexedSubscript_(a3, v878, 14, v879);
  objc_msgSend_floatValue(v880, v881, v882, v883);
  v886 = objc_msgSend_objectAtIndexedSubscript_(a3, v884, 15, v885);
  objc_msgSend_floatValue(v886, v887, v888, v889);
  objc_msgSend_convertTransform_toNode_(self, v890, (uint64_t)a4, v891, v1885, v1868, v1850, COERCE_DOUBLE(__PAIR64__(v1800, v1824)));
  LODWORD(v893) = v892;
  v1894[7] = objc_msgSend_numberWithFloat_(v785, v894, v895, v896, v893);
  v897 = NSNumber;
  v900 = objc_msgSend_objectAtIndexedSubscript_(a3, v898, 0, v899);
  objc_msgSend_floatValue(v900, v901, v902, v903);
  LODWORD(v1885) = v904;
  v907 = objc_msgSend_objectAtIndexedSubscript_(a3, v905, 1, v906);
  objc_msgSend_floatValue(v907, v908, v909, v910);
  LODWORD(v1868) = v911;
  v914 = objc_msgSend_objectAtIndexedSubscript_(a3, v912, 2, v913);
  objc_msgSend_floatValue(v914, v915, v916, v917);
  v920 = objc_msgSend_objectAtIndexedSubscript_(a3, v918, 3, v919);
  objc_msgSend_floatValue(v920, v921, v922, v923);
  *(void *)&double v1886 = __PAIR64__(LODWORD(v1868), LODWORD(v1885));
  v926 = objc_msgSend_objectAtIndexedSubscript_(a3, v924, 4, v925);
  objc_msgSend_floatValue(v926, v927, v928, v929);
  LODWORD(v1868) = v930;
  v933 = objc_msgSend_objectAtIndexedSubscript_(a3, v931, 5, v932);
  objc_msgSend_floatValue(v933, v934, v935, v936);
  LODWORD(v1850) = v937;
  v940 = objc_msgSend_objectAtIndexedSubscript_(a3, v938, 6, v939);
  objc_msgSend_floatValue(v940, v941, v942, v943);
  v946 = objc_msgSend_objectAtIndexedSubscript_(a3, v944, 7, v945);
  objc_msgSend_floatValue(v946, v947, v948, v949);
  *(void *)&double v1869 = __PAIR64__(LODWORD(v1850), LODWORD(v1868));
  v952 = objc_msgSend_objectAtIndexedSubscript_(a3, v950, 8, v951);
  objc_msgSend_floatValue(v952, v953, v954, v955);
  LODWORD(v1850) = v956;
  v959 = objc_msgSend_objectAtIndexedSubscript_(a3, v957, 9, v958);
  objc_msgSend_floatValue(v959, v960, v961, v962);
  unsigned int v1825 = v963;
  v966 = objc_msgSend_objectAtIndexedSubscript_(a3, v964, 10, v965);
  objc_msgSend_floatValue(v966, v967, v968, v969);
  v972 = objc_msgSend_objectAtIndexedSubscript_(a3, v970, 11, v971);
  objc_msgSend_floatValue(v972, v973, v974, v975);
  *(void *)&double v1851 = __PAIR64__(v1825, LODWORD(v1850));
  v978 = objc_msgSend_objectAtIndexedSubscript_(a3, v976, 12, v977);
  objc_msgSend_floatValue(v978, v979, v980, v981);
  unsigned int v1826 = v982;
  v985 = objc_msgSend_objectAtIndexedSubscript_(a3, v983, 13, v984);
  objc_msgSend_floatValue(v985, v986, v987, v988);
  unsigned int v1801 = v989;
  v992 = objc_msgSend_objectAtIndexedSubscript_(a3, v990, 14, v991);
  objc_msgSend_floatValue(v992, v993, v994, v995);
  v998 = objc_msgSend_objectAtIndexedSubscript_(a3, v996, 15, v997);
  objc_msgSend_floatValue(v998, v999, v1000, v1001);
  objc_msgSend_convertTransform_toNode_(self, v1002, (uint64_t)a4, v1003, v1886, v1869, v1851, COERCE_DOUBLE(__PAIR64__(v1801, v1826)));
  v1894[8] = objc_msgSend_numberWithFloat_(v897, v1004, v1005, v1006, v1007);
  v1008 = NSNumber;
  v1011 = objc_msgSend_objectAtIndexedSubscript_(a3, v1009, 0, v1010);
  objc_msgSend_floatValue(v1011, v1012, v1013, v1014);
  LODWORD(v1886) = v1015;
  v1018 = objc_msgSend_objectAtIndexedSubscript_(a3, v1016, 1, v1017);
  objc_msgSend_floatValue(v1018, v1019, v1020, v1021);
  LODWORD(v1869) = v1022;
  v1025 = objc_msgSend_objectAtIndexedSubscript_(a3, v1023, 2, v1024);
  objc_msgSend_floatValue(v1025, v1026, v1027, v1028);
  v1031 = objc_msgSend_objectAtIndexedSubscript_(a3, v1029, 3, v1030);
  objc_msgSend_floatValue(v1031, v1032, v1033, v1034);
  *(void *)&double v1887 = __PAIR64__(LODWORD(v1869), LODWORD(v1886));
  v1037 = objc_msgSend_objectAtIndexedSubscript_(a3, v1035, 4, v1036);
  objc_msgSend_floatValue(v1037, v1038, v1039, v1040);
  LODWORD(v1869) = v1041;
  v1044 = objc_msgSend_objectAtIndexedSubscript_(a3, v1042, 5, v1043);
  objc_msgSend_floatValue(v1044, v1045, v1046, v1047);
  LODWORD(v1851) = v1048;
  v1051 = objc_msgSend_objectAtIndexedSubscript_(a3, v1049, 6, v1050);
  objc_msgSend_floatValue(v1051, v1052, v1053, v1054);
  v1057 = objc_msgSend_objectAtIndexedSubscript_(a3, v1055, 7, v1056);
  objc_msgSend_floatValue(v1057, v1058, v1059, v1060);
  *(void *)&double v1870 = __PAIR64__(LODWORD(v1851), LODWORD(v1869));
  v1063 = objc_msgSend_objectAtIndexedSubscript_(a3, v1061, 8, v1062);
  objc_msgSend_floatValue(v1063, v1064, v1065, v1066);
  LODWORD(v1851) = v1067;
  v1070 = objc_msgSend_objectAtIndexedSubscript_(a3, v1068, 9, v1069);
  objc_msgSend_floatValue(v1070, v1071, v1072, v1073);
  unsigned int v1827 = v1074;
  v1077 = objc_msgSend_objectAtIndexedSubscript_(a3, v1075, 10, v1076);
  objc_msgSend_floatValue(v1077, v1078, v1079, v1080);
  v1083 = objc_msgSend_objectAtIndexedSubscript_(a3, v1081, 11, v1082);
  objc_msgSend_floatValue(v1083, v1084, v1085, v1086);
  *(void *)&double v1852 = __PAIR64__(v1827, LODWORD(v1851));
  v1089 = objc_msgSend_objectAtIndexedSubscript_(a3, v1087, 12, v1088);
  objc_msgSend_floatValue(v1089, v1090, v1091, v1092);
  unsigned int v1828 = v1093;
  v1096 = objc_msgSend_objectAtIndexedSubscript_(a3, v1094, 13, v1095);
  objc_msgSend_floatValue(v1096, v1097, v1098, v1099);
  unsigned int v1802 = v1100;
  v1103 = objc_msgSend_objectAtIndexedSubscript_(a3, v1101, 14, v1102);
  objc_msgSend_floatValue(v1103, v1104, v1105, v1106);
  v1109 = objc_msgSend_objectAtIndexedSubscript_(a3, v1107, 15, v1108);
  objc_msgSend_floatValue(v1109, v1110, v1111, v1112);
  objc_msgSend_convertTransform_toNode_(self, v1113, (uint64_t)a4, v1114, v1887, v1870, v1852, COERCE_DOUBLE(__PAIR64__(v1802, v1828)));
  LODWORD(v1116) = v1115;
  v1894[9] = objc_msgSend_numberWithFloat_(v1008, v1117, v1118, v1119, v1116);
  v1120 = NSNumber;
  v1123 = objc_msgSend_objectAtIndexedSubscript_(a3, v1121, 0, v1122);
  objc_msgSend_floatValue(v1123, v1124, v1125, v1126);
  LODWORD(v1887) = v1127;
  v1130 = objc_msgSend_objectAtIndexedSubscript_(a3, v1128, 1, v1129);
  objc_msgSend_floatValue(v1130, v1131, v1132, v1133);
  LODWORD(v1870) = v1134;
  v1137 = objc_msgSend_objectAtIndexedSubscript_(a3, v1135, 2, v1136);
  objc_msgSend_floatValue(v1137, v1138, v1139, v1140);
  v1143 = objc_msgSend_objectAtIndexedSubscript_(a3, v1141, 3, v1142);
  objc_msgSend_floatValue(v1143, v1144, v1145, v1146);
  *(void *)&double v1888 = __PAIR64__(LODWORD(v1870), LODWORD(v1887));
  v1149 = objc_msgSend_objectAtIndexedSubscript_(a3, v1147, 4, v1148);
  objc_msgSend_floatValue(v1149, v1150, v1151, v1152);
  LODWORD(v1870) = v1153;
  v1156 = objc_msgSend_objectAtIndexedSubscript_(a3, v1154, 5, v1155);
  objc_msgSend_floatValue(v1156, v1157, v1158, v1159);
  LODWORD(v1852) = v1160;
  v1163 = objc_msgSend_objectAtIndexedSubscript_(a3, v1161, 6, v1162);
  objc_msgSend_floatValue(v1163, v1164, v1165, v1166);
  v1169 = objc_msgSend_objectAtIndexedSubscript_(a3, v1167, 7, v1168);
  objc_msgSend_floatValue(v1169, v1170, v1171, v1172);
  *(void *)&double v1871 = __PAIR64__(LODWORD(v1852), LODWORD(v1870));
  v1175 = objc_msgSend_objectAtIndexedSubscript_(a3, v1173, 8, v1174);
  objc_msgSend_floatValue(v1175, v1176, v1177, v1178);
  LODWORD(v1852) = v1179;
  v1182 = objc_msgSend_objectAtIndexedSubscript_(a3, v1180, 9, v1181);
  objc_msgSend_floatValue(v1182, v1183, v1184, v1185);
  unsigned int v1829 = v1186;
  v1189 = objc_msgSend_objectAtIndexedSubscript_(a3, v1187, 10, v1188);
  objc_msgSend_floatValue(v1189, v1190, v1191, v1192);
  v1195 = objc_msgSend_objectAtIndexedSubscript_(a3, v1193, 11, v1194);
  objc_msgSend_floatValue(v1195, v1196, v1197, v1198);
  *(void *)&double v1853 = __PAIR64__(v1829, LODWORD(v1852));
  v1201 = objc_msgSend_objectAtIndexedSubscript_(a3, v1199, 12, v1200);
  objc_msgSend_floatValue(v1201, v1202, v1203, v1204);
  unsigned int v1830 = v1205;
  v1208 = objc_msgSend_objectAtIndexedSubscript_(a3, v1206, 13, v1207);
  objc_msgSend_floatValue(v1208, v1209, v1210, v1211);
  unsigned int v1803 = v1212;
  v1215 = objc_msgSend_objectAtIndexedSubscript_(a3, v1213, 14, v1214);
  objc_msgSend_floatValue(v1215, v1216, v1217, v1218);
  v1221 = objc_msgSend_objectAtIndexedSubscript_(a3, v1219, 15, v1220);
  objc_msgSend_floatValue(v1221, v1222, v1223, v1224);
  objc_msgSend_convertTransform_toNode_(self, v1225, (uint64_t)a4, v1226, v1888, v1871, v1853, COERCE_DOUBLE(__PAIR64__(v1803, v1830)));
  LODWORD(v1228) = v1227;
  v1894[10] = objc_msgSend_numberWithFloat_(v1120, v1229, v1230, v1231, v1228);
  v1232 = NSNumber;
  v1235 = objc_msgSend_objectAtIndexedSubscript_(a3, v1233, 0, v1234);
  objc_msgSend_floatValue(v1235, v1236, v1237, v1238);
  LODWORD(v1888) = v1239;
  v1242 = objc_msgSend_objectAtIndexedSubscript_(a3, v1240, 1, v1241);
  objc_msgSend_floatValue(v1242, v1243, v1244, v1245);
  LODWORD(v1871) = v1246;
  v1249 = objc_msgSend_objectAtIndexedSubscript_(a3, v1247, 2, v1248);
  objc_msgSend_floatValue(v1249, v1250, v1251, v1252);
  v1255 = objc_msgSend_objectAtIndexedSubscript_(a3, v1253, 3, v1254);
  objc_msgSend_floatValue(v1255, v1256, v1257, v1258);
  *(void *)&double v1889 = __PAIR64__(LODWORD(v1871), LODWORD(v1888));
  v1261 = objc_msgSend_objectAtIndexedSubscript_(a3, v1259, 4, v1260);
  objc_msgSend_floatValue(v1261, v1262, v1263, v1264);
  LODWORD(v1871) = v1265;
  v1268 = objc_msgSend_objectAtIndexedSubscript_(a3, v1266, 5, v1267);
  objc_msgSend_floatValue(v1268, v1269, v1270, v1271);
  LODWORD(v1853) = v1272;
  v1275 = objc_msgSend_objectAtIndexedSubscript_(a3, v1273, 6, v1274);
  objc_msgSend_floatValue(v1275, v1276, v1277, v1278);
  v1281 = objc_msgSend_objectAtIndexedSubscript_(a3, v1279, 7, v1280);
  objc_msgSend_floatValue(v1281, v1282, v1283, v1284);
  *(void *)&double v1872 = __PAIR64__(LODWORD(v1853), LODWORD(v1871));
  v1287 = objc_msgSend_objectAtIndexedSubscript_(a3, v1285, 8, v1286);
  objc_msgSend_floatValue(v1287, v1288, v1289, v1290);
  LODWORD(v1853) = v1291;
  v1294 = objc_msgSend_objectAtIndexedSubscript_(a3, v1292, 9, v1293);
  objc_msgSend_floatValue(v1294, v1295, v1296, v1297);
  unsigned int v1831 = v1298;
  v1301 = objc_msgSend_objectAtIndexedSubscript_(a3, v1299, 10, v1300);
  objc_msgSend_floatValue(v1301, v1302, v1303, v1304);
  v1307 = objc_msgSend_objectAtIndexedSubscript_(a3, v1305, 11, v1306);
  objc_msgSend_floatValue(v1307, v1308, v1309, v1310);
  *(void *)&double v1854 = __PAIR64__(v1831, LODWORD(v1853));
  v1313 = objc_msgSend_objectAtIndexedSubscript_(a3, v1311, 12, v1312);
  objc_msgSend_floatValue(v1313, v1314, v1315, v1316);
  unsigned int v1832 = v1317;
  v1320 = objc_msgSend_objectAtIndexedSubscript_(a3, v1318, 13, v1319);
  objc_msgSend_floatValue(v1320, v1321, v1322, v1323);
  unsigned int v1804 = v1324;
  v1327 = objc_msgSend_objectAtIndexedSubscript_(a3, v1325, 14, v1326);
  objc_msgSend_floatValue(v1327, v1328, v1329, v1330);
  v1333 = objc_msgSend_objectAtIndexedSubscript_(a3, v1331, 15, v1332);
  objc_msgSend_floatValue(v1333, v1334, v1335, v1336);
  objc_msgSend_convertTransform_toNode_(self, v1337, (uint64_t)a4, v1338, v1889, v1872, v1854, COERCE_DOUBLE(__PAIR64__(v1804, v1832)));
  LODWORD(v1340) = v1339;
  v1894[11] = objc_msgSend_numberWithFloat_(v1232, v1341, v1342, v1343, v1340);
  v1344 = NSNumber;
  v1347 = objc_msgSend_objectAtIndexedSubscript_(a3, v1345, 0, v1346);
  objc_msgSend_floatValue(v1347, v1348, v1349, v1350);
  LODWORD(v1889) = v1351;
  v1354 = objc_msgSend_objectAtIndexedSubscript_(a3, v1352, 1, v1353);
  objc_msgSend_floatValue(v1354, v1355, v1356, v1357);
  LODWORD(v1872) = v1358;
  v1361 = objc_msgSend_objectAtIndexedSubscript_(a3, v1359, 2, v1360);
  objc_msgSend_floatValue(v1361, v1362, v1363, v1364);
  v1367 = objc_msgSend_objectAtIndexedSubscript_(a3, v1365, 3, v1366);
  objc_msgSend_floatValue(v1367, v1368, v1369, v1370);
  *(void *)&double v1890 = __PAIR64__(LODWORD(v1872), LODWORD(v1889));
  v1373 = objc_msgSend_objectAtIndexedSubscript_(a3, v1371, 4, v1372);
  objc_msgSend_floatValue(v1373, v1374, v1375, v1376);
  LODWORD(v1872) = v1377;
  v1380 = objc_msgSend_objectAtIndexedSubscript_(a3, v1378, 5, v1379);
  objc_msgSend_floatValue(v1380, v1381, v1382, v1383);
  LODWORD(v1854) = v1384;
  v1387 = objc_msgSend_objectAtIndexedSubscript_(a3, v1385, 6, v1386);
  objc_msgSend_floatValue(v1387, v1388, v1389, v1390);
  v1393 = objc_msgSend_objectAtIndexedSubscript_(a3, v1391, 7, v1392);
  objc_msgSend_floatValue(v1393, v1394, v1395, v1396);
  *(void *)&double v1873 = __PAIR64__(LODWORD(v1854), LODWORD(v1872));
  v1399 = objc_msgSend_objectAtIndexedSubscript_(a3, v1397, 8, v1398);
  objc_msgSend_floatValue(v1399, v1400, v1401, v1402);
  LODWORD(v1854) = v1403;
  v1406 = objc_msgSend_objectAtIndexedSubscript_(a3, v1404, 9, v1405);
  objc_msgSend_floatValue(v1406, v1407, v1408, v1409);
  unsigned int v1833 = v1410;
  v1413 = objc_msgSend_objectAtIndexedSubscript_(a3, v1411, 10, v1412);
  objc_msgSend_floatValue(v1413, v1414, v1415, v1416);
  v1419 = objc_msgSend_objectAtIndexedSubscript_(a3, v1417, 11, v1418);
  objc_msgSend_floatValue(v1419, v1420, v1421, v1422);
  *(void *)&double v1855 = __PAIR64__(v1833, LODWORD(v1854));
  v1425 = objc_msgSend_objectAtIndexedSubscript_(a3, v1423, 12, v1424);
  objc_msgSend_floatValue(v1425, v1426, v1427, v1428);
  unsigned int v1834 = v1429;
  v1432 = objc_msgSend_objectAtIndexedSubscript_(a3, v1430, 13, v1431);
  objc_msgSend_floatValue(v1432, v1433, v1434, v1435);
  unsigned int v1805 = v1436;
  v1439 = objc_msgSend_objectAtIndexedSubscript_(a3, v1437, 14, v1438);
  objc_msgSend_floatValue(v1439, v1440, v1441, v1442);
  v1445 = objc_msgSend_objectAtIndexedSubscript_(a3, v1443, 15, v1444);
  objc_msgSend_floatValue(v1445, v1446, v1447, v1448);
  objc_msgSend_convertTransform_toNode_(self, v1449, (uint64_t)a4, v1450, v1890, v1873, v1855, COERCE_DOUBLE(__PAIR64__(v1805, v1834)));
  v1894[12] = objc_msgSend_numberWithFloat_(v1344, v1451, v1452, v1453, v1454);
  v1455 = NSNumber;
  v1458 = objc_msgSend_objectAtIndexedSubscript_(a3, v1456, 0, v1457);
  objc_msgSend_floatValue(v1458, v1459, v1460, v1461);
  LODWORD(v1890) = v1462;
  v1465 = objc_msgSend_objectAtIndexedSubscript_(a3, v1463, 1, v1464);
  objc_msgSend_floatValue(v1465, v1466, v1467, v1468);
  LODWORD(v1873) = v1469;
  v1472 = objc_msgSend_objectAtIndexedSubscript_(a3, v1470, 2, v1471);
  objc_msgSend_floatValue(v1472, v1473, v1474, v1475);
  v1478 = objc_msgSend_objectAtIndexedSubscript_(a3, v1476, 3, v1477);
  objc_msgSend_floatValue(v1478, v1479, v1480, v1481);
  *(void *)&double v1891 = __PAIR64__(LODWORD(v1873), LODWORD(v1890));
  v1484 = objc_msgSend_objectAtIndexedSubscript_(a3, v1482, 4, v1483);
  objc_msgSend_floatValue(v1484, v1485, v1486, v1487);
  LODWORD(v1873) = v1488;
  v1491 = objc_msgSend_objectAtIndexedSubscript_(a3, v1489, 5, v1490);
  objc_msgSend_floatValue(v1491, v1492, v1493, v1494);
  LODWORD(v1855) = v1495;
  v1498 = objc_msgSend_objectAtIndexedSubscript_(a3, v1496, 6, v1497);
  objc_msgSend_floatValue(v1498, v1499, v1500, v1501);
  v1504 = objc_msgSend_objectAtIndexedSubscript_(a3, v1502, 7, v1503);
  objc_msgSend_floatValue(v1504, v1505, v1506, v1507);
  *(void *)&double v1874 = __PAIR64__(LODWORD(v1855), LODWORD(v1873));
  v1510 = objc_msgSend_objectAtIndexedSubscript_(a3, v1508, 8, v1509);
  objc_msgSend_floatValue(v1510, v1511, v1512, v1513);
  LODWORD(v1855) = v1514;
  v1517 = objc_msgSend_objectAtIndexedSubscript_(a3, v1515, 9, v1516);
  objc_msgSend_floatValue(v1517, v1518, v1519, v1520);
  unsigned int v1835 = v1521;
  v1524 = objc_msgSend_objectAtIndexedSubscript_(a3, v1522, 10, v1523);
  objc_msgSend_floatValue(v1524, v1525, v1526, v1527);
  v1530 = objc_msgSend_objectAtIndexedSubscript_(a3, v1528, 11, v1529);
  objc_msgSend_floatValue(v1530, v1531, v1532, v1533);
  *(void *)&double v1856 = __PAIR64__(v1835, LODWORD(v1855));
  v1536 = objc_msgSend_objectAtIndexedSubscript_(a3, v1534, 12, v1535);
  objc_msgSend_floatValue(v1536, v1537, v1538, v1539);
  unsigned int v1836 = v1540;
  v1543 = objc_msgSend_objectAtIndexedSubscript_(a3, v1541, 13, v1542);
  objc_msgSend_floatValue(v1543, v1544, v1545, v1546);
  unsigned int v1806 = v1547;
  v1550 = objc_msgSend_objectAtIndexedSubscript_(a3, v1548, 14, v1549);
  objc_msgSend_floatValue(v1550, v1551, v1552, v1553);
  v1556 = objc_msgSend_objectAtIndexedSubscript_(a3, v1554, 15, v1555);
  objc_msgSend_floatValue(v1556, v1557, v1558, v1559);
  objc_msgSend_convertTransform_toNode_(self, v1560, (uint64_t)a4, v1561, v1891, v1874, v1856, COERCE_DOUBLE(__PAIR64__(v1806, v1836)));
  LODWORD(v1563) = v1562;
  v1894[13] = objc_msgSend_numberWithFloat_(v1455, v1564, v1565, v1566, v1563);
  v1567 = NSNumber;
  v1570 = objc_msgSend_objectAtIndexedSubscript_(a3, v1568, 0, v1569);
  objc_msgSend_floatValue(v1570, v1571, v1572, v1573);
  LODWORD(v1891) = v1574;
  v1577 = objc_msgSend_objectAtIndexedSubscript_(a3, v1575, 1, v1576);
  objc_msgSend_floatValue(v1577, v1578, v1579, v1580);
  LODWORD(v1874) = v1581;
  v1584 = objc_msgSend_objectAtIndexedSubscript_(a3, v1582, 2, v1583);
  objc_msgSend_floatValue(v1584, v1585, v1586, v1587);
  v1590 = objc_msgSend_objectAtIndexedSubscript_(a3, v1588, 3, v1589);
  objc_msgSend_floatValue(v1590, v1591, v1592, v1593);
  *(void *)&double v1892 = __PAIR64__(LODWORD(v1874), LODWORD(v1891));
  v1596 = objc_msgSend_objectAtIndexedSubscript_(a3, v1594, 4, v1595);
  objc_msgSend_floatValue(v1596, v1597, v1598, v1599);
  LODWORD(v1874) = v1600;
  v1603 = objc_msgSend_objectAtIndexedSubscript_(a3, v1601, 5, v1602);
  objc_msgSend_floatValue(v1603, v1604, v1605, v1606);
  LODWORD(v1856) = v1607;
  v1610 = objc_msgSend_objectAtIndexedSubscript_(a3, v1608, 6, v1609);
  objc_msgSend_floatValue(v1610, v1611, v1612, v1613);
  v1616 = objc_msgSend_objectAtIndexedSubscript_(a3, v1614, 7, v1615);
  objc_msgSend_floatValue(v1616, v1617, v1618, v1619);
  *(void *)&double v1875 = __PAIR64__(LODWORD(v1856), LODWORD(v1874));
  v1622 = objc_msgSend_objectAtIndexedSubscript_(a3, v1620, 8, v1621);
  objc_msgSend_floatValue(v1622, v1623, v1624, v1625);
  LODWORD(v1856) = v1626;
  v1629 = objc_msgSend_objectAtIndexedSubscript_(a3, v1627, 9, v1628);
  objc_msgSend_floatValue(v1629, v1630, v1631, v1632);
  unsigned int v1837 = v1633;
  v1636 = objc_msgSend_objectAtIndexedSubscript_(a3, v1634, 10, v1635);
  objc_msgSend_floatValue(v1636, v1637, v1638, v1639);
  v1642 = objc_msgSend_objectAtIndexedSubscript_(a3, v1640, 11, v1641);
  objc_msgSend_floatValue(v1642, v1643, v1644, v1645);
  *(void *)&double v1857 = __PAIR64__(v1837, LODWORD(v1856));
  v1648 = objc_msgSend_objectAtIndexedSubscript_(a3, v1646, 12, v1647);
  objc_msgSend_floatValue(v1648, v1649, v1650, v1651);
  unsigned int v1838 = v1652;
  v1655 = objc_msgSend_objectAtIndexedSubscript_(a3, v1653, 13, v1654);
  objc_msgSend_floatValue(v1655, v1656, v1657, v1658);
  unsigned int v1807 = v1659;
  v1662 = objc_msgSend_objectAtIndexedSubscript_(a3, v1660, 14, v1661);
  objc_msgSend_floatValue(v1662, v1663, v1664, v1665);
  v1668 = objc_msgSend_objectAtIndexedSubscript_(a3, v1666, 15, v1667);
  objc_msgSend_floatValue(v1668, v1669, v1670, v1671);
  objc_msgSend_convertTransform_toNode_(self, v1672, (uint64_t)a4, v1673, v1892, v1875, v1857, COERCE_DOUBLE(__PAIR64__(v1807, v1838)));
  LODWORD(v1675) = v1674;
  v1894[14] = objc_msgSend_numberWithFloat_(v1567, v1676, v1677, v1678, v1675);
  v1679 = NSNumber;
  v1682 = objc_msgSend_objectAtIndexedSubscript_(a3, v1680, 0, v1681);
  objc_msgSend_floatValue(v1682, v1683, v1684, v1685);
  LODWORD(v1892) = v1686;
  v1689 = objc_msgSend_objectAtIndexedSubscript_(a3, v1687, 1, v1688);
  objc_msgSend_floatValue(v1689, v1690, v1691, v1692);
  LODWORD(v1875) = v1693;
  v1696 = objc_msgSend_objectAtIndexedSubscript_(a3, v1694, 2, v1695);
  objc_msgSend_floatValue(v1696, v1697, v1698, v1699);
  v1702 = objc_msgSend_objectAtIndexedSubscript_(a3, v1700, 3, v1701);
  objc_msgSend_floatValue(v1702, v1703, v1704, v1705);
  double v1893 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1875), LODWORD(v1892)));
  v1708 = objc_msgSend_objectAtIndexedSubscript_(a3, v1706, 4, v1707);
  objc_msgSend_floatValue(v1708, v1709, v1710, v1711);
  LODWORD(v1875) = v1712;
  v1715 = objc_msgSend_objectAtIndexedSubscript_(a3, v1713, 5, v1714);
  objc_msgSend_floatValue(v1715, v1716, v1717, v1718);
  LODWORD(v1857) = v1719;
  v1722 = objc_msgSend_objectAtIndexedSubscript_(a3, v1720, 6, v1721);
  objc_msgSend_floatValue(v1722, v1723, v1724, v1725);
  v1728 = objc_msgSend_objectAtIndexedSubscript_(a3, v1726, 7, v1727);
  objc_msgSend_floatValue(v1728, v1729, v1730, v1731);
  double v1876 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1857), LODWORD(v1875)));
  v1734 = objc_msgSend_objectAtIndexedSubscript_(a3, v1732, 8, v1733);
  objc_msgSend_floatValue(v1734, v1735, v1736, v1737);
  LODWORD(v1857) = v1738;
  v1741 = objc_msgSend_objectAtIndexedSubscript_(a3, v1739, 9, v1740);
  objc_msgSend_floatValue(v1741, v1742, v1743, v1744);
  unsigned int v1839 = v1745;
  v1748 = objc_msgSend_objectAtIndexedSubscript_(a3, v1746, 10, v1747);
  objc_msgSend_floatValue(v1748, v1749, v1750, v1751);
  v1754 = objc_msgSend_objectAtIndexedSubscript_(a3, v1752, 11, v1753);
  objc_msgSend_floatValue(v1754, v1755, v1756, v1757);
  double v1858 = COERCE_DOUBLE(__PAIR64__(v1839, LODWORD(v1857)));
  v1760 = objc_msgSend_objectAtIndexedSubscript_(a3, v1758, 12, v1759);
  objc_msgSend_floatValue(v1760, v1761, v1762, v1763);
  unsigned int v1840 = v1764;
  v1767 = objc_msgSend_objectAtIndexedSubscript_(a3, v1765, 13, v1766);
  objc_msgSend_floatValue(v1767, v1768, v1769, v1770);
  unsigned int v1808 = v1771;
  v1774 = objc_msgSend_objectAtIndexedSubscript_(a3, v1772, 14, v1773);
  objc_msgSend_floatValue(v1774, v1775, v1776, v1777);
  v1780 = objc_msgSend_objectAtIndexedSubscript_(a3, v1778, 15, v1779);
  objc_msgSend_floatValue(v1780, v1781, v1782, v1783);
  objc_msgSend_convertTransform_toNode_(self, v1784, (uint64_t)a4, v1785, v1893, v1876, v1858, COERCE_DOUBLE(__PAIR64__(v1808, v1840)));
  LODWORD(v1787) = v1786;
  v1894[15] = objc_msgSend_numberWithFloat_(v1679, v1788, v1789, v1790, v1787);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1791, (uint64_t)v1894, 16);
}

- (id)convertTransformValue:(id)a3 fromNode:(id)a4
{
  v1894[16] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  unsigned int v1877 = v12;
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  unsigned int v1859 = v19;
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(a3, v26, 3, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  *(void *)&double v1878 = __PAIR64__(v1859, v1877);
  uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(a3, v32, 4, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  unsigned int v1860 = v38;
  uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 5, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  unsigned int v1841 = v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(a3, v46, 6, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  double v54 = objc_msgSend_objectAtIndexedSubscript_(a3, v52, 7, v53);
  objc_msgSend_floatValue(v54, v55, v56, v57);
  *(void *)&double v1861 = __PAIR64__(v1841, v1860);
  uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(a3, v58, 8, v59);
  objc_msgSend_floatValue(v60, v61, v62, v63);
  unsigned int v1842 = v64;
  uint64_t v67 = objc_msgSend_objectAtIndexedSubscript_(a3, v65, 9, v66);
  objc_msgSend_floatValue(v67, v68, v69, v70);
  unsigned int v1809 = v71;
  uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_(a3, v72, 10, v73);
  objc_msgSend_floatValue(v74, v75, v76, v77);
  uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(a3, v78, 11, v79);
  objc_msgSend_floatValue(v80, v81, v82, v83);
  *(void *)&double v1843 = __PAIR64__(v1809, v1842);
  uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(a3, v84, 12, v85);
  objc_msgSend_floatValue(v86, v87, v88, v89);
  unsigned int v1810 = v90;
  unsigned int v93 = objc_msgSend_objectAtIndexedSubscript_(a3, v91, 13, v92);
  objc_msgSend_floatValue(v93, v94, v95, v96);
  unsigned int v1793 = v97;
  uint64_t v100 = objc_msgSend_objectAtIndexedSubscript_(a3, v98, 14, v99);
  objc_msgSend_floatValue(v100, v101, v102, v103);
  uint64_t v106 = objc_msgSend_objectAtIndexedSubscript_(a3, v104, 15, v105);
  objc_msgSend_floatValue(v106, v107, v108, v109);
  objc_msgSend_convertTransform_fromNode_(self, v110, (uint64_t)a4, v111, v1878, v1861, v1843, COERCE_DOUBLE(__PAIR64__(v1793, v1810)));
  v1894[0] = objc_msgSend_numberWithFloat_(v7, v112, v113, v114);
  unsigned int v115 = NSNumber;
  unsigned int v118 = objc_msgSend_objectAtIndexedSubscript_(a3, v116, 0, v117);
  objc_msgSend_floatValue(v118, v119, v120, v121);
  LODWORD(v1878) = v122;
  uint64_t v125 = objc_msgSend_objectAtIndexedSubscript_(a3, v123, 1, v124);
  objc_msgSend_floatValue(v125, v126, v127, v128);
  LODWORD(v1861) = v129;
  uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(a3, v130, 2, v131);
  objc_msgSend_floatValue(v132, v133, v134, v135);
  uint64_t v138 = objc_msgSend_objectAtIndexedSubscript_(a3, v136, 3, v137);
  objc_msgSend_floatValue(v138, v139, v140, v141);
  *(void *)&double v1879 = __PAIR64__(LODWORD(v1861), LODWORD(v1878));
  uint64_t v144 = objc_msgSend_objectAtIndexedSubscript_(a3, v142, 4, v143);
  objc_msgSend_floatValue(v144, v145, v146, v147);
  LODWORD(v1861) = v148;
  uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(a3, v149, 5, v150);
  objc_msgSend_floatValue(v151, v152, v153, v154);
  LODWORD(v1843) = v155;
  long long v158 = objc_msgSend_objectAtIndexedSubscript_(a3, v156, 6, v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  v164 = objc_msgSend_objectAtIndexedSubscript_(a3, v162, 7, v163);
  objc_msgSend_floatValue(v164, v165, v166, v167);
  *(void *)&double v1862 = __PAIR64__(LODWORD(v1843), LODWORD(v1861));
  uint64_t v170 = objc_msgSend_objectAtIndexedSubscript_(a3, v168, 8, v169);
  objc_msgSend_floatValue(v170, v171, v172, v173);
  LODWORD(v1843) = v174;
  uint64_t v177 = objc_msgSend_objectAtIndexedSubscript_(a3, v175, 9, v176);
  objc_msgSend_floatValue(v177, v178, v179, v180);
  unsigned int v1811 = v181;
  long long v184 = objc_msgSend_objectAtIndexedSubscript_(a3, v182, 10, v183);
  objc_msgSend_floatValue(v184, v185, v186, v187);
  v190 = objc_msgSend_objectAtIndexedSubscript_(a3, v188, 11, v189);
  objc_msgSend_floatValue(v190, v191, v192, v193);
  *(void *)&double v1844 = __PAIR64__(v1811, LODWORD(v1843));
  uint64_t v196 = objc_msgSend_objectAtIndexedSubscript_(a3, v194, 12, v195);
  objc_msgSend_floatValue(v196, v197, v198, v199);
  unsigned int v1812 = v200;
  v203 = objc_msgSend_objectAtIndexedSubscript_(a3, v201, 13, v202);
  objc_msgSend_floatValue(v203, v204, v205, v206);
  unsigned int v1794 = v207;
  v210 = objc_msgSend_objectAtIndexedSubscript_(a3, v208, 14, v209);
  objc_msgSend_floatValue(v210, v211, v212, v213);
  v216 = objc_msgSend_objectAtIndexedSubscript_(a3, v214, 15, v215);
  objc_msgSend_floatValue(v216, v217, v218, v219);
  objc_msgSend_convertTransform_fromNode_(self, v220, (uint64_t)a4, v221, v1879, v1862, v1844, COERCE_DOUBLE(__PAIR64__(v1794, v1812)));
  LODWORD(v222) = HIDWORD(v222);
  v1894[1] = objc_msgSend_numberWithFloat_(v115, v223, v224, v225, v222);
  uint64_t v226 = NSNumber;
  v229 = objc_msgSend_objectAtIndexedSubscript_(a3, v227, 0, v228);
  objc_msgSend_floatValue(v229, v230, v231, v232);
  LODWORD(v1879) = v233;
  v236 = objc_msgSend_objectAtIndexedSubscript_(a3, v234, 1, v235);
  objc_msgSend_floatValue(v236, v237, v238, v239);
  LODWORD(v1862) = v240;
  v243 = objc_msgSend_objectAtIndexedSubscript_(a3, v241, 2, v242);
  objc_msgSend_floatValue(v243, v244, v245, v246);
  v249 = objc_msgSend_objectAtIndexedSubscript_(a3, v247, 3, v248);
  objc_msgSend_floatValue(v249, v250, v251, v252);
  *(void *)&double v1880 = __PAIR64__(LODWORD(v1862), LODWORD(v1879));
  uint64_t v255 = objc_msgSend_objectAtIndexedSubscript_(a3, v253, 4, v254);
  objc_msgSend_floatValue(v255, v256, v257, v258);
  LODWORD(v1862) = v259;
  uint64_t v262 = objc_msgSend_objectAtIndexedSubscript_(a3, v260, 5, v261);
  objc_msgSend_floatValue(v262, v263, v264, v265);
  LODWORD(v1844) = v266;
  v269 = objc_msgSend_objectAtIndexedSubscript_(a3, v267, 6, v268);
  objc_msgSend_floatValue(v269, v270, v271, v272);
  uint64_t v275 = objc_msgSend_objectAtIndexedSubscript_(a3, v273, 7, v274);
  objc_msgSend_floatValue(v275, v276, v277, v278);
  *(void *)&double v1863 = __PAIR64__(LODWORD(v1844), LODWORD(v1862));
  v281 = objc_msgSend_objectAtIndexedSubscript_(a3, v279, 8, v280);
  objc_msgSend_floatValue(v281, v282, v283, v284);
  LODWORD(v1844) = v285;
  v288 = objc_msgSend_objectAtIndexedSubscript_(a3, v286, 9, v287);
  objc_msgSend_floatValue(v288, v289, v290, v291);
  unsigned int v1813 = v292;
  uint64_t v295 = objc_msgSend_objectAtIndexedSubscript_(a3, v293, 10, v294);
  objc_msgSend_floatValue(v295, v296, v297, v298);
  uint64_t v301 = objc_msgSend_objectAtIndexedSubscript_(a3, v299, 11, v300);
  objc_msgSend_floatValue(v301, v302, v303, v304);
  *(void *)&double v1845 = __PAIR64__(v1813, LODWORD(v1844));
  v307 = objc_msgSend_objectAtIndexedSubscript_(a3, v305, 12, v306);
  objc_msgSend_floatValue(v307, v308, v309, v310);
  unsigned int v1814 = v311;
  v314 = objc_msgSend_objectAtIndexedSubscript_(a3, v312, 13, v313);
  objc_msgSend_floatValue(v314, v315, v316, v317);
  unsigned int v1795 = v318;
  v321 = objc_msgSend_objectAtIndexedSubscript_(a3, v319, 14, v320);
  objc_msgSend_floatValue(v321, v322, v323, v324);
  v327 = objc_msgSend_objectAtIndexedSubscript_(a3, v325, 15, v326);
  objc_msgSend_floatValue(v327, v328, v329, v330);
  objc_msgSend_convertTransform_fromNode_(self, v331, (uint64_t)a4, v332, v1880, v1863, v1845, COERCE_DOUBLE(__PAIR64__(v1795, v1814)));
  LODWORD(v334) = v333;
  v1894[2] = objc_msgSend_numberWithFloat_(v226, v335, v336, v337, v334);
  v338 = NSNumber;
  id v341 = objc_msgSend_objectAtIndexedSubscript_(a3, v339, 0, v340);
  objc_msgSend_floatValue(v341, v342, v343, v344);
  LODWORD(v1880) = v345;
  v348 = objc_msgSend_objectAtIndexedSubscript_(a3, v346, 1, v347);
  objc_msgSend_floatValue(v348, v349, v350, v351);
  LODWORD(v1863) = v352;
  uint64_t v355 = objc_msgSend_objectAtIndexedSubscript_(a3, v353, 2, v354);
  objc_msgSend_floatValue(v355, v356, v357, v358);
  id v361 = objc_msgSend_objectAtIndexedSubscript_(a3, v359, 3, v360);
  objc_msgSend_floatValue(v361, v362, v363, v364);
  *(void *)&double v1881 = __PAIR64__(LODWORD(v1863), LODWORD(v1880));
  uint64_t v367 = objc_msgSend_objectAtIndexedSubscript_(a3, v365, 4, v366);
  objc_msgSend_floatValue(v367, v368, v369, v370);
  LODWORD(v1863) = v371;
  long long v374 = objc_msgSend_objectAtIndexedSubscript_(a3, v372, 5, v373);
  objc_msgSend_floatValue(v374, v375, v376, v377);
  LODWORD(v1845) = v378;
  v381 = objc_msgSend_objectAtIndexedSubscript_(a3, v379, 6, v380);
  objc_msgSend_floatValue(v381, v382, v383, v384);
  v387 = objc_msgSend_objectAtIndexedSubscript_(a3, v385, 7, v386);
  objc_msgSend_floatValue(v387, v388, v389, v390);
  *(void *)&double v1864 = __PAIR64__(LODWORD(v1845), LODWORD(v1863));
  v393 = objc_msgSend_objectAtIndexedSubscript_(a3, v391, 8, v392);
  objc_msgSend_floatValue(v393, v394, v395, v396);
  LODWORD(v1845) = v397;
  v400 = objc_msgSend_objectAtIndexedSubscript_(a3, v398, 9, v399);
  objc_msgSend_floatValue(v400, v401, v402, v403);
  unsigned int v1815 = v404;
  v407 = objc_msgSend_objectAtIndexedSubscript_(a3, v405, 10, v406);
  objc_msgSend_floatValue(v407, v408, v409, v410);
  v413 = objc_msgSend_objectAtIndexedSubscript_(a3, v411, 11, v412);
  objc_msgSend_floatValue(v413, v414, v415, v416);
  *(void *)&double v1846 = __PAIR64__(v1815, LODWORD(v1845));
  v419 = objc_msgSend_objectAtIndexedSubscript_(a3, v417, 12, v418);
  objc_msgSend_floatValue(v419, v420, v421, v422);
  unsigned int v1816 = v423;
  v426 = objc_msgSend_objectAtIndexedSubscript_(a3, v424, 13, v425);
  objc_msgSend_floatValue(v426, v427, v428, v429);
  unsigned int v1796 = v430;
  v433 = objc_msgSend_objectAtIndexedSubscript_(a3, v431, 14, v432);
  objc_msgSend_floatValue(v433, v434, v435, v436);
  v439 = objc_msgSend_objectAtIndexedSubscript_(a3, v437, 15, v438);
  objc_msgSend_floatValue(v439, v440, v441, v442);
  objc_msgSend_convertTransform_fromNode_(self, v443, (uint64_t)a4, v444, v1881, v1864, v1846, COERCE_DOUBLE(__PAIR64__(v1796, v1816)));
  LODWORD(v446) = v445;
  v1894[3] = objc_msgSend_numberWithFloat_(v338, v447, v448, v449, v446);
  v450 = NSNumber;
  v453 = objc_msgSend_objectAtIndexedSubscript_(a3, v451, 0, v452);
  objc_msgSend_floatValue(v453, v454, v455, v456);
  LODWORD(v1881) = v457;
  v460 = objc_msgSend_objectAtIndexedSubscript_(a3, v458, 1, v459);
  objc_msgSend_floatValue(v460, v461, v462, v463);
  LODWORD(v1864) = v464;
  v467 = objc_msgSend_objectAtIndexedSubscript_(a3, v465, 2, v466);
  objc_msgSend_floatValue(v467, v468, v469, v470);
  v473 = objc_msgSend_objectAtIndexedSubscript_(a3, v471, 3, v472);
  objc_msgSend_floatValue(v473, v474, v475, v476);
  *(void *)&double v1882 = __PAIR64__(LODWORD(v1864), LODWORD(v1881));
  v479 = objc_msgSend_objectAtIndexedSubscript_(a3, v477, 4, v478);
  objc_msgSend_floatValue(v479, v480, v481, v482);
  LODWORD(v1864) = v483;
  v486 = objc_msgSend_objectAtIndexedSubscript_(a3, v484, 5, v485);
  objc_msgSend_floatValue(v486, v487, v488, v489);
  LODWORD(v1846) = v490;
  v493 = objc_msgSend_objectAtIndexedSubscript_(a3, v491, 6, v492);
  objc_msgSend_floatValue(v493, v494, v495, v496);
  v499 = objc_msgSend_objectAtIndexedSubscript_(a3, v497, 7, v498);
  objc_msgSend_floatValue(v499, v500, v501, v502);
  *(void *)&double v1865 = __PAIR64__(LODWORD(v1846), LODWORD(v1864));
  v505 = objc_msgSend_objectAtIndexedSubscript_(a3, v503, 8, v504);
  objc_msgSend_floatValue(v505, v506, v507, v508);
  LODWORD(v1846) = v509;
  v512 = objc_msgSend_objectAtIndexedSubscript_(a3, v510, 9, v511);
  objc_msgSend_floatValue(v512, v513, v514, v515);
  unsigned int v1817 = v516;
  v519 = objc_msgSend_objectAtIndexedSubscript_(a3, v517, 10, v518);
  objc_msgSend_floatValue(v519, v520, v521, v522);
  v525 = objc_msgSend_objectAtIndexedSubscript_(a3, v523, 11, v524);
  objc_msgSend_floatValue(v525, v526, v527, v528);
  *(void *)&double v1847 = __PAIR64__(v1817, LODWORD(v1846));
  v531 = objc_msgSend_objectAtIndexedSubscript_(a3, v529, 12, v530);
  objc_msgSend_floatValue(v531, v532, v533, v534);
  unsigned int v1818 = v535;
  v538 = objc_msgSend_objectAtIndexedSubscript_(a3, v536, 13, v537);
  objc_msgSend_floatValue(v538, v539, v540, v541);
  unsigned int v1797 = v542;
  v545 = objc_msgSend_objectAtIndexedSubscript_(a3, v543, 14, v544);
  objc_msgSend_floatValue(v545, v546, v547, v548);
  v551 = objc_msgSend_objectAtIndexedSubscript_(a3, v549, 15, v550);
  objc_msgSend_floatValue(v551, v552, v553, v554);
  objc_msgSend_convertTransform_fromNode_(self, v555, (uint64_t)a4, v556, v1882, v1865, v1847, COERCE_DOUBLE(__PAIR64__(v1797, v1818)));
  v1894[4] = objc_msgSend_numberWithFloat_(v450, v557, v558, v559, v560);
  v561 = NSNumber;
  v564 = objc_msgSend_objectAtIndexedSubscript_(a3, v562, 0, v563);
  objc_msgSend_floatValue(v564, v565, v566, v567);
  LODWORD(v1882) = v568;
  v571 = objc_msgSend_objectAtIndexedSubscript_(a3, v569, 1, v570);
  objc_msgSend_floatValue(v571, v572, v573, v574);
  LODWORD(v1865) = v575;
  v578 = objc_msgSend_objectAtIndexedSubscript_(a3, v576, 2, v577);
  objc_msgSend_floatValue(v578, v579, v580, v581);
  v584 = objc_msgSend_objectAtIndexedSubscript_(a3, v582, 3, v583);
  objc_msgSend_floatValue(v584, v585, v586, v587);
  *(void *)&double v1883 = __PAIR64__(LODWORD(v1865), LODWORD(v1882));
  v590 = objc_msgSend_objectAtIndexedSubscript_(a3, v588, 4, v589);
  objc_msgSend_floatValue(v590, v591, v592, v593);
  LODWORD(v1865) = v594;
  v597 = objc_msgSend_objectAtIndexedSubscript_(a3, v595, 5, v596);
  objc_msgSend_floatValue(v597, v598, v599, v600);
  LODWORD(v1847) = v601;
  v604 = objc_msgSend_objectAtIndexedSubscript_(a3, v602, 6, v603);
  objc_msgSend_floatValue(v604, v605, v606, v607);
  v610 = objc_msgSend_objectAtIndexedSubscript_(a3, v608, 7, v609);
  objc_msgSend_floatValue(v610, v611, v612, v613);
  *(void *)&double v1866 = __PAIR64__(LODWORD(v1847), LODWORD(v1865));
  v616 = objc_msgSend_objectAtIndexedSubscript_(a3, v614, 8, v615);
  objc_msgSend_floatValue(v616, v617, v618, v619);
  LODWORD(v1847) = v620;
  v623 = objc_msgSend_objectAtIndexedSubscript_(a3, v621, 9, v622);
  objc_msgSend_floatValue(v623, v624, v625, v626);
  unsigned int v1819 = v627;
  v630 = objc_msgSend_objectAtIndexedSubscript_(a3, v628, 10, v629);
  objc_msgSend_floatValue(v630, v631, v632, v633);
  v636 = objc_msgSend_objectAtIndexedSubscript_(a3, v634, 11, v635);
  objc_msgSend_floatValue(v636, v637, v638, v639);
  *(void *)&double v1848 = __PAIR64__(v1819, LODWORD(v1847));
  v642 = objc_msgSend_objectAtIndexedSubscript_(a3, v640, 12, v641);
  objc_msgSend_floatValue(v642, v643, v644, v645);
  unsigned int v1820 = v646;
  v649 = objc_msgSend_objectAtIndexedSubscript_(a3, v647, 13, v648);
  objc_msgSend_floatValue(v649, v650, v651, v652);
  unsigned int v1798 = v653;
  v656 = objc_msgSend_objectAtIndexedSubscript_(a3, v654, 14, v655);
  objc_msgSend_floatValue(v656, v657, v658, v659);
  v662 = objc_msgSend_objectAtIndexedSubscript_(a3, v660, 15, v661);
  objc_msgSend_floatValue(v662, v663, v664, v665);
  objc_msgSend_convertTransform_fromNode_(self, v666, (uint64_t)a4, v667, v1883, v1866, v1848, COERCE_DOUBLE(__PAIR64__(v1798, v1820)));
  LODWORD(v669) = v668;
  v1894[5] = objc_msgSend_numberWithFloat_(v561, v670, v671, v672, v669);
  v673 = NSNumber;
  v676 = objc_msgSend_objectAtIndexedSubscript_(a3, v674, 0, v675);
  objc_msgSend_floatValue(v676, v677, v678, v679);
  LODWORD(v1883) = v680;
  v683 = objc_msgSend_objectAtIndexedSubscript_(a3, v681, 1, v682);
  objc_msgSend_floatValue(v683, v684, v685, v686);
  LODWORD(v1866) = v687;
  v690 = objc_msgSend_objectAtIndexedSubscript_(a3, v688, 2, v689);
  objc_msgSend_floatValue(v690, v691, v692, v693);
  v696 = objc_msgSend_objectAtIndexedSubscript_(a3, v694, 3, v695);
  objc_msgSend_floatValue(v696, v697, v698, v699);
  *(void *)&double v1884 = __PAIR64__(LODWORD(v1866), LODWORD(v1883));
  v702 = objc_msgSend_objectAtIndexedSubscript_(a3, v700, 4, v701);
  objc_msgSend_floatValue(v702, v703, v704, v705);
  LODWORD(v1866) = v706;
  v709 = objc_msgSend_objectAtIndexedSubscript_(a3, v707, 5, v708);
  objc_msgSend_floatValue(v709, v710, v711, v712);
  LODWORD(v1848) = v713;
  v716 = objc_msgSend_objectAtIndexedSubscript_(a3, v714, 6, v715);
  objc_msgSend_floatValue(v716, v717, v718, v719);
  v722 = objc_msgSend_objectAtIndexedSubscript_(a3, v720, 7, v721);
  objc_msgSend_floatValue(v722, v723, v724, v725);
  *(void *)&double v1867 = __PAIR64__(LODWORD(v1848), LODWORD(v1866));
  v728 = objc_msgSend_objectAtIndexedSubscript_(a3, v726, 8, v727);
  objc_msgSend_floatValue(v728, v729, v730, v731);
  LODWORD(v1848) = v732;
  v735 = objc_msgSend_objectAtIndexedSubscript_(a3, v733, 9, v734);
  objc_msgSend_floatValue(v735, v736, v737, v738);
  unsigned int v1821 = v739;
  v742 = objc_msgSend_objectAtIndexedSubscript_(a3, v740, 10, v741);
  objc_msgSend_floatValue(v742, v743, v744, v745);
  v748 = objc_msgSend_objectAtIndexedSubscript_(a3, v746, 11, v747);
  objc_msgSend_floatValue(v748, v749, v750, v751);
  *(void *)&double v1849 = __PAIR64__(v1821, LODWORD(v1848));
  v754 = objc_msgSend_objectAtIndexedSubscript_(a3, v752, 12, v753);
  objc_msgSend_floatValue(v754, v755, v756, v757);
  unsigned int v1822 = v758;
  v761 = objc_msgSend_objectAtIndexedSubscript_(a3, v759, 13, v760);
  objc_msgSend_floatValue(v761, v762, v763, v764);
  unsigned int v1799 = v765;
  v768 = objc_msgSend_objectAtIndexedSubscript_(a3, v766, 14, v767);
  objc_msgSend_floatValue(v768, v769, v770, v771);
  v774 = objc_msgSend_objectAtIndexedSubscript_(a3, v772, 15, v773);
  objc_msgSend_floatValue(v774, v775, v776, v777);
  objc_msgSend_convertTransform_fromNode_(self, v778, (uint64_t)a4, v779, v1884, v1867, v1849, COERCE_DOUBLE(__PAIR64__(v1799, v1822)));
  LODWORD(v781) = v780;
  v1894[6] = objc_msgSend_numberWithFloat_(v673, v782, v783, v784, v781);
  v785 = NSNumber;
  v788 = objc_msgSend_objectAtIndexedSubscript_(a3, v786, 0, v787);
  objc_msgSend_floatValue(v788, v789, v790, v791);
  LODWORD(v1884) = v792;
  v795 = objc_msgSend_objectAtIndexedSubscript_(a3, v793, 1, v794);
  objc_msgSend_floatValue(v795, v796, v797, v798);
  LODWORD(v1867) = v799;
  v802 = objc_msgSend_objectAtIndexedSubscript_(a3, v800, 2, v801);
  objc_msgSend_floatValue(v802, v803, v804, v805);
  v808 = objc_msgSend_objectAtIndexedSubscript_(a3, v806, 3, v807);
  objc_msgSend_floatValue(v808, v809, v810, v811);
  *(void *)&double v1885 = __PAIR64__(LODWORD(v1867), LODWORD(v1884));
  v814 = objc_msgSend_objectAtIndexedSubscript_(a3, v812, 4, v813);
  objc_msgSend_floatValue(v814, v815, v816, v817);
  LODWORD(v1867) = v818;
  v821 = objc_msgSend_objectAtIndexedSubscript_(a3, v819, 5, v820);
  objc_msgSend_floatValue(v821, v822, v823, v824);
  LODWORD(v1849) = v825;
  v828 = objc_msgSend_objectAtIndexedSubscript_(a3, v826, 6, v827);
  objc_msgSend_floatValue(v828, v829, v830, v831);
  v834 = objc_msgSend_objectAtIndexedSubscript_(a3, v832, 7, v833);
  objc_msgSend_floatValue(v834, v835, v836, v837);
  *(void *)&double v1868 = __PAIR64__(LODWORD(v1849), LODWORD(v1867));
  v840 = objc_msgSend_objectAtIndexedSubscript_(a3, v838, 8, v839);
  objc_msgSend_floatValue(v840, v841, v842, v843);
  LODWORD(v1849) = v844;
  v847 = objc_msgSend_objectAtIndexedSubscript_(a3, v845, 9, v846);
  objc_msgSend_floatValue(v847, v848, v849, v850);
  unsigned int v1823 = v851;
  v854 = objc_msgSend_objectAtIndexedSubscript_(a3, v852, 10, v853);
  objc_msgSend_floatValue(v854, v855, v856, v857);
  v860 = objc_msgSend_objectAtIndexedSubscript_(a3, v858, 11, v859);
  objc_msgSend_floatValue(v860, v861, v862, v863);
  *(void *)&double v1850 = __PAIR64__(v1823, LODWORD(v1849));
  v866 = objc_msgSend_objectAtIndexedSubscript_(a3, v864, 12, v865);
  objc_msgSend_floatValue(v866, v867, v868, v869);
  unsigned int v1824 = v870;
  v873 = objc_msgSend_objectAtIndexedSubscript_(a3, v871, 13, v872);
  objc_msgSend_floatValue(v873, v874, v875, v876);
  unsigned int v1800 = v877;
  v880 = objc_msgSend_objectAtIndexedSubscript_(a3, v878, 14, v879);
  objc_msgSend_floatValue(v880, v881, v882, v883);
  v886 = objc_msgSend_objectAtIndexedSubscript_(a3, v884, 15, v885);
  objc_msgSend_floatValue(v886, v887, v888, v889);
  objc_msgSend_convertTransform_fromNode_(self, v890, (uint64_t)a4, v891, v1885, v1868, v1850, COERCE_DOUBLE(__PAIR64__(v1800, v1824)));
  LODWORD(v893) = v892;
  v1894[7] = objc_msgSend_numberWithFloat_(v785, v894, v895, v896, v893);
  v897 = NSNumber;
  v900 = objc_msgSend_objectAtIndexedSubscript_(a3, v898, 0, v899);
  objc_msgSend_floatValue(v900, v901, v902, v903);
  LODWORD(v1885) = v904;
  v907 = objc_msgSend_objectAtIndexedSubscript_(a3, v905, 1, v906);
  objc_msgSend_floatValue(v907, v908, v909, v910);
  LODWORD(v1868) = v911;
  v914 = objc_msgSend_objectAtIndexedSubscript_(a3, v912, 2, v913);
  objc_msgSend_floatValue(v914, v915, v916, v917);
  v920 = objc_msgSend_objectAtIndexedSubscript_(a3, v918, 3, v919);
  objc_msgSend_floatValue(v920, v921, v922, v923);
  *(void *)&double v1886 = __PAIR64__(LODWORD(v1868), LODWORD(v1885));
  v926 = objc_msgSend_objectAtIndexedSubscript_(a3, v924, 4, v925);
  objc_msgSend_floatValue(v926, v927, v928, v929);
  LODWORD(v1868) = v930;
  v933 = objc_msgSend_objectAtIndexedSubscript_(a3, v931, 5, v932);
  objc_msgSend_floatValue(v933, v934, v935, v936);
  LODWORD(v1850) = v937;
  v940 = objc_msgSend_objectAtIndexedSubscript_(a3, v938, 6, v939);
  objc_msgSend_floatValue(v940, v941, v942, v943);
  v946 = objc_msgSend_objectAtIndexedSubscript_(a3, v944, 7, v945);
  objc_msgSend_floatValue(v946, v947, v948, v949);
  *(void *)&double v1869 = __PAIR64__(LODWORD(v1850), LODWORD(v1868));
  v952 = objc_msgSend_objectAtIndexedSubscript_(a3, v950, 8, v951);
  objc_msgSend_floatValue(v952, v953, v954, v955);
  LODWORD(v1850) = v956;
  v959 = objc_msgSend_objectAtIndexedSubscript_(a3, v957, 9, v958);
  objc_msgSend_floatValue(v959, v960, v961, v962);
  unsigned int v1825 = v963;
  v966 = objc_msgSend_objectAtIndexedSubscript_(a3, v964, 10, v965);
  objc_msgSend_floatValue(v966, v967, v968, v969);
  v972 = objc_msgSend_objectAtIndexedSubscript_(a3, v970, 11, v971);
  objc_msgSend_floatValue(v972, v973, v974, v975);
  *(void *)&double v1851 = __PAIR64__(v1825, LODWORD(v1850));
  v978 = objc_msgSend_objectAtIndexedSubscript_(a3, v976, 12, v977);
  objc_msgSend_floatValue(v978, v979, v980, v981);
  unsigned int v1826 = v982;
  v985 = objc_msgSend_objectAtIndexedSubscript_(a3, v983, 13, v984);
  objc_msgSend_floatValue(v985, v986, v987, v988);
  unsigned int v1801 = v989;
  v992 = objc_msgSend_objectAtIndexedSubscript_(a3, v990, 14, v991);
  objc_msgSend_floatValue(v992, v993, v994, v995);
  v998 = objc_msgSend_objectAtIndexedSubscript_(a3, v996, 15, v997);
  objc_msgSend_floatValue(v998, v999, v1000, v1001);
  objc_msgSend_convertTransform_fromNode_(self, v1002, (uint64_t)a4, v1003, v1886, v1869, v1851, COERCE_DOUBLE(__PAIR64__(v1801, v1826)));
  v1894[8] = objc_msgSend_numberWithFloat_(v897, v1004, v1005, v1006, v1007);
  v1008 = NSNumber;
  v1011 = objc_msgSend_objectAtIndexedSubscript_(a3, v1009, 0, v1010);
  objc_msgSend_floatValue(v1011, v1012, v1013, v1014);
  LODWORD(v1886) = v1015;
  v1018 = objc_msgSend_objectAtIndexedSubscript_(a3, v1016, 1, v1017);
  objc_msgSend_floatValue(v1018, v1019, v1020, v1021);
  LODWORD(v1869) = v1022;
  v1025 = objc_msgSend_objectAtIndexedSubscript_(a3, v1023, 2, v1024);
  objc_msgSend_floatValue(v1025, v1026, v1027, v1028);
  v1031 = objc_msgSend_objectAtIndexedSubscript_(a3, v1029, 3, v1030);
  objc_msgSend_floatValue(v1031, v1032, v1033, v1034);
  *(void *)&double v1887 = __PAIR64__(LODWORD(v1869), LODWORD(v1886));
  v1037 = objc_msgSend_objectAtIndexedSubscript_(a3, v1035, 4, v1036);
  objc_msgSend_floatValue(v1037, v1038, v1039, v1040);
  LODWORD(v1869) = v1041;
  v1044 = objc_msgSend_objectAtIndexedSubscript_(a3, v1042, 5, v1043);
  objc_msgSend_floatValue(v1044, v1045, v1046, v1047);
  LODWORD(v1851) = v1048;
  v1051 = objc_msgSend_objectAtIndexedSubscript_(a3, v1049, 6, v1050);
  objc_msgSend_floatValue(v1051, v1052, v1053, v1054);
  v1057 = objc_msgSend_objectAtIndexedSubscript_(a3, v1055, 7, v1056);
  objc_msgSend_floatValue(v1057, v1058, v1059, v1060);
  *(void *)&double v1870 = __PAIR64__(LODWORD(v1851), LODWORD(v1869));
  v1063 = objc_msgSend_objectAtIndexedSubscript_(a3, v1061, 8, v1062);
  objc_msgSend_floatValue(v1063, v1064, v1065, v1066);
  LODWORD(v1851) = v1067;
  v1070 = objc_msgSend_objectAtIndexedSubscript_(a3, v1068, 9, v1069);
  objc_msgSend_floatValue(v1070, v1071, v1072, v1073);
  unsigned int v1827 = v1074;
  v1077 = objc_msgSend_objectAtIndexedSubscript_(a3, v1075, 10, v1076);
  objc_msgSend_floatValue(v1077, v1078, v1079, v1080);
  v1083 = objc_msgSend_objectAtIndexedSubscript_(a3, v1081, 11, v1082);
  objc_msgSend_floatValue(v1083, v1084, v1085, v1086);
  *(void *)&double v1852 = __PAIR64__(v1827, LODWORD(v1851));
  v1089 = objc_msgSend_objectAtIndexedSubscript_(a3, v1087, 12, v1088);
  objc_msgSend_floatValue(v1089, v1090, v1091, v1092);
  unsigned int v1828 = v1093;
  v1096 = objc_msgSend_objectAtIndexedSubscript_(a3, v1094, 13, v1095);
  objc_msgSend_floatValue(v1096, v1097, v1098, v1099);
  unsigned int v1802 = v1100;
  v1103 = objc_msgSend_objectAtIndexedSubscript_(a3, v1101, 14, v1102);
  objc_msgSend_floatValue(v1103, v1104, v1105, v1106);
  v1109 = objc_msgSend_objectAtIndexedSubscript_(a3, v1107, 15, v1108);
  objc_msgSend_floatValue(v1109, v1110, v1111, v1112);
  objc_msgSend_convertTransform_fromNode_(self, v1113, (uint64_t)a4, v1114, v1887, v1870, v1852, COERCE_DOUBLE(__PAIR64__(v1802, v1828)));
  LODWORD(v1116) = v1115;
  v1894[9] = objc_msgSend_numberWithFloat_(v1008, v1117, v1118, v1119, v1116);
  v1120 = NSNumber;
  v1123 = objc_msgSend_objectAtIndexedSubscript_(a3, v1121, 0, v1122);
  objc_msgSend_floatValue(v1123, v1124, v1125, v1126);
  LODWORD(v1887) = v1127;
  v1130 = objc_msgSend_objectAtIndexedSubscript_(a3, v1128, 1, v1129);
  objc_msgSend_floatValue(v1130, v1131, v1132, v1133);
  LODWORD(v1870) = v1134;
  v1137 = objc_msgSend_objectAtIndexedSubscript_(a3, v1135, 2, v1136);
  objc_msgSend_floatValue(v1137, v1138, v1139, v1140);
  v1143 = objc_msgSend_objectAtIndexedSubscript_(a3, v1141, 3, v1142);
  objc_msgSend_floatValue(v1143, v1144, v1145, v1146);
  *(void *)&double v1888 = __PAIR64__(LODWORD(v1870), LODWORD(v1887));
  v1149 = objc_msgSend_objectAtIndexedSubscript_(a3, v1147, 4, v1148);
  objc_msgSend_floatValue(v1149, v1150, v1151, v1152);
  LODWORD(v1870) = v1153;
  v1156 = objc_msgSend_objectAtIndexedSubscript_(a3, v1154, 5, v1155);
  objc_msgSend_floatValue(v1156, v1157, v1158, v1159);
  LODWORD(v1852) = v1160;
  v1163 = objc_msgSend_objectAtIndexedSubscript_(a3, v1161, 6, v1162);
  objc_msgSend_floatValue(v1163, v1164, v1165, v1166);
  v1169 = objc_msgSend_objectAtIndexedSubscript_(a3, v1167, 7, v1168);
  objc_msgSend_floatValue(v1169, v1170, v1171, v1172);
  *(void *)&double v1871 = __PAIR64__(LODWORD(v1852), LODWORD(v1870));
  v1175 = objc_msgSend_objectAtIndexedSubscript_(a3, v1173, 8, v1174);
  objc_msgSend_floatValue(v1175, v1176, v1177, v1178);
  LODWORD(v1852) = v1179;
  v1182 = objc_msgSend_objectAtIndexedSubscript_(a3, v1180, 9, v1181);
  objc_msgSend_floatValue(v1182, v1183, v1184, v1185);
  unsigned int v1829 = v1186;
  v1189 = objc_msgSend_objectAtIndexedSubscript_(a3, v1187, 10, v1188);
  objc_msgSend_floatValue(v1189, v1190, v1191, v1192);
  v1195 = objc_msgSend_objectAtIndexedSubscript_(a3, v1193, 11, v1194);
  objc_msgSend_floatValue(v1195, v1196, v1197, v1198);
  *(void *)&double v1853 = __PAIR64__(v1829, LODWORD(v1852));
  v1201 = objc_msgSend_objectAtIndexedSubscript_(a3, v1199, 12, v1200);
  objc_msgSend_floatValue(v1201, v1202, v1203, v1204);
  unsigned int v1830 = v1205;
  v1208 = objc_msgSend_objectAtIndexedSubscript_(a3, v1206, 13, v1207);
  objc_msgSend_floatValue(v1208, v1209, v1210, v1211);
  unsigned int v1803 = v1212;
  v1215 = objc_msgSend_objectAtIndexedSubscript_(a3, v1213, 14, v1214);
  objc_msgSend_floatValue(v1215, v1216, v1217, v1218);
  v1221 = objc_msgSend_objectAtIndexedSubscript_(a3, v1219, 15, v1220);
  objc_msgSend_floatValue(v1221, v1222, v1223, v1224);
  objc_msgSend_convertTransform_fromNode_(self, v1225, (uint64_t)a4, v1226, v1888, v1871, v1853, COERCE_DOUBLE(__PAIR64__(v1803, v1830)));
  LODWORD(v1228) = v1227;
  v1894[10] = objc_msgSend_numberWithFloat_(v1120, v1229, v1230, v1231, v1228);
  v1232 = NSNumber;
  v1235 = objc_msgSend_objectAtIndexedSubscript_(a3, v1233, 0, v1234);
  objc_msgSend_floatValue(v1235, v1236, v1237, v1238);
  LODWORD(v1888) = v1239;
  v1242 = objc_msgSend_objectAtIndexedSubscript_(a3, v1240, 1, v1241);
  objc_msgSend_floatValue(v1242, v1243, v1244, v1245);
  LODWORD(v1871) = v1246;
  v1249 = objc_msgSend_objectAtIndexedSubscript_(a3, v1247, 2, v1248);
  objc_msgSend_floatValue(v1249, v1250, v1251, v1252);
  v1255 = objc_msgSend_objectAtIndexedSubscript_(a3, v1253, 3, v1254);
  objc_msgSend_floatValue(v1255, v1256, v1257, v1258);
  *(void *)&double v1889 = __PAIR64__(LODWORD(v1871), LODWORD(v1888));
  v1261 = objc_msgSend_objectAtIndexedSubscript_(a3, v1259, 4, v1260);
  objc_msgSend_floatValue(v1261, v1262, v1263, v1264);
  LODWORD(v1871) = v1265;
  v1268 = objc_msgSend_objectAtIndexedSubscript_(a3, v1266, 5, v1267);
  objc_msgSend_floatValue(v1268, v1269, v1270, v1271);
  LODWORD(v1853) = v1272;
  v1275 = objc_msgSend_objectAtIndexedSubscript_(a3, v1273, 6, v1274);
  objc_msgSend_floatValue(v1275, v1276, v1277, v1278);
  v1281 = objc_msgSend_objectAtIndexedSubscript_(a3, v1279, 7, v1280);
  objc_msgSend_floatValue(v1281, v1282, v1283, v1284);
  *(void *)&double v1872 = __PAIR64__(LODWORD(v1853), LODWORD(v1871));
  v1287 = objc_msgSend_objectAtIndexedSubscript_(a3, v1285, 8, v1286);
  objc_msgSend_floatValue(v1287, v1288, v1289, v1290);
  LODWORD(v1853) = v1291;
  v1294 = objc_msgSend_objectAtIndexedSubscript_(a3, v1292, 9, v1293);
  objc_msgSend_floatValue(v1294, v1295, v1296, v1297);
  unsigned int v1831 = v1298;
  v1301 = objc_msgSend_objectAtIndexedSubscript_(a3, v1299, 10, v1300);
  objc_msgSend_floatValue(v1301, v1302, v1303, v1304);
  v1307 = objc_msgSend_objectAtIndexedSubscript_(a3, v1305, 11, v1306);
  objc_msgSend_floatValue(v1307, v1308, v1309, v1310);
  *(void *)&double v1854 = __PAIR64__(v1831, LODWORD(v1853));
  v1313 = objc_msgSend_objectAtIndexedSubscript_(a3, v1311, 12, v1312);
  objc_msgSend_floatValue(v1313, v1314, v1315, v1316);
  unsigned int v1832 = v1317;
  v1320 = objc_msgSend_objectAtIndexedSubscript_(a3, v1318, 13, v1319);
  objc_msgSend_floatValue(v1320, v1321, v1322, v1323);
  unsigned int v1804 = v1324;
  v1327 = objc_msgSend_objectAtIndexedSubscript_(a3, v1325, 14, v1326);
  objc_msgSend_floatValue(v1327, v1328, v1329, v1330);
  v1333 = objc_msgSend_objectAtIndexedSubscript_(a3, v1331, 15, v1332);
  objc_msgSend_floatValue(v1333, v1334, v1335, v1336);
  objc_msgSend_convertTransform_fromNode_(self, v1337, (uint64_t)a4, v1338, v1889, v1872, v1854, COERCE_DOUBLE(__PAIR64__(v1804, v1832)));
  LODWORD(v1340) = v1339;
  v1894[11] = objc_msgSend_numberWithFloat_(v1232, v1341, v1342, v1343, v1340);
  v1344 = NSNumber;
  v1347 = objc_msgSend_objectAtIndexedSubscript_(a3, v1345, 0, v1346);
  objc_msgSend_floatValue(v1347, v1348, v1349, v1350);
  LODWORD(v1889) = v1351;
  v1354 = objc_msgSend_objectAtIndexedSubscript_(a3, v1352, 1, v1353);
  objc_msgSend_floatValue(v1354, v1355, v1356, v1357);
  LODWORD(v1872) = v1358;
  v1361 = objc_msgSend_objectAtIndexedSubscript_(a3, v1359, 2, v1360);
  objc_msgSend_floatValue(v1361, v1362, v1363, v1364);
  v1367 = objc_msgSend_objectAtIndexedSubscript_(a3, v1365, 3, v1366);
  objc_msgSend_floatValue(v1367, v1368, v1369, v1370);
  *(void *)&double v1890 = __PAIR64__(LODWORD(v1872), LODWORD(v1889));
  v1373 = objc_msgSend_objectAtIndexedSubscript_(a3, v1371, 4, v1372);
  objc_msgSend_floatValue(v1373, v1374, v1375, v1376);
  LODWORD(v1872) = v1377;
  v1380 = objc_msgSend_objectAtIndexedSubscript_(a3, v1378, 5, v1379);
  objc_msgSend_floatValue(v1380, v1381, v1382, v1383);
  LODWORD(v1854) = v1384;
  v1387 = objc_msgSend_objectAtIndexedSubscript_(a3, v1385, 6, v1386);
  objc_msgSend_floatValue(v1387, v1388, v1389, v1390);
  v1393 = objc_msgSend_objectAtIndexedSubscript_(a3, v1391, 7, v1392);
  objc_msgSend_floatValue(v1393, v1394, v1395, v1396);
  *(void *)&double v1873 = __PAIR64__(LODWORD(v1854), LODWORD(v1872));
  v1399 = objc_msgSend_objectAtIndexedSubscript_(a3, v1397, 8, v1398);
  objc_msgSend_floatValue(v1399, v1400, v1401, v1402);
  LODWORD(v1854) = v1403;
  v1406 = objc_msgSend_objectAtIndexedSubscript_(a3, v1404, 9, v1405);
  objc_msgSend_floatValue(v1406, v1407, v1408, v1409);
  unsigned int v1833 = v1410;
  v1413 = objc_msgSend_objectAtIndexedSubscript_(a3, v1411, 10, v1412);
  objc_msgSend_floatValue(v1413, v1414, v1415, v1416);
  v1419 = objc_msgSend_objectAtIndexedSubscript_(a3, v1417, 11, v1418);
  objc_msgSend_floatValue(v1419, v1420, v1421, v1422);
  *(void *)&double v1855 = __PAIR64__(v1833, LODWORD(v1854));
  v1425 = objc_msgSend_objectAtIndexedSubscript_(a3, v1423, 12, v1424);
  objc_msgSend_floatValue(v1425, v1426, v1427, v1428);
  unsigned int v1834 = v1429;
  v1432 = objc_msgSend_objectAtIndexedSubscript_(a3, v1430, 13, v1431);
  objc_msgSend_floatValue(v1432, v1433, v1434, v1435);
  unsigned int v1805 = v1436;
  v1439 = objc_msgSend_objectAtIndexedSubscript_(a3, v1437, 14, v1438);
  objc_msgSend_floatValue(v1439, v1440, v1441, v1442);
  v1445 = objc_msgSend_objectAtIndexedSubscript_(a3, v1443, 15, v1444);
  objc_msgSend_floatValue(v1445, v1446, v1447, v1448);
  objc_msgSend_convertTransform_fromNode_(self, v1449, (uint64_t)a4, v1450, v1890, v1873, v1855, COERCE_DOUBLE(__PAIR64__(v1805, v1834)));
  v1894[12] = objc_msgSend_numberWithFloat_(v1344, v1451, v1452, v1453, v1454);
  v1455 = NSNumber;
  v1458 = objc_msgSend_objectAtIndexedSubscript_(a3, v1456, 0, v1457);
  objc_msgSend_floatValue(v1458, v1459, v1460, v1461);
  LODWORD(v1890) = v1462;
  v1465 = objc_msgSend_objectAtIndexedSubscript_(a3, v1463, 1, v1464);
  objc_msgSend_floatValue(v1465, v1466, v1467, v1468);
  LODWORD(v1873) = v1469;
  v1472 = objc_msgSend_objectAtIndexedSubscript_(a3, v1470, 2, v1471);
  objc_msgSend_floatValue(v1472, v1473, v1474, v1475);
  v1478 = objc_msgSend_objectAtIndexedSubscript_(a3, v1476, 3, v1477);
  objc_msgSend_floatValue(v1478, v1479, v1480, v1481);
  *(void *)&double v1891 = __PAIR64__(LODWORD(v1873), LODWORD(v1890));
  v1484 = objc_msgSend_objectAtIndexedSubscript_(a3, v1482, 4, v1483);
  objc_msgSend_floatValue(v1484, v1485, v1486, v1487);
  LODWORD(v1873) = v1488;
  v1491 = objc_msgSend_objectAtIndexedSubscript_(a3, v1489, 5, v1490);
  objc_msgSend_floatValue(v1491, v1492, v1493, v1494);
  LODWORD(v1855) = v1495;
  v1498 = objc_msgSend_objectAtIndexedSubscript_(a3, v1496, 6, v1497);
  objc_msgSend_floatValue(v1498, v1499, v1500, v1501);
  v1504 = objc_msgSend_objectAtIndexedSubscript_(a3, v1502, 7, v1503);
  objc_msgSend_floatValue(v1504, v1505, v1506, v1507);
  *(void *)&double v1874 = __PAIR64__(LODWORD(v1855), LODWORD(v1873));
  v1510 = objc_msgSend_objectAtIndexedSubscript_(a3, v1508, 8, v1509);
  objc_msgSend_floatValue(v1510, v1511, v1512, v1513);
  LODWORD(v1855) = v1514;
  v1517 = objc_msgSend_objectAtIndexedSubscript_(a3, v1515, 9, v1516);
  objc_msgSend_floatValue(v1517, v1518, v1519, v1520);
  unsigned int v1835 = v1521;
  v1524 = objc_msgSend_objectAtIndexedSubscript_(a3, v1522, 10, v1523);
  objc_msgSend_floatValue(v1524, v1525, v1526, v1527);
  v1530 = objc_msgSend_objectAtIndexedSubscript_(a3, v1528, 11, v1529);
  objc_msgSend_floatValue(v1530, v1531, v1532, v1533);
  *(void *)&double v1856 = __PAIR64__(v1835, LODWORD(v1855));
  v1536 = objc_msgSend_objectAtIndexedSubscript_(a3, v1534, 12, v1535);
  objc_msgSend_floatValue(v1536, v1537, v1538, v1539);
  unsigned int v1836 = v1540;
  v1543 = objc_msgSend_objectAtIndexedSubscript_(a3, v1541, 13, v1542);
  objc_msgSend_floatValue(v1543, v1544, v1545, v1546);
  unsigned int v1806 = v1547;
  v1550 = objc_msgSend_objectAtIndexedSubscript_(a3, v1548, 14, v1549);
  objc_msgSend_floatValue(v1550, v1551, v1552, v1553);
  v1556 = objc_msgSend_objectAtIndexedSubscript_(a3, v1554, 15, v1555);
  objc_msgSend_floatValue(v1556, v1557, v1558, v1559);
  objc_msgSend_convertTransform_fromNode_(self, v1560, (uint64_t)a4, v1561, v1891, v1874, v1856, COERCE_DOUBLE(__PAIR64__(v1806, v1836)));
  LODWORD(v1563) = v1562;
  v1894[13] = objc_msgSend_numberWithFloat_(v1455, v1564, v1565, v1566, v1563);
  v1567 = NSNumber;
  v1570 = objc_msgSend_objectAtIndexedSubscript_(a3, v1568, 0, v1569);
  objc_msgSend_floatValue(v1570, v1571, v1572, v1573);
  LODWORD(v1891) = v1574;
  v1577 = objc_msgSend_objectAtIndexedSubscript_(a3, v1575, 1, v1576);
  objc_msgSend_floatValue(v1577, v1578, v1579, v1580);
  LODWORD(v1874) = v1581;
  v1584 = objc_msgSend_objectAtIndexedSubscript_(a3, v1582, 2, v1583);
  objc_msgSend_floatValue(v1584, v1585, v1586, v1587);
  v1590 = objc_msgSend_objectAtIndexedSubscript_(a3, v1588, 3, v1589);
  objc_msgSend_floatValue(v1590, v1591, v1592, v1593);
  *(void *)&double v1892 = __PAIR64__(LODWORD(v1874), LODWORD(v1891));
  v1596 = objc_msgSend_objectAtIndexedSubscript_(a3, v1594, 4, v1595);
  objc_msgSend_floatValue(v1596, v1597, v1598, v1599);
  LODWORD(v1874) = v1600;
  v1603 = objc_msgSend_objectAtIndexedSubscript_(a3, v1601, 5, v1602);
  objc_msgSend_floatValue(v1603, v1604, v1605, v1606);
  LODWORD(v1856) = v1607;
  v1610 = objc_msgSend_objectAtIndexedSubscript_(a3, v1608, 6, v1609);
  objc_msgSend_floatValue(v1610, v1611, v1612, v1613);
  v1616 = objc_msgSend_objectAtIndexedSubscript_(a3, v1614, 7, v1615);
  objc_msgSend_floatValue(v1616, v1617, v1618, v1619);
  *(void *)&double v1875 = __PAIR64__(LODWORD(v1856), LODWORD(v1874));
  v1622 = objc_msgSend_objectAtIndexedSubscript_(a3, v1620, 8, v1621);
  objc_msgSend_floatValue(v1622, v1623, v1624, v1625);
  LODWORD(v1856) = v1626;
  v1629 = objc_msgSend_objectAtIndexedSubscript_(a3, v1627, 9, v1628);
  objc_msgSend_floatValue(v1629, v1630, v1631, v1632);
  unsigned int v1837 = v1633;
  v1636 = objc_msgSend_objectAtIndexedSubscript_(a3, v1634, 10, v1635);
  objc_msgSend_floatValue(v1636, v1637, v1638, v1639);
  v1642 = objc_msgSend_objectAtIndexedSubscript_(a3, v1640, 11, v1641);
  objc_msgSend_floatValue(v1642, v1643, v1644, v1645);
  *(void *)&double v1857 = __PAIR64__(v1837, LODWORD(v1856));
  v1648 = objc_msgSend_objectAtIndexedSubscript_(a3, v1646, 12, v1647);
  objc_msgSend_floatValue(v1648, v1649, v1650, v1651);
  unsigned int v1838 = v1652;
  v1655 = objc_msgSend_objectAtIndexedSubscript_(a3, v1653, 13, v1654);
  objc_msgSend_floatValue(v1655, v1656, v1657, v1658);
  unsigned int v1807 = v1659;
  v1662 = objc_msgSend_objectAtIndexedSubscript_(a3, v1660, 14, v1661);
  objc_msgSend_floatValue(v1662, v1663, v1664, v1665);
  v1668 = objc_msgSend_objectAtIndexedSubscript_(a3, v1666, 15, v1667);
  objc_msgSend_floatValue(v1668, v1669, v1670, v1671);
  objc_msgSend_convertTransform_fromNode_(self, v1672, (uint64_t)a4, v1673, v1892, v1875, v1857, COERCE_DOUBLE(__PAIR64__(v1807, v1838)));
  LODWORD(v1675) = v1674;
  v1894[14] = objc_msgSend_numberWithFloat_(v1567, v1676, v1677, v1678, v1675);
  v1679 = NSNumber;
  v1682 = objc_msgSend_objectAtIndexedSubscript_(a3, v1680, 0, v1681);
  objc_msgSend_floatValue(v1682, v1683, v1684, v1685);
  LODWORD(v1892) = v1686;
  v1689 = objc_msgSend_objectAtIndexedSubscript_(a3, v1687, 1, v1688);
  objc_msgSend_floatValue(v1689, v1690, v1691, v1692);
  LODWORD(v1875) = v1693;
  v1696 = objc_msgSend_objectAtIndexedSubscript_(a3, v1694, 2, v1695);
  objc_msgSend_floatValue(v1696, v1697, v1698, v1699);
  v1702 = objc_msgSend_objectAtIndexedSubscript_(a3, v1700, 3, v1701);
  objc_msgSend_floatValue(v1702, v1703, v1704, v1705);
  double v1893 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1875), LODWORD(v1892)));
  v1708 = objc_msgSend_objectAtIndexedSubscript_(a3, v1706, 4, v1707);
  objc_msgSend_floatValue(v1708, v1709, v1710, v1711);
  LODWORD(v1875) = v1712;
  v1715 = objc_msgSend_objectAtIndexedSubscript_(a3, v1713, 5, v1714);
  objc_msgSend_floatValue(v1715, v1716, v1717, v1718);
  LODWORD(v1857) = v1719;
  v1722 = objc_msgSend_objectAtIndexedSubscript_(a3, v1720, 6, v1721);
  objc_msgSend_floatValue(v1722, v1723, v1724, v1725);
  v1728 = objc_msgSend_objectAtIndexedSubscript_(a3, v1726, 7, v1727);
  objc_msgSend_floatValue(v1728, v1729, v1730, v1731);
  double v1876 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1857), LODWORD(v1875)));
  v1734 = objc_msgSend_objectAtIndexedSubscript_(a3, v1732, 8, v1733);
  objc_msgSend_floatValue(v1734, v1735, v1736, v1737);
  LODWORD(v1857) = v1738;
  v1741 = objc_msgSend_objectAtIndexedSubscript_(a3, v1739, 9, v1740);
  objc_msgSend_floatValue(v1741, v1742, v1743, v1744);
  unsigned int v1839 = v1745;
  v1748 = objc_msgSend_objectAtIndexedSubscript_(a3, v1746, 10, v1747);
  objc_msgSend_floatValue(v1748, v1749, v1750, v1751);
  v1754 = objc_msgSend_objectAtIndexedSubscript_(a3, v1752, 11, v1753);
  objc_msgSend_floatValue(v1754, v1755, v1756, v1757);
  double v1858 = COERCE_DOUBLE(__PAIR64__(v1839, LODWORD(v1857)));
  v1760 = objc_msgSend_objectAtIndexedSubscript_(a3, v1758, 12, v1759);
  objc_msgSend_floatValue(v1760, v1761, v1762, v1763);
  unsigned int v1840 = v1764;
  v1767 = objc_msgSend_objectAtIndexedSubscript_(a3, v1765, 13, v1766);
  objc_msgSend_floatValue(v1767, v1768, v1769, v1770);
  unsigned int v1808 = v1771;
  v1774 = objc_msgSend_objectAtIndexedSubscript_(a3, v1772, 14, v1773);
  objc_msgSend_floatValue(v1774, v1775, v1776, v1777);
  v1780 = objc_msgSend_objectAtIndexedSubscript_(a3, v1778, 15, v1779);
  objc_msgSend_floatValue(v1780, v1781, v1782, v1783);
  objc_msgSend_convertTransform_fromNode_(self, v1784, (uint64_t)a4, v1785, v1893, v1876, v1858, COERCE_DOUBLE(__PAIR64__(v1808, v1840)));
  LODWORD(v1787) = v1786;
  v1894[15] = objc_msgSend_numberWithFloat_(v1679, v1788, v1789, v1790, v1787);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1791, (uint64_t)v1894, 16);
}

- (id)hitTestWithSegmentFrom:(id)a3 toPoint:(id)a4 options:(id)a5
{
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  unsigned int v53 = v13;
  uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(a3, v14, 1, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19);
  unsigned int v51 = v20;
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(a3, v21, 2, v22);
  objc_msgSend_floatValue(v23, v24, v25, v26);
  double v54 = COERCE_DOUBLE(__PAIR64__(v51, v53));
  uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(a4, v27, 0, v28);
  objc_msgSend_floatValue(v29, v30, v31, v32);
  unsigned int v52 = v33;
  uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(a4, v34, 1, v35);
  objc_msgSend_floatValue(v36, v37, v38, v39);
  unsigned int v50 = v40;
  uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(a4, v41, 2, v42);
  objc_msgSend_floatValue(v43, v44, v45, v46);

  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(self, v47, (uint64_t)a5, v48, v54, COERCE_DOUBLE(__PAIR64__(v50, v52)));
}

+ (id)localRightValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_localRight(a1, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_localRight(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_localRight(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

+ (id)localFrontValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_localFront(a1, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_localFront(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_localFront(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

+ (id)localUpValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_localUp(a1, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_localUp(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_localUp(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (id)worldRightValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldRight(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_worldRight(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_worldRight(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (id)worldFrontValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldFront(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_worldFront(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_worldFront(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (id)worldUpValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = NSNumber;
  objc_msgSend_worldUp(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_worldUp(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_worldUp(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)lookAtLocation:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_lookAt_, v22, v23);
}

- (void)lookAtLocation:(id)a3 up:(id)a4 localFront:(id)a5
{
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(a4, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  unsigned int v33 = objc_msgSend_objectAtIndexedSubscript_(a4, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(a4, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(a5, v43, 0, v44);
  objc_msgSend_floatValue(v45, v46, v47, v48);
  unsigned int v51 = objc_msgSend_objectAtIndexedSubscript_(a5, v49, 1, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54);
  uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(a5, v55, 2, v56);
  objc_msgSend_floatValue(v57, v58, v59, v60);

  MEMORY[0x1F4181798](self, sel_lookAt_up_localFront_, v61, v62);
}

- (void)localTranslateByValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_localTranslateBy_, v22, v23);
}

- (void)localRotateByValue:(id)a3
{
  float32x4_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(a3, v22, 3, v23);
  objc_msgSend_floatValue(v24, v25, v26, v27);

  MEMORY[0x1F4181798](self, sel_localRotateBy_, v28, v29);
}

- (void)rotateBy:(id)a3 around:(id)a4
{
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  unsigned int v57 = v11;
  uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(a3, v12, 1, v13);
  objc_msgSend_floatValue(v14, v15, v16, v17);
  unsigned int v55 = v18;
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(a3, v25, 3, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  double v58 = COERCE_DOUBLE(__PAIR64__(v55, v57));
  unsigned int v33 = objc_msgSend_objectAtIndexedSubscript_(a4, v31, 0, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  unsigned int v56 = v37;
  unsigned int v40 = objc_msgSend_objectAtIndexedSubscript_(a4, v38, 1, v39);
  objc_msgSend_floatValue(v40, v41, v42, v43);
  unsigned int v54 = v44;
  uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(a4, v45, 2, v46);
  objc_msgSend_floatValue(v47, v48, v49, v50);

  objc_msgSend_rotateBy_aroundTarget_(self, v51, v52, v53, v58, COERCE_DOUBLE(__PAIR64__(v54, v56)));
}

+ (VFXNode)nodeWithSceneKitNode:(id)a3 options:(id)a4
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v7, v8, v9);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a4, v12, @"VFXSceneKitBridgeOptionOriginalURL", v13);
  uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(VFXTransaction, v19, PathComponent, @"VFXWorldDecodingCurrentEnclosingFolder");
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(a4, v20, @"VFXSceneKitBridgeOptionSkipLightIntensityRemapping", v21);
  unsigned __int8 v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  uint64_t v27 = (VFXNode *)sub_1B65CFD34(a3, Mutable, v26);
  objc_msgSend_commit(VFXTransaction, v28, v29, v30);
  CFRelease(Mutable);
  return v27;
}

- (NSArray)bridgedComponentNames
{
  uint64_t v2 = self;
  VFXNode.bridgedComponentNames.getter();

  uint64_t v3 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

@end