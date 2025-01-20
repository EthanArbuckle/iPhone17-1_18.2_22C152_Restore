@interface VKCamera
- ($7C969B71DD53AF2675E9F7E8E727D903)frustum;
- (CGPoint)screenPointFromGroundPoint:(const void *)a3;
- (CameraFrame<geo::Radians,)cameraFrame:(VKCamera *)self;
- (Matrix<double,)forwardVector;
- (Matrix<double,)groundPlaneIntersectionPoint;
- (Matrix<double,)groundPoint;
- (Matrix<double,)rightVector;
- (Matrix<double,)upVector;
- (Mercator3<double>)mercatorPosition;
- (Unit<geo::RadianUnitDescription,)horizontalFieldOfView;
- (Unit<geo::RadianUnitDescription,)verticalFieldOfView;
- (VKCamera)initWithRunLoopController:(RunLoopController *)a3;
- (VKCameraRegionRestriction)regionRestriction;
- (VKCameraState)cameraState;
- (VKFootprint)footprint;
- (VKViewVolume)viewVolume;
- (View<double>)view:(SEL)a3;
- (const)orientation;
- (const)position;
- (const)scaledProjectionMatrix;
- (const)scaledViewMatrix;
- (const)scaledViewProjectionMatrix;
- (const)transform;
- (const)unscaledProjectionMatrix;
- (const)unscaledViewMatrix;
- (double)aspectRatio;
- (double)canonicalPitch;
- (double)depthForViewWidth:(double)a3;
- (double)displayZoomLevel;
- (double)distanceToGroundAndFarClipPlaneIntersection;
- (double)farClipDistance;
- (double)fractionOfScreenAboveFarClipPlaneAtCanonicalPitch;
- (double)horizontalOffset;
- (double)maxHeight;
- (double)maxHeightNoPitch;
- (double)maxPitch;
- (double)minHeight;
- (double)ndcZNear;
- (double)nearClipDistance;
- (double)pitch;
- (double)screenHeightOfGroundAndFarClipPlaneIntersection;
- (double)tanHalfHorizFOV;
- (double)tanHalfVerticalFOV;
- (double)terrainHeight;
- (double)widthOfViewAtDepth:(double)a3;
- (double)yaw;
- (float)zoomAtCentrePoint;
- (float)zoomAtPoint:(CGPoint)a3;
- (id).cxx_construct;
- (id)annotationCoordinateTest;
- (id)annotationRectTest;
- (id)description;
- (id)descriptionDictionaryRepresentation;
- (optional<double>)maxDistanceToGroundRestriction;
- (optional<double>)minDistanceToGroundRestriction;
- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3;
- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3 atGroundLevel:(double)a4;
- (void)_setPosition:(const void *)a3;
- (void)adjustClipPlanes;
- (void)setAspectRatio:(double)a3;
- (void)setCameraState:(VKCameraState *)a3;
- (void)setCanonicalPitch:(double)a3;
- (void)setFarClipDistance:(double)a3;
- (void)setFractionOfScreenAboveFarClipPlaneAtCanonicalPitch:(double)a3;
- (void)setHorizontalOffset:(double)a3;
- (void)setMaxDistanceToGroundRestriction:(optional<double>)a3;
- (void)setMaxHeight:(double)a3;
- (void)setMaxHeightNoPitch:(double)a3;
- (void)setMaxPitch:(double)a3;
- (void)setMercatorPosition:(const void *)a3;
- (void)setMinDistanceToGroundRestriction:(optional<double>)a3;
- (void)setMinHeight:(double)a3;
- (void)setNdcZNear:(double)a3;
- (void)setNearClipDistance:(double)a3;
- (void)setNeedsUpdate;
- (void)setOrientation:(const void *)a3;
- (void)setPosition:(const void *)a3;
- (void)setRegionRestriction:(id)a3;
- (void)setTerrainHeight:(double)a3;
- (void)setTransform:(const void *)a3;
- (void)setVerticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (void)updateCamera:(shared_ptr<gdc:(function<BOOL)(std:()geo:(double>)& :()geo:(double>)& :Unit<geo::MeterUnitDescription Unit<geo::MeterUnitDescription :shared_ptr<gdc::Camera> :Camera>)a3 withAdjustment:;
- (void)updateIfNeeded;
@end

@implementation VKCamera

- (VKCameraState)cameraState
{
  long long v3 = *(_OWORD *)self[4].var0._rotation._imaginary._e;
  *(_OWORD *)&retstr->var0._translation._e[2] = *(_OWORD *)&self[4].var0._translation._e[1];
  *(_OWORD *)&retstr->var0._rotation._imaginary._e[1] = v3;
  *(double *)&long long v3 = self[4].var0._rotation._imaginary._e[2];
  *(_OWORD *)retstr->var0._translation._e = *(_OWORD *)&self[3].var3;
  double v4 = self[3].var0._rotation._imaginary._e[0];
  *(void *)&retstr->var0._rotation._scalar = v3;
  retstr->var1 = v4;
  retstr->var2._value = self[3].var0._rotation._imaginary._e[1];
  retstr->var3 = self[3].var0._translation._e[0];
  return self;
}

- (double)pitch
{
  float64x2_t v2 = vmulq_f64(vmulq_f64(*(float64x2_t *)self->_transform._rotation._imaginary._e, *(float64x2_t *)self->_transform._rotation._imaginary._e), (float64x2_t)xmmword_1A28FCC20);
  return acos(fmin(fmax(1.0 - v2.f64[1] + v2.f64[0], -1.0), 1.0));
}

- (VKFootprint)footprint
{
  [(VKCamera *)self updateIfNeeded];
  footprint = self->_footprint;
  return footprint;
}

- (double)tanHalfHorizFOV
{
  return self->_tanHalfHorizFOV;
}

- (Matrix<double,)forwardVector
{
  [(VKCamera *)self updateIfNeeded];
  double v3 = -self->_worldMatrix._e[8];
  double v4 = -self->_worldMatrix._e[9];
  double v5 = -self->_worldMatrix._e[10];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (double)yaw
{
  [(VKCamera *)self updateIfNeeded];
  [(VKCamera *)self upVector];
  double v4 = v3;
  long double v6 = -1.0;
  double v8 = -v5 / sqrt(-(v7 * v7 + -1.0));
  if (v8 > -1.0)
  {
    long double v6 = 1.0;
    if (v8 < 1.0) {
      long double v6 = v8;
    }
  }
  double v9 = acos(v6);
  if (v4 <= 0.0) {
    double v9 = -v9;
  }
  double v10 = v9 + 3.14159265;
  double v11 = v9 + -3.14159265;
  if (v10 <= 3.14159265) {
    double v11 = v10;
  }
  return -v11;
}

- (Matrix<double,)upVector
{
  [(VKCamera *)self updateIfNeeded];
  double v3 = self->_worldMatrix._e[4];
  double v4 = self->_worldMatrix._e[5];
  double v5 = self->_worldMatrix._e[6];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (void)updateIfNeeded
{
  if (self->_needsUpdate && !self->_updating)
  {
    self->_updating = 1;
    [(VKCamera *)self cameraState];
    double v3 = v140;
    double v4 = v141;
    double v5 = v142;
    double v6 = v143;
    double v7 = v144;
    long double v8 = tan(v145 * 0.5);
    self->_forward._e[0] = -(v142 * (v140 + v140) - v143 * (v141 * -2.0));
    self->_forward._e[1] = v4 * -2.0 * v5 + v6 * (v3 + v3);
    long double v9 = v5 * (v8 * v7 + v8 * v7);
    long double v10 = v4 * -2.0 * (v8 * v7);
    self->_forward._e[2] = -(v4 * -2.0 * v4 - ((v3 + v3) * v3 + -1.0));
    self->_right._e[0] = v8 * v7 + v10 * v4 - v9 * v5;
    self->_right._e[1] = -(v10 * v3 - v9 * v6);
    self->_right._e[2] = v10 * v6 + v9 * v3;
    long double v11 = v5 * -2.0 * v8;
    long double v12 = (v3 + v3) * v8;
    self->_up._e[0] = v12 * v4 + v11 * v6;
    self->_up._e[1] = v8 + v11 * v5 - v12 * v3;
    self->_up._e[2] = -(v11 * v4 - v12 * v6);
    [(VKCamera *)self adjustClipPlanes];
    {
      *(_OWORD *)&qword_1E958D800 = 0u;
      unk_1E958D820 = 0u;
      unk_1E958D840 = 0u;
      unk_1E958D830 = 0u;
      unk_1E958D810 = 0u;
      *(_OWORD *)&algn_1E958D7E0[16] = 0u;
      *(_OWORD *)algn_1E958D7E0 = 0u;
      qword_1E958D850 = 0x3FF0000000000000;
      -[VKCamera updateIfNeeded]::scaled = 0x4030000000000000;
      qword_1E958D800 = 0x4030000000000000;
      qword_1E958D828 = 0x4030000000000000;
    }
    double v13 = self->_horizontalOffset + self->_horizontalOffset;
    long long v131 = 0u;
    uint64_t v133 = 0;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v132 = 0u;
    uint64_t v128 = 0x3FF0000000000000;
    *(void *)&long long v131 = 0x3FF0000000000000;
    uint64_t v135 = 0;
    uint64_t v134 = 0x3FF0000000000000;
    uint64_t v139 = 0x3FF0000000000000;
    double v136 = v13;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    double v15 = self->_transform._rotation._imaginary._e[1];
    double v14 = self->_transform._rotation._imaginary._e[2];
    double scalar = self->_transform._rotation._scalar;
    double v17 = (v15 + v15) * v15;
    double v18 = (v14 + v14) * v14;
    double v19 = 1.0 - (v17 + v18);
    double v21 = self->_transform._translation._e[2];
    double v20 = self->_transform._rotation._imaginary._e[0];
    double v22 = (v20 + v20) * v15;
    double v23 = (v14 + v14) * scalar;
    double v24 = v22 - v23;
    double v25 = v14 * (v20 + v20);
    double v26 = scalar * (v15 + v15);
    double v27 = v26 + v25;
    double v28 = v23 + v22;
    double v29 = 1.0 - (v20 + v20) * v20;
    double v30 = v29 - v18;
    double v31 = (v15 + v15) * v14;
    double v32 = scalar * (v20 + v20);
    double v33 = v25 - v26;
    double v34 = v31 - v32;
    double v35 = v32 + v31;
    double v36 = v29 - v17;
    double v37 = self->_transform._translation._e[0];
    double v38 = self->_transform._translation._e[1];
    self->_worldMatrix._e[0] = v19;
    self->_worldMatrix._e[1] = v28;
    self->_worldMatrix._e[2] = v33;
    self->_worldMatrix._e[3] = 0.0;
    self->_worldMatrix._e[4] = v24;
    self->_worldMatrix._e[5] = v30;
    self->_worldMatrix._e[6] = v35;
    self->_worldMatrix._e[7] = 0.0;
    self->_worldMatrix._e[8] = v27;
    self->_worldMatrix._e[9] = v34;
    self->_worldMatrix._e[10] = v36;
    self->_worldMatrix._e[11] = 0.0;
    self->_worldMatrix._e[12] = v37;
    self->_worldMatrix._e[13] = v38;
    self->_worldMatrix._e[14] = v21;
    self->_worldMatrix._e[15] = 1.0;
    double v39 = -(v21 * v15 - v38 * v14) - (v21 * v15 - v38 * v14);
    double v40 = -(v37 * v14 - v21 * v20) - (v37 * v14 - v21 * v20);
    double v41 = -(v38 * v20 - v37 * v15) - (v38 * v20 - v37 * v15);
    double v42 = -(v37 + v39 * scalar + v40 * v14 - v41 * v15);
    double v43 = -(v38 + v41 * v20 + v40 * scalar - v39 * v14);
    double v44 = -(v21 + v41 * scalar + v39 * v15 - v40 * v20);
    double v45 = v15 * -2.0;
    double v46 = -(v15 * (v15 * -2.0));
    double v47 = 1.0 - (v46 - v14 * (v14 * -2.0));
    double v48 = v20 * -2.0;
    double v49 = -(v15 * (v20 * -2.0));
    double v50 = v14 * -2.0 * scalar;
    double v51 = v49 - v50;
    double v52 = -(v14 * (v20 * -2.0));
    double v53 = scalar * v45 - v14 * (v20 * -2.0);
    double v54 = v50 + v49;
    double v55 = v20 * -2.0 * v20 + 1.0;
    double v56 = v55 - -(v14 * (v14 * -2.0));
    double v57 = -(v14 * v45);
    self->_unscaledViewMatrix._e[0] = v47;
    self->_unscaledViewMatrix._e[1] = v54;
    self->_unscaledViewMatrix._e[2] = v52 - scalar * v45;
    self->_unscaledViewMatrix._e[3] = 0.0;
    double v58 = scalar * v48;
    self->_unscaledViewMatrix._e[4] = v51;
    self->_unscaledViewMatrix._e[5] = v56;
    self->_unscaledViewMatrix._e[6] = v58 + v57;
    self->_unscaledViewMatrix._e[7] = 0.0;
    self->_unscaledViewMatrix._e[8] = v53;
    self->_unscaledViewMatrix._e[9] = v57 - v58;
    self->_unscaledViewMatrix._e[10] = v55 - v46;
    self->_unscaledViewMatrix._e[11] = 0.0;
    self->_unscaledViewMatrix._e[12] = v42;
    self->_unscaledViewMatrix._e[13] = v43;
    self->_unscaledViewMatrix._e[14] = v44;
    self->_unscaledViewMatrix._e[15] = 1.0;
    gm::operator*<double,4,4,4>((double *)v122, (double *)&-[VKCamera updateIfNeeded]::scaled, self->_unscaledViewMatrix._e);
    long long v59 = *(_OWORD *)&v122[16];
    *(_OWORD *)self->_scaledViewMatrix._e = *(_OWORD *)v122;
    *(_OWORD *)&self->_scaledViewMatrix._e[2] = v59;
    long long v60 = v123;
    *(_OWORD *)&self->_scaledViewMatrix._e[4] = *(_OWORD *)&v122[32];
    *(_OWORD *)&self->_scaledViewMatrix._e[6] = v60;
    long long v61 = v125;
    *(_OWORD *)&self->_scaledViewMatrix._e[8] = v124;
    *(_OWORD *)&self->_scaledViewMatrix._e[10] = v61;
    long long v62 = v127;
    *(_OWORD *)&self->_scaledViewMatrix._e[12] = v126;
    *(_OWORD *)&self->_scaledViewMatrix._e[14] = v62;
    double aspectRatio = self->_aspectRatio;
    double near = self->_near;
    double far = self->_far;
    double ndcZNear = self->_ndcZNear;
    long double v67 = tan(self->_verticalFieldOfView._value * 0.5);
    long double v68 = v67 * (aspectRatio + aspectRatio);
    memset(&v122[8], 0, 32);
    *(double *)v122 = (near + near) / (v68 * near);
    *(double *)&v122[40] = 1.0 / v67;
    long long v123 = 0u;
    long long v124 = 0u;
    *(double *)&long long v125 = -(far - ndcZNear * near) / (far - near);
    long long v126 = 0uLL;
    *((void *)&v125 + 1) = 0xBFF0000000000000;
    *(double *)&long long v127 = far * near * (ndcZNear + -1.0) / (far - near);
    *((void *)&v127 + 1) = 0;
    long long v111 = 0u;
    long long v112 = 0u;
    double v110 = near * 32.0 / (v68 * (near * 16.0));
    double v113 = 1.0 / v67;
    double v69 = far * 16.0 - near * 16.0;
    long long v114 = 0u;
    long long v115 = 0u;
    double v116 = -(far * 16.0 - ndcZNear * (near * 16.0)) / v69;
    uint64_t v118 = 0;
    uint64_t v119 = 0;
    unint64_t v117 = 0xBFF0000000000000;
    double v120 = far * 16.0 * (near * 16.0) * (ndcZNear + -1.0) / v69;
    uint64_t v121 = 0;
    gm::operator*<double,4,4,4>((double *)&v102, (double *)&v128, &v110);
    long long v70 = v103;
    *(_OWORD *)self->_scaledProjectionMatrix._e = v102;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[2] = v70;
    long long v71 = v105;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[4] = v104;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[6] = v71;
    long long v72 = v107;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[8] = v106;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[10] = v72;
    long long v73 = v109;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[12] = v108;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[14] = v73;
    gm::operator*<double,4,4,4>((double *)&v102, (double *)&v128, (double *)v122);
    long long v74 = v103;
    *(_OWORD *)self->_unscaledProjectionMatrix._e = v102;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[2] = v74;
    long long v75 = v105;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[4] = v104;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[6] = v75;
    long long v76 = v107;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[8] = v106;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[10] = v76;
    long long v77 = v109;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[12] = v108;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[14] = v77;
    gm::operator*<double,4,4,4>((double *)&v102, self->_scaledProjectionMatrix._e, self->_scaledViewMatrix._e);
    long long v78 = v103;
    *(_OWORD *)self->_scaledViewProjectionMatrix._e = v102;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[2] = v78;
    long long v79 = v105;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[4] = v104;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[6] = v79;
    long long v80 = v107;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[8] = v106;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[10] = v80;
    long long v81 = v109;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[12] = v108;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[14] = v81;
    viewVolume = self->_viewVolume;
    long long v83 = *(_OWORD *)&self->_frustum.orthographic;
    long long v84 = *(_OWORD *)&self->_frustum.far;
    v101[1] = *(_OWORD *)&self->_frustum.height;
    v101[2] = v84;
    v101[0] = v83;
    [(VKViewVolume *)viewVolume updateWithFrustum:v101 matrix:&self->_worldMatrix];
    [(VKFootprint *)self->_footprint computeFromCamera:self];
    *(_WORD *)&self->_needsUpdate = 0;
    self->_tanHalfHorizFOV = self->_width * 0.5 / self->_near;
    [(VKCamera *)self farClipDistance];
    double v86 = v85;
    [(VKCamera *)self pitch];
    long double v88 = 1.57079633 - v87;
    __double2 v89 = __sincos_stret(1.57079633 - v87);
    double v90 = self->_transform._translation._e[2] / v89.__sinval;
    self->_screenHeightOfGroundAndFarClipPlaneIntersection = (self->_tanHalfVerticalFOV * v86 + (v86 - v90) * tan(v88))
                                                           / (self->_tanHalfVerticalFOV * v86
                                                            + self->_tanHalfVerticalFOV * v86);
    double v91 = 1.79769313e308;
    if (v89.__sinval >= 0.00001 && v89.__cosval >= 0.00001)
    {
      double v92 = (v86 - v90) / v89.__cosval + v90 * v89.__cosval;
      [(VKCamera *)self forwardVector];
      double v94 = v93;
      double v96 = v95;
      double v98 = v97;
      [(VKCamera *)self rightVector];
      double v91 = -(-(v99 * v96 - v100 * v94) * v92 / sqrt(v100 * v100 + v99 * v99) + self->_transform._translation._e[2]
                                                                              * v98);
    }
    self->_distanceToGroundAndFarClipPlaneIntersection = v91;
  }
}

- (double)widthOfViewAtDepth:(double)a3
{
  [(VKCamera *)self tanHalfHorizFOV];
  return a3 * (v4 + v4);
}

- (optional<double>)maxDistanceToGroundRestriction
{
  *(unsigned char *)uint64_t v2 = 0;
  if (self->_maxDistanceToGroundRestriction._hasValue)
  {
    *(double *)(v2 + 8) = self->_maxDistanceToGroundRestriction._value.type;
    *(unsigned char *)uint64_t v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (double)maxPitch
{
  return self->_maxPitch;
}

- (optional<double>)minDistanceToGroundRestriction
{
  *(unsigned char *)uint64_t v2 = 0;
  if (self->_minDistanceToGroundRestriction._hasValue)
  {
    *(double *)(v2 + 8) = self->_minDistanceToGroundRestriction._value.type;
    *(unsigned char *)uint64_t v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3 atGroundLevel:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v9 = v4;
  uint64_t v10 = [(VKCamera *)self updateIfNeeded];
  double horizontalOffset = self->_horizontalOffset;
  double v13 = self->_transform._translation._e[2];
  double v14 = self->_forward._e[2];
  double v15 = self->_right._e[2];
  double v16 = self->_up._e[2];
  float64x2_t v17 = *(float64x2_t *)self->_transform._translation._e;
  float64x2_t v18 = *(float64x2_t *)self->_forward._e;
  float64x2_t v19 = *(float64x2_t *)self->_right._e;
  float64x2_t v20 = *(float64x2_t *)self->_up._e;
  *(unsigned char *)uint64_t v9 = 0;
  if (v13 > 0.0)
  {
    double v21 = (x - horizontalOffset) * 2.0 + -1.0;
    double v22 = y * 2.0 + -1.0;
    float64x2_t v23 = vmlaq_n_f64(vmlaq_n_f64(v18, v19, v21), v20, v22);
    double v24 = v14 + v15 * v21 + v16 * v22;
    double v25 = 1.0 / sqrt(vaddvq_f64(vmulq_f64(v23, v23)) + v24 * v24);
    double v26 = v25 * v24;
    if (v26 < 0.0)
    {
      double v27 = (a4 - v13) / v26;
      *(float64x2_t *)(v9 + 8) = vmlaq_n_f64(v17, v23, v27 * v25);
      *(double *)(v9 + 24) = v13 + v27 * v26;
      *(unsigned char *)uint64_t v9 = 1;
    }
  }
  result._value = v11;
  result._hasValue = v10;
  return result;
}

- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3
{
  uint64_t v3 = -[VKCamera groundPointFromScreenPoint:atGroundLevel:](self, "groundPointFromScreenPoint:atGroundLevel:", a3.x, a3.y, 0.0);
  result._value = v4;
  result._hasValue = v3;
  return result;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (void)setMaxPitch:(double)a3
{
  self->_maxPitch = a3;
}

- (void)setMaxHeightNoPitch:(double)a3
{
  self->_maxHeightNoPitch = a3;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (CGPoint)screenPointFromGroundPoint:(const void *)a3
{
  double v4 = *(double *)a3;
  double v14 = *((double *)a3 + 1);
  double v15 = *((double *)a3 + 2);
  double v16 = *(double *)a3 + -1.0;
  double v5 = *(double *)a3 + 1.0;
  double v6 = [(VKCamera *)self position];
  double v7 = vabdd_f64(*v6, v4);
  double v8 = vabdd_f64(*v6, v16);
  double v9 = vabdd_f64(*v6, v5);
  if (v8 >= v7 || v8 >= v9)
  {
    double v16 = v4;
    if (v9 < v7) {
      double v16 = v4 + 1.0;
    }
  }
  ValueUnion v11 = [(VKCamera *)self scaledViewProjectionMatrix];
  float64x2_t v12 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v11[6], *v11, v16), v11[2], v14), v11[4], v15), 1.0 / (v11[7].f64[1] + v11[1].f64[1] * v16 + v11[3].f64[1] * v14 + v11[5].f64[1] * v15));
  double v13 = v12.f64[1];
  result.double x = v12.f64[0];
  result.double y = v13;
  return result;
}

- (const)scaledViewProjectionMatrix
{
  return &self->_scaledViewProjectionMatrix;
}

- (double)tanHalfVerticalFOV
{
  return self->_tanHalfVerticalFOV;
}

- (VKViewVolume)viewVolume
{
  [(VKCamera *)self updateIfNeeded];
  viewVolume = self->_viewVolume;
  return viewVolume;
}

- (void)updateCamera:(shared_ptr<gdc:(function<BOOL)(std:()geo:(double>)& :()geo:(double>)& :Unit<geo::MeterUnitDescription Unit<geo::MeterUnitDescription :shared_ptr<gdc::Camera> :Camera>)a3 withAdjustment:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  -[VKCamera cameraFrame:](self, "cameraFrame:", **(unsigned char **)a3.__ptr_ == 0, a3.__cntrl_, a4);
  double v7 = *(double *)&v45;
  double v8 = *(double **)ptr;
  long long v9 = v45;
  long long v10 = v46;
  long long v11 = v47;
  *((void *)v8 + 7) = v48;
  *(_OWORD *)(v8 + 5) = v11;
  *(_OWORD *)(v8 + 3) = v10;
  *(_OWORD *)(v8 + 1) = v9;
  float64x2_t v12 = *(double **)ptr;
  [(VKCamera *)self verticalFieldOfView];
  double v14 = v12[46];
  double v13 = v12[47];
  if (v13 >= v14)
  {
    double v20 = v44;
  }
  else
  {
    double v15 = v13 * v14;
    double v16 = v14 / v13;
    if (v15 <= 0.0) {
      double v17 = 1.0;
    }
    else {
      double v17 = v16;
    }
    long double v18 = tan(v44 * 0.5);
    long double v19 = atan(v17 * v18);
    double v20 = v19 + v19;
  }
  v12[57] = v20;
  uint64_t v21 = *((void *)cntrl + 3);
  if (!v21) {
    goto LABEL_14;
  }
  float64x2_t v23 = *(double **)ptr;
  double v22 = (std::__shared_weak_count *)*((void *)ptr + 1);
  double v24 = *(double *)(*(void *)ptr + 464);
  double v43 = *(double *)(*(void *)ptr + 472);
  double v44 = v24;
  double v41 = v23;
  double v42 = v22;
  if (!v22
    || (atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed),
        (uint64_t v21 = *((void *)cntrl + 3)) != 0))
  {
    int v25 = (*(uint64_t (**)(uint64_t, double **, double *, double *))(*(void *)v21 + 48))(v21, &v41, &v44, &v43);
    int v26 = v25;
    double v27 = v42;
    if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
      if (!v26) {
        goto LABEL_14;
      }
    }
    else if (!v25)
    {
LABEL_14:
      long double v28 = tan(v7 * 0.5 + 0.789761487);
      double v29 = log(v28);
      long double v30 = tan(v7 * 0.5 + 0.78103484);
      double v31 = fabs((v29 - log(v30)) * 0.159154943);
      long double v32 = cos(v7 + v7) * -559.82 + 111132.92;
      long double v33 = v32 + cos(v7 * 4.0) * 1.175;
      long double v34 = v31 / (v33 + cos(v7 * 6.0) * -0.0023);
      double v35 = *(double **)ptr;
      [(VKCamera *)self nearClipDistance];
      long double v37 = v36 / v34;
      [(VKCamera *)self farClipDistance];
      v35[58] = v37;
      v35[59] = v38 / v34;
      double v39 = *(double **)ptr;
      [(VKCamera *)self horizontalOffset];
      *(float *)&double v40 = v40;
      *((_DWORD *)v39 + 122) = LODWORD(v40);
      *(_DWORD *)(*(void *)ptr + 492) = 0;
      return;
    }
    [(VKCamera *)self setFarClipDistance:v43 * 0.0000000249532021];
    [(VKCamera *)self setNearClipDistance:v44 * 0.0000000249532021];
    goto LABEL_14;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (double)farClipDistance
{
  return self->_far;
}

- (Unit<geo::RadianUnitDescription,)verticalFieldOfView
{
  v3._value = self->_verticalFieldOfView._value;
  *uint64_t v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (double)nearClipDistance
{
  return self->_near;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (CameraFrame<geo::Radians,)cameraFrame:(VKCamera *)self
{
  *(int64x2_t *)&retstr->_target.latitude._value = vdupq_n_s64(0xC00921FB54442D18);
  *(_OWORD *)&retstr->_target.altitude._value = 0u;
  *(_OWORD *)&retstr->_pitch._value = 0u;
  retstr->_roll._value = 0.0;
  [(VKCamera *)self position];
  [(VKCamera *)self position];
  [(VKCamera *)self groundPlaneIntersectionPoint];
  long double v8 = v7 * 6.28318531;
  long double v10 = exp(v9 * 6.28318531 + -3.14159265);
  long double v11 = atan(v10) * 2.0 + -1.57079633;
  long double v12 = fmod(v8, 6.28318531);
  long double v13 = fmod(v12 + 6.28318531, 6.28318531);
  retstr->_target.latitude._value = v11;
  retstr->_target.longitude._value = v13 + -3.14159265;
  retstr->_target.altitude._value = 0.0;
  [(VKCamera *)self pitch];
  retstr->_pitch._value = v14;
  [(VKCamera *)self yaw];
  retstr->_heading._value = -v15;
  double v16 = *(double *)([(VKCamera *)self position] + 16);
  [(VKCamera *)self pitch];
  long double v18 = v17;
  if (a4)
  {
    double v19 = 0.0000000249532021;
  }
  else
  {
    long double v20 = cos(v11 + v11) * -559.82 + 111132.92;
    long double v21 = v20 + cos(v11 * 4.0) * 1.175;
    long double v22 = v21 + cos(v11 * 6.0) * -0.0023;
    long double v23 = v11 * 0.5;
    long double v24 = tan(v23 + 0.78103484);
    double v25 = log(v24);
    long double v26 = tan(v23 + 0.789761487);
    double v19 = fabs((log(v26) - v25) * 0.159154943) / v22;
  }
  retstr->_distanceFromTarget._value = v16 / (v19 * cos(v18));
  return result;
}

- (const)position
{
  return &self->_transform;
}

- (Matrix<double,)groundPlaneIntersectionPoint
{
  [(VKCamera *)self forwardVector];
  double v6 = 1.0 / sqrt(v3 * v3 + v4 * v4 + v5 * v5);
  double v7 = v6 * v5;
  if (fabs(v7) >= 0.0000001 && (double v8 = self->_transform._translation._e[2], v9 = -v8 / v7, v9 >= 0.0))
  {
    double v10 = self->_transform._translation._e[0] + v6 * v3 * v9;
    double v11 = self->_transform._translation._e[1] + v6 * v4 * v9;
    double v12 = v8 + v9 * v7;
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  result._e[2] = v12;
  result._e[1] = v11;
  result._e[0] = v10;
  return result;
}

- (double)depthForViewWidth:(double)a3
{
  [(VKCamera *)self tanHalfHorizFOV];
  return a3 / (v4 + v4);
}

- (id)annotationRectTest
{
  return [(VKFootprint *)self->_footprint annotationRectTest];
}

- (void)adjustClipPlanes
{
  if (self->_nearFarReset)
  {
    double v3 = +[VKDebugSettings sharedSettings];
    [v3 farClipPlaneFactor];
    double v5 = v4;

    double v6 = self->_transform._translation._e[2] / -self->_forward._e[2];
    double near = fmax(v6 * 0.15, 0.000000124766011);
    double far = fmax(v6 * v5, 0.0000149719213);
    self->_double near = near;
    self->_double far = far;
  }
  else
  {
    double near = self->_near;
    double far = self->_far;
  }
  long double v9 = tan(self->_verticalFieldOfView._value * 0.5);
  double v10 = near * (v9 + v9);
  double v11 = v10 * self->_aspectRatio;
  self->_width = v11;
  self->_height = v10;
  double horizontalOffset = self->_horizontalOffset;
  self->_frustum.orthographic = 0;
  self->_frustum.width = v11;
  self->_frustum.height = v10;
  self->_frustum.double near = near;
  self->_frustum.double far = far;
  self->_frustum.double horizontalOffset = horizontalOffset;
  self->_nearFarReset = 1;
}

- (void)setMercatorPosition:(const void *)a3
{
  long double v5 = exp(*((double *)a3 + 1) * 6.28318531 + -3.14159265);
  long double v6 = atan(v5) * 2.0 + -1.57079633;
  long double v7 = cos(v6 + v6) * -559.82 + 111132.92;
  long double v8 = v7 + cos(v6 * 4.0) * 1.175;
  long double v9 = v8 + cos(v6 * 6.0) * -0.0023;
  long double v10 = v6 * 0.5;
  long double v11 = tan(v6 * 0.5 + 0.78103484);
  double v12 = log(v11);
  long double v13 = tan(v10 + 0.789761487);
  long double v14 = log(v13);
  double v16 = *((double *)a3 + 2);
  long long v15 = *(_OWORD *)a3;
  double v16 = fabs((v14 - v12) * 0.159154943) * v16 / v9;
  [(VKCamera *)self setPosition:&v15];
}

- (void)setPosition:(const void *)a3
{
  long long v13 = *(_OWORD *)a3;
  double v14 = *((double *)a3 + 2);
  int64x2_t v3 = vdupq_n_s64(0x7FF8000000000000uLL);
  if (*(void *)a3 == v3.i64[0] && *((void *)a3 + 1) == v3.i64[1] && *((void *)a3 + 2) == 0x7FF8000000000000)
  {
    long double v11 = [MEMORY[0x1E4F64860] sharedPlatform];
    int v12 = [v11 isInternalInstall];

    if (v12) {
      NSLog((NSString *)@"Attempt to set camera position set to NANs (%f, %f, %f)! Bailing", v13, *(void *)&v14);
    }
  }
  else
  {
    double v6 = fmax(v14, 0.0);
    double v7 = *(double *)&v13 - floor(*(double *)&v13);
    if (v7 < 0.0) {
      double v7 = v7 + 1.0;
    }
    double v8 = fmin(fmax(*((double *)&v13 + 1), self->_tanHalfVerticalFOV * v6), 1.0 - self->_tanHalfVerticalFOV * v6);
    if (*(void *)&self->_transform._translation._e[0] != *(void *)&v7
      || *(void *)&self->_transform._translation._e[1] != *(void *)&v8
      || *(void *)&self->_transform._translation._e[2] != *(void *)&v6)
    {
      self->_transform._translation._e[0] = v7;
      self->_transform._translation._e[1] = v8;
      self->_transform._translation._e[2] = v6;
      [(VKCamera *)self setNeedsUpdate];
    }
  }
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
  runLoopController = self->_runLoopController;
  if (runLoopController)
  {
    uint64_t var0 = (uint64_t)runLoopController->var0;
    if (runLoopController->var0)
    {
      char v4 = 4;
      md::MapEngine::setNeedsTick(var0, &v4);
    }
  }
}

- (void)setOrientation:(const void *)a3
{
  BOOL v4 = *(void *)&self->_transform._rotation._imaginary._e[0] == *(void *)a3
    && *(void *)&self->_transform._rotation._imaginary._e[1] == *((void *)a3 + 1)
    && *(void *)&self->_transform._rotation._imaginary._e[2] == *((void *)a3 + 2);
  if (!v4 || self->_transform._rotation._scalar != *((double *)a3 + 3))
  {
    self->_transform._rotation = *(Quaternion<double> *)a3;
    [(VKCamera *)self setNeedsUpdate];
  }
}

- (double)minHeight
{
  return self->_minHeight;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setAspectRatio:(double)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_double aspectRatio = a3;
    [(VKCamera *)self setNeedsUpdate];
  }
}

- (void)setFractionOfScreenAboveFarClipPlaneAtCanonicalPitch:(double)a3
{
  self->_fractionOfScreenAboveFarClipPlaneAtCanonicalPitch = a3;
}

- (void)setNdcZNear:(double)a3
{
  self->_double ndcZNear = a3;
}

- (VKCamera)initWithRunLoopController:(RunLoopController *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VKCamera;
  BOOL v4 = [(VKCamera *)&v18 init];
  long double v5 = v4;
  if (v4)
  {
    v4->_runLoopController = a3;
    double v6 = objc_alloc_init(VKViewVolume);
    viewVolume = v5->_viewVolume;
    v5->_viewVolume = v6;

    double v8 = objc_alloc_init(VKFootprint);
    footprint = v5->_footprint;
    v5->_footprint = v8;

    v5->_frustum.orthographic = 1;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v5->_frustum.width = _Q0;
    *(_OWORD *)&v5->_frustum.double near = xmmword_1A28FCC30;
    v5->_frustum.double horizontalOffset = 0.0;
    v5->_transform._rotation._imaginary._e[0] = 0.0;
    v5->_transform._rotation._imaginary._e[1] = 0.0;
    v5->_transform._rotation._imaginary._e[2] = 0.0;
    v5->_transform._rotation._double scalar = 1.0;
    v5->_transform._translation._e[0] = 0.5;
    *(_OWORD *)&v5->_transform._translation._e[1] = xmmword_1A28FCC40;
    v5->_tanHalfVerticalFOV = 0.267949192;
    v5->_double aspectRatio = 1.0;
    v5->_verticalFieldOfView._value = 0.523598776;
    v5->_needsUpdate = 1;
    *(_OWORD *)&v5->_maxHeight = xmmword_1A28FCC50;
    v5->_canonicalPitch = 1.31946891;
    v5->_double ndcZNear = -1.0;
    long long v15 = [[VKCameraRegionRestriction alloc] initWithMapRegion:0];
    regionRestriction = v5->_regionRestriction;
    v5->_regionRestriction = v15;

    v5->_nearFarReset = 1;
  }
  return v5;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((void *)self + 45) = 0x3FF0000000000000;
  *((unsigned char *)self + 1152) = 0;
  *((unsigned char *)self + 1168) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self->_maxDistanceToGroundRestriction._hasValue) {
    self->_maxDistanceToGroundRestriction._hasValue = 0;
  }
  if (self->_minDistanceToGroundRestriction._hasValue) {
    self->_minDistanceToGroundRestriction._hasValue = 0;
  }
  objc_storeStrong((id *)&self->_regionRestriction, 0);
  objc_storeStrong((id *)&self->_footprint, 0);
  objc_storeStrong((id *)&self->_viewVolume, 0);
}

- (void)setMaxDistanceToGroundRestriction:(optional<double>)a3
{
  BOOL hasValue = self->_maxDistanceToGroundRestriction._hasValue;
  if (**(unsigned char **)&a3._hasValue)
  {
    self->_maxDistanceToGroundRestriction._value.type = *(double *)(*(void *)&a3._hasValue + 8);
    if (!hasValue) {
      self->_maxDistanceToGroundRestriction._BOOL hasValue = 1;
    }
  }
  else if (self->_maxDistanceToGroundRestriction._hasValue)
  {
    self->_maxDistanceToGroundRestriction._BOOL hasValue = 0;
  }
}

- (void)setMinDistanceToGroundRestriction:(optional<double>)a3
{
  BOOL hasValue = self->_minDistanceToGroundRestriction._hasValue;
  if (**(unsigned char **)&a3._hasValue)
  {
    self->_minDistanceToGroundRestriction._value.type = *(double *)(*(void *)&a3._hasValue + 8);
    if (!hasValue) {
      self->_minDistanceToGroundRestriction._BOOL hasValue = 1;
    }
  }
  else if (self->_minDistanceToGroundRestriction._hasValue)
  {
    self->_minDistanceToGroundRestriction._BOOL hasValue = 0;
  }
}

- (void)setRegionRestriction:(id)a3
{
}

- (VKCameraRegionRestriction)regionRestriction
{
  return self->_regionRestriction;
}

- (double)ndcZNear
{
  return self->_ndcZNear;
}

- (void)setCanonicalPitch:(double)a3
{
  self->_canonicalPitch = a3;
}

- (double)canonicalPitch
{
  return self->_canonicalPitch;
}

- (double)screenHeightOfGroundAndFarClipPlaneIntersection
{
  return self->_screenHeightOfGroundAndFarClipPlaneIntersection;
}

- (double)distanceToGroundAndFarClipPlaneIntersection
{
  return self->_distanceToGroundAndFarClipPlaneIntersection;
}

- (double)fractionOfScreenAboveFarClipPlaneAtCanonicalPitch
{
  return self->_fractionOfScreenAboveFarClipPlaneAtCanonicalPitch;
}

- (void)setTerrainHeight:(double)a3
{
  self->_terrainHeight = a3;
}

- (double)terrainHeight
{
  return self->_terrainHeight;
}

- (double)maxHeightNoPitch
{
  return self->_maxHeightNoPitch;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (View<double>)view:(SEL)a3
{
  ViewSize v20 = a4;
  double width = (double)a4.width;
  p_transform = (long long *)&self->_transform;
  double near = self->_near;
  double far = self->_far;
  double ndcZNear = self->_ndcZNear;
  double height = (double)a4.height;
  long double v11 = tan(self->_verticalFieldOfView._value * 0.5);
  long double v12 = (near + near) * v11 * width / height;
  long long v34 = 0u;
  long long v35 = 0u;
  double v33 = (near + near) / v12;
  double v36 = 1.0 / v11;
  double v13 = -(far - ndcZNear * near);
  long long v37 = 0u;
  long long v38 = 0u;
  double v39 = v13 / (far - near);
  double v14 = -(far * near - ndcZNear * (far * near));
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  unint64_t v40 = 0xBFF0000000000000;
  double v43 = v14 / (far - near);
  uint64_t v44 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  double v21 = v12 / (near + near);
  long double v24 = v11;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  double v28 = (far - near) / v14;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  unint64_t v31 = 0xBFF0000000000000;
  double v32 = v13 / v14;
  geo::View<double>::View((uint64_t)&v16, p_transform, &v33, (long long *)&v21, &v20, 0, ndcZNear);
  *(_OWORD *)retstr->var0._translation._e = v16;
  retstr->var0._translation._e[2] = v17;
  retstr->var0._rotation = v18;
  return (View<double> *)memcpy(&retstr->var1, v19, 0x198uLL);
}

- (const)unscaledProjectionMatrix
{
  return &self->_unscaledProjectionMatrix;
}

- (const)unscaledViewMatrix
{
  return &self->_unscaledViewMatrix;
}

- (const)scaledViewMatrix
{
  return &self->_scaledViewMatrix;
}

- (const)scaledProjectionMatrix
{
  return &self->_scaledProjectionMatrix;
}

- (float)zoomAtCentrePoint
{
  -[VKCamera zoomAtPoint:](self, "zoomAtPoint:", 0.5, 0.5);
  return result;
}

- (float)zoomAtPoint:(CGPoint)a3
{
  double v4 = self->_transform._translation._e[0];
  double v5 = self->_transform._translation._e[1];
  double v6 = self->_transform._translation._e[2];
  double v7 = self->_forward._e[0];
  double v8 = self->_forward._e[1];
  double v9 = self->_forward._e[2];
  -[VKCamera groundPointFromScreenPoint:](self, "groundPointFromScreenPoint:", a3.x, a3.y);
  [(VKCamera *)self widthOfViewAtDepth:(v13 - v4) * v7 + (v14 - v5) * v8 + (v15 - v6) * v9];
  float v11 = log2(v10);
  return -v11;
}

- (id)annotationCoordinateTest
{
  return [(VKFootprint *)self->_footprint annotationCoordinateTest];
}

- (void)setCameraState:(VKCameraState *)a3
{
  self->_transform = a3->var0;
  self->_double aspectRatio = a3->var1;
  self->_verticalFieldOfView._value = a3->var2._value;
  self->_double horizontalOffset = a3->var3;
  [(VKCamera *)self setNeedsUpdate];
}

- (double)displayZoomLevel
{
  [(VKCamera *)self updateIfNeeded];
  [(VKFootprint *)self->_footprint nearestGroundPoint];
  [(VKCamera *)self widthOfViewAtDepth:self->_forward._e[0] * (v3 - self->_transform._translation._e[0])+ self->_forward._e[1] * (v4 - self->_transform._translation._e[1])+ self->_forward._e[2] * (v5 - self->_transform._translation._e[2])];
  return -log2(v6);
}

- (Matrix<double,)groundPoint
{
  [(VKCamera *)self updateIfNeeded];
  double v3 = self->_transform._translation._e[0];
  double v4 = self->_transform._translation._e[1];
  double v5 = 0.0;
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (Matrix<double,)rightVector
{
  [(VKCamera *)self updateIfNeeded];
  double v3 = self->_worldMatrix._e[0];
  double v4 = self->_worldMatrix._e[1];
  double v5 = self->_worldMatrix._e[2];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (void)setNearClipDistance:(double)a3
{
  self->_needsUpdate = 1;
  self->_nearFarReset = 0;
  self->_double near = a3;
}

- (void)setFarClipDistance:(double)a3
{
  self->_needsUpdate = 1;
  self->_nearFarReset = 0;
  self->_double far = a3;
}

- (Unit<geo::RadianUnitDescription,)horizontalFieldOfView
{
  double v4 = v2;
  [(VKCamera *)self updateIfNeeded];
  long double v5 = atan(self->_width * 0.5 / self->_near);
  v6._value = v5 + v5;
  *double v4 = v6._value;
  return v6;
}

- (void)setVerticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double v4 = *v3;
  if (*v3 != self->_verticalFieldOfView._value)
  {
    self->_verticalFieldOfView._value = v4;
    self->_tanHalfVerticalFOV = tan(v4 * 0.5);
    [(VKCamera *)self setNeedsUpdate];
  }
}

- (const)orientation
{
  return &self->_transform._rotation;
}

- ($7C969B71DD53AF2675E9F7E8E727D903)frustum
{
  Matrix<double, 3, 1> result = ($7C969B71DD53AF2675E9F7E8E727D903 *)[(VKCamera *)self updateIfNeeded];
  long long v6 = *(_OWORD *)&self->_frustum.height;
  *(_OWORD *)&retstr->uint64_t var0 = *(_OWORD *)&self->_frustum.orthographic;
  *(_OWORD *)&retstr->var2 = v6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_frustum.far;
  return result;
}

- (void)setTransform:(const void *)a3
{
  BOOL v4 = *((void *)a3 + 3) == *(void *)&self->_transform._rotation._imaginary._e[0]
    && *((void *)a3 + 4) == *(void *)&self->_transform._rotation._imaginary._e[1]
    && *((void *)a3 + 5) == *(void *)&self->_transform._rotation._imaginary._e[2];
  if (!v4
    || *((double *)a3 + 6) != self->_transform._rotation._scalar
    || (*(void *)a3 == *(void *)&self->_transform._translation._e[0]
      ? (BOOL v5 = *((void *)a3 + 1) == *(void *)&self->_transform._translation._e[1])
      : (BOOL v5 = 0),
        v5 ? (BOOL v6 = *((void *)a3 + 2) == *(void *)&self->_transform._translation._e[2]) : (BOOL v6 = 0),
        !v6))
  {
    self->_transform = *(RigidTransform<double, double> *)a3;
    [(VKCamera *)self setNeedsUpdate];
  }
}

- (const)transform
{
  return &self->_transform;
}

- (Mercator3<double>)mercatorPosition
{
  double v3 = self->_transform._translation._e[0];
  double v4 = self->_transform._translation._e[1];
  long double v5 = exp(v4 * 6.28318531 + -3.14159265);
  long double v6 = atan(v5) * 2.0 + -1.57079633;
  long double v7 = cos(v6 + v6) * -559.82 + 111132.92;
  long double v8 = v7 + cos(v6 * 4.0) * 1.175;
  long double v9 = v8 + cos(v6 * 6.0) * -0.0023;
  long double v10 = v6 * 0.5;
  long double v11 = tan(v6 * 0.5 + 0.78103484);
  double v12 = log(v11);
  long double v13 = tan(v10 + 0.789761487);
  double v14 = v9 * self->_transform._translation._e[2] / fabs((log(v13) - v12) * 0.159154943);
  double v15 = v3;
  double v16 = v4;
  result._e[2] = v14;
  result._e[1] = v16;
  result._e[0] = v15;
  return result;
}

- (void)_setPosition:(const void *)a3
{
  self->_transform._translation._e[0] = *(double *)a3;
  self->_transform._translation._e[1] = *((double *)a3 + 1);
  self->_transform._translation._e[2] = *((double *)a3 + 2);
  [(VKCamera *)self setNeedsUpdate];
}

- (id)descriptionDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = NSString;
  v22.receiver = self;
  v22.super_class = (Class)VKCamera;
  long double v5 = [(VKCamera *)&v22 description];
  long double v6 = [v4 stringWithFormat:@"%@", v5];
  [v3 setObject:v6 forKey:@"Super: VKCamera"];

  long double v7 = NSString;
  gm::Matrix<double,3,1>::description((uint64_t)&__p, self->_transform._translation._e);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  long double v9 = objc_msgSend(v7, "stringWithFormat:", @"%s\n", p_p);
  [v3 setObject:v9 forKey:@"position"];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  long double v10 = NSString;
  double v11 = self->_transform._rotation._imaginary._e[0];
  double v12 = self->_transform._rotation._imaginary._e[1];
  double v13 = self->_transform._rotation._imaginary._e[2];
  long double v14 = atan2(sqrt(v11 * v11 + v12 * v12 + v13 * v13), self->_transform._rotation._scalar);
  double v15 = [v10 stringWithFormat:@"%f, %f, %f, %f", *(void *)&v11, *(void *)&v12, *(void *)&v13, v14 + v14];
  [v3 setObject:v15 forKey:@"orientation quaternion"];

  double v16 = [NSString stringWithFormat:@"%.9f, height: %.9f, near: %.9f, far: %.9f", *(void *)&self->_width, *(void *)&self->_height, *(void *)&self->_near, *(void *)&self->_far];
  [v3 setObject:v16 forKey:@"Frustum width"];

  double v17 = NSString;
  gm::Matrix<double,4,4>::description(&__p, (uint64_t)&self->_scaledViewProjectionMatrix);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    Quaternion<double> v18 = &__p;
  }
  else {
    Quaternion<double> v18 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  double v19 = objc_msgSend(v17, "stringWithFormat:", @"%s", v18);
  [v3 setObject:v19 forKey:@"view projection matrix"];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)VKCamera;
  double v4 = [(VKCamera *)&v14 description];
  long double v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  gm::Matrix<double,3,1>::description((uint64_t)&__p, self->_transform._translation._e);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  objc_msgSend(v5, "appendFormat:", @"position: %s\n", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  double v7 = self->_transform._rotation._imaginary._e[0];
  double v8 = self->_transform._rotation._imaginary._e[1];
  double v9 = self->_transform._rotation._imaginary._e[2];
  long double v10 = atan2(sqrt(v7 * v7 + v8 * v8 + v9 * v9), self->_transform._rotation._scalar);
  [v5 appendFormat:@"orientation quaternion: %f, %f, %f, %f\n", *(void *)&v7, *(void *)&v8, *(void *)&v9, v10 + v10];
  [v5 appendFormat:@"Frustum width: %.9f, height: %.9f, near: %.9f, far: %.9f\n", *(void *)&self->_width, *(void *)&self->_height, *(void *)&self->_near, *(void *)&self->_far];
  gm::Matrix<double,4,4>::description(&__p, (uint64_t)&self->_scaledViewProjectionMatrix);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    double v11 = &__p;
  }
  else {
    double v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  objc_msgSend(v5, "appendFormat:", @"view projection matrix:\n%s\n", v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v5;
}

- (void)setHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    self->_double horizontalOffset = a3;
    [(VKCamera *)self setNeedsUpdate];
  }
}

@end