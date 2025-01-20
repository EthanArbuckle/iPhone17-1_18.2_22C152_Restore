@interface VFXAuthoringEnvironment2
+ (id)authoringEnvironmentForWorld:(id)a3;
+ (id)authoringEnvironmentForWorld:(id)a3 createIfNeeded:(BOOL)a4;
- (BOOL)_isPartOfSelection:(__CFXNode *)a3;
- (BOOL)_proximityHidden:(uint64_t)a3;
- (BOOL)didTapAtPoint:(CGPoint)a3;
- (BOOL)hasDebugOption:(unsigned int)a3;
- (VFXAuthoringEnvironment2)initWithWorld:(id)a3;
- (VFXManipulator)manipulator;
- (VFXNode)authoringLayer;
- (VFXNode)authoringOverlayLayer;
- (id)authoringCamera:(int64_t)a3;
- (id)authoringCameraNodes;
- (id)cameraFocusPlaneGeometry;
- (id)cameraFrustumGeometry;
- (id)cameraGeometry;
- (id)cameraNearPlaneGeometry;
- (id)cameraOrthographicFrustumGeometry;
- (id)effectGeometry;
- (id)fieldGeometry;
- (id)geometryForLightType:(int)a3;
- (unsigned)debugOptions;
- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5;
- (void)addCameraNode:(__CFXNode *)a3;
- (void)addEffectNode:(__CFXNode *)a3;
- (void)addForceFieldNode:(__CFXNode *)a3;
- (void)addLightNode:(__CFXNode *)a3;
- (void)addedNode:(__CFXNode *)a3;
- (void)cancelSelection;
- (void)dealloc;
- (void)debugOptionsDidChange:(unint64_t)a3;
- (void)prepareWorld:(id)a3;
- (void)removeCameraNode:(__CFXNode *)a3;
- (void)removeEffectNode:(__CFXNode *)a3;
- (void)removeForceFieldNode:(__CFXNode *)a3;
- (void)removeLightNode:(__CFXNode *)a3;
- (void)removedNode:(__CFXNode *)a3;
- (void)selectNodes:(id)a3;
- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4;
- (void)updateCameraNode:(id)a3 withSourceNode:(__CFXNode *)a4;
- (void)updateEffectNode:(id)a3 withSourceNode:(__CFXNode *)a4;
- (void)updateFieldNode:(id)a3 withSourceNode:(__CFXNode *)a4;
- (void)updateLightNode:(id)a3 withSourceNode:(__CFXNode *)a4;
- (void)updateLightTypeForNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5 screenspaceScalingFactor:(float)a6;
- (void)updateWithRenderer:(id)a3;
@end

@implementation VFXAuthoringEnvironment2

+ (id)authoringEnvironmentForWorld:(id)a3
{
  return (id)objc_msgSend_authoringEnvironmentForWorld_createIfNeeded_(a1, a2, (uint64_t)a3, 1);
}

+ (id)authoringEnvironmentForWorld:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v9 = objc_msgSend_authoringEnvironment2(a3, a2, (uint64_t)a3, a4);
  if (!v9 && v4)
  {
    uint64_t v10 = objc_msgSend_worldRef(a3, v6, v7, v8);
    if (v10)
    {
      uint64_t v18 = v10;
      sub_1B64B0C28(v10, v11, v12, v13, v14, v15, v16, v17);
      v9 = (void *)sub_1B64B35C0(v18, (const char *)1, v19, v20);
      sub_1B64B0CB4(v18, v21, v22, v23, v24, v25, v26, v27);
      objc_msgSend_setAuthoringEnvironment2_(a3, v28, (uint64_t)v9, v29);
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (VFXAuthoringEnvironment2)initWithWorld:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXAuthoringEnvironment2;
  BOOL v4 = [(VFXAuthoringEnvironment2 *)&v9 init];
  uint64_t v7 = v4;
  if (v4) {
    objc_msgSend_prepareWorld_(v4, v5, (uint64_t)a3, v6);
  }
  return v7;
}

- (void)dealloc
{
  CFRelease(self->_lightsDictionary);
  CFRelease(self->_camerasDictionary);
  CFRelease(self->_effectsDictionary);
  CFRelease(self->_forceFieldsDictionary);

  v3.receiver = self;
  v3.super_class = (Class)VFXAuthoringEnvironment2;
  [(VFXAuthoringEnvironment2 *)&v3 dealloc];
}

- (void)prepareWorld:(id)a3
{
  v336[1] = *MEMORY[0x1E4F143B8];
  self->_world = (__CFXWorld *)objc_msgSend_worldRef(a3, a2, (uint64_t)a3, v3);
  self->_manipulator = objc_alloc_init(VFXManipulator);
  self->_selection = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  uint64_t v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  self->_lightsDictionary = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  self->_camerasDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_effectsDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_forceFieldsDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_layerRoot = (VFXNode *)(id)objc_msgSend_node(VFXNode, v7, v8, v9);
  self->_overlayLayerRoot = (VFXNode *)(id)objc_msgSend_node(VFXNode, v10, v11, v12);
  self->_lightRoot = (VFXNode *)objc_msgSend_node(VFXNode, v13, v14, v15);
  self->_cameraRoot = (VFXNode *)objc_msgSend_node(VFXNode, v16, v17, v18);
  self->_effectRoot = (VFXNode *)objc_msgSend_node(VFXNode, v19, v20, v21);
  long long v332 = 0u;
  long long v333 = 0u;
  long long v330 = 0u;
  long long v331 = 0u;
  long long v329 = 0u;
  sub_1B6459EB8((uint64_t)&v329, 3u);
  uint64_t v23 = sub_1B6459150((uint64_t *)&v329, v22);
  uint64_t v26 = (VFXNode *)objc_msgSend_nodeWithModel_(VFXNode, v24, (uint64_t)v23, v25);
  self->_cameraTarget = v26;
  objc_msgSend_setHidden_(v26, v27, 1, v28);
  if ((void)v332)
  {
    *((void *)&v332 + 1) = v332;
    operator delete((void *)v332);
  }
  if (*((void *)&v330 + 1))
  {
    *(void *)&long long v331 = *((void *)&v330 + 1);
    operator delete(*((void **)&v330 + 1));
  }
  if ((void)v329)
  {
    *((void *)&v329 + 1) = v329;
    operator delete((void *)v329);
  }
  self->_forceFieldsRoot = (VFXNode *)objc_msgSend_node(VFXNode, v29, v30, v31);
  self->_pointsOfViewRoot = (VFXNode *)objc_msgSend_node(VFXNode, v32, v33, v34);
  v38 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v35, v36, v37);
  self->_grid = v38;
  objc_msgSend_setHidden_(v38, v39, 1, v40);
  objc_msgSend_setEulerAngles_(self->_grid, v41, v42, v43);
  objc_msgSend_setRenderingOrder_(self->_grid, v44, 0x7FFFFFFFLL, v45);
  LODWORD(v46) = 1148846080;
  LODWORD(v47) = 1148846080;
  v51 = objc_msgSend_planeWithWidth_height_(VFXParametricModel, v48, v49, v50, v46, v47);
  Material = objc_msgSend_firstMaterial(v51, v52, v53, v54);
  objc_msgSend_setShadingModel_(Material, v56, 2, v57);
  v61 = objc_msgSend_firstMaterial(v51, v58, v59, v60);
  objc_msgSend_setBlendMode_(v61, v62, 1, v63);
  v67 = objc_msgSend_firstMaterial(v51, v64, v65, v66);
  objc_msgSend_setDoubleSided_(v67, v68, 1, v69);
  v73 = objc_msgSend_firstMaterial(v51, v70, v71, v72);
  objc_msgSend_setWritesToDepthBuffer_(v73, v74, 0, v75);
  v76 = sub_1B6602C1C(@"CFX-Grid.metal");
  v335 = @"VFXShaderModifierEntryPointFragment";
  v336[0] = v76;
  uint64_t v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v77, (uint64_t)v336, (uint64_t)&v335, 1);
  v82 = objc_msgSend_firstMaterial(v51, v79, v80, v81);
  objc_msgSend_setShaderModifiers_(v82, v83, v78, v84);
  objc_msgSend_setModel_(self->_grid, v85, (uint64_t)v51, v86);
  objc_msgSend_setName_(self->_layerRoot, v87, @"_layerRoot", v88);
  objc_msgSend_setName_(self->_overlayLayerRoot, v89, @"_overlayLayerRoot", v90);
  objc_msgSend_setName_(self->_lightRoot, v91, @"_lightRoot", v92);
  objc_msgSend_setName_(self->_cameraRoot, v93, @"_cameraRoot", v94);
  objc_msgSend_setName_(self->_effectRoot, v95, @"_effectRoot", v96);
  objc_msgSend_setName_(self->_forceFieldsRoot, v97, @"_forceFieldRoot", v98);
  objc_msgSend_setName_(self->_pointsOfViewRoot, v99, @"_pointsOfViewRoot", v100);
  self->_paleGreen = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v101, (uint64_t)&unk_1B6E50660, v102);
  self->_paleBlue = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v103, (uint64_t)&unk_1B6E50670, v104);
  self->_red = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v105, (uint64_t)&unk_1B6E50680, v106);
  self->_green = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v107, (uint64_t)&unk_1B6E50690, v108);
  self->_blue = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v109, (uint64_t)&unk_1B6E506A0, v110);
  self->_cyan = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v111, (uint64_t)&unk_1B6E506B0, v112);
  self->_yellow = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v113, (uint64_t)&unk_1B6E506C0, v114);
  self->_orange = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v115, (uint64_t)&unk_1B6E506D0, v116);
  self->_pink = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v117, (uint64_t)&unk_1B6E506E0, v118);
  self->_grayLight = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v119, (uint64_t)&unk_1B6E506F0, v120);
  self->_grayMedium = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v121, (uint64_t)&unk_1B6E50700, v122);
  self->_grayDark = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v123, (uint64_t)&unk_1B6E50710, v124);
  self->_white = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v125, (uint64_t)&unk_1B6E50720, v126);
  objc_msgSend_setIsAuthoring_(self->_layerRoot, v127, 1, v128);
  objc_msgSend_setIsAuthoring_(self->_overlayLayerRoot, v129, 1, v130);
  objc_msgSend_setIsAuthoring_(self->_lightRoot, v131, 1, v132);
  objc_msgSend_setIsAuthoring_(self->_cameraRoot, v133, 1, v134);
  objc_msgSend_setIsAuthoring_(self->_effectRoot, v135, 1, v136);
  objc_msgSend_setIsAuthoring_(self->_forceFieldsRoot, v137, 1, v138);
  objc_msgSend_setIsAuthoring_(self->_cameraTarget, v139, 1, v140);
  objc_msgSend_setIsAuthoring_(self->_pointsOfViewRoot, v141, 1, v142);
  objc_msgSend_setIsAuthoring_(self->_grid, v143, 1, v144);
  objc_msgSend_setHidden_(self->_lightRoot, v145, 0, v146);
  objc_msgSend_setHidden_(self->_cameraRoot, v147, 0, v148);
  objc_msgSend_setHidden_(self->_effectRoot, v149, 0, v150);
  objc_msgSend_setHidden_(self->_forceFieldsRoot, v151, 0, v152);
  objc_msgSend_setRootNode_forLayer_(a3, v153, (uint64_t)self->_layerRoot, 1);
  objc_msgSend_setRootNode_forLayer_(a3, v154, (uint64_t)self->_overlayLayerRoot, 2);
  objc_msgSend_addChildNode_(self->_layerRoot, v155, (uint64_t)self->_lightRoot, v156);
  objc_msgSend_addChildNode_(self->_layerRoot, v157, (uint64_t)self->_cameraRoot, v158);
  objc_msgSend_addChildNode_(self->_layerRoot, v159, (uint64_t)self->_effectRoot, v160);
  objc_msgSend_addChildNode_(self->_layerRoot, v161, (uint64_t)self->_forceFieldsRoot, v162);
  objc_msgSend_addChildNode_(self->_layerRoot, v163, (uint64_t)self->_cameraTarget, v164);
  objc_msgSend_addChildNode_(self->_layerRoot, v165, (uint64_t)self->_pointsOfViewRoot, v166);
  objc_msgSend_addChildNode_(self->_layerRoot, v167, (uint64_t)self->_grid, v168);
  v317 = objc_msgSend_rootNode(a3, v169, v170, v171);
  objc_msgSend_begin(VFXTransaction, v172, v173, v174);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v175, v176, v177, 0.0);
  uint64_t v181 = objc_msgSend_worldRef(a3, v178, v179, v180);
  v328[0] = MEMORY[0x1E4F143A8];
  v328[1] = 3221225472;
  v328[2] = sub_1B640A19C;
  v328[3] = &unk_1E61416C8;
  v328[4] = self;
  v328[5] = v181;
  objc_msgSend_enumerateChildNodesUsingBlock_(v317, v182, (uint64_t)v328, v183);
  objc_msgSend_commit(VFXTransaction, v184, v185, v186);
  uint64_t v334 = objc_msgSend_rootNode(a3, v187, v188, v189);
  v191 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v190, (uint64_t)&v334, 1);
  VFXNodeGetBoundingSphere(v191, (const char *)0x10000, v192, v193);
  float32x4_t v326 = v194;
  objc_msgSend_localUp(VFXNode, v195, v196, v197);
  float32x4_t v324 = v198;
  objc_msgSend_localRight(VFXNode, v199, v200, v201);
  float32x4_t v323 = v202;
  objc_msgSend_localFront(VFXNode, v203, v204, v205);
  uint64_t v210 = 0;
  if (v326.f32[3] <= 0.0) {
    float v211 = 1.0;
  }
  else {
    float v211 = v326.f32[3] * 1.33;
  }
  float32x4_t v212 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  float32x4_t v213 = (float32x4_t)vdupq_n_s32(0xC47A0000);
  *(void *)&double v322 = vmlaq_f32(v326, v212, v209).u64[0];
  *(void *)&double v321 = vmlaq_f32(v326, v213, v209).u64[0];
  *(void *)&double v320 = vmlaq_f32(v326, v212, v323).u64[0];
  *(void *)&double v319 = vmlaq_f32(v326, v213, v323).u64[0];
  *(void *)&double v318 = vmlaq_f32(v326, v213, v324).u64[0];
  *(void *)&double v327 = vmlaq_f32(v326, v212, v324).u64[0];
  do
  {
    v214 = objc_msgSend_camera(VFXCamera, v206, v207, v208);
    v215 = off_1E61416E8[v210];
    uint64_t v218 = objc_msgSend_stringWithFormat_(NSString, v216, @"_authoringCamera%s", v217, v215);
    objc_msgSend_setName_(v214, v219, v218, v220);
    objc_msgSend_setUsesOrthographicProjection_(v214, v221, v210 != 0, v222);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v214, v223, 1, v224);
    *(float *)&double v225 = v211;
    objc_msgSend_setOrthographicScale_(v214, v226, v227, v228, v225);
    v232 = objc_msgSend_node(VFXNode, v229, v230, v231);
    objc_msgSend_setCamera_(v232, v233, (uint64_t)v214, v234);
    uint64_t v237 = objc_msgSend_stringWithUTF8String_(NSString, v235, (uint64_t)v215, v236);
    objc_msgSend_setName_(v232, v238, v237, v239);
    objc_msgSend_setIsAuthoring_(v232, v240, 1, v241);
    objc_msgSend_setAuthoringCameraType_(v232, v242, v210, v243);
    switch((int)v210)
    {
      case 0:
        v247 = objc_msgSend_camera(v232, v244, v245, v246);
        LODWORD(v248) = 1036831949;
        objc_msgSend_setZNear_(v247, v249, v250, v251, v248);
        world = self->_world;
        if (world
          && (sub_1B64B0C28((uint64_t)world, v252, v253, v254, v255, v256, v257, v258),
              v266 = (const void *)sub_1B63DF96C((__n128 *)self->_world, 1, v260, v261, v262, v263, v264, v265),
              sub_1B64B0CB4((uint64_t)self->_world, v267, v268, v269, v270, v271, v272, v273),
              v266))
        {
          v276 = objc_msgSend_nodeWithNodeRef_(VFXNode, v274, (uint64_t)v266, v275);
          objc_msgSend_transform(v276, v277, v278, v279);
          objc_msgSend_setTransform_(v232, v280, v281, v282);
          CFRelease(v266);
        }
        else
        {
          uint64_t v301 = objc_opt_class();
          v303 = objc_msgSend_childNodesWithAttribute_recursively_(v317, v302, v301, 1);
          Object = objc_msgSend_firstObject(v303, v304, v305, v306);
          if (Object)
          {
            objc_msgSend_transform(Object, v308, v309, v310);
            objc_msgSend_setTransform_(v232, v311, v312, v313);
          }
          else
          {
            objc_msgSend_setEulerAngles_(v232, v308, v309, v310, 0.000707015742);
            objc_msgSend_setPosition_(v232, v314, v315, v316, 0.11150004);
          }
        }
        break;
      case 1:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, COERCE_DOUBLE(3217625051));
        objc_msgSend_setWorldPosition_(v232, v283, v284, v285, v327);
        break;
      case 2:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, COERCE_DOUBLE(1070141403));
        objc_msgSend_setWorldPosition_(v232, v286, v287, v288, v318);
        break;
      case 3:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, -0.195796371);
        objc_msgSend_setWorldPosition_(v232, v289, v290, v291, v319);
        break;
      case 4:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, 0.195796371);
        objc_msgSend_setWorldPosition_(v232, v292, v293, v294, v320);
        break;
      case 5:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, 0.0);
        objc_msgSend_setWorldPosition_(v232, v295, v296, v297, v321);
        break;
      case 6:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, -50.1238708);
        objc_msgSend_setWorldPosition_(v232, v298, v299, v300, v322);
        break;
      default:
        break;
    }
    objc_msgSend_addChildNode_(self->_pointsOfViewRoot, v244, (uint64_t)v232, v246);
    ++v210;
  }
  while (v210 != 7);
}

