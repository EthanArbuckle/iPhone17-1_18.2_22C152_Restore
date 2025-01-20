@interface PKBillPaymentRingGradientState
- (PKBillPaymentRingGradientState)initWithStartColor:(id)a3 endColor:(id)a4;
- (UIColor)endColor;
- (UIColor)startColor;
@end

@implementation PKBillPaymentRingGradientState

- (PKBillPaymentRingGradientState)initWithStartColor:(id)a3 endColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBillPaymentRingGradientState;
  v9 = [(PKBillPaymentRingGradientState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startColor, a3);
    objc_storeStrong((id *)&v10->_endColor, a4);
  }

  return v10;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (UIColor)endColor
{
  return self->_endColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColor, 0);

  objc_storeStrong((id *)&self->_startColor, 0);
}

@end