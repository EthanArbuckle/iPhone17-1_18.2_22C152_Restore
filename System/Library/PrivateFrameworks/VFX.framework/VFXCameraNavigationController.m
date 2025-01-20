@interface VFXCameraNavigationController
- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4;
- (BOOL)_freeCameraActivated;
- (BOOL)_pointOfViewUsesOrthographicProjection;
- (BOOL)allowsTranslation;
- (BOOL)autoSwitchToFreeCamera;
- (BOOL)automaticCameraTarget;
- (BOOL)enableFreeCamera;
- (BOOL)enableInertia;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gimbalLockMode;
- (BOOL)wantsRedraw;
- (VFXCameraController)cameraController;
- (VFXCameraNavigationController)initWithView:(id)a3;
- (VFXCameraNavigationControllerDelegate)delegate;
- (VFXNode)freeCamera;
- (VFXView)view;
- (__n128)_worldBoundingSphere;
- (double)_defaultTargetForWorld:(void *)a3;
- (float)_cappedTranslationDelta:(float)a3;
- (float)_modeSensitivity;
- (float)_orthographicScaleForZoomFactor:(float)a3;
- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3;
- (float)_pointOfViewOrthographicScale;
- (float)_targetDistance;
- (float)_translationCoef;
- (float)flyModeVelocity;
- (float)friction;
- (float)panSensitivity;
- (float)rotationSensitivity;
- (float)truckSensitivity;
- (float)zoomFactor;
- (id).cxx_construct;
- (id)gestureRecognizers;
- (id)pointOfView;
- (uint64_t)cameraAutomaticTargetPoint;
- (uint64_t)cameraTarget;
- (uint64_t)worldFront;
- (unint64_t)_effectiveStickyAxis;
- (unint64_t)stickyAxis;
- (void)__didChangePointOfView;
- (void)__willChangePointOfView;
- (void)_computeAutomaticTargetPointIfNeeded;
- (void)_computeStickyAxisIfNeeded:(CGPoint)a3;
- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handleRotation:(id)a3;
- (void)_installFreeViewCameraIfNeeded;
- (void)_prepareFreeViewCamera;
- (void)_resetFreeViewCamera;
- (void)_setPointOfViewOrthographicScale:(float)a3;
- (void)_setupUpVector;
- (void)_startBrowsingIfNeeded:(CGPoint)a3;
- (void)_stopInertia;
- (void)_switchToFreeViewCamera;
- (void)_translateToViewPoint:(CGPoint)a3;
- (void)_willBeginInteraction;
- (void)beginGesture:(id)a3;
- (void)cameraDidChange;
- (void)cameraRotationWillStartForController:(id)a3;
- (void)dealloc;
- (void)focusNode:(id)a3;
- (void)focusNodes:(id)a3;
- (void)invalidateCameraTarget;
- (void)panWithGestureRecognizer:(id)a3;
- (void)pinchWithGestureRecognizer:(id)a3;
- (void)rotateOf:(float)a3;
- (void)rotateWithGestureRecognizer:(id)a3;
- (void)setAllowsTranslation:(BOOL)a3;
- (void)setAutoSwitchToFreeCamera:(BOOL)a3;
- (void)setAutomaticCameraTarget:(BOOL)a3;
- (void)setCameraTarget:(VFXCameraNavigationController *)self;
- (void)setDelegate:(id)a3;
- (void)setEnableFreeCamera:(BOOL)a3;
- (void)setEnableInertia:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFlyModeVelocity:(float)a3;
- (void)setFriction:(float)a3;
- (void)setGimbalLockMode:(BOOL)a3;
- (void)setPanSensitivity:(float)a3;
- (void)setRotationSensitivity:(float)a3;
- (void)setStickyAxis:(unint64_t)a3;
- (void)setTruckSensitivity:(float)a3;
- (void)setView:(id)a3;
- (void)setZoomFactor:(float)a3;
- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)viewWillDrawAtTime:(double)a3;
- (void)worldDidChange;
- (void)worldWillChange;
- (void)zoomBy:(float)a3;
- (void)zoomBy:(float)a3 animate:(BOOL)a4;
@end

@implementation VFXCameraNavigationController

- (id)gestureRecognizers
{
  tapGesture = self->_tapGesture;
  if (tapGesture) {
    return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], a2, (uint64_t)self->_pressGesture, v2, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
  }
  v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1968]);
  objc_msgSend_setMinimumPressDuration_(v6, v7, v8, v9, 0.0);
  v10 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  v11 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1AA0]);
  v12 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1A58]);
  objc_msgSend_setAllowedScrollTypesMask_(v12, v13, 3, v14);
  v15 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1B68]);
  objc_msgSend_setNumberOfTapsRequired_(v10, v16, 2, v17);
  objc_msgSend_addTarget_action_(v11, v18, (uint64_t)self, (uint64_t)sel__handlePinch_);
  objc_msgSend_addTarget_action_(v12, v19, (uint64_t)self, (uint64_t)sel__handlePan_);
  objc_msgSend_addTarget_action_(v6, v20, (uint64_t)self, (uint64_t)sel__handlePress_);
  objc_msgSend_addTarget_action_(v15, v21, (uint64_t)self, (uint64_t)sel__handleRotation_);
  objc_msgSend_addTarget_action_(v10, v22, (uint64_t)self, (uint64_t)sel__handleDoubleTap_);
  objc_msgSend_setDelegate_(v6, v23, (uint64_t)self, v24);
  objc_msgSend_setDelegate_(v12, v25, (uint64_t)self, v26);
  objc_msgSend_setDelegate_(v11, v27, (uint64_t)self, v28);
  objc_msgSend_setDelegate_(v15, v29, (uint64_t)self, v30);
  objc_msgSend_setDelegate_(v10, v31, (uint64_t)self, v32);
  objc_msgSend_setDelaysTouchesBegan_(v11, v33, 0, v34);
  objc_msgSend_setDelaysTouchesBegan_(v15, v35, 0, v36);
  objc_msgSend_setDelaysTouchesBegan_(v12, v37, 0, v38);
  objc_msgSend_setDelaysTouchesBegan_(v10, v39, 0, v40);
  objc_msgSend_setDelaysTouchesBegan_(v6, v41, 0, v42);
  objc_msgSend_setCancelsTouchesInView_(v11, v43, 0, v44);
  objc_msgSend_setCancelsTouchesInView_(v15, v45, 0, v46);
  objc_msgSend_setCancelsTouchesInView_(v12, v47, 0, v48);
  objc_msgSend_setCancelsTouchesInView_(v10, v49, 0, v50);
  objc_msgSend_setCancelsTouchesInView_(v6, v51, 0, v52);
  uint64_t v56 = objc_msgSend_enabled(self, v53, v54, v55);
  objc_msgSend_setEnabled_(v11, v57, v56, v58);
  uint64_t v62 = objc_msgSend_enabled(self, v59, v60, v61);
  objc_msgSend_setEnabled_(v15, v63, v62, v64);
  uint64_t v68 = objc_msgSend_enabled(self, v65, v66, v67);
  objc_msgSend_setEnabled_(v12, v69, v68, v70);
  uint64_t v74 = objc_msgSend_enabled(self, v71, v72, v73);
  objc_msgSend_setEnabled_(v10, v75, v74, v76);
  uint64_t v80 = objc_msgSend_enabled(self, v77, v78, v79);
  objc_msgSend_setEnabled_(v6, v81, v80, v82);
  self->_pinchGesture = v11;
  self->_panGesture = v12;
  self->_rotateGesture = v15;
  self->_pressGesture = v6;
  self->_tapGesture = v10;
  return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v83, (uint64_t)v6, v84, v12, v10, v11, v15, 0);
}

- (VFXCameraNavigationController)initWithView:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)VFXCameraNavigationController;
  v4 = [(VFXCameraNavigationController *)&v27 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_view = (VFXView *)a3;
    v4->_cameraController = objc_alloc_init(VFXCameraController);
    uint64_t v9 = objc_msgSend_pointOfView(a3, v6, v7, v8);
    objc_msgSend_setPointOfView_(*(void **)(v5 + 480), v10, v9, v11);
    objc_msgSend_setInertiaEnabled_(*(void **)(v5 + 480), v12, 1, v13);
    objc_msgSend_setInteractionMode_(*(void **)(v5 + 480), v14, 1, v15);
    objc_msgSend_setDrivenByDefaultNavigationCameraController_(*(void **)(v5 + 480), v16, 1, v17);
    objc_msgSend_setDelegate_(*(void **)(v5 + 480), v18, v5, v19);
    *(_DWORD *)(v5 + 336) = 0;
    *(_DWORD *)(v5 + 252) = 0;
    *(_DWORD *)(v5 + 84) = 1065353216;
    *(_WORD *)(v5 + 474) = 1;
    *(unsigned char *)(v5 + 89) = 1;
    *(unsigned char *)(v5 + 289) = 0;
    *(_WORD *)(v5 + 93) = 257;
    *(_OWORD *)(v5 + 184) = xmmword_1B6E50850;
    objc_msgSend_worldDidChange((void *)v5, v20, v21, v22);
    objc_msgSend_cameraDidChange((void *)v5, v23, v24, v25);
  }
  return (VFXCameraNavigationController *)v5;
}

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->_cameraController, a2, 0, v2);

  v4.receiver = self;
  v4.super_class = (Class)VFXCameraNavigationController;
  [(VFXCameraNavigationController *)&v4 dealloc];
}