- (unsigned)debugOptions
{
  uint64_t v4 = objc_msgSend__engineContext(self->_renderer, a2, v2, v3);
  if (v4)
  {
    LODWORD(v4) = sub_1B6446228(v4);
  }
  return v4;
}

- (BOOL)hasDebugOption:(unsigned int)a3
{
  return (a3 & ~objc_msgSend_debugOptions(self, a2, *(uint64_t *)&a3, v3)) == 0;
}

- (id)authoringCameraNodes
{
  return (id)objc_msgSend_childNodes(self->_pointsOfViewRoot, a2, v2, v3);
}

- (VFXManipulator)manipulator
{
  return self->_manipulator;
}

- (id)geometryForLightType:(int)a3
{
  if (a3 == 4) {
    return 0;
  }
  lightGeometry = self->_lightGeometry;
  if (!lightGeometry)
  {
    *(_OWORD *)__p = 0u;
    long long v23 = 0u;
    *(_OWORD *)uint64_t v20 = 0u;
    long long v21 = 0u;
    *(_OWORD *)uint64_t v19 = 0u;
    sub_1B6459EB8((uint64_t)v19, 3u);
    self->_lightGeometry = (VFXModel *)sub_1B6459150((uint64_t *)v19, v7);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v20[1])
    {
      *(void **)&long long v21 = v20[1];
      operator delete(v20[1]);
    }
    if (v19[0])
    {
      v19[1] = v19[0];
      operator delete(v19[0]);
    }
    lightGeometry = self->_lightGeometry;
  }
  uint64_t v8 = objc_msgSend_copy(lightGeometry, a2, *(uint64_t *)&a3, v3);
  Material = objc_msgSend_firstMaterial(self->_lightGeometry, v9, v10, v11);
  id v16 = (id)objc_msgSend_copy(Material, v13, v14, v15);
  objc_msgSend_setFirstMaterial_(v8, v17, (uint64_t)v16, v18);
  return v8;
}

