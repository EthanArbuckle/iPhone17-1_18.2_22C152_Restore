@interface NSURL(VCSUtilities)
+ (BOOL)VCS_isValidURI:()VCSUtilities;
+ (id)VCS_URLForAddress:()VCSUtilities scheme:noAddress:;
+ (uint64_t)VCS_URLForMail:()VCSUtilities;
@end

@implementation NSURL(VCSUtilities)

+ (uint64_t)VCS_URLForMail:()VCSUtilities
{
  return objc_msgSend(a1, "VCS_URLForAddress:scheme:noAddress:", a3, @"mailto", @"invalid:nomail");
}

+ (id)VCS_URLForAddress:()VCSUtilities scheme:noAddress:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    if ((objc_msgSend(a1, "VCS_isValidURI:", v8) & 1) == 0)
    {
      if ([v9 isEqualToString:@"mailto"]
        && ([v8 rangeOfString:@"@"], v11)
        || [v9 isEqualToString:@"tel"]
        && objc_msgSend(v8, "VCS_isPhoneNumber"))
      {
        v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v13 = [v8 stringByTrimmingCharactersInSet:v12];

        v14 = NSString;
        v15 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
        v16 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v15];
        id v17 = [v14 stringWithFormat:@"%@:%@", v9, v16];

        id v8 = v13;
      }
      else
      {
        id v17 = v10;
      }

      id v8 = v17;
    }
    v18 = [MEMORY[0x1E4F1CB10] URLWithString:v8 encodingInvalidCharacters:0];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)VCS_isValidURI:()VCSUtilities
{
  id v3 = a3;
  if ([v3 hasPrefix:@"/"])
  {
    BOOL v4 = 1;
  }
  else
  {
    [v3 rangeOfString:@":"];
    BOOL v4 = v5 != 0;
  }

  return v4;
}

@end