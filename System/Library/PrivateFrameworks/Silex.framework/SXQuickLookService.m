@interface SXQuickLookService
- (QLThumbnailGenerator)generator;
- (SXQuickLookService)init;
- (void)fetchThumbnailForFile:(id)a3 size:(CGSize)a4 onCompletion:(id)a5 onError:(id)a6;
@end

@implementation SXQuickLookService

- (SXQuickLookService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXQuickLookService;
  v2 = [(SXQuickLookService *)&v6 init];
  if (v2)
  {
    v3 = (QLThumbnailGenerator *)objc_alloc_init(MEMORY[0x263F160D0]);
    generator = v2->_generator;
    v2->_generator = v3;
  }
  return v2;
}

- (void)fetchThumbnailForFile:(id)a3 size:(CGSize)a4 onCompletion:(id)a5 onError:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a5;
  id v12 = a6;
  v13 = (objc_class *)MEMORY[0x263F160C8];
  id v14 = a3;
  id v15 = [v13 alloc];
  v16 = [v14 fileURL];

  v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];
  v19 = objc_msgSend(v15, "initWithFileAtURL:size:scale:representationTypes:", v16, -1, width, height, v18);

  v20 = [(SXQuickLookService *)self generator];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__SXQuickLookService_fetchThumbnailForFile_size_onCompletion_onError___block_invoke;
  v23[3] = &unk_264654018;
  id v24 = v11;
  id v25 = v12;
  id v21 = v12;
  id v22 = v11;
  [v20 generateBestRepresentationForRequest:v19 completionHandler:v23];
}

void __70__SXQuickLookService_fetchThumbnailForFile_size_onCompletion_onError___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v4 = [a2 UIImage];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

- (QLThumbnailGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
}

@end