- (VFXCameraController)cameraController
{
  return self->_cameraController;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_enabled = a3;
  uint64_t v5 = objc_msgSend_gestureRecognizers(self, a2, a3, v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_setEnabled_(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v8, self->_enabled, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)allowsTranslation
{
  return self->_translationAllowed;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  self->_translationAllowed = a3;
}

- (BOOL)enableInertia
{
  uint64_t v4 = objc_msgSend_cameraController(self, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_inertiaEnabled, v5, v6);
}

- (void)setEnableInertia:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_cameraController(self, a2, a3, v3);

  objc_msgSend_setInertiaEnabled_(v5, v6, v4, v7);
}

- (float)friction
{
  uint64_t v4 = objc_msgSend_cameraController(self, a2, v2, v3);

  MEMORY[0x1F4181798](v4, sel_inertiaFriction, v5, v6);
  return result;
}

- (void)setFriction:(float)a3
{
  uint64_t v5 = objc_msgSend_cameraController(self, a2, v3, v4);

  MEMORY[0x1F4181798](v5, sel_setInertiaFriction_, v6, v7);
}

- (BOOL)automaticCameraTarget
{
  return self->_target.hasAutomatic;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  if (self->_target.hasAutomatic != a3)
  {
    self->_target.hasAutomatic = a3;
    objc_msgSend_invalidateCameraTarget(self, a2, a3, v3);
  }
}

- (void)invalidateCameraTarget
{
  self->_target.automaticLocationUpToDate = 0;
}

- (uint64_t)cameraTarget
{
  objc_msgSend__computeAutomaticTargetPointIfNeeded(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_cameraController(a1, v5, v6, v7);

  return objc_msgSend_target(v8, v9, v10, v11);
}

- (void)setCameraTarget:(VFXCameraNavigationController *)self
{
  double v12 = v3;
  objc_msgSend_setAutomaticCameraTarget_(self, a2, 0, v2);
  uint64_t v8 = objc_msgSend_cameraController(self, v5, v6, v7);

  objc_msgSend_setTarget_(v8, v9, v10, v11, v12);
}

- (BOOL)gimbalLockMode
{
  uint64_t v4 = objc_msgSend_cameraController(self, a2, v2, v3);
  return objc_msgSend_interactionMode(v4, v5, v6, v7) == 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 3;
  }
  uint64_t v5 = objc_msgSend_cameraController(self, a2, a3, v3);

  objc_msgSend_setInteractionMode_(v5, v6, v4, v7);
}

- (BOOL)wantsRedraw
{
  uint64_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  if (objc_msgSend_isInertiaRunning(v5, v6, v7, v8)) {
    return 1;
  }
  os_unfair_lock_lock(&self->_keyboard.lock);
  unint64_t value = self->_keyboard.keyDown.__tree_.__pair3_.__value_;
  os_unfair_lock_unlock(&self->_keyboard.lock);
  long long v14 = objc_msgSend_cameraController(self, v11, v12, v13);
  if (objc_msgSend_interactionMode(v14, v15, v16, v17)) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = value == 0;
  }
  return !v18;
}

- (void)focusNode:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v7, 1);
  objc_msgSend_focusNodes_(self, v5, v4, v6);
}

- (void)focusNodes:(id)a3
{
  if (a3)
  {
    self->_didEverFocusNode = 1;
    objc_msgSend_setAutomaticCameraTarget_(self, a2, 0, v3);
    objc_msgSend__switchToFreeViewCamera(self, v6, v7, v8);
    uint64_t v12 = objc_msgSend_cameraController(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_automaticTarget(v12, v13, v14, v15);
    v20 = objc_msgSend_cameraController(self, v17, v18, v19);
    objc_msgSend_setAutomaticTarget_(v20, v21, 1, v22);
    uint64_t v26 = objc_msgSend_cameraController(self, v23, v24, v25);
    objc_msgSend_frameNodes_(v26, v27, (uint64_t)a3, v28);
    uint64_t v32 = objc_msgSend_cameraController(self, v29, v30, v31);
    objc_msgSend_setAutomaticTarget_(v32, v33, v16, v34);
    if (objc_msgSend__pointOfViewUsesOrthographicProjection(self, v35, v36, v37))
    {
      float originalOrthoScale = self->_originalOrthoScale;
      objc_msgSend__pointOfViewOrthographicScale(self, v38, v39, v40);
      *(float *)&double v45 = originalOrthoScale / *(float *)&v45;
      objc_msgSend_setZoomFactor_(self, v42, v43, v44, v45);
    }
  }
}

- (unint64_t)stickyAxis
{
  return *(void *)&self->_anon_101[23];
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis.stickyMoveEnabled = a3 == 0;
  *(void *)&self->_anon_101[23] = a3;
}

- (unint64_t)_effectiveStickyAxis
{
  unint64_t v2 = *(void *)&self->_anon_101[23];
  if (!v2)
  {
    uint64_t v3 = 272;
    if (!self->_stickyAxis.stickyMoveEnabled) {
      uint64_t v3 = 280;
    }
    return *(unint64_t *)((char *)&self->super.isa + v3);
  }
  return v2;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->_enableFreeCamera = a3;
  if (!a3) {
    objc_msgSend__resetFreeViewCamera(self, a2, a3, v3);
  }
}

- (void)_resetFreeViewCamera
{
  uint64_t v5 = objc_msgSend_worldRef(self->_freeViewCameraNode, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v14, v15, v16);
    uint64_t v21 = objc_msgSend_worldRef(self->_freeViewCameraNode, v18, v19, v20);
    sub_1B63F4AAC(v17, v21, v22, v23, v24, v25, v26, v27);
    sub_1B64B0CB4(v13, v28, v29, v30, v31, v32, v33, v34);
  }
  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, v6, v7, v8);

  self->_freeViewCameraNode = 0;
}

- (BOOL)_freeCameraActivated
{
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!freeViewCameraNode) {
    return 0;
  }
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  return freeViewCameraNode == (VFXNode *)objc_msgSend_pointOfView(v9, v10, v11, v12);
}

- (void)_prepareFreeViewCamera
{
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  uint64_t v13 = (VFXNode *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  uint64_t v17 = v13;
  if (v13 && v13 == self->_freeViewCameraNode) {
    return;
  }
  uint64_t v18 = objc_msgSend_presentationNode(v13, v14, v15, v16);
  if (objc_msgSend_camera(v18, v19, v20, v21)) {
    uint64_t v25 = objc_msgSend_camera(v18, v22, v23, v24);
  }
  else {
    uint64_t v25 = objc_msgSend_light(v18, v22, v23, v24);
  }
  objc_msgSend_orthographicScale(v25, v26, v27, v28);
  self->_float originalOrthoScale = v32;
  self->_orthographicZoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v17)
  {
    if (freeViewCameraNode) {
      goto LABEL_13;
    }
    uint64_t v34 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v29, v30, v31);
    goto LABEL_12;
  }
  if (v17 == freeViewCameraNode)
  {
LABEL_17:
    uint64_t v66 = objc_msgSend_presentationNode(v17, v29, v30, v31);
    objc_msgSend_worldTransform(v66, v67, v68, v69);
    long long v74 = v73;
    goto LABEL_22;
  }
  if (!freeViewCameraNode)
  {
    uint64_t v34 = (VFXNode *)objc_msgSend_copy(v17, v29, v30, v31);
LABEL_12:
    self->_freeViewCameraNode = v34;
  }
LABEL_13:
  if (objc_msgSend_camera(v17, v29, v30, v31))
  {
    uint64_t v38 = objc_msgSend_camera(v17, v35, v36, v37);
    id v42 = (id)objc_msgSend_copy(v38, v39, v40, v41);
LABEL_15:
    double v45 = v42;
    goto LABEL_16;
  }
  if (!objc_msgSend_light(v17, v35, v36, v37))
  {
    id v42 = (id)objc_msgSend_camera(VFXCamera, v75, v76, v77);
    goto LABEL_15;
  }
  uint64_t v78 = objc_msgSend_light(v17, v75, v76, v77);
  double v45 = objc_msgSend_camera(VFXCamera, v79, v80, v81);
  if (v78)
  {
    objc_msgSend_spotOuterAngle(v78, v43, v82, v44);
    objc_msgSend_setFieldOfView_(v45, v83, v84, v85);
    objc_msgSend_zNear(v78, v86, v87, v88);
    objc_msgSend_setZNear_(v45, v89, v90, v91);
    objc_msgSend_zFar(v78, v92, v93, v94);
    objc_msgSend_setZFar_(v45, v95, v96, v97);
  }
LABEL_16:
  objc_msgSend_setCamera_(self->_freeViewCameraNode, v43, (uint64_t)v45, v44);
  objc_msgSend_setLight_(self->_freeViewCameraNode, v46, 0, v47);
  objc_msgSend_setModel_(self->_freeViewCameraNode, v48, 0, v49);
  objc_msgSend_setConstraints_(self->_freeViewCameraNode, v50, 0, v51);
  uint64_t v55 = objc_msgSend_immediateMode(VFXTransaction, v52, v53, v54);
  objc_msgSend_setImmediateMode_(VFXTransaction, v56, 1, v57);
  objc_msgSend_removeAllAnimations(self->_freeViewCameraNode, v58, v59, v60);
  objc_msgSend_setConstraints_(self->_freeViewCameraNode, v61, 0, v62);
  objc_msgSend_setImmediateMode_(VFXTransaction, v63, v55, v64);
  if (v17) {
    goto LABEL_17;
  }
  float32x4_t v70 = (float32x4_t)VFXMatrix4Identity;
  float32x4_t v71 = (float32x4_t)unk_1B6E51E70;
  float32x4_t v72 = (float32x4_t)xmmword_1B6E51E80;
  long long v74 = unk_1B6E51E90;
