@interface MusicMonogramArtworkDataSource
+ (MusicMonogramArtworkDataSource)sharedMonogramArtworkDataSource;
+ (OS_dispatch_queue)loadingQueue;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (CNAvatarImageRenderer)renderer;
- (CNCancelable)cancelableRenderer;
- (MusicMonogramArtworkDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)_monogramImageForToken:(id)a3 fittingSize:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)setCancelableRenderer:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation MusicMonogramArtworkDataSource

- (MusicMonogramArtworkDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicMonogramArtworkDataSource;
  v2 = [(MusicMonogramArtworkDataSource *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

+ (MusicMonogramArtworkDataSource)sharedMonogramArtworkDataSource
{
  if (qword_100697128 != -1) {
    dispatch_once(&qword_100697128, &stru_100631098);
  }
  v2 = (void *)qword_100697120;

  return (MusicMonogramArtworkDataSource *)v2;
}

+ (OS_dispatch_queue)loadingQueue
{
  if (qword_100697138 != -1) {
    dispatch_once(&qword_100697138, &stru_1006310B8);
  }
  v2 = (void *)qword_100697130;

  return (OS_dispatch_queue *)v2;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() loadingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A8294;
  block[3] = &unk_100631108;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  [(CNCancelable *)self->_cancelableRenderer cancel];
  cancelableRenderer = self->_cancelableRenderer;
  self->_cancelableRenderer = 0;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return [a3 token];
}

- (void)_monogramImageForToken:(id)a3 fittingSize:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = (void (**)(id, void *))a6;
  if (width < height) {
    double height = width;
  }
  if (a5 <= 0.0)
  {
    v13 = +[UIScreen mainScreen];
    [v13 scale];
    a5 = v14;
  }
  v15 = [v11 fullName];
  if (!self->_renderer)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v16 = (void *)qword_100697140;
    uint64_t v41 = qword_100697140;
    if (!qword_100697140)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_1003A892C;
      v36 = &unk_100631130;
      v37 = &v38;
      sub_1003A892C((uint64_t)&v33);
      v16 = (void *)v39[3];
    }
    v17 = v16;
    _Block_object_dispose(&v38, 8);
    id v18 = [v17 alloc];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v19 = (void *)qword_100697150;
    uint64_t v41 = qword_100697150;
    if (!qword_100697150)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_1003A8AEC;
      v36 = &unk_100631130;
      v37 = &v38;
      sub_1003A8AEC((uint64_t)&v33);
      v19 = (void *)v39[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v38, 8);
    v21 = [v20 defaultSettings];
    v22 = (CNAvatarImageRenderer *)[v18 initWithSettings:v21];
    renderer = self->_renderer;
    self->_renderer = v22;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v24 = (void *)qword_100697158;
  uint64_t v41 = qword_100697158;
  if (!qword_100697158)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = sub_1003A8B44;
    v36 = &unk_100631130;
    v37 = &v38;
    sub_1003A8B44((uint64_t)&v33);
    v24 = (void *)v39[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v38, 8);
  v26 = objc_msgSend(v25, "scopeWithPointSize:scale:rightToLeft:style:", objc_msgSend(v11, "rightToLeft"), 0, height, height, a5);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v27 = (void *)qword_100697160;
  uint64_t v41 = qword_100697160;
  if (!qword_100697160)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = sub_1003A8B9C;
    v36 = &unk_100631130;
    v37 = &v38;
    sub_1003A8B9C((uint64_t)&v33);
    v27 = (void *)v39[3];
  }
  id v28 = v27;
  _Block_object_dispose(&v38, 8);
  v29 = [v28 contactWithDisplayName:v15 emailOrPhoneNumber:0];
  v30 = self->_renderer;
  v42 = v29;
  v31 = +[NSArray arrayWithObjects:&v42 count:1];
  v32 = [(CNAvatarImageRenderer *)v30 avatarImageForContacts:v31 scope:v26];

  v12[2](v12, v32);
}

- (CNCancelable)cancelableRenderer
{
  return self->_cancelableRenderer;
}

- (void)setCancelableRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_cancelableRenderer, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end