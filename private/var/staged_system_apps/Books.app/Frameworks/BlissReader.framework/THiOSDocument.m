@interface THiOSDocument
- (CGSize)previewImageSize;
- (Class)documentRootClass;
- (THiOSDocument)initWithBookDescription:(id)a3;
- (TSUTemporaryDirectory)tempDirectory;
- (id)documentCachePath;
- (id)name;
- (void)dealloc;
- (void)setTempDirectory:(id)a3;
@end

@implementation THiOSDocument

- (THiOSDocument)initWithBookDescription:(id)a3
{
  id v5 = objc_alloc_init((Class)TSUTemporaryDirectory);
  v9.receiver = self;
  v9.super_class = (Class)THiOSDocument;
  v6 = -[THiOSDocument initWithTemporaryFileURL:[NSURL fileURLWithPath:[v5 path]]];
  v7 = v6;
  if (v6)
  {
    [(THiOSDocument *)v6 setTempDirectory:v5];
    [v7 documentRoot].bookDescription = a3;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THiOSDocument;
  [(THiOSDocument *)&v3 dealloc];
}

- (id)name
{
  id v2 = [[self documentRoot] bookDescription];

  return [v2 bookTitle];
}

- (id)documentCachePath
{
  return 0;
}

- (CGSize)previewImageSize
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSDocument previewImageSize]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THiOSDocument.mm") lineNumber:65 description:@"no preview images"];
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (Class)documentRootClass
{
  return (Class)objc_opt_class();
}

- (TSUTemporaryDirectory)tempDirectory
{
  return self->_tempDirectory;
}

- (void)setTempDirectory:(id)a3
{
}

@end