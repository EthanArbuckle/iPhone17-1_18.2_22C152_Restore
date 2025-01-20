@interface PFSConstants
+ (_colorInfo)findcolorInfo:(const char *)a3;
+ (id)languageForString:(id)a3;
+ (unint64_t)colorForName:(const char *)a3;
@end

@implementation PFSConstants

+ (unint64_t)colorForName:(const char *)a3
{
  unint64_t result = (unint64_t)[a1 findcolorInfo:a3];
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

+ (id)languageForString:(id)a3
{
  uint64_t v4 = 0;
  CFStringRef v5 = @"en_US";
  while (![a3 startsWithString:*(__CFString **)((char *)&off_45BF68 + v4 + 8)])
  {
    v4 += 16;
    if (v4 == 240) {
      return (id)v5;
    }
  }
  return *(__CFString **)((char *)&off_45BF68 + v4);
}

+ (_colorInfo)findcolorInfo:(const char *)a3
{
  uint64_t v4 = 0;
  while (xmlStrcmp((const xmlChar *)a3, (const xmlChar *)(&off_570D68)[v4]))
  {
    v4 += 2;
    if (v4 == 280) {
      return 0;
    }
  }
  return (_colorInfo *)&(&off_570D68)[v4];
}

@end