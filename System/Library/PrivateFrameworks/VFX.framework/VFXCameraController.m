@interface VFXCameraController
- (BOOL)_isLocationValid:(CGPoint)a3 inViewport:(CGSize)a4;
- (BOOL)automaticTarget;
- (BOOL)drivenByDefaultNavigationCameraController;
- (BOOL)inertiaEnabled;
- (BOOL)isInertiaRunning;
- (BOOL)isTargetFromHitTest;
- (BOOL)useOrbitInteractionMode;
- (VFXCameraController)init;
- (VFXCameraControllerDelegate)delegate;
- (VFXNode)pointOfView;
- (__n128)_targetRelativeToPointOfViewParent;
- (__n128)simdTarget;
- (__n128)simdUp;
- (double)_convertRotationFromWorldToPointOfView:(uint64_t)a3;
- (double)_mapToSphere:(float64_t)a3 inViewport:(double)a4;
- (double)_orientationForMode;
- (double)_orthographicViewSpaceTranslationForZoomAtScreenPoint:(uint64_t)a3 scaleDelta:(uint64_t)a4 viewport:(double)a5;
- (double)lookAtWith:(uint64_t)a3 target:(uint64_t)a4;
- (double)unrolledWorldOrientation:(float *)a3;
- (float)horizontalMaximumAngle;
- (float)inertiaFriction;
- (float)maximumHorizontalAngle;
- (float)maximumVerticalAngle;
- (float)minimumHorizontalAngle;
- (float)minimumVerticalAngle;
- (float)verticalMaximumAngle;
- (int64_t)interactionMode;
- (void)_capOrientationAnglesToMaximum;
- (void)_directionForScreenPoint:(uint64_t)a3 viewport:(uint64_t)a4;
- (void)_endDraggingWithVelocity:(CGPoint)a3;
- (void)_resetOrientationState;
- (void)_rotateByX:(float)a3 Y:(float)a4;
- (void)_setInertiaRunning:(BOOL)a3;
- (void)_translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)_updateArcballOrientation;
- (void)_updateInertiaAtTime:(double)a3;
- (void)_updateRotation;
- (void)beginInteraction:(CGPoint)a3 withViewport:(CGSize)a4;
- (void)clearRoll;
- (void)continueInteraction:(CGPoint)a3 withViewport:(CGSize)a4 sensitivity:(float)a5;
- (void)dealloc;
- (void)dollyBy:(float)a3 onScreenPoint:(CGPoint)a4 viewport:(CGSize)a5;
- (void)dollyToTarget:(float)a3;
- (void)endInteraction:(CGPoint)a3 withViewport:(CGSize)a4 velocity:(CGPoint)a5;
- (void)frameNodes:(id)a3;
- (void)rollAroundTarget:(float)a3;
- (void)rollBy:(float)a3 aroundScreenPoint:(CGPoint)a4 viewport:(CGSize)a5;
- (void)rollCameraSpaceBy:(float)a3 withPoint:(CGPoint)a4 viewport:(CGSize)a5;
- (void)rotateByX:(float)a3 Y:(float)a4;
- (void)setAutomaticTarget:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDrivenByDefaultNavigationCameraController:(BOOL)a3;
- (void)setHorizontalMaximumAngle:(float)a3;
- (void)setInertiaEnabled:(BOOL)a3;
- (void)setInertiaFriction:(float)a3;
- (void)setInteractionMode:(int64_t)a3;
- (void)setIsTargetFromHitTest:(BOOL)a3;
- (void)setMaximumHorizontalAngle:(float)a3;
- (void)setMaximumVerticalAngle:(float)a3;
- (void)setMinimumHorizontalAngle:(float)a3;
- (void)setMinimumVerticalAngle:(float)a3;
- (void)setPointOfView:(id)a3;
- (void)setPointOfView:(id)a3 updateUpTransform:(BOOL)a4;
- (void)setSimdTarget:(VFXCameraController *)self;
- (void)setSimdUp:(VFXCameraController *)self;
- (void)setUp:(VFXCameraController *)self;
- (void)setVerticalMaximumAngle:(float)a3;
- (void)setWorldUp:(VFXCameraController *)self;
- (void)stopInertia;
- (void)translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)translateInScreenSpaceTo:(CGPoint)a3 viewport:(CGSize)a4;
- (void)updateInertiaAtTime:(double)a3;
@end

@implementation VFXCameraController

- (VFXCameraController)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXCameraController;
  result = [(VFXCameraController *)&v3 init];
  if (result)
  {
    *(void *)&result->_inertia.friction = 0x3F8000003D4CCCCDLL;
    result->_inertia.translationSensitivity = 1.0;
    *(_OWORD *)result->_up = xmmword_1B6E4F320;
    BYTE2(result->_delegate) = 0;
    result[1].super.isa = (Class)1;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend__setInertiaRunning_(self, v3, 0, v4);
  v5.receiver = self;
  v5.super_class = (Class)VFXCameraController;
  [(VFXCameraController *)&v5 dealloc];
}

- (void)setUp:(VFXCameraController *)self
{
}

- (void)setWorldUp:(VFXCameraController *)self
{
}

- (void)setPointOfView:(id)a3 updateUpTransform:(BOOL)a4
{
  if (self->_interactionMode != a3)
  {
    objc_msgSend__setInertiaRunning_(self, a2, 0, a4);

    self->_interactionMode = (int64_t)a3;
  }
}

- (void)setPointOfView:(id)a3
{
}

- (void)setInteractionMode:(int64_t)a3
{
  if (self[1].super.isa != (Class)a3)
  {
    objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
    self[1].super.isa = (Class)a3;
  }
}

- (BOOL)inertiaEnabled
{
  return self->_inertia.inertiaEnabled;
}

- (void)setInertiaEnabled:(BOOL)a3
{
  self->_inertia.inertiaEnabled = a3;
  if (objc_msgSend_isInertiaRunning(self, a2, a3, v3) && !a3)
  {
    objc_msgSend__setInertiaRunning_(self, v6, 0, v7);
  }
}

- (float)inertiaFriction
{
  return self->_inertia.friction;
}

- (void)setInertiaFriction:(float)a3
{
  self->_inertia.friction = a3;
}

- (BOOL)isInertiaRunning
{
  return self->_inertia.inertiaRunning;
}

- (__n128)simdUp
{
  return a1[15];
}

- (void)setSimdUp:(VFXCameraController *)self
{
  float32x4_t v8 = v3;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v2);
  int32x4_t v5 = (int32x4_t)vmulq_f32(v8, v8);
  v5.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2), vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v5.i8, 1))).u32[0];
  float32x2_t v6 = vrsqrte_f32((float32x2_t)v5.u32[0]);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v6, v6)));
  *(float32x4_t *)self->_up = vmulq_n_f32(v8, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v7, v7))).f32[0]);
}

- (__n128)simdTarget
{
  return a1[16];
}

- (void)setSimdTarget:(VFXCameraController *)self
{
  *(_OWORD *)self->_target = v2;
}

- (BOOL)isTargetFromHitTest
{
  return self->_isTargetFromHitTest;
}

- (void)setIsTargetFromHitTest:(BOOL)a3
{
  self->_isTargetFromHitTest = a3;
}

- (float)minimumVerticalAngle
{
  return *(float *)&self->_maximumAngles[3];
}

- (float)minimumHorizontalAngle
{
  uint64_t v2 = *(void *)&self->_minimumAngles[7];
  LODWORD(result) = v2;
  return result;
}

- (float)maximumVerticalAngle
{
  return *(float *)(&self->_automaticTarget + 1);
}

- (float)maximumHorizontalAngle
{
  uint64_t v2 = *(void *)&self->_maximumAngles[7];
  LODWORD(result) = v2;
  return result;
}

- (void)setMinimumVerticalAngle:(float)a3
{
  double v3 = a3 / 180.0 * 3.14159265;
  if (v3 > 1.57079633) {
    double v3 = 1.57079633;
  }
  float v4 = fmax(v3, -1.57079633);
  *(float *)&self->_maximumAngles[3] = v4;
}

- (void)setMinimumHorizontalAngle:(float)a3
{
  double v3 = a3 / 180.0 * 3.14159265;
  if (v3 > 3.14159265) {
    double v3 = 3.14159265;
  }
  float v4 = fmax(v3, -3.14159265);
  *(float *)&self->_minimumAngles[7] = v4;
}

- (void)setMaximumVerticalAngle:(float)a3
{
  double v3 = a3 / 180.0 * 3.14159265;
  if (v3 > 1.57079633) {
    double v3 = 1.57079633;
  }
  float v4 = fmax(v3, -1.57079633);
  *(float *)(&self->_automaticTarget + 1) = v4;
}

- (void)setMaximumHorizontalAngle:(float)a3
{
  double v3 = a3 / 180.0 * 3.14159265;
  if (v3 > 3.14159265) {
    double v3 = 3.14159265;
  }
  float v4 = fmax(v3, -3.14159265);
  *(float *)&self->_maximumAngles[7] = v4;
}

- (float)verticalMaximumAngle
{
  ((void (*)(VFXCameraController *, char *))MEMORY[0x1F4181798])(self, sel_maximumVerticalAngle);
  return result;
}

- (float)horizontalMaximumAngle
{
  ((void (*)(VFXCameraController *, char *))MEMORY[0x1F4181798])(self, sel_maximumHorizontalAngle);
  return result;
}

- (void)setVerticalMaximumAngle:(float)a3
{
}

- (void)setHorizontalMaximumAngle:(float)a3
{
}

- (void)translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v5);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;

  objc_msgSend__translateInCameraSpaceByX_Y_Z_(self, v10, v11, v12, v13, v14, v15);
}

- (void)translateInScreenSpaceTo:(CGPoint)a3 viewport:(CGSize)a4
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v4);
  uint64_t v9 = objc_msgSend_pointOfView(self, v6, v7, v8);

  MEMORY[0x1F4181798](v9, sel_localTranslateBy_, v10, v11);
}

