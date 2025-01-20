@interface AnchoredValueGenerator
- (AnchoredValueGenerator)init;
- (double)_interpolatedValueForSize:(double)a3;
- (double)_nearestValueForSize:(double)a3;
- (double)_roundValue:(double)a3;
- (double)valueForSize:(double)a3;
- (double)valueForWindowSizeHeight:(unint64_t)a3;
- (double)valueForWindowSizeWidth:(unint64_t)a3;
- (id)description;
- (int)calculationType;
- (int)roundingType;
- (void)_findBoundsForSize:(double)a3 outLowerBound:(id *)a4 outUpperBound:(id *)a5 outExactMatchValue:(double *)a6 outFoundExactMatch:(BOOL *)a7;
- (void)_sort;
- (void)addAnchoredValue:(double)a3 forSize:(double)a4;
- (void)addAnchoredValue:(double)a3 forSize:(double)a4 layoutShift:(BOOL)a5;
- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4;
- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4 layoutShift:(BOOL)a5;
- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4;
- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4 layoutShift:(BOOL)a5;
- (void)setCalculationType:(int)a3;
- (void)setRoundingType:(int)a3;
@end

@implementation AnchoredValueGenerator

- (double)valueForSize:(double)a3
{
  if (!self->_pairs)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"AnchoredValueGenerator.m" lineNumber:125 description:@"Anchored value: attempt to use without adding anchors"];

    return 0.0;
  }
  if (self->_needsSorting) {
    [(AnchoredValueGenerator *)self _sort];
  }
  cachedLastResult = self->_cachedLastResult;
  if (!cachedLastResult) {
    goto LABEL_11;
  }
  [(AnchoredValuePair *)cachedLastResult size];
  double v7 = v6 - a3;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  if (v7 >= 0.00001)
  {
LABEL_11:
    unsigned int v10 = [(AnchoredValueGenerator *)self calculationType];
    if (v10 - 1 >= 3)
    {
      if (v10 && v10 != 4)
      {
        double v23 = 0.0;
        char v22 = 0;
        uint64_t v20 = 0;
        id v21 = 0;
        [(AnchoredValueGenerator *)self _findBoundsForSize:&v21 outLowerBound:&v20 outUpperBound:&v23 outExactMatchValue:&v22 outFoundExactMatch:a3];
        id v19 = v21;
        if (v22) {
          double v15 = v23;
        }
        else {
          double v15 = 0.0;
        }

        goto LABEL_18;
      }
      [(AnchoredValueGenerator *)self _interpolatedValueForSize:a3];
    }
    else
    {
      [(AnchoredValueGenerator *)self _nearestValueForSize:a3];
    }
    double v15 = v11;
LABEL_18:
    [(AnchoredValueGenerator *)self _roundValue:v15];
    double v14 = v16;
    +[AnchoredValuePair pairWithValue:size:layoutShift:](AnchoredValuePair, "pairWithValue:size:layoutShift:", 0);
    v17 = (AnchoredValuePair *)objc_claimAutoreleasedReturnValue();
    v18 = self->_cachedLastResult;
    self->_cachedLastResult = v17;

    return v14;
  }
  v8 = self->_cachedLastResult;

  [(AnchoredValuePair *)v8 value];
  return result;
}

