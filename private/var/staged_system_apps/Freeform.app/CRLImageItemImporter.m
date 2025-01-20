@interface CRLImageItemImporter
+ (BOOL)p_canAnimate:(CGImageSource *)a3;
+ (BOOL)p_canImportImageSource:(CGImageSource *)a3;
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (id)protected_supportedFileTypes;
+ (id)protected_supportedFileUTTypes;
- (CRLImageItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (CRLImageItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (id)boardItem;
- (id)error;
- (id)progress;
- (unint64_t)embeddedDataLength;
- (unint64_t)p_embeddedDataLengthForInfo:(id)a3;
- (unint64_t)p_uploadDataLengthForInfo:(id)a3;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
- (void)p_createAssetDataAndThenContinueImportWithCompletionHandler:(id)a3;
- (void)p_doAsyncImportWorkWithCompletionHandler:(id)a3;
- (void)p_finishImportingWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)p_importImageFromDataConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 fromCompatibilityLevel:(int64_t)a4 completionHandler:(id)a5;
- (void)p_importInfoFromDataWithCompletionHandler:(id)a3;
- (void)p_tellDelegateToIgnoreCompatibilityLevelIfNeeded;
@end

@implementation CRLImageItemImporter

+ (id)protected_supportedFileTypes
{
  return +[CRLIngestionTypes supportedImageTypes];
}

+ (id)protected_supportedFileUTTypes
{
  return +[CRLIngestionTypes supportedImageUTTypes];
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  CFURLRef v6 = (const __CFURL *)a3;
  id v7 = a4;
  v8 = [UTTypePDF identifier];
  unsigned __int8 v9 = [v7 crl_conformsToUTI:v8];

  if (v9) {
    goto LABEL_2;
  }
  if (![a1 isSupportedAnimatedImageFileType:v7])
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CRLImageItemImporter;
    unsigned __int8 v10 = [super protected_canImportFileAtURL:v6 type:v7];
    goto LABEL_10;
  }
  CGImageSourceRef v11 = CGImageSourceCreateWithURL(v6, 0);
  if (!v11)
  {
LABEL_2:
    unsigned __int8 v10 = 0;
  }
  else
  {
    CGImageSourceRef v12 = v11;
    if (objc_msgSend(a1, "p_canImportImageSource:", v11)) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = +[PFImageMetadata imageSourceIsSpatial:v12];
    }
    CFRelease(v12);
  }
LABEL_10:

  return v10;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 type];
  unsigned __int8 v9 = [v8 isEqual:UTTypePDF];

  if (v9) {
    goto LABEL_2;
  }
  if (![a1 isSupportedAnimatedImageFileType:v7])
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CRLImageItemImporter;
    unsigned __int8 v10 = [super protected_canImportFileWithPreinsertionAsset:v6 type:v7];
    goto LABEL_10;
  }
  id v11 = [v6 newCGImageSource];
  if (!v11)
  {
LABEL_2:
    unsigned __int8 v10 = 0;
  }
  else
  {
    CGImageSourceRef v12 = v11;
    if (objc_msgSend(a1, "p_canImportImageSource:", v11)) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = +[PFImageMetadata imageSourceIsSpatial:v12];
    }
    CFRelease(v12);
  }
LABEL_10:

  return v10;
}

+ (BOOL)p_canImportImageSource:(CGImageSource *)a3
{
  size_t Count = CGImageSourceGetCount(a3);
  if (Count != 1) {
    LOBYTE(Count) = [a1 p_canAnimate:a3] ^ 1;
  }
  return Count;
}

