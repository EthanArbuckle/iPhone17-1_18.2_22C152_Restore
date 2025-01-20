@interface OADGrayscaleEffect
- (OADGrayscaleEffect)init;
@end

@implementation OADGrayscaleEffect

- (OADGrayscaleEffect)init
{
  return [(OADBlipEffect *)self initWithType:0];
}

@end