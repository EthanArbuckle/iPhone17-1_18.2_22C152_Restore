@interface _UIMotionEffectApplicator
+ (void)applyMotionEffect:(id)a3 toViews:(id)a4 usingPose:(id)a5 transformedForTargetInterfaceOrientation:(int64_t)a6;
+ (void)unapplyMotionEffect:(id)a3 toViews:(id)a4;
@end

@implementation _UIMotionEffectApplicator

+ (void)unapplyMotionEffect:(id)a3 toViews:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        v12 = [v5 _animationIdentifier];
        if (([v11 _unapplyMotionEffect:v5] & 1) == 0)
        {
          _applyTransitionAnimationToView(v11, v12, 0);
          v13 = [v11 layer];
          [v13 removeAnimationForKey:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)applyMotionEffect:(id)a3 toViews:(id)a4 usingPose:(id)a5 transformedForTargetInterfaceOrientation:(int64_t)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  double v35 = 0.0;
  double v34 = 0.0;
  if (a6 != 1)
  {
    [v10 viewerOffset];
    double v34 = v12;
    double v35 = v13;
    if (a6 == 3)
    {
      double v14 = 1.57079633;
    }
    else if (a6 == 4)
    {
      double v14 = -1.57079633;
    }
    else
    {
      double v14 = 3.14159265;
      if (a6 != 2) {
        double v14 = 0.0;
      }
    }
    CGAffineTransformMakeRotation(&v44, -v14);
    objc_msgSend(v11, "setViewerOffset:", vaddq_f64(*(float64x2_t *)&v44.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v44.a, v34), vmulq_n_f64(*(float64x2_t *)&v44.c, v35))));
  }
  v33 = v11;
  long long v15 = v36;
  v38 = objc_msgSend(v36, "_keyPathsAndRelativeValuesForPose:", v11, a6);
  long long v16 = +[_UIViewKeyValueAnimationFactory animationForKeyPathsAndRelativeValues:](_UIViewKeyValueAnimationFactory, "animationForKeyPathsAndRelativeValues:");
  long long v17 = [v36 _animationIdentifier];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obint j = v9;
  uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    char v21 = 0;
    uint64_t v39 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ((v20 & 1) == 0)
        {
          if (_UIInternalPreferencesRevisionOnce != -1) {
            dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
          }
          int v24 = _UIInternalPreferencesRevisionVar;
          if (_UIInternalPreferencesRevisionVar >= 1)
          {
            for (int j = _UIInternalPreference_UIParallaxIsPixelAligned;
                  v24 != j;
                  int j = _UIInternalPreference_UIParallaxIsPixelAligned)
            {
              if (v24 < j)
              {
                if (byte_1E8FD5374) {
                  break;
                }
                char v20 = 0;
                if (v21) {
                  goto LABEL_23;
                }
                goto LABEL_31;
              }
              _UIInternalPreferenceSync(v24, &_UIInternalPreference_UIParallaxIsPixelAligned, @"UIParallaxIsPixelAligned", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
            }
          }
          +[_UICAAnimationPositionQuantizer quantizePositionsInAnimation:v16 givenView:v23];
          v25 = [v23 layer];
          v26 = [v25 animationForKey:v17];

          if (v26 && (_fromValuesAreEqual(v16, v26) & 1) != 0)
          {
            char v20 = 1;
            char v21 = 1;
LABEL_34:

            continue;
          }
        }
        char v20 = 1;
        if (v21)
        {
LABEL_23:
          v27 = [v23 layer];
          v28 = [v27 animationForKey:v17];

          if (v28)
          {
            char v21 = 1;
            continue;
          }
        }
LABEL_31:
        if (([v23 _applyKeyPathsAndRelativeValues:v38 forMotionEffect:v15] & 1) == 0)
        {
          _applyTransitionAnimationToView(v23, v17, v16);
          if (v16)
          {
            id v30 = v16;
            id v31 = v17;
            v26 = [v23 layer];
            [v26 removeAnimationForKey:v31];
            [v26 addAnimation:v30 forKey:v31];

            long long v15 = v36;
            goto LABEL_34;
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v19);
  }

  if (v32 != 1) {
    objc_msgSend(v33, "setViewerOffset:", v34, v35);
  }
}

@end