- (void)rotateByX:(float)a3 Y:(float)a4
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_cameraRotationWillStartForController_(self->_pointOfView, v7, (uint64_t)self, v8);
  }
  objc_msgSend__setInertiaRunning_(self, v7, 0, v8);
  if (!LOBYTE(self->_delegate)) {
    objc_msgSend__resetOrientationState(self, v9, v10, v11);
  }
  double v12 = a3 / 180.0 * 3.14159265;
  *(float *)&double v12 = v12;
  double v13 = a4 / 180.0 * 3.14159265;
  *(float *)&double v13 = v13;
  objc_msgSend__rotateByX_Y_(self, v9, v10, v11, v12, v13);
  if (objc_opt_respondsToSelector())
  {
    pointOfView = self->_pointOfView;
    MEMORY[0x1F4181798](pointOfView, sel_cameraRotationDidEndForController_, self, v14);
  }
}

- (void)rollCameraSpaceBy:(float)a3 withPoint:(CGPoint)a4 viewport:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v5);
  objc_msgSend__directionForScreenPoint_viewport_(self, v12, v13, v14, x, y, width, height);
  float v15 = a3 / 180.0 * 3.14159265;
  __sincosf_stret(v15 * 0.5);
  uint64_t v19 = objc_msgSend_pointOfView(self, v16, v17, v18);

  MEMORY[0x1F4181798](v19, sel_localRotateBy_, v20, v21);
}

- (void)rollAroundTarget:(float)a3
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  objc_msgSend_simdTarget(self, v6, v7, v8);
  double v12 = objc_msgSend_pointOfView(self, v9, v10, v11);
  objc_msgSend_worldTransform(v12, v13, v14, v15);
  __invert_f4(v29);
  float v16 = a3 / 180.0 * 3.14159265;
  __asm { FMOV            V4.4S, #1.0 }
  __sincosf_stret(v16 * 0.5);
  uint64_t v25 = objc_msgSend_pointOfView(self, v22, v23, v24);

  MEMORY[0x1F4181798](v25, sel_localRotateBy_, v26, v27);
}

- (void)dollyToTarget:(float)a3
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  uint64_t v8 = objc_msgSend_pointOfView(self, v5, v6, v7);
  objc_msgSend_transform(v8, v9, v10, v11);
  __invert_f4(v35);
  uint64_t v15 = objc_msgSend_pointOfView(self, v12, v13, v14);
  objc_msgSend_worldPosition(v15, v16, v17, v18);
  v22 = objc_msgSend_pointOfView(self, v19, v20, v21);
  objc_msgSend_localFront(VFXNode, v23, v24, v25);
  objc_msgSend_convertVector_toNode_(v22, v26, 0, v27);
  uint64_t v31 = objc_msgSend_pointOfView(self, v28, v29, v30);

  MEMORY[0x1F4181798](v31, sel_localTranslateBy_, v32, v33);
}

- (BOOL)useOrbitInteractionMode
{
  if (objc_msgSend_interactionMode(self, a2, v2, v3) == 4 || objc_msgSend_interactionMode(self, v5, v6, v7) == 3)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_interactionMode(self, v8, v9, v10);
    if (v11 != 1) {
      LOBYTE(v11) = objc_msgSend_interactionMode(self, v12, v13, v14) == 2;
    }
  }
  return v11;
}

- (double)unrolledWorldOrientation:(float *)a3
{
  uint64_t v6 = objc_msgSend_pointOfView(a1, a2, (uint64_t)a3, a4);
  objc_msgSend_worldOrientation(v6, v7, v8, v9);
  float32x4_t v138 = v10;
  uint64_t v14 = objc_msgSend_pointOfView(a1, v11, v12, v13);
  objc_msgSend_worldFront(v14, v15, v16, v17);
  float32x4_t v140 = v18;
  objc_msgSend_simdUp(a1, v19, v20, v21);
  float32x4_t v26 = vmulq_f32(v140, v25);
  if (fabsf(fabsf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0], -1.0), 1.0))+ -1.0) >= 0.01)
  {
    objc_msgSend_simdTarget(a1, v22, v23, v24);
    float32x4_t v141 = v32;
    v36 = objc_msgSend_pointOfView(a1, v33, v34, v35);
    objc_msgSend_worldPosition(v36, v37, v38, v39);
    float32x4_t v128 = vsubq_f32(v141, v40);
    if (objc_msgSend_useOrbitInteractionMode(a1, v41, v42, v43))
    {
      int32x4_t v47 = (int32x4_t)v128;
      uint32x4_t v48 = (uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x3C23D70Au), vabdq_f32((float32x4_t)0, v128));
      v48.i32[3] = v48.i32[2];
      float32x4_t v49 = v138;
      if ((vminvq_u32(v48) & 0x80000000) != 0)
      {
        int v53 = 0;
      }
      else
      {
        int32x4_t v50 = (int32x4_t)vmulq_f32(v128, v128);
        v50.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v50, 2), vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v50.i8, 1))).u32[0];
        float32x2_t v51 = vrsqrte_f32((float32x2_t)v50.u32[0]);
        float32x2_t v52 = vmul_f32(v51, vrsqrts_f32((float32x2_t)v50.u32[0], vmul_f32(v51, v51)));
        int32x4_t v47 = (int32x4_t)vmulq_n_f32(v128, vmul_f32(v52, vrsqrts_f32((float32x2_t)v50.u32[0], vmul_f32(v52, v52))).f32[0]);
        int v53 = 1;
      }
    }
    else
    {
      int v53 = 0;
      float32x4_t v49 = v138;
      int32x4_t v47 = (int32x4_t)v128;
    }
    unsigned int v54 = 0;
    float32x4_t v127 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.i8, 0);
    float32x2_t v129 = *(float32x2_t *)v47.i8;
    float32x4_t v126 = (float32x4_t)vdupq_laneq_s32(v47, 2);
    float v55 = 0.0;
    do
    {
      float32x4_t v139 = v49;
      float32x4_t v142 = vmulq_f32(v49, (float32x4_t)xmmword_1B6E4F550);
      objc_msgSend_simdUp(a1, v44, v45, v46, *(_OWORD *)&v126, *(_OWORD *)&v127);
      float32x4_t v59 = v142;
      float32x4_t v61 = v60;
      float32x4_t v62 = vmulq_f32(v142, (float32x4_t)xmmword_1B6E4F550);
      int8x16_t v63 = (int8x16_t)vnegq_f32(v62);
      int8x16_t v64 = (int8x16_t)vtrn2q_s32((int32x4_t)v62, vtrn1q_s32((int32x4_t)v62, (int32x4_t)v63));
      float32x4_t v65 = (float32x4_t)vextq_s8(v64, v64, 8uLL);
      float32x4_t v66 = (float32x4_t)vextq_s8((int8x16_t)v62, v63, 8uLL);
      float32x4_t v67 = (float32x4_t)vrev64q_s32((int32x4_t)v62);
      v67.i32[0] = v63.i32[1];
      v67.i32[3] = v63.i32[2];
      if (v53)
      {
        float32x4_t v68 = vmlaq_f32(vmlaq_f32(vmulq_lane_f32(v66, v129, 1), v65, v127), v67, v126);
        int8x16_t v69 = (int8x16_t)vnegq_f32(v68);
        int8x16_t v70 = (int8x16_t)vtrn2q_s32((int32x4_t)v68, vtrn1q_s32((int32x4_t)v68, (int32x4_t)v69));
        float32x4_t v71 = (float32x4_t)vrev64q_s32((int32x4_t)v68);
        v71.i32[0] = v69.i32[1];
        v71.i32[3] = v69.i32[2];
        float32x4_t v72 = vaddq_f32(vmlaq_f32(vmulq_laneq_f32(v68, v142, 3), v71, (float32x4_t)vdupq_laneq_s32((int32x4_t)v142, 2)), vmlaq_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v68, v69, 8uLL), *(float32x2_t *)v142.f32, 1), (float32x4_t)vextq_s8(v70, v70, 8uLL), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v142.f32, 0)));
      }
      else
      {
        float32x4_t v133 = v65;
        float32x4_t v135 = v61;
        float32x4_t v130 = v66;
        float32x4_t v131 = v67;
        objc_msgSend_localFront(VFXNode, v56, v57, v58);
        float32x4_t v66 = v130;
        float32x4_t v67 = v131;
        float32x4_t v65 = v133;
        float32x4_t v61 = v135;
        float32x4_t v59 = v142;
      }
      float32x4_t v132 = v72;
      float32x4_t v73 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v66, *(float32x2_t *)v61.f32, 1), v65, v61.f32[0]), v67, v61, 2);
      int8x16_t v74 = (int8x16_t)vnegq_f32(v73);
      int8x16_t v75 = (int8x16_t)vtrn2q_s32((int32x4_t)v73, vtrn1q_s32((int32x4_t)v73, (int32x4_t)v74));
      float32x4_t v76 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v73, v74, 8uLL), *(float32x2_t *)v59.f32, 1), (float32x4_t)vextq_s8(v75, v75, 8uLL), v59.f32[0]);
      float32x4_t v77 = (float32x4_t)vrev64q_s32((int32x4_t)v73);
      v77.i32[0] = v74.i32[1];
      v77.i32[3] = v74.i32[2];
      float32x4_t v134 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v73, v59, 3), v77, v59, 2), v76);
      objc_msgSend_localUp(VFXNode, v56, v57, v58);
      float32x4_t v136 = v78;
      objc_msgSend_localFront(VFXNode, v79, v80, v81);
      float32x4_t v83 = vmulq_f32(v134, v82);
      float32x4_t v84 = vmlsq_lane_f32(v134, v82, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v83, 2), vaddq_f32(v83, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v83.f32, 1))), 0);
      float32x4_t v85 = v82;
      float32x4_t v143 = v82;
      float32x4_t v86 = vmulq_f32(v84, v84);
      v86.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v86, 2), vaddq_f32(v86, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 1))).u64[0];
      float32x4_t v87 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 0);
      v87.i32[3] = 0;
      float32x4_t v88 = vrsqrteq_f32(v87);
      float32x4_t v89 = vmulq_f32(v88, vrsqrtsq_f32(v87, vmulq_f32(v88, v88)));
      int8x16_t v90 = (int8x16_t)vmulq_f32(vmulq_f32(v89, vrsqrtsq_f32(v87, vmulq_f32(v89, v89))), v84);
      int32x4_t v91 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v86.f32[0] != 0.0)), 0x1FuLL));
      v91.i32[3] = 0;
      float32x4_t v92 = vmulq_f32(v136, v85);
      float32x4_t v93 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v91), v90, (int8x16_t)v84);
      float32x4_t v94 = vmlsq_lane_f32(v136, v85, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))), 0);
      float32x4_t v95 = vmulq_f32(v94, v94);
      v95.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v95, 2), vaddq_f32(v95, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v95.f32, 1))).u64[0];
      float32x4_t v96 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v95.f32, 0);
      v96.i32[3] = 0;
      float32x4_t v97 = vrsqrteq_f32(v96);
      float32x4_t v98 = vmulq_f32(v97, vrsqrtsq_f32(v96, vmulq_f32(v97, v97)));
      int32x4_t v99 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v95.f32[0] != 0.0)), 0x1FuLL));
      v99.i32[3] = 0;
      float32x4_t v100 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v99), (int8x16_t)vmulq_f32(v94, vmulq_f32(v98, vrsqrtsq_f32(v96, vmulq_f32(v98, v98)))), (int8x16_t)v94);
      int8x16_t v101 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v100, (int32x4_t)v100), (int8x16_t)v100, 0xCuLL), vnegq_f32(v93)), v100, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v93, (int32x4_t)v93), (int8x16_t)v93, 0xCuLL));
      float32x4_t v137 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v101, (int32x4_t)v101), v101, 0xCuLL);
      float32x4_t v102 = vmulq_f32(v100, v93);
      float v103 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v102, 2), vaddq_f32(v102, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v102.f32, 1))).f32[0], -1.0), 1.0));
      float32x4_t v104 = vmulq_f32(v143, v137);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v104, 2), vaddq_f32(v104, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v104.f32, 1))).f32[0] <= 0.0)float v105 = -v103; {
      else
      }
        float v105 = v103;
      float32x4_t v106 = vmulq_f32(v132, v132);
      v106.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v106, 2), vaddq_f32(v106, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v106.f32, 1))).u64[0];
      float32x4_t v107 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v106.f32, 0);
      v107.i32[3] = 0;
      float32x4_t v108 = vrsqrteq_f32(v107);
      float32x4_t v109 = vmulq_f32(v108, vrsqrtsq_f32(v107, vmulq_f32(v108, v108)));
      int32x4_t v110 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v106.f32[0] != 0.0)), 0x1FuLL));
      v110.i32[3] = 0;
      float32x4_t v144 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v110), (int8x16_t)vmulq_f32(v132, vmulq_f32(v109, vrsqrtsq_f32(v107, vmulq_f32(v109, v109)))), (int8x16_t)v132);
      __float2 v112 = __sincosf_stret(v105 * -0.5);
      _S1 = v112.__cosval;
      _Q0 = vmulq_n_f32(v144, v112.__sinval);
      _Q6 = (int32x4_t)v139;
      float32x4_t v115 = vmlaq_laneq_f32(vmulq_n_f32(v139, v112.__cosval), _Q0, v139, 3);
      int8x16_t v116 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q0, (int32x4_t)_Q0), (int8x16_t)_Q0, 0xCuLL), vnegq_f32(v139)), _Q0, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v139, 0xCuLL));
      __asm { FMLA            S0, S1, V6.S[3] }
      float32x4_t v49 = vaddq_f32(v115, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v116, (int32x4_t)v116), v116, 0xCuLL));
      v49.i32[3] = _Q0.i32[0];
      float v55 = v55 + v105;
      if (fabsf(v103) <= 0.001) {
        break;
      }
    }
    while (v54++ < 0x63);
    if (a3) {
      *a3 = v55;
    }
    int8x16_t v121 = (int8x16_t)vmulq_f32(v49, v49);
    *(float32x2_t *)v121.i8 = vadd_f32(*(float32x2_t *)v121.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v121, v121, 8uLL));
    float32x4_t v122 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v121.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v121.i8, 1)), 0);
    float32x4_t v123 = vrsqrteq_f32(v122);
    float32x4_t v124 = vmulq_f32(v123, vrsqrtsq_f32(v122, vmulq_f32(v123, v123)));
    __asm { FMOV            V2.4S, #1.0 }
    *(void *)&double result = vmulq_f32(v49, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v122), _Q2, (int8x16_t)vmulq_f32(v124, vrsqrtsq_f32(v122, vmulq_f32(v124, v124))))).u64[0];
  }
  else
  {
    if (a3) {
      *a3 = 0.0;
    }
    uint64_t v27 = objc_msgSend_pointOfView(a1, v22, v23, v24);
    objc_msgSend_worldOrientation(v27, v28, v29, v30);
  }
  return result;
}

