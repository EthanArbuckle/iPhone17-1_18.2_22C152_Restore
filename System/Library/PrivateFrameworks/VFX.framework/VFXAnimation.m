@interface VFXAnimation
+ (BOOL)supportsSecureCoding;
+ (id)animationFromWorld:(id)a3;
+ (id)animationNamed:(id)a3;
+ (id)animationWithCAAnimation:(id)a3;
+ (id)animationWithCFXAnimation:(__CFXAnimation *)a3;
+ (id)animationWithContentsOfURL:(id)a3;
+ (id)animationWithMDLTransform:(id)a3;
- (BOOL)autoreverses;
- (BOOL)fillsBackward;
- (BOOL)fillsForward;
- (BOOL)isAdditive;
- (BOOL)isAppliedOnCompletion;
- (BOOL)isCumulative;
- (BOOL)isRemovedOnCompletion;
- (CAAnimation)caAnimation;
- (NSArray)animationEvents;
- (NSString)description;
- (NSString)keyPath;
- (VFXAnimation)initWithCAAnimation:(id)a3;
- (VFXAnimation)initWithCFXAnimation:(__CFXAnimation *)a3;
- (VFXAnimation)initWithCoder:(id)a3;
- (VFXTimingFunction)timingFunction;
- (__CFXAnimation)animationRef;
- (double)beginTime;
- (double)blendInDuration;
- (double)blendOutDuration;
- (double)duration;
- (double)timeOffset;
- (float)fadeInDuration;
- (float)fadeOutDuration;
- (float)repeatCount;
- (float)repeatDuration;
- (id)animationDidStart;
- (id)animationDidStop;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodeAnimation:(id)a3;
- (id)encodeAnimation:(id)a3;
- (id)subAnimations;
- (id)userAnimation;
- (id)valueForUndefinedKey:(id)a3;
- (void)__CFObject;
- (void)_didMutate;
- (void)_optimizeKeyframesWithTarget:(id)a3;
- (void)_setAnimationRef:(__CFXAnimation *)a3;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4;
- (void)setAdditive:(BOOL)a3;
- (void)setAnimationDidStart:(id)a3;
- (void)setAnimationDidStop:(id)a3;
- (void)setAnimationEvents:(id)a3;
- (void)setAppliedOnCompletion:(BOOL)a3;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBeginTime:(double)a3;
- (void)setBlendInDuration:(double)a3;
- (void)setBlendOutDuration:(double)a3;
- (void)setCumulative:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(float)a3;
- (void)setFadeOutDuration:(float)a3;
- (void)setFillsBackward:(BOOL)a3;
- (void)setFillsForward:(BOOL)a3;
- (void)setKeyPath:(id)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(float)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimingFunction:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation VFXAnimation

+ (id)animationWithMDLTransform:(id)a3
{
  uint64_t v5 = objc_msgSend_transformAnimation(a3, a2, (uint64_t)a3, v3);

  return (id)objc_msgSend_animationWithCAAnimation_(VFXAnimation, v4, v5, v6);
}

- (void)dealloc
{
  animationRef = self->_animationRef;
  if (animationRef) {
    sub_1B6583684((uint64_t)animationRef, 0, v2, v3, v4, v5, v6, v7);
  }

  id animationDidStart = self->_animationDidStart;
  if (animationDidStart) {
    _Block_release(animationDidStart);
  }
  id animationDidStop = self->_animationDidStop;
  if (animationDidStop) {
    _Block_release(animationDidStop);
  }
  v12 = self->_animationRef;
  if (v12)
  {
    CFRelease(v12);
    self->_animationRef = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)VFXAnimation;
  [(VFXAnimation *)&v13 dealloc];
}

- (VFXAnimation)initWithCFXAnimation:(__CFXAnimation *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXAnimation;
  uint64_t v4 = [(VFXAnimation *)&v12 init];
  uint64_t v7 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    objc_msgSend__setAnimationRef_(v4, v5, (uint64_t)a3, v6);
    objc_msgSend__syncObjCModel(v7, v8, v9, v10);
    v7->_didMutate = 0;
  }
  return v7;
}

- (VFXAnimation)initWithCAAnimation:(id)a3
{
  v77.receiver = self;
  v77.super_class = (Class)VFXAnimation;
  uint64_t v4 = [(VFXAnimation *)&v77 init];
  v8 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    v4->_userAnimation = (id)objc_msgSend_copy(a3, v5, v6, v7);
    objc_msgSend_duration(a3, v9, v10, v11);
    v8->_duration = v12;
    objc_msgSend_repeatCount(a3, v13, v14, v15);
    v8->_repeatCount = v16;
    v8->_autoreverses = objc_msgSend_autoreverses(a3, v17, v18, v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8->_additive = objc_msgSend_isAdditive(a3, v20, v21, v22);
      v8->_cumulative = objc_msgSend_isCumulative(a3, v23, v24, v25);
      v29 = objc_msgSend_keyPath(a3, v26, v27, v28);
      v8->_keyPath = (NSString *)objc_msgSend_copy(v29, v30, v31, v32);
    }
    v8->_removedOnCompletion = objc_msgSend_isRemovedOnCompletion(a3, v20, v21, v22);
    objc_msgSend_beginTime(a3, v33, v34, v35);
    v8->_beginTime = v36;
    objc_msgSend_timeOffset(a3, v37, v38, v39);
    v8->_timeOffset = v40;
    objc_msgSend_fadeInDuration(a3, v41, v42, v43);
    v8->_fadeInDuration = v44;
    objc_msgSend_fadeOutDuration(a3, v45, v46, v47);
    v8->_fadeOutDuration = v48;
    uint64_t v52 = objc_msgSend_fillMode(a3, v49, v50, v51);
    uint64_t v56 = *MEMORY[0x1E4F39FA0];
    BOOL v57 = v52 == *MEMORY[0x1E4F39FA0] || objc_msgSend_fillMode(a3, v53, v54, v55) == *MEMORY[0x1E4F39FA8];
    v8->_fillForward = v57;
    BOOL v65 = objc_msgSend_fillMode(a3, v53, v54, v55) == v56
       || objc_msgSend_fillMode(a3, v58, v59, v60) == *MEMORY[0x1E4F39F98];
    v8->_fillBackward = v65;
    if (v8->_animationEvents) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. _animationEvents should be nil", v59, v60, v61, v62, v63, v64, (uint64_t)"_animationEvents == NULL");
    }
    v66 = objc_msgSend_animationEvents(a3, v58, v59, v60);
    v8->_animationEvents = (NSArray *)objc_msgSend_copy(v66, v67, v68, v69);
    uint64_t v73 = objc_msgSend_timingFunction(a3, v70, v71, v72);
    v8->_timingFunction = (VFXTimingFunction *)(id)objc_msgSend_functionWithCAMediaTimingFunction_(VFXTimingFunction, v74, v73, v75);
    v8->_didMutate = 0;
  }
  return v8;
}

