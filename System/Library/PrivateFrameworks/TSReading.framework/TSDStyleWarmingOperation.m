@interface TSDStyleWarmingOperation
- (TSDStyleWarmingOperation)initWithStyle:(id)a3 property:(int)a4 accessController:(id)a5;
- (void)main;
- (void)warm;
@end

@implementation TSDStyleWarmingOperation

- (TSDStyleWarmingOperation)initWithStyle:(id)a3 property:(int)a4 accessController:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSDStyleWarmingOperation;
  result = [(TSDStyleWarmingOperation *)&v9 init];
  if (result)
  {
    result->mStyle = (TSSStyle *)a3;
    result->mProperty = a4;
    result->mAccessController = (TSKAccessController *)a5;
  }
  return result;
}

- (void)main
{
}

- (void)warm
{
  objc_opt_class();
  [(TSSStyle *)self->mStyle valueForProperty:self->mProperty];
  v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v4 = (void *)[v3 imageData];
    v5 = (void *)MEMORY[0x223CB9570]();
    [v4 NSData];
  }
}

@end