@interface CHDTrendline
+ (id)trendline;
- (BOOL)isDisplayEquation;
- (BOOL)isDisplayRSquaredValue;
- (CHDTrendline)init;
- (double)backward;
- (double)forward;
- (double)interceptYAxis;
- (id)defaultNameWithSeriesName:(id)a3;
- (id)description;
- (id)graphicProperties;
- (id)label;
- (id)name;
- (int)polynomialOrder;
- (int)type;
- (int64_t)movingAveragePeriod;
- (void)setBackward:(double)a3;
- (void)setDisplayEquation:(BOOL)a3;
- (void)setDisplayRSquaredValue:(BOOL)a3;
- (void)setForward:(double)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setInterceptYAxis:(double)a3;
- (void)setLabel:(id)a3;
- (void)setMovingAveragePeriod:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPolynomialOrder:(int)a3;
- (void)setType:(int)a3;
@end

@implementation CHDTrendline

- (CHDTrendline)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHDTrendline;
  v2 = [(CHDTrendline *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mDisplayEquation = 0;
    v2->mForward = 0.0;
    v2->mInterceptYAxis = 0.0;
    v2->mBackward = 0.0;
    v2->mPolynomialOrder = 2;
    v2->mMovingAveragePeriod = 0;
    v2->mType = 1;
    mGraphicProperties = v2->mGraphicProperties;
    v2->mGraphicProperties = 0;

    mLabel = v3->mLabel;
    v3->mLabel = 0;

    mName = v3->mName;
    v3->mName = 0;
  }
  return v3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setLabel:(id)a3
{
  v5 = (CHDTrendlineLabel *)a3;
  mLabel = self->mLabel;
  p_mLabel = &self->mLabel;
  if (mLabel != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mLabel, a3);
    v5 = v8;
  }
}

- (void)setDisplayEquation:(BOOL)a3
{
  self->mDisplayEquation = a3;
}

- (void)setDisplayRSquaredValue:(BOOL)a3
{
  self->mDisplayRSquaredValue = a3;
}

- (void)setBackward:(double)a3
{
  self->mBackward = a3;
}

- (void)setForward:(double)a3
{
  self->mForward = a3;
}

- (void)setInterceptYAxis:(double)a3
{
  self->mInterceptYAxis = a3;
}

- (void)setGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }
}

+ (id)trendline
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (void)setPolynomialOrder:(int)a3
{
  self->mPolynomialOrder = a3;
}

- (void)setMovingAveragePeriod:(int64_t)a3
{
  self->mMovingAveragePeriod = a3;
}

- (BOOL)isDisplayEquation
{
  return self->mDisplayEquation;
}

- (BOOL)isDisplayRSquaredValue
{
  return self->mDisplayRSquaredValue;
}

- (double)backward
{
  return self->mBackward;
}

- (double)forward
{
  return self->mForward;
}

- (double)interceptYAxis
{
  return self->mInterceptYAxis;
}

- (int)polynomialOrder
{
  return self->mPolynomialOrder;
}

- (int64_t)movingAveragePeriod
{
  return self->mMovingAveragePeriod;
}

- (int)type
{
  return self->mType;
}

- (id)label
{
  return self->mLabel;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  v5 = (EDString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }
}

- (id)defaultNameWithSeriesName:(id)a3
{
  id v4 = a3;
  switch(self->mType)
  {
    case 0:
      v5 = @"Expon.";
      break;
    case 1:
      v5 = @"Linear.";
      break;
    case 2:
      v5 = @"Log.";
      break;
    case 3:
      objc_msgSend(NSString, "stringWithFormat:", @"%ld per. Mov. Avg.", self->mMovingAveragePeriod);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v5 = @"Poly.";
      break;
    case 5:
      v5 = @"Power.";
      break;
    default:
      v5 = &stru_26EBF24D8;
      break;
  }
  v6 = NSString;
  v7 = [v4 string];
  objc_super v8 = [v6 stringWithFormat:@"%@(%@)", v5, v7];
  v9 = +[EDString edStringWithString:v8];

  return v9;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDTrendline;
  id v2 = [(CHDTrendline *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mLabel, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
}

@end