+ (BOOL)p_canAnimate:(CGImageSource *)a3
{
  if (!a3) {
    return 1;
  }
  CFDictionaryRef v3 = CGImageSourceCopyProperties(a3, 0);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"CanAnimate"];
  v5 = v4;
  if (v4) {
    BOOL v6 = [v4 intValue] != 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (CRLImageItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLImageItemImporter;
  v4 = [(CRLBoardItemImporter *)&v7 initWithURL:a3 boardItemFactory:a4];
  v5 = v4;
  if (v4) {
    sub_10040A5EC(v4);
  }
  return v5;
}

- (CRLImageItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLImageItemImporter;
  v4 = [(CRLBoardItemImporter *)&v7 initWithData:a3 boardItemFactory:a4];
  v5 = v4;
  if (v4) {
    sub_10040A5EC(v4);
  }
  return v5;
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v4 = a3;
  importQueue = self->_importQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10040A778;
  v7[3] = &unk_1014D0AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(importQueue, v7);
}

- (void)p_createAssetDataAndThenContinueImportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }

  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    objc_super v7 = [(CRLBoardItemImporter *)self URL];
    if (v7)
    {
      id v8 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
      unsigned __int8 v9 = [(CRLBoardItemImporter *)self URL];
      unsigned __int8 v10 = [(CRLBoardItemImporter *)self boardItemFactory];
      id v11 = [v10 assetOwner];
      CGImageSourceRef v12 = [(CRLPreinsertionAssetWrapper *)v8 initWithUrl:v9 owner:v11];

      if (!v12)
      {
LABEL_11:
        [(CRLImageItemImporter *)self p_doAsyncImportWorkWithCompletionHandler:v4];
        goto LABEL_12;
      }
    }
    else
    {
      v13 = [(CRLBoardItemImporter *)self preinsertionAsset];

      if (!v13) {
        goto LABEL_11;
      }
      CGImageSourceRef v12 = [(CRLBoardItemImporter *)self preinsertionAsset];
      if (!v12) {
        goto LABEL_11;
      }
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10040A944;
    v14[3] = &unk_1014D0B58;
    v14[4] = self;
    id v15 = v4;
    [(CRLPreinsertionAssetWrapper *)v12 createAssetWithCompletionHandler:v14];

LABEL_12:
  }
}

- (void)p_doAsyncImportWorkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }

  [(CRLBasicProgress *)self->_progress maxValue];
  if (atomic_load((unsigned int *)&self->_isCancelled))
  {
    [(CRLImageItemImporter *)self p_finishImportingWithInfo:0 error:0 completionHandler:v4];
  }
  else
  {
    double v8 = v6;
    [(CRLBasicProgress *)self->_progress setValue:v6 * 0.1];
    imageData = self->_imageData;
    if (imageData)
    {
      objc_storeStrong((id *)&self->_originalImageData, imageData);
      unsigned __int8 v10 = [(CRLBoardItemImporter *)self delegate];
      if (v10) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 3;
      }
      CGImageSourceRef v12 = [[CRLImageCompatibilityChecker alloc] initWithImageData:self->_imageData];
      compatibilityChecker = self->_compatibilityChecker;
      self->_compatibilityChecker = v12;

      objc_super v14 = self->_compatibilityChecker;
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_10040AE58;
      v19 = &unk_1014ECB88;
      v20 = self;
      id v21 = v10;
      uint64_t v23 = v11;
      id v22 = v4;
      id v15 = v10;
      [(CRLImageCompatibilityChecker *)v14 checkCompatibilityUpToLevel:v11 completionHandler:&v16];
    }
    else
    {
      [(CRLImageItemImporter *)self p_finishImportingWithInfo:0 error:0 completionHandler:v4];
    }
    -[CRLBasicProgress setValue:](self->_progress, "setValue:", v8 * 0.5, v16, v17, v18, v19, v20);
  }
}

