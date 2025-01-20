@interface NSString(CHCSVAdditions)
- (id)componentsSeparatedByDelimiter:()CHCSVAdditions options:error:;
- (uint64_t)CSVComponents;
- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions;
- (uint64_t)componentsSeparatedByDelimiter:()CHCSVAdditions;
- (uint64_t)componentsSeparatedByDelimiter:()CHCSVAdditions options:;
@end

@implementation NSString(CHCSVAdditions)

- (uint64_t)CSVComponents
{
  return [a1 componentsSeparatedByDelimiter:44 options:0 error:0];
}

- (uint64_t)CSVComponentsWithOptions:()CHCSVAdditions
{
  return [a1 componentsSeparatedByDelimiter:44 options:a3 error:0];
}

- (uint64_t)componentsSeparatedByDelimiter:()CHCSVAdditions
{
  return [a1 componentsSeparatedByDelimiter:a3 options:0 error:0];
}

- (uint64_t)componentsSeparatedByDelimiter:()CHCSVAdditions options:
{
  return [a1 componentsSeparatedByDelimiter:a3 options:a4 error:0];
}

- (id)componentsSeparatedByDelimiter:()CHCSVAdditions options:error:
{
  v8 = [a1 dataUsingEncoding:4];
  v9 = [MEMORY[0x1E4F1CA10] inputStreamWithData:v8];
  v10 = _CHCSVParserParse(v9, a4, a3, a5);

  return v10;
}

@end