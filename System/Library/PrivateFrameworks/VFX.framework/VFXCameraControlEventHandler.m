@interface VFXCameraControlEventHandler
+ (double)frontVectorWithPointOfView:(void *)a3;
+ (double)matrixWithNoRoll:(float32x4_t)a3;
- (BOOL)_3DConnexionIsPressed;
- (BOOL)_freeCameraActivated;
- (BOOL)_isInertiaRunning;
- (BOOL)allowsTranslation;
- (BOOL)automaticCameraTarget;
- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4;
- (BOOL)enableInertia;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gimbalLockMode;
- (BOOL)wantsRedraw;
- (VFXCameraControlEventHandler)init;
- (__n128)cameraAutomaticTargetPoint;
- (__n128)cameraTarget;
- (__n128)viewedObjectSphere;
- (float)_browseScale;
- (float)_translationCoef;
- (float)friction;
- (float)zoomFactor;
- (id)freeCamera;
- (id)gestureRecognizers;
- (uint64_t)frontVector;
- (unint64_t)stickyAxis;
- (void)_beginTranslateAtLocation:(CGPoint)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handleRotation:(id)a3;
- (void)_installFreeViewCameraIfNeeded;
- (void)_onInertiaTimer;
- (void)_prepareFreeViewCamera;
- (void)_resetBrowseScaleFactor;
- (void)_resetFreeViewCamera;
- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5;
- (void)_setInertiaRunning:(BOOL)a3;
- (void)_startBrowsingIfNeeded:(CGPoint)a3;
- (void)_switchToFreeViewCamera;
- (void)_translateTo:(CGPoint)a3;
- (void)activateFreeCamera;
- (void)beginGesture:(id)a3;
- (void)cameraDidChange;
- (void)cameraWillChange;
- (void)clearRoll;
- (void)computeAutomaticTargetPoint;
- (void)dealloc;
- (void)endDraggingWithVelocity:(CGPoint)a3;
- (void)focusNode:(id)a3;
- (void)invalidateCameraTarget;
- (void)panWithGestureRecognizer:(id)a3;
- (void)pinchWithGestureRecognizer:(id)a3;
- (void)rotateOf:(float)a3;
- (void)rotateWithGestureRecognizer:(id)a3;
- (void)rotateWithVector:(int64_t)a3 mode:;
- (void)setAllowsTranslation:(BOOL)a3;
- (void)setAutomaticCameraTarget:(BOOL)a3;
- (void)setCameraTarget:(VFXCameraControlEventHandler *)self;
- (void)setEnableFreeCamera:(BOOL)a3;
- (void)setEnableInertia:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFriction:(float)a3;
- (void)setGimbalLockMode:(BOOL)a3;
- (void)setStickyAxis:(unint64_t)a3;
- (void)setZoomFactor:(float)a3;
- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)updateBrowseScaleFactor;
- (void)viewWillDrawAtTime:(double)a3;
- (void)worldDidChange;
- (void)worldWillChange;
- (void)zoomBy:(float)a3;
- (void)zoomBy:(float)a3 animate:(BOOL)a4;
@end

@implementation VFXCameraControlEventHandler

- (VFXCameraControlEventHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXCameraControlEventHandler;
  result = [(VFXEventHandler *)&v3 init];
  if (result)
  {
    result->_zoomFactor = 1.0;
    *((unsigned char *)result + 296) |= 8u;
    *((unsigned char *)result + 296) &= ~2u;
    result->_friction = 0.05;
    result->_browseScaleFactor = 1.0;
    *((unsigned char *)result + 296) |= 0x20u;
    *((unsigned char *)result + 297) &= ~2u;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, a2, v2, v3);

  v5.receiver = self;
  v5.super_class = (Class)VFXCameraControlEventHandler;
  [(VFXEventHandler *)&v5 dealloc];
}

- (BOOL)enabled
{
  return *((unsigned char *)self + 296) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xFE | a3;
  objc_super v5 = objc_msgSend_gestureRecognizers(self, a2, a3, v3);
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
        objc_msgSend_setEnabled_(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v8, *((unsigned char *)self + 296) & 1, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)allowsTranslation
{
  return (*((unsigned __int8 *)self + 296) >> 5) & 1;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xDF | v3;
}

- (BOOL)enableInertia
{
  return (*((unsigned __int8 *)self + 296) >> 3) & 1;
}

- (void)setEnableInertia:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xF7 | v3;
}

- (float)friction
{
  return self->_friction;
}

- (void)setFriction:(float)a3
{
  self->_friction = a3;
}

- (BOOL)gimbalLockMode
{
  return (*((unsigned __int8 *)self + 297) >> 1) & 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xFD | v3;
}

- (BOOL)automaticCameraTarget
{
  return (*((unsigned __int8 *)self + 296) >> 1) & 1;
}

- (void)invalidateCameraTarget
{
  *((unsigned char *)self + 296) &= ~4u;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 296);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 296) = v4 & 0xFD | v5;
    objc_msgSend_invalidateCameraTarget(self, a2, a3, v3);
  }
}

- (__n128)cameraTarget
{
  return a1[21];
}

- (void)setCameraTarget:(VFXCameraControlEventHandler *)self
{
  *(_OWORD *)self->_cameraTarget = v2;
}

- (id)freeCamera
{
  return self->_freeViewCameraNode;
}

- (void)focusNode:(id)a3
{
  if (a3)
  {
    *((unsigned char *)self + 296) |= 0x10u;
    objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
    objc_msgSend__switchToFreeViewCamera(self, v6, v7, v8);
    objc_msgSend_setAutomaticCameraTarget_(self, v9, 0, v10);
    long long v48 = 0uLL;
    objc_msgSend_frontVector(self, v11, v12, v13);
    float32x4_t v46 = v14;
    float v47 = 0.0;
    if (objc_msgSend_getBoundingSphereCenter_radius_(a3, v15, (uint64_t)&v48, (uint64_t)&v47))
    {
      float v19 = (float)(self->_originalFov * 0.5) / 180.0 * 3.14159265;
      objc_msgSend_worldTransform(a3, v16, v17, v18);
      float32x4_t v23 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v20, v47), (float32x4_t)0, v21), (float32x4_t)0, v22);
      float32x4_t v24 = vmulq_f32(v23, v23);
      float v25 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
      float v47 = v25;
      float v29 = tanf(v19);
      float v30 = sqrtf((float)(v25 * v25) + (float)((float)(v25 / v29) * (float)(v25 / v29)));
    }
    else
    {
      objc_msgSend__browseScale(self, v16, v17, v18);
      float v30 = v31;
    }
    v32 = objc_msgSend_presentationNode(a3, v26, v27, v28);
    objc_msgSend_convertPosition_toNode_(v32, v33, 0, v34, *(double *)&v48);
    float32x4_t v45 = v35;
    objc_msgSend_setCameraTarget_(self, v36, v37, v38);
    float32x4_t v42 = vmulq_f32(v46, v46);
    float v43 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0]);
    if (v43 != 0.0)
    {
      float v44 = v30 / v43;
      objc_msgSend_setPosition_(self->_freeViewCameraNode, v39, v40, v41, *(double *)vsubq_f32(v45, vmulq_n_f32(v46, v30 / v43)).i64);
      self->_browseScaleFactor = v44;
    }
  }
  else
  {
    objc_msgSend_setAutomaticCameraTarget_(self, a2, 1, v3);
  }
}

- (unint64_t)stickyAxis
{
  return self->_stickyAxis;
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis = a3;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->super._enableFreeCamera = a3;
  if (!a3) {
    objc_msgSend__resetFreeViewCamera(self, a2, a3, v3);
  }
}

- (void)activateFreeCamera
{
  v6.receiver = self;
  v6.super_class = (Class)VFXCameraControlEventHandler;
  [(VFXEventHandler *)&v6 activateFreeCamera];
  objc_msgSend__prepareFreeViewCamera(self, v3, v4, v5);
}

- (void)_resetFreeViewCamera
{
  if (objc_msgSend_worldRef(self->_freeViewCameraNode, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v5, v6, v7);
    uint64_t v12 = objc_msgSend_worldRef(self->_freeViewCameraNode, v9, v10, v11);
    sub_1B63F4AAC(v8, v12, v13, v14, v15, v16, v17, v18);
  }
  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, v5, v6, v7);

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
  if (self->_originalFov == 0.0) {
    self->_originalFov = 60.0;
  }
  float32x4_t v22 = objc_msgSend_camera(v18, v19, v20, v21);
  objc_msgSend_orthographicScale(v22, v23, v24, v25);
  self->_originalOrthoScale = v29;
  self->_zoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v17)
  {
    if (freeViewCameraNode) {
      goto LABEL_12;
    }
    float v31 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v26, v27, v28);
    goto LABEL_11;
  }
  if (v17 == freeViewCameraNode)
  {
LABEL_16:
    v59 = objc_msgSend_presentationNode(v17, v26, v27, v28);
    objc_msgSend_worldTransform(v59, v60, v61, v62);
    long long v67 = v66;
    goto LABEL_21;
  }
  if (!freeViewCameraNode)
  {
    float v31 = (VFXNode *)objc_msgSend_copy(v17, v26, v27, v28);
LABEL_11:
    self->_freeViewCameraNode = v31;
  }
LABEL_12:
  if (objc_msgSend_camera(v17, v26, v27, v28))
  {
    float32x4_t v35 = objc_msgSend_camera(v17, v32, v33, v34);
    id v39 = (id)objc_msgSend_copy(v35, v36, v37, v38);
LABEL_14:
    float32x4_t v42 = v39;
    goto LABEL_15;
  }
  if (!objc_msgSend_light(v17, v32, v33, v34))
  {
    id v39 = (id)objc_msgSend_camera(VFXCamera, v68, v69, v70);
    goto LABEL_14;
  }
  v71 = objc_msgSend_light(v17, v68, v69, v70);
  float32x4_t v42 = objc_msgSend_camera(VFXCamera, v72, v73, v74);
  if (v71)
  {
    objc_msgSend_spotOuterAngle(v71, v40, v75, v41);
    objc_msgSend_setFieldOfView_(v42, v76, v77, v78);
    objc_msgSend_zNear(v71, v79, v80, v81);
    objc_msgSend_setZNear_(v42, v82, v83, v84);
    objc_msgSend_zFar(v71, v85, v86, v87);
    objc_msgSend_setZFar_(v42, v88, v89, v90);
  }
LABEL_15:
  objc_msgSend_setCamera_(self->_freeViewCameraNode, v40, (uint64_t)v42, v41);
  objc_msgSend_setLight_(self->_freeViewCameraNode, v43, 0, v44);
  objc_msgSend_setModel_(self->_freeViewCameraNode, v45, 0, v46);
  uint64_t v50 = objc_msgSend_immediateMode(VFXTransaction, v47, v48, v49);
  objc_msgSend_setImmediateMode_(VFXTransaction, v51, 1, v52);
  objc_msgSend_removeAllAnimations(self->_freeViewCameraNode, v53, v54, v55);
  objc_msgSend_setImmediateMode_(VFXTransaction, v56, v50, v57);
  if (v17) {
    goto LABEL_16;
  }
  float32x4_t v63 = (float32x4_t)VFXMatrix4Identity;
  float32x4_t v64 = qword_1B6E51E70;
  float32x4_t v65 = (float32x4_t)xmmword_1B6E51E80;
  long long v67 = *(_OWORD *)&qword_1B6E51E90;
