@interface UIViewController
- (id)recursiveDescription;
- (void)addDescriptionToString:(id)a3 indentLevel:(int64_t)a4;
@end

@implementation UIViewController

- (id)recursiveDescription
{
  v3 = +[NSMutableString stringWithFormat:&stru_10760];
  [(UIViewController *)self addDescriptionToString:v3 indentLevel:0];

  return v3;
}

- (void)addDescriptionToString:(id)a3 indentLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = [&stru_10760 stringByPaddingToLength:a4 withString:@" " startingAtIndex:0];
  [v6 appendString:v7];
  v8 = [(UIViewController *)self debugDescription];
  v9 = [(UIViewController *)self view];
  [v9 frame];
  v10 = NSStringFromCGRect(v23);
  [v6 appendFormat:@"%@, %@", v8, v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(UIViewController *)self childViewControllers];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    int64_t v15 = a4 + 1;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v16);
        [v6 appendFormat:@"\n%@>", v7];
        [v17 addDescriptionToString:v6 indentLevel:v15];
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

@end