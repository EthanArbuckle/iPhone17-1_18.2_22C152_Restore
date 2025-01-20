@interface SKUIMediaSocialLoadProfilePhotoOperation
- (SKUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3;
- (id)_silhouette;
- (id)outputBlock;
- (void)_fetchMonogram;
- (void)_fetchPhoto;
- (void)_fetchProfile;
- (void)_returnPhoto:(id)a3 isFinal:(BOOL)a4;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUIMediaSocialLoadProfilePhotoOperation

- (SKUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaSocialLoadProfilePhotoOperation;
  v6 = [(SSVOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
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
  v3 = [(SKUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
  [(SKUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v3 isFinal:0];

  [(SKUIMediaSocialLoadProfilePhotoOperation *)self _fetchProfile];
}

- (void)_fetchMonogram
{
  id v10 = [(SKUIMediaSocialProfile *)self->_profile name];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = SKUIContactsUIFramework();
    v4 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v3)), "initWithStyle:diameter:", 0, 57.0);
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
      v8 = [(SKUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
    }
    [(SKUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v8 isFinal:1];
  }
  else
  {
    v4 = [(SKUIMediaSocialLoadProfilePhotoOperation *)self _silhouette];
    [(SKUIMediaSocialLoadProfilePhotoOperation *)self _returnPhoto:v4 isFinal:1];
  }
}

- (void)_fetchPhoto
{
  uint64_t v3 = [(SKUIMediaSocialProfile *)self->_profile profileImageURL];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v3];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__SKUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke;
    v5[3] = &unk_1E642A8A8;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    [v4 setOutputBlock:v5];
    [(SSVOperation *)self runChildOperation:v4];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SKUIMediaSocialLoadProfilePhotoOperation *)self _fetchMonogram];
  }
}

void __55__SKUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    v7 = [MEMORY[0x1E4FB1818] imageWithData:v10];
    v8 = -[SKUIStyledImageDataConsumer initWithSize:treatment:]([SKUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
    v9 = [(SKUIStyledImageDataConsumer *)v8 imageForImage:v7];
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
  uint64_t v3 = +[SKUIMediaSocialProfileCoordinator sharedCoordinator];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke;
  v6[3] = &unk_1E642A8D0;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v5 = v4;
  v7 = v5;
  [v3 getProfileWithOptions:0 profileBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__SKUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
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
  v7 = [(SKUIMediaSocialLoadProfilePhotoOperation *)self outputBlock];
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SKUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke;
    block[3] = &unk_1E642A8F8;
    id v11 = v7;
    id v10 = v6;
    BOOL v12 = a4;
    dispatch_async(v8, block);
  }
}

uint64_t __65__SKUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)_silhouette
{
  uint64_t v2 = SKUIContactsUIFramework();
  uint64_t v3 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v2)), "initWithStyle:diameter:", 0, 57.0);
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

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]";
}

@end