LABEL_22:
  float32x4_t v98 = vmulq_f32(v70, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v72, (int8x16_t)v72, 0xCuLL), (int8x16_t)v72, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v71, (int32x4_t)v71), (int8x16_t)v71, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v71, (int8x16_t)v71, 0xCuLL), (int8x16_t)v71, 8uLL)));
  if (fabs(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v98, 2), vaddq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v98.f32, 1))).f32[0]+ -1.0) > 0.00001)
  {
    float32x4_t v99 = vmulq_f32(v70, v70);
    v65.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 2), vaddq_f32(v99, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 1))).f32[0]);
    float32x4_t v100 = vmulq_f32(v71, v71);
    float32x4_t v101 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v100, 2);
    int8x16_t v102 = (int8x16_t)vaddq_f32(v101, vaddq_f32(v100, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v100.f32, 1)));
    *(float *)v102.i32 = sqrtf(*(float *)v102.i32);
    float32x4_t v103 = vmulq_f32(v72, v72);
    LODWORD(v104) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1))).u32[0];
    int32x4_t v105 = vzip2q_s32((int32x4_t)v99, (int32x4_t)v103);
    float32x4_t v106 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v99, (int32x4_t)v103), (int32x4_t)v100);
    float32x4_t v107 = (float32x4_t)vtrn2q_s32((int32x4_t)v99, (int32x4_t)v100);
    v107.i32[2] = v103.i32[1];
    float32x4_t v108 = vaddq_f32((float32x4_t)vzip1q_s32(v105, (int32x4_t)v101), vaddq_f32(v106, v107));
    v107.i64[0] = 0x80000000800000;
    v107.i64[1] = 0x80000000800000;
    int32x4_t v109 = vcgeq_f32(v107, v108);
    v108.i32[3] = 0;
    float32x4_t v110 = vrsqrteq_f32(v108);
    float32x4_t v111 = vmulq_f32(v110, vrsqrtsq_f32(v108, vmulq_f32(v110, v110)));
    int32x4_t v112 = v109;
    v112.i32[3] = 0;
    float32x4_t v113 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v112), (int8x16_t)v108, (int8x16_t)vmulq_f32(v111, vrsqrtsq_f32(v108, vmulq_f32(v111, v111))));
    float32x4_t v114 = vmulq_n_f32(v70, v113.f32[0]);
    float32x4_t v115 = vmulq_lane_f32(v71, *(float32x2_t *)v113.f32, 1);
    float32x4_t v116 = vmulq_laneq_f32(v72, v113, 2);
    int8x16_t v117 = (int8x16_t)vuzp1q_s32((int32x4_t)v116, (int32x4_t)v116);
    int8x16_t v118 = (int8x16_t)vuzp1q_s32((int32x4_t)v115, (int32x4_t)v115);
    int32x4_t v119 = (int32x4_t)v114;
    if (v109.i32[0])
    {
      int8x16_t v120 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v117, (int8x16_t)v116, 0xCuLL), vnegq_f32(v115)), v116, (float32x4_t)vextq_s8(v118, (int8x16_t)v115, 0xCuLL));
      int32x4_t v119 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v120, (int32x4_t)v120), v120, 0xCuLL);
    }
    int8x16_t v121 = (int8x16_t)vuzp1q_s32((int32x4_t)v114, (int32x4_t)v114);
    float32x4_t v122 = v115;
    float v123 = sqrtf(v104);
    if (v109.i32[1])
    {
      int8x16_t v124 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v121, (int8x16_t)v114, 0xCuLL), vnegq_f32(v116)), v114, (float32x4_t)vextq_s8(v117, (int8x16_t)v116, 0xCuLL));
      float32x4_t v122 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v124, (int32x4_t)v124), v124, 0xCuLL);
    }
    v65.i32[1] = v102.i32[0];
    if (v109.i32[2])
    {
      int8x16_t v102 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v118, (int8x16_t)v115, 0xCuLL), vnegq_f32(v114)), v115, (float32x4_t)vextq_s8(v121, (int8x16_t)v114, 0xCuLL));
      float32x4_t v116 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v102, (int32x4_t)v102), v102, 0xCuLL);
    }
    v65.f32[2] = v123;
    float v125 = (float)(*(float *)v119.i32 + v122.f32[1]) + v116.f32[2];
    float32x4_t v221 = v65;
    long long v222 = v74;
    if (v125 > 0.0)
    {
      float32x4_t v126 = (float32x4_t)vzip2q_s32((int32x4_t)v122, vuzp1q_s32((int32x4_t)v122, (int32x4_t)v116));
      v126.i32[2] = v119.i32[1];
      float v127 = sqrtf(v125 + 1.0);
      float32x4_t v128 = (float32x4_t)vtrn2q_s32((int32x4_t)v116, vzip2q_s32((int32x4_t)v116, v119));
      v128.i32[2] = v122.i32[0];
      float32x4_t v130 = vsubq_f32(v126, v128);
      v126.f32[3] = v127;
      v128.f32[3] = v127;
      float32x4_t v129 = vmulq_f32(v126, v128);
      v130.i32[3] = v129.i32[3];
LABEL_41:
      v129.f32[0] = 0.5 / v127;
      float32x4_t v140 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v129.f32, 0);
      goto LABEL_42;
    }
    if (*(float *)v119.i32 < v122.f32[1] || *(float *)v119.i32 < v116.f32[2])
    {
      if (v122.f32[1] <= v116.f32[2])
      {
        float v127 = sqrtf((float)((float)(v116.f32[2] + 1.0) - *(float *)v119.i32) - v122.f32[1]);
        *(float32x2_t *)v130.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v119, (int32x4_t)v122), *(float32x2_t *)v116.f32);
        float32x2_t v141 = (float32x2_t)__PAIR64__(v119.u32[1], LODWORD(v127));
        float32x2_t v142 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v122.f32, 0);
        *(float32x2_t *)v129.f32 = vsub_f32(*(float32x2_t *)v119.i8, v142);
        v142.f32[0] = v127;
        v142.i32[0] = vmul_f32(v141, v142).u32[0];
        v142.i32[1] = v129.i32[1];
        *(float32x2_t *)&v130.u32[2] = v142;
        goto LABEL_41;
      }
      float v134 = sqrtf((float)((float)(v122.f32[1] + 1.0) - *(float *)v119.i32) - v116.f32[2]);
      *(int32x2_t *)v102.i8 = vdup_laneq_s32((int32x4_t)v122, 2);
      int8x16_t v132 = v102;
      *(float *)v132.i32 = v134;
      v132.i32[0] = vmul_f32(*(float32x2_t *)v132.i8, (float32x2_t)__PAIR64__(v116.u32[1], LODWORD(v134))).u32[0];
      v132.i32[1] = vadd_f32(*(float32x2_t *)&v102, *(float32x2_t *)&v116).i32[1];
      int8x16_t v133 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.i8, 1), v122);
      int32x2_t v139 = (int32x2_t)vsubq_f32(v116, (float32x4_t)vdupq_laneq_s32(v119, 2)).u64[0];
      float32x4_t v140 = (float32x4_t)vextq_s8(vextq_s8(v133, v133, 4uLL), v132, 0xCuLL);
      v140.i32[3] = v139.i32[0];
    }
    else
    {
      float v134 = sqrtf((float)((float)(*(float *)v119.i32 + 1.0) - v122.f32[1]) - v116.f32[2]);
      float32x2_t v135 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v122.f32, 0);
      float32x2_t v136 = vadd_f32(*(float32x2_t *)v119.i8, v135);
      v135.f32[0] = v134;
      v140.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v119.u32[1], LODWORD(v134)), v135).u32[0];
      v140.i32[1] = v136.i32[1];
      float32x2_t v137 = (float32x2_t)vzip2q_s32(v119, (int32x4_t)v122).u64[0];
      LODWORD(v138) = vadd_f32(v137, *(float32x2_t *)v116.f32).u32[0];
      int32x2_t v139 = (int32x2_t)vsub_f32(v137, *(float32x2_t *)v116.f32);
      HIDWORD(v138) = v139.i32[1];
      v140.i64[1] = v138;
    }
    *(float *)v139.i32 = 0.5 / v134;
    float32x4_t v130 = (float32x4_t)vdupq_lane_s32(v139, 0);
LABEL_42:
    float32x4_t v223 = vmulq_f32(v130, v140);
    sub_1B63F8A94(&v223);
    *(void *)&long long v74 = v222;
    float32x4_t v143 = vabsq_f32(v221);
    v143.i32[3] = 0;
    float32x4_t v144 = v223;
    v145.i64[0] = 0x8000000080000000;
    v145.i64[1] = 0x8000000080000000;
    float32x4_t v70 = (float32x4_t)vorrq_s8((int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v143, (float32x4_t)xmmword_1B6E4FCD0) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), vandq_s8((int8x16_t)v221, v145));
    float32x4_t v72 = vmulq_f32(v144, v144);
    float32x4_t v146 = vmulq_laneq_f32(v144, v144, 3);
    float v147 = vmulq_lane_f32(v144, *(float32x2_t *)v144.f32, 1).f32[0];
    float32x4_t v148 = vaddq_f32(v70, v70);
    v72.f32[0] = 0.5 - v72.f32[0];
    float32x2_t v149 = vmul_laneq_f32(*(float32x2_t *)v144.f32, v144, 2);
    v71.i32[3] = 0;
    v71.f32[0] = (float)(0.5 - v72.f32[1]) - v72.f32[2];
    v71.f32[1] = v147 + v146.f32[2];
    v150.i32[3] = 0;
    v71.f32[2] = v149.f32[0] - v146.f32[1];
    v70.i64[0] = vmulq_n_f32(v71, v148.f32[0]).u64[0];
    v150.f32[0] = v147 - v146.f32[2];
    v150.f32[1] = v72.f32[0] - v72.f32[2];
    v150.f32[2] = v149.f32[1] + v146.f32[0];
    v71.i64[0] = vmulq_lane_f32(v150, *(float32x2_t *)v148.f32, 1).u64[0];
    *(int32x2_t *)v146.f32 = vrev64_s32(*(int32x2_t *)v146.f32);
    v151.i32[0] = vadd_f32(v149, *(float32x2_t *)v146.f32).u32[0];
    v151.i32[1] = vsub_f32(v149, *(float32x2_t *)&v146).i32[1];
    v151.f32[2] = v72.f32[0] - v72.f32[1];
    v151.i32[3] = 0;
    v72.i64[0] = vmulq_laneq_f32(v151, v148, 2).u64[0];
  }
  objc_msgSend_setTransform_(self->_freeViewCameraNode, v29, v30, v31, *(double *)v70.i64, *(double *)v71.i64, *(double *)v72.i64, *(double *)&v74, *(_OWORD *)&v221, v222);
  objc_msgSend_setName_(self->_freeViewCameraNode, v152, @"kVFXFreeViewCameraName", v153);
  uint64_t v156 = objc_msgSend_stringByAppendingString_(@"kVFXFreeViewCameraName", v154, @"Camera", v155);
  v160 = objc_msgSend_camera(self->_freeViewCameraNode, v157, v158, v159);
  objc_msgSend_setName_(v160, v161, v156, v162);
  v166 = objc_msgSend_view(self, v163, v164, v165);
  if (objc_msgSend__showsAuthoringEnvironment(v166, v167, v168, v169))
  {
    v173 = objc_msgSend_camera(self->_freeViewCameraNode, v170, v171, v172);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v173, v174, 1, v175);
  }
  v176 = objc_msgSend_view(self, v170, v171, v172);
  v180 = objc_msgSend_world(v176, v177, v178, v179);
  uint64_t v184 = objc_msgSend_worldRef(v180, v181, v182, v183);
  if (v184)
  {
    uint64_t v188 = v184;
    uint64_t v189 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v185, v186, v187);
    if (!sub_1B63F4F08(v189, v190, v191, v192, v193, v194, v195, v196))
    {
      sub_1B64B0C28(v188, v197, v198, v199, v200, v201, v202, v203);
      v207 = (uint64_t *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v204, v205, v206);
      sub_1B63F4CCC(v207, v188, v208, v209, v210, v211, v212, v213);
      sub_1B64B0CB4(v188, v214, v215, v216, v217, v218, v219, v220);
    }
  }
}

