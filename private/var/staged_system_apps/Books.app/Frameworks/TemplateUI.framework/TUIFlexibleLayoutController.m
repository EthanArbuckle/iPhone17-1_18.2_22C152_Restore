@interface TUIFlexibleLayoutController
+ (id)newEqualWidthController;
+ (id)newHeightController;
+ (id)newStrictEqualWidthController;
+ (id)newWidthController;
- (NSArray)layouts;
- (double)_lengthToAdjustWithMeasured:(double)a3 desired:(id *)a4;
- (double)adjustedLengthForLayout:(id)a3;
- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4;
- (id).cxx_construct;
- (id)_init;
- (void)addLayout:(id)a3 length:(id *)a4 compressed:(unint64_t)a5;
- (void)computeWithMeasured:(double)a3 desired:(id *)a4;
@end

@implementation TUIFlexibleLayoutController

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)TUIFlexibleLayoutController;
  v2 = [(TUIFlexibleLayoutController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    priorityToLayouts = v2->_priorityToLayouts;
    v2->_priorityToLayouts = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    layoutToFlexed = v2->_layoutToFlexed;
    v2->_layoutToFlexed = (NSMapTable *)v7;
  }
  return v2;
}

+ (id)newWidthController
{
  v2 = [_TUIFlexibleWidthLayoutController alloc];

  return [(TUIFlexibleLayoutController *)v2 _init];
}

+ (id)newHeightController
{
  v2 = [_TUIFlexibleHeightLayoutController alloc];

  return [(TUIFlexibleLayoutController *)v2 _init];
}

+ (id)newEqualWidthController
{
  v2 = [_TUIFlexibleEqualWidthLayoutController alloc];

  return [(TUIFlexibleLayoutController *)v2 _init];
}

+ (id)newStrictEqualWidthController
{
  v2 = [_TUIFlexibleStrictEqualWidthLayoutController alloc];

  return [(TUIFlexibleLayoutController *)v2 _init];
}

- (NSArray)layouts
{
  return (NSArray *)self->_layouts;
}

- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4
{
  return NAN;
}