+ (id)animationWithCFXAnimation:(__CFXAnimation *)a3
{
  uint64_t v4 = [VFXAnimation alloc];
  uint64_t v7 = objc_msgSend_initWithCFXAnimation_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (void)_setAnimationRef:(__CFXAnimation *)a3
{
  animationRef = self->_animationRef;
  if (animationRef != a3)
  {
    if (animationRef)
    {
      CFRelease(animationRef);
      self->_animationRef = 0;
    }
    if (a3) {
      uint64_t v11 = (__CFXAnimation *)CFRetain(a3);
    }
    else {
      uint64_t v11 = 0;
    }
    self->_animationRef = v11;
  }
  if (a3)
  {
    sub_1B6583684((uint64_t)a3, self, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
}

- (__CFXAnimation)animationRef
{
  return self->_animationRef;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init((Class)objc_opt_class());
  v11[30] = 0;
  animationRef = self->_animationRef;
  if (animationRef)
  {
    objc_super v13 = sub_1B6494038(animationRef, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend__setAnimationRef_(v11, v14, (uint64_t)v13, v15);
    if (v13) {
      CFRelease(v13);
    }
  }
  *((void *)v11 + 8) = self->_timingFunction;
  *((void *)v11 + 9) = self->_animationEvents;
  id animationDidStart = self->_animationDidStart;
  if (animationDidStart) {
    *((void *)v11 + 12) = _Block_copy(animationDidStart);
  }
  id animationDidStop = self->_animationDidStop;
  if (animationDidStop) {
    *((void *)v11 + 13) = _Block_copy(animationDidStop);
  }
  *((void *)v11 + 3) = *(void *)&self->_duration;
  v11[8] = LODWORD(self->_repeatCount);
  *((void *)v11 + 5) = *(void *)&self->_timeOffset;
  *((void *)v11 + 6) = *(void *)&self->_beginTime;
  *((unsigned char *)v11 + 56) = self->_autoreverses;
  *((unsigned char *)v11 + 57) = self->_removedOnCompletion;
  *((unsigned char *)v11 + 58) = self->_applyOnCompletion;
  *((unsigned char *)v11 + 59) = self->_additive;
  *((unsigned char *)v11 + 60) = self->_cumulative;
  *((unsigned char *)v11 + 61) = self->_fillForward;
  *((unsigned char *)v11 + 62) = self->_fillBackward;
  *((void *)v11 + 10) = *(void *)&self->_fadeInDuration;
  *((void *)v11 + 11) = *(void *)&self->_fadeOutDuration;
  *((void *)v11 + 17) = objc_msgSend_copy(self->_userAnimation, v16, v17, v18);
  *((unsigned char *)v11 + 144) = self->_didMutate;
  return v11;
}

- (void)_syncObjCModel
{
  uint64_t v3 = (void *)sub_1B6492CF4((uint64_t)self->_animationRef);
  uint64_t v6 = objc_msgSend_componentsJoinedByString_(v3, v4, @".", v5);

  self->_keyPath = (NSString *)v6;
  self->_duration = sub_1B6492D84((uint64_t)self->_animationRef, v7, v8, v9, v10, v11, v12, v13);
  self->_repeatCount = sub_1B6492EC0((uint64_t)self->_animationRef, v14, v15, v16, v17, v18, v19, v20);
  self->_autoreverses = sub_1B6492F68((uint64_t)self->_animationRef, v21, v22, v23, v24, v25, v26, v27);
  self->_beginTime = sub_1B64396D4((uint64_t)self->_animationRef, v28, v29, v30, v31, v32, v33, v34);
  self->_timeOffset = sub_1B64933C0((uint64_t)self->_animationRef, v35, v36, v37, v38, v39, v40, v41);
  self->_fadeInDuration = sub_1B6493508((uint64_t)self->_animationRef, v42, v43, v44, v45, v46, v47, v48);
  self->_fadeOutDuration = sub_1B64935AC((uint64_t)self->_animationRef, v49, v50, v51, v52, v53, v54, v55);
  self->_removedOnCompletion = sub_1B64931F0((uint64_t)self->_animationRef, v56, v57, v58, v59, v60, v61, v62);
  char v70 = sub_1B649399C((uint64_t)self->_animationRef, v63, v64, v65, v66, v67, v68, v69);
  self->_fillForward = v70 & 1;
  self->_fillBackward = (v70 & 2) != 0;
  uint64_t v78 = sub_1B649381C((uint64_t)self->_animationRef, v71, v72, v73, v74, v75, v76, v77);
  v86 = (NSArray *)sub_1B64FEFC8(v78, v79, v80, v81, v82, v83, v84, v85);
  animationEvents = self->_animationEvents;
  if (animationEvents != v86)
  {
    v95 = v86;

    self->_animationEvents = v95;
  }
  uint64_t v96 = sub_1B6493034((uint64_t)self->_animationRef, v87, v88, v89, v90, v91, v92, v93);
  if (v96)
  {
    uint64_t v104 = v96;

    v105 = [VFXTimingFunction alloc];
    self->_timingFunction = (VFXTimingFunction *)objc_msgSend_initWithTimingFunctionRef_(v105, v106, v104, v107);
  }
  self->_applyOnCompletion = sub_1B64936B8((uint64_t)self->_animationRef, v97, v98, v99, v100, v101, v102, v103);
  self->_additive = sub_1B64931A0((uint64_t)self->_animationRef, v108, v109, v110, v111, v112, v113, v114);
  self->_cumulative = sub_1B64930E8((uint64_t)self->_animationRef, v115, v116, v117, v118, v119, v120, v121);
}

- (id)encodeAnimation:(id)a3
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = NSNumber;
  objc_msgSend_duration(a3, v7, v8, v9);
  uint64_t v13 = objc_msgSend_numberWithDouble_(v6, v10, v11, v12);
  objc_msgSend_setValue_forKey_(v5, v14, v13, @"duration");
  uint64_t v18 = objc_msgSend_timingFunction(a3, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v5, v19, v18, @"timingFunction");
  uint64_t v23 = objc_msgSend_fillMode(a3, v20, v21, v22);
  objc_msgSend_setValue_forKey_(v5, v24, v23, @"fillMode");
  uint64_t v25 = NSNumber;
  uint64_t v29 = objc_msgSend_commitsOnCompletion(a3, v26, v27, v28);
  uint64_t v32 = objc_msgSend_numberWithBool_(v25, v30, v29, v31);
  objc_msgSend_setValue_forKey_(v5, v33, v32, @"commitsOnCompletion");
  uint64_t v34 = NSNumber;
  uint64_t isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(a3, v35, v36, v37);
  uint64_t v41 = objc_msgSend_numberWithBool_(v34, v39, isRemovedOnCompletion, v40);
  objc_msgSend_setValue_forKey_(v5, v42, v41, @"removedOnCompletion");
  uint64_t v43 = NSNumber;
  uint64_t v47 = objc_msgSend_autoreverses(a3, v44, v45, v46);
  uint64_t v50 = objc_msgSend_numberWithBool_(v43, v48, v47, v49);
  objc_msgSend_setValue_forKey_(v5, v51, v50, @"autoreverses");
  uint64_t v52 = NSNumber;
  objc_msgSend_fadeInDuration(a3, v53, v54, v55);
  uint64_t v59 = objc_msgSend_numberWithFloat_(v52, v56, v57, v58);
  objc_msgSend_setValue_forKey_(v5, v60, v59, @"fadeInDuration");
  uint64_t v61 = NSNumber;
  objc_msgSend_fadeOutDuration(a3, v62, v63, v64);
  uint64_t v68 = objc_msgSend_numberWithFloat_(v61, v65, v66, v67);
  objc_msgSend_setValue_forKey_(v5, v69, v68, @"fadeOutDuration");
  char v70 = NSNumber;
  objc_msgSend_speed(a3, v71, v72, v73);
  uint64_t v77 = objc_msgSend_numberWithFloat_(v70, v74, v75, v76);
  objc_msgSend_setValue_forKey_(v5, v78, v77, @"speed");
  uint64_t v79 = NSNumber;
  objc_msgSend_timeOffset(a3, v80, v81, v82);
  uint64_t v86 = objc_msgSend_numberWithDouble_(v79, v83, v84, v85);
  objc_msgSend_setValue_forKey_(v5, v87, v86, @"timeOffset");
  uint64_t v88 = NSNumber;
  objc_msgSend_repeatCount(a3, v89, v90, v91);
  uint64_t v95 = objc_msgSend_numberWithFloat_(v88, v92, v93, v94);
  objc_msgSend_setValue_forKey_(v5, v96, v95, @"repeatCount");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v100 = objc_msgSend_keyPath(a3, v97, v98, v99);
    objc_msgSend_setValue_forKey_(v5, v101, v100, @"keyPath");
    uint64_t v102 = NSNumber;
    uint64_t isCumulative = objc_msgSend_isCumulative(a3, v103, v104, v105);
    uint64_t v109 = objc_msgSend_numberWithBool_(v102, v107, isCumulative, v108);
    objc_msgSend_setValue_forKey_(v5, v110, v109, @"cumulative");
    uint64_t v111 = NSNumber;
    uint64_t isAdditive = objc_msgSend_isAdditive(a3, v112, v113, v114);
    uint64_t v118 = objc_msgSend_numberWithBool_(v111, v116, isAdditive, v117);
    objc_msgSend_setValue_forKey_(v5, v119, v118, @"additive");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v123 = objc_msgSend_fromValue(a3, v120, v121, v122);
    uint64_t v126 = VFXDataFromValue(v123, (const char *)1, v124, v125);
    objc_msgSend_setValue_forKey_(v5, v127, v126, @"from");
    v131 = objc_msgSend_toValue(a3, v128, v129, v130);
    uint64_t v134 = VFXDataFromValue(v131, (const char *)1, v132, v133);
    objc_msgSend_setValue_forKey_(v5, v135, v134, @"to");
    v139 = objc_msgSend_byValue(a3, v136, v137, v138);
    uint64_t v142 = VFXDataFromValue(v139, (const char *)1, v140, v141);
    objc_msgSend_setValue_forKey_(v5, v143, v142, @"by");
    objc_msgSend_setValue_forKey_(v5, v144, @"basic", @"type");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v148 = objc_msgSend_values(a3, v145, v146, v147);
    uint64_t v152 = VFXDataFromArrayOfValues(v148, v149, v150, v151);
    objc_msgSend_setValue_forKey_(v5, v153, v152, @"values");
    uint64_t v157 = objc_msgSend_keyTimes(a3, v154, v155, v156);
    objc_msgSend_setValue_forKey_(v5, v158, v157, @"keyTimes");
    uint64_t v162 = objc_msgSend_timingFunctions(a3, v159, v160, v161);
    objc_msgSend_setValue_forKey_(v5, v163, v162, @"timingFunctions");
    uint64_t v167 = objc_msgSend_tensionValues(a3, v164, v165, v166);
    objc_msgSend_setValue_forKey_(v5, v168, v167, @"tensionValues");
    uint64_t v172 = objc_msgSend_continuityValues(a3, v169, v170, v171);
    objc_msgSend_setValue_forKey_(v5, v173, v172, @"continuityValues");
    uint64_t v177 = objc_msgSend_biasValues(a3, v174, v175, v176);
    objc_msgSend_setValue_forKey_(v5, v178, v177, @"biasValues");
    uint64_t v182 = objc_msgSend_calculationMode(a3, v179, v180, v181);
    objc_msgSend_setValue_forKey_(v5, v183, v182, @"calculationMode");
    uint64_t v187 = objc_msgSend_rotationMode(a3, v184, v185, v186);
    objc_msgSend_setValue_forKey_(v5, v188, v187, @"rotationMode");
    objc_msgSend_setValue_forKey_(v5, v189, @"keyframe", @"type");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v190 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v194 = objc_msgSend_animations(a3, v191, v192, v193);
    uint64_t v198 = objc_msgSend_count(v194, v195, v196, v197);
    v201 = objc_msgSend_initWithCapacity_(v190, v199, v198, v200);
    long long v218 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    v205 = objc_msgSend_animations(a3, v202, v203, v204, 0);
    uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v206, (uint64_t)&v218, (uint64_t)v222, 16);
    if (v207)
    {
      uint64_t v210 = v207;
      uint64_t v211 = *(void *)v219;
      do
      {
        uint64_t v212 = 0;
        do
        {
          if (*(void *)v219 != v211) {
            objc_enumerationMutation(v205);
          }
          uint64_t v213 = objc_msgSend_encodeAnimation_(self, v208, *(void *)(*((void *)&v218 + 1) + 8 * v212), v209);
          objc_msgSend_addObject_(v201, v214, v213, v215);
          ++v212;
        }
        while (v210 != v212);
        uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v208, (uint64_t)&v218, (uint64_t)v222, 16);
      }
      while (v210);
    }
    objc_msgSend_setValue_forKey_(v5, v208, (uint64_t)v201, @"animations");
    objc_msgSend_setValue_forKey_(v5, v216, @"group", @"type");
  }
  return v5;
}

