@interface NTKFloatCurve
- (NTKFloatCurve)initWithFloatCurveElements:(id)a3;
- (double)floatValueForFraction:(double)a3;
@end

@implementation NTKFloatCurve

- (NTKFloatCurve)initWithFloatCurveElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKFloatCurve;
  v5 = [(NTKFloatCurve *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_106];
    valueCurveElements = v5->_valueCurveElements;
    v5->_valueCurveElements = (NSArray *)v6;
  }
  return v5;
}

uint64_t __44__NTKFloatCurve_initWithFloatCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 fraction];
  double v7 = v6;
  [v5 fraction];
  if (v7 <= v8)
  {
    [v4 fraction];
    double v11 = v10;
    [v5 fraction];
    if (v11 >= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (double)floatValueForFraction:(double)a3
{
  if ([(NSArray *)self->_valueCurveElements count])
  {
    NSUInteger v5 = [(NSArray *)self->_valueCurveElements count];
    double v6 = [(NSArray *)self->_valueCurveElements firstObject];
    double v7 = v6;
    if (v5 != 1)
    {
      [v6 fraction];
      double v9 = v8;

      valueCurveElements = self->_valueCurveElements;
      if (v9 >= a3)
      {
        double v6 = [(NSArray *)valueCurveElements firstObject];
      }
      else
      {
        double v11 = [(NSArray *)valueCurveElements lastObject];
        [v11 fraction];
        double v13 = v12;

        v14 = self->_valueCurveElements;
        if (v13 > a3)
        {
          v15 = [(NSArray *)v14 objectAtIndex:0];
          v16 = [(NSArray *)self->_valueCurveElements objectAtIndex:1];
          if ([(NSArray *)self->_valueCurveElements count] < 2)
          {
LABEL_10:
            v18 = v16;
            double v7 = v15;
          }
          else
          {
            uint64_t v17 = 1;
            while (1)
            {
              double v7 = [(NSArray *)self->_valueCurveElements objectAtIndexedSubscript:v17 - 1];
              v18 = [(NSArray *)self->_valueCurveElements objectAtIndexedSubscript:v17];
              [v7 fraction];
              if (v19 <= a3)
              {
                [v18 fraction];
                if (v20 >= a3) {
                  break;
                }
              }

              if (++v17 >= [(NSArray *)self->_valueCurveElements count]) {
                goto LABEL_10;
              }
            }
          }
          [v7 fraction];
          float v22 = a3 - v21;
          [v18 fraction];
          double v24 = v23;
          [v7 fraction];
          *(float *)&double v25 = v24 - v25;
          *(float *)&double v24 = v22 / *(float *)&v25;
          v26 = [v18 timingFunction];
          LODWORD(v27) = LODWORD(v24);
          [v26 _solveForInput:v27];

          [v7 floatValue];
          [v18 floatValue];
          CLKInterpolateBetweenFloatsClipped();
          double v29 = v28;

          goto LABEL_17;
        }
        double v6 = [(NSArray *)v14 lastObject];
      }
      double v7 = v6;
    }
    [v6 floatValue];
    double v29 = v30;
LABEL_17:

    return v29;
  }
  return 0.0;
}

- (void).cxx_destruct
{
}

@end