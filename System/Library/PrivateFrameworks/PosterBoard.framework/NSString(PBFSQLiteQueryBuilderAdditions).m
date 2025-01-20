@interface NSString(PBFSQLiteQueryBuilderAdditions)
- (id)pbf_valueForSQLiteQuery;
@end

@implementation NSString(PBFSQLiteQueryBuilderAdditions)

- (id)pbf_valueForSQLiteQuery
{
  v1 = (void *)[a1 copy];
  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%_'\\""];
  [v1 rangeOfCharacterFromSet:v2];
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28E78] stringWithString:v1];
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%", @"\\%", 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"_", @"\\_", 2, 0, objc_msgSend(v5, "length"));

    v1 = v5;
  }
  v6 = [NSString stringWithFormat:@"\"%@\"", v1];

  return v6;
}

@end