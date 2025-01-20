@interface NSString(CHCSVAdditions_Deprecated)
- (uint64_t)CSVComponentsWithDelimiter:()CHCSVAdditions_Deprecated;
- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions_Deprecated delimiter:;
- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions_Deprecated delimiter:error:;
@end

@implementation NSString(CHCSVAdditions_Deprecated)

- (uint64_t)CSVComponentsWithDelimiter:()CHCSVAdditions_Deprecated
{
  return [a1 componentsSeparatedByDelimiter:a3 options:0 error:0];
}

- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions_Deprecated delimiter:
{
  return [a1 componentsSeparatedByDelimiter:a4 options:a3 error:0];
}

- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions_Deprecated delimiter:error:
{
  return objc_msgSend(a1, "componentsSeparatedByDelimiter:options:error:", a4, a3);
}

@end