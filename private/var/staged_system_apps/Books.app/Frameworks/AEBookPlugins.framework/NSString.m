@interface NSString
+ (id)fastHashStringFromPath:(id)a3;
+ (id)md5StringWithContentsOfFile:(id)a3;
+ (id)pathRelativeToContentBase:(id)a3 forRelativePath:(id)a4 startingFromAbsoluteFolderPath:(id)a5;
@end

@implementation NSString

+ (id)md5StringWithContentsOfFile:(id)a3
{
  Md5String = (void *)ITFileUtil::createMd5String((ITFileUtil *)a3, (const __CFString *)a2);

  return Md5String;
}

+ (id)fastHashStringFromPath:(id)a3
{
  FastFileHash = (void *)ITFileUtil::createFastFileHash((ITFileUtil *)a3, (const __CFString *)a2);

  return FastFileHash;
}

+ (id)pathRelativeToContentBase:(id)a3 forRelativePath:(id)a4 startingFromAbsoluteFolderPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  v11 = v10;
  if (([v9 isEqualToString:v7] & 1) == 0)
  {
    v12 = [v9 stringByAppendingPathComponent:v10];
    v13 = [v12 stringByStandardizingPath];
    v14 = [v7 stringByStandardizingPath];
    v11 = v10;
    if ([v13 hasPrefix:v14])
    {
      v11 = [v13 substringFromIndex:[v14 length]];

      if ((unint64_t)[v11 length] >= 2
        && [v11 characterAtIndex:0] == 47)
      {
        uint64_t v15 = [v11 substringFromIndex:1];

        v11 = (void *)v15;
      }
    }
  }

  return v11;
}

@end