@interface MTDynamicTypeConstant
+ (void)updateDynamicConstantInConstraints:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MTDynamicTypeConstant)initWithDefaultConstant:(double)a3 textStyle:(id)a4;
- (NSString)textStyle;
- (double)currentConstant;
- (double)defaultConstant;
@end

@implementation MTDynamicTypeConstant

- (MTDynamicTypeConstant)initWithDefaultConstant:(double)a3 textStyle:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDynamicTypeConstant;
  v8 = [(MTDynamicTypeConstant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_defaultConstant = a3;
    objc_storeStrong((id *)&v8->_textStyle, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MTDynamicTypeConstant *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      BOOL v6 = 1;
    }
    else
    {
      v5 = v4;
      if ([(NSString *)self->_textStyle isEqual:v5->_textStyle]) {
        BOOL v6 = vabdd_f64(self->_defaultConstant, v5->_defaultConstant) <= 0.00000011920929;
      }
      else {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)currentConstant
{
  +[UIFont mt_scaledConstantForTextStyle:self->_textStyle defaultConstant:self->_defaultConstant];
  return result;
}

+ (void)updateDynamicConstantInConstraints:(id)a3
{
}

- (double)defaultConstant
{
  return self->_defaultConstant;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
}

@end