@interface SUUIArtworkRequest
- (BOOL)cachesInMemory;
- (NSString)imageName;
- (NSURL)URL;
- (SSVURLDataConsumer)dataConsumer;
- (SUUIArtworkRequestDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newLoadOperation;
- (void)finishWithResource:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageName:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUUIArtworkRequest

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SUUIArtworkRequest *)self URL];
  v7 = [v3 stringWithFormat:@"<%@:%p URL = %@>", v5, self, v6];;

  return v7;
}

- (BOOL)cachesInMemory
{
  return 1;
}

- (void)finishWithResource:(id)a3
{
  image = (UIImage *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained artworkRequest:self didLoadImage:image];
  }
  else
  {
    v5 = [(SUUIArtworkRequest *)self URL];
    v6 = [v5 scheme];
    char v7 = [v6 isEqualToString:@"x-apple-identity-image"];

    if (v7)
    {
      v8 = (void *)MEMORY[0x263F827E8];
      v9 = UIImagePNGRepresentation(image);
      v10 = [v8 imageWithData:v9];
    }
    else
    {
      v10 = image;
    }
    v11 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v10, @"SUUIArtworkRequestImageKey", 0);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 postNotificationName:@"SUUIArtworkRequestDidLoadImageNotification" object:self userInfo:v11];
  }
}

- (id)newLoadOperation
{
  v3 = [SUUILoadArtworkResourceOperation alloc];
  return [(SUUILoadArtworkResourceOperation *)v3 initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIArtworkRequest;
  v5 = -[SUUIResourceRequest copyWithZone:](&v12, sel_copyWithZone_);
  objc_storeStrong(v5 + 3, self->_dataConsumer);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v5 + 4, WeakRetained);

  uint64_t v7 = [(NSString *)self->_imageName copyWithZone:a3];
  id v8 = v5[5];
  v5[5] = (id)v7;

  uint64_t v9 = [(NSURL *)self->_url copyWithZone:a3];
  id v10 = v5[6];
  v5[6] = (id)v9;

  return v5;
}

- (SSVURLDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (SUUIArtworkRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIArtworkRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end