LABEL_21:
  float32x4_t v91 = vmulq_f32(v63, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v65, (int8x16_t)v65, 0xCuLL), (int8x16_t)v65, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v64, (int32x4_t)v64), (int8x16_t)v64, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v65, (int32x4_t)v65), (int8x16_t)v65, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v64, (int8x16_t)v64, 0xCuLL), (int8x16_t)v64, 8uLL)));
  if (fabs(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v91, 2), vaddq_f32(v91, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v91.f32, 1))).f32[0]+ -1.0) > 0.00001)
  {
    float32x4_t v92 = vmulq_f32(v63, v63);
    v58.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0]);
    float32x4_t v93 = vmulq_f32(v64, v64);
    float32x4_t v94 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v93, 2);
    int8x16_t v95 = (int8x16_t)vaddq_f32(v94, vaddq_f32(v93, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v93.f32, 1)));
    *(float *)v95.i32 = sqrtf(*(float *)v95.i32);
    float32x4_t v96 = vmulq_f32(v65, v65);
    LODWORD(v97) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), vaddq_f32(v96, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1))).u32[0];
    int32x4_t v98 = vzip2q_s32((int32x4_t)v92, (int32x4_t)v96);
    float32x4_t v99 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v92, (int32x4_t)v96), (int32x4_t)v93);
    float32x4_t v100 = (float32x4_t)vtrn2q_s32((int32x4_t)v92, (int32x4_t)v93);
    v100.i32[2] = v96.i32[1];
    float32x4_t v101 = vaddq_f32((float32x4_t)vzip1q_s32(v98, (int32x4_t)v94), vaddq_f32(v99, v100));
    v100.i64[0] = 0x80000000800000;
    v100.i64[1] = 0x80000000800000;
    int32x4_t v102 = vcgeq_f32(v100, v101);
    v101.i32[3] = 0;
    float32x4_t v103 = vrsqrteq_f32(v101);
    float32x4_t v104 = vmulq_f32(v103, vrsqrtsq_f32(v101, vmulq_f32(v103, v103)));
    int32x4_t v105 = v102;
    v105.i32[3] = 0;
    float32x4_t v106 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v105), (int8x16_t)v101, (int8x16_t)vmulq_f32(v104, vrsqrtsq_f32(v101, vmulq_f32(v104, v104))));
    float32x4_t v107 = vmulq_n_f32(v63, v106.f32[0]);
    float32x4_t v108 = vmulq_lane_f32(v64, *(float32x2_t *)v106.f32, 1);
    float32x4_t v109 = vmulq_laneq_f32(v65, v106, 2);
    int8x16_t v110 = (int8x16_t)vuzp1q_s32((int32x4_t)v109, (int32x4_t)v109);
    int8x16_t v111 = (int8x16_t)vuzp1q_s32((int32x4_t)v108, (int32x4_t)v108);
    int32x4_t v112 = (int32x4_t)v107;
    if (v102.i32[0])
    {
      int8x16_t v113 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v110, (int8x16_t)v109, 0xCuLL), vnegq_f32(v108)), v109, (float32x4_t)vextq_s8(v111, (int8x16_t)v108, 0xCuLL));
      int32x4_t v112 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v113, (int32x4_t)v113), v113, 0xCuLL);
    }
    int8x16_t v114 = (int8x16_t)vuzp1q_s32((int32x4_t)v107, (int32x4_t)v107);
    float32x4_t v115 = v108;
    float v116 = sqrtf(v97);
    if (v102.i32[1])
    {
      int8x16_t v117 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v114, (int8x16_t)v107, 0xCuLL), vnegq_f32(v109)), v107, (float32x4_t)vextq_s8(v110, (int8x16_t)v109, 0xCuLL));
      float32x4_t v115 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v117, (int32x4_t)v117), v117, 0xCuLL);
    }
    v58.i32[1] = v95.i32[0];
    if (v102.i32[2])
    {
      int8x16_t v95 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v111, (int8x16_t)v108, 0xCuLL), vnegq_f32(v107)), v108, (float32x4_t)vextq_s8(v114, (int8x16_t)v107, 0xCuLL));
      float32x4_t v109 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v95, (int32x4_t)v95), v95, 0xCuLL);
    }
    v58.f32[2] = v116;
    float v118 = (float)(*(float *)v112.i32 + v115.f32[1]) + v109.f32[2];
    float32x4_t v198 = v58;
    long long v199 = v67;
    if (v118 > 0.0)
    {
      float32x4_t v119 = (float32x4_t)vzip2q_s32((int32x4_t)v115, vuzp1q_s32((int32x4_t)v115, (int32x4_t)v109));
      v119.i32[2] = v112.i32[1];
      float v120 = sqrtf(v118 + 1.0);
      float32x4_t v121 = (float32x4_t)vtrn2q_s32((int32x4_t)v109, vzip2q_s32((int32x4_t)v109, v112));
      v121.i32[2] = v115.i32[0];
      float32x4_t v123 = vsubq_f32(v119, v121);
      v119.f32[3] = v120;
      v121.f32[3] = v120;
      float32x4_t v122 = vmulq_f32(v119, v121);
      v123.i32[3] = v122.i32[3];
LABEL_40:
      v122.f32[0] = 0.5 / v120;
      float32x4_t v133 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v122.f32, 0);
      goto LABEL_41;
    }
    if (*(float *)v112.i32 < v115.f32[1] || *(float *)v112.i32 < v109.f32[2])
    {
      if (v115.f32[1] <= v109.f32[2])
      {
        float v120 = sqrtf((float)((float)(v109.f32[2] + 1.0) - *(float *)v112.i32) - v115.f32[1]);
        *(float32x2_t *)v123.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v112, (int32x4_t)v115), *(float32x2_t *)v109.f32);
        float32x2_t v134 = (float32x2_t)__PAIR64__(v112.u32[1], LODWORD(v120));
        float32x2_t v135 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v115.f32, 0);
        *(float32x2_t *)v122.f32 = vsub_f32(*(float32x2_t *)v112.i8, v135);
        v135.f32[0] = v120;
        v135.i32[0] = vmul_f32(v134, v135).u32[0];
        v135.i32[1] = v122.i32[1];
        *(float32x2_t *)&v123.u32[2] = v135;
        goto LABEL_40;
      }
      float v127 = sqrtf((float)((float)(v115.f32[1] + 1.0) - *(float *)v112.i32) - v109.f32[2]);
      *(int32x2_t *)v95.i8 = vdup_laneq_s32((int32x4_t)v115, 2);
      int8x16_t v125 = v95;
      *(float *)v125.i32 = v127;
      v125.i32[0] = vmul_f32(*(float32x2_t *)v125.i8, (float32x2_t)__PAIR64__(v109.u32[1], LODWORD(v127))).u32[0];
      v125.i32[1] = vadd_f32(*(float32x2_t *)&v95, *(float32x2_t *)&v109).i32[1];
      int8x16_t v126 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v112.i8, 1), v115);
      int32x2_t v132 = (int32x2_t)vsubq_f32(v109, (float32x4_t)vdupq_laneq_s32(v112, 2)).u64[0];
      float32x4_t v133 = (float32x4_t)vextq_s8(vextq_s8(v126, v126, 4uLL), v125, 0xCuLL);
      v133.i32[3] = v132.i32[0];
    }
    else
    {
      float v127 = sqrtf((float)((float)(*(float *)v112.i32 + 1.0) - v115.f32[1]) - v109.f32[2]);
      float32x2_t v128 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v115.f32, 0);
      float32x2_t v129 = vadd_f32(*(float32x2_t *)v112.i8, v128);
      v128.f32[0] = v127;
      v133.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v112.u32[1], LODWORD(v127)), v128).u32[0];
      v133.i32[1] = v129.i32[1];
      float32x2_t v130 = (float32x2_t)vzip2q_s32(v112, (int32x4_t)v115).u64[0];
      LODWORD(v131) = vadd_f32(v130, *(float32x2_t *)v109.f32).u32[0];
      int32x2_t v132 = (int32x2_t)vsub_f32(v130, *(float32x2_t *)v109.f32);
      HIDWORD(v131) = v132.i32[1];
      v133.i64[1] = v131;
    }
    *(float *)v132.i32 = 0.5 / v127;
    float32x4_t v123 = (float32x4_t)vdupq_lane_s32(v132, 0);
LABEL_41:
    float32x4_t v200 = vmulq_f32(v123, v133);
    sub_1B63F8A94(&v200);
    *(void *)&long long v67 = v199;
    float32x4_t v136 = vabsq_f32(v198);
    v136.i32[3] = 0;
    float32x4_t v137 = v200;
    v138.i64[0] = 0x8000000080000000;
    v138.i64[1] = 0x8000000080000000;
    float32x4_t v63 = (float32x4_t)vorrq_s8((int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v136, (float32x4_t)xmmword_1B6E4FCD0) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), vandq_s8((int8x16_t)v198, v138));
    float32x4_t v65 = vmulq_f32(v137, v137);
    float32x4_t v139 = vmulq_laneq_f32(v137, v137, 3);
    float v140 = vmulq_lane_f32(v137, *(float32x2_t *)v137.f32, 1).f32[0];
    float32x4_t v141 = vaddq_f32(v63, v63);
    v65.f32[0] = 0.5 - v65.f32[0];
    float32x2_t v142 = vmul_laneq_f32(*(float32x2_t *)v137.f32, v137, 2);
    v64.i32[3] = 0;
    v64.f32[0] = (float)(0.5 - v65.f32[1]) - v65.f32[2];
    v64.f32[1] = v140 + v139.f32[2];
    v143.i32[3] = 0;
    v64.f32[2] = v142.f32[0] - v139.f32[1];
    v63.i64[0] = vmulq_n_f32(v64, v141.f32[0]).u64[0];
    v143.f32[0] = v140 - v139.f32[2];
    v143.f32[1] = v65.f32[0] - v65.f32[2];
    v143.f32[2] = v142.f32[1] + v139.f32[0];
    v64.i64[0] = vmulq_lane_f32(v143, *(float32x2_t *)v141.f32, 1).u64[0];
    *(int32x2_t *)v139.f32 = vrev64_s32(*(int32x2_t *)v139.f32);
    v144.i32[0] = vadd_f32(v142, *(float32x2_t *)v139.f32).u32[0];
    v144.i32[1] = vsub_f32(v142, *(float32x2_t *)&v139).i32[1];
    v144.f32[2] = v65.f32[0] - v65.f32[1];
    v144.i32[3] = 0;
    v65.i64[0] = vmulq_laneq_f32(v144, v141, 2).u64[0];
  }
  objc_msgSend_setTransform_(self->_freeViewCameraNode, v26, v27, v28, *(double *)v63.i64, *(double *)v64.i64, *(double *)v65.i64, *(double *)&v67, *(_OWORD *)&v198, v199);
  objc_msgSend_setName_(self->_freeViewCameraNode, v145, @"kVFXFreeViewCameraName", v146);
  uint64_t v149 = objc_msgSend_stringByAppendingString_(@"kVFXFreeViewCameraName", v147, @"Camera", v148);
  v153 = objc_msgSend_camera(self->_freeViewCameraNode, v150, v151, v152);
  objc_msgSend_setName_(v153, v154, v149, v155);
  v159 = objc_msgSend_view(self, v156, v157, v158);
  if (objc_msgSend__showsAuthoringEnvironment(v159, v160, v161, v162))
  {
    v166 = objc_msgSend_camera(self->_freeViewCameraNode, v163, v164, v165);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v166, v167, 1, v168);
  }
  v169 = objc_msgSend_view(self, v163, v164, v165);
  v173 = objc_msgSend_world(v169, v170, v171, v172);
  uint64_t v177 = objc_msgSend_worldRef(v173, v174, v175, v176);
  if (v177)
  {
    uint64_t v181 = v177;
    uint64_t v182 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v178, v179, v180);
    if (!sub_1B63F4F08(v182, v183, v184, v185, v186, v187, v188, v189))
    {
      v190 = (uint64_t *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v178, v179, v180);
      sub_1B63F4CCC(v190, v181, v191, v192, v193, v194, v195, v196);
    }
  }
  objc_msgSend_viewedObjectSphere(self, v178, v179, v180);
  *(_OWORD *)self->_cameraTarget = v197;
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
      objc_msgSend_updateBrowseScaleFactor(self, v24, v25, v26);
      objc_msgSend_commit(VFXTransaction, v27, v28, v29);
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3)
    && (objc_msgSend__freeCameraActivated(self, v5, v6, v7) & 1) == 0)
  {
    objc_msgSend_begin(VFXTransaction, v8, v9, v10);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.0);
    objc_msgSend__prepareFreeViewCamera(self, v14, v15, v16);
    objc_msgSend__installFreeViewCameraIfNeeded(self, v17, v18, v19);
    objc_msgSend_commit(VFXTransaction, v20, v21, v22);
  }
}

