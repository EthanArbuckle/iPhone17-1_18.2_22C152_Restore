@interface WFContentSniffer
+ (BOOL)MIMETypeIsHTMLOrText:(id)a3;
+ (BOOL)isGIF:(id)a3;
+ (BOOL)isHTML:(id)a3;
+ (BOOL)isJPEG:(id)a3;
+ (BOOL)isOctetStream:(id)a3;
+ (BOOL)isPDF:(id)a3;
+ (BOOL)isPNG:(id)a3;
+ (BOOL)isSWF:(id)a3;
+ (BOOL)isWord:(id)a3;
+ (BOOL)isXHTML:(id)a3;
+ (BOOL)isXML:(id)a3;
+ (id)MIMETypeForData:(id)a3;
+ (id)MIMETypeForData:(id)a3 andString:(id)a4;
+ (id)MIMETypeForString:(id)a3;
@end

@implementation WFContentSniffer

+ (id)MIMETypeForString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:1];
  return +[WFContentSniffer MIMETypeForData:v4 andString:a3];
}

+ (id)MIMETypeForData:(id)a3
{
  unint64_t v4 = [a3 length];
  if (v4 >= 0x400) {
    uint64_t v5 = 1024;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), v5, 1);
  id v7 = +[WFContentSniffer MIMETypeForData:a3 andString:v6];

  return v7;
}

+ (BOOL)MIMETypeIsHTMLOrText:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (([a3 isEqualToString:@"text/html"] & 1) != 0
    || ([a3 isEqualToString:@"application/xhtml+xml"] & 1) != 0)
  {
    return 1;
  }
  return [a3 isEqualToString:@"text/plain"];
}

+ (id)MIMETypeForData:(id)a3 andString:(id)a4
{
  id result = 0;
  if (a3 && a4)
  {
    if (+[WFContentSniffer isXML:a4])
    {
      BOOL v7 = +[WFContentSniffer isXHTML:a4];
      v8 = @"application/xml";
      v9 = @"application/xhtml+xml";
    }
    else
    {
      if (+[WFContentSniffer isHTML:a4]) {
        return @"text/html";
      }
      if (+[WFContentSniffer isGIF:a4]) {
        return @"image/gif";
      }
      if (+[WFContentSniffer isJPEG:a3]) {
        return @"image/jpeg";
      }
      if (+[WFContentSniffer isPDF:a4]) {
        return @"application/pdf";
      }
      if (+[WFContentSniffer isPNG:a3]) {
        return @"image/png";
      }
      if (+[WFContentSniffer isSWF:a4]) {
        return @"application/x-shockwave-flash";
      }
      BOOL v7 = +[WFContentSniffer isWord:a3];
      v8 = @"text/plain";
      v9 = @"application/msword";
    }
    if (v7) {
      return v9;
    }
    else {
      return v8;
    }
  }
  return result;
}

+ (BOOL)isHTML:(id)a3
{
  if (objc_msgSend(a3, "WF_containsString:options:", @"<html", 1)) {
    return 1;
  }
  return objc_msgSend(a3, "WF_containsString:options:", @"</html", 1);
}

+ (BOOL)isXHTML:(id)a3
{
  if ((objc_msgSend(a3, "WF_containsString:options:", @"<html", 1) & 1) == 0
    && !objc_msgSend(a3, "WF_containsString:options:", @"</html", 1))
  {
    return 0;
  }
  BOOL v4 = 1;
  if ((objc_msgSend(a3, "WF_containsString:options:", @"xmlns", 1) & 1) == 0) {
    return 0;
  }
  return v4;
}

+ (BOOL)isXML:(id)a3
{
  return objc_msgSend(a3, "WF_containsString:", @"<?xml");
}

+ (BOOL)isGIF:(id)a3
{
  if ([a3 hasPrefix:@"GIF87a"]) {
    return 1;
  }
  return [a3 hasPrefix:@"GIF89a"];
}

+ (BOOL)isJPEG:(id)a3
{
  if ((unint64_t)[a3 length] < 3) {
    return 0;
  }
  uint64_t v5 = (unsigned __int16 *)[a3 bytes];
  return *v5 == 55551 && *((unsigned __int8 *)v5 + 2) == 255;
}

+ (BOOL)isPDF:(id)a3
{
  return [a3 hasPrefix:@"%PDF"];
}

+ (BOOL)isPNG:(id)a3
{
  return (unint64_t)[a3 length] >= 8
      && *(void *)[a3 bytes] == 0xA1A0A0D474E5089;
}

+ (BOOL)isSWF:(id)a3
{
  if ([a3 hasPrefix:@"FWS"]) {
    return 1;
  }
  return [a3 hasPrefix:@"CWS"];
}

+ (BOOL)isWord:(id)a3
{
  return (unint64_t)[a3 length] >= 0x204
      && *(_DWORD *)([a3 bytes] + 516) == 12690924;
}

+ (BOOL)isOctetStream:(id)a3
{
  BOOL v4 = (unsigned __int8 *)[a3 bytes];
  unint64_t v5 = [a3 length];
  if (v5)
  {
    int v6 = *v4;
    if ((v6 - 1) >= 8)
    {
      unint64_t v8 = 1;
      BOOL v7 = 1;
      do
      {
        if (v6 == 127) {
          break;
        }
        if ((v6 - 11) <= 0x14) {
          break;
        }
        BOOL v7 = v5 > v8;
        if (v5 == v8) {
          break;
        }
        int v6 = v4[v8++];
      }
      while ((v6 - 1) >= 8);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

@end