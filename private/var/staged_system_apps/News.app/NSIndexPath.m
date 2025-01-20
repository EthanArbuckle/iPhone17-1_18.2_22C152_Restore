@interface NSIndexPath
+ (id)fr_firstIndexPath;
+ (id)fr_indexPathsForRows:(id)a3 inSection:(int64_t)a4;
- (id)indexPathInvalidatingIndexesFollowingPosition:(int64_t)a3;
@end

@implementation NSIndexPath

+ (id)fr_firstIndexPath
{
  return +[NSIndexPath indexPathForItem:0 inSection:0];
}

- (id)indexPathInvalidatingIndexesFollowingPosition:(int64_t)a3
{
  if ((char *)[(NSIndexPath *)self length] - 1 <= (char *)a3)
  {
    v6 = self;
  }
  else
  {
    v5 = [(NSIndexPath *)self indexPathByRemovingLastIndex];
    v6 = [v5 indexPathInvalidatingIndexesFollowingPosition:a3];
  }

  return v6;
}

+ (id)fr_indexPathsForRows:(id)a3 inSection:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = objc_opt_new();
    id v7 = [v5 firstIndex];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [v5 indexGreaterThanIndex:i])
      {
        v9 = +[NSIndexPath indexPathForRow:i inSection:a4];
        [v6 addObject:v9];
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100077808();
    }
    v6 = 0;
  }

  return v6;
}

@end