@interface SUUIMediaSocialLoadProfilePhotoOperation
- (SUUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3;
- (id)_silhouette;
- (id)outputBlock;
- (void)_fetchMonogram;
- (void)_fetchPhoto;
- (void)_fetchProfile;
- (void)_returnPhoto:(id)a3 isFinal:(BOOL)a4;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUUIMediaSocialLoadProfilePhotoOperation

- (SUUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialLoadProfilePhotoOperation;
  v6 = [(SSVOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v7->_lock;
    v7->_lock = v8;

    [(NSLock *)v7->_lock setName:@"com.apple.MediaSocial.loadProfilePhoto"];
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

- (void)main
{
  v3 = [(SUUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
  [(SUUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v3 isFinal:0];

  [(SUUIMediaSocialLoadProfilePhotoOperation *)self _fetchProfile];
}

- (void)_fetchMonogram
{
  id v10 = [(SUUIMediaSocialProfile *)self->_profile name];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = SUUIContactsUIFramework();
    v4 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v3)), "initWithStyle:diameter:", 0, 57.0);
    id v5 = [v10 componentsSeparatedByString:@" "];
    uint64_t v6 = [v5 count];
    if (!v6) {
      goto LABEL_8;
    }
    if (v6 == 1)
    {
      v7 = [v5 firstObject];
      v8 = [v4 monogramForPersonWithFirstName:v7 lastName:0];
    }
    else
    {
      v7 = [v5 firstObject];
      v9 = [v5 lastObject];
      v8 = [v4 monogramForPersonWithFirstName:v7 lastName:v9];
    }
    if (!v8)
    {
LABEL_8:
      v8 = [(SUUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
    }
    [(SUUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v8 isFinal:1];
  }
  else
  {
    v4 = [(SUUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
    [(SUUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v4 isFinal:1];
  }
}

- (void)_fetchPhoto
{
  uint64_t v3 = [(SUUIMediaSocialProfile *)self->_profile profileImageURL];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v3];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__SUUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke;
    v5[3] = &unk_265403598;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    [v4 setOutputBlock:v5];
    [(SSVOperation *)self runChildOperation:v4];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SUUIMediaSocialLoadProfilePhotoOperation *)self _fetchMonogram];
  }
}

void __55__SUUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a3)
  {
    [WeakRetained _fetchMonogram];
  }
  else
  {
    v7 = [MEMORY[0x263F827E8] imageWithData:v10];
    v8 = -[SUUIStyledImageDataConsumer initWithSize:treatment:]([SUUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
    v9 = [(SUUIStyledImageDataConsumer *)v8 imageForImage:v7];
    if (v9) {
      [v6 _returnPhoto:v9 isFinal:1];
    }
    else {
      [*(id *)(a1 + 32) _fetchMonogram];
    }
  }
}

- (void)_fetchProfile
{
  uint64_t v3 = +[SUUIMediaSocialProfileCoordinator sharedCoordinator];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SUUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke;
  v6[3] = &unk_2654035C0;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v5 = v4;
  v7 = v5;
  [v3 getProfileWithOptions:0 profileBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__SUUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v11 = a2;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (a4)
    {
      id v10 = [WeakRetained _silhouette];
      [v9 _returnPhoto:v10 isFinal:1];
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 336), a2);
      [v9 _fetchPhoto];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_returnPhoto:(id)a3 isFinal:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SUUIMediaSocialLoadProfilePhotoOperation *)self outputBlock];
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__SUUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke;
    block[3] = &unk_2654035E8;
    id v11 = v7;
    id v10 = v6;
    BOOL v12 = a4;
    dispatch_async(v8, block);
  }
}

uint64_t __65__SUUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)_silhouette
{
  uint64_t v2 = SUUIContactsUIFramework();
  uint64_t v3 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v2)), "initWithStyle:diameter:", 0, 57.0);
  dispatch_semaphore_t v4 = [v3 silhouetteMonogram];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end