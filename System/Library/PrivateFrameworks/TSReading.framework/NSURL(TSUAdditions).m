@interface NSURL(TSUAdditions)
+ (id)tsu_fileURLWithPath:()TSUAdditions;
@end

@implementation NSURL(TSUAdditions)

+ (id)tsu_fileURLWithPath:()TSUAdditions
{
  if (a3)
  {
    v4 = objc_msgSend(NSURL, "fileURLWithPath:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end