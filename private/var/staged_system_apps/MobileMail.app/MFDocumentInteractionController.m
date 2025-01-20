@interface MFDocumentInteractionController
+ (id)interactionControllerWithURL:(id)a3;
- (NSURL)originalURL;
- (void)setOriginalURL:(id)a3;
@end

@implementation MFDocumentInteractionController

+ (id)interactionControllerWithURL:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MFDocumentInteractionController;
  v5 = [super interactionControllerWithURL:v4];
  [v5 setOriginalURL:v4];

  return v5;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end