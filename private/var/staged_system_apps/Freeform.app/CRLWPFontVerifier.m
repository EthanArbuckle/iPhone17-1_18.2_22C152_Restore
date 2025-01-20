@interface CRLWPFontVerifier
+ (NSString)missingFontName;
+ (id)sharedInstance;
- (BOOL)isCloudKitDownloadableFontName:(id)a3;
- (BOOL)isCoreTextDownloadableFontName:(id)a3;
- (BOOL)isDownloadableFontName:(id)a3;
- (BOOL)isFontWithPostscriptNameInstalled:(id)a3;
@end

@implementation CRLWPFontVerifier

+ (id)sharedInstance
{
  if (qword_1016A8FE0 != -1) {
    dispatch_once(&qword_1016A8FE0, &stru_1014D2BD8);
  }
  v2 = (void *)qword_1016A8FD8;

  return v2;
}

+ (NSString)missingFontName
{
  return (NSString *)@"Helvetica";
}

- (BOOL)isFontWithPostscriptNameInstalled:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = +[CRLWPFontVerifier missingFontName];
  unsigned __int8 v5 = [(__CFString *)v3 containsString:v4];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    if (+[CRLWPFont isSystemFontName:v3]) {
      CTFontOptions v7 = 1025;
    }
    else {
      CTFontOptions v7 = 1;
    }
    v8 = CTFontCreateWithNameAndOptions(v3, 0.0, 0, v7);
    if (v8)
    {
      v9 = v8;
      v10 = (__CFString *)CTFontCopyPostScriptName(v8);
      v11 = +[CRLWPFontVerifier missingFontName];
      unsigned int v6 = [(__CFString *)v10 isEqualToString:v11] ^ 1;

      CFRelease(v9);
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (BOOL)isCloudKitDownloadableFontName:(id)a3
{
  return [&off_10155C188 containsObject:a3];
}

- (BOOL)isCoreTextDownloadableFontName:(id)a3
{
  v10[0] = kCTFontNameAttribute;
  v10[1] = kCTFontDownloadableAttribute;
  v11[0] = a3;
  v11[1] = &__kCFBooleanTrue;
  id v3 = a3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  unsigned __int8 v5 = CTFontDescriptorCreateWithAttributes(v4);
  CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v5, 0);
  CFArrayRef v7 = MatchingFontDescriptors;
  if (MatchingFontDescriptors) {
    BOOL v8 = [(__CFArray *)MatchingFontDescriptors count] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  CFRelease(v5);

  return v8;
}

- (BOOL)isDownloadableFontName:(id)a3
{
  id v4 = a3;
  if ([(CRLWPFontVerifier *)self isCloudKitDownloadableFontName:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(CRLWPFontVerifier *)self isCoreTextDownloadableFontName:v4];
  }

  return v5;
}

@end