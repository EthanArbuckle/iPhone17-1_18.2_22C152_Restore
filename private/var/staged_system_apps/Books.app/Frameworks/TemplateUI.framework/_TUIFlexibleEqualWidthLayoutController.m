@interface _TUIFlexibleEqualWidthLayoutController
- (double)_layout:(id)a3 lengthForProposedLength:(double)a4;
- (void)computeWithMeasured:(double)a3 desired:(id *)a4;
@end

@implementation _TUIFlexibleEqualWidthLayoutController

- (void)computeWithMeasured:(double)a3 desired:(id *)a4
{
  uint64_t v5 = v4;
  id v46 = [objc_alloc((Class)NSHashTable) initWithOptions:512 capacity:-[NSMutableArray count](self->super._layouts, "count")];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v9 = self->super._layouts;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v58;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v9);
        }
        [v46 addObject:*(void *)(*((void *)&v57 + 1) + 8 * i)];
      }
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v10);
  }

  -[TUIFlexibleLayoutController _lengthToAdjustWithMeasured:desired:](self, "_lengthToAdjustWithMeasured:desired:", a4, v5, a3);
  double v14 = v13;
  double v15 = v13 + self->super._layoutTotalLength;
  while (1)
  {
    if (!objc_msgSend(v46, "count", v46)) {
      goto LABEL_38;
    }
    v47 = +[NSMutableArray array];
    id v16 = [v46 count];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v17 = v46;
    id v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v18)
    {
      double v19 = v15 / (double)(unint64_t)v16;
      uint64_t v20 = *(void *)v54;
      double v21 = 0.0;
      double v22 = 0.0;
      while (1)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
          uint64_t v52 = v24;
          v25 = (float *)sub_E4EF0(&self->super._layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v52);
          v26 = v25;
          double v27 = v25[6];
          double v28 = v19 - v27;
          if (v19 - v27 <= 0.0)
          {
            double v30 = v25[6];
            if (v28 >= 0.0) {
              goto LABEL_20;
            }
            double v29 = fmax(-fmax((float)(COERCE_FLOAT(*((void *)v25 + 3)) - COERCE_FLOAT(HIDWORD(*((void *)v25 + 3)))), 0.0), v28);
          }
          else
          {
            double v29 = fmin(fmax((float)(v25[8] - v25[6]), 0.0), v28);
          }
          double v30 = v29 + v27;
LABEL_20:
          [(_TUIFlexibleEqualWidthLayoutController *)self _layout:v24 lengthForProposedLength:v30];
          double v32 = v31;
          BOOL v33 = !TUICGFloatIsAlmostEqualFloat(vabdd_f64(v26[8], v31), 0.0);
          BOOL v34 = !TUICGFloatIsAlmostEqualFloat(vabdd_f64(v26[7], v32), 0.0);
          if (!TUICGFloatIsAlmostEqualFloat(vabdd_f64(v32, v19), 0.0) || !v33 && !v34)
          {
            [v47 addObject:v24];
            double v21 = v21 + v32 - v27;
          }
          layoutToFlexed = self->super._layoutToFlexed;
          v36 = +[NSNumber numberWithDouble:v32];
          [(NSMapTable *)layoutToFlexed setObject:v36 forKey:v24];

          double v22 = v22 + v32 - v27;
        }
        id v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (!v18) {
          goto LABEL_26;
        }
      }
    }
    double v21 = 0.0;
    double v22 = 0.0;
LABEL_26:

    if (![v47 count]) {
      break;
    }
    id v37 = [v47 count];
    if (v37 == [v17 count] || TUICGFloatIsAlmostEqualFloat(v22, v14)) {
      break;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v38 = v47;
    id v39 = [v38 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v49;
      do
      {
        for (k = 0; k != v39; k = (char *)k + 1)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void *)(*((void *)&v48 + 1) + 8 * (void)k);
          [v17 removeObject:v42];
          v43 = [(NSMapTable *)self->super._layoutToFlexed objectForKey:v42];
          [v43 doubleValue];
          double v45 = v44;

          double v15 = v15 - v45;
        }
        id v39 = [v38 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v39);
    }

    double v14 = v14 - v21;
  }

LABEL_38:
}

- (double)_layout:(id)a3 lengthForProposedLength:(double)a4
{
  _[a3 computeWidthForProposedWidth:a4];
  return result;
}

@end