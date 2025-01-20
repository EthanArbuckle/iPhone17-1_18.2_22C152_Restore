@interface QLProxyingGenerationHandler
- (QLProxyingGenerationHandler)initWithGeneratorRequest:(id)a3;
- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9;
- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4;
- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5;
@end

@implementation QLProxyingGenerationHandler

- (QLProxyingGenerationHandler)initWithGeneratorRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLProxyingGenerationHandler;
  v6 = [(QLProxyingGenerationHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_generatorRequest, a3);
  }

  return v7;
}

- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9
{
  BOOL v9 = a9;
  uint64_t v11 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v28 = a5;
  generatorRequest = self->_generatorRequest;
  id v19 = a4;
  [(QLTGeneratorThumbnailRequest *)generatorRequest addTypeToHandledTypes:a8];
  [(QLTGeneratorThumbnailRequest *)self->_generatorRequest addTypeToSuccessfullyHandledTypes:a8];
  v20 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest generationHandler];
  v21 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
  v22 = [v21 uuid];
  objc_msgSend(v20, "didGenerateThumbnailForRequestWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:", v22, v19, v28, v11, a8, v9, x, y, width, height);

  v23 = [v19 firstObject];

  if (a8 == 2 && v9 && v23)
  {
    v24 = +[QLServerThread sharedInstance];
    v25 = [v23 data];
    v26 = self->_generatorRequest;
    v27 = [v23 format];
    objc_msgSend(v24, "addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:", v25, v26, v27, v11, v28, x, y, width, height);
  }
}

- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5
{
  generatorRequest = self->_generatorRequest;
  id v8 = a5;
  [(QLTGeneratorThumbnailRequest *)generatorRequest addTypeToHandledTypes:a3];
  id v11 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest generationHandler];
  BOOL v9 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
  v10 = [v9 uuid];
  [v11 failedToGenerateThumbnailOfType:a3 forRequestWithUUID:v10 error:v8];
}

- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4
{
  id v8 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest generationHandler];
  v6 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
  v7 = [v6 uuid];
  [v8 didUpdateStatus:a3 ofThumbnailGenerationWithUUID:v7];
}

- (void).cxx_destruct
{
}

@end