- (void)clearRoll
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v2);
  objc_msgSend_unrolledWorldOrientation_(self, v4, 0, v5);
  double v14 = v6;
  float32x4_t v10 = objc_msgSend_pointOfView(self, v7, v8, v9);

  objc_msgSend_setWorldOrientation_(v10, v11, v12, v13, v14);
}

- (void)stopInertia
{
  objc_msgSend__setInertiaRunning_(self, a2, 0, v2);
}

- (void)frameNodes:(id)a3
{
  v125[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  uint64_t v9 = objc_msgSend_pointOfView(self, v6, v7, v8);
  if (objc_msgSend_camera(v9, v10, v11, v12))
  {
    uint64_t v16 = objc_msgSend_pointOfView(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_world(v16, v17, v18, v19);
    if (v20)
    {
      uint64_t v23 = (void *)v20;
      VFXNodeGetBoundingSphere(a3, (const char *)0x1010101, v21, v22);
      float v28 = v27.f32[3];
      if (v27.f32[3] != 0.0)
      {
        float32x4_t v124 = v27;
        uint64_t v29 = objc_msgSend_pointOfView(self, v24, v25, v26);
        uint64_t v33 = objc_msgSend_camera(v29, v30, v31, v32);
        if (objc_msgSend_usesOrthographicProjection(v33, v34, v35, v36))
        {
          v125[0] = objc_msgSend_rootNode(v23, v37, v38, v39);
          v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v40, (uint64_t)v125, 1);
          VFXNodeGetBoundingSphere(v41, (const char *)0x10000, v42, v43);
          float32x4_t v45 = vsubq_f32(v124, v44);
          float32x4_t v46 = vmulq_f32(v45, v45);
          float v47 = v44.f32[3]
              + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v46, 2), vaddq_f32(v46, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v46.f32, 1))).f32[0]);
          float32x2_t v51 = objc_msgSend_pointOfView(self, v48, v49, v50);
          float v55 = objc_msgSend_camera(v51, v52, v53, v54);
          objc_msgSend_zNear(v55, v56, v57, v58);
          *(float *)&long long v60 = v59 + v47;
          long long v121 = v60;
          int8x16_t v64 = objc_msgSend_pointOfView(self, v61, v62, v63);
          float32x4_t v68 = objc_msgSend_camera(v64, v65, v66, v67);
          *(float *)&double v69 = v28 * 1.33;
          objc_msgSend_setOrthographicScale_(v68, v70, v71, v72, v69);
        }
        else
        {
          float32x4_t v76 = objc_msgSend_pointOfView(self, v37, v38, v39);
          uint64_t v80 = objc_msgSend_camera(v76, v77, v78, v79);
          objc_msgSend_fieldOfView(v80, v81, v82, v83);
          float v85 = (float)(v84 * 0.5) / 180.0 * 3.14159265;
          float v86 = v28 / sinf(v85);
          int8x16_t v90 = objc_msgSend_pointOfView(self, v87, v88, v89);
          float32x4_t v94 = objc_msgSend_camera(v90, v91, v92, v93);
          objc_msgSend_zNear(v94, v95, v96, v97);
          *(float *)&long long v99 = v98 + v86;
          long long v121 = v99;
        }
        float32x4_t v100 = objc_msgSend_pointOfView(self, v73, v74, v75, v121);
        objc_msgSend_worldFront(v100, v101, v102, v103);
        int32x4_t v105 = (int32x4_t)vmulq_f32(v104, v104);
        v105.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v105, 2), vadd_f32(*(float32x2_t *)v105.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v105.i8, 1))).u32[0];
        float32x2_t v106 = vrsqrte_f32((float32x2_t)v105.u32[0]);
        float32x2_t v107 = vmul_f32(v106, vrsqrts_f32((float32x2_t)v105.u32[0], vmul_f32(v106, v106)));
        *(void *)&double v123 = vmlsq_lane_f32(v124, vmulq_n_f32(v104, vmul_f32(v107, vrsqrts_f32((float32x2_t)v105.u32[0], vmul_f32(v107, v107))).f32[0]), v122, 0).u64[0];
        v111 = objc_msgSend_pointOfView(self, v108, v109, v110);
        objc_msgSend_setPosition_(v111, v112, v113, v114, v123);
        if (objc_msgSend_automaticTarget(self, v115, v116, v117)) {
          objc_msgSend_setSimdTarget_(self, v118, v119, v120, *(double *)v124.i64);
        }
      }
    }
  }
}

- (double)lookAtWith:(uint64_t)a3 target:(uint64_t)a4
{
  objc_msgSend_simdUp(a1, a2, a3, a4);
  float32x4_t v6 = vsubq_f32(a6, a5);
  int32x4_t v7 = (int32x4_t)vmulq_f32(v6, v6);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  float32x4_t v10 = vmulq_n_f32(v6, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
  int8x16_t v11 = (int8x16_t)vnegq_f32(v10);
  float32x4_t v13 = vmlsq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL), vnegq_f32(v12)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), v10);
  float32x4_t v14 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL);
  int32x4_t v15 = (int32x4_t)vmulq_f32(v13, v13);
  v15.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), *(float32x2_t *)v15.i8)).u32[0];
  float32x2_t v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
  float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
  *(void *)&double result = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]).u64[0];
  return result;
}

