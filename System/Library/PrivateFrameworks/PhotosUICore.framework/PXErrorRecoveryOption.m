@interface PXErrorRecoveryOption
+ (id)recoveryOptionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (NSString)title;
- (PXErrorRecoveryOption)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (id)handler;
- (int64_t)style;
- (void)_attemptRecoveryFromError:(id)a3 completionHandler:(id)a4;
- (void)setHandler:(id)a3;
@end

@implementation PXErrorRecoveryOption

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (void)_attemptRecoveryFromError:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXErrorRecovery.m", 40, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v8 = [(PXErrorRecoveryOption *)self handler];
  v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, id, void (**)(id, uint64_t)))(v8 + 16))(v8, v11, v7);
  }
  else {
    v7[2](v7, 1);
  }
}

- (PXErrorRecoveryOption)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXErrorRecoveryOption;
  v10 = [(PXErrorRecoveryOption *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v10->_style = a4;
    uint64_t v13 = [v9 copy];
    id handler = v10->_handler;
    v10->_id handler = (id)v13;
  }
  return v10;
}

+ (id)recoveryOptionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 style:a4 handler:v8];

  return v10;
}

@end