- (__n128)cameraAutomaticTargetPoint
{
  if ((a1[18].n128_u8[8] & 4) == 0) {
    objc_msgSend_computeAutomaticTargetPoint(a1, a2, a3, a4);
  }
  return a1[22];
}

- (void)computeAutomaticTargetPoint
{
  *((unsigned char *)self + 296) |= 4u;
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend__browseScale(self, v14, v15, v16);
  float v49 = v17;
  objc_msgSend_frontVector(self, v18, v19, v20);
  float32x4_t v48 = v21;
  uint64_t v25 = objc_msgSend_presentationObject(v13, v22, v23, v24);
  objc_msgSend_convertPosition_toNode_(v25, v26, 0, v27, 0.0);
  float32x4_t v32 = v31;
  if ((*((unsigned char *)self + 296) & 0x10) == 0)
  {
    float32x4_t v47 = v31;
    objc_msgSend_viewedObjectSphere(self, v28, v29, v30);
    float32x4_t v32 = v47;
    float32x4_t v34 = vsubq_f32(v33, v47);
    float32x4_t v35 = vmulq_f32(v48, v34);
    BOOL v36 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0] <= 0.5;
    float32x4_t v37 = vmulq_f32(v34, v34);
    float v38 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]);
    float v39 = v49;
    if (!v36) {
      float v39 = v38;
    }
    float v49 = v39;
  }
  float32x4_t v40 = vmulq_f32(v48, v48);
  v40.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).u64[0];
  float32x4_t v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 0);
  v41.i32[3] = 0;
  float32x4_t v42 = vrsqrteq_f32(v41);
  float32x4_t v43 = vmulq_f32(v42, vrsqrtsq_f32(v41, vmulq_f32(v42, v42)));
  int8x16_t v44 = (int8x16_t)vmulq_f32(v48, vmulq_n_f32(vmulq_f32(v43, vrsqrtsq_f32(v41, vmulq_f32(v43, v43))), v49));
  int32x4_t v45 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v40.f32[0] != 0.0)), 0x1FuLL));
  v45.i32[3] = 0;
  int8x16_t v46 = vbslq_s8((int8x16_t)vcltzq_s32(v45), v44, (int8x16_t)v48);
  *(float32x2_t *)v44.i8 = vadd_f32(*(float32x2_t *)v32.f32, *(float32x2_t *)v46.i8);
  *(float *)&v44.i32[2] = v32.f32[2] + *(float *)&v46.i32[2];
  *(int8x16_t *)self->_autoCameraTarget = v44;
}

- (float)_translationCoef
{
  objc_msgSend__browseScale(self, a2, v2, v3);
  return v4 * 0.01;
}

- (float)_browseScale
{
  return self->_browseScaleFactor;
}

- (void)_resetBrowseScaleFactor
{
  self->_browseScaleFactor = 1.0;
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  if (v13)
  {
    float v17 = objc_msgSend_presentationNode(v13, v14, v15, v16);
    objc_msgSend_worldTransform(v17, v18, v19, v20);
    float32x4_t v22 = vmulq_f32(v21, v21);
    self->_browseScaleFactor = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]);
  }
}

- (void)updateBrowseScaleFactor
{
  if ((*((unsigned char *)self + 296) & 2) != 0) {
    objc_msgSend_cameraAutomaticTargetPoint(self, a2, v2, v3);
  }
  else {
    objc_msgSend_cameraTarget(self, a2, v2, v3);
  }
  uint64_t v10 = objc_msgSend_view(self, v5, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_renderer(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_pointOfView(v14, v15, v16, v17);
  float32x4_t v22 = objc_msgSend_presentationNode(v18, v19, v20, v21);
  objc_msgSend_worldTransform(v22, v23, v24, v25);
  float32x4_t v30 = vsubq_f32(v29, v48);
  float32x4_t v31 = vmulq_f32(v30, v30);
  float v32 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]);
  float v33 = 0.1;
  if (v32 > 0.1) {
    float v33 = v32;
  }
  self->_browseScaleFactor = v33;
  objc_msgSend_begin(VFXTransaction, v26, v27, v28);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v34, v35, v36, 0.0);
  float32x4_t v40 = objc_msgSend_camera(v18, v37, v38, v39);
  *(float *)&double v41 = v32;
  objc_msgSend_setFocusDistance_(v40, v42, v43, v44, v41);

  objc_msgSend_commit(VFXTransaction, v45, v46, v47);
}

- (void)rotateOf:(float)a3
{
  if (self->super._autoSwitchToFreeCamera) {
    objc_msgSend__switchToFreeViewCamera(self, a2, v3, v4);
  }
  *((unsigned char *)self + 297) &= ~1u;
  uint64_t v7 = objc_msgSend_view(self, a2, v3, v4);
  uint64_t v11 = objc_msgSend_renderer(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_pointOfView(v11, v12, v13, v14);
  if (v15)
  {
    uint64_t v19 = v15;
    objc_msgSend_transform(v15, v16, v17, v18);
    float32x4_t v36 = v20;
    float32x4_t v37 = v21;
    float32x4_t v34 = v23;
    float32x4_t v35 = v22;
    v20.f32[0] = a3 * -3.14159265 / 180.0;
    __float2 v27 = __sincosf_stret(v20.f32[0]);
    uint64_t v28 = 0;
    *(float *)&unint64_t v29 = -v27.__sinval;
    HIDWORD(v29) = LODWORD(v27.__cosval);
    v38[0] = __PAIR64__(LODWORD(v27.__sinval), LODWORD(v27.__cosval));
    v38[1] = v29;
    v38[2] = xmmword_1B6E4F2E0;
    v38[3] = xmmword_1B6E4F370;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    do
    {
      *(long long *)((char *)&v39 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(v38[v28])), v37, *(float32x2_t *)&v38[v28], 1), v35, (float32x4_t)v38[v28], 2), v34, (float32x4_t)v38[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    double v30 = *(double *)&v41;
    double v31 = *(double *)&v42;
    double v32 = *(double *)&v39;
    double v33 = *(double *)&v40;
    objc_msgSend_setTransform_(v19, v24, *(void *)&v25, *(void *)&v26, v32, v33, v30, v31);
  }
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v7 = objc_msgSend_view(self, a2, a4, v4);
  uint64_t v11 = objc_msgSend_renderer(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_pointOfView(v11, v12, v13, v14);
  if (v15)
  {
    uint64_t v19 = v15;
    *(void *)&long long v20 = 0;
    *((float *)&v20 + 2) = a3 * -100.0;
    HIDWORD(v20) = 1.0;
    long long v45 = v20;
    objc_msgSend_transform(v15, v16, v17, v18);
    uint64_t v28 = 0;
    v47[0] = xmmword_1B6E4F300;
    v47[1] = xmmword_1B6E4F320;
    v47[2] = xmmword_1B6E4F2E0;
    v47[3] = v45;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    do
    {
      *(long long *)((char *)&v48 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(v47[v28])), v25, *(float32x2_t *)&v47[v28], 1), v26, (float32x4_t)v47[v28], 2), v27, (float32x4_t)v47[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    double v29 = *(double *)&v48;
    double v30 = *(double *)&v49;
    double v31 = *(double *)&v50;
    double v32 = *(double *)&v51;
    if (v5)
    {
      double v44 = *(double *)&v50;
      double v46 = *(double *)&v51;
      double v42 = *(double *)&v48;
      double v43 = *(double *)&v49;
      objc_msgSend_begin(VFXTransaction, v21, v22, v23);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v33, v34, v35, 0.3);
      objc_msgSend_setTransform_(v19, v36, v37, v38, v42, v43, v44, v46);
      objc_msgSend_commit(VFXTransaction, v39, v40, v41);
    }
    else
    {
      objc_msgSend_setTransform_(v19, v21, v22, v23, v29, v30, v31, v32);
    }
  }
}

- (void)zoomBy:(float)a3
{
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(float)a3
{
  if (self->_zoomFactor == a3) {
    return;
  }
  uint64_t v7 = objc_msgSend_view(self, a2, v3, v4);
  uint64_t v11 = objc_msgSend_renderer(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_pointOfView(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_camera(v15, v16, v17, v18);
  if (!objc_msgSend_usesOrthographicProjection(v19, v20, v21, v22))
  {
    float originalFov = self->_originalFov;
    long double v67 = tan(originalFov * 0.0174532925 * 0.5);
    long double v71 = atan(v67 / a3);
    float v72 = (v71 + v71) / 3.14159265 * 180.0;
    if (v72 <= 1.0 && originalFov > 0.0 || v72 >= 120.0) {
      return;
    }
    if (v15)
    {
      uint64_t v73 = objc_msgSend_camera(v15, v68, v69, v70);
      *(float *)&double v74 = v72;
      objc_msgSend_setFieldOfView_(v73, v75, v76, v77, v74);
    }
LABEL_22:
    self->_float zoomFactor = a3;
    return;
  }
  float zoomFactor = self->_zoomFactor;
  if (zoomFactor == 0.0) {
    goto LABEL_22;
  }
  float originalOrthoScale = self->_originalOrthoScale;
  objc_msgSend_viewedObjectSphere(self, v23, v24, v25);
  float v32 = v31;
  if (v31 == 0.0) {
    return;
  }
  float v33 = originalOrthoScale / zoomFactor;
  double v34 = v33;
  uint64_t v35 = objc_msgSend_view(self, v28, v29, v30);
  objc_msgSend_bounds(v35, v36, v37, v38);
  double v40 = v39;
  double v44 = objc_msgSend_view(self, v41, v42, v43);
  objc_msgSend_bounds(v44, v45, v46, v47);
  double v52 = v32;
  double v53 = v52 + v52;
  double v54 = self->_originalOrthoScale;
  if (v52 + v52 <= v54) {
    double v53 = self->_originalOrthoScale;
  }
  if (v53 > v34)
  {
    double v55 = v52 * 0.1;
    float v56 = v51;
    float v57 = v40;
    if (v56 >= v57) {
      float v58 = v40;
    }
    else {
      float v58 = v56;
    }
    double v59 = v58;
    if (v56 < v57) {
      float v56 = v40;
    }
    double v60 = v55 * (v59 / fmax(v56, 1.0));
    if (v60 <= v54) {
      double v54 = v60;
    }
    if (v54 >= v34)
    {
      if (self->_zoomFactor <= a3) {
        return;
      }
    }
    else
    {
      uint64_t v61 = objc_msgSend_camera(v15, v48, v49, v50);
      *(float *)&double v62 = v33;
      objc_msgSend_setOrthographicScale_(v61, v63, v64, v65, v62);
    }
    goto LABEL_22;
  }
  if (self->_zoomFactor < a3) {
    goto LABEL_22;
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  double v57 = *(double *)&a4;
  double v58 = *(double *)&a3;
  uint64_t v9 = objc_msgSend_view(self, a2, v5, v6);
  uint64_t v13 = objc_msgSend_renderer(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_pointOfView(v13, v14, v15, v16);
  if (v17)
  {
    uint64_t v21 = (void *)v17;
    objc_msgSend_cameraAutomaticTargetPoint(self, v18, v19, v20);
    objc_msgSend_transform(v21, v22, v23, v24);
    float32x4_t v55 = v26;
    float32x4_t v56 = v25;
    float32x4_t v53 = v28;
    float32x4_t v54 = v27;
    objc_msgSend__translationCoef(self, v29, v30, v31);
    uint64_t v36 = 0;
    float browseScaleFactor = self->_browseScaleFactor;
    if (browseScaleFactor >= 100000.0 && a5 < 0.0) {
      float v39 = 0.0;
    }
    else {
      float v39 = a5;
    }
    double v40 = browseScaleFactor;
    if (v39 > 0.0 && v40 < 0.1) {
      float v42 = 0.0;
    }
    else {
      float v42 = v39;
    }
    *(float32x2_t *)&long long v43 = vmul_n_f32(vneg_f32((float32x2_t)__PAIR64__(LODWORD(v57), LODWORD(v58))), v35);
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *((float *)&v43 + 2) = -(float)(v42 * v35);
    HIDWORD(v43) = *(_DWORD *)(MEMORY[0x1E4F149A0] + 60);
    long long v45 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
    v59[0] = *MEMORY[0x1E4F149A0];
    v59[1] = v44;
    v59[2] = v45;
    v59[3] = v43;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    do
    {
      *(long long *)((char *)&v60 + v36 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v56, COERCE_FLOAT(v59[v36])), v55, *(float32x2_t *)&v59[v36], 1), v54, (float32x4_t)v59[v36], 2), v53, (float32x4_t)v59[v36], 3);
      ++v36;
    }
    while (v36 != 4);
    objc_msgSend_setTransform_(v21, v32, v33, v34, *(double *)&v60, *(double *)&v61, *(double *)&v62, *(double *)&v63);
    double v49 = v58;
    if (*(float *)&v58 != 0.0 || (double v49 = v57, *(float *)&v57 != 0.0)) {
      objc_msgSend_invalidateCameraTarget(self, v46, v47, v48, v49);
    }
    objc_msgSend_focusNode_(self, v46, 0, v48, v49);
    objc_msgSend_updateBrowseScaleFactor(self, v50, v51, v52);
  }
}

- (void)worldWillChange
{
  *((unsigned char *)self + 288) &= ~1u;
  *((unsigned char *)self + 297) &= ~1u;
  objc_msgSend__resetFreeViewCamera(self, a2, v2, v3);

  objc_msgSend__setInertiaRunning_(self, v5, 0, v6);
}

- (void)worldDidChange
{
  objc_msgSend_invalidateCameraTarget(self, a2, v2, v3);

  objc_msgSend__resetBrowseScaleFactor(self, v5, v6, v7);
}

- (void)cameraWillChange
{
  *((unsigned char *)self + 297) &= ~1u;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v2);
}

- (void)cameraDidChange
{
  objc_msgSend__resetBrowseScaleFactor(self, a2, v2, v3);

  objc_msgSend_invalidateCameraTarget(self, v5, v6, v7);
}

- (void)_onInertiaTimer
{
  CFTimeInterval v6 = CACurrentMediaTime();
  double lastSimulationTime = self->_lastSimulationTime;
  int v8 = (int)((v6 - lastSimulationTime) * 60.0);
  self->_double lastSimulationTime = lastSimulationTime + (double)v8 / 60.0;
  if (v8 >= 1)
  {
    float friction = self->_friction;
    do
    {
      float64x2_t inertiaVelocity = (float64x2_t)self->_inertiaVelocity;
      if (friction != 0.0)
      {
        float64x2_t inertiaVelocity = vmulq_n_f64(inertiaVelocity, 1.0 - friction);
        self->_float64x2_t inertiaVelocity = (CGPoint)inertiaVelocity;
      }
      self->_totalDragWithInertia = (CGPoint)vaddq_f64(inertiaVelocity, (float64x2_t)self->_totalDragWithInertia);
      --v8;
    }
    while (v8);
  }
  objc_msgSend_begin(VFXTransaction, v3, v4, v5);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.0);
  objc_msgSend__rotateWithDrag_mode_stickyAxis_(self, v14, self->_browseMode, self->_stickyAxis, self->_totalDragWithInertia.x, self->_totalDragWithInertia.y);
  objc_msgSend_commit(VFXTransaction, v15, v16, v17);
  float v20 = self->_inertiaVelocity.y * self->_inertiaVelocity.y + self->_inertiaVelocity.x * self->_inertiaVelocity.x;
  if (v20 < 0.001)
  {
    objc_msgSend__setInertiaRunning_(self, v18, 0, v19);
  }
}

- (void)rotateWithVector:(int64_t)a3 mode:
{
  long long v52 = v4;
  uint64_t v5 = objc_msgSend_view(self, a2, a3, v3);
  uint64_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend_transform(v13, v14, v15, v16);
  float32x4_t v50 = v18;
  float32x4_t v51 = v17;
  float32x4_t v48 = v20;
  float32x4_t v49 = v19;
  __float2 v21 = __sincosf_stret(*(float *)&v52);
  LODWORD(v22) = 0;
  DWORD1(v22) = LODWORD(v21.__cosval);
  *((void *)&v22 + 1) = LODWORD(v21.__sinval);
  LODWORD(v23) = 0;
  *((float *)&v23 + 1) = -v21.__sinval;
  *((void *)&v23 + 1) = LODWORD(v21.__cosval);
  long long v46 = v23;
  long long v47 = v22;
  __float2 v24 = __sincosf_stret(*((float *)&v52 + 1));
  v25.i32[3] = 0;
  v25.i64[0] = LODWORD(v24.__cosval);
  v25.f32[2] = -v24.__sinval;
  v26.i64[0] = LODWORD(v24.__sinval);
  v26.i64[1] = LODWORD(v24.__cosval);
  float32x4_t v44 = v26;
  float32x4_t v45 = v25;
  __float2 v30 = __sincosf_stret(*((float *)&v52 + 2));
  uint64_t v31 = 0;
  v32.i32[1] = 0;
  v32.i64[1] = 0;
  long long v53 = xmmword_1B6E4F300;
  long long v54 = v47;
  long long v55 = v46;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  do
  {
    *(long long *)((char *)&v57 + v31) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(long long *)((char *)&v53 + v31))), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)((char *)&v53 + v31), 1), v44, *(float32x4_t *)((char *)&v53 + v31), 2);
    v31 += 16;
  }
  while (v31 != 48);
  uint64_t v33 = 0;
  float32x4_t cosval_low = (float32x4_t)LODWORD(v30.__cosval);
  cosval_low.i32[1] = LODWORD(v30.__sinval);
  cosval_low.i32[2] = 0;
  v32.f32[0] = -v30.__sinval;
  float32x4_t v35 = v32;
  v35.i32[1] = LODWORD(v30.__cosval);
  v35.i32[2] = 0;
  long long v53 = v57;
  long long v54 = v58;
  long long v55 = v59;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  do
  {
    *(long long *)((char *)&v57 + v33) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(long long *)((char *)&v53 + v33))), v35, *(float32x2_t *)((char *)&v53 + v33), 1), (float32x4_t)xmmword_1B6E4F2E0, *(float32x4_t *)((char *)&v53 + v33), 2);
    v33 += 16;
  }
  while (v33 != 48);
  uint64_t v36 = 0;
  long long v37 = v57;
  long long v38 = v58;
  HIDWORD(v37) = 0;
  long long v39 = v59;
  HIDWORD(v38) = 0;
  HIDWORD(v39) = 0;
  long long v53 = v37;
  long long v54 = v38;
  long long v55 = v39;
  long long v56 = xmmword_1B6E4F370;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  do
  {
    *(long long *)((char *)&v57 + v36) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(long long *)((char *)&v53 + v36))), v50, *(float32x2_t *)((char *)&v53 + v36), 1), v49, *(float32x4_t *)((char *)&v53 + v36), 2), v48, *(float32x4_t *)((char *)&v53 + v36), 3);
    v36 += 16;
  }
  while (v36 != 64);
  double v40 = *(double *)&v59;
  double v41 = *(double *)&v60;
  double v42 = *(double *)&v57;
  double v43 = *(double *)&v58;

  objc_msgSend_setTransform_(v13, v27, *(void *)&v28, *(void *)&v29, v42, v43, v40, v41);
}