- (void)beginInteraction:(CGPoint)a3 withViewport:(CGSize)a4
{
  double height = a4.height;
  double y = a3.y;
  double width = a4.width;
  double x = a3.x;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v4);
  v6.f64[0] = width;
  v6.f64[1] = height;
  float64x2_t v69 = v6;
  LOBYTE(self->_delegate) = 1;
  if (objc_msgSend_automaticTarget(self, v7, v8, v9))
  {
    float32x4_t v13 = objc_msgSend_pointOfView(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_worldRef(v13, v14, v15, v16);
    if (!v17) {
      return;
    }
    uint64_t v25 = (__n128 *)v17;
    __n128 v68 = (__n128)vcvt_hight_f32_f64(0, v69);
    v26.f64[0] = x;
    v26.f64[1] = y;
    float32x2_t v27 = vcvt_f32_f64(v26);
    sub_1B64B0C28(v17, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v31 = objc_msgSend_pointOfView(self, v28, v29, v30);
    uint64_t v35 = objc_msgSend_nodeRef(v31, v32, v33, v34);
    v41 = (const void *)sub_1B63DA6D0(v25, v35, 0, v36, v37, v38, v39, v40, *(double *)&v27, v68);
    sub_1B64B0CB4((uint64_t)v25, v42, v43, v44, v45, v46, v47, v48);
    if (v41)
    {
      uint64_t v49 = objc_msgSend_hitTestResultsFromHitTestResultRef_(VFXHitTestResult, v10, (uint64_t)v41, v12);
      CFRelease(v41);
      if (objc_msgSend_count(v49, v50, v51, v52))
      {
        uint64_t v53 = objc_msgSend_objectAtIndex_(v49, v10, 0, v12);
        objc_msgSend_worldCoordinates(v53, v54, v55, v56);
        objc_msgSend_setTarget_(self, v57, v58, v59);
      }
    }
  }
  else
  {
    v60.f64[0] = x;
    v60.f64[1] = y;
    float32x2_t v27 = vcvt_f32_f64(v60);
  }
  *(float32x2_t *)self->_anon_70 = v27;
  *(float32x2_t *)&self->_anon_70[16] = v27;
  objc_msgSend__resetOrientationState(self, v10, v11, v12, *(_OWORD *)&v68);
  if (objc_msgSend_interactionMode(self, v61, v62, v63) == 3 || objc_msgSend_interactionMode(self, v64, v65, v66) == 4)
  {
    *(float32x2_t *)self->_anon_90 = vmla_f32(vneg_f32(*(float32x2_t *)self->_anon_70), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v69));
    objc_msgSend__mapToSphere_inViewport_(self, v64, v65, v66, x, y, width, height);
    *(_OWORD *)&self->_anon_90[16] = v67;
  }
}

- (void)continueInteraction:(CGPoint)a3 withViewport:(CGSize)a4 sensitivity:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  CGFloat y = a3.y;
  *(float32x2_t *)&self->_anon_70[8] = vcvt_f32_f64((float64x2_t)a3);
  if (a4.width >= a4.height) {
    double v11 = a4.width;
  }
  else {
    double v11 = a4.height;
  }
  float v12 = 360.0 / v11 * a5;
  self->_inertia.rotationSensitivitCGFloat y = v12;
  self->_inertia.translationSensitivitCGFloat y = a5;
  if (!objc_msgSend_interactionMode(self, a2, v5, v6, a3, *(void *)&a3.y)
    || objc_msgSend_interactionMode(self, v13, v14, v15) == 1
    || objc_msgSend_interactionMode(self, v13, v14, v15) == 2)
  {
    double v16 = *(double *)&self->_anon_70[8];
    double v17 = COERCE_DOUBLE(vmul_n_f32(vsub_f32(*(float32x2_t *)self->_anon_70, *(float32x2_t *)&v16), self->_inertia.rotationSensitivity));
    LODWORD(v16) = HIDWORD(v17);
    objc_msgSend_rotateByX_Y_(self, v13, v14, v15, v17, v16);
    *(void *)self->_anon_70 = *(void *)&self->_anon_70[8];
  }
  else if (objc_msgSend_interactionMode(self, v13, v14, v15) == 3 {
         || objc_msgSend_interactionMode(self, v18, v19, v20) == 4)
  }
  {
    objc_msgSend__mapToSphere_inViewport_(self, v18, v19, v20, v36, v37, width, height);
    *(_OWORD *)&self->_anon_90[32] = v21;
    objc_msgSend__updateArcballOrientation(self, v22, v23, v24);
  }
  else if (objc_msgSend_interactionMode(self, v18, v19, v20) == 5)
  {
    float32x2_t v28 = vsub_f32(*(float32x2_t *)&self->_anon_70[8], *(float32x2_t *)&self->_anon_70[16]);
    double v29 = COERCE_DOUBLE(vmul_n_f32(v28, self->_inertia.translationSensitivity));
    v28.f32[0] = -*(float *)&v29;
    LODWORD(v29) = HIDWORD(v29);
    objc_msgSend__translateInCameraSpaceByX_Y_Z_(self, v25, v26, v27, *(double *)&v28, v29, 0.0);
  }
  else if (objc_msgSend_interactionMode(self, v25, v26, v27) == 6)
  {
    double v34 = COERCE_DOUBLE(vmul_n_f32(vsub_f32(*(float32x2_t *)&self->_anon_70[8], *(float32x2_t *)&self->_anon_70[16]), self->_inertia.translationSensitivity));
    *(float *)&double v33 = -*((float *)&v34 + 1);
    objc_msgSend__translateInCameraSpaceByX_Y_Z_(self, v30, v31, v32, v34, 0.0, v33);
  }
  *(void *)&self->_anon_70[16] = *(void *)&self->_anon_70[8];
}

- (void)endInteraction:(CGPoint)a3 withViewport:(CGSize)a4 velocity:(CGPoint)a5
{
  LOBYTE(self->_delegate) = 0;
  ((void (*)(VFXCameraController *, char *))MEMORY[0x1F4181798])(self, sel__endDraggingWithVelocity_);
}

- (void)rollBy:(float)a3 aroundScreenPoint:(CGPoint)a4 viewport:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v5);
  objc_msgSend__directionForScreenPoint_viewport_(self, v12, v13, v14, x, y, width, height);
  float32x4_t v16 = vmulq_f32(v15, v15);
  v16.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).u64[0];
  float32x4_t v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0);
  float v18 = a3 / 180.0 * 3.14159265;
  v17.i32[3] = 0;
  float32x4_t v19 = vrsqrteq_f32(v17);
  float32x4_t v20 = vmulq_f32(v19, vrsqrtsq_f32(v17, vmulq_f32(v19, v19)));
  int32x4_t v21 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v16.f32[0] != 0.0)), 0x1FuLL));
  v21.i32[3] = 0;
  float32x4_t v45 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v21), (int8x16_t)vmulq_f32(v15, vmulq_f32(v20, vrsqrtsq_f32(v17, vmulq_f32(v20, v20)))), (int8x16_t)v15);
  __float2 v22 = __sincosf_stret(v18 * 0.5);
  float32x4_t v46 = vmulq_n_f32(v45, v22.__sinval);
  uint64_t v26 = objc_msgSend_pointOfView(self, v23, v24, v25);
  objc_msgSend_orientation(v26, v27, v28, v29);
  _S5 = v22.__cosval;
  int8x16_t v32 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v46, (int32x4_t)v46), (int8x16_t)v46, 0xCuLL), vnegq_f32(_Q0)), v46, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q0, (int32x4_t)_Q0), (int8x16_t)_Q0, 0xCuLL));
  __asm { FMLA            S1, S5, V0.S[3] }
  *(void *)&double v47 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(_Q0, v22.__cosval), v46, _Q0, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), v32, 0xCuLL)).u64[0];
  v41 = objc_msgSend_pointOfView(self, v38, v39, v40);

  objc_msgSend_setOrientation_(v41, v42, v43, v44, v47);
}

- (void)dollyBy:(float)a3 onScreenPoint:(CGPoint)a4 viewport:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v5);
  objc_msgSend__directionForScreenPoint_viewport_(self, v11, v12, v13, x, y, width, height);
  uint64_t v17 = objc_msgSend_pointOfView(self, v14, v15, v16);

  MEMORY[0x1F4181798](v17, sel_localTranslateBy_, v18, v19);
}

