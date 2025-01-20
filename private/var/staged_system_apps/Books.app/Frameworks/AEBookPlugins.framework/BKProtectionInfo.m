@interface BKProtectionInfo
+ (id)newEmptyProtectionInfo:(id)a3;
@end

@implementation BKProtectionInfo

+ (id)newEmptyProtectionInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 newByClass:objc_opt_class()];

  return v4;
}

@end