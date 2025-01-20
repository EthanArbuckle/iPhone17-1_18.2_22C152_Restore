@interface UIViewSpringAnimationBehaviorSettings
+ (id)_moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)smoothingAndProjectionEnabled;
- (CAFrameRateRange)frameRateRange;
- (NSString)description;
- (NSString)name;
- (PTFrameRateRangeSettings)preferredFrameRateRange;
- (double)_effectiveTrackingDampingRatio;
- (double)_effectiveTrackingResponse;
- (double)_effectiveTrackingRetargetImpulse;
- (double)dampingRatio;
- (double)dampingRatioSmoothing;
- (double)deceleration;
- (double)inertialProjectionDeceleration;
- (double)inertialTargetSmoothingRatio;
- (double)response;
- (double)responseSmoothing;
- (double)retargetImpulse;
- (double)settlingDuration;
- (double)trackingDampingRatio;
- (double)trackingDampingRatioSmoothing;
- (double)trackingResponse;
- (double)trackingResponseSmoothing;
- (double)trackingRetargetImpulse;
- (id)BSAnimationSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)behaviorType;
- (unint64_t)hash;
- (void)setBehaviorType:(int64_t)a3;
- (void)setDampingRatio:(double)a3;
- (void)setDampingRatioSmoothing:(double)a3;
- (void)setDeceleration:(double)a3;
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

@implementation UIViewSpringAnimationBehaviorSettings

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  self->_smoothingAndProjectionEnabled = a3;
}

- (void)setDefaultValues
{
  [(UIViewSpringAnimationBehaviorSettings *)self setBehaviorType:2];
  [(UIViewSpringAnimationBehaviorSettings *)self setDeceleration:0.998];
  [(UIViewSpringAnimationBehaviorSettings *)self setDampingRatio:0.845];
  [(UIViewSpringAnimationBehaviorSettings *)self setResponse:0.531];
  [(UIViewSpringAnimationBehaviorSettings *)self setTrackingDampingRatio:0.86];
  [(UIViewSpringAnimationBehaviorSettings *)self setTrackingResponse:0.15];
  [(UIViewSpringAnimationBehaviorSettings *)self setRetargetImpulse:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setTrackingRetargetImpulse:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setDampingRatioSmoothing:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setResponseSmoothing:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setTrackingDampingRatioSmoothing:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setTrackingResponseSmoothing:0.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setSmoothingAndProjectionEnabled:0];
}

