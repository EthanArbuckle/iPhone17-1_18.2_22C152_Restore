@interface NSString(TSUFogAdditions)
+ (id)tsu_fogFilenameFromShareToken:()TSUFogAdditions;
+ (id)tsu_fogShareTokenFromFileURL:()TSUFogAdditions;
@end

@implementation NSString(TSUFogAdditions)

+ (id)tsu_fogShareTokenFromFileURL:()TSUFogAdditions
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isFileURL])
  {
    v4 = [v3 lastPathComponent];
    v5 = [v4 dataUsingEncoding:4];
    v6 = objc_msgSend(v5, "tsu_encodeToHexidecimalString");
    v10[0] = @"fog";
    v10[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v8 = [v7 componentsJoinedByString:@":"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)tsu_fogFilenameFromShareToken:()TSUFogAdditions
{
  if (a3)
  {
    id v3 = [a3 componentsSeparatedByString:@":"];
    v4 = [v3 firstObject];
    if ([v4 isEqualToString:@"fog"] && objc_msgSend(v3, "count") == 2)
    {
      v5 = [v3 objectAtIndexedSubscript:1];
      v6 = objc_msgSend(MEMORY[0x263EFF8F8], "tsu_decodeFromHexidecimalString:", v5);
      v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end