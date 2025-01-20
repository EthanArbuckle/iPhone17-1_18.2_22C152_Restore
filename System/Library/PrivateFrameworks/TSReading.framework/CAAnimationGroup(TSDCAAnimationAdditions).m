@interface CAAnimationGroup(TSDCAAnimationAdditions)
- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions;
- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:;
- (uint64_t)p_getValue:()TSDCAAnimationAdditions animation:animationPercent:forKeyPath:atTime:animationCache:;
@end

@implementation CAAnimationGroup(TSDCAAnimationAdditions)

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a1, "animations", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "TSD_containsAnimationForKeyPath:", a3)) {
          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animation:animationPercent:forKeyPath:atTime:animationCache:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ([a1 timingFunction])
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    if (v15 > *(double *)&p_getValue_animation_animationPercent_forKeyPath_atTime_animationCache__s_lastTimingFunctionAssertTimeInterval
             + 1.0)
      p_getValue_animation_animationPercent_forKeyPath_atTime_animationCache__s_lastTimingFunctionAssertTimeInterval = *(void *)&v15;
  }
  v32 = a6;
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a8, "initialValues", a4), "objectForKey:", a7);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v17 = (void *)[a1 animations];
  uint64_t result = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (result)
  {
    uint64_t v19 = result;
    v20 = 0;
    uint64_t v21 = *(void *)v34;
    double v22 = 1.79769313e308;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
        if (objc_msgSend((id)objc_msgSend(v24, "keyPath"), "isEqualToString:", a7))
        {
          objc_msgSend(v24, "TSD_animationPercentFromAnimationTime:", a2);
          double v26 = v25;
          double v27 = 0.0;
          if (v26 < 0.0 || v26 > 1.0)
          {
            objc_msgSend(a1, "duration", 0.0);
            if (v26 >= 0.0) {
              double v27 = (v26 + -1.0) * v29;
            }
            else {
              double v27 = -(v26 * v29);
            }
          }
          if (v27 < v22)
          {
            double v22 = v27;
            v20 = v24;
          }
        }
        ++v23;
      }
      while (v19 != v23);
      uint64_t result = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v19 = result;
    }
    while (result);
  }
  else
  {
    v20 = 0;
  }
  if (a5) {
    *a5 = v20;
  }
  if (v31)
  {
    if (v20)
    {
      uint64_t result = objc_msgSend(v20, "TSD_valueAtTime:initialValue:", v16, a2);
      uint64_t v16 = result;
    }
    uint64_t *v31 = v16;
  }
  if (v32)
  {
    uint64_t result = objc_msgSend(v20, "TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:", a7, a2);
    void *v32 = v30;
  }
  return result;
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:
{
  uint64_t v5 = 0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", &v5, 0, 0, a3, a4);
  return v5;
}

- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  uint64_t v4 = 0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", 0, &v4, 0, a3, 0);
  return v4;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  double v4 = 0.0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", 0, 0, &v4, a3, 0);
  return v4;
}

@end