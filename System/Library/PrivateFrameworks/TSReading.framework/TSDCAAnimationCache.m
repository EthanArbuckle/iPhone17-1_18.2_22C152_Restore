@interface TSDCAAnimationCache
- (BOOL)anchorPointAnimationExists;
- (BOOL)anchorPointZAnimationExists;
- (BOOL)borderColorAnimationExists;
- (BOOL)borderWidthAnimationExists;
- (BOOL)boundsAnimationExists;
- (BOOL)contentsAnimationExists;
- (BOOL)doubleSidedAnimationExists;
- (BOOL)doubleSidedCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (BOOL)doubleSidedInitialValue;
- (BOOL)hiddenAnimationExists;
- (BOOL)hiddenCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (BOOL)hiddenInitialValue;
- (BOOL)opacityAnimationExists;
- (BOOL)p_setupAndCacheAnimationValues:(BOOL)a3 verifyOnly:(BOOL)a4;
- (BOOL)positionAnimationExists;
- (BOOL)transformAnimationExists;
- (BOOL)transformRotationAnimationExists;
- (BOOL)transformRotationXAnimationExists;
- (BOOL)transformRotationYAnimationExists;
- (BOOL)transformRotationZAnimationExists;
- (BOOL)transformScaleXAnimationExists;
- (BOOL)transformScaleXYAnimationExists;
- (BOOL)transformScaleYAnimationExists;
- (BOOL)transformTranslationAnimationExists;
- (BOOL)transformTranslationXAnimationExists;
- (BOOL)transformTranslationYAnimationExists;
- (BOOL)transformTranslationZAnimationExists;
- (BOOL)verifyCache;
- (BOOL)zPositionAnimationExists;
- (CAAnimation)animation;
- (CALayer)layer;
- (CATransform3D)transformCachedValueAtTime:(SEL)a3 layer:(double)a4 animation:(id)a5;
- (CATransform3D)transformInitialValue;
- (CGColor)borderColorInitialValue;
- (CGImage)contentsInitialValue;
- (CGPoint)anchorPointCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (CGPoint)anchorPointInitialValue;
- (CGPoint)positionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (CGPoint)positionInitialValue;
- (CGPoint)transformTranslationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (CGPoint)transformTranslationInitialValue;
- (CGRect)boundsCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (CGRect)boundsInitialValue;
- (NSDictionary)initialValues;
- (TSDCAAnimationCache)initWithLayer:(id)a3 animation:(id)a4 overrideInitialValues:(id)a5 cacheAnimationValues:(BOOL)a6;
- (double)anchorPointZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)anchorPointZInitialValue;
- (double)borderWidthCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)borderWidthInitialValue;
- (double)opacityCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)opacityInitialValue;
- (double)transformRotationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformRotationInitialValue;
- (double)transformRotationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformRotationXInitialValue;
- (double)transformRotationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformRotationYInitialValue;
- (double)transformRotationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformRotationZInitialValue;
- (double)transformScaleXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformScaleXInitialValue;
- (double)transformScaleXYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformScaleXYInitialValue;
- (double)transformScaleYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformScaleYInitialValue;
- (double)transformTranslationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformTranslationXInitialValue;
- (double)transformTranslationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformTranslationYInitialValue;
- (double)transformTranslationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)transformTranslationZInitialValue;
- (double)zPositionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5;
- (double)zPositionInitialValue;
- (void)dealloc;
@end

@implementation TSDCAAnimationCache

