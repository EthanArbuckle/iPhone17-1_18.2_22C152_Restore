@interface GQPProcessorFactory
+ (BOOL)isTangierTEFDocumentUti:(__CFString *)a3;
+ (BOOL)isTemplateUti:(__CFString *)a3;
+ (__CFString)createUtiForDocument:(__CFString *)a3;
+ (__CFURL)newEmbeddedSageUrlForTangierDocumentUrl:(__CFURL *)a3 uti:(__CFString *)a4 isBundle:(BOOL *)a5;
+ (id)retainedProcessorForDocument:(__CFURL *)a3 zipArchive:(id)a4 uti:(__CFString *)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9;
+ (id)retainedProcessorForDocument:(__CFURL *)a3 zipArchive:(id)a4 uti:(__CFString *)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9 cryptoKey:(id)a10;
+ (int)applicationForDocumentUti:(__CFString *)a3;
@end

@implementation GQPProcessorFactory

+ (BOOL)isTangierTEFDocumentUti:(__CFString *)a3
{
  unint64_t v4 = 0;
  do
  {
    CFComparisonResult v5 = CFStringCompare(a3, off_80888[v4], 0);
    if (v5) {
      BOOL v6 = v4 > 1;
    }
    else {
      BOOL v6 = 1;
    }
    ++v4;
  }
  while (!v6);
  return v5 == kCFCompareEqualTo;
}

+ (BOOL)isTemplateUti:(__CFString *)a3
{
  unint64_t v4 = 0;
  do
  {
    CFComparisonResult v5 = CFStringCompare(a3, off_808A0[v4], 0);
    if (v5) {
      BOOL v6 = v4 > 4;
    }
    else {
      BOOL v6 = 1;
    }
    ++v4;
  }
  while (!v6);
  return v5 == kCFCompareEqualTo;
}

+ (__CFURL)newEmbeddedSageUrlForTangierDocumentUrl:(__CFURL *)a3 uti:(__CFString *)a4 isBundle:(BOOL *)a5
{
  if (qword_A4320 != -1) {
    dispatch_once(&qword_A4320, &stru_84ED8);
  }
  result = (__CFURL *)[(id)qword_A4328 objectForKey:a4];
  if (result)
  {
    id v9 = objc_msgSend(-[__CFURL path](a3, "path"), "stringByAppendingPathComponent:", result);
    BOOL v10 = 0;
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v9 isDirectory:&v10])
    {
      if (a5) {
        *a5 = v10;
      }
      return (__CFURL *)+[NSURL fileURLWithPath:v9];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (__CFString)createUtiForDocument:(__CFString *)a3
{
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, a3, kCFURLPOSIXPathStyle, 1u);
  CFStringRef v4 = CFURLCopyPathExtension(v3);
  CFRelease(v3);
  if (v4)
  {
    if (CFStringCompare(v4, @"pages", 1uLL))
    {
      if (CFStringCompare(v4, @"key", 1uLL))
      {
        if (CFStringCompare(v4, @"numbers", 1uLL))
        {
          Copy = 0;
LABEL_11:
          CFRelease(v4);
          return Copy;
        }
        CFStringRef v6 = @"com.apple.iwork.numbers.numbers";
      }
      else
      {
        CFStringRef v6 = @"com.apple.iwork.keynote.key";
      }
    }
    else
    {
      CFStringRef v6 = @"com.apple.iwork.pages.pages";
    }
    Copy = (__CFString *)CFStringCreateCopy(0, v6);
    goto LABEL_11;
  }
  return 0;
}

