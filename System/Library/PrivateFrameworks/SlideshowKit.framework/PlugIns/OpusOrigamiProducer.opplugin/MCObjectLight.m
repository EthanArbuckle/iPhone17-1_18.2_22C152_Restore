@interface MCObjectLight
+ (id)objectWithImprint:(id)a3;
- (id)imprint;
@end

@implementation MCObjectLight

+ (id)objectWithImprint:(id)a3
{
  id result = NSClassFromString((NSString *)[a3 objectForKey:@"type"]);
  if (result)
  {
    id v5 = [objc_alloc((Class)result) initWithImprint:a3];
    return v5;
  }
  return result;
}

- (id)imprint
{
  v2 = (objc_class *)objc_opt_class();
  return +[NSMutableDictionary dictionaryWithObjectsAndKeys:NSStringFromClass(v2), @"type", 0];
}

@end