@interface NSInvocation
- (id)_maps_copy;
@end

@implementation NSInvocation

- (id)_maps_copy
{
  v3 = [(NSInvocation *)self methodSignature];
  v4 = +[NSInvocation invocationWithMethodSignature:v3];

  [v4 setSelector:[self selector]];
  v5 = [(NSInvocation *)self target];
  [v4 setTarget:v5];

  v6 = [(NSInvocation *)self methodSignature];
  id v7 = [v6 numberOfArguments];

  if ((unint64_t)v7 >= 3)
  {
    for (uint64_t i = 2; (id)i != v7; ++i)
    {
      uint64_t v10 = 0;
      [(NSInvocation *)self getArgument:&v10 atIndex:i];
      [v4 setArgument:&v10 atIndex:i];
    }
  }
  [v4 retainArguments];

  return v4;
}

@end