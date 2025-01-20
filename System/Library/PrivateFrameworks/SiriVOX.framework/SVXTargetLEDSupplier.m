@interface SVXTargetLEDSupplier
- (BOOL)isSecondGeneration;
- (unsigned)get;
@end

@implementation SVXTargetLEDSupplier

- (BOOL)isSecondGeneration
{
  return MGGetProductType() == 1540760353;
}

- (unsigned)get
{
  if ([(SVXTargetLEDSupplier *)self isSecondGeneration]) {
    return 38;
  }
  else {
    return 30;
  }
}

@end