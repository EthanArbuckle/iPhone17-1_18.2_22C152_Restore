@interface VFXAuthoringEnvironment
+ (id)authoringEnvironmentForWorldRenderer:(id)a3;
+ (id)authoringEnvironmentForWorldRenderer:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)rendererForWorldRenderer:(id)a3;
- (BOOL)didTapAtPoint:(CGPoint)a3;
- (BOOL)graphicalSelectionEnabled;
- (BOOL)isEditingSubComponent;
- (BOOL)selectionIsReadonly;
- (BOOL)shouldSnapOnGrid;
- (BOOL)shouldSnapToAlign;
- (BOOL)surroundToSelect;
- (NSArray)selectedNodes;
- (VFXAuthoringEnvironment)init;
- (VFXAuthoringEnvironmentDelegate)delegate;
- (VFXManipulator)manipulator;
- (VFXNode)authoringOverlayLayer;
- (VFXWorldRenderer)worldRenderer;
- (__n128)viewMatrix;
- (float)gridUnit;
- (id)_initWithEngineContext:(__CFXEngineContext *)a3;
- (id)authoringEnvironment2;
- (id)renderer;
- (id)selectedItems;
- (int64_t)editingSpace;
- (int64_t)selectionTransformMode;
- (void)_setupAuthoringEnv2:(id)a3;
- (void)beginEditingNodes:(id)a3;
- (void)beginOrbiting;
- (void)dealloc;
- (void)debugOptionsDidChange:(unint64_t)a3;
- (void)drawLineFromPoint:(VFXAuthoringEnvironment *)self toPoint:(SEL)a2 color:(id)a3;
- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5;
- (void)endOrbiting;
- (void)saveInitialSelection;
- (void)setDelegate:(id)a3;
- (void)setEditingSpace:(int64_t)a3;
- (void)setGraphicalSelectionEnabled:(BOOL)a3;
- (void)setSelectionIsReadonly:(BOOL)a3;
- (void)setSelectionTransformMode:(int64_t)a3;
- (void)setShouldSnapOnGrid:(BOOL)a3;
- (void)setShouldSnapToAlign:(BOOL)a3;
- (void)setSurroundToSelect:(BOOL)a3;
- (void)setupAuthoringEnv2;
- (void)update;
- (void)worldDidChange:(id)a3;
@end

@implementation VFXAuthoringEnvironment

- (VFXAuthoringEnvironment)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return self;
}

- (id)_initWithEngineContext:(__CFXEngineContext *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VFXAuthoringEnvironment;
  v3 = [(VFXAuthoringEnvironment *)&v5 init];
  if (v3)
  {
    LOBYTE(v3->_gridUnit) = 0;
    sub_1B644FD88();
  }
  return 0;
}

+ (id)rendererForWorldRenderer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    sub_1B63F2F54(16, @"Unreachable code: Unknown VFXWorldRenderer conforming class", v5, v6, v7, v8, v9, v10, v12);
    return 0;
  }

  return (id)objc_msgSend_renderer(a3, v4, v5, v6);
}

+ (id)authoringEnvironmentForWorldRenderer:(id)a3
{
  return (id)objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(a1, a2, (uint64_t)a3, 1);
}

+ (id)authoringEnvironmentForWorldRenderer:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_msgSend_rendererForWorldRenderer_(a1, a2, (uint64_t)a3, a4);
  uint64_t v10 = objc_msgSend__engineContext(v6, v7, v8, v9);
  uint64_t v17 = sub_1B6446254(v10, v4, v11, v12, v13, v14, v15, v16);
  v18 = (unsigned char *)v17;
  if (v17)
  {
    *(void *)(v17 + 16) = a3;
    objc_opt_class();
    v18[24] = objc_opt_isKindOfClass() & 1;
  }
  return v18;
}

- (VFXWorldRenderer)worldRenderer
{
  return self->_worldRenderer;
}

- (id)renderer
{
  v3 = objc_opt_class();
  worldRenderer = self->_worldRenderer;

  return (id)objc_msgSend_rendererForWorldRenderer_(v3, v4, (uint64_t)worldRenderer, v5);
}

- (__n128)viewMatrix
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    uint64_t v2 = (long long *)sub_1B6447988(v1, 1);
  }
  else {
    uint64_t v2 = &VFXMatrix4Identity;
  }
  return (__n128)*v2;
}

- (void)debugOptionsDidChange:(unint64_t)a3
{
  objc_msgSend_debugOptionsDidChange_(self[1].super.isa, a2, a3, v3);
}