- (void)_installFreeViewCameraIfNeeded
{
  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_view(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_renderer(v8, v9, v10, v11);
    if ((VFXNode *)objc_msgSend_pointOfView(v12, v13, v14, v15) != self->_freeViewCameraNode)
    {
      objc_msgSend_begin(VFXTransaction, v16, v17, v18);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v19, v20, v21, 0.0);
      objc_msgSend_setPointOfView_(v12, v22, (uint64_t)self->_freeViewCameraNode, v23);
      freeViewCameraNode = self->_freeViewCameraNode;
      uint64_t v28 = objc_msgSend_cameraController(self, v25, v26, v27);
      objc_msgSend_setPointOfView_(v28, v29, (uint64_t)freeViewCameraNode, v30);
      objc_msgSend_commit(VFXTransaction, v31, v32, v33);
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3))
  {
    if ((objc_msgSend__freeCameraActivated(self, v5, v6, v7) & 1) == 0)
    {
      objc_msgSend_begin(VFXTransaction, v8, v9, v10);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v26, v27, v28, 0.0);
      objc_msgSend__prepareFreeViewCamera(self, v29, v30, v31);
      objc_msgSend__installFreeViewCameraIfNeeded(self, v32, v33, v34);
      objc_msgSend_commit(VFXTransaction, v35, v36, v37);
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend_view(self, v5, v6, v7);
    uint64_t v15 = objc_msgSend_renderer(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_pointOfView(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_cameraController(self, v20, v21, v22);
    objc_msgSend_setPointOfView_(v23, v24, v19, v25);
  }
}

- (float)_cappedTranslationDelta:(float)a3
{
  objc_msgSend__targetDistance(self, a2, v3, v4);
  if (v10 >= 10000000.0)
  {
    uint64_t v11 = objc_msgSend_cameraController(self, v7, v8, v9);
    objc_msgSend_simdTarget(v11, v12, v13, v14);
    float32x4_t v46 = v15;
    uint64_t v19 = objc_msgSend_pointOfView(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_presentationNode(v19, v20, v21, v22);
    objc_msgSend_worldPosition(v23, v24, v25, v26);
    float32x4_t v47 = vsubq_f32(v46, v27);
    uint64_t v31 = objc_msgSend_cameraController(self, v28, v29, v30);
    v35 = objc_msgSend_pointOfView(v31, v32, v33, v34);
    objc_msgSend_worldFront(v35, v36, v37, v38);
    float32x4_t v40 = vmulq_f32(v47, v39);
    float v41 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).f32[0];
    if (v41 >= 0.0 && a3 < 0.0) {
      float v43 = 0.0;
    }
    else {
      float v43 = a3;
    }
    if (v43 > 0.0 && v41 < 0.0) {
      return 0.0;
    }
    else {
      return v43;
    }
  }
  return a3;
}

- (float)_translationCoef
{
  objc_msgSend__targetDistance(self, a2, v2, v3);
  double v5 = v4;
  if (v5 > 10000000.0) {
    double v5 = 10000000.0;
  }
  double v6 = v5 * 0.00999999978;
  BOOL v7 = v5 <= 0.1;
  double v8 = 0.000999999978;
  if (!v7) {
    return v6;
  }
  return v8;
}

- (float)_targetDistance
{
  double v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  objc_msgSend_simdTarget(v5, v6, v7, v8);
  float32x4_t v21 = v9;
  uint64_t v13 = objc_msgSend_pointOfView(self, v10, v11, v12);
  objc_msgSend_worldPosition(v13, v14, v15, v16);
  float32x4_t v18 = vsubq_f32(v17, v21);
  float32x4_t v19 = vmulq_f32(v18, v18);
  float result = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
  if (result <= 0.1) {
    return 0.1;
  }
  return result;
}

- (void)rotateOf:(float)a3
{
  objc_msgSend_begin(VFXTransaction, a2, v3, v4);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.0);
  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, v10, v11, v12)) {
    objc_msgSend__switchToFreeViewCamera(self, v10, v11, v12);
  }
  uint64_t v13 = objc_msgSend_view(self, v10, v11, v12);
  objc_msgSend_bounds(v13, v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  double v21 = v17 * 0.5;
  double v22 = v19 * 0.5;
  uint64_t v26 = objc_msgSend_cameraController(self, v23, v24, v25);
  *(float *)&double v27 = a3;
  objc_msgSend_rollBy_aroundScreenPoint_viewport_(v26, v28, v29, v30, v27, v21, v22, v18, v20);

  objc_msgSend_commit(VFXTransaction, v31, v32, v33);
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  BOOL v5 = a4;
  if (objc_msgSend_pointOfView(self, a2, a4, v4))
  {
    if (v5)
    {
      objc_msgSend_begin(VFXTransaction, v8, v9, v10);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.3);
      double v17 = objc_msgSend_cameraController(self, v14, v15, v16);
      *(float *)&double v18 = a3 * -100.0;
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v17, v19, v20, v21, 0.0, 0.0, v18);
      objc_msgSend_commit(VFXTransaction, v22, v23, v24);
    }
    else
    {
      uint64_t v25 = objc_msgSend_cameraController(self, v8, v9, v10);
      *(float *)&double v29 = a3 * -100.0;
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v25, v26, v27, v28, 0.0, 0.0, v29);
    }
  }
}

- (void)zoomBy:(float)a3
{
}

- (float)zoomFactor
{
  int v5 = objc_msgSend__pointOfViewUsesOrthographicProjection(self, a2, v2, v3);
  uint64_t v6 = 76;
  if (v5) {
    uint64_t v6 = 84;
  }
  return *(float *)((char *)&self->super.isa + v6);
}

- (id)pointOfView
{
  uint64_t v4 = objc_msgSend_cameraController(self, a2, v2, v3);

  return (id)objc_msgSend_pointOfView(v4, v5, v6, v7);
}

- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3
{
  objc_msgSend__orthographicScaleForZoomFactor_(self, a2, v3, v4);
  float v8 = v7;
  objc_msgSend__worldBoundingSphere(self, v9, v10, v11);
  float v16 = v15;
  if (v15 != 0.0)
  {
    double v17 = objc_msgSend_view(self, v12, v13, v14);
    objc_msgSend_bounds(v17, v18, v19, v20);
    float v22 = v21;
    uint64_t v26 = objc_msgSend_view(self, v23, v24, v25);
    objc_msgSend_bounds(v26, v27, v28, v29);
    float v31 = v30;
    if (v31 >= v22) {
      float v32 = v30;
    }
    else {
      float v32 = v22;
    }
    if (v31 >= v22) {
      float v31 = v22;
    }
    float v33 = v31 / fmaxf(v32, 1.0);
    float originalOrthoScale = self->_originalOrthoScale;
    double v35 = v16 * 10000000.0;
    if (v35 <= originalOrthoScale)
    {
      float v37 = self->_originalOrthoScale;
    }
    else
    {
      float v36 = v35;
      float v37 = v36;
    }
    double v38 = v16 * 0.00001 * v33;
    if (v38 <= originalOrthoScale)
    {
      float v39 = v38;
      float v40 = v39;
    }
    else
    {
      float v40 = self->_originalOrthoScale;
    }
    if (v8 <= v37)
    {
      if (v8 < v40) {
        return originalOrthoScale / v40;
      }
    }
    else
    {
      return originalOrthoScale / v37;
    }
  }
  return a3;
}

- (float)_orthographicScaleForZoomFactor:(float)a3
{
  return self->_originalOrthoScale / a3;
}

