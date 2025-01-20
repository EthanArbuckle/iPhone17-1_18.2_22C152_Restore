@interface SUUIMediaSocialSaveProfilePhotoOperation
- (SUUIMediaSocialSaveProfilePhotoOperation)initWithClientContext:(id)a3;
- (id)_photoUploadWithResponseDictionary:(id)a3;
- (id)_requestWithError:(id *)a3;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
- (void)setPhoto:(id)a3;
@end

@implementation SUUIMediaSocialSaveProfilePhotoOperation

- (SUUIMediaSocialSaveProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialSaveProfilePhotoOperation;
  v6 = [(SSVOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v7->_lock;
    v7->_lock = v8;

    [(NSLock *)v7->_lock setName:@"com.apple.MediaSocial.saveProfilePhoto"];
  }

  return v7;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_outputBlock != v6)
  {
    v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setPhoto:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  id v6 = (UIImage *)[v5 copy];

  photo = self->_photo;
  self->_photo = v6;

  v8 = self->_lock;
  [(NSLock *)v8 unlock];
}

- (void)main
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__46;
  v24 = __Block_byref_object_dispose__46;
  id v25 = 0;
  id obj = 0;
  v3 = [(SUUIMediaSocialSaveProfilePhotoOperation *)self _requestWithError:&obj];
  objc_storeStrong(&v25, obj);
  if (v3)
  {
    id v4 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v3];
    id v5 = [MEMORY[0x263F7B418] consumer];
    [v4 setDataConsumer:v5];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__46;
    v17 = __Block_byref_object_dispose__46;
    id v18 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__SUUIMediaSocialSaveProfilePhotoOperation_main__block_invoke;
    v12[3] = &unk_265402EF0;
    v12[4] = &v13;
    v12[5] = &v20;
    [v4 setOutputBlock:v12];
    [(SSVOperation *)self runChildOperation:v4];
    if (v21[5])
    {
      id v6 = 0;
    }
    else
    {
      v7 = [v4 URLResponse];
      if ([v7 statusCode] < 200 || objc_msgSend(v7, "statusCode") > 299)
      {
        if ([v7 statusCode] == 403) {
          [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:3 userInfo:0];
        }
        else {
        uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:0 userInfo:0];
        }
        v9 = (void *)v21[5];
        v21[5] = v8;

        id v6 = 0;
      }
      else
      {
        id v6 = [(SUUIMediaSocialSaveProfilePhotoOperation *)self _photoUploadWithResponseDictionary:v14[5]];
      }
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v10 = [(SUUIMediaSocialSaveProfilePhotoOperation *)self outputBlock];
  objc_super v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v6, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
}

void __48__SUUIMediaSocialSaveProfilePhotoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  v9 = *v6;
  void *v6 = v8;

LABEL_6:
}

- (id)_photoUploadWithResponseDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [[SUUIMediaSocialPhotoUpload alloc] initWithUploadDictionary:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_requestWithError:(id *)a3
{
  id v5 = [(SUUIClientContext *)self->_clientContext URLBag];
  id v6 = [v5 valueForKey:@"directUploaderRichPostImage" error:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_photo)
    {
      v7 = [NSURL URLWithString:v6];
      id v8 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v7];
      [v8 setHTTPMethod:@"POST"];
      [v8 setValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
      v9 = [MEMORY[0x263F08C38] UUID];
      id v10 = [v9 UUIDString];

      objc_super v11 = [v10 stringByAppendingPathExtension:@"jpg"];

      [v8 setValue:v11 forHTTPHeaderField:@"X-Original-Filename"];
      v12 = UIImageJPEGRepresentation(self->_photo, 0.8);
      [v8 setHTTPBody:v12];
      SSVAddMediaSocialHeadersToURLRequest();

      goto LABEL_10;
    }
    if (a3)
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SUUIErrorDomain" code:4 userInfo:0];
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    uint64_t v13 = SSError();
LABEL_8:
    id v8 = 0;
    *a3 = v13;
    goto LABEL_10;
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end