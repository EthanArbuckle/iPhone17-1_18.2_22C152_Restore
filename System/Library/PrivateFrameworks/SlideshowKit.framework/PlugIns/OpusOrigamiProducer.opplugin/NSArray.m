@interface NSArray
- (void)removeImages;
@end

@implementation NSArray

- (void)removeImages
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(NSArray *)self countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(self);
        }
        objc_msgSend(objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "objectForKey:", @"image"), "removingFromCollection");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)self countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end