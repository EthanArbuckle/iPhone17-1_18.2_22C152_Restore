@interface CSVTop
+ (CGSize)_improveSize:(CGSize)result;
+ (void)fillHTMLArchiveForCSVData:(id)a3 fileName:(id)a4 archiver:(id)a5;
+ (void)fillHTMLArchiveForCSVString:(id)a3 fileName:(id)a4 archiver:(id)a5;
+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7;
@end

@implementation CSVTop

+ (CGSize)_improveSize:(CGSize)result
{
  if (result.height / result.width <= 10.0)
  {
    if (result.height / result.width < 0.1) {
      result.width = result.height * 10.0;
    }
  }
  else
  {
    result.height = result.width * 10.0;
  }
  if (result.height > 2000.0) {
    result.height = 2000.0;
  }
  if (result.width > 2000.0) {
    result.width = 2000.0;
  }
  return result;
}

+ (void)fillHTMLArchiveForCSVString:(id)a3 fileName:(id)a4 archiver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x23EC9A170]();
  uint64_t v22 = 0;
  v11 = (void *)[a3 copyCsvRows:&v22];
  id v12 = +[CMXmlUtils copyXhtmlDocument];
  v13 = objc_alloc_init(CMState);
  [(CMState *)v13 setSourceFormat:7];
  -[CMState setIsThumbnail:](v13, "setIsThumbnail:", [v9 isThumbnail]);
  v14 = [CSVMapper alloc];
  v15 = [(CSVMapper *)v14 initWithRows:v11 fileName:v8 columnCount:v22 archiver:v9];
  v16 = [v12 rootElement];
  [(CSVMapper *)v15 mapAt:v16 withState:v13];

  [(CSVMapper *)v15 pageSize];
  objc_msgSend(a1, "_improveSize:");
  double v18 = v17;
  double v20 = v19;
  v21 = [v12 XMLString];
  [v9 setHTMLWidth:(int)v18];
  [v9 setHTMLHeight:(int)v20];
  [v9 pushText:v21 toPath:0];
  [v9 commitDataAtPath:0];
  [v9 closeResourceAtPath:0];
}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7
{
  id v16 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (v16 && !v11)
  {
    id v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v16 options:1 error:0];
  }
  if (v11)
  {
    v14 = v16;
    if (!v16) {
      v14 = v12;
    }
    v15 = [v14 lastPathComponent];
    [a1 fillHTMLArchiveForCSVData:v11 fileName:v15 archiver:v13];
  }
}

+ (void)fillHTMLArchiveForCSVData:(id)a3 fileName:(id)a4 archiver:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isThumbnail] && (unint64_t)objc_msgSend(v16, "length") > 0x4000)
  {
    uint64_t v10 = objc_msgSend(v16, "subdataWithRange:", 0, 0x4000);

    id v16 = (id)v10;
  }
  id v11 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
  if (!v11)
  {
    CFStringEncoding v12 = QLGuessEncodingForTextFileFromData();
    if (v12 == -1) {
      CFStringEncoding v13 = 513;
    }
    else {
      CFStringEncoding v13 = v12;
    }
    uint64_t v14 = [[NSString alloc] initWithData:v16 encoding:CFStringConvertEncodingToNSStringEncoding(v13)];
    id v11 = (void *)v14;
    if (v13 != 513 && !v14) {
      id v11 = (void *)[[NSString alloc] initWithData:v16 encoding:5];
    }
    if (!v11)
    {
      id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F07F60] reason:0 userInfo:0];
      objc_exception_throw(v15);
    }
  }
  [a1 fillHTMLArchiveForCSVString:v11 fileName:v8 archiver:v9];
}

@end