@interface CHDBubbleType
- (BOOL)is3DType;
- (BOOL)isShowNegBubbles;
- (BOOL)isSizeRepresentingRadius;
- (CHDBubbleType)initWithChart:(id)a3;
- (int)bubbleScale;
- (int)defaultLabelPosition;
- (void)setBubbleScale:(int)a3;
- (void)setShowNegBubbles:(BOOL)a3;
- (void)setSizeRepresentsRadius:(BOOL)a3;
@end

@implementation CHDBubbleType

- (CHDBubbleType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDBubbleType;
  result = [(CHDChartType *)&v4 initWithChart:a3];
  if (result) {
    *((_DWORD *)&result->super.mVaryColors + 1) = 100;
  }
  return result;
}

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->super.mDefaultDataLabel;
  if (!mDefaultDataLabel || ![(CHDDataLabel *)mDefaultDataLabel position]) {
    return 6;
  }
  objc_super v4 = self->super.mDefaultDataLabel;
  return [(CHDDataLabel *)v4 position];
}

- (BOOL)is3DType
{
  v2 = [(CHDChartType *)self seriesCollection];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [v2 objectAtIndex:v4];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v8 = 2;
        goto LABEL_9;
      }
      id v6 = v5;
      char v7 = [v6 isBubble3D];

      if (v7) {
        break;
      }

      if (v3 == ++v4) {
        goto LABEL_6;
      }
    }
    int v8 = 1;
LABEL_9:
  }
  else
  {
LABEL_6:
    int v8 = 2;
  }

  return v8 != 2;
}

- (BOOL)isShowNegBubbles
{
  return *(&self->super.mVaryColors + 1);
}

- (void)setShowNegBubbles:(BOOL)a3
{
  *(&self->super.mVaryColors + 1) = a3;
}

- (int)bubbleScale
{
  return *((_DWORD *)&self->super.mVaryColors + 1);
}

- (void)setBubbleScale:(int)a3
{
  *((_DWORD *)&self->super.mVaryColors + 1) = a3;
}

- (BOOL)isSizeRepresentingRadius
{
  return *(&self->super.mVaryColors + 2);
}

- (void)setSizeRepresentsRadius:(BOOL)a3
{
  *(&self->super.mVaryColors + 2) = a3;
}

@end