- (void)setTrackingResponse:(double)a3
{
  self->_trackingResponse = a3;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_trackingDampingRatio = a3;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  self->_trackingRetargetImpulse = a3;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  self->_trackingResponseSmoothing = a3;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  self->_trackingDampingRatioSmoothing = a3;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (void)setResponseSmoothing:(double)a3
{
  self->_responseSmoothing = a3;
}

- (void)setDeceleration:(double)a3
{
  self->_deceleration = a3;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  self->_dampingRatioSmoothing = a3;
}

- (void)setBehaviorType:(int64_t)a3
{
  self->_behaviorType = a3;
}

- (void)setPreferredFrameRateRange:(id)a3
{
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (![(UIViewSpringAnimationBehaviorSettings *)self isEqual:v4])
  {
    objc_storeStrong((id *)(v4 + 64), self->_name);
    *(void *)(v4 + 56) = self->_behaviorType;
    *(double *)(v4 + 72) = self->_deceleration;
    *(double *)(v4 + 80) = self->_dampingRatio;
    *(double *)(v4 + 88) = self->_response;
    *(double *)(v4 + 104) = self->_trackingDampingRatio;
    *(double *)(v4 + 112) = self->_trackingResponse;
    *(double *)(v4 + 96) = self->_retargetImpulse;
    *(double *)(v4 + 120) = self->_trackingRetargetImpulse;
    *(double *)(v4 + 128) = self->_dampingRatioSmoothing;
    *(double *)(v4 + 136) = self->_responseSmoothing;
    *(double *)(v4 + 144) = self->_trackingDampingRatioSmoothing;
    *(double *)(v4 + 152) = self->_trackingResponseSmoothing;
    *(unsigned char *)(v4 + 48) = self->_smoothingAndProjectionEnabled;
    *(double *)(v4 + 160) = self->_inertialTargetSmoothingRatio;
    *(double *)(v4 + 168) = self->_inertialProjectionDeceleration;
    uint64_t v5 = [(PTFrameRateRangeSettings *)self->_preferredFrameRateRange copy];
    v6 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v5;
  }
  return (id)v4;
}

- (void)setDefaultCriticallyDampedValues
{
  [(UIViewSpringAnimationBehaviorSettings *)self setDefaultValues];
  [(UIViewSpringAnimationBehaviorSettings *)self setDampingRatio:1.0];
  [(UIViewSpringAnimationBehaviorSettings *)self setResponse:0.336];
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 == 1)
  {
    [(UIViewSpringAnimationBehaviorSettings *)self _effectiveTrackingDampingRatio];
    retstr->var0 = v8;
    [(UIViewSpringAnimationBehaviorSettings *)self _effectiveTrackingResponse];
    retstr->var1 = v9;
    [(UIViewSpringAnimationBehaviorSettings *)self _effectiveTrackingRetargetImpulse];
    retstr->var10 = v10;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)[(UIViewSpringAnimationBehaviorSettings *)self smoothingAndProjectionEnabled];
    if (result)
    {
      double trackingResponseSmoothing = self->_trackingResponseSmoothing;
      retstr->var6 = self->_trackingDampingRatioSmoothing;
      retstr->var7 = trackingResponseSmoothing;
      if (!a4)
      {
        *(_WORD *)&retstr->var2 = 257;
        double response = self->_response;
        retstr->var4 = self->_dampingRatio;
        retstr->var5 = response;
      }
    }
  }
  else
  {
    double v14 = self->_response;
    retstr->var0 = self->_dampingRatio;
    retstr->var1 = v14;
    retstr->var10 = self->_retargetImpulse;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)[(UIViewSpringAnimationBehaviorSettings *)self smoothingAndProjectionEnabled];
    if (result)
    {
      double responseSmoothing = self->_responseSmoothing;
      retstr->var6 = self->_dampingRatioSmoothing;
      retstr->var7 = responseSmoothing;
      if (a4 == 1)
      {
        double inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
        retstr->var8 = self->_inertialTargetSmoothingRatio * self->_trackingResponse;
        retstr->var9 = inertialProjectionDeceleration;
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v54 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t behaviorType = self->_behaviorType;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke;
  v85[3] = &unk_1E52DFC38;
  id v6 = v4;
  id v86 = v6;
  v53 = [v54 appendInteger:behaviorType counterpart:v85];
  name = self->_name;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_2;
  v83[3] = &unk_1E52DFC60;
  id v8 = v6;
  id v84 = v8;
  v52 = [v53 appendString:name counterpart:v83];
  double deceleration = self->_deceleration;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_3;
  v81[3] = &unk_1E52DCFA8;
  id v10 = v8;
  id v82 = v10;
  v51 = [v52 appendDouble:v81 counterpart:deceleration];
  double dampingRatio = self->_dampingRatio;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_4;
  v79[3] = &unk_1E52DCFA8;
  id v12 = v10;
  id v80 = v12;
  v50 = [v51 appendCGFloat:v79 counterpart:dampingRatio];
  double response = self->_response;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_5;
  v77[3] = &unk_1E52DCFA8;
  id v14 = v12;
  id v78 = v14;
  v49 = [v50 appendCGFloat:v77 counterpart:response];
  double retargetImpulse = self->_retargetImpulse;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_6;
  v75[3] = &unk_1E52DCFA8;
  id v16 = v14;
  id v76 = v16;
  v48 = [v49 appendCGFloat:v75 counterpart:retargetImpulse];
  double trackingDampingRatio = self->_trackingDampingRatio;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_7;
  v73[3] = &unk_1E52DCFA8;
  id v18 = v16;
  id v74 = v18;
  v47 = [v48 appendCGFloat:v73 counterpart:trackingDampingRatio];
  double trackingResponse = self->_trackingResponse;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_8;
  v71[3] = &unk_1E52DCFA8;
  id v20 = v18;
  id v72 = v20;
  v46 = [v47 appendCGFloat:v71 counterpart:trackingResponse];
  double trackingRetargetImpulse = self->_trackingRetargetImpulse;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_9;
  v69[3] = &unk_1E52DCFA8;
  id v22 = v20;
  id v70 = v22;
  v45 = [v46 appendCGFloat:v69 counterpart:trackingRetargetImpulse];
  BOOL smoothingAndProjectionEnabled = self->_smoothingAndProjectionEnabled;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_10;
  v67[3] = &unk_1E52DA6B0;
  id v24 = v22;
  id v68 = v24;
  v25 = [v45 appendBool:smoothingAndProjectionEnabled counterpart:v67];
  double dampingRatioSmoothing = self->_dampingRatioSmoothing;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_11;
  v65[3] = &unk_1E52DCFA8;
  id v27 = v24;
  id v66 = v27;
  v28 = [v25 appendCGFloat:v65 counterpart:dampingRatioSmoothing];
  double responseSmoothing = self->_responseSmoothing;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_12;
  v63[3] = &unk_1E52DCFA8;
  id v30 = v27;
  id v64 = v30;
  v31 = [v28 appendCGFloat:v63 counterpart:responseSmoothing];
  double trackingDampingRatioSmoothing = self->_trackingDampingRatioSmoothing;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_13;
  v61[3] = &unk_1E52DCFA8;
  id v33 = v30;
  id v62 = v33;
  v34 = [v31 appendCGFloat:v61 counterpart:trackingDampingRatioSmoothing];
  double trackingResponseSmoothing = self->_trackingResponseSmoothing;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_14;
  v59[3] = &unk_1E52DCFA8;
  id v36 = v33;
  id v60 = v36;
  v37 = [v34 appendCGFloat:v59 counterpart:trackingResponseSmoothing];
  double inertialTargetSmoothingRatio = self->_inertialTargetSmoothingRatio;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_15;
  v57[3] = &unk_1E52DCFA8;
  id v39 = v36;
  id v58 = v39;
  v40 = [v37 appendCGFloat:v57 counterpart:inertialTargetSmoothingRatio];
  double inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_16;
  v55[3] = &unk_1E52DCFA8;
  id v56 = v39;
  id v42 = v39;
  v43 = [v40 appendCGFloat:v55 counterpart:inertialProjectionDeceleration];
  LOBYTE(v39) = [v43 isEqual];

  return (char)v39;
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) behaviorType];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deceleration];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dampingRatio];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) response];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) retargetImpulse];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingDampingRatio];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingResponse];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingRetargetImpulse];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) smoothingAndProjectionEnabled];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) dampingRatioSmoothing];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) responseSmoothing];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingDampingRatioSmoothing];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingResponseSmoothing];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) inertialTargetSmoothingRatio];
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) inertialProjectionDeceleration];
}