- (void)setZoomFactor:(float)a3
{
  objc_msgSend_zoomFactor(self, a2, v3, v4);
  if (a3 > 0.0 && v10 != a3)
  {
    uint64_t v12 = objc_msgSend_pointOfView(self, v7, v8, v9);
    if (objc_msgSend__pointOfViewUsesOrthographicProjection(self, v13, v14, v15))
    {
      *(float *)&double v19 = a3;
      objc_msgSend__orthographicZoomFactorForProposedZoomFactor_(self, v16, v17, v18, v19);
      self->_orthographicZoomFactor = v20;
      objc_msgSend__orthographicScaleForZoomFactor_(self, v21, v22, v23);
      MEMORY[0x1F4181798](self, sel__setPointOfViewOrthographicScale_, v24, v25);
    }
    else
    {
      long double v26 = tan(self->_cameraOriginalFieldOfView * 0.5 / 180.0 * 3.14159265);
      long double v30 = atan(v26 / a3);
      *(float *)&long double v30 = v30 / 3.14159265 * 180.0 + v30 / 3.14159265 * 180.0;
      double v31 = fmin(*(float *)&v30, 120.0);
      if (v31 < 1.0) {
        double v31 = 1.0;
      }
      float v32 = v31;
      float v33 = objc_msgSend_camera(v12, v27, v28, v29);
      *(float *)&double v34 = v32;
      objc_msgSend_setFieldOfView_(v33, v35, v36, v37, v34);
      self->_fieldOfViewZoomFactor = a3;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  v29.i64[0] = *(void *)&a3;
  if (objc_msgSend_pointOfView(self, a2, v5, v6))
  {
    *(float *)&double v12 = a5;
    objc_msgSend__cappedTranslationDelta_(self, v9, v10, v11, v12);
    float32x4_t v13 = v29;
    v13.f32[1] = a4;
    v13.i32[2] = v14;
    float32x4_t v30 = v13;
    objc_msgSend__translationCoef(self, v15, v16, v17);
    float32x4_t v31 = vmulq_n_f32(v30, v18);
    uint64_t v22 = objc_msgSend_cameraController(self, v19, v20, v21);
    LODWORD(v27) = v31.i32[1];
    *(float *)&double v26 = -v31.f32[2];
    objc_msgSend_translateInCameraSpaceByX_Y_Z_(v22, v23, v24, v25, *(double *)v31.i64, v27, v26);
  }
}

- (void)cameraRotationWillStartForController:(id)a3
{
  uint64_t v5 = objc_msgSend_pointOfView(a3, a2, (uint64_t)a3, v3);
  if (objc_msgSend_authoringCameraType(v5, v6, v7, v8))
  {
    objc_msgSend__switchToFreeViewCamera(self, v9, v10, v11);
  }
}

- (void)worldWillChange
{
  *(_WORD *)&self->_isWorldBoundingSphereComputed = 0;
  uint64_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  objc_msgSend_setSimdTarget_(v5, v6, v7, v8, 0.0);

  objc_msgSend__resetFreeViewCamera(self, v9, v10, v11);
}

- (void)worldDidChange
{
  objc_msgSend_invalidateCameraTarget(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_view(self, v5, v6, v7);
  double v12 = objc_msgSend_renderer(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_pointOfView(v12, v13, v14, v15);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = objc_msgSend_cameraController(self, v17, v18, v19);
    objc_msgSend_setPointOfView_(v21, v22, v20, v23);
    self->_cameraTargetComputed = 0;
    double v27 = objc_msgSend_cameraController(self, v24, v25, v26);
    objc_msgSend_setSimdTarget_(v27, v28, v29, v30, 0.0);
    objc_msgSend__computeAutomaticTargetPointIfNeeded(self, v31, v32, v33);
  }
}

- (void)viewWillDrawAtTime:(double)a3
{
  uint64_t v7 = objc_msgSend_immediateMode(VFXTransaction, a2, v3, v4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  float32x4_t v13 = objc_msgSend_cameraController(self, v10, v11, v12);
  if (objc_msgSend_isInertiaRunning(v13, v14, v15, v16))
  {
    uint64_t v20 = objc_msgSend_view(self, v17, v18, v19);
    uint64_t v24 = objc_msgSend_world(v20, v21, v22, v23);
    uint64_t v28 = objc_msgSend_worldRef(v24, v25, v26, v27);
    if (v28)
    {
      uint64_t v36 = v28;
      sub_1B64B0C28(v28, (uint64_t)v29, v30, v31, v32, v33, v34, v35);
      float v40 = objc_msgSend_cameraController(self, v37, v38, v39);
      objc_msgSend_updateInertiaAtTime_(v40, v41, v42, v43, a3);
      sub_1B64B0CB4(v36, v44, v45, v46, v47, v48, v49, v50);
    }
    else
    {
      uint64_t v51 = objc_msgSend_cameraController(self, v29, v30, v31);
      objc_msgSend_updateInertiaAtTime_(v51, v52, v53, v54, a3);
    }
  }
  os_unfair_lock_unlock(&self->_drawAtTimeLock);

  objc_msgSend_setImmediateMode_(VFXTransaction, v55, v7, v56);
}

- (void)_setupUpVector
{
  uint64_t v5 = objc_msgSend_pointOfView(self, a2, v2, v3);
  objc_msgSend_convertVector_fromNode_(v5, v6, 0, v7);
  if (fabsf(v11.f32[0]) < 0.001 && fabsf(v11.f32[1]) < 0.001) {
    goto LABEL_19;
  }
  v11.i32[2] = 0;
  float32x4_t v12 = vmulq_f32(v11, v11);
  v12.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u64[0];
  float32x4_t v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 0);
  v13.i32[3] = 0;
  float32x4_t v14 = vrsqrteq_f32(v13);
  float32x4_t v15 = vmulq_f32(v14, vrsqrtsq_f32(v13, vmulq_f32(v14, v14)));
  int32x4_t v16 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v12.f32[0] != 0.0)), 0x1FuLL));
  v16.i32[3] = 0;
  float32x4_t v17 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v16), (int8x16_t)vmulq_f32(v11, vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)))), (int8x16_t)v11);
  float32x4_t v18 = (float32x4_t)xmmword_1B6E4F320;
  float32x4_t v19 = vmulq_f32(v17, (float32x4_t)xmmword_1B6E4F320);
  LODWORD(v20) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).u32[0];
  if (fabsf(v20) > 0.99) {
    goto LABEL_19;
  }
  if (v20 >= 0.0)
  {
    float32x4_t v50 = vaddq_f32(v17, (float32x4_t)xmmword_1B6E4F320);
    int32x4_t v51 = (int32x4_t)vmulq_f32(v50, v50);
    v51.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v51, 2), vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v51.i8, 1))).u32[0];
    float32x2_t v52 = vrsqrte_f32((float32x2_t)v51.u32[0]);
    float32x2_t v53 = vmul_f32(v52, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v52, v52)));
    float32x4_t v54 = vmulq_n_f32(v50, vmul_f32(v53, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v53, v53))).f32[0]);
    int8x16_t v55 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v54, (int32x4_t)v54), (int8x16_t)v54, 0xCuLL), vnegq_f32(v17)), v54, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
    float32x4_t v49 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v55, (int32x4_t)v55), v55, 0xCuLL);
    float32x4_t v56 = vmulq_f32(v17, v54);
    v49.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).u32[0];
  }
  else
  {
    int32x4_t v21 = (int32x4_t)vmulq_f32(v17, v17);
    v21.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))).u32[0];
    float32x2_t v22 = vrsqrte_f32((float32x2_t)v21.u32[0]);
    float32x2_t v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v22, v22)));
    float32x2_t v24 = vrsqrte_f32((float32x2_t)1065353216);
    float32x2_t v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v24, v24)));
    float32x4_t v26 = vaddq_f32(vmulq_n_f32(v17, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v23, v23))).f32[0]), vmulq_n_f32((float32x4_t)xmmword_1B6E4F320, vmul_f32(v25, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v25, v25))).f32[0]));
    float32x4_t v27 = vmulq_f32(v26, v26);
    float v28 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0];
    if (v28 <= 1.4211e-14)
    {
      float32x4_t v57 = vabsq_f32(v17);
      float v58 = v57.f32[1];
      float v59 = v57.f32[2];
      if (v57.f32[0] > v57.f32[1] || v57.f32[0] > v57.f32[2])
      {
        float32x4_t v61 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
        if (v58 <= v59)
        {
          float32x4_t v62 = vmulq_f32(v17, (float32x4_t)xmmword_1B6E4F4F0);
        }
        else
        {
          float32x4_t v62 = vmulq_f32(v17, (float32x4_t)xmmword_1B6E4F4C0);
          float32x4_t v18 = (float32x4_t)xmmword_1B6E4F2E0;
        }
        float32x4_t v63 = vmlaq_f32(v62, v18, v61);
      }
      else
      {
        float32x4_t v63 = vmlaq_f32(vmulq_f32(v17, (float32x4_t)xmmword_1B6E4F4D0), (float32x4_t)xmmword_1B6E4F300, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
      }
      float32x4_t v64 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v63, (int32x4_t)v63), (int8x16_t)v63, 0xCuLL);
      int32x4_t v65 = (int32x4_t)vmulq_f32(v63, v63);
      v65.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v65.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v65, 2), *(float32x2_t *)v65.i8)).u32[0];
      float32x2_t v66 = vrsqrte_f32((float32x2_t)v65.u32[0]);
      float32x2_t v67 = vmul_f32(v66, vrsqrts_f32((float32x2_t)v65.u32[0], vmul_f32(v66, v66)));
      float32x4_t v49 = vmulq_n_f32(v64, vmul_f32(v67, vrsqrts_f32((float32x2_t)v65.u32[0], vmul_f32(v67, v67))).f32[0]);
      v49.i32[3] = 0;
    }
    else
    {
      uint64_t v29 = LODWORD(v28);
      float32x2_t v30 = vrsqrte_f32((float32x2_t)LODWORD(v28));
      float32x2_t v31 = vmul_f32(v30, vrsqrts_f32((float32x2_t)v29, vmul_f32(v30, v30)));
      float32x4_t v32 = vmulq_n_f32(v26, vmul_f32(v31, vrsqrts_f32((float32x2_t)v29, vmul_f32(v31, v31))).f32[0]);
      float32x4_t v33 = vaddq_f32(v17, v32);
      int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
      float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
      float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
      float32x4_t v37 = vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
      float32x4_t v38 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL), vnegq_f32(v17)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
      float32x4_t v39 = vmulq_f32(v17, v37);
      float32x4_t v40 = vaddq_f32(v32, (float32x4_t)xmmword_1B6E4F320);
      int32x4_t v41 = (int32x4_t)vmulq_f32(v40, v40);
      v41.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1))).u32[0];
      *(float32x2_t *)v37.f32 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      *(float32x2_t *)v37.f32 = vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32)));
      float32x4_t v42 = vmulq_n_f32(v40, vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32))).f32[0]);
      int8x16_t v43 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL), vnegq_f32(v32)), v42, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v32, 0xCuLL));
      float32x4_t v44 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), v43, 0xCuLL);
      float32x4_t v45 = vmulq_f32(v32, v42);
      v44.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).u32[0];
      int8x16_t v46 = (int8x16_t)vnegq_f32(v44);
      int8x16_t v47 = (int8x16_t)vtrn2q_s32((int32x4_t)v44, vtrn1q_s32((int32x4_t)v44, (int32x4_t)v46));
      float32x4_t v48 = (float32x4_t)vrev64q_s32((int32x4_t)v44);
      v48.i32[0] = v46.i32[1];
      v48.i32[3] = v46.i32[2];
      float32x4_t v49 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]), v48, *(float32x2_t *)v38.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v44, v46, 8uLL), v38.f32[0]), (float32x4_t)vextq_s8(v47, v47, 8uLL), v38, 2));
    }
  }
  float32x4_t v68 = vmulq_f32(v49, (float32x4_t)xmmword_1B6E4F550);
  int8x16_t v69 = (int8x16_t)vnegq_f32(v68);
  int8x16_t v70 = (int8x16_t)vtrn2q_s32((int32x4_t)v68, vtrn1q_s32((int32x4_t)v68, (int32x4_t)v69));
  float32x4_t v71 = vmlaq_f32((float32x4_t)vextq_s8((int8x16_t)v68, v69, 8uLL), (float32x4_t)0, (float32x4_t)vextq_s8(v70, v70, 8uLL));
  float32x4_t v72 = (float32x4_t)vrev64q_s32((int32x4_t)v68);
  v72.i32[0] = v69.i32[1];
  v72.i32[3] = v69.i32[2];
  float32x4_t v73 = vmlaq_f32(v71, (float32x4_t)0, v72);
  int8x16_t v74 = (int8x16_t)vnegq_f32(v73);
  int8x16_t v75 = (int8x16_t)vtrn2q_s32((int32x4_t)v73, vtrn1q_s32((int32x4_t)v73, (int32x4_t)v74));
  float32x4_t v76 = (float32x4_t)vrev64q_s32((int32x4_t)v73);
  v76.i32[0] = v74.i32[1];
  v76.i32[3] = v74.i32[2];
  uint64_t v77 = objc_msgSend_pointOfView(self, v8, v9, v10, vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v73, v49, 3), v76, v49, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v73, v74, 8uLL), *(float32x2_t *)v49.f32, 1), (float32x4_t)vextq_s8(v75, v75, 8uLL), v49.f32[0])));
  objc_msgSend_worldRight(v77, v78, v79, v80);
  float32x4_t v82 = vmulq_f32(v81, v85);
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v82, 2), vaddq_f32(v82, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v82.f32, 1))).f32[0]) <= 0.70711)
  {
    cameraController = self->_cameraController;
    MEMORY[0x1F4181798](cameraController, sel_setSimdUp_, v9, v10);
  }
  else
  {
LABEL_19:
    v83 = self->_cameraController;
    MEMORY[0x1F4181798](v83, sel_setUp_, v9, v10);
  }
}

