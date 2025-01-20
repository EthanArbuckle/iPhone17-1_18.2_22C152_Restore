@interface SUIAFluidBehaviorSettings
+ (id)_moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)smoothingAndProjectionEnabled;
- (CAFrameRateRange)frameRateRange;
- (NSString)description;
- (NSString)name;
- (PTFrameRateRangeSettings)preferredFrameRateRange;
- (double)dampingRatio;
- (double)dampingRatioSmoothing;
- (double)inertialProjectionDeceleration;
- (double)inertialTargetSmoothingRatio;
- (double)response;
- (double)responseSmoothing;
- (double)retargetImpulse;
- (double)trackingDampingRatio;
- (double)trackingDampingRatioSmoothing;
- (double)trackingResponse;
- (double)trackingResponseSmoothing;
- (double)trackingRetargetImpulse;
- (id)BSAnimationSettings;
- (id)copy;
- (int64_t)behaviorType;
- (int64_t)hash;
- (unsigned)highFrameRateReason;
- (void)setBehaviorType:(int64_t)a3;
- (void)setDampingRatio:(double)a3;
- (void)setDampingRatioSmoothing:(double)a3;
- (void)setDefaultCriticallyDampedValues;
- (void)setDefaultValues;
- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)setInertialProjectionDeceleration:(double)a3;
- (void)setInertialTargetSmoothingRatio:(double)a3;
- (void)setName:(id)a3;
- (void)setPreferredFrameRateRange:(id)a3;
- (void)setResponse:(double)a3;
- (void)setResponseSmoothing:(double)a3;
- (void)setRetargetImpulse:(double)a3;
- (void)setSmoothingAndProjectionEnabled:(BOOL)a3;
- (void)setTrackingDampingRatio:(double)a3;
- (void)setTrackingDampingRatioSmoothing:(double)a3;
- (void)setTrackingResponse:(double)a3;
- (void)setTrackingResponseSmoothing:(double)a3;
- (void)setTrackingRetargetImpulse:(double)a3;
@end

@implementation SUIAFluidBehaviorSettings

- (int64_t)behaviorType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  return *v2;
}

- (void)setBehaviorType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)name
{
  v2 = (char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_name;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_25E75BEA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_25E75BEB0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_name);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)dampingRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatio:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)response
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_response);
  swift_beginAccess();
  return *v2;
}

- (void)setResponse:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_response);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)retargetImpulse
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setRetargetImpulse:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trackingDampingRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatio:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trackingResponse
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponse:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trackingRetargetImpulse
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)dampingRatioSmoothing
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)responseSmoothing
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setResponseSmoothing:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trackingDampingRatioSmoothing
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trackingResponseSmoothing
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)inertialTargetSmoothingRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)inertialProjectionDeceleration
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  double *v4 = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  return (PTFrameRateRangeSettings *)*v2;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  uint64_t v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (void)setDefaultValues
{
  v2 = self;
  SUIAFluidBehaviorSettings.setDefaultValues()();
}

- (void)setDefaultCriticallyDampedValues
{
  v2 = self;
  [(SUIAFluidBehaviorSettings *)v2 setDefaultValues];
  [(SUIAFluidBehaviorSettings *)v2 setDampingRatio:1.0];
  [(SUIAFluidBehaviorSettings *)v2 setResponse:0.336];
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  v8 = self;
  SUIAFluidBehaviorSettings.parametersForTransition(from:to:)(a4, a5, (uint64_t)&v14);
  LOBYTE(a5) = v15;
  LOBYTE(a4) = v16;
  double v9 = v20;

  long long v11 = v17;
  long long v12 = v18;
  long long v13 = v19;
  *(_OWORD *)&retstr->var0 = v14;
  retstr->var2 = a5;
  retstr->var3 = a4;
  *(_OWORD *)&retstr->var4 = v11;
  *(_OWORD *)&retstr->var6 = v12;
  *(_OWORD *)&retstr->var8 = v13;
  retstr->var10 = v9;
  return result;
}

- (id)BSAnimationSettings
{
  v9[1] = *(double *)MEMORY[0x263EF8340];
  double v8 = 0.0;
  v9[0] = 0.0;
  v2 = self;
  [(SUIAFluidBehaviorSettings *)v2 dampingRatio];
  double v4 = v3;
  [(SUIAFluidBehaviorSettings *)v2 response];
  SUIAConvertDampingRatioAndResponseToTensionAndFriction(v9, &v8, v4, v5);
  id v6 = objc_msgSend(self, sel_settingsWithMass_stiffness_damping_, 1.0, v9[0], v8);

  return v6;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  double v8 = self;
  double v9 = [(SUIAFluidBehaviorSettings *)v8 preferredFrameRateRange];
  if (v9)
  {
    long long v13 = v9;
    *(float *)&double v10 = minimum;
    *(float *)&double v11 = maximum;
    *(float *)&double v12 = preferred;
    -[PTFrameRateRangeSettings setFrameRateRange:highFrameRateReason:](v9, sel_setFrameRateRange_highFrameRateReason_, v4, v10, v11, v12);
  }
  else
  {
    __break(1u);
  }
}

- (CAFrameRateRange)frameRateRange
{
  v2 = self;
  double v3 = [(SUIAFluidBehaviorSettings *)v2 preferredFrameRateRange];
  if (v3)
  {
    v7 = v3;
    [(PTFrameRateRangeSettings *)v3 frameRateRange];
    float v9 = v8;
    float v11 = v10;
    float v13 = v12;

    float v4 = v9;
    float v5 = v11;
    float v6 = v13;
  }
  else
  {
    __break(1u);
  }
  result.float preferred = v6;
  result.float maximum = v5;
  result.float minimum = v4;
  return result;
}

- (unsigned)highFrameRateReason
{
  v2 = self;
  double v3 = [(SUIAFluidBehaviorSettings *)v2 preferredFrameRateRange];
  if (v3)
  {
    float v4 = v3;
    unsigned int v5 = [(PTFrameRateRangeSettings *)v3 highFrameRateReason];

    LODWORD(v3) = v5;
  }
  else
  {
    __break(1u);
  }
  return v3;
}

+ (id)settingsControllerModule
{
  double v3 = (void *)sub_25E75BEA0();
  id v4 = objc_msgSend(a1, sel__moduleWithSectionTitle_, v3);

  return v4;
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  if (a3) {
    sub_25E75BEB0();
  }
  _sSo25SUIAFluidBehaviorSettingsC20SystemUIAnimationKitE7_module16withSectionTitleSo8PTModuleCSgSSSg_tFZ_0();
  id v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

- (NSString)description
{
  v2 = self;
  SUIAFluidBehaviorSettings.description.getter();

  double v3 = (void *)sub_25E75BEA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copy
{
  v2 = self;
  SUIAFluidBehaviorSettings.copy()(v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  double v3 = (void *)sub_25E75C180();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_25E75C050();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    unsigned int v5 = self;
  }
  BOOL v6 = SUIAFluidBehaviorSettings.isEqual(_:)((uint64_t)v8);

  sub_25E71839C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  SUIAFluidBehaviorSettings.hash.getter();
  int64_t v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
}

@end