- (id)decodeAnimation:(id)a3
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_valueForKey_(a3, a2, @"type", v3);
  uint64_t v9 = objc_msgSend_valueForKey_(a3, v7, @"keyPath", v8);
  if (objc_msgSend_isEqualToString_(v6, v10, @"basic", v11))
  {
    uint64_t v14 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v12, v9, v13);
    uint64_t v17 = objc_msgSend_valueForKey_(a3, v15, @"from", v16);
    uint64_t v21 = VFXValueFromData(v17, v18, v19, v20);
    objc_msgSend_setFromValue_(v14, v22, (uint64_t)v21, v23);
    uint64_t v26 = objc_msgSend_valueForKey_(a3, v24, @"to", v25);
    uint64_t v30 = VFXValueFromData(v26, v27, v28, v29);
    objc_msgSend_setToValue_(v14, v31, (uint64_t)v30, v32);
    uint64_t v35 = objc_msgSend_valueForKey_(a3, v33, @"by", v34);
    uint64_t v39 = VFXValueFromData(v35, v36, v37, v38);
    objc_msgSend_setByValue_(v14, v40, (uint64_t)v39, v41);
  }
  else if (objc_msgSend_isEqualToString_(v6, v12, @"keyframe", v13))
  {
    uint64_t v14 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39BD8], v44, v9, v45);
    uint64_t v48 = objc_msgSend_valueForKey_(a3, v46, @"values", v47);
    uint64_t v52 = VFXArrayOfValueFromData(v48, v49, v50, v51);
    objc_msgSend_setValues_(v14, v53, (uint64_t)v52, v54);
    uint64_t v57 = objc_msgSend_valueForKey_(a3, v55, @"keyTimes", v56);
    objc_msgSend_setKeyTimes_(v14, v58, v57, v59);
    uint64_t v62 = objc_msgSend_valueForKey_(a3, v60, @"timingFunctions", v61);
    objc_msgSend_setTimingFunctions_(v14, v63, v62, v64);
    uint64_t v67 = objc_msgSend_valueForKey_(a3, v65, @"tensionValues", v66);
    objc_msgSend_setTensionValues_(v14, v68, v67, v69);
    uint64_t v72 = objc_msgSend_valueForKey_(a3, v70, @"continuityValues", v71);
    objc_msgSend_setContinuityValues_(v14, v73, v72, v74);
    uint64_t v77 = objc_msgSend_valueForKey_(a3, v75, @"biasValues", v76);
    objc_msgSend_setBiasValues_(v14, v78, v77, v79);
    uint64_t v82 = objc_msgSend_valueForKey_(a3, v80, @"calculationMode", v81);
    objc_msgSend_setCalculationMode_(v14, v83, v82, v84);
    uint64_t v87 = objc_msgSend_valueForKey_(a3, v85, @"rotationMode", v86);
    objc_msgSend_setRotationMode_(v14, v88, v87, v89);
  }
  else if (objc_msgSend_isEqualToString_(v6, v44, @"group", v45))
  {
    uint64_t v14 = objc_msgSend_animation(MEMORY[0x1E4F39B38], v42, v90, v43);
    uint64_t v93 = objc_msgSend_valueForKey_(a3, v91, @"animations", v92);
    id v94 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v98 = objc_msgSend_count(v93, v95, v96, v97);
    uint64_t v101 = objc_msgSend_initWithCapacity_(v94, v99, v98, v100);
    long long v221 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v102, (uint64_t)&v221, (uint64_t)v225, 16);
    if (v103)
    {
      uint64_t v106 = v103;
      uint64_t v107 = *(void *)v222;
      do
      {
        uint64_t v108 = 0;
        do
        {
          if (*(void *)v222 != v107) {
            objc_enumerationMutation(v93);
          }
          uint64_t v109 = objc_msgSend_decodeAnimation_(self, v104, *(void *)(*((void *)&v221 + 1) + 8 * v108), v105);
          objc_msgSend_addObject_(v101, v110, v109, v111);
          ++v108;
        }
        while (v106 != v108);
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v104, (uint64_t)&v221, (uint64_t)v225, 16);
      }
      while (v106);
    }
    objc_msgSend_setAnimations_(v14, v104, (uint64_t)v101, v105);
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v112 = objc_msgSend_valueForKey_(a3, v42, @"duration", v43);
  objc_msgSend_doubleValue(v112, v113, v114, v115);
  objc_msgSend_setDuration_(v14, v116, v117, v118);
  uint64_t v121 = objc_msgSend_valueForKey_(a3, v119, @"timingFunction", v120);
  objc_msgSend_setTimingFunction_(v14, v122, v121, v123);
  uint64_t v126 = objc_msgSend_valueForKey_(a3, v124, @"fillMode", v125);
  objc_msgSend_setFillMode_(v14, v127, v126, v128);
  v131 = objc_msgSend_valueForKey_(a3, v129, @"commitsOnCompletion", v130);
  uint64_t v135 = objc_msgSend_BOOLValue(v131, v132, v133, v134);
  objc_msgSend_setCommitsOnCompletion_(v14, v136, v135, v137);
  uint64_t v140 = objc_msgSend_valueForKey_(a3, v138, @"removedOnCompletion", v139);
  uint64_t v144 = objc_msgSend_BOOLValue(v140, v141, v142, v143);
  objc_msgSend_setRemovedOnCompletion_(v14, v145, v144, v146);
  v149 = objc_msgSend_valueForKey_(a3, v147, @"autoreverses", v148);
  uint64_t v153 = objc_msgSend_BOOLValue(v149, v150, v151, v152);
  objc_msgSend_setAutoreverses_(v14, v154, v153, v155);
  v158 = objc_msgSend_valueForKey_(a3, v156, @"fadeInDuration", v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  objc_msgSend_setFadeInDuration_(v14, v162, v163, v164);
  uint64_t v167 = objc_msgSend_valueForKey_(a3, v165, @"fadeOutDuration", v166);
  objc_msgSend_floatValue(v167, v168, v169, v170);
  objc_msgSend_setFadeOutDuration_(v14, v171, v172, v173);
  uint64_t v176 = objc_msgSend_valueForKey_(a3, v174, @"speed", v175);
  objc_msgSend_floatValue(v176, v177, v178, v179);
  objc_msgSend_setSpeed_(v14, v180, v181, v182);
  uint64_t v185 = objc_msgSend_valueForKey_(a3, v183, @"timeOffset", v184);
  objc_msgSend_floatValue(v185, v186, v187, v188);
  objc_msgSend_setTimeOffset_(v14, v190, v191, v192, v189);
  v195 = objc_msgSend_valueForKey_(a3, v193, @"repeatCount", v194);
  objc_msgSend_floatValue(v195, v196, v197, v198);
  objc_msgSend_setRepeatCount_(v14, v199, v200, v201);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v204 = objc_msgSend_valueForKey_(a3, v202, @"cumulative", v203);
    uint64_t v208 = objc_msgSend_BOOLValue(v204, v205, v206, v207);
    objc_msgSend_setCumulative_(v14, v209, v208, v210);
    uint64_t v213 = objc_msgSend_valueForKey_(a3, v211, @"additive", v212);
    uint64_t v217 = objc_msgSend_BOOLValue(v213, v214, v215, v216);
    objc_msgSend_setAdditive_(v14, v218, v217, v219);
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = objc_msgSend_caAnimation(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = (const char *)objc_msgSend_encodeAnimation_(self, v7, v6, v8);
  sub_1B64FAC90(a3, v9, @"animation");
  uint64_t v13 = objc_msgSend_keyPath(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, @"keyPath");
  objc_msgSend_duration(self, v15, v16, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"duration", v19);
  objc_msgSend_repeatCount(self, v20, v21, v22);
  objc_msgSend_encodeDouble_forKey_(a3, v24, @"repeatCount", v25, v23);
  objc_msgSend_timeOffset(self, v26, v27, v28);
  objc_msgSend_encodeDouble_forKey_(a3, v29, @"timeOffset", v30);
  objc_msgSend_beginTime(self, v31, v32, v33);
  objc_msgSend_encodeDouble_forKey_(a3, v34, @"beginTime", v35);
  uint64_t v39 = objc_msgSend_autoreverses(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(a3, v40, v39, @"autoreverses");
  uint64_t isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(a3, v45, isRemovedOnCompletion, @"removedOnCompletion");
  uint64_t isAppliedOnCompletion = objc_msgSend_isAppliedOnCompletion(self, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(a3, v50, isAppliedOnCompletion, @"applyOnCompletion");
  uint64_t isAdditive = objc_msgSend_isAdditive(self, v51, v52, v53);
  objc_msgSend_encodeBool_forKey_(a3, v55, isAdditive, @"additive");
  uint64_t isCumulative = objc_msgSend_isCumulative(self, v56, v57, v58);
  objc_msgSend_encodeBool_forKey_(a3, v60, isCumulative, @"cumulative");
  uint64_t v64 = objc_msgSend_fillsForward(self, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(a3, v65, v64, @"fillForward");
  uint64_t v69 = objc_msgSend_fillsBackward(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(a3, v70, v69, @"fillBackward");
  uint64_t v74 = objc_msgSend_timingFunction(self, v71, v72, v73);
  objc_msgSend_encodeObject_forKey_(a3, v75, v74, @"timingFunction");
  objc_msgSend_fadeInDuration(self, v76, v77, v78);
  objc_msgSend_encodeDouble_forKey_(a3, v80, @"fadeInDuration", v81, v79);
  objc_msgSend_fadeOutDuration(self, v82, v83, v84);
  objc_msgSend_encodeDouble_forKey_(a3, v86, @"fadeOutDuration", v87, v85);
  if (self->_userInfo)
  {
    os_unfair_lock_lock(&self->_userInfoLock);
    objc_msgSend_encodeObject_forKey_(a3, v88, (uint64_t)self->_userInfo, @"userInfo");
    os_unfair_lock_unlock(&self->_userInfoLock);
  }
}

- (VFXAnimation)initWithCoder:(id)a3
{
  v114[1] = *MEMORY[0x1E4F143B8];
  v113.receiver = self;
  v113.super_class = (Class)VFXAnimation;
  uint64_t v4 = [(VFXAnimation *)&v113 init];
  id v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = (void *)sub_1B64FBF0C();
    v114[0] = objc_opt_class();
    uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v114, 1);
    uint64_t v11 = objc_msgSend_setByAddingObjectsFromArray_(v6, v9, v8, v10);
    uint64_t v12 = sub_1B64FAD0C(a3, @"animation", v11);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = objc_msgSend_immediateMode(VFXTransaction, v13, v14, v15);
      objc_msgSend_setImmediateMode_(VFXTransaction, v18, 1, v19);
      v5->_userAnimation = (id)objc_msgSend_decodeAnimation_(v5, v20, v16, v21);
      uint64_t v22 = objc_opt_class();
      uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, @"keyPath");
      objc_msgSend_setKeyPath_(v5, v25, v24, v26);
      objc_msgSend_decodeDoubleForKey_(a3, v27, @"duration", v28);
      objc_msgSend_setDuration_(v5, v29, v30, v31);
      objc_msgSend_decodeDoubleForKey_(a3, v32, @"repeatCount", v33);
      *(float *)&double v34 = v34;
      objc_msgSend_setRepeatCount_(v5, v35, v36, v37, v34);
      objc_msgSend_decodeDoubleForKey_(a3, v38, @"timeOffset", v39);
      objc_msgSend_setTimeOffset_(v5, v40, v41, v42);
      objc_msgSend_decodeDoubleForKey_(a3, v43, @"beginTime", v44);
      objc_msgSend_setBeginTime_(v5, v45, v46, v47);
      objc_msgSend_beginTime(v5, v48, v49, v50);
      objc_msgSend_setBeginTime_(v5->_userAnimation, v51, v52, v53);
      uint64_t v56 = objc_msgSend_decodeBoolForKey_(a3, v54, @"autoreverses", v55);
      objc_msgSend_setAutoreverses_(v5, v57, v56, v58);
      uint64_t v61 = objc_msgSend_decodeBoolForKey_(a3, v59, @"appliedOnCompletion", v60);
      objc_msgSend_setAppliedOnCompletion_(v5, v62, v61, v63);
      uint64_t v66 = objc_msgSend_decodeBoolForKey_(a3, v64, @"removedOnCompletion", v65);
      objc_msgSend_setRemovedOnCompletion_(v5, v67, v66, v68);
      uint64_t v71 = objc_msgSend_decodeBoolForKey_(a3, v69, @"additive", v70);
      objc_msgSend_setAdditive_(v5, v72, v71, v73);
      uint64_t v76 = objc_msgSend_decodeBoolForKey_(a3, v74, @"cumulative", v75);
      objc_msgSend_setCumulative_(v5, v77, v76, v78);
      uint64_t v81 = objc_msgSend_decodeBoolForKey_(a3, v79, @"fillForward", v80);
      objc_msgSend_setFillsForward_(v5, v82, v81, v83);
      uint64_t v86 = objc_msgSend_decodeBoolForKey_(a3, v84, @"fillBackward", v85);
      objc_msgSend_setFillsBackward_(v5, v87, v86, v88);
      uint64_t v89 = objc_opt_class();
      uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v90, v89, @"timingFunction");
      objc_msgSend_setTimingFunction_(v5, v92, v91, v93);
      objc_msgSend_decodeDoubleForKey_(a3, v94, @"fadeInDuration", v95);
      *(float *)&double v96 = v96;
      objc_msgSend_setFadeInDuration_(v5, v97, v98, v99, v96);
      objc_msgSend_decodeDoubleForKey_(a3, v100, @"fadeOutDuration", v101);
      *(float *)&double v102 = v102;
      objc_msgSend_setFadeOutDuration_(v5, v103, v104, v105, v102);
      uint64_t v106 = sub_1B64FAE78();
      uint64_t v108 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v107, v106, @"userInfo");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_userInfo = (NSMutableDictionary *)objc_msgSend_mutableCopy(v108, v109, v110, v111);
      }
      v5->_didMutate = 0;
      objc_msgSend_setImmediateMode_(VFXTransaction, v109, v17, v111);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)animationNamed:(id)a3
{
  uint64_t v6 = (void *)VFXGetResourceBundle((uint64_t)a1, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_pathExtension(a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_stringByDeletingPathExtension(a3, v11, v12, v13);
  if (v10) {
    id result = (id)objc_msgSend_URLForResource_withExtension_(v6, v14, v15, v10);
  }
  else {
    id result = (id)objc_msgSend_URLForResource_withExtension_(v6, v14, v15, @"vfx-anim");
  }
  if (result)
  {
    return (id)MEMORY[0x1F4181798](a1, sel_animationWithContentsOfURL_, result, v17);
  }
  return result;
}

+ (id)animationFromWorld:(id)a3
{
  id v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, v3);
  uint64_t v36 = 0;
  uint64_t v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v9 = objc_msgSend_rootNode(a3, v6, v7, v8);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1B6502A10;
  v35[3] = &unk_1E6143740;
  v35[4] = v5;
  v35[5] = &v36;
  objc_msgSend_enumerateHierarchyUsingBlock_(v9, v10, (uint64_t)v35, v11);
  if (objc_msgSend_count(v5, v12, v13, v14))
  {
    if (objc_msgSend_count(v5, v15, v16, v17) == 1)
    {
      uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v5, v18, 0, v20);
      uint64_t v24 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v22, v21, v23);
    }
    else
    {
      uint64_t v26 = objc_msgSend_animation(MEMORY[0x1E4F39B38], v18, v19, v20);
      objc_msgSend_setAnimations_(v26, v27, (uint64_t)v5, v28);
      objc_msgSend_setDuration_(v26, v29, v30, v31, v37[3]);
      uint64_t v24 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v32, (uint64_t)v26, v33);
    }
    uint64_t v25 = (void *)v24;
  }
  else
  {
    uint64_t v25 = 0;
  }
  _Block_object_dispose(&v36, 8);
  return v25;
}