- (void)_resetOrientationState
{
  uint64_t v5 = objc_msgSend_pointOfView(self, a2, v2, v3);
  objc_msgSend_worldTransform(v5, v6, v7, v8);
  *(float32x4_t *)&self->_anon_10[16] = v12;
  *(float32x4_t *)&self->_anon_10[32] = v13;
  *(float32x4_t *)&self->_anon_10[48] = v14;
  *(_OWORD *)&self->_anon_10[64] = v15;
  int32x4_t v16 = (int32x4_t)vmulq_f32(v12, v12);
  int32x4_t v17 = (int32x4_t)vmulq_f32(v13, v13);
  int32x4_t v18 = (int32x4_t)vmulq_f32(v14, v14);
  int32x4_t v19 = vzip2q_s32(v16, v18);
  float32x4_t v20 = (float32x4_t)vzip1q_s32(vzip1q_s32(v16, v18), v17);
  float32x4_t v21 = (float32x4_t)vtrn2q_s32(v16, v17);
  v21.i32[2] = v18.i32[1];
  float32x4_t v22 = vaddq_f32((float32x4_t)vzip1q_s32(v19, vdupq_laneq_s32(v17, 2)), vaddq_f32(v20, v21));
  v21.i64[0] = 0x80000000800000;
  v21.i64[1] = 0x80000000800000;
  int8x16_t v23 = (int8x16_t)vcgeq_f32(v21, v22);
  v22.i32[3] = 0;
  float32x4_t v24 = vrsqrteq_f32(v22);
  float32x4_t v25 = vmulq_f32(v24, vrsqrtsq_f32(v22, vmulq_f32(v24, v24)));
  int32x4_t v26 = (int32x4_t)v23;
  v26.i32[3] = 0;
  float32x4_t v27 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v26), (int8x16_t)v22, (int8x16_t)vmulq_f32(v25, vrsqrtsq_f32(v22, vmulq_f32(v25, v25))));
  float32x4_t v28 = vmulq_n_f32(v12, v27.f32[0]);
  float32x4_t v29 = vmulq_lane_f32(v13, *(float32x2_t *)v27.f32, 1);
  float32x4_t v30 = vmulq_laneq_f32(v14, v27, 2);
  int8x16_t v31 = (int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30);
  int8x16_t v32 = (int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29);
  int32x4_t v33 = (int32x4_t)v28;
  if (v23.i32[0])
  {
    int8x16_t v34 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v31, (int8x16_t)v30, 0xCuLL), vnegq_f32(v29)), v30, (float32x4_t)vextq_s8(v32, (int8x16_t)v29, 0xCuLL));
    int32x4_t v33 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v34, (int32x4_t)v34), v34, 0xCuLL);
  }
  int8x16_t v35 = (int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28);
  float32x4_t v36 = v29;
  if (v23.i32[1])
  {
    int8x16_t v37 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v35, (int8x16_t)v28, 0xCuLL), vnegq_f32(v30)), v28, (float32x4_t)vextq_s8(v31, (int8x16_t)v30, 0xCuLL));
    float32x4_t v36 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), v37, 0xCuLL);
  }
  if (v23.i32[2])
  {
    int8x16_t v23 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v32, (int8x16_t)v29, 0xCuLL), vnegq_f32(v28)), v29, (float32x4_t)vextq_s8(v35, (int8x16_t)v28, 0xCuLL));
    float32x4_t v30 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), v23, 0xCuLL);
  }
  float v38 = (float)(*(float *)v33.i32 + v36.f32[1]) + v30.f32[2];
  if (v38 > 0.0)
  {
    float32x4_t v39 = (float32x4_t)vzip2q_s32((int32x4_t)v36, vuzp1q_s32((int32x4_t)v36, (int32x4_t)v30));
    v39.i32[2] = v33.i32[1];
    float v40 = sqrtf(v38 + 1.0);
    float32x4_t v41 = (float32x4_t)vtrn2q_s32((int32x4_t)v30, vzip2q_s32((int32x4_t)v30, v33));
    v41.i32[2] = v36.i32[0];
    float32x4_t v43 = vsubq_f32(v39, v41);
    v39.f32[3] = v40;
    v41.f32[3] = v40;
    float32x4_t v42 = vmulq_f32(v39, v41);
    v43.i32[3] = v42.i32[3];
LABEL_18:
    v42.f32[0] = 0.5 / v40;
    float32x4_t v53 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 0);
    goto LABEL_19;
  }
  if (*(float *)v33.i32 < v36.f32[1] || *(float *)v33.i32 < v30.f32[2])
  {
    if (v36.f32[1] <= v30.f32[2])
    {
      float v40 = sqrtf((float)((float)(v30.f32[2] + 1.0) - *(float *)v33.i32) - v36.f32[1]);
      *(float32x2_t *)v43.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v33, (int32x4_t)v36), *(float32x2_t *)v30.f32);
      float32x2_t v54 = (float32x2_t)__PAIR64__(v33.u32[1], LODWORD(v40));
      float32x2_t v55 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.f32, 0);
      *(float32x2_t *)v42.f32 = vsub_f32(*(float32x2_t *)v33.i8, v55);
      v55.f32[0] = v40;
      v55.i32[0] = vmul_f32(v54, v55).u32[0];
      v55.i32[1] = v42.i32[1];
      *(float32x2_t *)&v43.u32[2] = v55;
      goto LABEL_18;
    }
    float v47 = sqrtf((float)((float)(v36.f32[1] + 1.0) - *(float *)v33.i32) - v30.f32[2]);
    *(int32x2_t *)v23.i8 = vdup_laneq_s32((int32x4_t)v36, 2);
    int8x16_t v45 = v23;
    *(float *)v45.i32 = v47;
    v45.i32[0] = vmul_f32(*(float32x2_t *)v45.i8, (float32x2_t)__PAIR64__(v30.u32[1], LODWORD(v47))).u32[0];
    v45.i32[1] = vadd_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v30).i32[1];
    int8x16_t v46 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.i8, 1), v36);
    int32x2_t v52 = (int32x2_t)vsubq_f32(v30, (float32x4_t)vdupq_laneq_s32(v33, 2)).u64[0];
    float32x4_t v53 = (float32x4_t)vextq_s8(vextq_s8(v46, v46, 4uLL), v45, 0xCuLL);
    v53.i32[3] = v52.i32[0];
  }
  else
  {
    float v47 = sqrtf((float)((float)(*(float *)v33.i32 + 1.0) - v36.f32[1]) - v30.f32[2]);
    float32x2_t v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.f32, 0);
    float32x2_t v49 = vadd_f32(*(float32x2_t *)v33.i8, v48);
    v48.f32[0] = v47;
    v53.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v33.u32[1], LODWORD(v47)), v48).u32[0];
    v53.i32[1] = v49.i32[1];
    float32x2_t v50 = (float32x2_t)vzip2q_s32(v33, (int32x4_t)v36).u64[0];
    LODWORD(v51) = vadd_f32(v50, *(float32x2_t *)v30.f32).u32[0];
    int32x2_t v52 = (int32x2_t)vsub_f32(v50, *(float32x2_t *)v30.f32);
    HIDWORD(v51) = v52.i32[1];
    v53.i64[1] = v51;
  }
  *(float *)v52.i32 = 0.5 / v47;
  float32x4_t v43 = (float32x4_t)vdupq_lane_s32(v52, 0);
LABEL_19:
  *(float32x4_t *)&self->_anon_10[80] = vmulq_f32(v43, v53);
  *(void *)self->_anon_10 = 0;
  uint32x2_t v56 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_minimumAngles[7]));
  if ((vpmax_u32(v56, v56).u32[0] & 0x80000000) != 0
    || (v57.i64[0] = 0,
        uint32x2_t v58 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_maximumAngles[7])),
        (vpmax_u32(v58, v58).u32[0] & 0x80000000) != 0))
  {
    uint64_t v59 = objc_msgSend_interactionMode(self, v9, v10, v11);
    uint64_t v63 = objc_msgSend_pointOfView(self, v60, v61, v62);
    if (v59)
    {
      objc_msgSend_worldPosition(v63, v64, v65, v66);
      float32x4_t v113 = v67;
      objc_msgSend_simdTarget(self, v68, v69, v70);
      float32x4_t v75 = vsubq_f32(v113, v74);
    }
    else
    {
      objc_msgSend_worldFront(v63, v64, v65, v66);
      float32x4_t v75 = vnegq_f32(v76);
    }
    float32x4_t v114 = v75;
    objc_msgSend_simdUp(self, v71, v72, v73);
    float32x4_t v78 = vmulq_f32(v114, v77);
    float32x4_t v110 = vmlsq_lane_f32(v114, v77, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v78, 2), vaddq_f32(v78, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v78.f32, 1))), 0);
    float v112 = atan2f(v110.f32[0], v110.f32[2]);
    uint64_t v82 = objc_msgSend_pointOfView(self, v79, v80, v81);
    objc_msgSend_worldRight(v82, v83, v84, v85);
    float32x4_t v87 = vmulq_f32(v86, v110);
    float32x4_t v88 = vmlsq_lane_f32(v110, v86, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))), 0);
    float32x4_t v89 = v86;
    float32x4_t v90 = vmulq_f32(v88, v88);
    float32x4_t v91 = v88;
    v90.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v90, 2), vaddq_f32(v90, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v90.f32, 1))).u64[0];
    float32x4_t v92 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v90.f32, 0);
    v92.i32[3] = 0;
    float32x4_t v93 = vrsqrteq_f32(v92);
    float32x4_t v94 = vmulq_f32(v93, vrsqrtsq_f32(v92, vmulq_f32(v93, v93)));
    float32x4_t v95 = vmulq_f32(v94, vrsqrtsq_f32(v92, vmulq_f32(v94, v94)));
    int32x4_t v96 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v90.f32[0] != 0.0)), 0x1FuLL));
    v96.i32[3] = 0;
    float32x4_t v111 = v89;
    float32x4_t v97 = vmulq_f32(v114, v89);
    float32x4_t v98 = vmlsq_lane_f32(v114, v89, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v97, 2), vaddq_f32(v97, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v97.f32, 1))), 0);
    float32x4_t v99 = vmulq_f32(v98, v98);
    v99.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 2), vaddq_f32(v99, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 1))).u64[0];
    float32x4_t v100 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 0);
    float32x4_t v101 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v96), (int8x16_t)vmulq_f32(v95, v91), (int8x16_t)v91);
    v100.i32[3] = 0;
    float32x4_t v102 = vrsqrteq_f32(v100);
    float32x4_t v103 = vmulq_f32(v102, vrsqrtsq_f32(v100, vmulq_f32(v102, v102)));
    int32x4_t v104 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v99.f32[0] != 0.0)), 0x1FuLL));
    v104.i32[3] = 0;
    float32x4_t v105 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v104), (int8x16_t)vmulq_f32(v98, vmulq_f32(v103, vrsqrtsq_f32(v100, vmulq_f32(v103, v103)))), (int8x16_t)v98);
    int8x16_t v106 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v105, (int32x4_t)v105), (int8x16_t)v105, 0xCuLL), vnegq_f32(v101)), v105, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v101, (int32x4_t)v101), (int8x16_t)v101, 0xCuLL));
    float32x4_t v115 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v106, (int32x4_t)v106), v106, 0xCuLL);
    float32x4_t v107 = vmulq_f32(v105, v101);
    float v108 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 2), vaddq_f32(v107, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v107.f32, 1))).f32[0], -1.0), 1.0));
    float32x4_t v57 = vmulq_f32(v111, v115);
    BOOL v109 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0] <= 0.0;
    v57.f32[0] = v112;
    if (v109) {
      float v108 = -v108;
    }
    v57.f32[1] = v108;
  }
  *(void *)&self->_anon_10[8] = v57.i64[0];
}

