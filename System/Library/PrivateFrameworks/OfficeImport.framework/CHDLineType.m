@interface CHDLineType
- (CHDLineType)initWithChart:(id)a3;
- (int)defaultLabelPosition;
@end

@implementation CHDLineType

- (CHDLineType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDLineType;
  result = [(CHDChartTypeWithGrouping *)&v4 initWithChart:a3];
  if (result) {
    *((_DWORD *)&result->super.super.mVaryColors + 1) = 3;
  }
  return result;
}

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->super.super.mDefaultDataLabel;
  if (!mDefaultDataLabel || ![(CHDDataLabel *)mDefaultDataLabel position]) {
    return 8;
  }
  objc_super v4 = self->super.super.mDefaultDataLabel;
  return [(CHDDataLabel *)v4 position];
}

@end