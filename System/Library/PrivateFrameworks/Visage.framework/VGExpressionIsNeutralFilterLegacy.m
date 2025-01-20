@interface VGExpressionIsNeutralFilterLegacy
- (VGExpressionIsNeutralFilterLegacy)init;
- (float)filter:(id)a3;
- (id).cxx_construct;
- (int)rejectionReason;
@end

@implementation VGExpressionIsNeutralFilterLegacy

- (VGExpressionIsNeutralFilterLegacy)init
{
  v3.receiver = self;
  v3.super_class = (Class)VGExpressionIsNeutralFilterLegacy;
  if ([(VGExpressionIsNeutralFilterLegacy *)&v3 init]) {
    operator new();
  }

  return 0;
}

- (int)rejectionReason
{
  return 18;
}

- (float)filter:(id)a3
{
  (*(void (**)(VGExpressionIsNeutralFilter *, id))(*(void *)self->_expressionIsNeutralFilter.__ptr_.__value_
                                                            + 16))(self->_expressionIsNeutralFilter.__ptr_.__value_, a3);
  return result;
}

- (void).cxx_destruct
{
  value = self->_expressionIsNeutralFilter.__ptr_.__value_;
  self->_expressionIsNeutralFilter.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end