- (unint64_t)hash
{
  v21 = [MEMORY[0x1E4F4F758] builder];
  id v20 = [v21 appendInteger:self->_behaviorType];
  v19 = [v20 appendString:self->_name];
  id v18 = [v19 appendDouble:self->_deceleration];
  v17 = [v18 appendCGFloat:self->_dampingRatio];
  id v16 = [v17 appendCGFloat:self->_response];
  v15 = [v16 appendCGFloat:self->_retargetImpulse];
  id v14 = [v15 appendCGFloat:self->_trackingDampingRatio];
  v3 = [v14 appendCGFloat:self->_trackingResponse];
  id v4 = [v3 appendCGFloat:self->_trackingRetargetImpulse];
  uint64_t v5 = [v4 appendBool:self->_smoothingAndProjectionEnabled];
  id v6 = [v5 appendCGFloat:self->_dampingRatioSmoothing];
  v7 = [v6 appendCGFloat:self->_responseSmoothing];
  id v8 = [v7 appendCGFloat:self->_trackingDampingRatioSmoothing];
  double v9 = [v8 appendCGFloat:self->_trackingResponseSmoothing];
  id v10 = [v9 appendCGFloat:self->_inertialTargetSmoothingRatio];
  v11 = [v10 appendCGFloat:self->_inertialProjectionDeceleration];
  unint64_t v12 = [v11 hash];

  return v12;
}

