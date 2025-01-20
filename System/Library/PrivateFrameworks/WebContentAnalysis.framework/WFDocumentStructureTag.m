@interface WFDocumentStructureTag
+ (id)tagForNumberOfImages:(int64_t)a3;
+ (id)tagForNumberOfPixels:(int64_t)a3;
- (WFDocumentStructureTag)tagWithWebpage:(id)a3;
@end

@implementation WFDocumentStructureTag

+ (id)tagForNumberOfImages:(int64_t)a3
{
  uint64_t v3 = 100;
  do
  {
    if (v3 <= a3)
    {
      v5 = NSString;
      return (id)objc_msgSend(v5, "stringWithFormat:", @"ImageCount%dWebFilterTag", v3);
    }
    BOOL v4 = v3 >= 0xA;
    uint64_t v3 = (v3 - 10);
  }
  while (v3 != 0 && v4);
  if (a3 >= 6)
  {
    v5 = NSString;
    uint64_t v3 = 5;
    return (id)objc_msgSend(v5, "stringWithFormat:", @"ImageCount%dWebFilterTag", v3);
  }
  if (a3 >= 3)
  {
    v5 = NSString;
    uint64_t v3 = 2;
    return (id)objc_msgSend(v5, "stringWithFormat:", @"ImageCount%dWebFilterTag", v3);
  }
  v5 = NSString;
  if (a3 >= 1)
  {
    uint64_t v3 = 1;
    return (id)objc_msgSend(v5, "stringWithFormat:", @"ImageCount%dWebFilterTag", v3);
  }
  return (id)[v5 stringWithFormat:@"NoImagesWebFilterTag"];
}

+ (id)tagForNumberOfPixels:(int64_t)a3
{
  if (a3 > 2000000) {
    return @"Images2MegaPixelsWebFilterTag";
  }
  if (a3 > 1000000) {
    return @"Images1MegaPixelsWebFilterTag";
  }
  if (a3 > 700000) {
    return @"Images700KiloPixelsWebFilterTag";
  }
  if (a3 > 400000) {
    return @"Images400KiloPixelsWebFilterTag";
  }
  if (a3 > 100000) {
    return @"Images100KiloPixelsWebFilterTag";
  }
  if (a3 > 50000) {
    return @"Images50KiloPixelsWebFilterTag";
  }
  if (a3 > 25000) {
    return @"Images25KiloPixelsWebFilterTag";
  }
  if (a3 > 15000) {
    return @"Images15KiloPixelsWebFilterTag";
  }
  if (a3 <= 5000) {
    return @"ImagesNoPixelsWebFilterTag";
  }
  return @"Images5KiloPixelsWebFilterTag";
}

- (WFDocumentStructureTag)tagWithWebpage:(id)a3
{
  BOOL v4 = (WFDocumentStructureTag *)[MEMORY[0x263F089D8] string];
  uint64_t v5 = [a3 numberOfKnownImagePixels];
  uint64_t v6 = [a3 numberOfImages];
  -[WFDocumentStructureTag appendFormat:](v4, "appendFormat:", @"%@ (TotAreaWFImagesTag:%ld)", [(id)objc_opt_class() tagForNumberOfPixels:v5], v5);
  [(WFDocumentStructureTag *)v4 appendString:@" | "];
  -[WFDocumentStructureTag appendFormat:](v4, "appendFormat:", @"%@ (TotNumWFImagesTag:%ld)", [(id)objc_opt_class() tagForNumberOfImages:v6], v6);
  return v4;
}

@end