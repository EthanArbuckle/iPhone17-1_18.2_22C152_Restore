@interface SMSScreenshotUIImages
+ (id)captureScreenshot;
+ (id)getKeyWindow;
+ (id)imageFromView:(id)a3;
+ (void)saveImage:(id)a3 filePath:(id)a4 fileName:(id)a5 withHeader:(id)a6;
@end

@implementation SMSScreenshotUIImages

+ (id)captureScreenshot
{
  v3 = [a1 getKeyWindow];
  v4 = [a1 imageFromView:v3];

  return v4;
}

+ (id)getKeyWindow
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 connectedScenes];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (![v9 activationState])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            v11 = [v10 windows];
            id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v20;
              while (2)
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v20 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
                  if ([v16 isKeyWindow])
                  {
                    id v17 = v16;

                    goto LABEL_22;
                  }
                }
                id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v13) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v17 = 0;
    }
    while (v6);
  }
  else
  {
    id v17 = 0;
  }
LABEL_22:

  return v17;
}

+ (id)imageFromView:(id)a3
{
  id v3 = a3;
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  v11.width = v5;
  v11.height = v6;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);

  uint64_t v7 = +[UIScreen mainScreen];
  [v7 bounds];
  [v3 drawViewHierarchyInRect:1];

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

+ (void)saveImage:(id)a3 filePath:(id)a4 fileName:(id)a5 withHeader:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  CGSize v11 = (UIImage *)a3;
  id v12 = +[NSString stringWithFormat:@"%@.png", a5];
  id v13 = [v10 stringByAppendingPathComponent:v12];

  uint64_t v14 = +[NSFileManager defaultManager];
  unsigned int v15 = [v14 fileExistsAtPath:v13];

  if (v15)
  {
    v16 = +[NSFileManager defaultManager];
    [v16 removeItemAtPath:v13 error:0];
  }
  id v20 = 0;
  [v9 writeToFile:v13 atomically:1 encoding:4 error:&v20];
  id v17 = v20;
  v18 = UIImagePNGRepresentation(v11);

  [v18 writeToFile:v13 atomically:1];
  long long v19 = +[NSFileHandle fileHandleForWritingAtPath:v13];
  if (v19 && !v17 || (NSLog(@"|--ERROR: Failed to generate file handle at path %@. %@--|", v13, v17), v19)) {
    [v19 closeFile];
  }
}

@end