- (NSString)description
{
  return (NSString *)[(UIViewSpringAnimationBehaviorSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UIViewSpringAnimationBehaviorSettings *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if ([(NSString *)self->_name length]) {
    [v3 appendString:self->_name withName:@"Name"];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIViewSpringAnimationBehaviorSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(UIViewSpringAnimationBehaviorSettings *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UIViewSpringAnimationBehaviorSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

void __79__UIViewSpringAnimationBehaviorSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) BSAnimationSettings];
  id v4 = (id)[v2 appendObject:v3 withName:@"animationSettings"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) preferredFrameRateRange];
  id v6 = (id)[v5 appendObject:v7 withName:@"preferredFrameRateRange"];
}

- (id)BSAnimationSettings
{
  [(UIViewSpringAnimationBehaviorSettings *)self dampingRatio];
  [(UIViewSpringAnimationBehaviorSettings *)self response];
  v3 = (void *)MEMORY[0x1E4F4F840];
  return (id)objc_msgSend(v3, "settingsWithMass:stiffness:damping:", 1.0);
}

- (double)settlingDuration
{
  v3 = [MEMORY[0x1E4F39C90] animation];
  [v3 setMass:1.0];
  [(UIViewSpringAnimationBehaviorSettings *)self dampingRatio];
  double v5 = v4;
  [(UIViewSpringAnimationBehaviorSettings *)self response];
  double v7 = sqrt(6.28318531 / v6 * (6.28318531 / v6));
  double v8 = v5 * (v7 + v7);
  objc_msgSend(v3, "setStiffness:");
  [v3 setDamping:v8];
  [v3 settlingDuration];
  double v10 = v9;

  return v10;
}

- (double)_effectiveTrackingDampingRatio
{
  if ([(UIViewSpringAnimationBehaviorSettings *)self behaviorType] == 1)
  {
    [(UIViewSpringAnimationBehaviorSettings *)self dampingRatio];
  }
  else
  {
    [(UIViewSpringAnimationBehaviorSettings *)self trackingDampingRatio];
  }
  return result;
}

- (double)_effectiveTrackingResponse
{
  if ([(UIViewSpringAnimationBehaviorSettings *)self behaviorType] == 1)
  {
    [(UIViewSpringAnimationBehaviorSettings *)self response];
  }
  else
  {
    [(UIViewSpringAnimationBehaviorSettings *)self trackingResponse];
  }
  return result;
}

- (double)_effectiveTrackingRetargetImpulse
{
  if ([(UIViewSpringAnimationBehaviorSettings *)self behaviorType] == 1)
  {
    [(UIViewSpringAnimationBehaviorSettings *)self retargetImpulse];
  }
  else
  {
    [(UIViewSpringAnimationBehaviorSettings *)self trackingRetargetImpulse];
  }
  return result;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  id v11 = [(UIViewSpringAnimationBehaviorSettings *)self preferredFrameRateRange];
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);
}

- (CAFrameRateRange)frameRateRange
{
  v2 = [(UIViewSpringAnimationBehaviorSettings *)self preferredFrameRateRange];
  [v2 frameRateRange];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;

  float v9 = v4;
  float v10 = v6;
  float v11 = v8;
  result.float preferred = v11;
  result.float maximum = v10;
  result.float minimum = v9;
  return result;
}