+ (id)animationWithContentsOfURL:(id)a3
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3);
  uint64_t v31 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v32, 3);
  uint64_t v13 = objc_msgSend_setWithArray_(v8, v11, v10, v12);
  uint64_t v18 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v7, v14, v13, v6, &v31);
  if (v31)
  {
    objc_msgSend_description(v31, v15, v16, v17);
    sub_1B63F2F54(16, @"Error: Loading animation %@ failed with %@", v19, v20, v21, v22, v23, v24, (uint64_t)a3);
  }
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (id)objc_msgSend_animationFromWorld_(a1, v25, (uint64_t)v18, v26);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (id)objc_msgSend_animationWithCAAnimation_(VFXAnimation, v28, (uint64_t)v18, v29);
    }
  }
  return v18;
}

+ (id)animationWithCAAnimation:(id)a3
{
  uint64_t v4 = [VFXAnimation alloc];
  uint64_t v7 = objc_msgSend_initWithCAAnimation_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  if (self->_animationRef || (uint64_t v16 = objc_msgSend_caAnimation(self, a2, (uint64_t)a3, v4)) == 0)
  {
LABEL_2:
    objc_msgSend_duration(self, a2, (uint64_t)a3, v4);
    if (v14 == 0.0)
    {
      if (a4 == 0.0)
      {
        sub_1B63F2F54(0, @"Warning: default duration is zero - using default transaction duration", v8, v9, v10, v11, v12, v13, v28);
        a4 = 0.25;
      }
      objc_msgSend_setDuration_(self, v7, v8, v9, a4);
    }
    return;
  }
  uint64_t v17 = sub_1B6500008(v16, a3);
  if (v17)
  {
    objc_msgSend__setAnimationRef_(self, v18, (uint64_t)v17, v20);
    objc_msgSend__syncObjCModel(self, v25, v26, v27);
    goto LABEL_2;
  }

  sub_1B63F2F54(16, @"Error: failed to convert CAAnimation to VFXAnimation", v19, v20, v21, v22, v23, v24, v30);
}

