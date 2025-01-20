@interface VFXKeyframeAnimation
+ (BOOL)supportsSecureCoding;
- (BOOL)autoreverses;
- (BOOL)commitsOnCompletion;
- (BOOL)isAdditive;
- (BOOL)isCumulative;
- (BOOL)isRemovedOnCompletion;
- (__CFXKeyframedAnimation)cfxAnimation;
- (double)duration;
- (double)repeatDuration;
- (double)timeOffset;
- (float)fadeInDuration;
- (float)fadeOutDuration;
- (float)repeatCount;
- (float)speed;
- (id)animationEvents;
- (id)biasValues;
- (id)continuityValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fillMode;
- (id)keyPath;
- (id)keyTimes;
- (id)tensionValues;
- (id)timingFunction;
- (id)timingFunctions;
- (id)values;
- (void)_clearCFXCache;
- (void)_convertToCA;
- (void)dealloc;
- (void)setAdditive:(BOOL)a3;
- (void)setAnimationEvents:(id)a3;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBiasValues:(id)a3;
- (void)setCfxAnimation:(__CFXKeyframedAnimation *)a3;
- (void)setCommitsOnCompletion:(BOOL)a3;
- (void)setContinuityValues:(id)a3;
- (void)setCumulative:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(float)a3;
- (void)setFadeOutDuration:(float)a3;
- (void)setFillMode:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setKeyTimes:(id)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setSpeed:(float)a3;
- (void)setTensionValues:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTimingFunctions:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation VFXKeyframeAnimation

- (void)dealloc
{
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
  {
    CFRelease(cfxAnimation);
    self->_cfxAnimation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v4 dealloc];
}

- (void)_convertToCA
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  self->_caReady = 1;
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
  {
    v150 = self;
    CFTypeRef v152 = CFRetain(cfxAnimation);
    uint64_t v11 = sub_1B6437F0C((uint64_t)v152, v4, v5, v6, v7, v8, v9, v10);
    unsigned int v151 = sub_1B6425780(v11, v12, v13, v14, v15, v16, v17, v18);
    unsigned int v26 = sub_1B6425734(v11, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v27 = v26;
    v30 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v28, v26, v29);
    v33 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v31, v26, v32);
    BOOL v34 = sub_1B64263A4(v11);
    if (v26) {
      BOOL v35 = !v34;
    }
    else {
      BOOL v35 = 1;
    }
    if (!v35)
    {
      unsigned int v36 = 0;
      do
      {
        float v37 = sub_1B64263C4(v11, v36);
        float v38 = sub_1B64263D0(v11, v36);
        float v39 = sub_1B64263DC(v11, v36);
        uint64_t v43 = objc_msgSend_numberWithDouble_(NSNumber, v40, v41, v42, v37);
        objc_msgSend_addObject_(0, v44, v43, v45);
        uint64_t v49 = objc_msgSend_numberWithDouble_(NSNumber, v46, v47, v48, v38);
        objc_msgSend_addObject_(0, v50, v49, v51);
        uint64_t v55 = objc_msgSend_numberWithDouble_(NSNumber, v52, v53, v54, v39);
        objc_msgSend_addObject_(0, v56, v55, v57);
        ++v36;
      }
      while (v27 != v36);
    }
    memset(__dst, 0, sizeof(__dst));
    BOOL v58 = sub_1B64263E8(v11);
    if (v27 && v58)
    {
      uint64_t v66 = 0;
      char v67 = 1;
      double v68 = 0.0;
      do
      {
        double v153 = v68;
        v69 = (double *)sub_1B642641C(v11, v66);
        v70 = (double *)sub_1B6426408(v11, v66);
        if ((v67 & 1) == 0)
        {
          LODWORD(v71) = HIDWORD(v153);
          LODWORD(v72) = HIDWORD(*(void *)v69);
          uint64_t v73 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x1E4F39C10], v59, v60, v61, v153, v71, *v69, v72);
          objc_msgSend_addObject_(0, v74, v73, v75);
        }
        char v67 = 0;
        double v68 = *v70;
        ++v66;
      }
      while (v27 != v66);
    }
    *(float *)&double v83 = sub_1B6492D84((uint64_t)v152, (uint64_t)v59, v60, v61, v62, v63, v64, v65);
    if (v27)
    {
      unsigned int v84 = 0;
      if (*(float *)&v83 == 0.0) {
        *(float *)&double v83 = 1.0;
      }
      double v85 = *(float *)&v83;
      while (1)
      {
        double v86 = sub_1B64257CC(v11, v84, v77, v78, v79, v80, v81, v82);
        sub_1B6425838(v11, v84, __dst, v87, v88, v89, v90, v91);
        uint64_t v95 = objc_msgSend_numberWithDouble_(NSNumber, v92, v93, v94, v86 / v85);
        objc_msgSend_addObject_(v30, v96, v95, v97);
        uint64_t v101 = sub_1B6604BA0((double *)__dst, (const char *)v151, v100, v98, v99);
        if (!v101) {
          break;
        }
        objc_msgSend_addObject_(v33, v102, v101, v103);
        if (v27 == ++v84) {
          goto LABEL_20;
        }
      }
      v104 = v150;

      goto LABEL_29;
    }
