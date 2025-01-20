@interface CHDScatterType
- (BOOL)isSmoothType;
- (int)defaultLabelPosition;
@end

@implementation CHDScatterType

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->super.mDefaultDataLabel;
  if (!mDefaultDataLabel || ![(CHDDataLabel *)mDefaultDataLabel position]) {
    return 6;
  }
  v4 = self->super.mDefaultDataLabel;
  return [(CHDDataLabel *)v4 position];
}

- (BOOL)isSmoothType
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
      char v7 = [v6 isSmooth];

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

@end