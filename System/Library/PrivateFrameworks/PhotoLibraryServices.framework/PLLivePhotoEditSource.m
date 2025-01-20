@interface PLLivePhotoEditSource
+ (id)livePhotoSourceWithPhotoURL:(id)a3 videoComplementURL:(id)a4;
- (PLEditSource)photoEditSource;
- (PLVideoEditSource)videoEditSource;
- (id)_initWithPhotoSource:(id)a3 videoComplement:(id)a4;
@end

@implementation PLLivePhotoEditSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEditSource, 0);
  objc_storeStrong((id *)&self->_photoEditSource, 0);
}

- (PLVideoEditSource)videoEditSource
{
  return self->_videoEditSource;
}

- (PLEditSource)photoEditSource
{
  return self->_photoEditSource;
}

- (id)_initWithPhotoSource:(id)a3 videoComplement:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLEditSource.m", 182, @"Invalid parameter not satisfying: %@", @"photo != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PLEditSource.m", 183, @"Invalid parameter not satisfying: %@", @"video != nil" object file lineNumber description];

LABEL_3:
  v11 = [v8 resolvedSource];
  v12 = [v10 resolvedSource];
  v13 = [getPIPhotoEditHelperClass_84181() livePhotoSourceWithPhotoSource:v11 videoSource:v12];
  v19.receiver = self;
  v19.super_class = (Class)PLLivePhotoEditSource;
  v14 = [(PLEditSource *)&v19 initWithResolvedSource:v13 mediaType:3];
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_photoEditSource, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

+ (id)livePhotoSourceWithPhotoURL:(id)a3 videoComplementURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PLPhotoEditSource alloc] initWithURL:v7 type:0 image:0 useEmbeddedPreview:0];

  id v9 = [[PLVideoEditSource alloc] initWithVideoURL:v6];
  v10 = (void *)[objc_alloc((Class)a1) initWithPhotoSource:v8 videoComplement:v9];

  return v10;
}

@end