+ (id)settingsControllerModule
{
  return (id)[a1 _moduleWithSectionTitle:@"Behavior"];
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  float v3 = (void *)MEMORY[0x1E4F28F60];
  id v70 = a3;
  v69 = objc_msgSend(v3, "predicateWithFormat:", @"behaviorType == %d", 0);
  float v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"behaviorType == %d OR behaviorType == %d", 1, 2);
  float v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"behaviorType == %d", 2);
  float v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"behaviorType == %d AND smoothingAndProjectionEnabled = YES", 2);
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"behaviorType == %d AND BOOL smoothingAndProjectionEnabled = YES", 2);
  float v8 = [MEMORY[0x1E4F1CA48] array];
  float v9 = [MEMORY[0x1E4F94108] rowWithTitle:@"Behavior Type" valueKeyPath:@"behaviorType"];
  float v10 = [v9 possibleValues:&unk_1ED3EF248 titles:&unk_1ED3EF260];
  [v8 addObject:v10];

  float v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Deceleration" valueKeyPath:@"deceleration"];
  unint64_t v12 = [v11 between:0.0 and:1.0];
  v13 = [v12 condition:v69];
  [v8 addObject:v13];

  id v14 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping Ratio" valueKeyPath:@"dampingRatio"];
  v15 = [v14 between:0.001 and:10.0];
  id v16 = [v15 precision:3];
  v17 = [v16 condition:v4];
  [v8 addObject:v17];

  id v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response" valueKeyPath:@"response"];
  v19 = [v18 between:0.0 and:1000.0];
  id v20 = [v19 precision:3];
  v21 = [v20 condition:v4];
  [v8 addObject:v21];

  id v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Retarget Impulse" valueKeyPath:@"retargetImpulse"];
  v23 = [v22 between:0.0 and:1.0];
  id v24 = [v23 precision:3];
  v25 = [v24 condition:v4];
  [v8 addObject:v25];

  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tracking Damping Ratio" valueKeyPath:@"trackingDampingRatio"];
  id v27 = [v26 between:0.001 and:10.0];
  v28 = [v27 precision:3];
  v29 = [v28 condition:v5];
  [v8 addObject:v29];

  id v30 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tracking Response" valueKeyPath:@"trackingResponse"];
  v31 = [v30 between:0.0 and:1000.0];
  v32 = [v31 precision:3];
  id v33 = [v32 condition:v5];
  [v8 addObject:v33];

  v34 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tracking Retarget Impulse" valueKeyPath:@"trackingRetargetImpulse"];
  v35 = [v34 between:0.0 and:1.0];
  id v36 = [v35 precision:3];
  v37 = [v36 condition:v4];
  [v8 addObject:v37];

  v38 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Smoothing and Projection" valueKeyPath:@"smoothingAndProjectionEnabled"];
  [v8 addObject:v38];

  id v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping Ratio Smoothing" valueKeyPath:@"dampingRatioSmoothing"];
  v40 = [v39 between:0.0 and:1.0];
  v41 = [v40 precision:3];
  id v42 = [v41 condition:v6];
  [v8 addObject:v42];

  v43 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response Smoothing" valueKeyPath:@"responseSmoothing"];
  v44 = [v43 between:0.0 and:1.0];
  v45 = [v44 precision:3];
  v46 = [v45 condition:v6];
  [v8 addObject:v46];

  v47 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tracking Damping Ratio Smoothing" valueKeyPath:@"trackingDampingRatioSmoothing"];
  v48 = [v47 between:0.0 and:1.0];
  v49 = [v48 precision:3];
  v50 = [v49 condition:v7];
  [v8 addObject:v50];

  v51 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tracking Response Smoothing" valueKeyPath:@"trackingResponseSmoothing"];
  v52 = [v51 between:0.0 and:1.0];
  v53 = [v52 precision:3];
  v54 = [v53 condition:v7];
  [v8 addObject:v54];

  v55 = [MEMORY[0x1E4F94148] rowWithTitle:@"Target Smoothing Ratio" valueKeyPath:@"inertialTargetSmoothingRatio"];
  id v56 = [v55 between:0.0 and:1.0];
  v57 = [v56 precision:3];
  id v58 = [v57 condition:v7];
  [v8 addObject:v58];

  v59 = [MEMORY[0x1E4F94148] rowWithTitle:@"Projection Deceleration" valueKeyPath:@"inertialProjectionDeceleration"];
  id v60 = [v59 between:0.0 and:1.0];
  v61 = [v60 precision:7];
  id v62 = [v61 condition:v7];
  [v8 addObject:v62];

  v63 = [MEMORY[0x1E4F94130] rowWithTitle:@"Frame Rate Range" childSettingsKeyPath:@"preferredFrameRateRange"];
  [v8 addObject:v63];

  id v64 = (void *)MEMORY[0x1E4F94160];
  v65 = [MEMORY[0x1E4F94160] sectionWithRows:v8 title:v70];

  v71[0] = v65;
  id v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  v67 = [v64 moduleWithTitle:0 contents:v66];

  return v67;
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)deceleration
{
  return self->_deceleration;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (double)response
{
  return self->_response;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (double)trackingRetargetImpulse
{
  return self->_trackingRetargetImpulse;
}

- (BOOL)smoothingAndProjectionEnabled
{
  return self->_smoothingAndProjectionEnabled;
}

- (double)dampingRatioSmoothing
{
  return self->_dampingRatioSmoothing;
}

- (double)responseSmoothing
{
  return self->_responseSmoothing;
}

- (double)trackingDampingRatioSmoothing
{
  return self->_trackingDampingRatioSmoothing;
}

- (double)trackingResponseSmoothing
{
  return self->_trackingResponseSmoothing;
}

- (double)inertialTargetSmoothingRatio
{
  return self->_inertialTargetSmoothingRatio;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  self->_double inertialTargetSmoothingRatio = a3;
}

- (double)inertialProjectionDeceleration
{
  return self->_inertialProjectionDeceleration;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  self->_double inertialProjectionDeceleration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end