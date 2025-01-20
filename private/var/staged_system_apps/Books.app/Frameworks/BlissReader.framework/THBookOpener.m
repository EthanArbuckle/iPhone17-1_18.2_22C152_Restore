@interface THBookOpener
+ (id)loadingQueue;
- (BOOL)isSuccessful;
- (BOOL)wasError;
- (NSError)error;
- (NSException)exception;
- (THBookOpener)initWithDocumentRoot:(id)a3;
- (THDocumentRoot)documentRoot;
- (void)dealloc;
- (void)main;
- (void)setDocumentRoot:(id)a3;
- (void)setError:(id)a3;
- (void)setException:(id)a3;
@end

@implementation THBookOpener

+ (id)loadingQueue
{
  id result = (id)qword_5731B0;
  if (!qword_5731B0)
  {
    objc_sync_enter(a1);
    if (!qword_5731B0)
    {
      id v4 = objc_alloc_init((Class)NSOperationQueue);
      __dmb(0xBu);
      qword_5731B0 = (uint64_t)v4;
      if (!v4)
      {
        [+[TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookOpener loadingQueue]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookOpener.m") lineNumber:59 description:@"Couldn't create singleton instance of NSOperationQueue"];
        id v4 = (id)qword_5731B0;
      }
      [v4 setMaxConcurrentOperationCount:1];
    }
    objc_sync_exit(a1);
    return (id)qword_5731B0;
  }
  return result;
}

- (THBookOpener)initWithDocumentRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THBookOpener;
  id v4 = [(THBookOpener *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THBookOpener *)v4 setDocumentRoot:a3];
  }
  return v5;
}

- (BOOL)wasError
{
  return [(THBookOpener *)self error] || [(THBookOpener *)self exception] != 0;
}

- (BOOL)isSuccessful
{
  if ([(THBookOpener *)self wasError]) {
    return 0;
  }
  else {
    return [(THBookOpener *)self isCancelled] ^ 1;
  }
}

- (void)main
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = [(THBookDescription *)[(THDocumentRoot *)[(THBookOpener *)self documentRoot] bookDescription] tspObjectContextPath];
  if (v4)
  {
    char v13 = 0;
    unsigned int v5 = [+[NSFileManager defaultManager] fileExistsAtPath:v4 isDirectory:&v13];
    if (v13) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = v5;
    }
    if (v6 == 1)
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookOpener main]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookOpener.m"] lineNumber:104 description:@"The object context path should have been a folder.";
      if (!v13) {
        [(THBookOpener *)self setError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.iWork.Thunderfish", 101, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, NSFilePathErrorKey, 0))];
      }
    }
    if ([(THBookOpener *)self isSuccessful])
    {
      objc_super v7 = [(THBookDescription *)[(THDocumentRoot *)[(THBookOpener *)self documentRoot] bookDescription] bookBundleUrl];
      v8 = v7;
      id v12 = 0;
      if (v7 && [(NSURL *)v7 path] && [(NSString *)[(NSURL *)v8 path] length])
      {
        if (+[THApplePubController readAppPubFileToDocumentRoot:[(THBookOpener *)self documentRoot] url:v8 error:&v12])
        {
          if ([(THBookOpener *)self isSuccessful])
          {
            [(THDocumentRoot *)[(THBookOpener *)self documentRoot] setLibraryDatabaseKey:[(THBookDescription *)[(THDocumentRoot *)[(THBookOpener *)self documentRoot] bookDescription] databaseKey]];
            if (![(THDocumentRoot *)[(THBookOpener *)self documentRoot] loadEquationFontsIfNeeded])[(THBookOpener *)self setError:+[NSError errorWithDomain:@"com.apple.iWork.Thunderfish" code:102 userInfo:0]]; {
          }
            }
        }
        if (!v12) {
          goto LABEL_20;
        }
      }
      else
      {
        id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.iWork.Thunderfish" code:101 userInfo:0];
        if (!v12) {
          goto LABEL_20;
        }
      }
      -[THBookOpener setError:](self, "setError:");
    }
  }
LABEL_20:
  [v3 drain];
  if (![(THBookOpener *)self error])
  {
    if (qword_5731C0 != -1) {
      dispatch_once(&qword_5731C0, &stru_457CD0);
    }
    if (byte_5731B8)
    {
      v9 = [+[NSUserDefaults standardUserDefaults] stringForKey:@"THBookOpenSimulatedError"];
      if ([(NSString *)v9 isEqualToString:@"open-failed"])
      {
        v10 = &kTHErrorDomain;
        uint64_t v11 = 101;
LABEL_32:
        [(THBookOpener *)self setError:+[NSError errorWithDomain:*v10 code:v11 userInfo:0]];
        return;
      }
      if ([(NSString *)v9 isEqualToString:@"drm-user-removed"])
      {
        uint64_t v11 = -42595;
LABEL_31:
        v10 = &mbkFCZS0leKzYP1BBPFY;
        goto LABEL_32;
      }
      if ([(NSString *)v9 isEqualToString:@"drm-family-content-unplayable"]
        || [(NSString *)v9 isEqualToString:@"drm-user-departed-family"])
      {
        uint64_t v11 = -42597;
        goto LABEL_31;
      }
    }
  }
}

- (void)dealloc
{
  self->mDocumentRoot = 0;
  self->mError = 0;

  self->mException = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookOpener;
  [(THBookOpener *)&v3 dealloc];
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (NSError)error
{
  return self->mError;
}

- (void)setError:(id)a3
{
}

- (NSException)exception
{
  return self->mException;
}

- (void)setException:(id)a3
{
}

@end