@interface SBFailingSystemGestureRecognizer
- (SBFailingSystemGestureRecognizer)init;
- (SBFailingSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SBFailingSystemGestureRecognizer

- (SBFailingSystemGestureRecognizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBFailingSystemGestureRecognizer;
  return [(SBFailingSystemGestureRecognizer *)&v3 initWithTarget:0 action:0];
}

- (SBFailingSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%s is not a valid initializer. You must call -[%@ init].", "-[SBFailingSystemGestureRecognizer initWithTarget:action:]", v8 format];

  return [(SBFailingSystemGestureRecognizer *)self init];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

@end