LABEL_20:
    v104 = v150;
    objc_msgSend_setKeyTimes_(v150, v76, (uint64_t)v30, v78, v83);
    objc_msgSend_setValues_(v150, v105, (uint64_t)v33, v106);
    objc_msgSend_setContinuityValues_(v150, v107, 0, v108);
    objc_msgSend_setTensionValues_(v150, v109, 0, v110);
    objc_msgSend_setBiasValues_(v150, v111, 0, v112);
    objc_msgSend_setTimingFunctions_(v150, v113, 0, v114);
    unsigned int v122 = sub_1B6425CD0(v11, v115, v116, v117, v118, v119, v120, v121);
    if (sub_1B6425C1C(v11, v123, v124, v125, v126, v127, v128, v129) == 1)
    {
      v137 = (uint64_t *)MEMORY[0x1E4F39D90];
      if (v122 == 2) {
        v137 = (uint64_t *)MEMORY[0x1E4F39D70];
      }
    }
    else
    {
      if (v122 > 2)
      {
LABEL_27:
        double v138 = sub_1B6425514(v11, (uint64_t)v130, v131, v132, v133, v134, v135, v136);
        objc_msgSend_setDuration_(v150, v139, v140, v141, v138);
        sub_1B650650C(v150, (uint64_t)v152, v142, v143, v144, v145, v146, v147);
LABEL_29:
        objc_msgSend_setCfxAnimation_(v104, v148, (uint64_t)v152, v149);
        CFRelease(v152);
        return;
      }
      v137 = (uint64_t *)qword_1E61437A8[v122];
    }
    objc_msgSend_setCalculationMode_(v150, v130, *v137, v132);
    goto LABEL_27;
  }
}

- (void)_clearCFXCache
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation) {
    CFRelease(cfxAnimation);
  }
  self->_cfxAnimation = 0;
}

- (id)values
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 values];
}

- (void)setValues:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setValues:a3];
}

- (id)keyTimes
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 keyTimes];
}

- (void)setKeyTimes:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setKeyTimes:a3];
}

- (id)timingFunctions
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 timingFunctions];
}

- (void)setTimingFunctions:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setTimingFunctions:a3];
}

- (id)tensionValues
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 tensionValues];
}

- (void)setTensionValues:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setTensionValues:a3];
}

- (id)continuityValues
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 continuityValues];
}

- (void)setContinuityValues:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setContinuityValues:a3];
}

- (id)biasValues
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return [(VFXKeyframeAnimation *)&v6 biasValues];
}

- (void)setBiasValues:(id)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 setBiasValues:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_caReady || !self->_cfxAnimation)
  {
    v28.receiver = self;
    v28.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v28 copyWithZone:a3];
  }
  else
  {
    id v4 = objc_alloc_init((Class)objc_opt_class());
    uint64_t v12 = sub_1B6494038(self->_cfxAnimation, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend_setCfxAnimation_(v4, v13, (uint64_t)v12, v14);
    CFRelease(v12);
    uint64_t v18 = objc_msgSend_keyPath(self, v15, v16, v17);
    objc_msgSend_setKeyPath_(v4, v19, v18, v20);
    uint64_t v24 = objc_msgSend_delegate(self, v21, v22, v23);
    objc_msgSend_setDelegate_(v4, v25, v24, v26);
  }
  return v4;
}

