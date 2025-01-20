@interface MSDXattr
+ (BOOL)hasXattr:(id)a3 path:(id)a4;
+ (BOOL)isContentRoot:(id)a3;
+ (BOOL)isContentRootToRemove:(id)a3;
+ (BOOL)isNotExtracted:(id)a3;
+ (BOOL)removeXattr:(id)a3;
+ (BOOL)setContentRoot:(id)a3;
+ (BOOL)setContentRootToRemove:(id)a3;
+ (BOOL)setIsNotBackedUp:(id)a3;
+ (BOOL)setIsNotExtracted:(id)a3;
+ (BOOL)setIsNotRestored:(id)a3;
+ (BOOL)setXattr:(id)a3 path:(id)a4;
+ (BOOL)setXattr:(id)a3 value:(id)a4 path:(id)a5;
@end

@implementation MSDXattr

+ (BOOL)isNotExtracted:(id)a3
{
  return +[MSDXattr hasXattr:@"NotExtracted" path:a3];
}

+ (BOOL)isContentRoot:(id)a3
{
  id v3 = a3;
  if (+[MSDXattr hasXattr:@"ContentRoot" path:v3]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = +[MSDXattr hasXattr:@"ContentRootToRemove" path:v3];
  }

  return v4;
}

+ (BOOL)isContentRootToRemove:(id)a3
{
  return +[MSDXattr hasXattr:@"ContentRootToRemove" path:a3];
}

+ (BOOL)removeXattr:(id)a3
{
  id v3 = a3;
  BOOL v4 = (const char *)[@"MSDAnnotation" UTF8String];
  id v5 = v3;
  int v6 = removexattr((const char *)[v5 fileSystemRepresentation], v4, 1);
  if (v6)
  {
    v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002AE88();
    }
  }
  return v6 == 0;
}

+ (BOOL)setContentRoot:(id)a3
{
  return +[MSDXattr setXattr:@"ContentRoot" path:a3];
}

+ (BOOL)setContentRootToRemove:(id)a3
{
  return +[MSDXattr setXattr:@"ContentRootToRemove" path:a3];
}

+ (BOOL)setIsNotExtracted:(id)a3
{
  return +[MSDXattr setXattr:@"NotExtracted" path:a3];
}

+ (BOOL)setIsNotBackedUp:(id)a3
{
  return +[MSDXattr setXattr:@"MBRestoreAnnotation" value:@"NotBackedUp" path:a3];
}

+ (BOOL)setIsNotRestored:(id)a3
{
  return +[MSDXattr setXattr:@"MBRestoreAnnotation" value:@"NotRestored" path:a3];
}

+ (BOOL)hasXattr:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = (const char *)[@"MSDAnnotation" UTF8String];
  id v9 = v6;
  v10 = (const char *)[v9 fileSystemRepresentation];
  ssize_t v11 = getxattr(v10, v8, 0, 0, 0, 1);
  if (v11 < 0)
  {
    if (*__error() == 93)
    {
      id v12 = 0;
      id v14 = 0;
      goto LABEL_9;
    }
    v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002AF0C((uint64_t)v9, v11, v15);
    }
    id v12 = 0;
LABEL_13:
    id v14 = 0;
    BOOL v16 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v12 = +[NSMutableData dataWithLength:v11];
  ssize_t v13 = getxattr(v10, v8, [v12 mutableBytes], v11, 0, 1);
  if (v13 < 0)
  {
    v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002AF94();
    }
    goto LABEL_13;
  }
  [v12 setLength:v13];
  id v14 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
  if ([v14 isEqualToString:v7])
  {
    v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Has expected xattr %{public}@", (uint8_t *)&v18, 0x16u);
    }
    BOOL v16 = 1;
    goto LABEL_14;
  }
LABEL_9:
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

+ (BOOL)setXattr:(id)a3 path:(id)a4
{
  return +[MSDXattr setXattr:@"MSDAnnotation" value:a3 path:a4];
}

+ (BOOL)setXattr:(id)a3 value:(id)a4 path:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 dataUsingEncoding:4];
  id v10 = v8;
  ssize_t v11 = (const char *)[v10 fileSystemRepresentation];
  id v12 = v7;
  ssize_t v13 = (const char *)[v12 UTF8String];
  id v14 = v9;
  int v15 = setxattr(v11, v13, [v14 bytes], (size_t)[v14 length], 0, 1);
  if (v15)
  {
    v17 = sub_100027250();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002B018((uint64_t)v12, (uint64_t)v10, v17);
    }
  }
  return v15 == 0;
}

@end