@interface _NTKBundleDisabledComplicationLoader
- (BOOL)isEqual:(id)a3;
@end

@implementation _NTKBundleDisabledComplicationLoader

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end