- (id)description
{
  if (self->_caReady)
  {
    v15.receiver = self;
    v15.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v15 description];
  }
  else
  {
    uint64_t v6 = NSString;
    objc_msgSend_duration(self, a2, v2, v3);
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_keyPath(self, v9, v10, v11);
    return (id)objc_msgSend_stringWithFormat_(v6, v13, @"VFXKeyframeAnimation %p (duration=%f, keyPath:%@)", v14, self, v8, v12);
  }
}

- (__CFXKeyframedAnimation)cfxAnimation
{
  return self->_cfxAnimation;
}

- (void)setCfxAnimation:(__CFXKeyframedAnimation *)a3
{
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation != a3)
  {
    if (cfxAnimation)
    {
      CFRelease(cfxAnimation);
      self->_cfxAnimation = 0;
    }
    if (a3) {
      uint64_t v6 = (__CFXKeyframedAnimation *)CFRetain(a3);
    }
    else {
      uint64_t v6 = 0;
    }
    self->_cfxAnimation = v6;
  }
}

- (void)setDuration:(double)a3
{
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
    {
      float v13 = a3;
      sub_1B6492D2C((uint64_t)cfxAnimation, v13, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v15 setDuration:a3];
    return;
  }
  float v14 = a3;

  sub_1B6492D2C((uint64_t)cfxAnimation, v14, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
}

- (double)duration
{
  if (self->_cfxAnimation) {
    return sub_1B6492D84((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v9 duration];
  return result;
}

- (void)setKeyPath:(id)a3
{
  if (!self->_cfxAnimation) {
    goto LABEL_5;
  }
  CFStringRef v5 = sub_1B63CC80C((const __CFString *)a3);
  sub_1B6492CA0((uint64_t)self->_cfxAnimation, v5);
  if (v5) {
    CFRelease(v5);
  }
  if (self->_caReady)
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v6 setKeyPath:a3];
  }
}

- (id)keyPath
{
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation && (CFArrayRef v4 = (const __CFArray *)sub_1B6492CF4((uint64_t)cfxAnimation)) != 0)
  {
    CFArrayRef v5 = sub_1B63CC828(v4);
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v7 keyPath];
  }
}

- (void)setRepeatCount:(float)a3
{
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation) {
    sub_1B6492E68((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  }
  if (self->_caReady)
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXKeyframeAnimation;
    *(float *)&double v12 = a3;
    [(VFXKeyframeAnimation *)&v13 setRepeatCount:v12];
  }
}

- (float)repeatCount
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B6492EC0((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v10 repeatCount];
  }
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  if (self->_cfxAnimation) {
    objc_msgSend__clearCFXCache(self, a2, v3, v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v7 setRepeatDuration:a3];
}