- (BOOL)selectionIsReadonly
{
  BOOL v4 = objc_msgSend_manipulator(self[1].super.isa, a2, v2, v3);

  return objc_msgSend_readonly(v4, v5, v6, v7);
}

- (void)setSelectionIsReadonly:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_manipulator(self[1].super.isa, a2, a3, v3);

  MEMORY[0x1F4181798](v5, sel_setReadonly_, v4, v6);
}

- (void)setEditingSpace:(int64_t)a3
{
  if (self->_editingSpace != a3)
  {
    self->_editingSpace = a3;
    uint64_t v4 = objc_msgSend_manipulator(self, a2, a3, v3);
    MEMORY[0x1F4181798](v4, sel_editingSpaceChanged, v5, v6);
  }
}

- (void)setSelectionTransformMode:(int64_t)a3
{
  self->_selectionTransformMode = a3;
}

- (void)_setupAuthoringEnv2:(id)a3
{
  if (!self[1].super.isa) {
    self[1].super.isa = (Class)(id)objc_msgSend_authoringEnvironmentForWorld_createIfNeeded_(VFXAuthoringEnvironment2, a2, (uint64_t)a3, 1);
  }
}

- (void)setupAuthoringEnv2
{
  if (!self[1].super.isa)
  {
    uint64_t v9 = (id *)sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    uint64_t v10 = sub_1B6583674(v9);
    if (v10)
    {
      MEMORY[0x1F4181798](self, sel__setupAuthoringEnv2_, v10, v11);
    }
  }
}

- (id)authoringEnvironment2
{
  uint64_t v4 = self + 1;
  Class isa = self[1].super.isa;
  if (!isa)
  {
    objc_msgSend_setupAuthoringEnv2(self, a2, v2, v3);
    return v4->super.isa;
  }
  return isa;
}

- (void)update
{
  uint64_t v8 = (void *)sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v8)
  {
    objc_msgSend_showsAuthoringEnvironment(v8, v9, v10, v11);
  }
}

- (void)worldDidChange:(id)a3
{
  uint64_t v6 = objc_msgSend_authoringEnvironment2(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_manipulator(v6, v7, v8, v9);
  objc_msgSend__setAuthoringEnvironment_(v10, v11, 0, v12);

  self[1].super.Class isa = 0;

  MEMORY[0x1F4181798](self, sel__setupAuthoringEnv2_, a3, v13);
}

- (VFXNode)authoringOverlayLayer
{
  uint64_t v4 = objc_msgSend_authoringEnvironment2(self, a2, v2, v3);

  return (VFXNode *)objc_msgSend_authoringOverlayLayer(v4, v5, v6, v7);
}

- (VFXManipulator)manipulator
{
  return (VFXManipulator *)objc_msgSend_manipulator(self[1].super.isa, a2, v2, v3);
}

- (NSArray)selectedNodes
{
  return *(NSArray **)&self->_isOrbiting;
}

- (id)selectedItems
{
  return self->_selectedNodes;
}

- (void)beginEditingNodes:(id)a3
{
  p_selectedNodes = &self->_selectedNodes;
  uint64_t v7 = objc_msgSend_authoringEnvironment2(self, a2, (uint64_t)a3, v3);
  uint64_t v11 = objc_msgSend_manipulator(v7, v8, v9, v10);
  objc_msgSend__setAuthoringEnvironment_(v11, v12, (uint64_t)self, v13);
  objc_msgSend_selectNodes_(p_selectedNodes[126], v14, (uint64_t)a3, v15);
  objc_sync_enter(self);
  uint64_t v23 = sub_1B644558C((uint64_t)self->_engineContext, v16, v17, v18, v19, v20, v21, v22);
  sub_1B642F620((uint64_t)p_selectedNodes[1], v23, 0, v24, v25, v26, v27, v28);

  uint64_t v32 = objc_msgSend_copy(a3, v29, v30, v31);
  p_selectedNodes[1] = (NSArray *)v32;
  sub_1B642F620(v32, v23, 1, v33, v34, v35, v36, v37);
  v38 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v42 = objc_msgSend_count(a3, v39, v40, v41);
  uint64_t v45 = objc_msgSend_arrayWithCapacity_(v38, v43, v42, v44);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1B642F910;
  v67[3] = &unk_1E6141E50;
  v67[4] = v45;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, v46, (uint64_t)v67, v47);

  id v48 = objc_alloc(MEMORY[0x1E4F1CA70]);
  *p_selectedNodes = (NSArray *)objc_msgSend_initWithArray_(v48, v49, v45, v50);
  v58 = (const void *)sub_1B644558C((uint64_t)self->_engineContext, v51, v52, v53, v54, v55, v56, v57);
  sub_1B6595A0C(@"kCFXNotificationEngineContextInvalidatePasses", v58, 0, 1u);
  objc_sync_exit(self);
  if (objc_msgSend_count(*p_selectedNodes, v59, v60, v61)) {
    objc_msgSend_setTargets_(v11, v62, (uint64_t)*p_selectedNodes, v63);
  }
  else {
    objc_msgSend_setTargets_(v11, v62, 0, v63);
  }
  objc_msgSend__setNeedsDisplay(self->_worldRenderer, v64, v65, v66);
}