- (void)p_importImageFromDataConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 fromCompatibilityLevel:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v9);
  }

  if (a4 >= a3)
  {
    [(CRLImageItemImporter *)self p_importInfoFromDataWithCompletionHandler:v8];
  }
  else if (a4 < 2)
  {
    v32[0] = NSLocalizedDescriptionKey;
    uint64_t v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"The image type is not supported on this device." value:0 table:0];
    v32[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
    v33[0] = v18;
    v33[1] = &off_10155DE38;
    v19 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

    id v20 = [v19 mutableCopy];
    id v21 = [(CRLBoardItemImporter *)self URL];
    if (v21) {
      [v20 setObject:v21 forKeyedSubscript:NSURLErrorKey];
    }
    id v22 = +[NSError errorWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:103 userInfo:v20];
    if ((sub_100454C50(self->_imageData) & 1) == 0)
    {
      id v27 = objc_alloc((Class)NSError);
      v30[0] = NSLocalizedFailureReasonErrorKey;
      uint64_t v23 = +[NSBundle mainBundle];
      v24 = [v23 localizedStringForKey:@"This image is too large to insert." value:0 table:0];
      v30[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
      v31[0] = v24;
      v31[1] = &off_10155DE38;
      v25 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      id v26 = [v27 initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:102 userInfo:v25];

      id v22 = v26;
    }
    [(CRLImageItemImporter *)self p_finishImportingWithInfo:0 error:v22 completionHandler:v8];
  }
  else
  {
    unsigned __int8 v10 = [CRLImageCompatibilityConverter alloc];
    imageData = self->_imageData;
    CGImageSourceRef v12 = [(CRLBoardItemImporter *)self boardItemFactory];
    v13 = [v12 assetOwner];
    objc_super v14 = [(CRLImageCompatibilityConverter *)v10 initWithImageData:imageData desiredCompatibilityLevel:a3 assetOwner:v13];
    compatibilityConverter = self->_compatibilityConverter;
    self->_compatibilityConverter = v14;

    v16 = self->_compatibilityConverter;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10040B548;
    v28[3] = &unk_1014D0AB0;
    v28[4] = self;
    id v29 = v8;
    [(CRLImageCompatibilityConverter *)v16 convertMediaWithCompletionHandler:v28];
  }
}

- (void)p_importInfoFromDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }

  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    [(CRLBasicProgress *)self->_progress maxValue];
    if (!self->_imageData || (unsigned int v9 = atomic_load((unsigned int *)&self->_isCancelled)) != 0)
    {
      id v10 = 0;
      uint64_t v11 = 0;
LABEL_17:
      [(CRLImageItemImporter *)self p_finishImportingWithInfo:v11 error:v10 completionHandler:v4];

      goto LABEL_18;
    }
    double v12 = v8;
    char v13 = sub_100454C50(self->_imageData);
    objc_super v14 = &off_1014C1000;
    id v15 = &off_1014C1000;
    if (v13) {
      goto LABEL_23;
    }
    id v16 = objc_alloc((Class)NSError);
    v34[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"This image is too large to insert." value:0 table:0];
    v34[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
    v35[0] = v18;
    v35[1] = &off_10155DE38;
    v19 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v10 = [v16 initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:102 userInfo:v19];

    objc_super v14 = &off_1014C1000;
    id v15 = &off_1014C1000;
    if (!v10)
    {
LABEL_23:
      if (self->_imageData)
      {
        id v20 = +[CRLImageProviderPool sharedPool];
        id v21 = [v20 providerForAsset:self->_imageData shouldValidate:1];

        if (v21 && ![v21 isError])
        {
          [v21 dpiAdjustedNaturalSize];
          double v28 = sub_100067234(v26, v27, 250.0, 250.0);
          v30 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", v28, v29);
          v31 = [(CRLBoardItemImporter *)self boardItemFactory];
          uint64_t v11 = [v31 makeImageItemWithGeometry:v30 imageData:self->_imageData thumbnailData:self->_thumbnailData];

          id v15 = &off_1014C1000;
          objc_super v14 = &off_1014C1000;
          if (v11)
          {
            id v10 = 0;
            goto LABEL_16;
          }
        }
        else
        {

          objc_super v14 = &off_1014C1000;
        }
      }
      id v22 = objc_alloc(v14[56]);
      v32[0] = NSLocalizedFailureReasonErrorKey;
      uint64_t v23 = [(__objc2_class *)v15[38] mainBundle];
      v24 = [v23 localizedStringForKey:@"This image is of an unsupported type." value:0 table:0];
      v32[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
      v33[0] = v24;
      v33[1] = &off_10155DE38;
      v25 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      id v10 = [v22 initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:103 userInfo:v25];
    }
    uint64_t v11 = 0;
LABEL_16:
    [(CRLBasicProgress *)self->_progress setValue:v12];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)p_finishImportingWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(void))a5;
  [(CRLImageItemImporter *)self p_tellDelegateToIgnoreCompatibilityLevelIfNeeded];
  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    if (!v9)
    {
      char v13 = [(CRLBoardItemImporter *)self URL];
      objc_super v14 = v13;
      if (v13)
      {
        id v27 = 0;
        [v13 getResourceValue:&v27 forKey:NSURLLocalizedNameKey error:0];
        id v15 = v27;
        if (!v15)
        {
          id v15 = [v14 lastPathComponent];
        }
        id v16 = +[NSBundle mainBundle];
        uint64_t v17 = [v16 localizedStringForKey:@"The image “%@” couldn’t be inserted." value:0 table:0];
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15);
      }
      else
      {
        id v15 = +[NSBundle mainBundle];
        v18 = [v15 localizedStringForKey:@"The image couldn’t be inserted." value:0 table:0];
      }

      if (v10)
      {
        v19 = [v10 userInfo];
        id v20 = [v19 mutableCopy];

        id v21 = [v20 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        if (!v21) {
          [v20 setObject:v18 forKeyedSubscript:NSLocalizedDescriptionKey];
        }
        if (v14) {
          [v20 setObject:v14 forKeyedSubscript:NSURLErrorKey];
        }
        id v22 = objc_alloc((Class)NSError);
        uint64_t v23 = [v10 domain];
        v24 = [v22 initWithDomain:v23 code:[v10 code] userInfo:v20];
        error = self->_error;
        self->_error = v24;
      }
      else
      {
        id v20 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
        [v20 setObject:v18 forKeyedSubscript:NSLocalizedDescriptionKey];
        [v20 setObject:&off_10155DE38 forKeyedSubscript:@"CRLBoardItemImporterErrorMediaTypeKey"];
        if (v14) {
          [v20 setObject:v14 forKeyedSubscript:NSURLErrorKey];
        }
        double v26 = (NSError *)[objc_alloc((Class)NSError) initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:100 userInfo:v20];
        uint64_t v23 = self->_error;
        self->_error = v26;
      }

      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_boardItem, a3);
  }
  if (v11) {
LABEL_5:
  }
    v11[2](v11);