- (void)viewWillDrawAtTime:(double)a3
{
  if (objc_msgSend__isInertiaRunning(self, a2, v3, v4, a3))
  {
    MEMORY[0x1F4181798](self, sel__onInertiaTimer, v6, v7);
  }
}

- (void)_setInertiaRunning:(BOOL)a3
{
  BOOL v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (v3) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xFB | v6;

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)_isInertiaRunning
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = (*((unsigned __int8 *)v2 + 297) >> 2) & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_3DConnexionIsPressed
{
  return 0;
}

- (BOOL)wantsRedraw
{
  if (objc_msgSend__isInertiaRunning(self, a2, v2, v3)) {
    return 1;
  }

  return MEMORY[0x1F4181798](self, sel__3DConnexionIsPressed, v5, v6);
}

- (void)endDraggingWithVelocity:(CGPoint)a3
{
  if ((*((unsigned char *)self + 296) & 8) != 0)
  {
    double v4 = fabs(a3.y);
    if (fabs(a3.x) >= 10.0 || v4 >= 10.0)
    {
      CGFloat y = a3.y;
      CGPoint v8 = (CGPoint)vdivq_f64((float64x2_t)a3, (float64x2_t)xmmword_1B6E72940);
      self->_float64x2_t inertiaVelocity = v8;
      if (self->_friction == 0.0)
      {
        __asm
        {
          FMOV            V2.2D, #-20.0
          FMOV            V4.2D, #20.0
        }
        self->_float64x2_t inertiaVelocity = (CGPoint)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v8), (int8x16_t)vminnmq_f64((float64x2_t)v8, _Q4), vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)_Q2, (float64x2_t)v8), _Q2, (int8x16_t)v8));
      }
      objc_msgSend__setInertiaRunning_(self, a2, 1, v3);
      self->_double lastSimulationTime = CACurrentMediaTime();
      uint64_t v17 = objc_msgSend_view(self, v14, v15, v16);
      MEMORY[0x1F4181798](v17, sel_eventHandlerWantsRedraw, v18, v19);
    }
  }
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->super._autoSwitchToFreeCamera) {
    objc_msgSend__switchToFreeViewCamera(self, a2, v3, v4);
  }
  CGPoint v8 = objc_msgSend_view(self, a2, v3, v4);
  uint64_t v12 = objc_msgSend_renderer(v8, v9, v10, v11);
  uint64_t v16 = (VFXNode *)objc_msgSend_pointOfView(v12, v13, v14, v15);
  objc_msgSend_begin(VFXTransaction, v17, v18, v19);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v20, v21, v22, 0.0);
  if (self->super._autoSwitchToFreeCamera) {
    objc_msgSend__prepareFreeViewCamera(self, v23, v24, v25);
  }
  if (objc_msgSend_parentNode(v16, v23, v24, v25) || v16 == self->_freeViewCameraNode)
  {
    __float2 v29 = objc_msgSend_presentationNode(v16, v26, v27, v28);
    uint64_t v33 = objc_msgSend_camera(v29, v30, v31, v32);
    objc_msgSend_fieldOfView(v33, v34, v35, v36);
    if (v40 == 0.0) {
      float v40 = 60.0;
    }
    self->_float originalFov = v40;
    double v41 = objc_msgSend_camera(v29, v37, v38, v39);
    objc_msgSend_orthographicScale(v41, v42, v43, v44);
    self->_float originalOrthoScale = v48;
    self->_float zoomFactor = 1.0;
  }
  else
  {
    objc_msgSend__installFreeViewCameraIfNeeded(self, v26, v27, v28);
  }
  objc_msgSend_commit(VFXTransaction, v45, v46, v47);
  objc_msgSend_computeAutomaticTargetPoint(self, v49, v50, v51);
  freeViewCameraNode = self->_freeViewCameraNode;
  if (freeViewCameraNode)
  {
    objc_msgSend_transform(freeViewCameraNode, v52, v53, v54);
    *(_OWORD *)self->_anon_30 = v56;
    *(_OWORD *)&self->_anon_30[16] = v57;
    *(_OWORD *)&self->_anon_30[32] = v58;
    *(_OWORD *)&self->_anon_30[48] = v59;
    self->_initialPoint.CGFloat x = x;
    self->_initialPoint.CGFloat y = y;
    *((unsigned char *)self + 297) &= ~1u;
  }
}

- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4
{
  *(_OWORD *)a4 = xmmword_1B6E50860;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B65CDA2C;
  v6[3] = &unk_1E6141E90;
  v6[4] = a4;
  sub_1B64A18A4((uint64_t)a3, (uint64_t)v6);
  return *((float *)a4 + 3) >= 0.0;
}

