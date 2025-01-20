@interface _TUIFlexibleStrictEqualWidthLayoutController
- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4;
@end

@implementation _TUIFlexibleStrictEqualWidthLayoutController

- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4
{
  if ((unint64_t)[(NSMutableArray *)self->super.super._layouts count] < 2) {
    return NAN;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->super.super._layouts;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = (float *)sub_E4EF0(&self->super.super._layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v16);
        double v10 = fmax(v10, v12[6] - fmax((float)(v12[6] - v12[7]), 0.0));
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  double v14 = v10 * (double)(unint64_t)[(NSMutableArray *)self->super.super._layouts count]
      - self->super.super._layoutTotalLength
      + a3;
  BOOL IsLessThanOrAlmostEqualFloat = TUICGFloatIsLessThanOrAlmostEqualFloat(v14, a4);
  double result = NAN;
  if (!IsLessThanOrAlmostEqualFloat) {
    return v14;
  }
  return result;
}

@end