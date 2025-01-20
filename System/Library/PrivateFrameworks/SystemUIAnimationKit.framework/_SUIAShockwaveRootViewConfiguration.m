@interface _SUIAShockwaveRootViewConfiguration
+ (int64_t)configurationType;
- (BOOL)hidden;
- (void)_setHidden:(BOOL)a3;
@end

@implementation _SUIAShockwaveRootViewConfiguration

- (void)_setHidden:(BOOL)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"hidden"];
}

- (BOOL)hidden
{
  BOOL v4 = 0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"hidden"];
  [v2 getValue:&v4 size:1];

  return v4;
}

+ (int64_t)configurationType
{
  return 0;
}

@end