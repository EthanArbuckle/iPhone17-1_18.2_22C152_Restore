@interface CRLCanvasSelection
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation CRLCanvasSelection

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

@end