@interface WBSReaderNavigationPolicyDecider
+ (BOOL)readerPageWithURL:(id)a3 canLoadFrameWithURL:(id)a4;
@end

@implementation WBSReaderNavigationPolicyDecider

+ (BOOL)readerPageWithURL:(id)a3 canLoadFrameWithURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v6, "safari_isHTTPFamilyURL"))
  {
    v7 = [v6 host];
    if ([v7 length])
    {
      v8 = [v5 host];
      char v9 = [v8 isEqualToString:v7];

      if (v9)
      {
        BOOL v10 = 1;
      }
      else
      {
        v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(.+\\.)?(youtube(-nocookie)?\\.com|vimeo\\.com|dailymotion\\.com|soundcloud\\.com|mixcloud\\.com|embedly\\.com|embed\\.ly)\\.?$" options:0 error:0];
        v12 = objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

        if (v12)
        {
          BOOL v10 = 1;
        }
        else
        {
          v13 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(.+\\.)?(twitter\\.com)\\.?$" options:0 error:0];
          v14 = objc_msgSend(v13, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

          BOOL v10 = v14 != 0;
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

@end