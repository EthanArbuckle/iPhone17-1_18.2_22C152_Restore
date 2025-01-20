@interface SXParallaxComponentBehavior
- (Class)handlerClassForComponent:(id)a3;
- (int)cachedDirection;
- (int)directionWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXParallaxComponentBehavior

- (int)directionWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  if (![(SXParallaxComponentBehavior *)self cachedDirection])
  {
    self->_cachedDirection = 1;
    if ([v5 isEqualToString:@"down"])
    {
      int v7 = 3;
    }
    else
    {
      if (![v5 isEqualToString:@"up"])
      {
LABEL_8:
        int v6 = 1;
        goto LABEL_9;
      }
      int v7 = 2;
    }
    self->_cachedDirection = v7;
    goto LABEL_8;
  }
  int v6 = [(SXParallaxComponentBehavior *)self cachedDirection];
LABEL_9:

  return v6;
}

- (Class)handlerClassForComponent:(id)a3
{
  return (Class)objc_opt_class();
}

- (int)cachedDirection
{
  return self->_cachedDirection;
}

@end