- (double)_interpolatedValueForSize:(double)a3
{
  double v38 = 0.0;
  char v37 = 0;
  id v35 = 0;
  id v36 = 0;
  -[AnchoredValueGenerator _findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:](self, "_findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:", &v36, &v35, &v38, &v37);
  unint64_t v6 = (unint64_t)v36;
  unint64_t v7 = (unint64_t)v35;
  if (!v37)
  {
    if ([(AnchoredValueGenerator *)self calculationType] == 4
      && ([(id)v6 value], double v10 = v9, objc_msgSend((id)v7, "value"), v10 > v11))
    {
      if ([(id)v6 layoutShift]) {
        unsigned int v12 = 1;
      }
      else {
        unsigned int v12 = [(id)v7 layoutShift];
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
    unsigned int v13 = v7 == 0;
    if (!(v7 | v6))
    {
      double v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"AnchoredValueGenerator.m" lineNumber:259 description:@"Anchored value: unable to find interpolated value"];

      double v8 = 0.0;
      goto LABEL_31;
    }
    if (v7) {
      BOOL v15 = v6 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    char v16 = v15;
    if (v15) {
      char v17 = 1;
    }
    else {
      char v17 = v12;
    }
    if ((v17 & 1) == 0)
    {
      [(id)v6 size];
      double v21 = a3 - v20;
      [(id)v7 size];
      double v23 = v22;
      [(id)v6 size];
      double v25 = v21 / (v23 - v24);
      [(id)v7 value];
      double v27 = v26;
      [(id)v6 value];
      double v29 = v27 - v28;
      [(id)v6 value];
      double v8 = v30 + v25 * v29;
      goto LABEL_31;
    }
    if ((v16 & 1) == 0)
    {
      if (!v12)
      {
        id v19 = 0;
LABEL_30:
        [v19 value];
        double v32 = v31;
        [v19 size];
        double v8 = v32 / v33 * a3;

        goto LABEL_31;
      }
      unsigned int v13 = [(id)v7 layoutShift];
    }
    if (v13) {
      v18 = (void *)v6;
    }
    else {
      v18 = (void *)v7;
    }
    id v19 = v18;
    goto LABEL_30;
  }
  double v8 = v38;
LABEL_31:

  return v8;
}

- (void)_findBoundsForSize:(double)a3 outLowerBound:(id *)a4 outUpperBound:(id *)a5 outExactMatchValue:(double *)a6 outFoundExactMatch:(BOOL *)a7
{
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v11 = self->_pairs;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v18 size];
        double v20 = v19 - a3;
        if (v20 < 0.0) {
          double v20 = -v20;
        }
        if (v20 < 0.00001)
        {
          if (a5) {
            *a5 = 0;
          }
          if (a4) {
            *a4 = 0;
          }
          if (a6)
          {
            [v18 value];
            *(void *)a6 = v31;
          }
          if (a7) {
            *a7 = 1;
          }

          goto LABEL_40;
        }
        [v18 size];
        if (v21 >= a3)
        {
          [v18 size];
          if (v26 > a3)
          {
            if (v14)
            {
              [v14 size];
              double v28 = v27;
              [v18 size];
              if (v28 > v29)
              {
                id v30 = v18;

                id v14 = v30;
              }
            }
            else
            {
              id v14 = v18;
            }
          }
        }
        else if (v15)
        {
          [v15 size];
          double v23 = v22;
          [v18 size];
          if (v23 < v24)
          {
            id v25 = v18;

            id v15 = v25;
          }
        }
        else
        {
          id v15 = v18;
        }
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
    id v15 = 0;
  }

  if (a5) {
    *a5 = v14;
  }
  if (a4) {
    *a4 = v15;
  }
  if (a6) {
    *a6 = 0.0;
  }
  if (a7) {
    *a7 = 0;
  }
LABEL_40:
}

- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4 layoutShift:(BOOL)a5
{
  BOOL v5 = a5;
  EKUIWidthForWindowSizeParadigm();

  [(AnchoredValueGenerator *)self addAnchoredValue:v5 forSize:a3 layoutShift:v8];
}

- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4
{
}

- (void)addAnchoredValue:(double)a3 forSize:(double)a4 layoutShift:(BOOL)a5
{
  BOOL v5 = a5;
  self->_needsSorting = 1;
  cachedLastResult = self->_cachedLastResult;
  self->_cachedLastResult = 0;

  pairs = self->_pairs;
  if (!pairs)
  {
    double v11 = (NSMutableArray *)objc_opt_new();
    id v12 = self->_pairs;
    self->_pairs = v11;

    pairs = self->_pairs;
  }
  id v13 = +[AnchoredValuePair pairWithValue:v5 size:a3 layoutShift:a4];
  [(NSMutableArray *)pairs addObject:v13];
}