- (void)_willBeginInteraction
{
  if (!self->_cameraTargetComputed)
  {
    uint64_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
    if ((objc_msgSend_automaticTarget(v5, v6, v7, v8) & 1) == 0)
    {
      uint64_t v9 = objc_msgSend_cameraController(self, a2, v2, v3);
      objc_msgSend_simdTarget(v9, v10, v11, v12);
      uint32x4_t v14 = (uint32x4_t)vceqzq_f32(v13);
      v14.i32[3] = v14.i32[2];
      if ((vminvq_u32(v14) & 0x80000000) != 0)
      {
        self->_cameraTargetComputed = 1;
        float32x4_t v15 = objc_msgSend_view(self, a2, v2, v3);
        uint64_t v19 = objc_msgSend_world(v15, v16, v17, v18);
        objc_msgSend__defaultTargetForWorld_(self, v20, v19, v21);
        double v46 = v22;
        float32x4_t v26 = objc_msgSend_cameraController(self, v23, v24, v25);
        objc_msgSend_setSimdTarget_(v26, v27, v28, v29, v46);
      }
    }
  }
  objc_msgSend__stopInertia(self, a2, v2, v3);
  float32x4_t v33 = objc_msgSend_pointOfView(self, v30, v31, v32);
  float32x4_t v37 = objc_msgSend_camera(v33, v34, v35, v36);
  objc_msgSend_fieldOfView(v37, v38, v39, v40);
  self->_cameraOriginalFieldOfView = v41;
  self->_fieldOfViewZoomFactor = 1.0;
  objc_msgSend__pointOfViewOrthographicScale(self, v42, v43, v44);
  self->_float originalOrthoScale = v45;
  self->_orthographicZoomFactor = 1.0;
}

- (void)cameraDidChange
{
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_cameraController(self, v14, v15, v16);
  objc_msgSend_setPointOfView_(v17, v18, v13, v19);

  MEMORY[0x1F4181798](self, sel__setupUpVector, v20, v21);
}

- (void)_stopInertia
{
  p_drawAtTimeLock = &self->_drawAtTimeLock;
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  uint64_t v7 = objc_msgSend_cameraController(self, v4, v5, v6);
  objc_msgSend_stopInertia(v7, v8, v9, v10);

  os_unfair_lock_unlock(p_drawAtTimeLock);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  int v7 = objc_msgSend_enabled(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v7)
  {
    pressGesture = self->_pressGesture;
    BOOL v9 = pressGesture == a3 || pressGesture == a4;
    LOBYTE(v7) = v9
              || (tapGesture = self->_tapGesture, panGesture = self->_panGesture, tapGesture == a3)
              && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)
              || tapGesture == a4 && panGesture == a3
              || tapGesture == a4 && self->_pinchGesture == a3;
  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int v8 = objc_msgSend_enabled(self, a2, (uint64_t)a3, v3);
  if (v8) {
    objc_msgSend_beginGesture_(self, v6, (uint64_t)a3, v7);
  }
  return v8;
}

- (void)_handlePinch:(id)a3
{
  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
  {
    MEMORY[0x1F4181798](self, sel_pinchWithGestureRecognizer_, a3, v6);
  }
}

- (void)_handlePan:(id)a3
{
  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
  {
    MEMORY[0x1F4181798](self, sel_panWithGestureRecognizer_, a3, v6);
  }
}

- (void)_handleRotation:(id)a3
{
  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
  {
    MEMORY[0x1F4181798](self, sel_rotateWithGestureRecognizer_, a3, v6);
  }
}

- (void)_handleDoubleTap:(id)a3
{
  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
  {
    uint64_t v8 = objc_msgSend_delegate(self, v5, v6, v7);
    MEMORY[0x1F4181798](v8, sel_switchToNextCamera, v9, v10);
  }
}

- (void)beginGesture:(id)a3
{
  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, a2, (uint64_t)a3, v3)) {
    objc_msgSend__switchToFreeViewCamera(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__willBeginInteraction(self, a2, (uint64_t)a3, v3);
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend_numberOfTouches(a3, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_view(self, v9, v10, v11);
    objc_msgSend_locationInView_(a3, v13, v12, v14);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = 0.0;
    double v18 = 0.0;
  }
  self->_lastInputLocation.x = v16;
  self->_lastInputLocation.y = v18;
  self->_lastRotationAngle = 0.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend__startBrowsingIfNeeded_(self, v19, v20, v21, v16, v18);
    int64_t v22 = 2;
LABEL_13:
    self->_browseMode = v22;
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend__startBrowsingIfNeeded_(self, v23, v24, v25, v16, v18);
    if (self->_translationAllowed)
    {
      self->_browseMode = 3;
      uint64_t v29 = objc_msgSend_view(self, v26, v27, v28);
      objc_msgSend_bounds(v29, v30, v31, v32);
      objc_msgSend__computeTranslationOrigin3DFromPoint_(self, v34, v35, v36, v16, v33 - v18);
    }
    int64_t v22 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_zoomFactor(self, v37, v38, v39);
    self->_initialZoom = v40;
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  objc_msgSend_rotation(a3, a2, (uint64_t)a3, v3);
  double v7 = v6;
  objc_msgSend__stopInertia(self, v8, v9, v10);
  if (objc_msgSend_state(a3, v11, v12, v13) == 1) {
    objc_msgSend___willChangePointOfView(self, v14, v15, v16);
  }
  objc_msgSend_begin(VFXTransaction, v14, v15, v16);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v17, v18, v19, 0.0);
  double v20 = (v7 - self->_lastRotationAngle) / 3.14159265 * -180.0;
  *(float *)&double v20 = v20;
  objc_msgSend_rotateOf_(self, v21, v22, v23, v20);
  objc_msgSend_commit(VFXTransaction, v24, v25, v26);
  float v27 = v7;
  self->_lastRotationAngle = v27;
  if (objc_msgSend_state(a3, v28, v29, v30) == 4 || objc_msgSend_state(a3, v31, v32, v33) == 3)
  {
    objc_msgSend___didChangePointOfView(self, v31, v32, v33);
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  objc_msgSend__stopInertia(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_state(a3, v6, v7, v8) == 1) {
    objc_msgSend___willChangePointOfView(self, v9, v10, v11);
  }
  objc_msgSend_begin(VFXTransaction, v9, v10, v11);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v12, v13, v14, 0.0);
  double v15 = fmax(self->_initialZoom, 0.001);
  objc_msgSend_scale(a3, v16, v17, v18);
  double v20 = v19 * v15;
  *(float *)&double v20 = v20;
  objc_msgSend_setZoomFactor_(self, v21, v22, v23, v20);
  objc_msgSend_commit(VFXTransaction, v24, v25, v26);
  if (objc_msgSend_state(a3, v27, v28, v29) == 4 || objc_msgSend_state(a3, v30, v31, v32) == 3)
  {
    objc_msgSend___didChangePointOfView(self, v30, v31, v32);
  }
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v6 = objc_msgSend_numberOfTouches(a3, a2, (uint64_t)a3, v3);
  if (self->_browseMode != 2)
  {
    uint64_t v10 = v6;
    uint64_t v11 = objc_msgSend_view(self, v7, v8, v9);
    objc_msgSend_locationInView_(a3, v12, v11, v13);
    double v15 = v14;
    double v17 = v16;
    objc_msgSend__stopInertia(self, v18, v19, v20);
    if (objc_msgSend_state(a3, v21, v22, v23) == 1) {
      objc_msgSend___willChangePointOfView(self, v24, v25, v26);
    }
    objc_msgSend_begin(VFXTransaction, v24, v25, v26);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v27, v28, v29, 0.0);
    if (objc_msgSend_state(a3, v30, v31, v32) == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        uint64_t v36 = objc_msgSend_view(self, v33, v34, v35);
        objc_msgSend_velocityInView_(a3, v37, v36, v38);
        float32x4_t v42 = objc_msgSend_view(self, v39, v40, v41);
        if (objc_msgSend_preferredFramesPerSecond(v42, v43, v44, v45))
        {
          float32x4_t v49 = objc_msgSend_view(self, v46, v47, v48);
          objc_msgSend_preferredFramesPerSecond(v49, v50, v51, v52);
        }
        float32x2_t v53 = objc_msgSend_cameraController(self, v46, v47, v48);
        float32x4_t v57 = objc_msgSend_view(self, v54, v55, v56);
        objc_msgSend_bounds(v57, v58, v59, v60);
        objc_msgSend_endInteraction_withViewport_velocity_(v53, v61, v62, v63, v15, v17);
        float32x2_t v67 = objc_msgSend_cameraController(self, v64, v65, v66);
        if ((objc_msgSend_isInertiaRunning(v67, v68, v69, v70) & 1) == 0) {
          objc_msgSend___didChangePointOfView(self, v33, v34, v35);
        }
      }
    }
    else
    {
      switch(v10)
      {
        case 3:
          if (self->_lastGestureFingerCount != 3)
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            self->_lastGestureFingerCount = 3;
          }
          objc_msgSend__translationCoef(self, v33, v34, v35);
          float v92 = v91;
          double v93 = v17 - self->_lastInputLocation.y;
          *(float *)&double v93 = v93;
          objc_msgSend__cappedTranslationDelta_(self, v94, v95, v96, v93);
          float v98 = v97;
          int8x16_t v102 = objc_msgSend_cameraController(self, v99, v100, v101);
          *(float *)&double v103 = -(float)(v92 * v98);
          objc_msgSend_translateInCameraSpaceByX_Y_Z_(v102, v104, v105, v106, 0.0, 0.0, v103);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            self->_lastGestureFingerCount = 2;
          }
          float32x4_t v107 = objc_msgSend_view(self, v33, v34, v35);
          objc_msgSend_bounds(v107, v108, v109, v110);
          double v17 = v111 - v17;
          objc_msgSend__translateToViewPoint_(self, v112, v113, v114, v15, v17);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            float32x4_t v71 = objc_msgSend_cameraController(self, v33, v34, v35);
            int8x16_t v75 = objc_msgSend_view(self, v72, v73, v74);
            objc_msgSend_bounds(v75, v76, v77, v78);
            double v80 = v79;
            double v82 = v81;
            objc_msgSend__modeSensitivity(self, v83, v84, v85);
            LODWORD(v87) = v86;
            objc_msgSend_continueInteraction_withViewport_sensitivity_(v71, v88, v89, v90, v15, v17, v80, v82, v87);
          }
          else
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            int8x16_t v118 = objc_msgSend_cameraController(self, v115, v116, v117);
            float32x4_t v122 = objc_msgSend_view(self, v119, v120, v121);
            objc_msgSend_bounds(v122, v123, v124, v125);
            objc_msgSend_beginInteraction_withViewport_(v118, v126, v127, v128, v15, v17);
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
    objc_msgSend_commit(VFXTransaction, v33, v34, v35);
    self->_lastInputLocation.x = v15;
    self->_lastInputLocation.y = v17;
  }
}

