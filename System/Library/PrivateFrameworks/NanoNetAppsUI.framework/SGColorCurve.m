@interface SGColorCurve
- (NSArray)colorCurveElements;
- (SGColorCurve)initWithColorCurveElements:(id)a3;
- (id)colorForFraction:(float)a3;
@end

@implementation SGColorCurve

- (SGColorCurve)initWithColorCurveElements:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGColorCurve;
  v5 = [(SGColorCurve *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_0];
    colorCurveElements = v5->_colorCurveElements;
    v5->_colorCurveElements = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

uint64_t __43__SGColorCurve_initWithColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 fraction];
  float v7 = v6;
  [v5 fraction];
  if (v7 <= v8)
  {
    [v4 fraction];
    float v11 = v10;
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

- (id)colorForFraction:(float)a3
{
  if (![(NSArray *)self->_colorCurveElements count])
  {
    v31 = [MEMORY[0x263F825C8] blackColor];
    goto LABEL_18;
  }
  NSUInteger v5 = [(NSArray *)self->_colorCurveElements count];
  float v6 = [(NSArray *)self->_colorCurveElements firstObject];
  float v7 = v6;
  if (v5 != 1)
  {
    [v6 fraction];
    float v9 = v8;

    colorCurveElements = self->_colorCurveElements;
    if (v9 >= a3)
    {
      float v6 = [(NSArray *)colorCurveElements firstObject];
    }
    else
    {
      float v11 = [(NSArray *)colorCurveElements lastObject];
      [v11 fraction];
      float v13 = v12;

      v14 = self->_colorCurveElements;
      if (v13 > a3)
      {
        v15 = [(NSArray *)v14 objectAtIndex:0];
        v16 = [(NSArray *)self->_colorCurveElements objectAtIndex:1];
        if ([(NSArray *)self->_colorCurveElements count] < 2)
        {
LABEL_10:
          v18 = v16;
          float v7 = v15;
        }
        else
        {
          uint64_t v17 = 1;
          while (1)
          {
            float v7 = [(NSArray *)self->_colorCurveElements objectAtIndexedSubscript:v17 - 1];
            v18 = [(NSArray *)self->_colorCurveElements objectAtIndexedSubscript:v17];
            [v7 fraction];
            if (v19 <= a3)
            {
              [v18 fraction];
              if (v20 >= a3) {
                break;
              }
            }

            if (++v17 >= [(NSArray *)self->_colorCurveElements count]) {
              goto LABEL_10;
            }
          }
        }
        [v7 fraction];
        float v22 = a3 - v21;
        [v18 fraction];
        float v24 = v23;
        [v7 fraction];
        float v26 = v22 / (float)(v24 - v25);
        v27 = [v18 timingFunction];
        *(float *)&double v28 = v26;
        [v27 _solveForInput:v28];

        v29 = [v7 color];
        v30 = [v18 color];
        v31 = CLKUIInterpolateBetweenColors();

        goto LABEL_17;
      }
      float v6 = [(NSArray *)v14 lastObject];
    }
    float v7 = v6;
  }
  v31 = [v6 color];
LABEL_17:

LABEL_18:
  return v31;
}

- (NSArray)colorCurveElements
{
  return self->_colorCurveElements;
}

- (void).cxx_destruct
{
}

@end