- (void)addLightNode:(__CFXNode *)a3
{
  if (CFDictionaryContainsKey(self->_lightsDictionary, a3))
  {
    sub_1B63F2F54(16, @"Error: light node already has an authoring node - skip", v6, v7, v8, v9, v10, v11, v35);
  }
  else
  {
    CFDictionaryRef v12 = sub_1B649F640((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v20 = sub_1B6496680((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    uint64_t v23 = objc_msgSend_geometryForLightType_(self, v21, v20, v22);
    uint64_t v26 = objc_msgSend_nodeWithModel_(VFXNode, v24, v23, v25);
    objc_msgSend_setName_(v26, v27, @"lightAuth", v28);
    sub_1B640A430(v26, (char *)a3, v29, v30);
    objc_msgSend_addChildNode_(self->_lightRoot, v31, (uint64_t)v26, v32);
    lightsDictionary = self->_lightsDictionary;
    CFDictionaryAddValue(lightsDictionary, a3, v26);
  }
}

- (id)effectGeometry
{
  effectGeometry = self->_effectGeometry;
  if (!effectGeometry)
  {
    *(_OWORD *)__p = 0u;
    long long v29 = 0u;
    *(_OWORD *)uint64_t v26 = 0u;
    long long v27 = 0u;
    *(_OWORD *)uint64_t v25 = 0u;
    long long v20 = 0u;
    sub_1B6459850((uint64_t)v25, (float32x4_t *)&v20, &xmmword_1B6E50720, MEMORY[0x1E4F149A0], 0.1, 0.6);
    long long v20 = xmmword_1B6E50230;
    long long v21 = xmmword_1B6E50240;
    long long v22 = xmmword_1B6E4F2E0;
    long long v19 = xmmword_1B6E4F370;
    long long v23 = xmmword_1B6E4F370;
    float32x4_t v24 = 0u;
    sub_1B6459850((uint64_t)v25, &v24, &xmmword_1B6E50720, (float32x4_t *)&v20, 0.1, 0.6);
    long long v20 = xmmword_1B6E50250;
    long long v21 = xmmword_1B6E4F320;
    long long v22 = xmmword_1B6E50260;
    long long v23 = xmmword_1B6E4F370;
    float32x4_t v24 = 0u;
    sub_1B6459850((uint64_t)v25, &v24, &xmmword_1B6E50720, (float32x4_t *)&v20, 0.1, 0.6);
    self->_effectGeometry = (VFXModel *)sub_1B6459150((uint64_t *)v25, v6);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v26[1])
    {
      *(void **)&long long v27 = v26[1];
      operator delete(v26[1]);
    }
    if (v25[0])
    {
      v25[1] = v25[0];
      operator delete(v25[0]);
    }
    effectGeometry = self->_effectGeometry;
  }
  uint64_t v7 = objc_msgSend_copy(effectGeometry, a2, v2, v3, v19);
  Material = objc_msgSend_firstMaterial(self->_effectGeometry, v8, v9, v10);
  id v15 = (id)objc_msgSend_copy(Material, v12, v13, v14);
  objc_msgSend_setFirstMaterial_(v7, v16, (uint64_t)v15, v17);
  return v7;
}

- (void)addEffectNode:(__CFXNode *)a3
{
  if (CFDictionaryContainsKey(self->_effectsDictionary, a3))
  {
    sub_1B63F2F54(16, @"Error: effect node already has an authoring node - skip", v6, v7, v8, v9, v10, v11, v32);
  }
  else
  {
    CFDictionaryRef v12 = objc_msgSend_node(VFXNode, v5, v6, v7);
    uint64_t v16 = objc_msgSend_effectGeometry(self, v13, v14, v15);
    long long v19 = objc_msgSend_nodeWithModel_(VFXNode, v17, v16, v18);
    objc_msgSend_setName_(v19, v20, @"particlesAuth", v21);
    sub_1B640A430(v19, (char *)a3, v22, v23);
    objc_msgSend_setIsAuthoring_(v12, v24, 1, v25);
    objc_msgSend_addChildNode_(v12, v26, (uint64_t)v19, v27);
    objc_msgSend_addChildNode_(self->_effectRoot, v28, (uint64_t)v12, v29);
    effectsDictionary = self->_effectsDictionary;
    CFDictionaryAddValue(effectsDictionary, a3, v12);
  }
}

- (id)cameraGeometry
{
  id result = self->_cameraGeometry;
  if (!result)
  {
    id result = sub_1B64594B4();
    self->_cameraGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraFrustumGeometry
{
  id result = self->_cameraFrustumGeometry;
  if (!result)
  {
    id result = sub_1B6459A58();
    self->_cameraFrustumGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraOrthographicFrustumGeometry
{
  id result = self->_cameraOrthographicFrustumGeometry;
  if (!result)
  {
    id result = sub_1B6459BBC();
    self->_cameraOrthographicFrustumGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraNearPlaneGeometry
{
  id result = self->_cameraNearPlaneGeometry;
  if (!result)
  {
    id result = sub_1B6459C68();
    self->_cameraNearPlaneGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraFocusPlaneGeometry
{
  id result = self->_cameraFocusPlaneGeometry;
  if (!result)
  {
    id result = sub_1B6459D38();
    self->_cameraFocusPlaneGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)fieldGeometry
{
  id result = self->_fieldGeometry;
  if (!result)
  {
    id result = sub_1B6459E08();
    self->_fieldGeometry = (VFXModel *)result;
  }
  return result;
}

- (void)addCameraNode:(__CFXNode *)a3
{
  if (!CFDictionaryContainsKey(self->_camerasDictionary, a3) && !sub_1B64A4DAC((uint64_t)a3))
  {
    CFDictionaryRef v12 = (void *)sub_1B64A1954((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    if ((!v12 || objc_msgSend_compare_(v12, v13, @"kVFXFreeViewCameraName", v14))
      && (sub_1B64A4DD8((uint64_t)a3) & 1) == 0)
    {
      uint64_t v18 = objc_msgSend_cameraGeometry(self, v15, v16, v17);
      uint64_t v21 = objc_msgSend_nodeWithModel_(VFXNode, v19, v18, v20);
      objc_msgSend_setName_(v21, v22, @"cameraAuth", v23);
      sub_1B640A430(v21, (char *)a3, v24, v25);
      CFDictionaryRef v33 = sub_1B64A3B48((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
      if (sub_1B649BEB8((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40)) {
        uint64_t v44 = objc_msgSend_cameraOrthographicFrustumGeometry(self, v41, v42, v43);
      }
      else {
        uint64_t v44 = objc_msgSend_cameraFrustumGeometry(self, v41, v42, v43);
      }
      double v47 = objc_msgSend_nodeWithModel_(VFXNode, v45, v44, v46);
      objc_msgSend_setName_(v47, v48, @"cameraFrustumAuth", v49);
      objc_msgSend_setIsAuthoring_(v47, v50, 1, v51);
      objc_msgSend_setHittable_(v47, v52, 0, v53);
      uint64_t v57 = objc_msgSend_cameraNearPlaneGeometry(self, v54, v55, v56);
      uint64_t v60 = objc_msgSend_nodeWithModel_(VFXNode, v58, v57, v59);
      objc_msgSend_setName_(v60, v61, @"cameraNearPlaneAuth", v62);
      objc_msgSend_setIsAuthoring_(v60, v63, 1, v64);
      objc_msgSend_setHittable_(v60, v65, 0, v66);
      uint64_t v70 = objc_msgSend_cameraFocusPlaneGeometry(self, v67, v68, v69);
      v73 = objc_msgSend_nodeWithModel_(VFXNode, v71, v70, v72);
      objc_msgSend_setName_(v73, v74, @"cameraFocusPlaneAuth", v75);
      objc_msgSend_setIsAuthoring_(v73, v76, 1, v77);
      objc_msgSend_setHittable_(v73, v78, 0, v79);
      objc_msgSend_addChildNode_(self->_cameraRoot, v80, (uint64_t)v21, v81);
      objc_msgSend_addChildNode_(v21, v82, (uint64_t)v47, v83);
      objc_msgSend_addChildNode_(v47, v84, (uint64_t)v60, v85);
      objc_msgSend_addChildNode_(v47, v86, (uint64_t)v73, v87);
      camerasDictionary = self->_camerasDictionary;
      CFDictionaryAddValue(camerasDictionary, a3, v21);
    }
  }
}

- (void)removeCameraNode:(__CFXNode *)a3
{
  Value = (void *)CFDictionaryGetValue(self->_camerasDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  camerasDictionary = self->_camerasDictionary;

  CFDictionaryRemoveValue(camerasDictionary, a3);
}

- (void)addForceFieldNode:(__CFXNode *)a3
{
  if (CFDictionaryContainsKey(self->_forceFieldsDictionary, a3))
  {
    sub_1B63F2F54(16, @"Error: forceField node already has an authoring node - skip", v6, v7, v8, v9, v10, v11, v24);
  }
  else
  {
    uint64_t v12 = objc_msgSend_fieldGeometry(self, v5, v6, v7);
    uint64_t v15 = objc_msgSend_nodeWithModel_(VFXNode, v13, v12, v14);
    objc_msgSend_setName_(v15, v16, @"fieldAuth", v17);
    sub_1B640A430(v15, (char *)a3, v18, v19);
    objc_msgSend_addChildNode_(self->_forceFieldsRoot, v20, (uint64_t)v15, v21);
    forceFieldsDictionary = self->_forceFieldsDictionary;
    CFDictionaryAddValue(forceFieldsDictionary, a3, v15);
  }
}

- (void)removeForceFieldNode:(__CFXNode *)a3
{
  Value = (void *)CFDictionaryGetValue(self->_forceFieldsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  forceFieldsDictionary = self->_forceFieldsDictionary;

  CFDictionaryRemoveValue(forceFieldsDictionary, a3);
}

- (void)removeLightNode:(__CFXNode *)a3
{
  Value = (void *)CFDictionaryGetValue(self->_lightsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  lightsDictionary = self->_lightsDictionary;

  CFDictionaryRemoveValue(lightsDictionary, a3);
}

- (void)removeEffectNode:(__CFXNode *)a3
{
  Value = (void *)CFDictionaryGetValue(self->_effectsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  effectsDictionary = self->_effectsDictionary;

  CFDictionaryRemoveValue(effectsDictionary, a3);
}

- (void)addedNode:(__CFXNode *)a3
{
  if (sub_1B64A3964((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7)) {
    objc_msgSend_addLightNode_(self, v10, (uint64_t)a3, v12);
  }
  if (sub_1B64A4A84((uint64_t)a3, (uint64_t)v10, v11, v12, v13, v14, v15, v16)) {
    objc_msgSend_addEffectNode_(self, v17, (uint64_t)a3, v18);
  }
  if (sub_1B64A3BCC((uint64_t)a3)) {
    objc_msgSend_addCameraNode_(self, v19, (uint64_t)a3, v21);
  }
  if (sub_1B64A4888((uint64_t)a3, (uint64_t)v19, v20, v21, v22, v23, v24, v25))
  {
    MEMORY[0x1F4181798](self, sel_addForceFieldNode_, a3, v26);
  }
}

- (void)removedNode:(__CFXNode *)a3
{
  if (sub_1B64A4DD8((uint64_t)a3))
  {
    if (sub_1B64A3964((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11)) {
      objc_msgSend_removeLightNode_(self, v12, (uint64_t)a3, v14);
    }
    if (sub_1B64A4A84((uint64_t)a3, (uint64_t)v12, v13, v14, v15, v16, v17, v18)) {
      objc_msgSend_removeEffectNode_(self, v19, (uint64_t)a3, v20);
    }
    if (sub_1B64A3BCC((uint64_t)a3)) {
      objc_msgSend_removeCameraNode_(self, v21, (uint64_t)a3, v23);
    }
    if (sub_1B64A4888((uint64_t)a3, (uint64_t)v21, v22, v23, v24, v25, v26, v27))
    {
      MEMORY[0x1F4181798](self, sel_removeForceFieldNode_, a3, v28);
    }
  }
}

- (void)selectNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  objc_msgSend_removeAllObjects(self->_selection, v5, v6, v7);
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v20, (uint64_t)v24, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(a3);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((objc_msgSend_isAuthoring(v15, v9, v10, v11) & 1) == 0)
          {
            selection = self->_selection;
            uint64_t v17 = objc_msgSend_nodeRef(v15, v9, v10, v11);
            objc_msgSend_addObject_(selection, v18, v17, v19);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v20, (uint64_t)v24, 16);
      }
      while (v12);
    }
  }
  objc_sync_exit(self);
}

- (void)cancelSelection
{
  objc_sync_enter(self);
  objc_msgSend_removeAllObjects(self->_selection, v3, v4, v5);

  objc_sync_exit(self);
}

- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5
{
  objc_msgSend_removeAllChilds(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v9 = NSNumber;
  uint64_t v17 = sub_1B6496680((uint64_t)a5, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_numberWithInt_(v9, v18, v17, v19);
  objc_msgSend_setValue_forKey_(a3, v21, v20, @"VFXDebugLightTypeKey");
  objc_msgSend_setValue_forKey_(a3, v22, 0, @"VFXDebugLightSubTypeKey");
  int v30 = sub_1B6496680((uint64_t)a5, v23, v24, v25, v26, v27, v28, v29);
  if (!v30) {
    return;
  }
  if (v30 == 1)
  {
    *(_OWORD *)__p = 0u;
    long long v283 = 0u;
    *(_OWORD *)v280 = 0u;
    long long v281 = 0u;
    *(_OWORD *)uint64_t v279 = 0u;
    sub_1B6459EB8((uint64_t)v279, 3u);
    uint64_t v39 = sub_1B6459150((uint64_t *)v279, v38);
    uint64_t v42 = objc_msgSend_nodeWithModel_(VFXNode, v40, (uint64_t)v39, v41);
    objc_msgSend_setName_(v42, v43, @"lightInnerAuth", v44);
    objc_msgSend_setIsAuthoring_(v42, v45, 1, v46);
    objc_msgSend_setHittable_(v42, v47, 0, v48);
    objc_msgSend_addChildNode_(a3, v49, (uint64_t)v42, v50);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&long long v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    *(_OWORD *)__p = 0u;
    long long v283 = 0u;
    *(_OWORD *)v280 = 0u;
    long long v281 = 0u;
    *(_OWORD *)uint64_t v279 = 0u;
    sub_1B6459EB8((uint64_t)v279, 3u);
    v52 = sub_1B6459150((uint64_t *)v279, v51);
    uint64_t v55 = objc_msgSend_nodeWithModel_(VFXNode, v53, (uint64_t)v52, v54);
    objc_msgSend_setName_(v55, v56, @"lightOuterAuth", v57);
    objc_msgSend_setIsAuthoring_(v55, v58, 1, v59);
    objc_msgSend_setHittable_(v55, v60, 0, v61);
    objc_msgSend_addChildNode_(a3, v62, (uint64_t)v55, v63);
LABEL_18:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&long long v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    return;
  }
  if ((v30 & 0xFFFFFFFB) == 2)
  {
    *(_OWORD *)__p = 0u;
    long long v283 = 0u;
    *(_OWORD *)v280 = 0u;
    long long v281 = 0u;
    *(_OWORD *)uint64_t v279 = 0u;
    sub_1B645A758((uint64_t)v279, &xmmword_1B6E506D0);
    uint64_t v65 = sub_1B64592FC((uint64_t *)v279, v64);
    uint64_t v68 = objc_msgSend_nodeWithModel_(VFXNode, v66, (uint64_t)v65, v67);
    objc_msgSend_setName_(v68, v69, @"lightArrowAuth", v70);
    objc_msgSend_setIsAuthoring_(v68, v71, 1, v72);
    objc_msgSend_setEulerAngles_(v68, v73, v74, v75, COERCE_DOUBLE(1078530011));
    __asm { FMOV            V0.4S, #10.0 }
    objc_msgSend_setScale_(v68, v81, v82, v83, *(double *)&_Q0);
    objc_msgSend_setHittable_(v68, v84, 0, v85);
    objc_msgSend_addChildNode_(a3, v86, (uint64_t)v68, v87);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&long long v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    *(_OWORD *)__p = 0u;
    long long v283 = 0u;
    *(_OWORD *)v280 = 0u;
    long long v281 = 0u;
    *(_OWORD *)uint64_t v279 = 0u;
    v276[0] = 0u;
    sub_1B6459620((uint64_t)v279, v276, &xmmword_1B6E506D0, (float32x4_t)xmmword_1B6E502B0);
    v89 = sub_1B6459150((uint64_t *)v279, v88);
    uint64_t v92 = objc_msgSend_nodeWithModel_(VFXNode, v90, (uint64_t)v89, v91);
    objc_msgSend_setPivot_(v92, v93, v94, v95, COERCE_DOUBLE(1065353216), unk_1B6E50300, 0.0, unk_1B6E50320);
    objc_msgSend_setName_(v92, v96, @"lightShadowAuth", v97);
    objc_msgSend_setIsAuthoring_(v92, v98, 1, v99);
    objc_msgSend_setHittable_(v92, v100, 0, v101);
    objc_msgSend_addChildNode_(a3, v102, (uint64_t)v92, v103);
    goto LABEL_18;
  }
  switch(v30)
  {
    case 5:
      long long v277 = 0u;
      memset(v276, 0, sizeof(v276));
      *(void *)&double v113 = sub_1B6497104((uint64_t)a5, v32, v33, v34, v35, v36, v37, (uint64_t)v276).n128_u64[0];
      uint64_t v116 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v114, v276[0].u8[0], v115, v113);
      objc_msgSend_setValue_forKey_(a3, v117, v116, @"VFXDebugLightSubTypeKey");
      switch(v276[0].i8[0])
      {
        case 0:
          *(_OWORD *)__p = 0u;
          long long v283 = 0u;
          *(_OWORD *)v280 = 0u;
          long long v281 = 0u;
          *(_OWORD *)uint64_t v279 = 0u;
          long long v274 = xmmword_1B6E4F300;
          long long v275 = xmmword_1B6E4F310;
          sub_1B645A398((uint64_t)v279, &v275, &v274, &xmmword_1B6E506D0, &xmmword_1B6E506D0);
          v121 = sub_1B6459150((uint64_t *)v279, v120);
          goto LABEL_67;
        case 1:
          *(_OWORD *)__p = 0u;
          long long v283 = 0u;
          *(_OWORD *)v280 = 0u;
          long long v281 = 0u;
          *(_OWORD *)uint64_t v279 = 0u;
          long long v274 = xmmword_1B6E4F490;
          long long v275 = xmmword_1B6E50270;
          long long v272 = xmmword_1B6E50290;
          long long v273 = xmmword_1B6E50280;
          sub_1B645A444((uint64_t)v279, &v275, &v274, &v273, &v272, &xmmword_1B6E506D0);
          v121 = sub_1B6459150((uint64_t *)v279, v252);
          goto LABEL_67;
        case 2:
          *(_OWORD *)__p = 0u;
          long long v283 = 0u;
          *(_OWORD *)v280 = 0u;
          long long v281 = 0u;
          *(_OWORD *)uint64_t v279 = 0u;
          sub_1B645A01C((uint64_t)v279, &xmmword_1B6E506D0, (int32x2_t)COERCE_UNSIGNED_INT(1.0));
          v121 = sub_1B6459150((uint64_t *)v279, v253);
          goto LABEL_67;
        case 3:
          *(_OWORD *)__p = 0u;
          long long v283 = 0u;
          *(_OWORD *)v280 = 0u;
          long long v281 = 0u;
          *(_OWORD *)uint64_t v279 = 0u;
          sub_1B6459EB8((uint64_t)v279, 3u);
          v121 = sub_1B6459150((uint64_t *)v279, v254);
          goto LABEL_67;
        case 4:
          *(_OWORD *)__p = 0u;
          long long v283 = 0u;
          *(_OWORD *)v280 = 0u;
          long long v281 = 0u;
          *(_OWORD *)uint64_t v279 = 0u;
          uint64_t v255 = v277;
          if ((_BYTE)v277)
          {
            uint64_t v256 = 0;
            int v257 = v277 - 1;
            do
            {
              if (v257 == v256) {
                unsigned int v258 = 0;
              }
              else {
                unsigned int v258 = v256 + 1;
              }
              *(float *)&unint64_t v259 = -COERCE_FLOAT(*(void *)(*((void *)&v277 + 1) + 8 * v256));
              HIDWORD(v259) = HIDWORD(*(void *)(*((void *)&v277 + 1) + 8 * v256));
              HIDWORD(v260) = 0;
              *(float *)&long long v260 = -COERCE_FLOAT(*(void *)(*((void *)&v277 + 1) + 8 * v258));
              *(void *)((char *)&v260 + 4) = HIDWORD(*(void *)(*((void *)&v277 + 1) + 8 * v258));
              long long v274 = v260;
              long long v275 = v259;
              sub_1B645A398((uint64_t)v279, &v275, &v274, &xmmword_1B6E506D0, &xmmword_1B6E506D0);
              ++v256;
            }
            while (v255 != v256);
          }
          v121 = sub_1B6459150((uint64_t *)v279, v118);
LABEL_67:
          uint64_t v261 = (uint64_t)v121;
          sub_1B640A148((uint64_t)v279);
          v249 = objc_msgSend_nodeWithModel_(VFXNode, v262, v261, v263);
          break;
        default:
          v249 = objc_msgSend_nodeWithModel_(VFXNode, v118, 0, v119);
          break;
      }
      uint64_t v264 = v249;
      objc_msgSend_setName_(v249, v250, @"lightAreaAuth", v251);
      objc_msgSend_setIsAuthoring_(v264, v265, 1, v266);
      uint64_t v267 = sub_1B6583674((id *)a4);
      objc_msgSend_setAuthoringTargetNode_(v264, v268, (uint64_t)v267, v269);
      objc_msgSend_addChildNode_(a3, v270, (uint64_t)v264, v271);
      break;
    case 4:
      LODWORD(v122) = dword_1B6E502C0[sub_1B64975FC((uint64_t)a5, (uint64_t)v31, v32, v33, v34, v35, v36, v37) == 1];
      uint64_t v126 = objc_msgSend_sphereWithRadius_(VFXParametricModel, v123, v124, v125, v122);
      objc_msgSend_setName_(v126, v127, @"probeGeometry", v128);
      *(_OWORD *)__p = 0u;
      long long v283 = 0u;
      *(_OWORD *)v280 = 0u;
      long long v281 = 0u;
      *(_OWORD *)uint64_t v279 = 0u;
      v276[0] = 0u;
      __asm { FMOV            V0.4S, #1.0 }
      sub_1B6459620((uint64_t)v279, v276, &xmmword_1B6E50720, _Q0);
      v131 = sub_1B6459150((uint64_t *)v279, v130);
      uint64_t v134 = objc_msgSend_nodeWithModel_(VFXNode, v132, (uint64_t)v131, v133);
      objc_msgSend_setName_(v134, v135, @"lightInnerAuth", v136);
      objc_msgSend_setIsAuthoring_(v134, v137, 1, v138);
      objc_msgSend_setHittable_(v134, v139, 0, v140);
      objc_msgSend_addChildNode_(a3, v141, (uint64_t)v134, v142);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v280[1])
      {
        *(void **)&long long v281 = v280[1];
        operator delete(v280[1]);
      }
      if (v279[0])
      {
        v279[1] = v279[0];
        operator delete(v279[0]);
      }
      *(_OWORD *)__p = 0u;
      long long v283 = 0u;
      *(_OWORD *)v280 = 0u;
      long long v281 = 0u;
      *(_OWORD *)uint64_t v279 = 0u;
      v276[0] = 0u;
      __asm { FMOV            V0.4S, #1.0 }
      sub_1B6459620((uint64_t)v279, v276, &xmmword_1B6E50720, _Q0);
      v145 = sub_1B6459150((uint64_t *)v279, v144);
      uint64_t v148 = objc_msgSend_nodeWithModel_(VFXNode, v146, (uint64_t)v145, v147);
      objc_msgSend_setName_(v148, v149, @"lightOuterAuth", v150);
      objc_msgSend_setIsAuthoring_(v148, v151, 1, v152);
      objc_msgSend_setHittable_(v148, v153, 0, v154);
      objc_msgSend_addChildNode_(a3, v155, (uint64_t)v148, v156);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v280[1])
      {
        *(void **)&long long v281 = v280[1];
        operator delete(v280[1]);
      }
      if (v279[0])
      {
        v279[1] = v279[0];
        operator delete(v279[0]);
      }
      if (sub_1B64975FC((uint64_t)a5, v157, v158, v159, v160, v161, v162, v163))
      {
        *(_OWORD *)__p = 0u;
        long long v283 = 0u;
        *(_OWORD *)v280 = 0u;
        long long v281 = 0u;
        *(_OWORD *)uint64_t v279 = 0u;
        v276[0] = 0u;
        __asm { FMOV            V0.4S, #1.0 }
        sub_1B6459620((uint64_t)v279, v276, &xmmword_1B6E50680, _Q0);
        uint64_t v173 = sub_1B6459150((uint64_t *)v279, v172);
        uint64_t v176 = objc_msgSend_nodeWithModel_(VFXNode, v174, (uint64_t)v173, v175);
        objc_msgSend_setName_(v176, v177, @"lightProbeExtents", v178);
        objc_msgSend_setIsAuthoring_(v176, v179, 1, v180);
        objc_msgSend_setHittable_(v176, v181, 0, v182);
        objc_msgSend_addChildNode_(a3, v183, (uint64_t)v176, v184);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v280[1])
        {
          *(void **)&long long v281 = v280[1];
          operator delete(v280[1]);
        }
        if (v279[0])
        {
          v279[1] = v279[0];
          operator delete(v279[0]);
        }
        Material = objc_msgSend_firstMaterial(v126, v185, v186, v187);
        objc_msgSend_setColorBufferWriteMask_(Material, v189, 0, v190);
      }
      else
      {
        uint64_t v193 = sub_1B6497530((uint64_t)a5, v164, v165, v166, v167, v168, v169, v170);
        white = self->_white;
        float32x4_t v198 = objc_msgSend_material(v126, v195, v196, v197);
        float32x4_t v202 = objc_msgSend_diffuse(v198, v199, v200, v201);
        objc_msgSend_setColor_(v202, v203, (uint64_t)white, v204);
        uint64_t v208 = objc_msgSend_material(v126, v205, v206, v207);
        objc_msgSend_setShadingModel_(v208, v209, 2, v210);
        if (v193)
        {
          float32x4_t v212 = objc_msgSend_program(VFXProgram, v191, v211, v192);
          v216 = objc_msgSend__renderContextMetal(self->_renderer, v213, v214, v215);
          uint64_t v220 = objc_msgSend_resourceManager(v216, v217, v218, v219);
          v221 = (void *)sub_1B653EFAC(v220);
          uint64_t v225 = objc_msgSend_frameworkLibrary(v221, v222, v223, v224);
          objc_msgSend_setLibrary_(v212, v226, v225, v227);
          objc_msgSend_setVertexFunctionName_(v212, v228, @"vfx_probesphere_from_sh_vertex", v229);
          objc_msgSend_setFragmentFunctionName_(v212, v230, @"vfx_probesphere_from_sh_fragment", v231);
          v278[0] = MEMORY[0x1E4F143A8];
          v278[1] = 3221225472;
          v278[2] = sub_1B640B9B0;
          v278[3] = &unk_1E6141720;
          v278[4] = a5;
          objc_msgSend_handleBindingOfBufferNamed_frequency_usingBlock_(v212, v232, @"sh", 1, v278);
          uint64_t v236 = objc_msgSend_material(v126, v233, v234, v235);
          objc_msgSend_setProgram_(v236, v237, (uint64_t)v212, v238);
        }
      }
      uint64_t v239 = objc_msgSend_nodeWithModel_(VFXNode, v191, (uint64_t)v126, v192);
      objc_msgSend_setName_(v239, v240, @"probe", v241);
      sub_1B640A430(v239, (char *)a4, v242, v243);
      objc_msgSend_setHittable_(v239, v244, 1, v245);
      objc_msgSend_addChildNode_(a3, v246, (uint64_t)v239, v247);
      *(_OWORD *)__p = 0u;
      long long v283 = 0u;
      *(_OWORD *)v280 = 0u;
      long long v281 = 0u;
      *(_OWORD *)uint64_t v279 = 0u;
      sub_1B6459EB8((uint64_t)v279, 3u);
      sub_1B6459150((uint64_t *)v279, v248);
      goto LABEL_18;
    case 3:
      uint64_t v104 = objc_msgSend_node(VFXNode, v31, v32, v33);
      objc_msgSend_setName_(v104, v105, @"lightSpotAuth", v106);
      objc_msgSend_setIsAuthoring_(v104, v107, 1, v108);
      objc_msgSend_setHittable_(v104, v109, 0, v110);
      objc_msgSend_addChildNode_(a3, v111, (uint64_t)v104, v112);
      break;
  }
}

- (BOOL)_isPartOfSelection:(__CFXNode *)a3
{
  uint64_t v4 = (uint64_t)a3;
  if (objc_msgSend_count(self->_selection, a2, (uint64_t)a3, v3)) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 0;
  }
  do
  {
    char v9 = objc_msgSend_containsObject_(self->_selection, v6, v4, v7);
    if (v9) {
      break;
    }
    uint64_t v4 = sub_1B64A1E7C(v4, v10, v11, v12, v13, v14, v15, v16);
  }
  while (v4);
  return v9;
}

- (BOOL)_proximityHidden:(uint64_t)a3
{
  BOOL v8 = objc_msgSend_pointOfView(*(void **)(a1 + 128), a2, a3, a4);
  objc_msgSend_worldPosition(v8, v9, v10, v11);
  float32x4_t v13 = vsubq_f32(v12, a8);
  float32x4_t v14 = vmulq_f32(v13, v13);
  return vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0] < 0.0001;
}

- (void)updateLightTypeForNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5 screenspaceScalingFactor:(float)a6
{
  uint64_t v11 = objc_msgSend_valueForKey_(a3, a2, @"VFXDebugLightTypeKey", (uint64_t)a4);
  int v15 = objc_msgSend_intValue(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_valueForKey_(a3, v16, @"VFXDebugLightSubTypeKey", v17);
  long long v21 = objc_msgSend_valueForKey_(a3, v19, @"disabled", v20);
  int v25 = objc_msgSend_BOOLValue(v21, v22, v23, v24);
  uint64_t v26 = self;
  int isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v27, (uint64_t)a4, v28);
  unsigned int v536 = isPartOfSelection ^ 1;
  uint64_t v40 = sub_1B649F390((uint64_t)a4, v29, v30, v31, v32, v33, v34, v35) & (isPartOfSelection ^ 1);
  unsigned int v41 = v25 ^ v40;
  if (v41 == 1)
  {
    uint64_t v42 = objc_msgSend_numberWithBool_(NSNumber, v37, v40, v39);
    objc_msgSend_setValue_forKey_(a3, v43, v42, @"disabled");
  }
  uint64_t v44 = objc_msgSend_childNodes(a3, v37, v38, v39);
  if (objc_msgSend_count(v44, v45, v46, v47)
    && sub_1B6496680((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54) == 4)
  {
    if ((isPartOfSelection | v41))
    {
      unsigned int v41 = 1;
    }
    else
    {
      uint64_t v539 = sub_1B6497530((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54);
      uint64_t v542 = sub_1B6494F20((uint64_t)a5, 0, v55, v56, v57, v58, v59, v60);
      uint64_t v62 = objc_msgSend_childNodeWithName_recursively_(a3, v61, @"probe", 1);
      uint64_t v66 = objc_msgSend_model(v62, v63, v64, v65);
      Material = objc_msgSend_firstMaterial(v66, v67, v68, v69);
      uint64_t v78 = Material;
      if (Material)
      {
        BOOL v535 = objc_msgSend_program(Material, v71, v72, v73) != 0;
        uint64_t v82 = objc_msgSend_reflective(v78, v79, v80, v81);
        LODWORD(v78) = objc_msgSend_contents(v82, v83, v84, v85) != 0;
      }
      else
      {
        BOOL v535 = 0;
      }
      if (sub_1B64975FC((uint64_t)a5, (uint64_t)v71, v72, v73, v74, v75, v76, v77))
      {
        unsigned int v41 = (v542 != 0) ^ v78;
      }
      else if (a5)
      {
        unsigned int v41 = (v539 != 0) ^ v535;
      }
      else
      {
        unsigned int v41 = 0;
      }
    }
  }
  if (sub_1B6496680((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54) == 5)
  {
    *(void *)&double v94 = sub_1B6497104((uint64_t)a5, v87, v88, v89, v90, v91, v92, (uint64_t)v548).n128_u64[0];
    uint64_t v95 = LOBYTE(v548[0]);
    if (objc_msgSend_integerValue(v18, v96, v97, v98, v94) != v95) {
      unsigned int v41 = 1;
    }
  }
  *(float *)&uint64_t v93 = fmaxf(a6, 0.001);
  uint64_t v543 = v93;
  if (sub_1B6496680((uint64_t)a5, v86, v87, v88, v89, v90, v91, v92) != v15 || v41) {
    objc_msgSend__resetLightAuthoringWithContainerNode_source_light_(v26, v99, (uint64_t)a3, (uint64_t)a4, a5);
  }
  v106.i32[1] = HIDWORD(v543);
  *(float *)v106.i32 = 1.0 / *(float *)&v543;
  int32x2_t v540 = v106;
  if (sub_1B6496680((uint64_t)a5, (uint64_t)v99, v100, v101, v102, v103, v104, v105) == 1)
  {
    uint64_t v114 = objc_msgSend_childNodes(a3, v107, v108, v109);
    v117 = objc_msgSend_objectAtIndexedSubscript_(v114, v115, 0, v116);
    objc_msgSend_setScale_(v117, v118, v119, v120, 0.0);
    objc_msgSend_setHidden_(v117, v121, 1, v122);
    uint64_t v126 = objc_msgSend_childNodes(a3, v123, v124, v125);
    v129 = objc_msgSend_objectAtIndexedSubscript_(v126, v127, 1, v128);
    *(float *)v140.i32 = *(float *)v540.i32 * sub_1B6495B40((uint64_t)a5, v130, v131, v132, v133, v134, v135, v136);
    if (*(float *)v140.i32 < 0.0) {
      *(float *)v140.i32 = 0.0;
    }
    double v541 = *(double *)&v140;
    objc_msgSend_setScale_(v129, v137, v138, v139, *(double *)vdupq_lane_s32(v140, 0).i64);
    if (*(float *)&v541 == 0.0) {
      objc_msgSend_setHidden_(v129, v141, 1, v142, v541);
    }
    else {
      objc_msgSend_setHidden_(v129, v141, v536, v142, v541);
    }
    if (sub_1B649F390((uint64_t)a4, v143, v144, v145, v146, v147, v148, v149))
    {
      uint64_t v153 = 280;
      if (isPartOfSelection) {
        uint64_t v153 = 264;
      }
      uint64_t v154 = *(uint64_t *)((char *)&v26->super.isa + v153);
      v155 = objc_msgSend_model(a3, v150, v151, v152);
      uint64_t v159 = objc_msgSend_firstMaterial(v155, v156, v157, v158);
      uint64_t v163 = objc_msgSend_diffuse(v159, v160, v161, v162);
      objc_msgSend_setColor_(v163, v164, v154, v165);
      uint64_t v169 = objc_msgSend_model(v117, v166, v167, v168);
      uint64_t v173 = objc_msgSend_firstMaterial(v169, v170, v171, v172);
      uint64_t v177 = objc_msgSend_diffuse(v173, v174, v175, v176);
      objc_msgSend_setColor_(v177, v178, v154, v179);
    }
    else
    {
      uint64_t v247 = 248;
      if (isPartOfSelection) {
        uint64_t v247 = 264;
      }
      uint64_t v248 = *(uint64_t *)((char *)&v26->super.isa + v247);
      if (isPartOfSelection) {
        uint64_t v249 = 264;
      }
      else {
        uint64_t v249 = 256;
      }
      uint64_t v250 = objc_msgSend_model(a3, v150, v151, v152);
      uint64_t v254 = objc_msgSend_firstMaterial(v250, v251, v252, v253);
      unsigned int v258 = objc_msgSend_diffuse(v254, v255, v256, v257);
      objc_msgSend_setColor_(v258, v259, v248, v260);
      uint64_t v261 = *(uint64_t *)((char *)&v26->super.isa + v249);
      uint64_t v265 = objc_msgSend_model(v117, v262, v263, v264);
      uint64_t v269 = objc_msgSend_firstMaterial(v265, v266, v267, v268);
      long long v273 = objc_msgSend_diffuse(v269, v270, v271, v272);
      objc_msgSend_setColor_(v273, v274, v261, v275);
      uint64_t v154 = *(uint64_t *)((char *)&v26->super.isa + v249);
    }
    v276 = objc_msgSend_model(v129, v180, v181, v182);
LABEL_82:
    v399 = objc_msgSend_firstMaterial(v276, v277, v278, v279);
    v403 = objc_msgSend_diffuse(v399, v400, v401, v402);
    objc_msgSend_setColor_(v403, v404, v154, v405);
    goto LABEL_83;
  }
  int v190 = isPartOfSelection;
  if (sub_1B6496680((uint64_t)a5, (uint64_t)v107, v108, v109, v110, v111, v112, v113) == 3)
  {
    float v191 = fmin(sub_1B6495918((uint64_t)a5, v183, v184, v185, v186, v187, v188, v189) / 180.0 * 3.14159265, 3.13159265);
    double v206 = sub_1B649644C((uint64_t)a5, v192, v193, v194, v195, v196, v197, v198) / 180.0 * 3.14159265;
    if (v206 >= v191) {
      float v207 = v191;
    }
    else {
      float v207 = v206;
    }
    float v208 = sub_1B6495B40((uint64_t)a5, v199, v200, v201, v202, v203, v204, v205);
    float32x4_t v212 = objc_msgSend_childNodes(a3, v209, v210, v211);
    uint64_t v217 = objc_msgSend_objectAtIndexedSubscript_(v212, v213, 0, v214);
    if (v190) {
      uint64_t v218 = objc_msgSend_stringWithFormat_(NSString, v215, @"oa:%f ia:%f e:%f scale:%f", v216, v191, v207, v208, 1.0);
    }
    else {
      uint64_t v218 = objc_msgSend_stringWithFormat_(NSString, v215, @"oa:%f ia:%f e:%f scale:%f", v216, v191, v207, v208, *(float *)&v543);
    }
    v221 = (void *)v218;
    uint64_t v222 = objc_msgSend_valueForKey_(v217, v219, @"AuthEnvHash", v220);
    if (!v222 || objc_msgSend_compare_(v221, v223, v222, v224))
    {
      long long __p = 0u;
      long long v552 = 0u;
      *(_OWORD *)v549 = 0u;
      long long v550 = 0u;
      *(_OWORD *)v548 = 0u;
      float32x4_t v547 = 0uLL;
      long long v546 = xmmword_1B6E4F340;
      if ((v190 & (v208 > 0.0)) == 0) {
        float v208 = *(float *)&v543;
      }
      float v228 = tanf(v191 * 0.5);
      sub_1B645A514((uint64_t)v548, &v547, (float32x2_t *)&v546, &xmmword_1B6E50700, v208, v208 * v228);
      if (v207 > 0.0)
      {
        float v230 = tanf(v207 * 0.5);
        sub_1B645A514((uint64_t)v548, &v547, (float32x2_t *)&v546, &xmmword_1B6E506D0, v208, v208 * v230);
      }
      uint64_t v231 = sub_1B6459150((uint64_t *)v548, v229);
      objc_msgSend_setModel_(v217, v232, (uint64_t)v231, v233);
      objc_msgSend_setValue_forKey_(v217, v234, (uint64_t)v221, @"AuthEnvHash");
      if ((void)__p)
      {
        *((void *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      if (v549[1])
      {
        *(void **)&long long v550 = v549[1];
        operator delete(v549[1]);
      }
      if (v548[0])
      {
        v548[1] = v548[0];
        operator delete(v548[0]);
      }
    }
    objc_msgSend_setScale_(v217, v225, v226, v227, *(double *)vdupq_lane_s32(v540, 0).i64);
    if (sub_1B649F390((uint64_t)a4, v235, v236, v237, v238, v239, v240, v241))
    {
      if (v190) {
        uint64_t v245 = 264;
      }
      else {
        uint64_t v245 = 280;
      }
      uint64_t v246 = *(uint64_t *)((char *)&v26->super.isa + v245);
    }
    else
    {
      uint64_t v334 = 248;
      if (v190) {
        uint64_t v334 = 264;
      }
      uint64_t v246 = *(uint64_t *)((char *)&v26->super.isa + v334);
      if (v190) {
        uint64_t v245 = 264;
      }
      else {
        uint64_t v245 = 296;
      }
    }
    v335 = objc_msgSend_model(a3, v242, v243, v244);
    v339 = objc_msgSend_firstMaterial(v335, v336, v337, v338);
    v343 = objc_msgSend_diffuse(v339, v340, v341, v342);
    objc_msgSend_setColor_(v343, v344, v246, v345);
    uint64_t v154 = *(uint64_t *)((char *)&v26->super.isa + v245);
    v276 = objc_msgSend_model(v217, v346, v347, v348);
    goto LABEL_82;
  }
  int v280 = sub_1B6496680((uint64_t)a5, v183, v184, v185, v186, v187, v188, v189);
  if (v280 == 2 || sub_1B6496680((uint64_t)a5, (uint64_t)v281, v282, v283, v284, v285, v286, v287) == 6)
  {
    v292 = objc_msgSend_childNodes(a3, v281, v282, v283);
    int v296 = objc_msgSend_count(v292, v293, v294, v295);
    uint64_t v300 = objc_msgSend_childNodes(a3, v297, v298, v299);
    v303 = objc_msgSend_objectAtIndexedSubscript_(v300, v301, 0, v302);
    objc_msgSend_setHidden_(v303, v304, v40, v305);
    uint64_t v309 = objc_msgSend_childNodes(a3, v306, v307, v308);
    uint64_t v312 = objc_msgSend_objectAtIndexedSubscript_(v309, v310, v296 - 1, v311);
    if (sub_1B64984F0((uint64_t)a5, v313, v314, v315, v316, v317, v318, v319))
    {
      objc_msgSend_setHidden_(v312, v320, 1, v322);
    }
    else
    {
      uint64_t v349 = sub_1B649535C((uint64_t)a5, (uint64_t)v320, v321, v322, v323, v324, v325, v326) ^ 1;
      objc_msgSend_setHidden_(v312, v350, v349, v351);
    }
    if ((sub_1B64984F0((uint64_t)a5, v327, v328, v329, v330, v331, v332, v333) & 1) == 0)
    {
      sub_1B6496784((uint64_t)a5, (uint64_t)v352, v353, v354, v355, v356, v357, v358);
      objc_msgSend_setPosition_(v312, v359, v360, v361, 0.0);
      float v537 = sub_1B6495F2C((uint64_t)a5, v362, v363, v364, v365, v366, v367, v368);
      double v538 = COERCE_DOUBLE(vmul_n_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sub_1B6495F2C((uint64_t)a5, v369, v370, v371, v372, v373, v374, v375)), LODWORD(v537)), *(float *)v540.i32));
      sub_1B64966CC((uint64_t)a5, v369, v370, v371, v372, v373, v374, v375);
      sub_1B6496784((uint64_t)a5, v376, v377, v378, v379, v380, v381, v382);
      objc_msgSend_setScale_(v312, v383, v384, v385, v538);
    }
    v544[0] = MEMORY[0x1E4F143A8];
    v544[1] = 3221225472;
    v544[2] = sub_1B640C4B4;
    v544[3] = &unk_1E6141748;
    char v545 = v190;
    v544[4] = v26;
    v544[5] = a4;
    objc_msgSend_enumerateChildNodesUsingBlock_(a3, v352, (uint64_t)v544, v354);
    int v393 = sub_1B649F390((uint64_t)a4, v386, v387, v388, v389, v390, v391, v392);
    BOOL v397 = v190 == 0;
    if (v393) {
      uint64_t v398 = 280;
    }
    else {
      uint64_t v398 = 248;
    }
LABEL_79:
    if (!v397) {
      uint64_t v398 = 264;
    }
    uint64_t v154 = *(uint64_t *)((char *)&v26->super.isa + v398);
    v276 = objc_msgSend_model(a3, v394, v395, v396);
    goto LABEL_82;
  }
  if (sub_1B6496680((uint64_t)a5, (uint64_t)v281, v282, v283, v288, v289, v290, v291) == 4)
  {
    uint64_t v432 = 296;
    if (isPartOfSelection) {
      uint64_t v432 = 264;
    }
    uint64_t v433 = *(uint64_t *)((char *)&v26->super.isa + v432);
    v434 = objc_msgSend_model(a3, v425, v426, v427);
    v438 = objc_msgSend_firstMaterial(v434, v435, v436, v437);
    v442 = objc_msgSend_diffuse(v438, v439, v440, v441);
    objc_msgSend_setColor_(v442, v443, v433, v444);
    int hasDebugOption = objc_msgSend_hasDebugOption_(v26, v445, 8, v446);
    objc_msgSend_setHidden_(a3, v448, hasDebugOption ^ 1u, v449);
    v451 = objc_msgSend_childNodeWithName_recursively_(a3, v450, @"lightInnerAuth", 0);
    objc_msgSend_setHidden_(v451, v452, v536, v453);
    *(float *)v461.i32 = fmaxf(sub_1B6496784((uint64_t)a5, v454, v455, v456, v457, v458, v459, v460), 0.0);
    objc_msgSend_setScale_(v451, v462, v463, v464, *(double *)vdupq_lane_s32(v461, 0).i64);
    v466 = objc_msgSend_childNodeWithName_recursively_(a3, v465, @"lightOuterAuth", 0);
    objc_msgSend_setHidden_(v466, v467, v536, v468);
    *(float *)v476.i32 = fmaxf(sub_1B64966CC((uint64_t)a5, v469, v470, v471, v472, v473, v474, v475), 0.0);
    objc_msgSend_setScale_(v466, v477, v478, v479, *(double *)vdupq_lane_s32(v476, 0).i64);
    v481 = objc_msgSend_childNodeWithName_recursively_(a3, v480, @"lightProbeExtents", 0);
    __n128 v489 = sub_1B6497AB4((__n128 *)a5, v482, v483, v484, v485, v486, v487, v488);
    v490.i64[0] = 0x3F0000003F000000;
    v490.i64[1] = 0x3F0000003F000000;
    objc_msgSend_setScale_(v481, v491, v492, v493, *(double *)vmulq_f32((float32x4_t)v489, v490).i64);
    v495 = objc_msgSend_childNodeWithName_recursively_(a3, v494, @"probe", 0);
    *(void *)&double v503 = sub_1B6497B74((__n128 *)a5, v496, v497, v498, v499, v500, v501, v502).n128_u64[0];
    objc_msgSend_setPosition_(v495, v504, v505, v506, v503);
    objc_msgSend_setHidden_(v481, v507, v536, v508);
  }
  else if (sub_1B6496680((uint64_t)a5, (uint64_t)v425, v426, v427, v428, v429, v430, v431) == 5)
  {
    *(_OWORD *)v549 = 0u;
    long long v550 = 0u;
    *(_OWORD *)v548 = 0u;
    *(void *)&double v509 = sub_1B6497104((uint64_t)a5, v407, v408, v409, v410, v411, v412, (uint64_t)v548).n128_u64[0];
    v513 = objc_msgSend_childNodes(a3, v510, v511, v512, v509);
    v516 = objc_msgSend_objectAtIndexedSubscript_(v513, v514, 0, v515);
    objc_msgSend_setScale_(v516, v517, v518, v519, *(double *)vdupq_lane_s32(v540, 0).i64);
    objc_msgSend_scale(v516, v520, v521, v522);
    objc_msgSend_setScale_(v516, v524, v525, v526, *(double *)vmulq_f32(v523, *(float32x4_t *)v549).i64);
    int v534 = sub_1B649F390((uint64_t)a4, v527, v528, v529, v530, v531, v532, v533);
    uint64_t v398 = 248;
    if (v534) {
      uint64_t v398 = 280;
    }
    BOOL v397 = v190 == 0;
    goto LABEL_79;
  }
LABEL_83:
  if (a5)
  {
    if (sub_1B6496680((uint64_t)a5, v406, v407, v408, v409, v410, v411, v412) != 4)
    {
      objc_msgSend_scale(a3, v413, v414, v415);
      objc_msgSend_setScale_(a3, v417, v418, v419, *(double *)vmulq_n_f32(v416, *(float *)&v543).i64);
      int v422 = objc_msgSend_hasDebugOption_(v26, v420, 4, v421);
      objc_msgSend_setHidden_(a3, v423, v422 ^ 1u, v424);
    }
  }
}

- (void)updateLightNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  CFDictionaryRef v11 = sub_1B649F640((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11)
  {
    uint64_t v19 = (uint64_t)v11;
    BOOL v20 = sub_1B64A3178((uint64_t)a4, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    uint64_t v24 = objc_msgSend_pointOfView(self->_renderer, v21, v22, v23);
    uint64_t v28 = (__CFXNode *)objc_msgSend_nodeRef(v24, v25, v26, v27);
    uint64_t v35 = 1;
    if (v20 || v28 == a4)
    {
LABEL_15:
      objc_msgSend_setHidden_(a3, v29, v35, v30);
      return;
    }
    uint64_t v36 = (__n128 *)sub_1B64A01D4((uint64_t)a4, (uint64_t)v29, 1, v30, v31, v32, v33, v34);
    __n128 v58 = v36[1];
    __n128 v59 = *v36;
    __n128 v56 = v36[3];
    __n128 v57 = v36[2];
    if (objc_msgSend__proximityHidden_(self, v37, v38, v39))
    {
LABEL_5:
      uint64_t v35 = 1;
      goto LABEL_15;
    }
    char isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v29, (uint64_t)a4, v30);
    int v48 = sub_1B6496680(v19, v41, v42, v43, v44, v45, v46, v47);
    if ((isPartOfSelection & 1) == 0)
    {
      if (v48 == 4)
      {
        if (!objc_msgSend_hasDebugOption_(self, v29, 8, v30)) {
          goto LABEL_5;
        }
      }
      else if ((objc_msgSend_hasDebugOption_(self, v29, 4, v30) & 1) == 0)
      {
        goto LABEL_5;
      }
    }
    objc_msgSend_setWorldTransform_(a3, v29, v49, v30, v59.n128_f64[0], v58.n128_f64[0], v57.n128_f64[0], v56.n128_f64[0]);
    uint64_t v53 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v50, v51, v52);
    LODWORD(v54) = 25.0;
    sub_1B63E0A94(v53, v54, v59, v58, v57, v56);
    objc_msgSend_updateLightTypeForNode_source_light_screenspaceScalingFactor_(self, v55, (uint64_t)a3, (uint64_t)a4, v19);
    uint64_t v35 = 0;
    goto LABEL_15;
  }

  objc_msgSend_removeLightNode_(self, v12, (uint64_t)a4, v14);
}

- (void)updateEffectNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  if (sub_1B64A4A84((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7))
  {
    if ((sub_1B649F390((uint64_t)a4, (uint64_t)v11, v12, v13, v14, v15, v16, v17) & 1) != 0
      || (int v25 = (__n128 *)sub_1B64A01D4((uint64_t)a4, (uint64_t)v18, v19, v20, v21, v22, v23, v24),
          __n128 v72 = v25[1],
          __n128 v73 = *v25,
          __n128 v70 = v25[3],
          __n128 v71 = v25[2],
          (objc_msgSend__proximityHidden_(self, v26, v27, v28) & 1) != 0)
      || (int isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v18, (uint64_t)a4, v20),
          !objc_msgSend_hasDebugOption_(self, v30, 2048, v31)))
    {
      uint64_t v69 = 1;
    }
    else
    {
      objc_msgSend_setTransform_(a3, v18, v32, v20, v73.n128_f64[0], v72.n128_f64[0], v71.n128_f64[0], v70.n128_f64[0]);
      uint64_t v36 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v33, v34, v35);
      LODWORD(v37) = 25.0;
      sub_1B63E0A94(v36, v37, v73, v72, v71, v70);
      int32x2_t v74 = v38;
      uint64_t v42 = objc_msgSend_childNodes(a3, v39, v40, v41);
      uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0, v44);
      int isHidden = objc_msgSend_isHidden(v45, v46, v47, v48);
      uint64_t v53 = 248;
      if (isHidden) {
        uint64_t v53 = 280;
      }
      if (isPartOfSelection) {
        uint64_t v53 = 264;
      }
      uint64_t v54 = *(uint64_t *)((char *)&self->super.isa + v53);
      uint64_t v55 = objc_msgSend_model(v45, v50, v51, v52);
      Material = objc_msgSend_firstMaterial(v55, v56, v57, v58);
      uint64_t v63 = objc_msgSend_diffuse(Material, v60, v61, v62);
      objc_msgSend_setColor_(v63, v64, v54, v65);
      objc_msgSend_setScale_(v45, v66, v67, v68, *(double *)vdupq_lane_s32(v74, 0).i64);
      uint64_t v69 = 0;
    }
    objc_msgSend_setHidden_(a3, v18, v69, v20);
  }
  else
  {
    objc_msgSend_removeEffectNode_(self, v11, (uint64_t)a4, v13);
  }
}

- (void)updateCameraNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  CFDictionaryRef v11 = sub_1B64A3B48((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11)
  {
    uint64_t v19 = (uint64_t)v11;
    BOOL v20 = sub_1B64A3178((uint64_t)a4, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    uint64_t v24 = objc_msgSend_pointOfView(self->_renderer, v21, v22, v23);
    uint64_t v28 = (__CFXNode *)objc_msgSend_nodeRef(v24, v25, v26, v27);
    uint64_t v31 = 1;
    if (!v20 && v28 != a4)
    {
      int isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v29, (uint64_t)a4, v30);
      if ((isPartOfSelection & 1) == 0 && !objc_msgSend_hasDebugOption_(self, v32, 1024, v34)
        || (uint64_t v40 = (__n128 *)sub_1B64A01D4((uint64_t)a4, (uint64_t)v32, v33, v34, v35, v36, v37, v38),
            __n128 v228 = v40[1],
            __n128 v230 = *v40,
            __n128 v225 = v40[3],
            __n128 v226 = v40[2],
            char v44 = objc_msgSend__proximityHidden_(self, v41, v42, v43),
            objc_msgSend_setTransform_(a3, v45, v46, v47, v230.n128_f64[0], v228.n128_f64[0], v226.n128_f64[0], v225.n128_f64[0]), (v44 & 1) != 0))
      {
        objc_msgSend_setHidden_(a3, v32, 1, v34);
        return;
      }
      uint64_t v49 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v32, v48, v34);
      LODWORD(v50) = 25.0;
      sub_1B63E0A94(v49, v50, v230, v228, v226, v225);
      v231.n128_u64[0] = (unint64_t)v51;
      objc_msgSend_setScale_(a3, v52, v53, v54, *(double *)vdupq_lane_s32(v51, 0).i64);
      float v62 = sub_1B649C034(v19, v55, v56, v57, v58, v59, v60, v61);
      float v70 = sub_1B649BFE8(v19, v63, v64, v65, v66, v67, v68, v69);
      float v78 = sub_1B649C30C(v19, v71, v72, v73, v74, v75, v76, v77);
      int v86 = sub_1B649BEB8(v19, v79, v80, v81, v82, v83, v84, v85);
      uint64_t v90 = objc_msgSend_childNodes(a3, v87, v88, v89);
      uint64_t v96 = objc_msgSend_objectAtIndexedSubscript_(v90, v91, 0, v92);
      if (v86)
      {
        uint64_t v97 = objc_msgSend_cameraOrthographicFrustumGeometry(self, v93, v94, v95);
        objc_msgSend_setModel_(v96, v98, v97, v99);
        *(float *)&double v107 = sub_1B649BE6C(v19, v100, v101, v102, v103, v104, v105, v106) / v231.n128_f32[0];
        HIDWORD(v107) = LODWORD(v107);
        objc_msgSend_setScale_(v96, v108, v109, v110, v107);
      }
      else
      {
        uint64_t v115 = objc_msgSend_cameraFrustumGeometry(self, v93, v94, v95);
        objc_msgSend_setModel_(v96, v116, v115, v117);
        uint64_t v233 = 0;
        v121 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v118, v119, v120);
        __n128 v122 = sub_1B64479C4(v121);
        __asm { FMOV            V1.2S, #1.0 }
        v122.n128_u64[0] = (unint64_t)vmaxnm_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v122, (int8x16_t)v122, 8uLL), _D1);
        sub_1B649C738(v19, (float *)&v233 + 1, (float *)&v233, v127, v128, v129, v130, v131, vdiv_f32((float32x2_t)v122.n128_u64[0], (float32x2_t)vdup_lane_s32((int32x2_t)v122.n128_u64[0], 1)).f32[0]);
        v114.i32[1] = v231.n128_i32[1];
        if (v231.n128_f32[0] != 0.0)
        {
          long double v227 = tan(*(float *)&v233 * 0.5 / 180.0 * 3.14159265);
          v132.f64[0] = tan(*((float *)&v233 + 1) * 0.5 / 180.0 * 3.14159265);
          v132.f64[1] = v227;
          objc_msgSend_setScale_(v96, v133, v134, v135, COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64(vmulq_n_f64(v132, v70)), (float32x2_t)vdup_lane_s32((int32x2_t)v231.n128_u64[0], 0))));
        }
      }
      *(float *)v114.i32 = v62 / v70;
      int32x2_t v229 = v114;
      *(float *)v114.i32 = v78 / v70;
      int32x2_t v232 = v114;
      uint64_t v136 = objc_msgSend_childNodes(v96, v111, v112, v113);
      uint64_t v139 = objc_msgSend_objectAtIndexedSubscript_(v136, v137, 0, v138);
      objc_msgSend_setScale_(v139, v140, v141, v142, *(double *)vdupq_lane_s32(v229, 0).i64);
      uint64_t v146 = objc_msgSend_childNodes(v96, v143, v144, v145);
      uint64_t v147 = 1;
      uint64_t v150 = objc_msgSend_objectAtIndexedSubscript_(v146, v148, 1, v149);
      objc_msgSend_setScale_(v150, v151, v152, v153, *(double *)vdupq_lane_s32(v232, 0).i64);
      if (isPartOfSelection)
      {
        uint64_t v147 = objc_msgSend_hasDebugOption_(self, v154, 1024, v155) ^ 1;
        objc_msgSend_setHidden_(v96, v156, v147, v157);
      }
      objc_msgSend_setHidden_(v139, v154, v147, v155);
      objc_msgSend_setHidden_(v150, v158, v147, v159);
      objc_msgSend_setHidden_(v96, v160, isPartOfSelection ^ 1u, v161);
      grayMedium = self->_grayMedium;
      uint64_t v166 = objc_msgSend_model(a3, v163, v164, v165);
      Material = objc_msgSend_firstMaterial(v166, v167, v168, v169);
      uint64_t v174 = objc_msgSend_diffuse(Material, v171, v172, v173);
      objc_msgSend_setColor_(v174, v175, (uint64_t)grayMedium, v176);
      _ZF = isPartOfSelection == 0;
      if (isPartOfSelection) {
        uint64_t v181 = 264;
      }
      else {
        uint64_t v181 = 208;
      }
      uint64_t v182 = *(uint64_t *)((char *)&self->super.isa + v181);
      if (_ZF) {
        uint64_t v183 = 208;
      }
      else {
        uint64_t v183 = 240;
      }
      uint64_t v184 = objc_msgSend_model(v96, v177, v178, v179);
      uint64_t v188 = objc_msgSend_firstMaterial(v184, v185, v186, v187);
      uint64_t v192 = objc_msgSend_diffuse(v188, v189, v190, v191);
      objc_msgSend_setColor_(v192, v193, v182, v194);
      uint64_t v195 = *(uint64_t *)((char *)&self->super.isa + v181);
      uint64_t v199 = objc_msgSend_model(v139, v196, v197, v198);
      uint64_t v203 = objc_msgSend_firstMaterial(v199, v200, v201, v202);
      float v207 = objc_msgSend_diffuse(v203, v204, v205, v206);
      objc_msgSend_setColor_(v207, v208, v195, v209);
      uint64_t v210 = *(uint64_t *)((char *)&self->super.isa + v183);
      uint64_t v214 = objc_msgSend_model(v150, v211, v212, v213);
      uint64_t v218 = objc_msgSend_firstMaterial(v214, v215, v216, v217);
      uint64_t v222 = objc_msgSend_diffuse(v218, v219, v220, v221);
      objc_msgSend_setColor_(v222, v223, v210, v224);
      uint64_t v31 = 0;
    }
    objc_msgSend_setHidden_(a3, v29, v31, v30);
  }
  else
  {
    objc_msgSend_removeCameraNode_(self, v12, (uint64_t)a4, v14);
  }
}

- (void)updateFieldNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  if (sub_1B64A4888((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7))
  {
    if (sub_1B649F390((uint64_t)a4, v11, v12, v13, v14, v15, v16, v17)) {
      goto LABEL_4;
    }
    int v25 = (long long *)sub_1B64A01D4((uint64_t)a4, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    long long v49 = v25[1];
    long long v50 = *v25;
    long long v47 = v25[3];
    long long v48 = v25[2];
    if (objc_msgSend__proximityHidden_(self, v26, v27, v28)) {
      goto LABEL_4;
    }
    if (objc_msgSend__isPartOfSelection_(self, v18, (uint64_t)a4, v20))
    {
      uint64_t v31 = 264;
    }
    else
    {
      if (!objc_msgSend_hasDebugOption_(self, v18, 16, v20))
      {
LABEL_4:
        uint64_t v29 = 1;
LABEL_5:
        objc_msgSend_setHidden_(a3, v18, v29, v20);
        return;
      }
      uint64_t v31 = 208;
    }
    objc_msgSend_setTransform_(a3, v18, v30, v20, *(double *)&v50, *(double *)&v49, *(double *)&v48, *(double *)&v47);
    uint64_t v32 = *(uint64_t *)((char *)&self->super.isa + v31);
    uint64_t v36 = objc_msgSend_model(a3, v33, v34, v35);
    Material = objc_msgSend_firstMaterial(v36, v37, v38, v39);
    char v44 = objc_msgSend_diffuse(Material, v41, v42, v43);
    objc_msgSend_setColor_(v44, v45, v32, v46);
    uint64_t v29 = 0;
    goto LABEL_5;
  }

  MEMORY[0x1F4181798](self, sel_removeForceFieldNode_, a4, v13);
}

- (void)updateWithRenderer:(id)a3
{
  objc_sync_enter(self);
  self->_renderer = (VFXRenderer *)a3;
  uint64_t v8 = objc_msgSend__engineContext(a3, v5, v6, v7);
  uint64_t v16 = (void *)sub_1B6445900(v8, v9, v10, v11, v12, v13, v14, v15);
  if (v16 && objc_msgSend_showsAuthoringEnvironment(v16, v17, v18, v19))
  {
    CFDictionaryApplyFunction(self->_lightsDictionary, (CFDictionaryApplierFunction)sub_1B640CFD8, self);
    CFDictionaryApplyFunction(self->_camerasDictionary, (CFDictionaryApplierFunction)sub_1B640CFE8, self);
    CFDictionaryApplyFunction(self->_effectsDictionary, (CFDictionaryApplierFunction)sub_1B640CFF8, self);
    CFDictionaryApplyFunction(self->_forceFieldsDictionary, (CFDictionaryApplierFunction)sub_1B640D008, self);
    uint64_t v23 = objc_msgSend_privateRendererOwner(a3, v20, v21, v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = objc_msgSend_defaultCameraController(v23, v24, v25, v26);
      objc_msgSend_target(v27, v28, v29, v30);
      objc_msgSend_setPosition_(self->_cameraTarget, v31, v32, v33);
    }
    int v34 = 1;
    objc_msgSend_setHidden_(self->_cameraTarget, v24, 1, v26);
  }
  else
  {
    int v34 = 0;
  }
  int hasDebugOption = objc_msgSend_hasDebugOption_(self, v17, 0x80000, v19);
  manipulator = self->_manipulator;
  if (hasDebugOption)
  {
    if (objc_msgSend_isDragging(manipulator, v35, v36, v37)) {
      objc_msgSend_updateTargetsTransforms(self->_manipulator, v40, v41, v42);
    }
    objc_msgSend_updateManipulatorPosition_(self->_manipulator, v40, v8, v42);
    uint64_t v46 = objc_msgSend_privateRendererOwner(a3, v43, v44, v45);
    long long v50 = v46;
    if (v46 && objc_msgSend_pointOfView(v46, v47, v48, v49))
    {
      uint64_t v77 = 0;
      float v78 = &v77;
      uint64_t v79 = 0x2020000000;
      BOOL v80 = 0;
      uint64_t v52 = objc_msgSend_targets(self->_manipulator, v47, v51, v49);
      BOOL v80 = objc_msgSend_count(v52, v53, v54, v55) == 0;
      uint64_t v59 = objc_msgSend_targets(self->_manipulator, v56, v57, v58);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = sub_1B640D018;
      v76[3] = &unk_1E6141770;
      v76[4] = v50;
      v76[5] = &v77;
      objc_msgSend_enumerateObjectsUsingBlock_(v59, v60, (uint64_t)v76, v61);
      int v62 = *((unsigned __int8 *)v78 + 24);
      uint64_t v66 = objc_msgSend_manipulatorNode(self->_manipulator, v63, v64, v65);
      objc_msgSend_setHidden_(v66, v67, v62 != 0, v68);
      _Block_object_dispose(&v77, 8);
    }
    else
    {
      objc_msgSend_setHidden_(self->_manipulator, v47, 1, v49);
    }
  }
  else
  {
    objc_msgSend_setHidden_(manipulator, v35, 1, v37);
  }
  if (v34 == objc_msgSend_isHidden(self->_layerRoot, v69, v70, v71))
  {
    objc_msgSend_setHidden_(self->_layerRoot, v72, v34 ^ 1u, v73);
    objc_msgSend_setHidden_(self->_overlayLayerRoot, v74, v34 ^ 1u, v75);
  }
  self->_renderer = 0;
  objc_sync_exit(self);
}

- (VFXNode)authoringLayer
{
  return self->_layerRoot;
}

- (VFXNode)authoringOverlayLayer
{
  return self->_overlayLayerRoot;
}

- (void)debugOptionsDidChange:(unint64_t)a3
{
  objc_msgSend_setHidden_(self->_grid, a2, (a3 & 0x40000) == 0, v3);
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4
{
  v84[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_world(a4, a2, a3, (uint64_t)a4))
  {
    uint64_t v10 = objc_msgSend_defaultCameraController(a4, v7, v8, v9);
    objc_msgSend_simdTarget(v10, v11, v12, v13);
    float32x4_t v83 = v14;
    uint64_t v18 = objc_msgSend_childNodes(self->_pointsOfViewRoot, v15, v16, v17);
    uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3, v20);
    uint64_t v25 = objc_msgSend_world(a4, v22, v23, v24);
    v84[0] = objc_msgSend_rootNode(v25, v26, v27, v28);
    uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v84, 1);
    VFXNodeGetBoundingSphere(v30, (const char *)0x10000, v31, v32);
    float32x4_t v81 = v33;
    uint64_t v37 = objc_msgSend_camera(v21, v34, v35, v36);
    objc_msgSend_zNear(v37, v38, v39, v40);
    float v42 = v41;
    objc_msgSend_localUp(VFXNode, v43, v44, v45);
    float32x4_t v80 = v46;
    objc_msgSend_localRight(VFXNode, v47, v48, v49);
    float32x4_t v79 = v50;
    objc_msgSend_localFront(VFXNode, v51, v52, v53);
    float32x4_t v58 = v57;
    float32x4_t v59 = vsubq_f32(v83, v81);
    float32x4_t v60 = vmulq_f32(v59, v59);
    v57.f32[0] = v42
               + (float)(v81.f32[3]
                       + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).f32[0]));
    float32x2_t v82 = *(float32x2_t *)v57.f32;
    switch(a3)
    {
      case 1:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, COERCE_DOUBLE(3217625051));
        goto LABEL_11;
      case 2:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, COERCE_DOUBLE(1070141403));
        goto LABEL_8;
      case 3:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, -0.195796371);
        float32x2_t v68 = v82;
        float32x4_t v67 = v83;
        float32x4_t v69 = v79;
        goto LABEL_9;
      case 4:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, 0.195796371);
        float v71 = v82.f32[0];
        float32x4_t v70 = v83;
        float32x4_t v72 = v79;
        goto LABEL_12;
      case 5:
        float32x4_t v80 = v58;
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, 0.0);
LABEL_8:
        float32x2_t v68 = v82;
        float32x4_t v67 = v83;
        float32x4_t v69 = v80;
LABEL_9:
        objc_msgSend_setWorldPosition_(v21, v64, v65, v66, *(double *)vmlsq_lane_f32(v67, v69, v68, 0).i64);
        break;
      case 6:
        float32x4_t v80 = v58;
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, -50.1238708);
LABEL_11:
        float v71 = v82.f32[0];
        float32x4_t v70 = v83;
        float32x4_t v72 = v80;
LABEL_12:
        objc_msgSend_setWorldPosition_(v21, v61, v62, v63, *(double *)vmlaq_n_f32(v70, v72, v71).i64);
        break;
      default:
        break;
    }
    objc_msgSend_setPointOfView_(a4, v54, (uint64_t)v21, v56);
    uint64_t v76 = objc_msgSend_defaultCameraController(a4, v73, v74, v75);
    objc_msgSend_setPointOfView_(v76, v77, (uint64_t)v21, v78);
  }
}

- (id)authoringCamera:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_childNodes(self->_pointsOfViewRoot, a2, a3, v3);

  return (id)objc_msgSend_objectAtIndexedSubscript_(v5, v6, a3, v7);
}

@end