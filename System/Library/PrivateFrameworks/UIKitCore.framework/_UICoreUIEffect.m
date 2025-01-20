@interface _UICoreUIEffect
+ (id)_coreUIImplementationForStyle:(int64_t)a3;
+ (id)coreUIEffectForBlurStyle:(int64_t)a3;
@end

@implementation _UICoreUIEffect

+ (id)_coreUIImplementationForStyle:(int64_t)a3
{
  return 0;
}

+ (id)coreUIEffectForBlurStyle:(int64_t)a3
{
  v3 = [a1 _coreUIImplementationForStyle:a3];
  if (v3) {
    id v4 = [(UIBlurEffect *)[_UICoreUIEffect alloc] _initWithImplementation:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end