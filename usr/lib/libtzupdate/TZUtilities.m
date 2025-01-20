@interface TZUtilities
+ (BOOL)fileExistsAndIsSymbolicLinkAtURL:(id)a3;
+ (id)stringWithContentsOfFileAtURL:(id)a3 error:(id *)a4;
@end

@implementation TZUtilities

+ (id)stringWithContentsOfFileAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [NSString stringWithContentsOfURL:v5 encoding:4 error:a4];
  if (!v6 && +[TZDLogging canLogMessageAtLevel:0]) {
    NSLog(&cfstr_SErrorReadingF.isa, "+[TZUtilities stringWithContentsOfFileAtURL:error:]", v5, *a4);
  }
  v7 = [MEMORY[0x263F08708] newlineCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SFileContentsW.isa, "+[TZUtilities stringWithContentsOfFileAtURL:error:]", v8);
  }

  return v8;
}

+ (BOOL)fileExistsAndIsSymbolicLinkAtURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    memset(&v14, 0, sizeof(v14));
    id v4 = [MEMORY[0x263F08850] defaultManager];
    id v5 = [v3 path];
    int v6 = lstat((const char *)[v4 fileSystemRepresentationWithPath:v5], &v14);

    BOOL v7 = +[TZDLogging canLogMessageAtLevel:2];
    if (v6 < 0)
    {
      BOOL v10 = 0;
      if (!v7) {
        goto LABEL_16;
      }
      v11 = @"%s  File doesn't exist at URL %@";
    }
    else
    {
      if (v7) {
        NSLog(&cfstr_SFileExistsAtU.isa, "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]", v3);
      }
      int v8 = v14.st_mode & 0xF000;
      BOOL v9 = +[TZDLogging canLogMessageAtLevel:2];
      BOOL v10 = v8 == 40960;
      if (v8 == 40960) {
        v11 = @"%s  File at URL %@ is a symbolic link";
      }
      else {
        v11 = @"%s  File at URL %@ is NOT a symbolic link";
      }
      if (!v9) {
        goto LABEL_16;
      }
    }
    NSLog(&v11->isa, "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]", v3);
LABEL_16:
    BOOL v12 = v6 >= 0 && v10;
    goto LABEL_19;
  }
  if (+[TZDLogging canLogMessageAtLevel:0]) {
    NSLog(&cfstr_SLinkurlIsNil.isa, "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]");
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

@end