- (BOOL)p_setupAndCacheAnimationValues:(BOOL)a3 verifyOnly:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v226[1] = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if ([(TSDCAAnimationCache *)self animation])
  {
    [(TSDCAAnimationCache *)self animation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v9 = [(TSDCAAnimationCache *)self animation];
    if (isKindOfClass)
    {
      uint64_t v10 = [(CAAnimation *)v9 animations];
    }
    else
    {
      v226[0] = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v226 count:1];
    }
    v11 = (void *)v10;
  }
  else
  {
    v11 = 0;
  }
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v220 objects:v225 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v221;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v221 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v220 + 1) + 8 * i), "keyPath"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v220 objects:v225 count:16];
    }
    while (v13);
  }
  BOOL v205 = v5;
  v206 = v7;
  v16 = (NSDictionary *)objc_opt_new();
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  v17 = objc_msgSend(MEMORY[0x263F15748], "TSD_supportedKeyPaths");
  uint64_t v18 = [v17 countByEnumeratingWithState:&v216 objects:v224 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 1;
    uint64_t v21 = *(void *)v217;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v217 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v216 + 1) + 8 * j);
        id v24 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:v23];
        if (v24
          || (id v24 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:v23]) != 0)
        {
          [(NSDictionary *)v16 setObject:v24 forKeyedSubscript:v23];
        }
        if (v4)
        {
          id v25 = [(NSDictionary *)[(TSDCAAnimationCache *)self initialValues] objectForKeyedSubscript:v23];
          if (([v24 isEqual:v25] & 1) == 0)
          {
            v207 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v26 = v19;
            uint64_t v27 = v21;
            v28 = v16;
            BOOL v29 = v4;
            v30 = v17;
            v31 = self;
            uint64_t v32 = [NSString stringWithUTF8String:"-[TSDCAAnimationCache p_setupAndCacheAnimationValues:verifyOnly:]"];
            uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"];
            uint64_t v34 = v32;
            self = v31;
            v17 = v30;
            BOOL v4 = v29;
            v16 = v28;
            uint64_t v21 = v27;
            uint64_t v19 = v26;
            [v207 handleFailureInFunction:v34, v33, 645, @"Initial value not equal! Current:%@, Cached:%@", v24, v25 file lineNumber description];
            char v20 = 0;
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v216 objects:v224 count:16];
    }
    while (v19);
    if (v4) {
      goto LABEL_28;
    }
  }
  else
  {
    char v20 = 1;
    if (v4)
    {
LABEL_28:

      v35 = v206;
      goto LABEL_253;
    }
  }
  v35 = v206;
  if (v205)
  {
    [(CAAnimation *)self->_animation duration];
    self->_int64_t cacheValuesCount = (uint64_t)(ceil(v36 * 600.0) + 1.0);
  }
  self->_initialValues = v16;
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"anchorPoint"])
  {
    id v37 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"anchorPoint"];
  }
  else
  {
    id v37 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"anchorPoint"];
  }
  [v37 CGPointValue];
  self->_anchorPointInitialValue.x = v38;
  self->_anchorPointInitialValue.y = v39;
  int v40 = [v206 containsObject:@"anchorPoint"];
  self->_anchorPointAnimationExists = v40;
  if (v205)
  {
    if (v40)
    {
      self->_anchorPointCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x2B011792uLL);
      int64_t cacheValuesCount = self->_cacheValuesCount;
      if (cacheValuesCount >= 1)
      {
        uint64_t v42 = 0;
        for (uint64_t k = 0; k < cacheValuesCount; ++k)
        {
          v44 = &self->_anchorPointCache[v42];
          double v45 = (double)k / (double)(cacheValuesCount - 2);
          if (v45 > 1.0) {
            double v45 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"anchorPoint", self, v45 * self->_animationDuration), "CGPointValue");
          v44->x = v46;
          v44->y = v47;
          int64_t cacheValuesCount = self->_cacheValuesCount;
          ++v42;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"anchorPointZ"])
  {
    id v48 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"anchorPointZ"];
  }
  else
  {
    id v48 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"anchorPointZ"];
  }
  [v48 doubleValue];
  self->_anchorPointZInitialValue = v49;
  int v50 = [v206 containsObject:@"anchorPointZ"];
  self->_anchorPointZAnimationExists = v50;
  if (v205)
  {
    if (v50)
    {
      self->_anchorPointZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9151739FuLL);
      int64_t v51 = self->_cacheValuesCount;
      if (v51 >= 1)
      {
        for (uint64_t m = 0; m < v51; ++m)
        {
          double v53 = (double)m / (double)(v51 - 2);
          if (v53 > 1.0) {
            double v53 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"anchorPointZ", self, v53 * self->_animationDuration), "doubleValue");
          self->_anchorPointZCache[m] = v54;
          int64_t v51 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"borderColor"])
  {
    v55 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"borderColor"];
  }
  else
  {
    v55 = (CGColor *)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"borderColor"];
  }
  self->_borderColorInitialValue = v55;
  self->_borderColorAnimationExists = [v206 containsObject:@"borderColor"];
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"borderWidth"])
  {
    id v56 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"borderWidth"];
  }
  else
  {
    id v56 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"borderWidth"];
  }
  [v56 doubleValue];
  self->_borderWidthInitialValue = v57;
  int v58 = [v206 containsObject:@"borderWidth"];
  self->_borderWidthAnimationExists = v58;
  if (v205)
  {
    if (v58)
    {
      self->_borderWidthCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xF876FCEDuLL);
      int64_t v59 = self->_cacheValuesCount;
      if (v59 >= 1)
      {
        for (uint64_t n = 0; n < v59; ++n)
        {
          double v61 = (double)n / (double)(v59 - 2);
          if (v61 > 1.0) {
            double v61 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"borderWidth", self, v61 * self->_animationDuration), "doubleValue");
          self->_borderWidthCache[n] = v62;
          int64_t v59 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"bounds"])
  {
    id v63 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"bounds"];
  }
  else
  {
    id v63 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"bounds"];
  }
  [v63 CGRectValue];
  self->_boundsInitialValue.origin.x = v64;
  self->_boundsInitialValue.origin.y = v65;
  self->_boundsInitialValue.size.width = v66;
  self->_boundsInitialValue.size.height = v67;
  int v68 = [v206 containsObject:@"bounds"];
  self->_boundsAnimationExists = v68;
  if (v205)
  {
    if (v68)
    {
      self->_boundsCache = (CGRect *)malloc_type_calloc(0x20uLL, self->_cacheValuesCount, 0xFF7426DEuLL);
      int64_t v69 = self->_cacheValuesCount;
      if (v69 >= 1)
      {
        uint64_t v70 = 0;
        for (iuint64_t i = 0; ii < v69; ++ii)
        {
          v72 = &self->_boundsCache[v70];
          double v73 = (double)ii / (double)(v69 - 2);
          if (v73 > 1.0) {
            double v73 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"bounds", self, v73 * self->_animationDuration), "CGRectValue");
          v72->origin.x = v74;
          v72->origin.y = v75;
          v72->size.width = v76;
          v72->size.height = v77;
          int64_t v69 = self->_cacheValuesCount;
          ++v70;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"contents"])
  {
    v78 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"contents"];
  }
  else
  {
    v78 = (CGImage *)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"contents"];
  }
  self->_contentsInitialValue = v78;
  self->_contentsAnimationExists = [v206 containsObject:@"contents"];
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"doubleSided"])
  {
    id v79 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"doubleSided"];
  }
  else
  {
    id v79 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"doubleSided"];
  }
  self->_doubleSidedInitialValue = [v79 BOOLValue];
  int v80 = [v206 containsObject:@"doubleSided"];
  self->_doubleSidedAnimationExists = v80;
  if (v205)
  {
    if (v80)
    {
      self->_doubleSidedCache = (BOOL *)malloc_type_calloc(1uLL, self->_cacheValuesCount, 0x5332C594uLL);
      int64_t v81 = self->_cacheValuesCount;
      if (v81 >= 1)
      {
        for (juint64_t j = 0; jj < v81; ++jj)
        {
          double v83 = (double)jj / (double)(v81 - 2);
          if (v83 > 1.0) {
            double v83 = 1.0;
          }
          self->_doubleSidedCache[jj] = objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"doubleSided", self, v83 * self->_animationDuration), "BOOLValue");
          int64_t v81 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"hidden"])
  {
    id v84 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"hidden"];
  }
  else
  {
    id v84 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"hidden"];
  }
  self->_hiddenInitialValue = [v84 BOOLValue];
  int v85 = [v206 containsObject:@"hidden"];
  self->_hiddenAnimationExists = v85;
  if (v205)
  {
    if (v85)
    {
      self->_hiddenCache = (BOOL *)malloc_type_calloc(1uLL, self->_cacheValuesCount, 0x21335BB9uLL);
      int64_t v86 = self->_cacheValuesCount;
      if (v86 >= 1)
      {
        for (kuint64_t k = 0; kk < v86; ++kk)
        {
          double v88 = (double)kk / (double)(v86 - 2);
          if (v88 > 1.0) {
            double v88 = 1.0;
          }
          self->_hiddenCache[kk] = objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"hidden", self, v88 * self->_animationDuration), "BOOLValue");
          int64_t v86 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"opacity"])
  {
    id v89 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"opacity"];
  }
  else
  {
    id v89 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"opacity"];
  }
  [v89 doubleValue];
  self->_opacityInitialValue = v90;
  int v91 = [v206 containsObject:@"opacity"];
  self->_opacityAnimationExists = v91;
  if (v205)
  {
    if (v91)
    {
      self->_opacityCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xE8ED81EEuLL);
      int64_t v92 = self->_cacheValuesCount;
      if (v92 >= 1)
      {
        for (muint64_t m = 0; mm < v92; ++mm)
        {
          double v94 = (double)mm / (double)(v92 - 2);
          if (v94 > 1.0) {
            double v94 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"opacity", self, v94 * self->_animationDuration), "doubleValue");
          self->_opacityCache[mm] = v95;
          int64_t v92 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"position"])
  {
    id v96 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"position"];
  }
  else
  {
    id v96 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"position"];
  }
  [v96 CGPointValue];
  self->_positionInitialValue.x = v97;
  self->_positionInitialValue.y = v98;
  int v99 = [v206 containsObject:@"position"];
  self->_positionAnimationExists = v99;
  if (v205)
  {
    if (v99)
    {
      self->_positionCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x8AA5F6DBuLL);
      int64_t v100 = self->_cacheValuesCount;
      if (v100 >= 1)
      {
        uint64_t v101 = 0;
        for (nuint64_t n = 0; nn < v100; ++nn)
        {
          v103 = &self->_positionCache[v101];
          double v104 = (double)nn / (double)(v100 - 2);
          if (v104 > 1.0) {
            double v104 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"position", self, v104 * self->_animationDuration), "CGPointValue");
          v103->x = v105;
          v103->y = v106;
          int64_t v100 = self->_cacheValuesCount;
          ++v101;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform"])
  {
    id v107 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform"];
    if (v107)
    {
LABEL_120:
      [v107 CATransform3DValue];
      goto LABEL_123;
    }
  }
  else
  {
    id v107 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform"];
    if (v107) {
      goto LABEL_120;
    }
  }
  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
LABEL_123:
  *(_OWORD *)&self->_transformInitialValue.m31 = v212;
  *(_OWORD *)&self->_transformInitialValue.m33 = v213;
  *(_OWORD *)&self->_transformInitialValue.m41 = v214;
  *(_OWORD *)&self->_transformInitialValue.m43 = v215;
  *(_OWORD *)&self->_transformInitialValue.m11 = v208;
  *(_OWORD *)&self->_transformInitialValue.m13 = v209;
  *(_OWORD *)&self->_transformInitialValue.m21 = v210;
  *(_OWORD *)&self->_transformInitialValue.m23 = v211;
  int v108 = [v206 containsObject:@"transform"];
  self->_transformAnimationExists = v108;
  if (v205)
  {
    if (v108)
    {
      self->_transformCache = (CATransform3D *)malloc_type_calloc(0x80uLL, self->_cacheValuesCount, 0xD7642468uLL);
      int64_t v109 = self->_cacheValuesCount;
      if (v109 >= 1)
      {
        uint64_t v110 = 0;
        for (uint64_t i1 = 0; i1 < v109; ++i1)
        {
          transformCache = self->_transformCache;
          double v113 = (double)i1 / (double)(v109 - 2);
          if (v113 > 1.0) {
            double v113 = 1.0;
          }
          id v114 = [(CAAnimation *)self->_animation TSD_valueForKeyPath:@"transform" atTime:self animationCache:v113 * self->_animationDuration];
          if (v114)
          {
            [v114 CATransform3DValue];
          }
          else
          {
            long long v214 = 0u;
            long long v215 = 0u;
            long long v212 = 0u;
            long long v213 = 0u;
            long long v210 = 0u;
            long long v211 = 0u;
            long long v208 = 0u;
            long long v209 = 0u;
          }
          p_m11 = (_OWORD *)&transformCache[v110].m11;
          p_m11[2] = v210;
          p_m11[3] = v211;
          _OWORD *p_m11 = v208;
          p_m11[1] = v209;
          p_m11[6] = v214;
          p_m11[7] = v215;
          p_m11[4] = v212;
          p_m11[5] = v213;
          int64_t v109 = self->_cacheValuesCount;
          ++v110;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation"])
  {
    id v116 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation"];
  }
  else
  {
    id v116 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.rotation"];
  }
  [v116 doubleValue];
  self->_transformRotationInitialValue = v117;
  int v118 = [v206 containsObject:@"transform.rotation"];
  self->_transformRotationAnimationExists = v118;
  if (v205)
  {
    if (v118)
    {
      self->_transformRotationCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x87ADA1BDuLL);
      int64_t v119 = self->_cacheValuesCount;
      if (v119 >= 1)
      {
        for (uint64_t i2 = 0; i2 < v119; ++i2)
        {
          double v121 = (double)i2 / (double)(v119 - 2);
          if (v121 > 1.0) {
            double v121 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.rotation", self, v121 * self->_animationDuration), "doubleValue");
          self->_transformRotationCache[i2] = v122;
          int64_t v119 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.x"])
  {
    id v123 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.x"];
  }
  else
  {
    id v123 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.rotation.x"];
  }
  [v123 doubleValue];
  self->_transformRotationXInitialValue = v124;
  int v125 = [v206 containsObject:@"transform.rotation.x"];
  self->_transformRotationXAnimationExists = v125;
  if (v205)
  {
    if (v125)
    {
      self->_transformRotationXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xB2EEC662uLL);
      int64_t v126 = self->_cacheValuesCount;
      if (v126 >= 1)
      {
        for (uint64_t i3 = 0; i3 < v126; ++i3)
        {
          double v128 = (double)i3 / (double)(v126 - 2);
          if (v128 > 1.0) {
            double v128 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.rotation.x", self, v128 * self->_animationDuration), "doubleValue");
          self->_transformRotationXCache[i3] = v129;
          int64_t v126 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.y"])
  {
    id v130 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.y"];
  }
  else
  {
    id v130 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.rotation.y"];
  }
  [v130 doubleValue];
  self->_transformRotationYInitialValue = v131;
  int v132 = [v206 containsObject:@"transform.rotation.y"];
  self->_transformRotationYAnimationExists = v132;
  if (v205)
  {
    if (v132)
    {
      self->_transformRotationYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x524F4D6FuLL);
      int64_t v133 = self->_cacheValuesCount;
      if (v133 >= 1)
      {
        for (uint64_t i4 = 0; i4 < v133; ++i4)
        {
          double v135 = (double)i4 / (double)(v133 - 2);
          if (v135 > 1.0) {
            double v135 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.rotation.y", self, v135 * self->_animationDuration), "doubleValue");
          self->_transformRotationYCache[i4] = v136;
          int64_t v133 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.z"])
  {
    id v137 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.rotation.z"];
  }
  else
  {
    id v137 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.rotation.z"];
  }
  [v137 doubleValue];
  self->_transformRotationZInitialValue = v138;
  int v139 = [v206 containsObject:@"transform.rotation.z"];
  self->_transformRotationZAnimationExists = v139;
  if (v205)
  {
    if (v139)
    {
      self->_transformRotationZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9491BFCCuLL);
      int64_t v140 = self->_cacheValuesCount;
      if (v140 >= 1)
      {
        for (uint64_t i5 = 0; i5 < v140; ++i5)
        {
          double v142 = (double)i5 / (double)(v140 - 2);
          if (v142 > 1.0) {
            double v142 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.rotation.z", self, v142 * self->_animationDuration), "doubleValue");
          self->_transformRotationZCache[i5] = v143;
          int64_t v140 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.x"])
  {
    id v144 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.x"];
  }
  else
  {
    id v144 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.scale.x"];
  }
  [v144 doubleValue];
  self->_transformScaleXInitialValue = v145;
  int v146 = [v206 containsObject:@"transform.scale.x"];
  self->_transformScaleXAnimationExists = v146;
  if (v205)
  {
    if (v146)
    {
      self->_transformScaleXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x804E1FF1uLL);
      int64_t v147 = self->_cacheValuesCount;
      if (v147 >= 1)
      {
        for (uint64_t i6 = 0; i6 < v147; ++i6)
        {
          double v149 = (double)i6 / (double)(v147 - 2);
          if (v149 > 1.0) {
            double v149 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.scale.x", self, v149 * self->_animationDuration), "doubleValue");
          self->_transformScaleXCache[i6] = v150;
          int64_t v147 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.y"])
  {
    id v151 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.y"];
  }
  else
  {
    id v151 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.scale.y"];
  }
  [v151 doubleValue];
  self->_transformScaleYInitialValue = v152;
  int v153 = [v206 containsObject:@"transform.scale.y"];
  self->_transformScaleYAnimationExists = v153;
  if (v205)
  {
    if (v153)
    {
      self->_transformScaleYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x3BFCA566uLL);
      int64_t v154 = self->_cacheValuesCount;
      if (v154 >= 1)
      {
        for (uint64_t i7 = 0; i7 < v154; ++i7)
        {
          double v156 = (double)i7 / (double)(v154 - 2);
          if (v156 > 1.0) {
            double v156 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.scale.y", self, v156 * self->_animationDuration), "doubleValue");
          self->_transformScaleYCache[i7] = v157;
          int64_t v154 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.xy"])
  {
    id v158 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.scale.xy"];
  }
  else
  {
    id v158 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.scale.xy"];
  }
  [v158 doubleValue];
  self->_transformScaleXYInitialValue = v159;
  int v160 = [v206 containsObject:@"transform.scale.xy"];
  self->_transformScaleXYAnimationExists = v160;
  if (v205)
  {
    if (v160)
    {
      self->_transformScaleXYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9B527B3uLL);
      int64_t v161 = self->_cacheValuesCount;
      if (v161 >= 1)
      {
        for (uint64_t i8 = 0; i8 < v161; ++i8)
        {
          double v163 = (double)i8 / (double)(v161 - 2);
          if (v163 > 1.0) {
            double v163 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.scale.xy", self, v163 * self->_animationDuration), "doubleValue");
          self->_transformScaleXYCache[i8] = v164;
          int64_t v161 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation"])
  {
    id v165 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation"];
  }
  else
  {
    id v165 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.translation"];
  }
  [v165 CGPointValue];
  self->_transformTranslationInitialValue.x = v166;
  self->_transformTranslationInitialValue.y = v167;
  int v168 = [v206 containsObject:@"transform.translation"];
  self->_transformTranslationAnimationExists = v168;
  if (v205)
  {
    if (v168)
    {
      self->_transformTranslationCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x874AB9ADuLL);
      int64_t v169 = self->_cacheValuesCount;
      if (v169 >= 1)
      {
        uint64_t v170 = 0;
        for (uint64_t i9 = 0; i9 < v169; ++i9)
        {
          v172 = &self->_transformTranslationCache[v170];
          double v173 = (double)i9 / (double)(v169 - 2);
          if (v173 > 1.0) {
            double v173 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.translation", self, v173 * self->_animationDuration), "CGPointValue");
          v172->x = v174;
          v172->y = v175;
          int64_t v169 = self->_cacheValuesCount;
          ++v170;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.x"])
  {
    id v176 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.x"];
  }
  else
  {
    id v176 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.translation.x"];
  }
  [v176 doubleValue];
  self->_transformTranslationXInitialValue = v177;
  int v178 = [v206 containsObject:@"transform.translation.x"];
  self->_transformTranslationXAnimationExists = v178;
  if (v205)
  {
    if (v178)
    {
      self->_transformTranslationXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x933D5258uLL);
      int64_t v179 = self->_cacheValuesCount;
      if (v179 >= 1)
      {
        for (uint64_t i10 = 0; i10 < v179; ++i10)
        {
          double v181 = (double)i10 / (double)(v179 - 2);
          if (v181 > 1.0) {
            double v181 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.translation.x", self, v181 * self->_animationDuration), "doubleValue");
          self->_transformTranslationXCache[i10] = v182;
          int64_t v179 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.y"])
  {
    id v183 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.y"];
  }
  else
  {
    id v183 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.translation.y"];
  }
  [v183 doubleValue];
  self->_transformTranslationYInitialValue = v184;
  int v185 = [v206 containsObject:@"transform.translation.y"];
  self->_transformTranslationYAnimationExists = v185;
  if (v205)
  {
    if (v185)
    {
      self->_transformTranslationYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xC95C124BuLL);
      int64_t v186 = self->_cacheValuesCount;
      if (v186 >= 1)
      {
        for (uint64_t i11 = 0; i11 < v186; ++i11)
        {
          double v188 = (double)i11 / (double)(v186 - 2);
          if (v188 > 1.0) {
            double v188 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.translation.y", self, v188 * self->_animationDuration), "doubleValue");
          self->_transformTranslationYCache[i11] = v189;
          int64_t v186 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.z"])
  {
    id v190 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"transform.translation.z"];
  }
  else
  {
    id v190 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"transform.translation.z"];
  }
  [v190 doubleValue];
  self->_transformTranslationZInitialValue = v191;
  int v192 = [v206 containsObject:@"transform.translation.z"];
  self->_transformTranslationZAnimationExists = v192;
  if (v205)
  {
    if (v192)
    {
      self->_transformTranslationZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x2383D89EuLL);
      int64_t v193 = self->_cacheValuesCount;
      if (v193 >= 1)
      {
        for (uint64_t i12 = 0; i12 < v193; ++i12)
        {
          double v195 = (double)i12 / (double)(v193 - 2);
          if (v195 > 1.0) {
            double v195 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"transform.translation.z", self, v195 * self->_animationDuration), "doubleValue");
          self->_transformTranslationZCache[i12] = v196;
          int64_t v193 = self->_cacheValuesCount;
        }
      }
    }
  }
  if ([(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"zPosition"])
  {
    id v197 = [(NSDictionary *)self->_overrideInitialValuesDict objectForKeyedSubscript:@"zPosition"];
  }
  else
  {
    id v197 = (id)[(CALayer *)[(TSDCAAnimationCache *)self layer] valueForKeyPath:@"zPosition"];
  }
  [v197 doubleValue];
  self->_zPositionInitialValue = v198;
  int v199 = [v206 containsObject:@"zPosition"];
  self->_zPositionAnimationExists = v199;
  if (v205)
  {
    if (v199)
    {
      self->_zPositionCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xACDB41E1uLL);
      int64_t v200 = self->_cacheValuesCount;
      if (v200 >= 1)
      {
        for (uint64_t i13 = 0; i13 < v200; ++i13)
        {
          double v202 = (double)i13 / (double)(v200 - 2);
          if (v202 > 1.0) {
            double v202 = 1.0;
          }
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", @"zPosition", self, v202 * self->_animationDuration), "doubleValue");
          self->_zPositionCache[i13] = v203;
          int64_t v200 = self->_cacheValuesCount;
        }
      }
    }
  }
LABEL_253:

  return v20 & 1;
}

- (BOOL)verifyCache
{
  return [(TSDCAAnimationCache *)self p_setupAndCacheAnimationValues:1 verifyOnly:1];
}

- (TSDCAAnimationCache)initWithLayer:(id)a3 animation:(id)a4 overrideInitialValues:(id)a5 cacheAnimationValues:(BOOL)a6
{
  BOOL v6 = a6;
  v14.receiver = self;
  v14.super_class = (Class)TSDCAAnimationCache;
  uint64_t v10 = [(TSDCAAnimationCache *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_layer = (CALayer *)a3;
    v10->_animatiouint64_t n = (CAAnimation *)a4;
    [a4 duration];
    v11->_animationDuratiouint64_t n = v12;
    v11->_overrideInitialValuesDict = (NSDictionary *)[a5 copy];
    [(TSDCAAnimationCache *)v11 p_setupAndCacheAnimationValues:v6 verifyOnly:0];
  }
  return v11;
}

- (void)dealloc
{
  free(self->_anchorPointCache);
  free(self->_anchorPointZCache);
  free(self->_borderWidthCache);
  free(self->_boundsCache);
  free(self->_doubleSidedCache);
  free(self->_hiddenCache);
  free(self->_opacityCache);
  free(self->_positionCache);
  free(self->_transformCache);
  free(self->_transformRotationCache);
  free(self->_transformRotationXCache);
  free(self->_transformRotationYCache);
  free(self->_transformRotationZCache);
  free(self->_transformScaleXCache);
  free(self->_transformScaleYCache);
  free(self->_transformScaleXYCache);
  free(self->_transformTranslationCache);
  free(self->_transformTranslationXCache);
  free(self->_transformTranslationYCache);
  free(self->_transformTranslationZCache);
  free(self->_zPositionCache);
  v3.receiver = self;
  v3.super_class = (Class)TSDCAAnimationCache;
  [(TSDCAAnimationCache *)&v3 dealloc];
}

- (CGPoint)anchorPointCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  id v7 = &self->_anchorPointCache[(uint64_t)v6];
  double x = v7->x;
  double y = v7->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)anchorPointZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_anchorPointZCache[(uint64_t)v6];
}

- (double)borderWidthCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_borderWidthCache[(uint64_t)v6];
}

- (CGRect)boundsCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  id v7 = &self->_boundsCache[(uint64_t)v6];
  double x = v7->origin.x;
  double y = v7->origin.y;
  double width = v7->size.width;
  double height = v7->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)doubleSidedCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_doubleSidedCache[(uint64_t)v6];
}

- (BOOL)hiddenCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_hiddenCache[(uint64_t)v6];
}

- (double)opacityCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_opacityCache[(uint64_t)v6];
}

- (CGPoint)positionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  id v7 = &self->_positionCache[(uint64_t)v6];
  double x = v7->x;
  double y = v7->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CATransform3D)transformCachedValueAtTime:(SEL)a3 layer:(double)a4 animation:(id)a5
{
  CGFloat m14 = self->m14;
  double v7 = a4 / self->m13 * (double)*(uint64_t *)&m14;
  if (v7 > (double)(*(void *)&m14 - 1)) {
    double v7 = (double)(*(void *)&m14 - 1);
  }
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  v8 = (_OWORD *)(*(void *)&self->m41 + ((uint64_t)v7 << 7));
  long long v9 = v8[5];
  *(_OWORD *)&retstr->m31 = v8[4];
  *(_OWORD *)&retstr->m33 = v9;
  long long v10 = v8[7];
  *(_OWORD *)&retstr->m41 = v8[6];
  *(_OWORD *)&retstr->m43 = v10;
  long long v11 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v11;
  long long v12 = v8[3];
  *(_OWORD *)&retstr->m21 = v8[2];
  *(_OWORD *)&retstr->m23 = v12;
  return self;
}

- (double)transformRotationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformRotationCache[(uint64_t)v6];
}

- (double)transformRotationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformRotationXCache[(uint64_t)v6];
}

- (double)transformRotationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformRotationYCache[(uint64_t)v6];
}

- (double)transformRotationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformRotationZCache[(uint64_t)v6];
}

- (double)transformScaleXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformScaleXCache[(uint64_t)v6];
}

- (double)transformScaleYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformScaleYCache[(uint64_t)v6];
}

- (double)transformScaleXYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformScaleXYCache[(uint64_t)v6];
}

- (CGPoint)transformTranslationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  double v7 = &self->_transformTranslationCache[(uint64_t)v6];
  double x = v7->x;
  double y = v7->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)transformTranslationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformTranslationXCache[(uint64_t)v6];
}

- (double)transformTranslationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformTranslationYCache[(uint64_t)v6];
}

- (double)transformTranslationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_transformTranslationZCache[(uint64_t)v6];
}

- (double)zPositionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount = self->_cacheValuesCount;
  double v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1)) {
    double v6 = (double)(cacheValuesCount - 1);
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  return self->_zPositionCache[(uint64_t)v6];
}

- (CALayer)layer
{
  return self->_layer;
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (BOOL)anchorPointAnimationExists
{
  return self->_anchorPointAnimationExists;
}

- (CGPoint)anchorPointInitialValue
{
  double x = self->_anchorPointInitialValue.x;
  double y = self->_anchorPointInitialValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)anchorPointZAnimationExists
{
  return self->_anchorPointZAnimationExists;
}

- (double)anchorPointZInitialValue
{
  return self->_anchorPointZInitialValue;
}

- (BOOL)borderColorAnimationExists
{
  return self->_borderColorAnimationExists;
}

- (CGColor)borderColorInitialValue
{
  return self->_borderColorInitialValue;
}

- (BOOL)borderWidthAnimationExists
{
  return self->_borderWidthAnimationExists;
}

- (double)borderWidthInitialValue
{
  return self->_borderWidthInitialValue;
}

- (BOOL)boundsAnimationExists
{
  return self->_boundsAnimationExists;
}

- (CGRect)boundsInitialValue
{
  double x = self->_boundsInitialValue.origin.x;
  double y = self->_boundsInitialValue.origin.y;
  double width = self->_boundsInitialValue.size.width;
  double height = self->_boundsInitialValue.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)contentsAnimationExists
{
  return self->_contentsAnimationExists;
}

- (CGImage)contentsInitialValue
{
  return self->_contentsInitialValue;
}

- (BOOL)doubleSidedAnimationExists
{
  return self->_doubleSidedAnimationExists;
}

- (BOOL)doubleSidedInitialValue
{
  return self->_doubleSidedInitialValue;
}

- (BOOL)hiddenAnimationExists
{
  return self->_hiddenAnimationExists;
}

- (BOOL)hiddenInitialValue
{
  return self->_hiddenInitialValue;
}

- (BOOL)opacityAnimationExists
{
  return self->_opacityAnimationExists;
}

- (double)opacityInitialValue
{
  return self->_opacityInitialValue;
}

- (BOOL)positionAnimationExists
{
  return self->_positionAnimationExists;
}

- (CGPoint)positionInitialValue
{
  double x = self->_positionInitialValue.x;
  double y = self->_positionInitialValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)transformAnimationExists
{
  return self->_transformAnimationExists;
}

- (CATransform3D)transformInitialValue
{
  long long v3 = *(_OWORD *)&self[4].m21;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m13;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[4].m31;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m23;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (BOOL)transformRotationAnimationExists
{
  return self->_transformRotationAnimationExists;
}

- (double)transformRotationInitialValue
{
  return self->_transformRotationInitialValue;
}

- (BOOL)transformRotationXAnimationExists
{
  return self->_transformRotationXAnimationExists;
}

- (double)transformRotationXInitialValue
{
  return self->_transformRotationXInitialValue;
}

- (BOOL)transformRotationYAnimationExists
{
  return self->_transformRotationYAnimationExists;
}

- (double)transformRotationYInitialValue
{
  return self->_transformRotationYInitialValue;
}

- (BOOL)transformRotationZAnimationExists
{
  return self->_transformRotationZAnimationExists;
}

- (double)transformRotationZInitialValue
{
  return self->_transformRotationZInitialValue;
}

- (BOOL)transformScaleXAnimationExists
{
  return self->_transformScaleXAnimationExists;
}

- (double)transformScaleXInitialValue
{
  return self->_transformScaleXInitialValue;
}

- (BOOL)transformScaleYAnimationExists
{
  return self->_transformScaleYAnimationExists;
}

- (double)transformScaleYInitialValue
{
  return self->_transformScaleYInitialValue;
}

- (BOOL)transformScaleXYAnimationExists
{
  return self->_transformScaleXYAnimationExists;
}

- (double)transformScaleXYInitialValue
{
  return self->_transformScaleXYInitialValue;
}

- (BOOL)transformTranslationAnimationExists
{
  return self->_transformTranslationAnimationExists;
}

- (CGPoint)transformTranslationInitialValue
{
  double x = self->_transformTranslationInitialValue.x;
  double y = self->_transformTranslationInitialValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)transformTranslationXAnimationExists
{
  return self->_transformTranslationXAnimationExists;
}

- (double)transformTranslationXInitialValue
{
  return self->_transformTranslationXInitialValue;
}

- (BOOL)transformTranslationYAnimationExists
{
  return self->_transformTranslationYAnimationExists;
}

- (double)transformTranslationYInitialValue
{
  return self->_transformTranslationYInitialValue;
}

- (BOOL)transformTranslationZAnimationExists
{
  return self->_transformTranslationZAnimationExists;
}

- (double)transformTranslationZInitialValue
{
  return self->_transformTranslationZInitialValue;
}

- (BOOL)zPositionAnimationExists
{
  return self->_zPositionAnimationExists;
}

- (double)zPositionInitialValue
{
  return self->_zPositionInitialValue;
}

- (NSDictionary)initialValues
{
  return self->_initialValues;
}

@end