- (float)_modeSensitivity
{
  uint64_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  unint64_t v9 = objc_msgSend_interactionMode(v5, v6, v7, v8);
  if (v9 >= 5)
  {
    if (v9 == 6)
    {
      MEMORY[0x1F4181798](self, sel_truckSensitivity, v10, v11);
    }
    else if (v9 == 5)
    {
      MEMORY[0x1F4181798](self, sel_panSensitivity, v10, v11);
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    MEMORY[0x1F4181798](self, sel_rotationSensitivity, v10, v11);
  }
  return result;
}

- (uint64_t)worldFront
{
  uint64_t v4 = objc_msgSend_cameraController(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_pointOfView(v4, v5, v6, v7);

  return objc_msgSend_worldFront(v8, v9, v10, v11);
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_msgSend_begin(VFXTransaction, a2, v3, v4);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v8, v9, v10, 0.0);
  double v17 = (VFXNode *)objc_msgSend_pointOfView(self, v11, v12, v13);
  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, v14, v15, v16)) {
    objc_msgSend__prepareFreeViewCamera(self, v14, v15, v16);
  }
  if (!objc_msgSend_parentNode(v17, v14, v15, v16) && v17 != self->_freeViewCameraNode) {
    objc_msgSend__installFreeViewCameraIfNeeded(self, v18, v19, v20);
  }
  objc_msgSend_commit(VFXTransaction, v18, v19, v20);
  self->_initialInputLocation.CGFloat x = x;
  self->_initialInputLocation.CGFloat y = y;
  uint64_t v24 = objc_msgSend_pointOfView(self, v21, v22, v23);
  objc_msgSend_convertPosition_toNode_(v24, v25, 0, v26, 0.0);
  *(_OWORD *)self->_initialPointOfViewWorldPosition = v27;
  objc_msgSend__pointOfViewOrthographicScale(self, v28, v29, v30);
  self->_float originalOrthoScale = v31;
  self->_orthographicZoomFactor = 1.0;
}

- (double)_defaultTargetForWorld:(void *)a3
{
  uint64_t v6 = objc_msgSend_pointOfView(a1, a2, (uint64_t)a3, a4);
  objc_msgSend_worldFront(a1, v7, v8, v9);
  float32x4_t v66 = v10;
  double v14 = objc_msgSend_presentationObject(v6, v11, v12, v13);
  objc_msgSend_convertPosition_toNode_(v14, v15, 0, v16, 0.0);
  float32x4_t v67 = v17;
  objc_msgSend__worldBoundingSphere(a1, v18, v19, v20);
  double v63 = *(double *)v21.i64;
  float32x4_t v64 = vsubq_f32(v21, v67);
  uint64_t v25 = objc_msgSend_camera(v6, v22, v23, v24);
  objc_msgSend_fieldOfView(v25, v26, v27, v28);
  float v30 = v29 * 3.14159265 / 180.0;
  float v34 = cosf(v30);
  int32x4_t v35 = (int32x4_t)vmulq_f32(v64, v64);
  v35.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1))).u32[0];
  float32x2_t v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  float32x2_t v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  float32x4_t v38 = vmulq_f32(v66, vmulq_n_f32(v64, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]));
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0] > v34)return v63; {
  uint64_t v40 = objc_msgSend_camera(v6, v31, v32, v33);
  }
  objc_msgSend_zFar(v40, v41, v42, v43);
  *(void *)&double v65 = vmlaq_n_f32(v67, v66, v44).u64[0];
  uint64_t v48 = objc_msgSend_rootNode(a3, v45, v46, v47);
  uint64_t v51 = objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(v48, v49, 0, v50, *(double *)v67.i64, v65);
  if (objc_msgSend_count(v51, v52, v53, v54))
  {
    Object = objc_msgSend_firstObject(v51, v55, v56, v57);
    objc_msgSend_worldCoordinates(Object, v59, v60, v61);
  }
  else
  {
    objc_msgSend__targetDistance(a1, v55, v56, v57);
    *(void *)&double result = vmlaq_n_f32(v67, v66, v62).u64[0];
  }
  return result;
}

- (uint64_t)cameraAutomaticTargetPoint
{
  objc_msgSend__computeAutomaticTargetPointIfNeeded(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_cameraController(a1, v5, v6, v7);

  return objc_msgSend_target(v8, v9, v10, v11);
}

- (void)_computeAutomaticTargetPointIfNeeded
{
  if (self->_target.hasAutomatic && !self->_target.automaticLocationUpToDate)
  {
    uint64_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
    if ((objc_msgSend_automaticTarget(v5, v6, v7, v8) & 1) == 0)
    {
      self->_target.automaticLocationUpToDate = 1;
      uint64_t v12 = objc_msgSend_pointOfView(self, v9, v10, v11);
      objc_msgSend_worldFront(self, v13, v14, v15);
      float32x4_t v44 = v16;
      objc_msgSend__targetDistance(self, v17, v18, v19);
      float v45 = v20;
      uint64_t v24 = objc_msgSend_presentationNode(v12, v21, v22, v23);
      objc_msgSend_worldPosition(v24, v25, v26, v27);
      float32x4_t v32 = v31;
      if (self->_didEverFocusNode)
      {
        float32x4_t v34 = v44;
        float v33 = v45;
      }
      else
      {
        float32x4_t v46 = v31;
        objc_msgSend__worldBoundingSphere(self, v28, v29, v30);
        float32x4_t v32 = v46;
        float32x4_t v36 = vsubq_f32(v35, v46);
        float32x4_t v37 = vmulq_f32(v44, v36);
        BOOL v38 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0] <= 0.5;
        float32x4_t v34 = v44;
        float v33 = v45;
        if (!v38)
        {
          float32x4_t v39 = vmulq_f32(v36, v36);
          float v33 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]);
        }
      }
      *(void *)&double v47 = vmlaq_n_f32(v32, v34, v33).u64[0];
      uint64_t v40 = objc_msgSend_cameraController(self, v28, v29, v30);
      objc_msgSend_setSimdTarget_(v40, v41, v42, v43, v47);
    }
  }
}

- (__n128)_worldBoundingSphere
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 91))
  {
    uint64_t v5 = objc_msgSend_view((void *)a1, a2, a3, a4);
    uint64_t v9 = objc_msgSend_world(v5, v6, v7, v8);
    if (objc_msgSend_rootNode(v9, v10, v11, v12))
    {
      float32x4_t v16 = objc_msgSend_view((void *)a1, v13, v14, v15);
      float v20 = objc_msgSend_world(v16, v17, v18, v19);
      v30[0] = objc_msgSend_rootNode(v20, v21, v22, v23);
      uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v30, 1);
      VFXNodeGetBoundingSphere(v25, 0, v26, v27);
      *(_OWORD *)(a1 + 112) = v28;
      *(unsigned char *)(a1 + 91) = 1;
    }
  }
  return *(__n128 *)(a1 + 112);
}

- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4
{
  *(_OWORD *)a4 = xmmword_1B6E50860;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B6435F14;
  v6[3] = &unk_1E6141E90;
  v6[4] = a4;
  sub_1B64A18A4((uint64_t)a3, (uint64_t)v6);
  return *((float *)a4 + 3) >= 0.0;
}

- (void)_computeStickyAxisIfNeeded:(CGPoint)a3
{
  if (self->_stickyAxis.stickyMoveEnabled && !*(void *)&self->_anon_101[15])
  {
    CGFloat y = a3.y;
    float32x2_t v4 = vcvt_f32_f64(vaddq_f64((float64x2_t)a3, vcvtq_f64_f32(*(float32x2_t *)&self->_anon_101[7])));
    *(float32x2_t *)&self->_anon_101[7] = v4;
    if (vaddv_f32(vmul_f32(v4, v4)) > 1.0)
    {
      int32x2_t v5 = vdup_n_s32(self->_browseMode == 3);
      int8x16_t v6 = (int8x16_t)vcvtq_f64_f32(v4);
      v7.i64[0] = v5.u32[0];
      v7.i64[1] = v5.u32[1];
      float64x2_t v8 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), v6, vextq_s8(v6, v6, 8uLL));
      float64x2_t v9 = vabsq_f64(v8);
      if ((vmovn_s64(vcgeq_f64(v9, (float64x2_t)vdupq_laneq_s64((int64x2_t)v9, 1))).u8[0] & 1) != 0 && v8.f64[0] != 0.0)
      {
        uint64_t v10 = 1;
LABEL_10:
        *(void *)&self->_anon_101[15] = v10;
        return;
      }
      if (v8.f64[1] != 0.0)
      {
        uint64_t v10 = 2;
        goto LABEL_10;
      }
    }
  }
}

