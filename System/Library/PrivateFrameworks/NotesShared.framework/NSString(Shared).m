@interface NSString(Shared)
- (id)ic_quotedString;
@end

@implementation NSString(Shared)

- (id)ic_quotedString
{
  v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"QUOTED_TITLE_FORMAT" value:@"“%@”" table:0 allowSiri:1];
  v3 = objc_msgSend(NSString, "localizedStringWithFormat:", v2, a1);

  return v3;
}

@end