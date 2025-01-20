@interface NSObject
- (id)_tui_getClassPropertyList;
- (void)tui_assertCopyHasCorrectProperties:(id)a3;
@end

@implementation NSObject

- (void)tui_assertCopyHasCorrectProperties:(id)a3
{
}

- (id)_tui_getClassPropertyList
{
  unsigned int outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  v3 = class_copyPropertyList(v2, &outCount);
  v4 = +[NSMutableArray arrayWithCapacity:outCount];
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v3[i]);
      if (Name)
      {
        v7 = +[NSString stringWithCString:Name encoding:4];
        [v4 addObject:v7];
      }
    }
  }
  free(v3);
  id v8 = [v4 copy];

  return v8;
}

@end