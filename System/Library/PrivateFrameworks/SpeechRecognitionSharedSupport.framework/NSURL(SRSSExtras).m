@interface NSURL(SRSSExtras)
+ (id)URLWithStringAndDataDetection:()SRSSExtras;
@end

@implementation NSURL(SRSSExtras)

+ (id)URLWithStringAndDataDetection:()SRSSExtras
{
  id v3 = a3;
  v4 = [NSURL URLWithString:v3];
  v5 = [v4 scheme];

  if (v5)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [MEMORY[0x263F08770] dataDetectorWithTypes:32 error:0];
    v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    id v6 = 0;
    if ([v8 resultType] == 32)
    {
      id v6 = [v8 URL];
    }
  }
  return v6;
}

@end