- (float)_pointOfViewOrthographicScale
{
  int32x2_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  float64x2_t v9 = objc_msgSend_pointOfView(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_camera(v9, v10, v11, v12);
  float32x4_t v17 = objc_msgSend_cameraController(self, v14, v15, v16);
  float32x4_t v21 = objc_msgSend_pointOfView(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_light(v21, v22, v23, v24);
  if (!v13)
  {
    uint64_t v13 = (void *)v25;
    if (!v25) {
      return 1.0;
    }
  }

  objc_msgSend_orthographicScale(v13, v26, v27, v28);
  return result;
}

- (void)_setPointOfViewOrthographicScale:(float)a3
{
  uint64_t v7 = objc_msgSend_cameraController(self, a2, v3, v4);
  uint64_t v11 = objc_msgSend_pointOfView(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_camera(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_cameraController(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_pointOfView(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_light(v23, v24, v25, v26);
  if (v15 || (uint64_t v15 = (void *)v27) != 0)
  {
    *(float *)&double v31 = a3;
    objc_msgSend_setOrthographicScale_(v15, v28, v29, v30, v31);
  }
}

- (BOOL)_pointOfViewUsesOrthographicProjection
{
  int32x2_t v5 = objc_msgSend_cameraController(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_pointOfView(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_camera(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_cameraController(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_pointOfView(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_light(v21, v22, v23, v24);
  if (v13)
  {
    LOBYTE(v25) = objc_msgSend_usesOrthographicProjection(v13, v26, v27, v28);
  }
  else if (v25)
  {
    LOBYTE(v25) = objc_msgSend_type(v25, v26, v27, v28) == 2;
  }
  return (char)v25;
}

- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  int8x16_t v6 = objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  v10.f64[0] = x;
  v10.f64[1] = y;
  double v11 = COERCE_DOUBLE(vcvt_f32_f64(v10));
  v13.f64[1] = v12;
  __n128 v79 = (__n128)vcvt_hight_f32_f64(0, v13);
  uint64_t v17 = objc_msgSend_pointOfView(self, v14, v15, v16);
  objc_msgSend__worldBoundingSphere(self, v18, v19, v20);
  *(_OWORD *)self->_translationOrigin = v21;
  uint64_t v25 = objc_msgSend_view(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_world(v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_worldRef(v29, v30, v31, v32);
  uint64_t v41 = v33;
  if (v33) {
    sub_1B64B0C28(v33, (uint64_t)v34, v35, v36, v37, v38, v39, v40);
  }
  uint64_t v42 = objc_msgSend_nodeRef(v17, v34, v35, v36);
  double v54 = sub_1B63D5214(v42, v41, &v80, &v81, v79, v11, v43, v44, v45, v46);
  if (v55)
  {
    objc_msgSend_worldFront(self, v47, v48, v49, v54);
    float32x4_t v63 = vmulq_f32(*(float32x4_t *)self->_translationOrigin, v64);
    v64.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).f32[0];
    float32x4_t v65 = vsubq_f32(v81, v80);
    float32x4_t v66 = vmulq_f32(v65, v65);
    int32x2_t v67 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v66, 2), vaddq_f32(v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 1))).u64[0];
    *(float *)v67.i32 = sqrtf(*(float *)v67.i32);
    float32x4_t v68 = vdivq_f32(v65, (float32x4_t)vdupq_lane_s32(v67, 0));
    v68.i32[3] = 0;
    int8x16_t v69 = (int8x16_t)vmulq_f32(v64, v68);
    float v70 = vaddv_f32(vadd_f32(*(float32x2_t *)v69.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL)));
    if (v70 != 0.0
      && ((float32x4_t v71 = v80,
           v71.i32[3] = 1.0,
           int8x16_t v72 = (int8x16_t)vmulq_f32(v71, v64),
           float v73 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL)))
               / v70,
           v73 >= 0.0)
        ? (BOOL v74 = v73 <= *(float *)v67.i32)
        : (BOOL v74 = 0),
          v74))
    {
      float32x4_t v76 = vmlaq_n_f32(v71, v68, v73);
    }
    else
    {
      v75.i64[0] = 0x3F0000003F000000;
      v75.i64[1] = 0x3F0000003F000000;
      float32x4_t v76 = vmulq_f32(vaddq_f32(v80, v81), v75);
    }
    *(float32x4_t *)self->_translationOrigin = v76;
    if (v41) {
      goto LABEL_14;
    }
  }
  else
  {
    sub_1B63F2F54(0, @"Warning: _computeTranslationOrigin3DFromPoint: invalid zRange", v48, v49, v50, v51, v52, v53, *(uint64_t *)&x);
    if (v41) {
LABEL_14:
    }
      sub_1B64B0CB4(v41, v56, v57, v58, v59, v60, v61, v62);
  }
}

- (void)_translateToViewPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  int8x16_t v6 = objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  v11.f64[1] = v10;
  __n128 v93 = (__n128)vcvt_hight_f32_f64(0, v11);
  v12.f64[0] = x;
  v12.f64[1] = y;
  double v13 = COERCE_DOUBLE(vcvt_f32_f64(v12));
  uint64_t v17 = objc_msgSend_pointOfView(self, v14, v15, v16);
  long long v21 = objc_msgSend_view(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_world(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_worldRef(v25, v26, v27, v28);
  uint64_t v37 = v29;
  if (v29) {
    sub_1B64B0C28(v29, (uint64_t)v30, v31, v32, v33, v34, v35, v36);
  }
  uint64_t v38 = objc_msgSend_nodeRef(v17, v30, v31, v32);
  sub_1B63D5214(v38, v37, &v97, &v98, v93, v13, v39, v40, v41, v42);
  int v51 = v50;
  if (v37) {
    sub_1B64B0CB4(v37, (uint64_t)v43, v44, v45, v46, v47, v48, v49);
  }
  if (v51)
  {
    float32x4_t v92 = v97;
    float32x4_t v52 = vsubq_f32(v98, v97);
    float32x4_t v53 = vmulq_f32(v52, v52);
    v53.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).u64[0];
    v53.f32[0] = sqrtf(v53.f32[0]);
    uint64_t v90 = v53.i64[0];
    float32x4_t v54 = vdivq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 0));
    v54.i32[3] = 0;
    float32x4_t v94 = v54;
    objc_msgSend_worldFront(self, v43, v44, v45);
    float32x4_t v62 = *(float32x4_t *)self->_translationOrigin;
    float32x4_t v63 = vmulq_f32(v62, v64);
    v64.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).f32[0];
    int8x16_t v65 = (int8x16_t)vmulq_f32(v64, v94);
    float v66 = vaddv_f32(vadd_f32(*(float32x2_t *)v65.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v65, v65, 8uLL)));
    if (v66 != 0.0
      && ((float32x4_t v67 = v92,
           v67.i32[3] = 1.0,
           int8x16_t v68 = (int8x16_t)vmulq_f32(v67, v64),
           float v69 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v68.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL)))
               / v66,
           v69 >= 0.0)
        ? (BOOL v70 = v69 <= *(float *)&v90)
        : (BOOL v70 = 0),
          v70))
    {
      float32x4_t v95 = vsubq_f32(v62, vmlaq_n_f32(v67, v94, v69));
      objc_msgSend_worldTransform(v17, v55, v56, v57);
      simd_float4x4 v100 = __invert_f4(v99);
      float32x4_t v96 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v100.columns[2], v95, 2), (float32x4_t)v100.columns[1], *(float32x2_t *)v95.f32, 1), (float32x4_t)v100.columns[0], v95.f32[0]);
      objc_msgSend_begin(VFXTransaction, v71, v72, v73);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v74, v75, v76, 0.0);
      float32x4_t v80 = objc_msgSend_cameraController(self, v77, v78, v79);
      LODWORD(v82) = v96.i32[2];
      LODWORD(v81) = v96.i32[1];
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v80, v83, v84, v85, *(double *)v96.i64, v81, v82);
      objc_msgSend_commit(VFXTransaction, v86, v87, v88);
    }
    else
    {
      sub_1B63F2F54(0, @"Warning: Warning: no CFXIntersectionRay3Plane", v56, v57, v58, v59, v60, v61, v90);
    }
  }
}

- (void)__willChangePointOfView
{
  if (!self->_recordingPointOfViewEvents)
  {
    self->_recordingPointOfViewEvents = 1;
    objc_msgSend_delegate(self, a2, v2, v3);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_msgSend_delegate(self, v5, v6, v7);
      MEMORY[0x1F4181798](v8, sel_willChangePointOfView, v9, v10);
    }
  }
}

- (void)__didChangePointOfView
{
  if (self->_recordingPointOfViewEvents)
  {
    objc_msgSend_delegate(self, a2, v2, v3);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_msgSend_delegate(self, v5, v6, v7);
      objc_msgSend_didChangePointOfView(v8, v9, v10, v11);
    }
    self->_recordingPointOfViewEvents = 0;
  }
}

- (VFXCameraNavigationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VFXCameraNavigationControllerDelegate *)a3;
}

- (VFXView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (VFXView *)a3;
}

- (VFXNode)freeCamera
{
  return self->_freeViewCameraNode;
}

- (BOOL)enableFreeCamera
{
  return self->_enableFreeCamera;
}

- (BOOL)autoSwitchToFreeCamera
{
  return self->_autoSwitchToFreeCamera;
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  self->_autoSwitchToFreeCamera = a3;
}

- (float)flyModeVelocity
{
  return self->_flyModeVelocity;
}

- (void)setFlyModeVelocity:(float)a3
{
  self->_flyModeVelocitCGFloat y = a3;
}

- (float)panSensitivity
{
  return self->_panSensitivity;
}

- (void)setPanSensitivity:(float)a3
{
  self->_panSensitivitCGFloat y = a3;
}

- (float)truckSensitivity
{
  return self->_truckSensitivity;
}

- (void)setTruckSensitivity:(float)a3
{
  self->_truckSensitivitCGFloat y = a3;
}

- (float)rotationSensitivity
{
  return self->_rotationSensitivity;
}

- (void)setRotationSensitivity:(float)a3
{
  self->_rotationSensitivitCGFloat y = a3;
}

- (void).cxx_destruct
{
  begin = self->_keyboard.right.__begin_;
  if (begin)
  {
    self->_keyboard.right.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = self->_keyboard.left.__begin_;
  if (v4)
  {
    self->_keyboard.left.__end_ = v4;
    operator delete(v4);
  }
  int32x2_t v5 = self->_keyboard.backward.__begin_;
  if (v5)
  {
    self->_keyboard.backward.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->_keyboard.forward.__begin_;
  if (v6)
  {
    self->_keyboard.forward.__end_ = v6;
    operator delete(v6);
  }
  left = self->_keyboard.keyDown.__tree_.__pair1_.__value_.__left_;

  sub_1B643670C((uint64_t)&self->_keyboard.keyDown, left);
}

- (id).cxx_construct
{
  *((void *)self + 45) = 0;
  *((void *)self + 46) = 0;
  *((void *)self + 44) = (char *)self + 360;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

@end