- (id)userAnimation
{
  if (*((void *)self + 17)) {
    return (id)*((void *)self + 17);
  }
  return self;
}

- (CAAnimation)caAnimation
{
  BOOL didMutate = self->_didMutate;
  self->_BOOL didMutate = 0;
  userAnimation = (CAAnimation *)self->_userAnimation;
  if (didMutate || userAnimation == 0)
  {
    objc_sync_enter(self);
    userAnimation = (CAAnimation *)self->_caAnimationCache;
    objc_sync_exit(self);
    if (didMutate || userAnimation == 0)
    {
      animationRef = self->_animationRef;
      if (animationRef)
      {
        userAnimation = (CAAnimation *)sub_1B6500244(animationRef);
      }
      else
      {
        id v15 = self->_userAnimation;
        if (!v15)
        {
          sub_1B63F2F54(16, @"Unreachable code: VFXAnimation to CAAnimation: no animation data", v7, v8, v9, v10, v11, v12, v89);
          return 0;
        }
        userAnimation = (CAAnimation *)(id)objc_msgSend_copy(v15, v6, v7, v8);
        objc_msgSend_duration(self, v16, v17, v18);
        objc_msgSend_setDuration_(userAnimation, v19, v20, v21);
        objc_msgSend_repeatCount(self, v22, v23, v24);
        objc_msgSend_setRepeatCount_(userAnimation, v25, v26, v27);
        uint64_t v31 = objc_msgSend_autoreverses(self, v28, v29, v30);
        objc_msgSend_setAutoreverses_(userAnimation, v32, v31, v33);
        objc_msgSend_beginTime(self, v34, v35, v36);
        objc_msgSend_setBeginTime_(userAnimation, v37, v38, v39);
        objc_msgSend_timeOffset(self, v40, v41, v42);
        objc_msgSend_setTimeOffset_(userAnimation, v43, v44, v45);
        objc_msgSend_fadeInDuration(self, v46, v47, v48);
        objc_msgSend_setFadeInDuration_(userAnimation, v49, v50, v51);
        objc_msgSend_fadeOutDuration(self, v52, v53, v54);
        objc_msgSend_setFadeOutDuration_(userAnimation, v55, v56, v57);
        uint64_t isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(self, v58, v59, v60);
        objc_msgSend_setRemovedOnCompletion_(userAnimation, v62, isRemovedOnCompletion, v63);
        uint64_t isAppliedOnCompletion = objc_msgSend_isAppliedOnCompletion(self, v64, v65, v66);
        objc_msgSend_setCommitsOnCompletion_(userAnimation, v68, isAppliedOnCompletion, v69);
        int v73 = objc_msgSend_fillsForward(self, v70, v71, v72);
        int v77 = objc_msgSend_fillsBackward(self, v74, v75, v76);
        uint64_t v80 = (uint64_t *)MEMORY[0x1E4F39FA0];
        if (!v73) {
          uint64_t v80 = (uint64_t *)MEMORY[0x1E4F39F98];
        }
        uint64_t v81 = (uint64_t *)MEMORY[0x1E4F39FA8];
        if (!v73) {
          uint64_t v81 = (uint64_t *)MEMORY[0x1E4F39FB0];
        }
        if (!v77) {
          uint64_t v80 = v81;
        }
        objc_msgSend_setFillMode_(userAnimation, v78, *v80, v79);
        uint64_t v85 = objc_msgSend_animationEvents(self, v82, v83, v84);
        objc_msgSend_setAnimationEvents_(userAnimation, v86, v85, v87);
      }
      objc_sync_enter(self);

      self->_caAnimationCache = userAnimation;
      objc_sync_exit(self);
    }
  }
  return userAnimation;
}