LABEL_6:
}

- (void)p_tellDelegateToIgnoreCompatibilityLevelIfNeeded
{
  CFDictionaryRef v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (!self->_didMessageDelegateAboutMediaCompatibility)
  {
    self->_didMessageDelegateAboutMediaCompatibility = 1;
    uint64_t v4 = [(CRLBoardItemImporter *)self delegate];
    if (v4)
    {
      v5 = (void *)v4;
      uint64_t v4 = objc_opt_respondsToSelector();
      if (v4) {
        uint64_t v4 = (uint64_t)[v5 boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
      }
    }
    _objc_release_x2(v4);
  }
}

- (void)cancel
{
  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040BF20;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (unint64_t)uploadDataLength
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_1002469D0(v3, self->_boardItem);
  unint64_t v5 = [(CRLImageItemImporter *)self p_uploadDataLengthForInfo:v4];

  return v5;
}

- (unint64_t)embeddedDataLength
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_1002469D0(v3, self->_boardItem);
  unint64_t v5 = [(CRLImageItemImporter *)self p_embeddedDataLengthForInfo:v4];

  return v5;
}

- (unint64_t)p_uploadDataLengthForInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 imageAssetPayload];

  if (v4)
  {
    unint64_t v5 = [v3 imageAssetPayload];
    id v4 = [v5 length];
  }
  return (unint64_t)v4;
}

- (unint64_t)p_embeddedDataLengthForInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 thumbnailAssetPayload];

  if (v4)
  {
    unint64_t v5 = [v3 thumbnailAssetPayload];
    id v4 = (char *)[v5 length];
  }
  double v6 = [v3 imageAssetPayload];

  if (v6)
  {
    objc_super v7 = [v3 imageAssetPayload];
    id v4 = &v4[(void)[v7 length]];
  }
  return (unint64_t)v4;
}

- (id)progress
{
  return self->_progress;
}

- (id)boardItem
{
  return self->_boardItem;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_compatibilityConverter, 0);
  objc_storeStrong((id *)&self->_compatibilityChecker, 0);
  objc_storeStrong((id *)&self->_originalImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end