- (__n128)viewedObjectSphere
{
  if ((a1[18].i8[0] & 1) == 0)
  {
    float32x4_t v49 = 0uLL;
    uint64_t v5 = objc_msgSend_view(a1, a2, a3, a4);
    uint64_t v9 = objc_msgSend_world(v5, v6, v7, v8);
    uint64_t v13 = objc_msgSend_rootNode(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_nodeRef(v13, v14, v15, v16);
    if (objc_msgSend_computeBoundingSphereOmittingFloorsForNode_sphere_(a1, v18, v17, (uint64_t)&v49))
    {
      float32x4_t v47 = 0u;
      float32x4_t v48 = 0u;
      float32x4_t v45 = 0u;
      float32x4_t v46 = 0u;
      uint64_t v22 = objc_msgSend_view(a1, v19, v20, v21);
      float32x4_t v26 = objc_msgSend_world(v22, v23, v24, v25);
      __float2 v30 = objc_msgSend_rootNode(v26, v27, v28, v29);
      uint64_t v34 = objc_msgSend_nodeRef(v30, v31, v32, v33);
      sub_1B64A27C4(v34, (uint64_t)&v45, v35, v36, v37, v38, v39, v40);
      float32x4_t v41 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v48, v47, v49, 2), v46, *(float32x2_t *)v49.f32, 1), v45, v49.f32[0]);
      float32x4_t v42 = vmlaq_f32(vmlaq_f32(vmulq_laneq_f32(v47, v49, 3), (float32x4_t)0, v46), (float32x4_t)0, v45);
      float32x4_t v43 = vmulq_f32(v42, v42);
      v41.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0]);
      float32x4_t v49 = v41;
      a1[17] = v41;
    }
    else
    {
      a1[17] = (float32x4_t)xmmword_1B6E4F370;
    }
    a1[18].i8[0] |= 1u;
  }
  return (__n128)a1[17];
}

+ (double)frontVectorWithPointOfView:(void *)a3
{
  uint64_t v5 = objc_msgSend_camera(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_cameraRef(v5, v6, v7, v8);
  *(double *)v9.i64 = sub_1B649CB0C();
  float32x4_t v24 = v9;
  objc_msgSend_worldTransform(a3, v10, v11, v12);
  float32x4_t v16 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32(v13, v24, 2), v14, *(float32x2_t *)v24.f32, 1), v15, v24.f32[0]);
  float32x4_t v17 = vmulq_f32(v24, v24);
  float32x4_t v18 = vmulq_f32(v16, v16);
  v18.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).u64[0];
  float32x4_t v19 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 0);
  v19.i32[3] = 0;
  float32x4_t v20 = vrsqrteq_f32(v19);
  float32x4_t v21 = vmulq_f32(v20, vrsqrtsq_f32(v19, vmulq_f32(v20, v20)));
  int32x4_t v22 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v18.f32[0] != 0.0)), 0x1FuLL));
  v22.i32[3] = 0;
  *(void *)&double result = vbslq_s8((int8x16_t)vcltzq_s32(v22), (int8x16_t)vmulq_f32(v16, vmulq_n_f32(vmulq_f32(v21, vrsqrtsq_f32(v19, vmulq_f32(v21, v21))), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]))), (int8x16_t)v16).u64[0];
  return result;
}

- (uint64_t)frontVector
{
  uint64_t v4 = objc_msgSend_view(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_renderer(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_pointOfView(v8, v9, v10, v11);
  uint64_t v13 = objc_opt_class();

  return MEMORY[0x1F4181798](v13, sel_frontVectorWithPointOfView_, v12, v14);
}

- (void)_beginTranslateAtLocation:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  uint64_t v6 = objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  float64_t v75 = v10;
  uint64_t v14 = objc_msgSend_view(self, v11, v12, v13);
  objc_msgSend_bounds(v14, v15, v16, v17);
  uint64_t v71 = v18;
  int32x4_t v22 = objc_msgSend_view(self, v19, v20, v21);
  float32x4_t v26 = objc_msgSend_renderer(v22, v23, v24, v25);
  __float2 v30 = objc_msgSend_pointOfView(v26, v27, v28, v29);
  v31.f64[0] = v75;
  *(void *)&v31.f64[1] = v71;
  __n128 v76 = (__n128)vcvt_hight_f32_f64(0, v31);
  v31.f64[0] = x;
  v31.f64[1] = y;
  double v32 = COERCE_DOUBLE(vcvt_f32_f64(v31));
  objc_msgSend_viewedObjectSphere(self, v33, v34, v35);
  clickOrigin = (float32x4_t *)self->_clickOrigin;
  *(_OWORD *)self->_clickOrigin = v37;
  objc_msgSend_frontVector(self, v38, v39, v40);
  float32x4_t v74 = v41;
  float32x4_t v78 = 0u;
  float32x4_t v79 = 0u;
  uint64_t v45 = objc_msgSend_nodeRef(v30, v42, v43, v44);
  float32x4_t v49 = objc_msgSend_view(self, v46, v47, v48);
  uint64_t v53 = objc_msgSend_world(v49, v50, v51, v52);
  uint64_t v57 = objc_msgSend_worldRef(v53, v54, v55, v56);
  sub_1B63D5214(v45, v57, &v78, &v79, v76, v32, v58, v59, v60, v61);
  if (v69)
  {
    __n128 v77 = 0uLL;
    sub_1B63F3638(&v77, *clickOrigin, v74, v62, v63, v64, v65, v66, v67, v68);
    if (!sub_1B63F19A0(&v78, (float *)&v77, (float32x4_t *)self->_clickOrigin))
    {
      v70.i64[0] = 0x3F0000003F000000;
      v70.i64[1] = 0x3F0000003F000000;
      float32x4_t *clickOrigin = vmulq_f32(vaddq_f32(v78, v79), v70);
    }
  }
  else
  {
    sub_1B63F2F54(0, @"Warning: _beginTranslateAtLocation: invalid zRange", v63, v64, v65, v66, v67, v68, v71);
  }
}

+ (double)matrixWithNoRoll:(float32x4_t)a3
{
  float32x4_t v14 = vmlaq_f32(vaddq_f32(a2, vmulq_f32(a3, (float32x4_t)0)), (float32x4_t)0, a1);
  float32x4_t v6 = vmulq_f32(v14, v14);
  int32x2_t v7 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).u64[0];
  float32x4_t v8 = (float32x4_t)vdupq_lane_s32(v7, 0);
  v8.i32[3] = 0;
  float32x4_t v9 = vrsqrteq_f32(v8);
  float32x4_t v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  int8x16_t v11 = (int8x16_t)vmulq_f32(v14, vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10))));
  int32x4_t v12 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v7.i32 != 0.0)), 0x1FuLL));
  v12.i32[3] = 0;
  float32x4_t v13 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v12), v11, (int8x16_t)v14);
  v14.i64[0] = 0;
  float32x4_t v15 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)), 0), (int8x16_t)xmmword_1B6E4F330, (int8x16_t)xmmword_1B6E4F320);
  float32x4_t v65 = a3;
  float32x4_t v63 = a1;
  float32x4_t v16 = vmlaq_f32(vmlaq_f32(vnegq_f32(a3), (float32x4_t)0, a2), (float32x4_t)0, a1);
  float32x4_t v17 = vmulq_f32(v16, v16);
  v17.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
  float32x4_t v18 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 0);
  v18.i32[3] = 0;
  float32x4_t v19 = vrsqrteq_f32(v18);
  float32x4_t v20 = vmulq_f32(v19, vrsqrtsq_f32(v18, vmulq_f32(v19, v19)));
  int32x4_t v21 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v17.f32[0] != 0.0)), 0x1FuLL));
  v21.i32[3] = 0;
  float32x4_t v22 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v21), (int8x16_t)vmulq_f32(v16, vmulq_f32(v20, vrsqrtsq_f32(v18, vmulq_f32(v20, v20)))), (int8x16_t)v16);
  float32x4_t v23 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v22, (int32x4_t)v22), (int8x16_t)v22, 0xCuLL);
  int8x16_t v24 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL), vnegq_f32(v22)), v15, v23);
  float32x4_t v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), v24, 0xCuLL);
  float32x4_t v26 = vmlaq_f32(vmulq_f32(v23, vnegq_f32(v25)), v22, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL));
  float32x4_t v27 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26), (int8x16_t)v26, 0xCuLL);
  int32x4_t v28 = (int32x4_t)vmulq_f32(v26, v26);
  v28.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), *(float32x2_t *)v28.i8)).u32[0];
  *(float32x2_t *)v23.f32 = vrsqrte_f32((float32x2_t)v28.u32[0]);
  *(float32x2_t *)v23.f32 = vmul_f32(*(float32x2_t *)v23.f32, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(*(float32x2_t *)v23.f32, *(float32x2_t *)v23.f32)));
  float32x4_t v29 = vmulq_n_f32(v27, vmul_f32(*(float32x2_t *)v23.f32, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(*(float32x2_t *)v23.f32, *(float32x2_t *)v23.f32))).f32[0]);
  float32x4_t v30 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL), vnegq_f32(v29)), v13, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), (int8x16_t)v29, 0xCuLL));
  float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL);
  int32x4_t v32 = (int32x4_t)vmulq_f32(v30, v30);
  v32.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), *(float32x2_t *)v32.i8)).u32[0];
  *(float32x2_t *)v24.i8 = vrsqrte_f32((float32x2_t)v32.u32[0]);
  *(float32x2_t *)v24.i8 = vmul_f32(*(float32x2_t *)v24.i8, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(*(float32x2_t *)v24.i8, *(float32x2_t *)v24.i8)));
  float32x4_t v33 = vmulq_n_f32(v31, vmul_f32(*(float32x2_t *)v24.i8, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(*(float32x2_t *)v24.i8, *(float32x2_t *)v24.i8))).f32[0]);
  float32x4_t v34 = vmulq_f32(v29, v29);
  float32x4_t v35 = vmulq_f32(v13, v13);
  float v36 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0])* sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0]);
  if (v36 > 0.0)
  {
    float32x4_t v37 = vmulq_f32(v29, v13);
    float32x4_t v61 = v33;
    v14.f32[0] = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]/ v36);
    float32x4_t v33 = v61;
  }
  float32x4_t v38 = vmulq_f32(v33, v33);
  v38.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).u64[0];
  float32x4_t v39 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 0);
  v39.i32[3] = 0;
  float32x4_t v40 = vrsqrteq_f32(v39);
  float32x4_t v41 = vmulq_f32(v40, vrsqrtsq_f32(v39, vmulq_f32(v40, v40)));
  int32x4_t v42 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v38.f32[0] != 0.0)), 0x1FuLL));
  v42.i32[3] = 0;
  float32x4_t v62 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v42), (int8x16_t)vmulq_f32(v33, vmulq_f32(v41, vrsqrtsq_f32(v39, vmulq_f32(v41, v41)))), (int8x16_t)v33);
  __float2 v43 = __sincosf_stret(v14.f32[0]);
  uint64_t v44 = 0;
  float32x4_t v45 = v62;
  float32x4_t v46 = vmulq_f32(v45, v45);
  __asm { FMOV            V2.4S, #1.0 }
  int8x16_t v51 = (int8x16_t)vmlaq_n_f32(v46, vsubq_f32(_Q2, v46), v43.__cosval);
  _Q2.f32[0] = (float)(1.0 - v43.__cosval) * vmulq_lane_f32(v45, *(float32x2_t *)v45.f32, 1).f32[0];
  float32x4_t v52 = vmulq_n_f32(v62, v43.__sinval);
  v45.f32[0] = _Q2.f32[0] - v52.f32[2];
  *(float *)&unsigned int v53 = _Q2.f32[0] + v52.f32[2];
  float32x2_t v54 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v62.f32, v62, 2), 1.0 - v43.__cosval);
  _Q2.f32[0] = v54.f32[0] + v52.f32[1];
  float32x2_t v55 = (float32x2_t)vrev64_s32(*(int32x2_t *)v52.f32);
  v56.i32[0] = vsub_f32(v54, v55).u32[0];
  v56.i32[1] = vadd_f32(v54, v55).i32[1];
  v56.i64[1] = vextq_s8(v51, v51, 8uLL).u32[0];
  float v57 = v54.f32[1];
  v58.i64[0] = __PAIR64__(v45.u32[0], v51.u32[0]);
  v58.i64[1] = _Q2.u32[0];
  _Q2.i32[3] = 0;
  _Q2.i64[0] = __PAIR64__(v51.u32[1], v53);
  v67[0] = v63;
  v67[1] = a2;
  v67[2] = v65;
  v67[3] = a4;
  memset(v68, 0, sizeof(v68));
  do
  {
    _Q2.f32[2] = v57 - v52.f32[0];
    v68[v44] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v58, COERCE_FLOAT(v67[v44])), _Q2, *(float32x2_t *)&v67[v44], 1), v56, (float32x4_t)v67[v44], 2), (float32x4_t)xmmword_1B6E4F370, (float32x4_t)v67[v44], 3);
    ++v44;
  }
  while (v44 != 4);
  return *(double *)v68;
}

