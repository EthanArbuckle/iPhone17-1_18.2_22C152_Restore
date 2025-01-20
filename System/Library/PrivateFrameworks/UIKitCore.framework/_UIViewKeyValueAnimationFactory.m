@interface _UIViewKeyValueAnimationFactory
+ (id)animationForKeyPathsAndRelativeValues:(id)a3;
+ (id)animationForKeyPathsAndValues:(id)a3;
+ (id)animationsTransitioningFromAnimation:(id)a3 toAnimation:(id)a4 onView:(id)a5;
@end

@implementation _UIViewKeyValueAnimationFactory

+ (id)animationForKeyPathsAndRelativeValues:(id)a3
{
  return _animationForKeyPathsAndValues(a3, 1);
}

+ (id)animationForKeyPathsAndValues:(id)a3
{
  return _animationForKeyPathsAndValues(a3, 0);
}

+ (id)animationsTransitioningFromAnimation:(id)a3 toAnimation:(id)a4 onView:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v35 = v7;
  _collectTransitions(v7, v10, &__block_literal_global_660);
  v34 = v8;
  _collectTransitions(v8, v10, &__block_literal_global_16_9);
  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  uint64_t v39 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v39)
  {
    id v37 = v9;
    uint64_t v38 = *(void *)v42;
    v36 = v11;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v14 = [obj objectForKeyedSubscript:v13];
        id v15 = v9;
        id v16 = v13;
        id v17 = v14;
        v18 = [v17 fromAnimation];
        uint64_t v19 = [v18 fromValue];

        v20 = [v17 toAnimation];
        uint64_t v21 = [v20 toValue];

        if (!(v19 | v21))
        {
          id v28 = 0;
          goto LABEL_23;
        }
        v22 = objc_opt_class();
        v23 = [v15 layer];
        v24 = [v22 _defaultUIViewAnimationForLayer:v23 forKey:v16];

        if (v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v24 setAdditive:1];
            if (v19 && v21)
            {
              v25 = (void *)v19;
              uint64_t v26 = v21;
              uint64_t v27 = 0xFFFFFFFFLL;
              goto LABEL_17;
            }
            if (v19 || !v21)
            {
              if (!v19 || v21) {
                abort();
              }
              id v30 = (id)v19;
              v29 = v30;
              id v31 = v30;
            }
            else
            {
              v25 = (void *)v21;
              uint64_t v26 = v21;
              uint64_t v27 = 4294967294;
LABEL_17:
              v29 = objc_msgSend(v25, "CA_addValue:multipliedBy:", v26, v27);
              id v30 = (id)v21;
              id v31 = (id)v21;
            }
            v32 = objc_msgSend(v30, "CA_addValue:multipliedBy:", v31, 0xFFFFFFFFLL);
            [v24 setFromValue:v29];
            [v24 setToValue:v32];
            id v28 = v24;

            v11 = v36;
            id v9 = v37;
            goto LABEL_22;
          }
        }
        id v28 = 0;
LABEL_22:

LABEL_23:
        if (v28) {
          [v11 addObject:v28];
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v39);
  }

  return v11;
}

@end