- (void)__CFObject
{
  return self->_animationRef;
}

- (void)setKeyPath:(id)a3
{
  self->_keyPath = (NSString *)objc_msgSend_copy(a3, v5, v6, v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_setKeyPath_(self->_userAnimation, v8, (uint64_t)self->_keyPath, v9);
  }
  if (self->_animationRef)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B65030CC;
    v10[3] = &unk_1E6141230;
    v10[4] = a3;
    v10[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, 0, (uint64_t)self, v10);
  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)duration
{
  return self->_duration;
}

- (void)_didMutate
{
  self->_BOOL didMutate = 1;
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B65031FC;
      v8[3] = &unk_1E61412A8;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  if (self->_repeatCount != a3)
  {
    self->_repeatCount = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B65032D0;
      v8[3] = &unk_1E6141208;
      v8[4] = self;
      float v9 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)repeatDuration
{
  objc_msgSend_duration(self, a2, v2, v3);
  double v6 = v5;
  objc_msgSend_repeatCount(self, v7, v8, v9);
  float result = v6 * v10;
  if (self->_autoreverses) {
    return result + result;
  }
  return result;
}

- (void)setRepeatDuration:(float)a3
{
  if (a3 != 0.0)
  {
    double duration = self->_duration;
    if (duration != 0.0)
    {
      double v6 = a3 / duration;
      *(float *)&double v6 = v6;
      if (self->_autoreverses) {
        *(float *)&double v6 = *(float *)&v6 * 0.5;
      }
      objc_msgSend_setRepeatCount_(self, a2, v3, v4, v6);
    }
  }
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  if (self->_timeOffset != a3)
  {
    self->_timeOffset = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B6503430;
      v8[3] = &unk_1E61412A8;
      v8[4] = self;
      *(double *)&void v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  if (self->_beginTime != a3)
  {
    self->_beginTime = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B6503500;
      v8[3] = &unk_1E61412A8;
      v8[4] = self;
      *(double *)&void v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setAutoreverses:(BOOL)a3
{
  if (self->_autoreverses != a3)
  {
    self->_autoreverses = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B65035C8;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)fillsForward
{
  return self->_fillForward;
}

- (void)setFillsForward:(BOOL)a3
{
  if (self->_fillForward != a3)
  {
    self->_fillForward = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6503690;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)fillsBackward
{
  return self->_fillBackward;
}

- (void)setFillsBackward:(BOOL)a3
{
  if (self->_fillBackward != a3)
  {
    self->_fillBackward = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6503794;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (VFXTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  timingFunction = self->_timingFunction;
  if (timingFunction != a3)
  {

    self->_timingFunction = (VFXTimingFunction *)a3;
    objc_msgSend__didMutate(self, v6, v7, v8);
    if (self->_animationRef)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1B65038A0;
      v10[3] = &unk_1E6141230;
      v10[4] = a3;
      v10[5] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, 0, (uint64_t)self, v10);
    }
  }
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  if (self->_removedOnCompletion != a3)
  {
    self->_removedOnCompletion = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6503998;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)isAppliedOnCompletion
{
  return self->_applyOnCompletion;
}

- (void)setAppliedOnCompletion:(BOOL)a3
{
  if (self->_applyOnCompletion != a3)
  {
    self->_applyOnCompletion = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6503A60;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (id)animationDidStart
{
  return self->_animationDidStart;
}

- (void)setAnimationDidStart:(id)a3
{
  id animationDidStart = self->_animationDidStart;
  if (animationDidStart) {
    _Block_release(animationDidStart);
  }
  self->_id animationDidStart = 0;
  if (a3) {
    self->_id animationDidStart = _Block_copy(a3);
  }
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1B6503B30;
    v6[3] = &unk_1E61411E0;
    v6[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v6);
  }
}

- (id)animationDidStop
{
  return self->_animationDidStop;
}

- (void)setAnimationDidStop:(id)a3
{
  id animationDidStop = self->_animationDidStop;
  if (animationDidStop) {
    _Block_release(animationDidStop);
  }
  self->_id animationDidStop = 0;
  if (a3) {
    self->_id animationDidStop = _Block_copy(a3);
  }
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1B6503D28;
    v6[3] = &unk_1E61411E0;
    v6[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v6);
  }
}

- (NSArray)animationEvents
{
  return self->_animationEvents;
}

- (void)setAnimationEvents:(id)a3
{
  animationEvents = self->_animationEvents;
  if (animationEvents != a3)
  {

    self->_animationEvents = (NSArray *)a3;
    objc_msgSend__didMutate(self, v6, v7, v8);
    if (self->_animationRef)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1B6504174;
      v10[3] = &unk_1E6141230;
      v10[4] = self;
      v10[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, 0, (uint64_t)self, v10);
    }
  }
}

- (void)setFadeInDuration:(float)a3
{
}

- (float)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)blendInDuration
{
  return self->_fadeInDuration;
}

- (void)setBlendInDuration:(double)a3
{
  if (self->_fadeInDuration != a3)
  {
    self->_fadeInDuration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B6504284;
      v8[3] = &unk_1E61412A8;
      v8[4] = self;
      *(double *)&void v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(float)a3
{
}

- (double)blendOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setBlendOutDuration:(double)a3
{
  if (self->_fadeOutDuration != a3)
  {
    self->_fadeOutDuration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1B650436C;
      v8[3] = &unk_1E61412A8;
      v8[4] = self;
      *(double *)&void v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (void)setAdditive:(BOOL)a3
{
  if (self->_additive != a3)
  {
    self->_additive = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6504438;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)isCumulative
{
  return self->_cumulative;
}

- (void)setCumulative:(BOOL)a3
{
  if (self->_cumulative != a3)
  {
    self->_cumulative = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1B6504554;
      v7[3] = &unk_1E6141190;
      v7[4] = self;
      BOOL v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  userInfo = self->_userInfo;
  if (a3 && !userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_userInfo = userInfo;
LABEL_5:
    objc_msgSend_setValue_forKey_(userInfo, v8, (uint64_t)a3, (uint64_t)a4);
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_5;
  }
  objc_msgSend_removeObjectForKey_(userInfo, v8, (uint64_t)a4, v9);
LABEL_7:

  os_unfair_lock_unlock(p_userInfoLock);
}

- (id)valueForUndefinedKey:(id)a3
{
  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  id v8 = (id)objc_msgSend_valueForKey_(self->_userInfo, v6, (uint64_t)a3, v7);
  os_unfair_lock_unlock(p_userInfoLock);

  return v8;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  float duration = self->_duration;
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v7, @"<%@: %p, keyPath=%@ duration=%f repeatCount=%f>", v8, v5, self, self->_keyPath, duration, self->_repeatCount);
}

- (void)_optimizeKeyframesWithTarget:(id)a3
{
  objc_msgSend_prepareWithTarget_implicitDuration_(self, a2, (uint64_t)a3, v3, 0.0);
  animationRef = self->_animationRef;
  if (animationRef)
  {
    sub_1B6504788(animationRef);
    self->_BOOL didMutate = 1;

    self->_userAnimation = 0;
  }
  else
  {
    sub_1B63F2F54(0, @"Warning: failed to optimize keyframes", v5, v6, v7, v8, v9, v10, v13);
  }
}

- (id)subAnimations
{
  animationRef = self->_animationRef;
  if (!animationRef) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(animationRef);
  if (v4 != sub_1B6540E1C()) {
    return 0;
  }
  uint64_t v12 = self->_animationRef;
  CFIndex v13 = sub_1B6541028((uint64_t)v12, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v22 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v14, v13, v15);
  if (v13 >= 1)
  {
    for (CFIndex i = 0; i != v13; ++i)
    {
      uint64_t v24 = sub_1B6541084((uint64_t)v12, i, v16, v17, v18, v19, v20, v21);
      uint64_t v32 = sub_1B6494038(v24, v25, v26, v27, v28, v29, v30, v31);
      uint64_t v35 = objc_msgSend_animationWithCFXAnimation_(VFXAnimation, v33, (uint64_t)v32, v34);
      objc_msgSend_addObject_(v22, v36, v35, v37);
      CFRelease(v32);
    }
  }
  return v22;
}

@end