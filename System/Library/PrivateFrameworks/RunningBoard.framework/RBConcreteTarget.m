@interface RBConcreteTarget
+ (id)systemTarget;
+ (id)targetWithIdentity:(id)a3 environment:(id)a4;
+ (id)targetWithProcess:(id)a3 environment:(id)a4;
- (BOOL)isSystem;
- (NSString)description;
- (NSString)environment;
- (RBProcess)process;
- (RBSProcessIdentity)identity;
- (id)createRBSTarget;
@end

@implementation RBConcreteTarget

+ (id)targetWithProcess:(id)a3 environment:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = a4;
    v8 = [RBComplexConcreteTarget alloc];
    v9 = [v6 identity];
    v10 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]((id *)&v8->super.super.isa, v6, v9, v7);
  }
  else
  {
    v10 = (id *)v5;
  }

  return v10;
}

+ (id)targetWithIdentity:(id)a3 environment:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = a4;
    v8 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]((id *)[RBComplexConcreteTarget alloc], 0, v6, v7);
  }
  else
  {
    v8 = (id *)v5;
  }

  return v8;
}

- (BOOL)isSystem
{
  return 1;
}

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1) {
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)systemTarget_systemTarget;
  return v2;
}

uint64_t __32__RBConcreteTarget_systemTarget__block_invoke()
{
  systemTarget_systemTarget = objc_alloc_init(RBConcreteTarget);
  return MEMORY[0x270F9A758]();
}

- (id)createRBSTarget
{
  return (id)[MEMORY[0x263F64630] systemTarget];
}

- (RBProcess)process
{
  return 0;
}

- (RBSProcessIdentity)identity
{
  return 0;
}

- (NSString)environment
{
  return 0;
}

- (NSString)description
{
  return (NSString *)@"system";
}

@end