- (void)setCalculationType:(int)a3
{
  self->_calculationType = a3;
}

- (int)roundingType
{
  return self->_roundingType;
}

- (AnchoredValueGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)AnchoredValueGenerator;
  double result = [(AnchoredValueGenerator *)&v3 init];
  if (result) {
    *(void *)&result->_calculationType = 0;
  }
  return result;
}

- (int)calculationType
{
  return self->_calculationType;
}

- (void)_sort
{
}

- (double)_roundValue:(double)a3
{
  switch([(AnchoredValueGenerator *)self roundingType])
  {
    case 1:
      CalFloorToScreenScale();
      break;
    case 2:
      CalCeilToScreenScale();
      break;
    case 3:
      double result = round(a3);
      break;
    case 4:
      double result = floor(a3);
      break;
    case 5:
      double result = ceil(a3);
      break;
    default:
      CalRoundToScreenScale();
      break;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p\t Pairs: %@>", objc_opt_class(), self, self->_pairs];
}

- (void)addAnchoredValue:(double)a3 forSize:(double)a4
{
}

- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4
{
}

- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4 layoutShift:(BOOL)a5
{
  BOOL v5 = a5;
  EKUIHeightForWindowSizeParadigm();

  [(AnchoredValueGenerator *)self addAnchoredValue:v5 forSize:a3 layoutShift:v8];
}

- (double)valueForWindowSizeWidth:(unint64_t)a3
{
  EKUIWidthForWindowSizeParadigm();

  -[AnchoredValueGenerator valueForSize:](self, "valueForSize:");
  return result;
}

- (double)valueForWindowSizeHeight:(unint64_t)a3
{
  EKUIHeightForWindowSizeParadigm();

  -[AnchoredValueGenerator valueForSize:](self, "valueForSize:");
  return result;
}

- (double)_nearestValueForSize:(double)a3
{
  double v21 = 0.0;
  char v20 = 0;
  id v18 = 0;
  id v19 = 0;
  -[AnchoredValueGenerator _findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:](self, "_findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:", &v19, &v18, &v21, &v20);
  unint64_t v6 = (unint64_t)v19;
  unint64_t v7 = (unint64_t)v18;
  if (!v20)
  {
    if ([(AnchoredValueGenerator *)self calculationType] == 3 && v7) {
      goto LABEL_5;
    }
    if ([(AnchoredValueGenerator *)self calculationType] != 2 || !v6)
    {
      if (!(v7 | v6))
      {
        char v17 = +[NSAssertionHandler currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"AnchoredValueGenerator.m" lineNumber:313 description:@"Anchored value: unable to find nearest value."];

        double v8 = 0.0;
        goto LABEL_10;
      }
      if (v7 && v6)
      {
        [(id)v7 size];
        double v13 = v12 - a3;
        if (v13 >= 0.0) {
          double v14 = v13;
        }
        else {
          double v14 = -v13;
        }
        [(id)v6 size];
        double v16 = v15 - a3;
        if (v16 < 0.0) {
          double v16 = -v16;
        }
        if (v14 < v16) {
          goto LABEL_5;
        }
      }
      else if (v7)
      {
LABEL_5:
        double v9 = (void *)v7;
LABEL_9:
        [v9 value];
        double v8 = v10;
        goto LABEL_10;
      }
    }
    double v9 = (void *)v6;
    goto LABEL_9;
  }
  double v8 = v21;
LABEL_10:

  return v8;
}

- (void)setRoundingType:(int)a3
{
  self->_roundingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLastResult, 0);

  objc_storeStrong((id *)&self->_pairs, 0);
}

@end