- (void)clearRoll
{
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  float32x4_t v9 = objc_msgSend_renderer(v5, v6, v7, v8);
  float32x4_t v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend_worldTransform(v13, v14, v15, v16);
  double v50 = v17;
  double v46 = v19;
  double v48 = v18;
  double v44 = v20;
  int32x4_t v21 = objc_opt_class();
  objc_msgSend_matrixWithNoRoll_(v21, v22, v23, v24, v50, v48, v46, v44);
  double v51 = v25;
  double v47 = v27;
  double v49 = v26;
  double v45 = v28;
  int32x4_t v32 = objc_msgSend_view(self, v29, v30, v31);
  float v36 = objc_msgSend_renderer(v32, v33, v34, v35);
  float32x4_t v40 = objc_msgSend_pointOfView(v36, v37, v38, v39);

  objc_msgSend_setWorldTransform_(v40, v41, v42, v43, v51, v49, v47, v45);
}

- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  self->_totalDragWithInertia = a3;
  float32x4_t v10 = objc_msgSend_view(self, a2, a4, a5);
  float32x4_t v14 = objc_msgSend_renderer(v10, v11, v12, v13);
  int32x4_t v21 = objc_msgSend_pointOfView(v14, v15, v16, v17);
  if ((*((unsigned char *)self + 297) & 1) == 0)
  {
    *(_OWORD *)self->_upDir = xmmword_1B6E4F320;
    float32x4_t v22 = vmlaq_f32(vaddq_f32(*(float32x4_t *)&self->_anon_30[16], vmulq_f32(*(float32x4_t *)&self->_anon_30[32], (float32x4_t)0)), (float32x4_t)0, *(float32x4_t *)self->_anon_30);
    float32x4_t v23 = vmulq_f32(v22, v22);
    v23.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).u64[0];
    float32x4_t v24 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0);
    v24.i32[3] = 0;
    float32x4_t v25 = vrsqrteq_f32(v24);
    float32x4_t v26 = vmulq_f32(v25, vrsqrtsq_f32(v24, vmulq_f32(v25, v25)));
    int32x4_t v27 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v23.f32[0] != 0.0)), 0x1FuLL));
    v27.i32[3] = 0;
    *(int8x16_t *)self->_upDir = vbslq_s8((int8x16_t)vcltzq_s32(v27), (int8x16_t)vmulq_f32(v22, vmulq_f32(v26, vrsqrtsq_f32(v24, vmulq_f32(v26, v26)))), (int8x16_t)v22);
    *((unsigned char *)self + 297) |= 1u;
  }
  float32x4_t v28 = *(float32x4_t *)&self->_anon_30[48];
  float32x4_t v146 = v28;
  if (a4 == 1)
  {
    if ((*((unsigned char *)self + 296) & 2) != 0) {
      objc_msgSend_cameraAutomaticTargetPoint(self, v18, v19, v20);
    }
    else {
      objc_msgSend_cameraTarget(self, v18, v19, v20);
    }
    float32x4_t v28 = v146;
    float32x4_t v30 = v29;
    float32x4_t v37 = vsubq_f32(v29, v146);
  }
  else
  {
    float32x4_t v30 = 0uLL;
    float32x4_t v31 = vmlaq_f32(vmlaq_f32(vnegq_f32(*(float32x4_t *)&self->_anon_30[32]), (float32x4_t)0, *(float32x4_t *)&self->_anon_30[16]), (float32x4_t)0, *(float32x4_t *)self->_anon_30);
    float32x4_t v32 = vmulq_f32(v31, v31);
    v32.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).u64[0];
    float32x4_t v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 0);
    v33.i32[3] = 0;
    float32x4_t v34 = vrsqrteq_f32(v33);
    float32x4_t v35 = vmulq_f32(v34, vrsqrtsq_f32(v33, vmulq_f32(v34, v34)));
    int32x4_t v36 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v32.f32[0] != 0.0)), 0x1FuLL));
    v36.i32[3] = 0;
    float32x4_t v37 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v36), (int8x16_t)vmulq_f32(v31, vmulq_f32(v35, vrsqrtsq_f32(v33, vmulq_f32(v35, v35)))), (int8x16_t)v31);
    double x = -x;
    double y = -y;
  }
  float32x4_t v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
  float32x4_t v39 = vnegq_f32(v37);
  float32x4_t v40 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)self->_upDir, *(int32x4_t *)self->_upDir), *(int8x16_t *)self->_upDir, 0xCuLL), v39), *(float32x4_t *)self->_upDir, v38);
  float32x4_t v41 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v40, (int32x4_t)v40), (int8x16_t)v40, 0xCuLL);
  int32x4_t v42 = (int32x4_t)vmulq_f32(v40, v40);
  v42.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v42.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v42, 2), *(float32x2_t *)v42.i8)).u32[0];
  float32x2_t v43 = vrsqrte_f32((float32x2_t)v42.u32[0]);
  float32x2_t v44 = vmul_f32(v43, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(v43, v43)));
  float32x4_t v45 = vmulq_n_f32(v41, vmul_f32(v44, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(v44, v44))).f32[0]);
  float32x4_t v145 = v30;
  if ((*((unsigned char *)self + 297) & 2) != 0)
  {
    if (a5 > 1)
    {
      float32x4_t v83 = (float32x4_t)xmmword_1B6E72980;
      long long v98 = unk_1B6E72990;
      float32x4_t v81 = (float32x4_t)xmmword_1B6E72960;
      float32x4_t v82 = (float32x4_t)unk_1B6E72970;
    }
    else
    {
      float v84 = y * -0.00872664626;
      float32x4_t v85 = vmulq_f32(v45, v45);
      v85.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v85, 2), vaddq_f32(v85, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 1))).u64[0];
      float32x4_t v86 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 0);
      v86.i32[3] = 0;
      float32x4_t v87 = vrsqrteq_f32(v86);
      float32x4_t v88 = vmulq_f32(v87, vrsqrtsq_f32(v86, vmulq_f32(v87, v87)));
      int32x4_t v89 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v85.f32[0] != 0.0)), 0x1FuLL));
      v89.i32[3] = 0;
      float32x4_t v142 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v89), (int8x16_t)vmulq_f32(v45, vmulq_f32(v88, vrsqrtsq_f32(v86, vmulq_f32(v88, v88)))), (int8x16_t)v45);
      __float2 v90 = __sincosf_stret(v84);
      float32x4_t v30 = v145;
      float32x4_t v28 = v146;
      float32x4_t v91 = v142;
      float32x4_t v92 = vmulq_f32(v91, v91);
      __asm { FMOV            V3.4S, #1.0 }
      int8x16_t v94 = (int8x16_t)vmlaq_n_f32(v92, vsubq_f32(_Q3, v92), v90.__cosval);
      _Q3.f32[0] = (float)(1.0 - v90.__cosval) * vmulq_lane_f32(v91, *(float32x2_t *)v91.f32, 1).f32[0];
      float32x4_t v95 = vmulq_n_f32(v142, v90.__sinval);
      float32x2_t v96 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v142.f32, v142, 2), 1.0 - v90.__cosval);
      float32x2_t v97 = (float32x2_t)vrev64_s32(*(int32x2_t *)v95.f32);
      v83.i32[0] = vsub_f32(v96, v97).u32[0];
      v83.i32[1] = vadd_f32(v96, v97).i32[1];
      v81.i32[3] = 0;
      v81.i32[0] = v94.i32[0];
      v81.f32[1] = _Q3.f32[0] - v95.f32[2];
      v82.i32[3] = 0;
      v81.f32[2] = v96.f32[0] + v95.f32[1];
      v82.f32[0] = _Q3.f32[0] + v95.f32[2];
      v82.i32[1] = v94.i32[1];
      v82.f32[2] = v96.f32[1] - v95.f32[0];
      v83.i64[1] = vextq_s8(v94, v94, 8uLL).u32[0];
      long long v98 = xmmword_1B6E4F370;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      long long v136 = v98;
      float v99 = x * -0.00872664626;
      float32x4_t v100 = vrsqrteq_f32((float32x4_t)xmmword_1B6E4F540);
      float32x4_t v101 = vmulq_f32(v100, vrsqrtsq_f32((float32x4_t)xmmword_1B6E4F540, vmulq_f32(v100, v100)));
      float32x4_t v135 = vmulq_f32(vmulq_f32(v101, vrsqrtsq_f32((float32x4_t)xmmword_1B6E4F540, vmulq_f32(v101, v101))), (float32x4_t)xmmword_1B6E4F330);
      float32x4_t v139 = v81;
      float32x4_t v143 = v83;
      float32x4_t v137 = v82;
      __float2 v102 = __sincosf_stret(v99);
      unint64_t v103 = 0;
      float32x4_t v104 = v135;
      float32x4_t v105 = vmulq_f32(v104, v104);
      __asm { FMOV            V2.4S, #1.0 }
      int8x16_t v106 = (int8x16_t)vmlaq_n_f32(v105, vsubq_f32(_Q2, v105), v102.__cosval);
      _Q2.f32[0] = (float)(1.0 - v102.__cosval) * vmulq_lane_f32(v104, *(float32x2_t *)v104.f32, 1).f32[0];
      float32x4_t v107 = vmulq_n_f32(v135, v102.__sinval);
      v104.f32[0] = _Q2.f32[0] - v107.f32[2];
      *(float *)&unsigned int v108 = v107.f32[2] + _Q2.f32[0];
      float32x2_t v109 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v135.f32, v135, 2), 1.0 - v102.__cosval);
      _Q2.f32[0] = v107.f32[1] + v109.f32[0];
      float32x2_t v110 = (float32x2_t)vrev64_s32(*(int32x2_t *)v107.f32);
      v111.i32[0] = vsub_f32(v109, v110).u32[0];
      v111.i32[1] = vadd_f32(v109, v110).i32[1];
      v111.i64[1] = vextq_s8(v106, v106, 8uLL).u32[0];
      float v112 = v109.f32[1];
      v113.i64[0] = __PAIR64__(v104.u32[0], v106.u32[0]);
      v113.i64[1] = _Q2.u32[0];
      _Q2.i32[3] = 0;
      _Q2.i64[0] = __PAIR64__(v106.u32[1], v108);
      float32x4_t v147 = v139;
      float32x4_t v148 = v137;
      float32x4_t v149 = v143;
      long long v150 = v136;
      float32x4_t v151 = 0u;
      float32x4_t v152 = 0u;
      float32x4_t v153 = 0u;
      long long v154 = 0u;
      do
      {
        _Q2.f32[2] = v112 - v107.f32[0];
        *(float32x4_t *)((char *)&v151 + v103) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)((char *)&v147 + v103))), _Q2, *(float32x2_t *)&v147.f32[v103 / 4], 1), v111, *(float32x4_t *)((char *)&v147 + v103), 2), (float32x4_t)xmmword_1B6E4F370, *(float32x4_t *)((char *)&v147 + v103), 3);
        v103 += 16;
      }
      while (v103 != 64);
      float32x4_t v81 = v151;
      float32x4_t v82 = v152;
      float32x4_t v83 = v153;
      float32x4_t v30 = v145;
      float32x4_t v28 = v146;
    }
  }
  else
  {
    float32x4_t v46 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v45, (int32x4_t)v45), (int8x16_t)v45, 0xCuLL), v39), v45, v38);
    float32x4_t v47 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v46, (int32x4_t)v46), (int8x16_t)v46, 0xCuLL);
    int32x4_t v48 = (int32x4_t)vmulq_f32(v46, v46);
    v48.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), *(float32x2_t *)v48.i8)).u32[0];
    float32x2_t v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
    float32x2_t v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
    float32x4_t v51 = vmulq_n_f32(v47, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
    double v52 = 0.0;
    if (a5 == 2) {
      double v53 = 0.0;
    }
    else {
      double v53 = y;
    }
    if (a5 == 1) {
      double v53 = y;
    }
    else {
      double v52 = x;
    }
    *(float *)&double v53 = v53;
    v54.f32[0] = v52;
    float32x4_t v55 = vmlsq_lane_f32(vmulq_n_f32(v45, v54.f32[0]), v51, *(float32x2_t *)&v53, 0);
    int32x4_t v56 = (int32x4_t)vmulq_f32(v55, v55);
    v56.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v56, 2), vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v56.i8, 1))).u32[0];
    float32x2_t v57 = vrsqrte_f32((float32x2_t)v56.u32[0]);
    float32x2_t v58 = vmul_f32(v57, vrsqrts_f32((float32x2_t)v56.u32[0], vmul_f32(v57, v57)));
    float32x4_t v59 = vmulq_n_f32(v55, vmul_f32(v58, vrsqrts_f32((float32x2_t)v56.u32[0], vmul_f32(v58, v58))).f32[0]);
    float32x4_t v60 = vmlaq_f32(vmulq_f32(v38, vnegq_f32(v59)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v59, (int32x4_t)v59), (int8x16_t)v59, 0xCuLL));
    float32x4_t v61 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v60, (int32x4_t)v60), (int8x16_t)v60, 0xCuLL);
    int32x4_t v62 = (int32x4_t)vmulq_f32(v60, v60);
    v62.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), *(float32x2_t *)v62.i8)).u32[0];
    *(float32x2_t *)v59.f32 = vrsqrte_f32((float32x2_t)v62.u32[0]);
    *(float32x2_t *)v59.f32 = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32)));
    float32x4_t v63 = vmulq_n_f32(v61, vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32))).f32[0]);
    v54.i32[1] = LODWORD(v53);
    v61.f32[0] = sqrtf(vaddv_f32(vmul_f32(v54, v54))) * 0.00872664626;
    float32x4_t v64 = vmulq_f32(v63, v63);
    v64.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v64, 2), vaddq_f32(v64, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 1))).u64[0];
    float32x4_t v65 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 0);
    v65.i32[3] = 0;
    float32x4_t v66 = vrsqrteq_f32(v65);
    float32x4_t v67 = vmulq_f32(v66, vrsqrtsq_f32(v65, vmulq_f32(v66, v66)));
    int32x4_t v68 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v64.f32[0] != 0.0)), 0x1FuLL));
    v68.i32[3] = 0;
    float32x4_t v141 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v68), (int8x16_t)vmulq_f32(v63, vmulq_f32(v67, vrsqrtsq_f32(v65, vmulq_f32(v67, v67)))), (int8x16_t)v63);
    __float2 v69 = __sincosf_stret(v61.f32[0]);
    float32x4_t v30 = v145;
    float32x4_t v28 = v146;
    float32x4_t v70 = v141;
    float32x4_t v71 = vmulq_f32(v70, v70);
    __asm { FMOV            V3.4S, #1.0 }
    int8x16_t v77 = (int8x16_t)vmlaq_n_f32(v71, vsubq_f32(_Q3, v71), v69.__cosval);
    _Q3.f32[0] = (float)(1.0 - v69.__cosval) * vmulq_lane_f32(v70, *(float32x2_t *)v70.f32, 1).f32[0];
    float32x4_t v78 = vmulq_n_f32(v141, v69.__sinval);
    float32x2_t v79 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v141.f32, v141, 2), 1.0 - v69.__cosval);
    v70.f32[0] = v79.f32[0] + v78.f32[1];
    *(float *)&unsigned int v80 = v79.f32[1] - v78.f32[0];
    *(int32x2_t *)v78.f32 = vrev64_s32(*(int32x2_t *)v78.f32);
    v83.i32[0] = vsub_f32(v79, *(float32x2_t *)v78.f32).u32[0];
    v83.i32[1] = vadd_f32(v79, *(float32x2_t *)&v78).i32[1];
    v81.i32[0] = v77.i32[0];
    v81.f32[1] = _Q3.f32[0] - v78.f32[2];
    v81.i64[1] = v70.u32[0];
    v82.f32[0] = _Q3.f32[0] + v78.f32[2];
    v82.i32[1] = v77.i32[1];
    v82.i64[1] = v80;
    v83.i64[1] = vextq_s8(v77, v77, 8uLL).u32[0];
  }
  if (a4 == 2)
  {
    float32x4_t v140 = v81;
    float32x4_t v144 = v83;
    float32x4_t v138 = v82;
    objc_msgSend_invalidateCameraTarget(self, v18, v19, v20);
    float32x4_t v82 = v138;
    float32x4_t v81 = v140;
    float32x4_t v83 = v144;
    float32x4_t v115 = v146;
  }
  else
  {
    float32x4_t v116 = vsubq_f32(v28, v30);
    float32x4_t v117 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32(v83, v116, 2), v82, *(float32x2_t *)v116.f32, 1), v81, v116.f32[0]);
    float32x4_t v118 = vmulq_f32(v116, v116);
    float32x4_t v119 = vmulq_f32(v117, v117);
    v119.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v119, 2), vaddq_f32(v119, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.f32, 1))).u64[0];
    float32x4_t v120 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.f32, 0);
    v120.i32[3] = 0;
    float32x4_t v121 = vrsqrteq_f32(v120);
    float32x4_t v122 = vmulq_f32(v121, vrsqrtsq_f32(v120, vmulq_f32(v121, v121)));
    int32x4_t v123 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v119.f32[0] != 0.0)), 0x1FuLL));
    v123.i32[3] = 0;
    float32x4_t v115 = vaddq_f32(v30, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v123), (int8x16_t)vmulq_f32(v117, vmulq_n_f32(vmulq_f32(v122, vrsqrtsq_f32(v120, vmulq_f32(v122, v122))), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1))).f32[0]))), (int8x16_t)v117));
  }
  uint64_t v124 = 0;
  float32x4_t v125 = *(float32x4_t *)&self->_anon_30[16];
  float32x4_t v126 = *(float32x4_t *)&self->_anon_30[32];
  float32x4_t v147 = *(float32x4_t *)self->_anon_30;
  float32x4_t v148 = v125;
  float32x4_t v149 = v126;
  float32x4_t v151 = 0u;
  float32x4_t v152 = 0u;
  float32x4_t v153 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v151 + v124 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)((char *)&v147 + v124 * 4))), v82, *(float32x2_t *)&v147.f32[v124], 1), v83, *(float32x4_t *)((char *)&v147 + v124 * 4), 2);
    v124 += 4;
  }
  while (v124 != 12);
  unint64_t v127 = 0;
  float32x4_t v128 = v151;
  float32x4_t v129 = v152;
  v128.i32[3] = 0;
  v129.i32[3] = 0;
  float32x4_t v130 = v153;
  v130.i32[3] = 0;
  v115.i32[3] = 1.0;
  float32x4_t v147 = v128;
  float32x4_t v148 = v129;
  float32x4_t v149 = v130;
  long long v150 = xmmword_1B6E4F370;
  float32x4_t v151 = 0u;
  float32x4_t v152 = 0u;
  float32x4_t v153 = 0u;
  long long v154 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v151 + v127) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6E4F300, COERCE_FLOAT(*(_OWORD *)((char *)&v147 + v127))), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)&v147.f32[v127 / 4], 1), (float32x4_t)xmmword_1B6E4F2E0, *(float32x4_t *)((char *)&v147 + v127), 2), v115, *(float32x4_t *)((char *)&v147 + v127), 3);
    v127 += 16;
  }
  while (v127 != 64);
  double v131 = *(double *)v153.i64;
  double v132 = *(double *)&v154;
  double v133 = *(double *)v151.i64;
  double v134 = *(double *)v152.i64;

  objc_msgSend_setTransform_(v21, v18, v19, v20, v133, v134, v131, v132);
}