+ (int)applicationForDocumentUti:(__CFString *)a3
{
  CFStringRef v4 = (void *)qword_A4330;
  if (!qword_A4330)
  {
    id v5 = [objc_alloc((Class)NSNumber) initWithInt:1];
    id v6 = [objc_alloc((Class)NSNumber) initWithInt:3];
    id v7 = [objc_alloc((Class)NSNumber) initWithInt:2];
    qword_A4330 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v7, @"com.apple.iwork.pages.pages", v7, @"com.apple.iwork.pages.sffpages", v7, @"com.apple.iwork.pages.pages-tef", v7, @"com.apple.iwork.pages.sfftemplate", v7, @"com.apple.iwork.pages.template", v5, @"com.apple.iwork.keynote.key", v5, @"com.apple.iwork.keynote.sffkey", v5, @"com.apple.keynote.key", v5,
                             @"com.apple.iwork.keynote.key-tef",
                             v5,
                             @"com.apple.iwork.keynote.sffkth",
                             v5,
                             @"com.apple.iwork.keynote.kth",
                             v6,
                             @"com.apple.iwork.numbers.numbers",
                             v6,
                             @"com.apple.iwork.numbers.sffnumbers",
                             v6,
                             @"com.apple.iwork.numbers.numbers-tef",
                             v6,
                             @"com.apple.iwork.numbers.sfftemplate",
                             v6,
                             @"com.apple.iwork.numbers.template",
                             0);

    CFStringRef v4 = (void *)qword_A4330;
  }
  id v8 = objc_msgSend(v4, "objectForKey:", -[__CFString lowercaseString](a3, "lowercaseString"));
  if (v8)
  {
    LODWORD(v8) = [v8 intValue];
  }
  return (int)v8;
}

+ (id)retainedProcessorForDocument:(__CFURL *)a3 zipArchive:(id)a4 uti:(__CFString *)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9 cryptoKey:(id)a10
{
  uint64_t v12 = *(void *)&a6;
  if (a5)
  {
    v16 = a5;
    CFRetain(a5);
  }
  else
  {
    v16 = (__CFString *)objc_msgSend(a1, "createUtiForDocument:", -[__CFURL path](a3, "path"));
  }
  id v17 = [a1 applicationForDocumentUti:v16];
  v18 = +[GQHGeneratorLookup generatorForApplication:v17];
  if (v17 == 1)
  {
    v20 = [GQPBGProcessor alloc];
    if (a3) {
      v21 = [(GQPBGProcessor *)v20 initWithURL:a3 indexFileName:@"index.apxl" outputType:v12 outputPath:a7 previewRequest:a8 progressiveHelper:a9 generator:v18 zipArchive:a4 cryptoKey:a10];
    }
    else {
      v21 = [(GQPBGProcessor *)v20 initWithURL:0 zipArchive:a4 indexFileName:@"index.apxl" outputType:v12 outputPath:a7 previewRequest:a8 progressiveHelper:a9 generator:v18 cryptoKey:a10];
    }
  }
  else
  {
    if (v17 == 3)
    {
      v19 = GQPLSProcessor;
    }
    else
    {
      if (v17 != 2)
      {
        v23 = 0;
        if (!v16) {
          return v23;
        }
        goto LABEL_18;
      }
      v19 = GQPSLProcessor;
    }
    id v22 = [v19 alloc];
    if (a3) {
      v21 = (GQPBGProcessor *)[v22 initWithURL:a3 indexFileName:@"index.xml" outputType:v12 outputPath:a7 previewRequest:a8 progressiveHelper:a9 generator:v18 zipArchive:a4 cryptoKey:a10];
    }
    else {
      v21 = (GQPBGProcessor *)[v22 initWithURL:0 zipArchive:a4 indexFileName:@"index.xml" outputType:v12 outputPath:a7 previewRequest:a8 progressiveHelper:a9 generator:v18 cryptoKey:a10];
    }
  }
  v23 = v21;
  if (v16) {
LABEL_18:
  }
    CFRelease(v16);
  return v23;
}

+ (id)retainedProcessorForDocument:(__CFURL *)a3 zipArchive:(id)a4 uti:(__CFString *)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  id v14 = [a1 applicationForDocumentUti:a5];
  v15 = +[GQHGeneratorLookup generatorForApplication:v14];
  if ((v14 - 1) > 2) {
    return 0;
  }
  else {
    return [objc_alloc(*off_808D0[(int)v14 - 1]) initWithURL:a3 zipArchive:a4 indexFileName:off_808E8[v16] outputType:v11 outputPath:a7 previewRequest:a8 progressiveHelper:a9 generator:v15 cryptoKey:0];
  }
}

@end