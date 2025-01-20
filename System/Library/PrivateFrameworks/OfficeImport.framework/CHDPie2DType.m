@interface CHDPie2DType
- (BOOL)hasExplosion;
- (BOOL)isBarOfPieType;
- (BOOL)isDoughnutType;
- (BOOL)isPieOfPieType;
- (CHDPie2DType)initWithChart:(id)a3;
- (id)contentFormat;
- (int)defaultLabelPosition;
- (int)firstSliceAngle;
- (void)setBarOfPieType:(BOOL)a3;
- (void)setDoughnutType:(BOOL)a3;
- (void)setFirstSliceAngle:(int)a3;
- (void)setPieOfPieType:(BOOL)a3;
@end

@implementation CHDPie2DType

- (CHDPie2DType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDPie2DType;
  result = [(CHDChartType *)&v4 initWithChart:a3];
  if (result)
  {
    *((_DWORD *)&result->super.mVaryColors + 1) = 0;
    LOBYTE(result->mFirstSliceAngle) = 0;
    BYTE1(result->mFirstSliceAngle) = 0;
    BYTE2(result->mFirstSliceAngle) = 0;
  }
  return result;
}

- (void)setFirstSliceAngle:(int)a3
{
  *((_DWORD *)&self->super.mVaryColors + 1) = a3;
}

- (BOOL)isDoughnutType
{
  return self->mFirstSliceAngle;
}

- (void)setDoughnutType:(BOOL)a3
{
  LOBYTE(self->mFirstSliceAngle) = a3;
}

- (void)setPieOfPieType:(BOOL)a3
{
  BYTE1(self->mFirstSliceAngle) = a3;
}

- (int)firstSliceAngle
{
  return *((_DWORD *)&self->super.mVaryColors + 1);
}

- (BOOL)isPieOfPieType
{
  return BYTE1(self->mFirstSliceAngle);
}

- (BOOL)isBarOfPieType
{
  return BYTE2(self->mFirstSliceAngle);
}

- (void)setBarOfPieType:(BOOL)a3
{
  BYTE2(self->mFirstSliceAngle) = a3;
}

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->super.mDefaultDataLabel;
  if (!mDefaultDataLabel || ![(CHDDataLabel *)mDefaultDataLabel position]) {
    return 9;
  }
  objc_super v4 = self->super.mDefaultDataLabel;
  return [(CHDDataLabel *)v4 position];
}

- (id)contentFormat
{
  v3 = [(CHDChartType *)self seriesCollection];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(CHDChartType *)self seriesCollection];
    WeakRetained = [v5 objectAtIndex:0];

    v7 = [WeakRetained valueData];
    v8 = [v7 contentFormat];

    if (v8)
    {
LABEL_10:

      goto LABEL_11;
    }
    v9 = [WeakRetained defaultDataLabel];

    if (v9)
    {
      v10 = [WeakRetained defaultDataLabel];
      v8 = [v10 contentFormat];

      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  v11 = [(CHDChartType *)self defaultDataLabel];

  if (!v11
    || ([(CHDChartType *)self defaultDataLabel],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 contentFormat],
        v8 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
    v8 = [WeakRetained defaultContentFormat];
    goto LABEL_10;
  }
LABEL_11:
  return v8;
}

- (BOOL)hasExplosion
{
  v16 = [(CHDChartType *)self seriesCollection];
  uint64_t v2 = [v16 count];
  if (v2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v4 = [v16 objectAtIndex:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_14;
      }
      id v6 = v4;
      if ((int)[v6 explosion] >= 1)
      {

LABEL_14:
        goto LABEL_15;
      }
      v7 = [v6 dataValuePropertiesCollection];
      v15 = v4;
      uint64_t v8 = v2;
      unint64_t v9 = objc_msgSend(v7, "count", v15);
      if (v9)
      {
        uint64_t v10 = 0;
        BOOL v11 = 1;
        while (1)
        {
          objc_opt_class();
          v12 = [v7 objectAtIndex:v10];
          int v13 = [v12 explosion];

          if (v13 >= 1) {
            break;
          }
          BOOL v11 = ++v10 < v9;
          if (v9 == v10) {
            goto LABEL_9;
          }
        }

        if (v11)
        {
          char isKindOfClass = 1;
          goto LABEL_15;
        }
      }
      else
      {
LABEL_9:
      }
      uint64_t v2 = v8;
    }
  }
  char isKindOfClass = 0;
LABEL_15:

  return isKindOfClass & 1;
}

@end