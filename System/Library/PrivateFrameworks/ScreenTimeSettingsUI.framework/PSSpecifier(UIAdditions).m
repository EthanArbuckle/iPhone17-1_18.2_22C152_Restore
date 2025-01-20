@interface PSSpecifier(UIAdditions)
- (void)st_startSpinner;
- (void)st_stopSpinner;
@end

@implementation PSSpecifier(UIAdditions)

- (void)st_startSpinner
{
  id v2 = [a1 propertyForKey:*MEMORY[0x263F602B0]];
  if (v2)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v1 startAnimating];
    [v2 setAccessoryView:v1];
  }
}

- (void)st_stopSpinner
{
  id v3 = [a1 propertyForKey:*MEMORY[0x263F602B0]];
  if (v3)
  {
    id v2 = [a1 propertyForKey:*MEMORY[0x263F60028]];
    [v3 setAccessoryView:v2];
  }
}

@end