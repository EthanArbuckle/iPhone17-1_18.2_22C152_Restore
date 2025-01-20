@interface TPSBlockValidation
+ (id)blockValidationWithBlock:(id)a3;
- (TPSBlockValidation)initWithValidationBlock:(id)a3;
- (id)validationBlock;
- (void)setValidationBlock:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSBlockValidation

- (void).cxx_destruct
{
}

- (void)validateWithCompletion:(id)a3
{
  id v6 = a3;
  v4 = [(TPSBlockValidation *)self validationBlock];

  if (v4)
  {
    v5 = [(TPSBlockValidation *)self validationBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (id)validationBlock
{
  return self->_validationBlock;
}

+ (id)blockValidationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValidationBlock:v3];

  return v4;
}

- (TPSBlockValidation)initWithValidationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSBlockValidation;
  v5 = [(TPSBlockValidation *)&v9 init];
  if (v5)
  {
    id v6 = _Block_copy(v4);
    id validationBlock = v5->_validationBlock;
    v5->_id validationBlock = v6;
  }
  return v5;
}

- (void)setValidationBlock:(id)a3
{
}

@end