@interface SUDescriptor
- (BOOL)isEqualToDescriptor:(id)a3;
@end

@implementation SUDescriptor

- (BOOL)isEqualToDescriptor:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = *(void **)((char *)v8 + OBJC_IVAR___SUDescriptor__humanReadableUpdateName);
  id v5 = [location[0] humanReadableUpdateName];
  unsigned __int8 v6 = objc_msgSend(v4, "isEqualToString:");

  objc_storeStrong(location, 0);
  return v6 & 1;
}

@end