- (void)saveInitialSelection
{
  uint64_t v6 = objc_msgSend_selectedItems(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_set(v6, v7, v8, v9);
  self->_selection = (NSMutableOrderedSet *)objc_msgSend_copy(v10, v11, v12, v13);
}

- (void)beginOrbiting
{
  LOBYTE(self->_gridUnit) = 1;
}

- (void)endOrbiting
{
  LOBYTE(self->_gridUnit) = 0;
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  p_waitDisplayLinkTime = &self->_statisticsInfo.waitDisplayLinkTime;
  if (!LOBYTE(self->_statisticsInfo.waitDisplayLinkTime)) {
    goto LABEL_13;
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v18 = 0;
  sub_1B643049C(0, &v18, 0, @"$1$", 0, (uint64_t)&self->_boldTextInfo, 0, 0);
  float v17 = *(float *)&v18;
  float v7 = *((unsigned char *)p_waitDisplayLinkTime + 1)
     ? (float)((float)(self->_normalTextInfo.lineHeight * 7.0) + 14.0) + 3.0
     : 3.0;
  unint64_t v8 = sub_1B64479F4((__n128 *)self->_engineContext).n128_u64[0];
  v21.origin.CGFloat y = (float)(v7 + *((float *)&v8 + 1));
  v21.size.CGFloat height = v17;
  v21.origin.CGFloat x = (float)(*(float *)&v8 + 7.0);
  v21.size.CGFloat width = v17;
  CGRect v22 = CGRectInset(v21, -10.0, -10.0);
  double v9 = v22.origin.x;
  CGFloat v10 = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v22, v19);
  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    v23.origin.CGFloat x = v9 + (float)(v17 + 5.0);
    v23.origin.CGFloat y = v10;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    v20.CGFloat x = x;
    v20.CGFloat y = y;
    BOOL v15 = CGRectContainsPoint(v23, v20);
    if (!v15) {
      return v15;
    }
    uint64_t v14 = 1;
  }
  *((void *)p_waitDisplayLinkTime + 2) = v14;
  if (!*(unsigned char *)p_waitDisplayLinkTime)
  {
LABEL_13:
    LOBYTE(v15) = 0;
    return v15;
  }
  if (v13) {
    *((unsigned char *)p_waitDisplayLinkTime + 1) ^= 1u;
  }
  *((void *)p_waitDisplayLinkTime + 2) = -1;
  LOBYTE(v15) = 1;
  return v15;
}

- (void)drawLineFromPoint:(VFXAuthoringEnvironment *)self toPoint:(SEL)a2 color:(id)a3
{
  float32x4_t v12 = v3;
  float32x4_t v13 = v4;
  v14[0] = sub_1B64FA004(a3, 0);
  v14[1] = v6;
  sub_1B642AB40((uint64_t)self, 0, (float *)v14, v7, v8, v9, v10, v11, v12, v13);
}

- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5
{
  CGFloat x = a4.x;
  CGFloat y = a4.y;
  v16[0] = sub_1B64FA004(a5, 0);
  v16[1] = v7;
  v8.f64[0] = x;
  v8.f64[1] = y;
  sub_1B642D538((uint64_t)self, (const __CFString *)a3, (uint64_t)v16, v9, v10, v11, v12, v13, COERCE_DOUBLE(vcvt_f32_f64(v8)));
}

