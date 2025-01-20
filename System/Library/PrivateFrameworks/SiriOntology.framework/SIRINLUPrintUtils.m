@interface SIRINLUPrintUtils
+ (id)indentArray:(id)a3 numSpaces:(int64_t)a4;
+ (id)indentLines:(id)a3 numSpaces:(int64_t)a4;
@end

@implementation SIRINLUPrintUtils

+ (id)indentArray:(id)a3 numSpaces:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    v7 = @"[\n";
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v8) description];
        v11 = +[SIRINLUPrintUtils indentLines:v10 numSpaces:2];

        v12 = [NSString stringWithFormat:@"%@\n", v11];
        v7 = [(__CFString *)v9 stringByAppendingString:v12];

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = @"[\n";
  }
  v13 = [(__CFString *)v7 stringByAppendingString:@"]"];
  v14 = +[SIRINLUPrintUtils indentLines:v13 numSpaces:a4];

  return v14;
}

+ (id)indentLines:(id)a3 numSpaces:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = a4 + 1;
  v7 = [MEMORY[0x1E4F28E78] stringWithCapacity:a4 + 1];
  [v7 appendString:@"\n"];
  if ((a4 & 0x8000000000000000) == 0)
  {
    do
    {
      [v7 appendString:@" "];
      --v6;
    }
    while (v6);
  }
  uint64_t v8 = [v5 componentsSeparatedByString:@"\n"];
  v9 = [v8 componentsJoinedByString:v7];
  v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  v12 = NSString;
  v13 = [v7 substringFromIndex:1];
  v14 = [v12 stringWithFormat:@"%@%@", v13, v11];

  return v14;
}

@end