- (double)repeatDuration
{
  if (!self->_caReady) {
    objc_msgSend__convertToCA(self, a2, v2, v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  [(VFXKeyframeAnimation *)&v6 repeatDuration];
  return result;
}

- (void)setAutoreverses:(BOOL)a3
{
  BOOL v8 = a3;
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6492F0C((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v12 setAutoreverses:v8];
    return;
  }

  sub_1B6492F0C((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)autoreverses
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B6492F68((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v10 autoreverses];
  }
}

- (void)setTimeOffset:(double)a3
{
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6493368((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v13.receiver = self;
    v13.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v13 setTimeOffset:a3];
    return;
  }

  sub_1B6493368((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
}

- (double)timeOffset
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64933C0((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v10 timeOffset];
  }
  return result;
}

- (void)setSpeed:(float)a3
{
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B649340C((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)VFXKeyframeAnimation;
    *(float *)&double v13 = a3;
    [(VFXKeyframeAnimation *)&v14 setSpeed:v13];
    return;
  }

  sub_1B649340C((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
}

- (float)speed
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B6493464((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v10 speed];
  }
  return result;
}

- (void)setFadeInDuration:(float)a3
{
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B64934B0((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)VFXKeyframeAnimation;
    *(float *)&double v13 = a3;
    [(CAAnimation *)&v14 setFadeInDuration:v13];
    return;
  }

  sub_1B64934B0((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
}

- (float)fadeInDuration
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B6493508((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    [(CAAnimation *)&v10 fadeInDuration];
  }
  return result;
}

- (void)setFadeOutDuration:(float)a3
{
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6493554((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)VFXKeyframeAnimation;
    *(float *)&double v13 = a3;
    [(CAAnimation *)&v14 setFadeOutDuration:v13];
    return;
  }

  sub_1B6493554((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
}

- (float)fadeOutDuration
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64935AC((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    [(CAAnimation *)&v10 fadeOutDuration];
  }
  return result;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  BOOL v8 = a3;
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6493240((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v12 setRemovedOnCompletion:v8];
    return;
  }

  sub_1B6493240((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)isRemovedOnCompletion
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64931F0((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v10 isRemovedOnCompletion];
  }
}

- (void)setCommitsOnCompletion:(BOOL)a3
{
  BOOL v8 = a3;
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B64935F8(cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)VFXKeyframeAnimation;
    [(CAAnimation *)&v12 setCommitsOnCompletion:v8];
    return;
  }

  sub_1B64935F8(cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)commitsOnCompletion
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64936B8((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    return [(CAAnimation *)&v10 commitsOnCompletion];
  }
}

- (void)setFillMode:(id)a3
{
  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      char v7 = sub_1B64FEBBC((uint64_t)a3, a2, (uint64_t)a3, v3);
      sub_1B64939EC((uint64_t)cfxAnimation, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v21.receiver = self;
    v21.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v21 setFillMode:a3];
    return;
  }
  char v14 = sub_1B64FEBBC((uint64_t)a3, a2, (uint64_t)a3, v3);

  sub_1B64939EC((uint64_t)cfxAnimation, v14, v15, v16, v17, v18, v19, v20);
}

- (id)fillMode
{
  if (self->_cfxAnimation)
  {
    int v8 = sub_1B649399C((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    return (id)sub_1B64FECAC(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v17 fillMode];
  }
}

- (void)setAnimationEvents:(id)a3
{
  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      uint64_t v7 = sub_1B64FEE18(a3, a2, (uint64_t)a3, v3);
      sub_1B6493868((uint64_t)cfxAnimation, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    objc_super v21 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
    v22.receiver = self;
    v22.super_class = (Class)VFXKeyframeAnimation;
    [(CAAnimation *)&v22 setAnimationEvents:v21];

    return;
  }
  uint64_t v14 = sub_1B64FEE18(a3, a2, (uint64_t)a3, v3);

  sub_1B6493868((uint64_t)cfxAnimation, v14, v15, v16, v17, v18, v19, v20);
}

- (id)animationEvents
{
  if (self->_cfxAnimation)
  {
    uint64_t v8 = sub_1B649381C((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    return sub_1B64FEFC8(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXKeyframeAnimation;
    return [(CAAnimation *)&v17 animationEvents];
  }
}

- (void)setTimingFunction:(id)a3
{
  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      id v6 = sub_1B64BA090(a3, a2);
      sub_1B6492FB8((uint64_t)cfxAnimation, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v20.receiver = self;
    v20.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v20 setTimingFunction:a3];
    return;
  }
  id v13 = sub_1B64BA090(a3, a2);

  sub_1B6492FB8((uint64_t)cfxAnimation, v13, v14, v15, v16, v17, v18, v19);
}

- (id)timingFunction
{
  if (self->_cfxAnimation)
  {
    id result = (id)sub_1B6493034((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    if (result)
    {
      return (id)sub_1B64BA118((uint64_t)result, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v16 timingFunction];
  }
  return result;
}

- (void)setAdditive:(BOOL)a3
{
  BOOL v8 = a3;
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6493080((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v12 setAdditive:v8];
    return;
  }

  sub_1B6493080((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)isAdditive
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64931A0((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v10 isAdditive];
  }
}

- (void)setCumulative:(BOOL)a3
{
  BOOL v8 = a3;
  BOOL caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation) {
      sub_1B6493138((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    }
    goto LABEL_8;
  }
  if (!cfxAnimation)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)VFXKeyframeAnimation;
    [(VFXKeyframeAnimation *)&v12 setCumulative:v8];
    return;
  }

  sub_1B6493138((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)isCumulative
{
  if (self->_cfxAnimation)
  {
    cfxAnimation = self->_cfxAnimation;
    return sub_1B64930E8((uint64_t)cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXKeyframeAnimation;
    return [(VFXKeyframeAnimation *)&v10 isCumulative];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end