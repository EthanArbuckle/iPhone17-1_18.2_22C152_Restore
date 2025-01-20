@interface SYNotesActivationRequest
- (BOOL)shouldAutoInsertLinkToCurrentActivity;
- (NSArray)imageFileURLs;
- (NSArray)imagesData;
- (NSArray)urls;
- (NSMutableArray)_imageFileURLs;
- (NSMutableArray)_imagesData;
- (NSMutableArray)_urls;
- (SYNotesActivationRequest)init;
- (void)addImageData:(id)a3;
- (void)addImageFileURL:(id)a3;
- (void)addImageFileURLs:(id)a3;
- (void)addImagesData:(id)a3;
- (void)addURL:(id)a3;
- (void)addURLs:(id)a3;
- (void)setShouldAutoInsertLinkToCurrentActivity:(BOOL)a3;
- (void)set_imageFileURLs:(id)a3;
- (void)set_imagesData:(id)a3;
- (void)set_urls:(id)a3;
@end

@implementation SYNotesActivationRequest

- (SYNotesActivationRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)SYNotesActivationRequest;
  v2 = [(SYNotesActivationRequest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    urls = v2->__urls;
    v2->__urls = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    imagesData = v2->__imagesData;
    v2->__imagesData = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    imageFileURLs = v2->__imageFileURLs;
    v2->__imageFileURLs = (NSMutableArray *)v7;
  }
  return v2;
}

- (NSArray)urls
{
  v2 = [(SYNotesActivationRequest *)self _urls];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _urls];
  [v5 addObject:v4];
}

- (void)addURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _urls];
  [v5 addObjectsFromArray:v4];
}

- (NSArray)imagesData
{
  v2 = [(SYNotesActivationRequest *)self _imagesData];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addImageData:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _imagesData];
  [v5 addObject:v4];
}

- (void)addImagesData:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _imagesData];
  [v5 addObjectsFromArray:v4];
}

- (NSArray)imageFileURLs
{
  v2 = [(SYNotesActivationRequest *)self _imageFileURLs];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addImageFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _imageFileURLs];
  [v5 addObject:v4];
}

- (void)addImageFileURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(SYNotesActivationRequest *)self _imageFileURLs];
  [v5 addObjectsFromArray:v4];
}

- (BOOL)shouldAutoInsertLinkToCurrentActivity
{
  return self->_shouldAutoInsertLinkToCurrentActivity;
}

- (void)setShouldAutoInsertLinkToCurrentActivity:(BOOL)a3
{
  self->_shouldAutoInsertLinkToCurrentActivity = a3;
}

- (NSMutableArray)_imagesData
{
  return self->__imagesData;
}

- (void)set_imagesData:(id)a3
{
}

- (NSMutableArray)_urls
{
  return self->__urls;
}

- (void)set_urls:(id)a3
{
}

- (NSMutableArray)_imageFileURLs
{
  return self->__imageFileURLs;
}

- (void)set_imageFileURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageFileURLs, 0);
  objc_storeStrong((id *)&self->__urls, 0);
  objc_storeStrong((id *)&self->__imagesData, 0);
}

@end