- (void)addLayout:(id)a3 length:(id *)a4 compressed:(unint64_t)a5
{
  uint64_t v6 = v5;
  id v10 = a3;
  [(NSMutableArray *)self->_layouts addObject:v10];
  self->_layoutTotalLength = fmax(*(float *)&a4, 0.0) + self->_layoutTotalLength;
  priorityToLayouts = self->_priorityToLayouts;
  v12 = +[NSNumber numberWithUnsignedInteger:WORD2(a5)];
  v13 = [(NSMutableDictionary *)priorityToLayouts objectForKeyedSubscript:v12];

  if (!v13)
  {
    uint64_t v14 = objc_opt_new();
    v15 = self->_priorityToLayouts;
    v16 = +[NSNumber numberWithUnsignedInteger:WORD2(a5)];
    [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

    v13 = (void *)v14;
  }
  [v13 addObject:v10];
  id v21 = v10;
  v22 = &v21;
  v17 = sub_F4AF4((uint64_t)&self->_layoutToLength, &v21, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
  v17[3] = a4;
  v17[4] = a5;
  [(NSMapTable *)self->_layoutToFlexed setObject:&off_268AD0 forKey:v10];
  [v10 setHidden:0];
  if (v6 == 1)
  {
    hideableLayouts = self->_hideableLayouts;
    if (!hideableLayouts)
    {
      v19 = +[NSHashTable hashTableWithOptions:512];
      v20 = self->_hideableLayouts;
      self->_hideableLayouts = v19;

      hideableLayouts = self->_hideableLayouts;
    }
    [(NSHashTable *)hideableLayouts addObject:v10];
  }
}

- (double)_lengthToAdjustWithMeasured:(double)a3 desired:(id *)a4
{
  return fmin(fmax(*(float *)&a4, *((float *)&a4 + 1)), v4) - a3;
}

- (void)computeWithMeasured:(double)a3 desired:(id *)a4
{
  [(TUIFlexibleLayoutController *)self _lengthToAdjustWithMeasured:a4 desired:a3];
  double v6 = v5;
  uint64_t v7 = [(NSMutableDictionary *)self->_priorityToLayouts allKeys];
  v8 = [v7 sortedArrayUsingSelector:"compare:"];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v8;
  id v57 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v80;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v80 != v56) {
          objc_enumerationMutation(obj);
        }
        v9 = [(NSMutableDictionary *)self->_priorityToLayouts objectForKeyedSubscript:*(void *)(*((void *)&v79 + 1) + 8 * i)];
        id v59 = [v9 mutableCopy];

        if (fabs(v6) > 1.0)
        {
          char v10 = 1;
          do
          {
            if (![v59 count]) {
              break;
            }
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            id v11 = v59;
            id v12 = [v11 countByEnumeratingWithState:&v75 objects:v86 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v76;
              double v14 = 0.0;
              do
              {
                for (j = 0; j != v12; j = (char *)j + 1)
                {
                  if (*(void *)v76 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  v74 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
                  double v14 = v14
                      + fmax(*((float *)sub_E4EF0(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74) + 6), 1.0);
                }
                id v12 = [v11 countByEnumeratingWithState:&v75 objects:v86 count:16];
              }
              while (v12);
            }
            else
            {
              double v14 = 0.0;
            }

            v60 = objc_opt_new();
            if (self->_hideableLayouts && v6 < 0.0)
            {
              long long v72 = 0u;
              long long v73 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              id v16 = v11;
              id v17 = [v16 countByEnumeratingWithState:&v70 objects:v85 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v71;
                do
                {
                  for (k = 0; k != v17; k = (char *)k + 1)
                  {
                    if (*(void *)v71 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    v20 = *(void **)(*((void *)&v70 + 1) + 8 * (void)k);
                    v74 = v20;
                    id v21 = (float *)sub_E4EF0(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74);
                    if (self->_hideableLayouts)
                    {
                      float v22 = v21[6];
                      if ([(NSHashTable *)self->_hideableLayouts containsObject:v20])
                      {
                        [v20 setHidden:1];
                        [(NSMapTable *)self->_layoutToFlexed setObject:&off_267BC8 forKey:v20];
                        double v6 = v6 + v22;
                        double v14 = v14 - v22;
                      }
                    }
                  }
                  id v17 = [v16 countByEnumeratingWithState:&v70 objects:v85 count:16];
                }
                while (v17);
              }
            }
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v23 = v11;
            id v24 = [v23 countByEnumeratingWithState:&v66 objects:v84 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v67;
              double v61 = 0.0;
              double v26 = 0.0;
              do
              {
                for (m = 0; m != v24; m = (char *)m + 1)
                {
                  if (*(void *)v67 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = *(void **)(*((void *)&v66 + 1) + 8 * (void)m);
                  v74 = v28;
                  v29 = (float *)sub_E4EF0(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74);
                  v30 = v29;
                  uint64_t v31 = *((void *)v29 + 3);
                  if (v6 <= 0.0) {
                    float v32 = COERCE_FLOAT(*((void *)v29 + 3)) - *((float *)&v31 + 1);
                  }
                  else {
                    float v32 = v29[8] - *(float *)&v31;
                  }
                  double v33 = v29[6];
                  double v34 = fmax(v33, 1.0);
                  double v35 = fmax(v32, 0.0);
                  if (v10) {
                    double v36 = v34 / v14;
                  }
                  else {
                    double v36 = 1.0;
                  }
                  if (([v28 hidden] & 1) == 0)
                  {
                    double v37 = fmin(v35, v6 * v36) + v33;
                    if (v6 <= 0.0) {
                      double v38 = fmax(v37, v30[7]);
                    }
                    else {
                      double v38 = fmin(v37, v30[8]);
                    }
                    [(TUIFlexibleLayoutController *)self _layout:v28 lengthForProposedLength:v38];
                    double v40 = v39;
                    if (v6 > 0.0)
                    {
                      double v41 = v30[8];
                      double v42 = vabdd_f64(v41, v40);
                      double v43 = vabdd_f64(v41, v37);
                      if (v42 <= 1.0 || v43 <= 1.0) {
                        goto LABEL_57;
                      }
                    }
                    if (v6 < 0.0)
                    {
                      double v45 = v30[7];
                      double v46 = vabdd_f64(v45, v40);
                      double v43 = vabdd_f64(v45, v37);
                      if (v46 <= 1.0 || v43 <= 1.0)
                      {
LABEL_57:
                        [v60 addObject:v28, v43];
                        double v61 = v61 + v40 - v33;
                      }
                    }
                    layoutToFlexed = self->_layoutToFlexed;
                    v49 = +[NSNumber numberWithDouble:v40];
                    [(NSMapTable *)layoutToFlexed setObject:v49 forKey:v28];

                    double v26 = v26 + v40 - v33;
                  }
                }
                id v24 = [v23 countByEnumeratingWithState:&v66 objects:v84 count:16];
              }
              while (v24);
            }
            else
            {
              double v61 = 0.0;
              double v26 = 0.0;
            }

            if (vabdd_f64(v26, v6) >= 1.0)
            {
              id v50 = [v60 count];
              if (v50 != [v23 count])
              {
                if ([v60 count])
                {
                  long long v64 = 0u;
                  long long v65 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                  id v51 = v60;
                  id v52 = [v51 countByEnumeratingWithState:&v62 objects:v83 count:16];
                  if (v52)
                  {
                    uint64_t v53 = *(void *)v63;
                    do
                    {
                      for (n = 0; n != v52; n = (char *)n + 1)
                      {
                        if (*(void *)v63 != v53) {
                          objc_enumerationMutation(v51);
                        }
                        [v23 removeObjectIdenticalTo:*(void *)(*((void *)&v62 + 1) + 8 * (void)n)];
                      }
                      id v52 = [v51 countByEnumeratingWithState:&v62 objects:v83 count:16];
                    }
                    while (v52);
                  }

                  double v6 = v6 - v61;
                }
                else
                {
                  if ((v10 & 1) == 0) {
                    [v23 removeAllObjects];
                  }
                  char v10 = 0;
                }
                goto LABEL_67;
              }
              [v23 removeAllObjects];
            }
            double v6 = v6 - v26;
LABEL_67:
          }
          while (fabs(v6) > 1.0);
        }
      }
      id v57 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
    }
    while (v57);
  }
}

- (double)adjustedLengthForLayout:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_layoutToFlexed objectForKey:a3];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideableLayouts, 0);
  objc_storeStrong((id *)&self->_layoutToFlexed, 0);
  objc_storeStrong((id *)&self->_priorityToLayouts, 0);
  sub_1265C((uint64_t)&self->_layoutToLength);

  objc_storeStrong((id *)&self->_layouts, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

@end