- (void)_directionForScreenPoint:(uint64_t)a3 viewport:(uint64_t)a4
{
  float64_t v79 = a7;
  uint64_t v8 = objc_msgSend_pointOfView(a1, a2, a3, a4);
  double result = objc_msgSend_nodeRef(v8, v9, v10, v11);
  if (result)
  {
    float32x4_t v20 = result;
    double result = (void *)sub_1B63F4F54(result, v13, v14, v15, v16, v17, v18, v19);
    if (result)
    {
      uint64_t v28 = (uint64_t)result;
      uint64_t v29 = sub_1B63F4F54(v20, v21, v22, v23, v24, v25, v26, v27);
      sub_1B64B0C28(v29, v30, v31, v32, v33, v34, v35, v36);
      memset(v82, 0, sizeof(v82));
      if (sub_1B63E0460((uint64_t)v20, (uint64_t)v82, v37, v38, v39, v40, v41, v42))
      {
        if ((v82[0] & 2) != 0) {
          sub_1B63E0578((uint64_t)v82, (uint64_t)v20, 0, v28, v46, v47, v48, v49, *(uint64_t *)&v79);
        }
        v50.f64[0] = v79;
        v50.f64[1] = a8;
        float32x4_t v81 = vcvt_hight_f32_f64(0, v50);
        simd_float4x4 v83 = *(simd_float4x4 *)sub_1B649CD50((unsigned __int8 *)v82, (uint64_t)&v81, v44, v45, v46, v47, v48, v49);
        __invert_f4(v83);
        __asm { FMOV            V1.4S, #-1.0 }
        uint64_t v63 = sub_1B63F4F54(v20, v56, v57, v58, v59, v60, v61, v62);
        return (void *)sub_1B64B0CB4(v63, v64, v65, v66, v67, v68, v69, v70);
      }
      else
      {
        uint64_t v71 = sub_1B63F4F54(v20, v43, v44, v45, v46, v47, v48, v49);
        return (void *)sub_1B64B0CB4(v71, v72, v73, v74, v75, v76, v77, v78);
      }
    }
  }
  return result;
}

- (void)_updateInertiaAtTime:(double)a3
{
  if (self->_inertia.inertiaRunning)
  {
    float v6 = (a3 - self->_inertia.lastSimulationTime) * 60.0;
    int v7 = (int)fmaxf(v6, 1.0);
    self->_inertia.lastSimulationTime = a3;
    if (v7 >= 1)
    {
      float friction = self->_inertia.friction;
      do
      {
        if (friction != 0.0)
        {
          if (v6 <= 1.0) {
            float v9 = v6;
          }
          else {
            float v9 = 1.0;
          }
          *(float32x2_t *)self->_anon_e0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)self->_anon_e0), 1.0 - (float)(fmaxf(v9, 0.0) * friction)));
        }
        float v6 = v6 + -1.0;
        --v7;
      }
      while (v7);
    }
    if ((objc_msgSend_drivenByDefaultNavigationCameraController(self, a2, v3, v4) & 1) == 0)
    {
      objc_msgSend_begin(VFXTransaction, v10, v11, v12);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v13, v14, v15, 0.0);
    }
    double v16 = *(double *)self->_anon_e0;
    float32x4_t v17 = (float32x4_t)vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v16), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL));
    *(float32x2_t *)v17.f32 = vcvt_f32_f64((float64x2_t)v17);
    v17.i32[2] = 0;
    float32x4_t v18 = vaddq_f32(*(float32x4_t *)&self->_anon_90[32], vaddq_f32(*(float32x4_t *)&self->_anon_90[16], v17));
    int32x4_t v19 = (int32x4_t)vmulq_f32(v18, v18);
    v19.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2), vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v19.i8, 1))).u32[0];
    float32x2_t v20 = vrsqrte_f32((float32x2_t)v19.u32[0]);
    float32x2_t v21 = vmul_f32(v20, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v20, v20)));
    double v22 = COERCE_DOUBLE(vmul_f32(v21, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v21, v21))));
    *(float32x4_t *)&self->_anon_90[32] = vmulq_n_f32(v18, *(float *)&v22);
    switch((unint64_t)self[1].super.isa)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        float32x2_t v23 = vmul_n_f32(*(float32x2_t *)&v16, self->_inertia.rotationSensitivity);
        double v24 = (float)-v23.f32[0] / 180.0 * 3.14159265;
        *(float *)&double v24 = v24;
        double v25 = v23.f32[1] / 180.0 * 3.14159265;
        *(float *)&double v25 = v25;
        objc_msgSend__rotateByX_Y_(self, v10, v11, v12, v24, v25);
        break;
      case 3uLL:
      case 4uLL:
        objc_msgSend__updateArcballOrientation(self, v10, v11, v12);
        break;
      case 5uLL:
        double v26 = COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)&v16, self->_inertia.translationSensitivity));
        *(float *)&double v16 = -*(float *)&v26;
        *(float *)&double v26 = -*((float *)&v26 + 1);
        objc_msgSend__translateInCameraSpaceByX_Y_Z_(self, v10, v11, v12, v16, v26, 0.0);
        break;
      case 6uLL:
        double v27 = COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)&v16, self->_inertia.translationSensitivity));
        LODWORD(v22) = HIDWORD(v27);
        objc_msgSend__translateInCameraSpaceByX_Y_Z_(self, v10, v11, v12, v27, 0.0, v22);
        break;
      default:
        break;
    }
    if ((objc_msgSend_drivenByDefaultNavigationCameraController(self, v10, v11, v12) & 1) == 0) {
      objc_msgSend_commit(VFXTransaction, v28, v29, v30);
    }
    if (vaddv_f32(vmul_f32(*(float32x2_t *)self->_anon_e0, *(float32x2_t *)self->_anon_e0)) < 0.1)
    {
      objc_msgSend__setInertiaRunning_(self, v28, 0, v30);
    }
  }
}

- (__n128)_targetRelativeToPointOfViewParent
{
  uint64_t v5 = objc_msgSend_pointOfView(a1, a2, a3, a4);
  if (objc_msgSend_parentNode(v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_pointOfView(a1, v9, v10, v11);
    double v16 = objc_msgSend_parentNode(v12, v13, v14, v15);
    __n128 v19 = a1[16];
    objc_msgSend_convertPosition_fromNode_(v16, v17, 0, v18, v19.n128_f64[0]);
  }
  else
  {
    return a1[16];
  }
  return result;
}

- (void)_translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  uint64_t v7 = objc_msgSend_pointOfView(self, a2, v5, v6);

  MEMORY[0x1F4181798](v7, sel_localTranslateBy_, v8, v9);
}

- (void)_rotateByX:(float)a3 Y:(float)a4
{
  uint32x2_t v5 = (uint32x2_t)vceqz_f32(*(float32x2_t *)&a3);
  if ((vpmin_u32(v5, v5).u32[0] & 0x80000000) == 0)
  {
    int8x8_t v6 = (int8x8_t)vadd_f32(*(float32x2_t *)&a3, *(float32x2_t *)self->_anon_10);
    *(float *)&unsigned int v7 = *(float *)v6.i32 + -6.28318531;
    int8x8_t v8 = vbsl_s8((int8x8_t)vcgtd_f64(*(float *)v6.i32, 6.28318531), (int8x8_t)__PAIR64__(v6.u32[1], v7), v6);
    *(float *)&unsigned int v9 = *(float *)v8.i32 + 6.28318531;
    int8x8_t v10 = vbsl_s8((int8x8_t)vcgtd_f64(-6.28318531, *(float *)v8.i32), (int8x8_t)__PAIR64__(v8.u32[1], v9), v8);
    double v11 = *(float *)&v10.i32[1];
    if (*(float *)&v10.i32[1] > 6.28318531)
    {
      *(float *)&__int32 v12 = v11 + -6.28318531;
      v10.i32[1] = v12;
      double v11 = *(float *)&v12;
    }
    if (v11 < -6.28318531)
    {
      *(float *)&__int32 v13 = v11 + 6.28318531;
      v10.i32[1] = v13;
    }
    *(int8x8_t *)self->_anon_10 = v10;
    ((void (*)(VFXCameraController *, char *))MEMORY[0x1F4181798])(self, sel__updateRotation);
  }
}

- (double)_orientationForMode
{
  if (objc_msgSend_interactionMode(a1, a2, a3, a4))
  {
    if (objc_msgSend_interactionMode(a1, v5, v6, v7) == 1)
    {
      objc_msgSend_simdUp(a1, v8, v9, v10);
    }
    else
    {
      if (objc_msgSend_interactionMode(a1, v8, v9, v10) != 2)
      {
        float32x4_t v59 = (float32x4_t)xmmword_1B6E4F370;
        goto LABEL_9;
      }
      uint64_t v33 = objc_msgSend_pointOfView(a1, v30, v31, v32);
      objc_msgSend_worldUp(v33, v34, v35, v36);
    }
    float32x4_t v37 = vmulq_f32(v11, v11);
    v37.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).u64[0];
    float32x4_t v38 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 0);
    v38.i32[3] = 0;
    float32x4_t v39 = vrsqrteq_f32(v38);
    float32x4_t v40 = vmulq_f32(v39, vrsqrtsq_f32(v38, vmulq_f32(v39, v39)));
    int32x4_t v41 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v37.f32[0] != 0.0)), 0x1FuLL));
    v41.i32[3] = 0;
    float32x4_t v73 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v41), (int8x16_t)vmulq_f32(v11, vmulq_f32(v40, vrsqrtsq_f32(v38, vmulq_f32(v40, v40)))), (int8x16_t)v11);
    float v24 = 0.5;
    __float2 v42 = __sincosf_stret(a1[4] * 0.5);
    float cosval = v42.__cosval;
    float32x4_t v72 = vmulq_n_f32(v73, v42.__sinval);
    uint64_t v46 = objc_msgSend_pointOfView(a1, v43, v44, v45);
    objc_msgSend_worldRight(v46, v47, v48, v49);
  }
  else
  {
    __int32 v12 = objc_msgSend_pointOfView(a1, v5, v6, v7);
    objc_msgSend_simdUp(a1, v13, v14, v15);
    objc_msgSend_convertVector_fromNode_(v12, v16, 0, v17);
    float32x4_t v19 = vmulq_f32(v18, v18);
    v19.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).u64[0];
    float32x4_t v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 0);
    v20.i32[3] = 0;
    float32x4_t v21 = vrsqrteq_f32(v20);
    float32x4_t v22 = vmulq_f32(v21, vrsqrtsq_f32(v20, vmulq_f32(v21, v21)));
    int32x4_t v23 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v19.f32[0] != 0.0)), 0x1FuLL));
    v23.i32[3] = 0;
    float32x4_t v71 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v23), (int8x16_t)vmulq_f32(v18, vmulq_f32(v22, vrsqrtsq_f32(v20, vmulq_f32(v22, v22)))), (int8x16_t)v18);
    float v24 = 0.5;
    __float2 v25 = __sincosf_stret(a1[4] * 0.5);
    float cosval = v25.__cosval;
    float32x4_t v72 = vmulq_n_f32(v71, v25.__sinval);
    objc_msgSend_localRight(VFXNode, v26, v27, v28);
  }
  float32x4_t v50 = vmulq_f32(v29, v29);
  v50.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2), vaddq_f32(v50, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 1))).u64[0];
  float32x4_t v51 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 0);
  v51.i32[3] = 0;
  float32x4_t v52 = vrsqrteq_f32(v51);
  float32x4_t v53 = vmulq_f32(v52, vrsqrtsq_f32(v51, vmulq_f32(v52, v52)));
  int32x4_t v54 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v50.f32[0] != 0.0)), 0x1FuLL));
  v54.i32[3] = 0;
  float32x4_t v70 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v54), (int8x16_t)vmulq_f32(v29, vmulq_f32(v53, vrsqrtsq_f32(v51, vmulq_f32(v53, v53)))), (int8x16_t)v29);
  __float2 v55 = __sincosf_stret(a1[5] * v24);
  float32x4_t v56 = vmulq_n_f32(v70, v55.__sinval);
  int8x16_t v57 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v56, (int32x4_t)v56), (int8x16_t)v56, 0xCuLL), vnegq_f32(v72)), v56, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL));
  float32x4_t v59 = vaddq_f32(vmlaq_n_f32(vmulq_n_f32(v72, v55.__cosval), v56, cosval), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v57, (int32x4_t)v57), v57, 0xCuLL));
  float32x4_t v58 = vmulq_f32(v72, v56);
  v59.f32[3] = -(float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1))).f32[0]- (float)(cosval * v55.__cosval));