- (void)dealloc
{
  p_selection = &self->_selection;
  uint64_t v6 = objc_msgSend_authoringEnvironment2(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_manipulator(v6, v7, v8, v9);
  objc_msgSend__setAuthoringEnvironment_(v10, v11, 0, v12);
  sub_1B64516BC(self->_depthOnCullOnStates);
  sub_1B64516BC(self->_depthOnCullOffStates);
  sub_1B64516BC(self->_depthOffCullOnStates);
  sub_1B64516BC(self->_depthOffCullOffStates);

  sub_1B642FF60(self, (uint64_t)&self->_logsInfo);
  sub_1B642FF60(self, (uint64_t)&self->_dynamicLinesInfo);
  sub_1B642FF60(self, (uint64_t)&self->_dynamicLinesNoDepthTestInfo);
  sub_1B642FF60(self, (uint64_t)&self->_overlayDynamicLinesInfo);
  sub_1B642FF60(self, (uint64_t)&self->_overlayDynamicTriangleInfo);
  sub_1B642FF60(self, (uint64_t)&self->_dynamicTrianglesInfo);
  sub_1B642FF60(self, (uint64_t)&self->_lightProbesInfo);
  sub_1B642FF60(self, (uint64_t)&self->_textInfo);
  sub_1B642FF60(self, (uint64_t)&self->_boldLogsInfo);
  texture = self->_normalTextInfo.textureInfo.texture;
  if (texture)
  {
    CFRelease(texture);
    self->_normalTextInfo.textureInfo.texture = 0;
  }
  symbolRects = self->_normalTextInfo.symbolRects;
  if (symbolRects) {
    free(symbolRects);
  }
  characterWidth_typographCGFloat y = self->_normalTextInfo.characterWidth_typography;
  if (characterWidth_typography) {
    free(characterWidth_typography);
  }
  uint64_t v16 = self->_boldTextInfo.textureInfo.texture;
  if (v16)
  {
    CFRelease(v16);
    self->_boldTextInfo.textureInfo.texture = 0;
  }
  float v17 = self->_boldTextInfo.symbolRects;
  if (v17) {
    free(v17);
  }
  uint64_t v18 = self->_boldTextInfo.characterWidth_typography;
  if (v18) {
    free(v18);
  }
  wireframeProgram = self->_wireframeProgram;
  if (wireframeProgram)
  {
    CFRelease(wireframeProgram);
    self->_wireframeProgram = 0;
  }
  colorOnlyProgram = self->_colorOnlyProgram;
  if (colorOnlyProgram)
  {
    CFRelease(colorOnlyProgram);
    self->_colorOnlyProgram = 0;
  }
  colorAndTextureProgram = self->_colorAndTextureProgram;
  if (colorAndTextureProgram)
  {
    CFRelease(colorAndTextureProgram);
    self->_colorAndTextureProgram = 0;
  }
  noColorProgram = self->_noColorProgram;
  if (noColorProgram)
  {
    CFRelease(noColorProgram);
    self->_noColorProgram = 0;
  }
  lightProbesProgram = self->_lightProbesProgram;
  if (lightProbesProgram)
  {
    CFRelease(lightProbesProgram);
    self->_lightProbesProgram = 0;
  }
  uint64_t v24 = p_selection[12];
  if (v24)
  {
    CFRelease(v24);
    p_selection[12] = 0;
  }
  uint64_t v25 = p_selection[11];
  if (v25)
  {
    CFRelease(v25);
    p_selection[11] = 0;
  }
  uint64_t v26 = p_selection[10];
  if (v26)
  {
    CFRelease(v26);
    p_selection[10] = 0;
  }
  sub_1B644FDC8((uint64_t)p_selection[5]);

  v27.receiver = self;
  v27.super_class = (Class)VFXAuthoringEnvironment;
  [(VFXAuthoringEnvironment *)&v27 dealloc];
}

- (BOOL)isEditingSubComponent
{
  return 0;
}

- (BOOL)shouldSnapOnGrid
{
  return self->_shouldSnapOnGrid;
}

- (void)setShouldSnapOnGrid:(BOOL)a3
{
  self->_shouldSnapOnGrid = a3;
}

- (BOOL)shouldSnapToAlign
{
  return self->_shouldSnapToAlign;
}

- (void)setShouldSnapToAlign:(BOOL)a3
{
  self->_shouldSnapToAlign = a3;
}

- (float)gridUnit
{
  return *(float *)&self->_wireframeRenderer;
}

- (int64_t)editingSpace
{
  return self->_editingSpace;
}

- (int64_t)selectionTransformMode
{
  return self->_selectionTransformMode;
}

- (VFXAuthoringEnvironmentDelegate)delegate
{
  return (VFXAuthoringEnvironmentDelegate *)self->_authEnv2;
}

- (void)setDelegate:(id)a3
{
  self->_authEnuint64_t v2 = (VFXAuthoringEnvironment2 *)a3;
}

- (BOOL)graphicalSelectionEnabled
{
  return self->_graphicalSelectionEnabled;
}

- (void)setGraphicalSelectionEnabled:(BOOL)a3
{
  self->_graphicalSelectionEnabled = a3;
}

- (BOOL)surroundToSelect
{
  return BYTE1(self->_initialSelection);
}

- (void)setSurroundToSelect:(BOOL)a3
{
  BYTE1(self->_initialSelection) = a3;
}

@end