- (void)_translateTo:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  float32x4_t v107 = 0u;
  long long v108 = 0u;
  memset(v106, 0, sizeof(v106));
  v105.i32[2] = 0;
  v105.i64[0] = 0;
  __n128 v104 = 0uLL;
  float32x4_t v6 = objc_msgSend_view(self, a2, v3, v4);
  float32x4_t v10 = objc_msgSend_renderer(v6, v7, v8, v9);
  float32x4_t v14 = objc_msgSend_pointOfView(v10, v11, v12, v13);
  double v18 = objc_msgSend_view(self, v15, v16, v17);
  objc_msgSend_bounds(v18, v19, v20, v21);
  float64_t v98 = v22;
  float32x4_t v26 = objc_msgSend_view(self, v23, v24, v25);
  objc_msgSend_bounds(v26, v27, v28, v29);
  v30.f64[0] = v98;
  v30.f64[1] = v31;
  __n128 v99 = (__n128)vcvt_hight_f32_f64(0, v30);
  v30.f64[0] = x;
  v30.f64[1] = y;
  double v32 = COERCE_DOUBLE(vcvt_f32_f64(v30));
  uint64_t v36 = objc_msgSend_nodeRef(v14, v33, v34, v35);
  float32x4_t v40 = objc_msgSend_view(self, v37, v38, v39);
  float32x2_t v44 = objc_msgSend_world(v40, v41, v42, v43);
  uint64_t v48 = objc_msgSend_worldRef(v44, v45, v46, v47);
  sub_1B63D5214(v36, v48, &v108, &v107, v99, v32, v49, v50, v51, v52);
  if (v53)
  {
    *(void *)&double v54 = sub_1B6456E24(v106, &v107).u64[0];
    v103.i32[2] = 0;
    v103.i64[0] = 0;
    uint64_t v58 = objc_msgSend_nodeRef(v14, v55, v56, v57, v54);
    sub_1B64A1EC8(v58, (__n128 *)&v103, v59, v60, v61, v62, v63, v64);
    float32x4_t v107 = v103;
    objc_msgSend_frontVector(self, v65, v66, v67);
    sub_1B63F3638(&v104, *(float32x4_t *)self->_clickOrigin, v75, v68, v69, v70, v71, v72, v73, v74);
    if (sub_1B63F184C((uint64_t)v106, (float *)&v104, &v105))
    {
      float32x4_t v83 = vnegq_f32(vsubq_f32(v105, *(float32x4_t *)self->_clickOrigin));
      v83.i32[3] = 1.0;
      float32x4_t v102 = v83;
      float v84 = objc_msgSend_presentationNode(v14, v76, v77, v78);
      objc_msgSend_transform(v84, v85, v86, v87);
      uint64_t v91 = 0;
      v109[0] = v92;
      v109[1] = v93;
      v109[2] = v94;
      v109[3] = v95;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      do
      {
        *(long long *)((char *)&v110 + v91 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6E4F300, COERCE_FLOAT(v109[v91])), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)&v109[v91], 1), (float32x4_t)xmmword_1B6E4F2E0, (float32x4_t)v109[v91], 2), v102, (float32x4_t)v109[v91], 3);
        ++v91;
      }
      while (v91 != 4);
      objc_msgSend_setTransform_(v14, v88, v89, v90, *(double *)&v110, *(double *)&v111, *(double *)&v112, *(double *)&v113);
      objc_msgSend_focusNode_(self, v96, 0, v97);
    }
    else
    {
      sub_1B63F2F54(0, @"Warning: Warning: no CFXIntersectionRay3Plane", v77, v78, v79, v80, v81, v82, v99.n128_i64[0]);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  pressGesture = self->_pressGesture;
  if (pressGesture == a3 || pressGesture == a4) {
    return 1;
  }
  tapGesture = self->_tapGesture;
  panGesture = self->_panGesture;
  if (tapGesture == a3 && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)) {
    return 1;
  }
  if (tapGesture == a4 && panGesture == a3) {
    return 1;
  }
  return tapGesture == a4 && self->_pinchGesture == a3;
}