LABEL_9:
  int8x16_t v60 = (int8x16_t)vmulq_f32(v59, v59);
  *(float32x2_t *)v60.i8 = vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v60, v60, 8uLL));
  float32x4_t v61 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v60.i8, 1)), 0);
  float32x4_t v62 = vrsqrteq_f32(v61);
  float32x4_t v63 = vmulq_f32(v62, vrsqrtsq_f32(v61, vmulq_f32(v62, v62)));
  __asm { FMOV            V3.4S, #1.0 }
  *(void *)&double result = vmulq_f32(v59, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v61), _Q3, (int8x16_t)vmulq_f32(v63, vrsqrtsq_f32(v61, vmulq_f32(v63, v63))))).u64[0];
  return result;
}

- (void)_capOrientationAnglesToMaximum
{
  Class isa = self[1].super.isa;
  if ((unint64_t)isa > 1) {
    return;
  }
  float32x2_t v3 = *(float32x2_t *)self->_anon_10;
  float32x2_t v4 = vadd_f32(*(float32x2_t *)&self->_anon_10[8], v3);
  v5.i32[0] = v4.i32[0];
  v5.i32[1] = vneg_f32(v4).i32[1];
  float32x2_t v6 = (float32x2_t)vbsl_s8((int8x8_t)vceqd_s64((uint64_t)isa, 0), (int8x8_t)v4, v5);
  float32x2_t v7 = *(float32x2_t *)&self->_maximumAngles[7];
  if (v7.f32[0] != 0.0 || COERCE_FLOAT(*(void *)&self->_minimumAngles[7]) != 0.0)
  {
    if ((vcgt_f32(v6, v7).u8[0] & 1) != 0 && v3.f32[0] > 0.0)
    {
      float v8 = fmaxf(vsub_f32(v3, vsub_f32(v6, v7)).f32[0], 0.0);
LABEL_11:
      v3.f32[0] = v8;
      *(float32x2_t *)self->_anon_10 = v3;
      goto LABEL_12;
    }
    float32x2_t v9 = *(float32x2_t *)&self->_minimumAngles[7];
    if ((vcgt_f32(v9, v6).u8[0] & 1) != 0 && v3.f32[0] < 0.0)
    {
      float v8 = vsub_f32(v3, vsub_f32(v6, v9)).f32[0];
      if (v8 > 0.0) {
        float v8 = 0.0;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (v7.f32[1] != 0.0 || *(float *)&self->_maximumAngles[3] != 0.0)
  {
    if (isa)
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] < 0.0)
      {
        float v10 = (float)(v6.f32[1] - v7.f32[1]) + v3.f32[1];
        goto LABEL_28;
      }
      float v11 = *(float *)&self->_maximumAngles[3];
      if (v6.f32[1] < v11 && v3.f32[1] > 0.0)
      {
        float v12 = (float)(v6.f32[1] - v11) + v3.f32[1];
LABEL_24:
        float v10 = fmaxf(v12, 0.0);
LABEL_30:
        v3.f32[1] = v10;
        *(float32x2_t *)self->_anon_10 = v3;
      }
    }
    else
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] > 0.0)
      {
        float v12 = v3.f32[1] - (float)(v6.f32[1] - v7.f32[1]);
        goto LABEL_24;
      }
      float v13 = *(float *)&self->_maximumAngles[3];
      if (v6.f32[1] < v13 && v3.f32[1] < 0.0)
      {
        float v10 = v3.f32[1] - (float)(v6.f32[1] - v13);
LABEL_28:
        if (v10 > 0.0) {
          float v10 = 0.0;
        }
        goto LABEL_30;
      }
    }
  }
}

- (void)_updateRotation
{
  if (self[1].super.isa <= (Class)2)
  {
    objc_msgSend__capOrientationAnglesToMaximum(self, a2, v2, v3);
    if (objc_msgSend_useOrbitInteractionMode(self, v5, v6, v7))
    {
      long long v46 = *(_OWORD *)&self->_anon_10[64];
      long long v44 = *(_OWORD *)&self->_anon_10[32];
      long long v45 = *(_OWORD *)&self->_anon_10[48];
      long long v43 = *(_OWORD *)&self->_anon_10[16];
      float v11 = objc_msgSend_pointOfView(self, v8, v9, v10);
      objc_msgSend_setWorldTransform_(v11, v12, v13, v14, *(double *)&v43, *(double *)&v44, *(double *)&v45, *(double *)&v46);
      float32x4_t v18 = objc_msgSend_pointOfView(self, v15, v16, v17);
      objc_msgSend__orientationForMode(self, v19, v20, v21);
      double v47 = v22;
      objc_msgSend_simdTarget(self, v23, v24, v25);
      objc_msgSend_rotateBy_aroundTarget_(v18, v26, v27, v28, v47, v29);
    }
    else
    {
      long long v48 = *(_OWORD *)&self->_anon_10[80];
      uint64_t v30 = objc_msgSend_pointOfView(self, v8, v9, v10);
      objc_msgSend_setWorldOrientation_(v30, v31, v32, v33, *(double *)&v48);
      uint64_t v37 = objc_msgSend_pointOfView(self, v34, v35, v36);
      objc_msgSend__orientationForMode(self, v38, v39, v40);
      MEMORY[0x1F4181798](v37, sel_localRotateBy_, v41, v42);
    }
  }
}

- (double)_convertRotationFromWorldToPointOfView:(uint64_t)a3
{
  uint64_t v6 = objc_msgSend_pointOfView(a1, a2, a3, a4);
  objc_msgSend_worldOrientation(v6, v7, v8, v9);
  float32x4_t v34 = v10;
  uint64_t v14 = objc_msgSend_pointOfView(a1, v11, v12, v13);
  objc_msgSend_worldOrientation(v14, v15, v16, v17);
  float32x4_t v19 = vmulq_f32(v18, (float32x4_t)xmmword_1B6E4F550);
  _S1 = v19.i32[3];
  _Q6 = (int32x4_t)a5;
  int8x16_t v22 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL), vnegq_f32(a5)), v19, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)a5, 0xCuLL));
  float32x4_t v23 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(a5, v19, 3), v19, a5, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v22, (int32x4_t)v22), v22, 0xCuLL));
  __asm { FMLA            S3, S1, V6.S[3] }
  _Q6 = (int32x4_t)v34;
  int8x16_t v30 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), (int8x16_t)v23, 0xCuLL), vnegq_f32(v34)), v23, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v34, 0xCuLL));
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v34, _S3), v23, v34, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), v30, 0xCuLL)).u64[0];
  __asm { FMLA            S1, S3, V6.S[3] }
  return result;
}

- (void)_updateArcballOrientation
{
  if (self[1].super.isa >= (Class)2)
  {
    float32x4_t v4 = *(float32x4_t *)&self->_anon_90[16];
    float32x4_t v3 = *(float32x4_t *)&self->_anon_90[32];
    uint32x4_t v5 = (uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32(v4, v3));
    v5.i32[3] = v5.i32[2];
    if ((vminvq_u32(v5) & 0x80000000) == 0)
    {
      float32x4_t v6 = vmulq_f32(v4, v3);
      LODWORD(v7) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).u32[0];
      if (fabsf(v7) < 1.0)
      {
        float32x4_t v39 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL), vnegq_f32(v4)), v3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL));
        float32x4_t v40 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v39, (int32x4_t)v39), (int8x16_t)v39, 0xCuLL);
        float v8 = acosf(v7);
        float32x4_t v9 = vmulq_f32(v39, v39);
        v9.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), v9)).u64[0];
        float32x4_t v10 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 0);
        v10.i32[3] = 0;
        float32x4_t v11 = vrsqrteq_f32(v10);
        float32x4_t v12 = vmulq_f32(v11, vrsqrtsq_f32(v10, vmulq_f32(v11, v11)));
        int32x4_t v13 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v9.f32[0] != 0.0)), 0x1FuLL));
        v13.i32[3] = 0;
        float32x4_t v41 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v13), (int8x16_t)vmulq_f32(v40, vmulq_f32(v12, vrsqrtsq_f32(v10, vmulq_f32(v12, v12)))), (int8x16_t)v40);
        LODWORD(v14) = *(void *)&__sincosf_stret((float)(v8 * -2.0) * 0.5);
        objc_msgSend__convertRotationFromWorldToPointOfView_(self, v15, v16, v17, *(double *)vmulq_n_f32(v41, v14).i64);
        float32x4_t v42 = v18;
        int8x16_t v22 = objc_msgSend_pointOfView(self, v19, v20, v21);
        int8x16_t v23 = (int8x16_t)vmulq_f32(v42, v42);
        *(float32x2_t *)v23.i8 = vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
        float32x4_t v24 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.i8, 1)), 0);
        float32x4_t v25 = vrsqrteq_f32(v24);
        float32x4_t v26 = vmulq_f32(v25, vrsqrtsq_f32(v24, vmulq_f32(v25, v25)));
        __asm { FMOV            V2.4S, #1.0 }
        v42.i64[0] = vmulq_f32(v42, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v24), _Q2, (int8x16_t)vmulq_f32(v26, vrsqrtsq_f32(v24, vmulq_f32(v26, v26))))).u64[0];
        objc_msgSend_simdTarget(self, v32, v33, v34);
        objc_msgSend_rotateBy_aroundTarget_(v22, v35, v36, v37, *(double *)v42.i64, v38);
        float32x4_t v3 = *(float32x4_t *)&self->_anon_90[32];
      }
      *(float32x4_t *)&self->_anon_90[16] = v3;
    }
  }
}

