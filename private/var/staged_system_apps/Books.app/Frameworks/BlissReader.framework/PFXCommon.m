@interface PFXCommon
+ (id)absolutePathWithUrl:(id)a3 relativeToFile:(id)a4;
+ (id)cfiPathToNodeWithDepth:(int64_t)a3 nodeArray:(void *)a4 idArray:(void *)a5;
+ (id)dataWithContentsOfURL:(id)a3;
+ (id)dataWithContentsOfURLString:(id)a3 sourceUrl:(id)a4;
+ (id)relativePathFromFile:(id)a3 toPath:(id)a4;
+ (id)stringWithContentsOfPercentEscapedURLString:(id)a3 sourceUrl:(id)a4;
+ (id)urlWithRelativeString:(id)a3 sourceUrl:(id)a4;
+ (void)writeString:(id)a3 toStream:(id)a4 atEntry:(id)a5 isCompressed:(BOOL)a6;
@end

@implementation PFXCommon

+ (void)writeString:(id)a3 toStream:(id)a4 atEntry:(id)a5 isCompressed:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = [a3 dataUsingEncoding:4];
  [a4 beginEntryWithName:a5 isCompressed:v6 uncompressedSize:[v9 length]];
  id v10 = [v9 bytes];
  id v11 = [v9 length];

  [a4 writeBuffer:v10 size:v11];
}

+ (id)relativePathFromFile:(id)a3 toPath:(id)a4
{
  id v5 = [a3 stringByDeletingLastPathComponent];

  return [a4 tsu_stringWithPathRelativeTo:v5 allowBacktracking:1];
}

+ (id)absolutePathWithUrl:(id)a3 relativeToFile:(id)a4
{
  id v4 = a4;
  if (([a4 hasPrefix:@"/"] & 1) == 0) {
    id v4 = [@"/" stringByAppendingString:v4];
  }
  BOOL v6 = [[NSURL URLWithString:relativeToURL:][self stringByAddingPercentEncodingWithAllowedCharacters:][NSURL fileURLWithPath:isDirectory:][self path]];

  return [(NSString *)v6 substringFromIndex:1];
}

+ (id)dataWithContentsOfURL:(id)a3
{
  if ([a3 isFileURL])
  {
    id v4 = objc_msgSend(objc_msgSend(a3, "path"), "stringByStandardizingPath");
    return +[NSData dataWithContentsOfFile:v4];
  }
  else
  {
    return +[NSData dataWithContentsOfURL:a3];
  }
}

+ (id)urlWithRelativeString:(id)a3 sourceUrl:(id)a4
{
  id v5 = a3;
  if ([a3 rangeOfString:@"%"] == (id)0x7FFFFFFFFFFFFFFFLL || v6 == 0) {
    id v5 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
  }

  return +[NSURL URLWithString:v5 relativeToURL:a4];
}

+ (id)dataWithContentsOfURLString:(id)a3 sourceUrl:(id)a4
{
  id v4 = [a1 urlWithRelativeString:a3 sourceUrl:a4];

  return +[PFXCommon dataWithContentsOfURL:v4];
}

+ (id)stringWithContentsOfPercentEscapedURLString:(id)a3 sourceUrl:(id)a4
{
  id v4 = [objc_alloc((Class)NSString) initWithData:[a1 dataWithContentsOfURLString:a3 sourceUrl:a4] encoding:4];

  return v4;
}

+ (id)cfiPathToNodeWithDepth:(int64_t)a3 nodeArray:(void *)a4 idArray:(void *)a5
{
  id v8 = +[NSMutableString string];
  if (a3 >= 1)
  {
    int64_t v9 = 0;
    do
    {
      [v8 appendFormat:@"%lu" *(void *)(*(void *)a4 + 8 * v9)];
      if (a5 && *(void *)(*(void *)a5 + 8 * v9)) {
        [v8 appendFormat:@"[%s]", *(void *)(*(void *)a5 + 8 * v9)];
      }
      if (v9 < a3 - 1) {
        [v8 appendFormat:@"/"];
      }
      ++v9;
    }
    while (a3 != v9);
  }
  return v8;
}

@end