- (id)gestureRecognizers
{
  tapGesture = self->_tapGesture;
  if (tapGesture) {
    return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], a2, (uint64_t)self->_pressGesture, v2, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
  }
  float32x4_t v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1968]);
  objc_msgSend_setMinimumPressDuration_(v6, v7, v8, v9, 0.0);
  float32x4_t v10 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  uint64_t v11 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1AA0]);
  uint64_t v12 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1A58]);
  uint64_t v13 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1B68]);
  objc_msgSend_setNumberOfTapsRequired_(v10, v14, 2, v15);
  objc_msgSend_addTarget_action_(v11, v16, (uint64_t)self, (uint64_t)sel__handlePinch_);
  objc_msgSend_addTarget_action_(v12, v17, (uint64_t)self, (uint64_t)sel__handlePan_);
  objc_msgSend_addTarget_action_(v6, v18, (uint64_t)self, (uint64_t)sel__handlePress_);
  objc_msgSend_addTarget_action_(v13, v19, (uint64_t)self, (uint64_t)sel__handleRotation_);
  objc_msgSend_addTarget_action_(v10, v20, (uint64_t)self, (uint64_t)sel__handleDoubleTap_);
  objc_msgSend_setDelegate_(v6, v21, (uint64_t)self, v22);
  objc_msgSend_setDelegate_(v12, v23, (uint64_t)self, v24);
  objc_msgSend_setDelegate_(v11, v25, (uint64_t)self, v26);
  objc_msgSend_setDelegate_(v13, v27, (uint64_t)self, v28);
  objc_msgSend_setDelegate_(v10, v29, (uint64_t)self, v30);
  objc_msgSend_setDelaysTouchesBegan_(v11, v31, 0, v32);
  objc_msgSend_setDelaysTouchesBegan_(v13, v33, 0, v34);
  objc_msgSend_setDelaysTouchesBegan_(v12, v35, 0, v36);
  objc_msgSend_setDelaysTouchesBegan_(v10, v37, 0, v38);
  objc_msgSend_setDelaysTouchesBegan_(v6, v39, 0, v40);
  objc_msgSend_setCancelsTouchesInView_(v11, v41, 0, v42);
  objc_msgSend_setCancelsTouchesInView_(v13, v43, 0, v44);
  objc_msgSend_setCancelsTouchesInView_(v12, v45, 0, v46);
  objc_msgSend_setCancelsTouchesInView_(v10, v47, 0, v48);
  objc_msgSend_setCancelsTouchesInView_(v6, v49, 0, v50);
  uint64_t v54 = objc_msgSend_enabled(self, v51, v52, v53);
  objc_msgSend_setEnabled_(v11, v55, v54, v56);
  uint64_t v60 = objc_msgSend_enabled(self, v57, v58, v59);
  objc_msgSend_setEnabled_(v13, v61, v60, v62);
  uint64_t v66 = objc_msgSend_enabled(self, v63, v64, v65);
  objc_msgSend_setEnabled_(v12, v67, v66, v68);
  uint64_t v72 = objc_msgSend_enabled(self, v69, v70, v71);
  objc_msgSend_setEnabled_(v10, v73, v72, v74);
  uint64_t v78 = objc_msgSend_enabled(self, v75, v76, v77);
  objc_msgSend_setEnabled_(v6, v79, v78, v80);
  self->_tapGesture = v10;
  self->_panGesture = v12;
  self->_pinchGesture = v11;
  self->_rotateGesture = v13;
  self->_pressGesture = v6;
  return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v81, (uint64_t)v6, v82, self->_panGesture, self->_tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_msgSend_beginGesture_(self, a2, (uint64_t)a3, v3);
  return 1;
}

- (void)_handlePinch:(id)a3
{
  if (*((unsigned char *)self + 296)) {
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1F4181798])(self, sel_pinchWithGestureRecognizer_, a3);
  }
}

- (void)_handlePan:(id)a3
{
  if (*((unsigned char *)self + 296)) {
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1F4181798])(self, sel_panWithGestureRecognizer_, a3);
  }
}

- (void)_handleRotation:(id)a3
{
  if (*((unsigned char *)self + 296)) {
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1F4181798])(self, sel_rotateWithGestureRecognizer_, a3);
  }
}

- (void)_handleDoubleTap:(id)a3
{
  if (*((unsigned char *)self + 296))
  {
    uint64_t v4 = objc_msgSend_view(self, a2, (uint64_t)a3, v3);
    MEMORY[0x1F4181798](v4, sel_switchToNextCamera, v5, v6);
  }
}

- (void)beginGesture:(id)a3
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend_numberOfTouches(a3, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_view(self, v9, v10, v11);
    objc_msgSend_locationOfTouch_inView_(a3, v13, 0, v12);
    double v15 = v14;
    double v17 = v16;
    uint64_t v21 = objc_msgSend_view(self, v18, v19, v20);
    objc_msgSend_bounds(v21, v22, v23, v24);
    double v26 = v25 - v17;
  }
  else
  {
    double v26 = 0.0;
    double v15 = 0.0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_roll = 0.0;
    objc_msgSend__startBrowsingIfNeeded_(self, v27, v28, v29, v15, v26);
    long long v30 = *(_OWORD *)&self->_anon_30[48];
    long long v32 = *(_OWORD *)self->_anon_30;
    long long v31 = *(_OWORD *)&self->_anon_30[16];
    *(_OWORD *)&self->_anon_a0[36] = *(_OWORD *)&self->_anon_30[32];
    *(_OWORD *)&self->_anon_a0[52] = v30;
    *(_OWORD *)&self->_anon_a0[4] = v32;
    *(_OWORD *)&self->_anon_a0[20] = v31;
    self->_browseMode = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend__startBrowsingIfNeeded_(self, v33, v34, v35, v15, v26);
      if ((*((unsigned char *)self + 296) & 0x20) != 0)
      {
        self->_browseMode = 4;
        objc_msgSend__beginTranslateAtLocation_(self, v36, v37, v38, v15, v26);
      }
      self->_browseMode = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_initialZoom = self->_zoomFactor;
      }
    }
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  *((unsigned char *)self + 297) &= ~1u;
  uint64_t v9 = objc_msgSend_view(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_renderer(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_pointOfView(v13, v14, v15, v16);
  if (v17)
  {
    uint64_t v21 = (void *)v17;
    objc_msgSend_rotation(a3, v18, v19, v20);
    *(float *)&double v22 = v22;
    self->_roll = *(float *)&v22;
    __float2 v26 = __sincosf_stret(*(float *)&v22);
    uint64_t v27 = 0;
    *(float *)&unint64_t v28 = -v26.__sinval;
    HIDWORD(v28) = LODWORD(v26.__cosval);
    float32x4_t v29 = *(float32x4_t *)&self->_anon_a0[4];
    float32x4_t v30 = *(float32x4_t *)&self->_anon_a0[20];
    float32x4_t v31 = *(float32x4_t *)&self->_anon_a0[36];
    float32x4_t v32 = *(float32x4_t *)&self->_anon_a0[52];
    v37[0] = __PAIR64__(LODWORD(v26.__sinval), LODWORD(v26.__cosval));
    v37[1] = v28;
    v37[2] = xmmword_1B6E4F2E0;
    v37[3] = xmmword_1B6E4F370;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    do
    {
      *(long long *)((char *)&v38 + v27 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(v37[v27])), v30, *(float32x2_t *)&v37[v27], 1), v31, (float32x4_t)v37[v27], 2), v32, (float32x4_t)v37[v27], 3);
      ++v27;
    }
    while (v27 != 4);
    double v33 = *(double *)&v40;
    double v34 = *(double *)&v41;
    double v35 = *(double *)&v38;
    double v36 = *(double *)&v39;
    objc_msgSend_setTransform_(v21, v23, *(void *)&v24, *(void *)&v25, v35, v36, v33, v34);
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  double v5 = fmax(self->_initialZoom, 0.001);
  objc_msgSend_scale(a3, a2, (uint64_t)a3, v3);
  double v10 = v9 * v5;
  *(float *)&double v10 = v10;

  objc_msgSend_setZoomFactor_(self, v6, v7, v8, v10);
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v6 = objc_msgSend_numberOfTouches(a3, a2, (uint64_t)a3, v3);
  if (self->_browseMode != 3)
  {
    uint64_t v10 = v6;
    if (objc_msgSend_state(a3, v7, v8, v9) == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        uint64_t v14 = objc_msgSend_view(self, v11, v12, v13);
        objc_msgSend_velocityInView_(a3, v15, v14, v16);
        MEMORY[0x1F4181798](self, sel_endDraggingWithVelocity_, v17, v18);
      }
    }
    else
    {
      uint64_t v19 = objc_msgSend_view(self, v11, v12, v13);
      objc_msgSend_translationInView_(a3, v20, v19, v21);
      switch(v10)
      {
        case 3:
          double v31 = -v26;
          if (self->_lastGestureFingerCount != 3)
          {
            objc_msgSend_beginGesture_(self, v22, (uint64_t)a3, v24);
            self->_lastGestureFingerCount = 3;
          }
          objc_msgSend__translationCoef(self, v22, v23, v24);
          uint64_t v35 = 0;
          *(void *)&long long v37 = 0;
          *(float *)&unsigned int v38 = v31 * v36;
          *((void *)&v37 + 1) = __PAIR64__(1.0, v38);
          float32x4_t v39 = *(float32x4_t *)self->_anon_30;
          float32x4_t v40 = *(float32x4_t *)&self->_anon_30[16];
          float32x4_t v41 = *(float32x4_t *)&self->_anon_30[32];
          float32x4_t v42 = *(float32x4_t *)&self->_anon_30[48];
          v76[0] = xmmword_1B6E4F300;
          v76[1] = xmmword_1B6E4F320;
          v76[2] = xmmword_1B6E4F2E0;
          v76[3] = v37;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          do
          {
            *(long long *)((char *)&v77 + v35 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(v76[v35])), v40, *(float32x2_t *)&v76[v35], 1), v41, (float32x4_t)v76[v35], 2), v42, (float32x4_t)v76[v35], 3);
            ++v35;
          }
          while (v35 != 4);
          double v74 = *(double *)&v79;
          double v75 = *(double *)&v80;
          double v72 = *(double *)&v77;
          double v73 = *(double *)&v78;
          uint64_t v43 = objc_msgSend_view(self, v32, v33, v34);
          uint64_t v47 = objc_msgSend_renderer(v43, v44, v45, v46);
          uint64_t v51 = objc_msgSend_pointOfView(v47, v48, v49, v50);
          objc_msgSend_setTransform_(v51, v52, v53, v54, v72, v73, v74, v75);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            objc_msgSend_beginGesture_(self, v22, (uint64_t)a3, v24);
            self->_lastGestureFingerCount = 2;
          }
          uint64_t v55 = objc_msgSend_view(self, v22, v23, v24);
          objc_msgSend_locationOfTouch_inView_(a3, v56, 0, v55);
          uint64_t v60 = objc_msgSend_view(self, v57, v58, v59);
          objc_msgSend_bounds(v60, v61, v62, v63);
          MEMORY[0x1F4181798](self, sel__translateTo_, v64, v65);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            double v27 = v25 + v25;
            int64_t browseMode = self->_browseMode;
            unint64_t stickyAxis = self->_stickyAxis;
            double v30 = v26 * -2.0;
            objc_msgSend__rotateWithDrag_mode_stickyAxis_(self, v22, browseMode, stickyAxis, v27, v30);
          }
          else
          {
            objc_msgSend_beginGesture_(self, v22, (uint64_t)a3, v24);
            uint64_t v69 = objc_msgSend_view(self, v66, v67, v68);
            objc_msgSend_setTranslation_inView_(a3, v70, v69, v71, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
  }
}

@end