- (BOOL)_isLocationValid:(CGPoint)a3 inViewport:(CGSize)a4
{
  BOOL v4 = a3.x <= a4.width;
  if (a3.y < 0.0) {
    BOOL v4 = 0;
  }
  if (a3.y > a4.height) {
    BOOL v4 = 0;
  }
  return a3.x >= 0.0 && v4;
}

- (double)_mapToSphere:(float64_t)a3 inViewport:(double)a4
{
  a2.f64[1] = a3;
  if (*(void *)&a1[40] == 3) {
    a2 = vaddq_f64(a2, vcvtq_f64_f32(a1[18]));
  }
  if (a4 >= a5) {
    double v5 = a4;
  }
  else {
    double v5 = a5;
  }
  *(float *)&double v5 = v5;
  float32x4_t v6 = (float32x4_t)vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(*(float *)&v5 * 0.5)), 0));
  *(float32x2_t *)v6.f32 = vdiv_f32(vcvt_f32_f64((float64x2_t)v6), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v5, 0));
  float v7 = vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v6, *(float32x2_t *)&v6).i32[1]), v6.f32[0], v6.f32[0]);
  BOOL v8 = v7 < 0.125;
  float v9 = 0.125 / sqrtf(v7);
  float v10 = sqrtf(0.25 - v7);
  if (!v8) {
    float v10 = v9;
  }
  v6.f32[2] = v10;
  int32x4_t v11 = (int32x4_t)vmulq_f32(v6, v6);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v6.i64[0] = vmulq_n_f32(v6, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]).u64[0];
  return *(double *)v6.i64;
}

- (void)_endDraggingWithVelocity:(CGPoint)a3
{
  if (self->_inertia.inertiaEnabled)
  {
    CGFloat y = a3.y;
    float32x2_t v5 = vcvt_f32_f64((float64x2_t)a3);
    uint32x2_t v6 = (uint32x2_t)vcge_f32(vabs_f32(v5), (float32x2_t)vdup_n_s32(0x3DCCCCCDu));
    if ((vpmax_u32(v6, v6).u32[0] & 0x80000000) != 0)
    {
      float32x2_t v8 = vdiv_f32(v5, (float32x2_t)vdup_n_s32(0x42700000u));
      *(float32x2_t *)self->_anon_e0 = v8;
      if (self->_inertia.friction == 0.0)
      {
        int8x8_t v9 = (int8x8_t)vdup_lane_s32(vcgt_f32(v8, 0), 0);
        float v10 = -20.0;
        if (v8.f32[0] >= -20.0) {
          float v11 = v8.f32[0];
        }
        else {
          float v11 = -20.0;
        }
        v8.i32[0] = fminf(v8.f32[0], 20.0);
        int8x8_t v12 = vbsl_s8(v9, (int8x8_t)v8, (int8x8_t)__PAIR64__(v8.u32[1], LODWORD(v11)));
        float v13 = fminf(*(float *)&v12.i32[1], 20.0);
        if (*(float *)&v12.i32[1] >= -20.0) {
          float v10 = *(float *)&v12.i32[1];
        }
        if (*(float *)&v12.i32[1] <= 0.0) {
          float v14 = v10;
        }
        else {
          float v14 = v13;
        }
        *(float *)&v12.i32[1] = v14;
        *(int8x8_t *)self->_anon_e0 = v12;
      }
      else
      {
        float v14 = v8.f32[1];
      }
      *(float *)&self->_anon_e0[4] = -v14;
      objc_msgSend__setInertiaRunning_(self, a2, 1, v3);
      self->_inertia.lastSimulationTime = CACurrentMediaTime();
    }
  }
}

- (void)_setInertiaRunning:(BOOL)a3
{
  if (self->_inertia.inertiaRunning != a3)
  {
    if (a3)
    {
      objc_msgSend_delegate(self, a2, a3, v3);
      if (objc_opt_respondsToSelector())
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B645DA10;
        block[3] = &unk_1E61422C0;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      if ((objc_msgSend_drivenByDefaultNavigationCameraController(self, v6, v7, v8) & 1) == 0)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = sub_1B645DA4C;
        v15[3] = &unk_1E61422E8;
        v15[4] = self;
        *(void *)&self->_anon_e0[8] = objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(MEMORY[0x1E4F1CB00], v9, 1, (uint64_t)v15, 0.0166666667);
      }
      self->_inertia.inertiaRunning = a3;
    }
    else
    {
      if ((objc_msgSend_drivenByDefaultNavigationCameraController(self, a2, a3, v3) & 1) == 0)
      {
        float v13 = *(void **)&self->_anon_e0[8];
        if (v13) {
          objc_msgSend_invalidate(v13, v10, v11, v12);
        }
        *(void *)&self->_anon_e0[8] = 0;
      }
      self->_inertia.inertiaRunning = a3;
      objc_msgSend_delegate(self, v10, v11, v12);
      if (objc_opt_respondsToSelector())
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = sub_1B645DA84;
        v14[3] = &unk_1E61422C0;
        v14[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v14);
      }
    }
  }
}

- (VFXCameraControllerDelegate)delegate
{
  return (VFXCameraControllerDelegate *)self->_pointOfView;
}

- (void)setDelegate:(id)a3
{
  self->_pointOfView = (VFXNode *)a3;
}

- (VFXNode)pointOfView
{
  return (VFXNode *)self->_interactionMode;
}

- (int64_t)interactionMode
{
  return (int64_t)self[1].super.isa;
}

- (BOOL)automaticTarget
{
  return BYTE2(self->_delegate);
}

- (void)setAutomaticTarget:(BOOL)a3
{
  BYTE2(self->_delegate) = a3;
}

- (double)_orthographicViewSpaceTranslationForZoomAtScreenPoint:(uint64_t)a3 scaleDelta:(uint64_t)a4 viewport:(double)a5
{
  int8x8_t v9 = objc_msgSend_pointOfView(a1, a2, a3, a4);
  float v13 = objc_msgSend_nodeRef(v9, v10, v11, v12);
  double v21 = 0.0;
  if (v13)
  {
    int8x16_t v22 = v13;
    uint64_t v23 = sub_1B63F4F54(v13, v14, v15, v16, v17, v18, v19, v20);
    if (v23)
    {
      uint64_t v31 = v23;
      uint64_t v32 = sub_1B63F4F54(v22, v24, v25, v26, v27, v28, v29, v30);
      sub_1B64B0C28(v32, v33, v34, v35, v36, v37, v38, v39);
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v114 = 0u;
      memset(v113, 0, sizeof(v113));
      if (sub_1B63E0460((uint64_t)v22, (uint64_t)v113, v40, v41, v42, v43, v44, v45))
      {
        if ((v113[0] & 4) != 0)
        {
          uint64_t v89 = sub_1B63F4F54(v22, v46, v47, v48, v49, v50, v51, v52);
          sub_1B64B0CB4(v89, v90, v91, v92, v93, v94, v95, v96);
          sub_1B63F2F54(16, @"Error: Point of view has custom projection.", v97, v98, v99, v100, v101, v102, v104);
        }
        else
        {
          if ((v113[0] & 2) != 0) {
            sub_1B63E0578((uint64_t)v113, (uint64_t)v22, 0, v31, v49, v50, v51, v52, v104);
          }
          uint64_t v53 = sub_1B63F4F54(v22, v46, v47, v48, v49, v50, v51, v52);
          sub_1B64B0CB4(v53, v54, v55, v56, v57, v58, v59, v60);
          v61.f64[0] = a7;
          v61.f64[1] = a8;
          float32x4_t v112 = vcvt_hight_f32_f64(0, v61);
          simd_float4x4 v123 = *(simd_float4x4 *)sub_1B649CD50((unsigned __int8 *)v113, (uint64_t)&v112, v62, v63, v64, v65, v66, v67);
          simd_float4x4 v124 = __invert_f4(v123);
          float32x4_t v105 = (float32x4_t)v124.columns[0];
          float32x4_t v106 = (float32x4_t)v124.columns[1];
          float32x4_t v107 = (float32x4_t)v124.columns[2];
          float32x2_t v108 = *(float32x2_t *)v124.columns[3].f32;
          *((float *)&v114 + 2) = *((float *)&v114 + 2) + a6;
          simd_float4x4 v125 = *(simd_float4x4 *)sub_1B649CD50((unsigned __int8 *)v113, (uint64_t)&v112, v68, v69, v70, v71, v72, v73);
          simd_float4x4 v126 = __invert_f4(v125);
          float v74 = (float)(*(float *)&a5 + *(float *)&a5) / a7 + -1.0;
          float v75 = (float)(*((float *)&a5 + 1) + *((float *)&a5 + 1)) / a8 + -1.0;
          __asm { FMOV            V7.4S, #-1.0 }
          return COERCE_DOUBLE(vsub_f32(vadd_f32(v108, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v105, v74), v106, v75), _Q7, v107)), vadd_f32(*(float32x2_t *)v126.columns[3].f32, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v126.columns[0], v74), (float32x4_t)v126.columns[1], v75), _Q7, (float32x4_t)v126.columns[2]))));
        }
      }
      else
      {
        uint64_t v81 = sub_1B63F4F54(v22, v46, v47, v48, v49, v50, v51, v52);
        sub_1B64B0CB4(v81, v82, v83, v84, v85, v86, v87, v88);
      }
    }
  }
  return v21;
}

- (void)updateInertiaAtTime:(double)a3
{
}

- (BOOL)drivenByDefaultNavigationCameraController
{
  return BYTE1(self->_delegate);
}

- (void)setDrivenByDefaultNavigationCameraController:(BOOL)a3
{
  BYTE1(self->_delegate) = a3;
}

@end