@interface SiriUIURLSessionImageDownload
- (SiriUIURLSessionImageDownload)initWithFitToSize:(CGSize)a3 progressHandler:(id)a4 incremental:(BOOL)a5 client:(id)a6 fillColor:(id)a7;
- (void)_updateImageFromURL:(id)a3 error:(id)a4;
- (void)appendDownloadedData:(id)a3 fromURL:(id)a4;
- (void)dealloc;
- (void)finishedFromURL:(id)a3 error:(id)a4;
@end

@implementation SiriUIURLSessionImageDownload

- (SiriUIURLSessionImageDownload)initWithFitToSize:(CGSize)a3 progressHandler:(id)a4 incremental:(BOOL)a5 client:(id)a6 fillColor:(id)a7
{
  BOOL v9 = a5;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SiriUIURLSessionImageDownload;
  v16 = [(SiriUIURLSessionImageDownload *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_fitToSize.CGFloat width = width;
    v16->_fitToSize.CGFloat height = height;
    uint64_t v18 = [v13 copy];
    id progressHandler = v17->_progressHandler;
    v17->_id progressHandler = (id)v18;

    objc_storeStrong(&v17->_client, a6);
    objc_storeStrong((id *)&v17->_backgroundFillColor, a7);
    v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    downloadedData = v17->_downloadedData;
    v17->_downloadedData = v20;

    dispatch_queue_t v22 = dispatch_queue_create("SiriUIURLSessionImageDownload", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v24 = v17->_queue;
    v25 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v24, v25);

    if (v9) {
      v17->_imageSource = CGImageSourceCreateIncremental(0);
    }
  }

  return v17;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriUIURLSessionImageDownload;
  [(SiriUIURLSessionImageDownload *)&v4 dealloc];
}

- (void)_updateImageFromURL:(id)a3 error:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_hasSentFinished)
  {
    BOOL finished = self->_finished;
    imageSource = self->_imageSource;
    if (self->_finished || imageSource)
    {
      NSUInteger v10 = [(NSMutableData *)self->_downloadedData length];
      if (v10 > self->_lastUpdatedLength || self->_finished)
      {
        self->_lastUpdatedLength = v10;
        v11 = self->_downloadedData;
        v12 = [MEMORY[0x263F1C920] mainScreen];
        [v12 scale];
        double v14 = v13;

        if (imageSource)
        {
          CGImageSourceUpdateData(imageSource, (CFDataRef)v11, finished);
          if ((CGImageSourceGetStatus(imageSource) + 1) > 1
            || (ImageAtIndex = CGImageSourceCreateImageAtIndex(imageSource, 0, 0)) == 0)
          {
            id v19 = self->_client;
            goto LABEL_30;
          }
          v16 = ImageAtIndex;
          CGImageRef Copy = CGImageCreateCopy(ImageAtIndex);
          id v18 = [MEMORY[0x263F1C6B0] imageWithCGImage:Copy scale:0 orientation:v14];
          CFRelease(Copy);
          CFRelease(v16);
        }
        else
        {
          id v18 = [MEMORY[0x263F1C6B0] imageWithData:v11 scale:v14];
        }
        double width = self->_fitToSize.width;
        double height = self->_fitToSize.height;
        id v19 = self->_client;
        if (v18)
        {
          [v18 size];
          double v24 = v22;
          double v25 = v23;
          if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
          {
            double v28 = v23;
            double v29 = v22;
            if (!finished)
            {
LABEL_39:
              v68.double width = v29;
              v68.double height = v28;
              UIGraphicsBeginImageContextWithOptions(v68, 0, v14);
              if (self->_backgroundFillColor)
              {
                CurrentContext = UIGraphicsGetCurrentContext();
                CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_backgroundFillColor CGColor]);
                v43 = UIGraphicsGetCurrentContext();
                v71.origin.x = 0.0;
                v71.origin.y = 0.0;
                v71.size.double width = v29;
                v71.size.double height = v28;
                CGContextFillRect(v43, v71);
              }
              objc_msgSend(v18, "drawInRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v29, v28);
              v38 = UIGraphicsGetImageFromCurrentImageContext();
              UIGraphicsEndImageContext();
              v44 = (void *)*MEMORY[0x263F28348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
              {
                log = v44;
                v69.double width = v24;
                v69.double height = v25;
                v50 = NSStringFromCGSize(v69);
                v70.double width = v29;
                v70.double height = v28;
                v45 = NSStringFromCGSize(v70);
                *(_DWORD *)buf = 136316418;
                v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
                __int16 v58 = 2112;
                id v59 = v50;
                __int16 v60 = 2112;
                id v61 = v45;
                __int16 v62 = 2112;
                id v63 = v19;
                __int16 v64 = 2112;
                *(void *)v65 = v6;
                *(_WORD *)&v65[8] = 1024;
                *(_DWORD *)&v65[10] = finished;
                _os_log_impl(&dword_2231EF000, log, OS_LOG_TYPE_DEFAULT, "%s Loaded %@ (resized to %@) image for %@ from %@ (BOOL finished = %d)", buf, 0x3Au);
              }
LABEL_43:
              self->_newDataAvailableToRender = 0;
              v46 = (void *)MEMORY[0x223CB13F0](self->_progressHandler);
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __59__SiriUIURLSessionImageDownload__updateImageFromURL_error___block_invoke;
              block[3] = &unk_26469F0A8;
              id v53 = v38;
              id v54 = v46;
              BOOL v55 = finished;
              id v47 = v38;
              id v48 = v46;
              dispatch_async(MEMORY[0x263EF83A0], block);
              self->_hasSentFinished = finished;

              goto LABEL_44;
            }
          }
          else
          {
            BOOL v27 = width != v22;
            if (height != v23) {
              BOOL v27 = 1;
            }
            if (v23 == 0.0) {
              BOOL v27 = 0;
            }
            if (v22 == 0.0) {
              BOOL v27 = 0;
            }
            if (!finished || v27)
            {
              double v28 = v23;
              double v29 = v22;
              if (v27)
              {
                double v30 = width / (v22 / v23);
                double v31 = height * (v22 / v25);
                if (v24 / v25 >= width / height) {
                  double v31 = width;
                }
                else {
                  double v30 = height;
                }
                double v28 = round(v14 * v30) / v14;
                double v29 = round(v14 * v31) / v14;
              }
              goto LABEL_39;
            }
          }
          id v18 = v18;
          v39 = (void *)*MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            v67.double width = v24;
            v67.double height = v25;
            v41 = NSStringFromCGSize(v67);
            *(_DWORD *)buf = 136316162;
            v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
            __int16 v58 = 2112;
            id v59 = v41;
            __int16 v60 = 2112;
            id v61 = v19;
            __int16 v62 = 2112;
            id v63 = v6;
            __int16 v64 = 1024;
            *(_DWORD *)v65 = 1;
            _os_log_impl(&dword_2231EF000, v40, OS_LOG_TYPE_DEFAULT, "%s Loaded %@ image for %@ from %@ (BOOL finished = %d)", buf, 0x30u);
          }
          v38 = v18;
          goto LABEL_43;
        }
LABEL_30:
        v32 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          v49 = v32;
          *(_DWORD *)buf = 136316418;
          v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
          __int16 v58 = 2114;
          id v59 = v19;
          __int16 v60 = 2114;
          id v61 = v6;
          __int16 v62 = 2114;
          id v63 = v7;
          __int16 v64 = 1026;
          *(_DWORD *)v65 = finished;
          *(_WORD *)&v65[4] = 2050;
          *(void *)&v65[6] = [(NSMutableData *)v11 length];
          _os_log_error_impl(&dword_2231EF000, v49, OS_LOG_TYPE_ERROR, "%s Could not load image for %{public}@ from %{public}@: %{public}@ (BOOL finished = %{public}d, got %{public}ld bytes)", buf, 0x3Au);
        }
        v33 = (void *)MEMORY[0x263EFF9A0];
        v34 = AFAnalyticsContextCreateWithError();
        v35 = [v33 dictionaryWithDictionary:v34];

        v36 = [v6 absoluteString];
        if (v36) {
          [v35 setObject:v36 forKeyedSubscript:@"URL"];
        }
        v37 = [MEMORY[0x263F283F8] sharedAnalytics];
        [v37 logEventWithType:1425 context:v35];

        id v18 = 0;
        v38 = 0;
        goto LABEL_43;
      }
    }
  }
LABEL_44:
}

uint64_t __59__SiriUIURLSessionImageDownload__updateImageFromURL_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)appendDownloadedData:(id)a3 fromURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke;
  block[3] = &unk_26469F0F8;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] appendData:*(void *)(a1 + 32)];
    *((unsigned char *)v3 + 64) = 1;
    if (!v3[7])
    {
      if (v3[9])
      {
        dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v3[6]);
        id v5 = v3[7];
        v3[7] = v4;

        if (v3[7])
        {
          objc_initWeak(&location, *(id *)(a1 + 40));
          dispatch_source_set_timer((dispatch_source_t)v3[7], 0, 0x1DCD6500uLL, 0x2FAF080uLL);
          id v6 = v3[7];
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke_2;
          handler[3] = &unk_26469F0D0;
          objc_copyWeak(&v9, &location);
          id v8 = *(id *)(a1 + 48);
          dispatch_source_set_event_handler(v6, handler);
          dispatch_resume((dispatch_object_t)v3[7]);

          objc_destroyWeak(&v9);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[64])
  {
    v3 = WeakRetained;
    [WeakRetained _updateImageFromURL:*(void *)(a1 + 32) error:0];
    WeakRetained = v3;
  }
}

- (void)finishedFromURL:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SiriUIURLSessionImageDownload_finishedFromURL_error___block_invoke;
  block[3] = &unk_26469F0F8;
  objc_copyWeak(&v14, &location);
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __55__SiriUIURLSessionImageDownload_finishedFromURL_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[88] = 1;
    id v6 = WeakRetained;
    [*(id *)(a1 + 32) _updateImageFromURL:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    v3 = v6;
    WeakRetained = (unsigned char *)*((void *)v6 + 7);
    if (WeakRetained)
    {
      dispatch_source_cancel((dispatch_source_t)WeakRetained);
      dispatch_source_t v4 = (void *)*((void *)v6 + 7);
      *((void *)v6 + 7) = 0;

      v3 = v6;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundFillColor, 0);
  objc_storeStrong((id *)&self->_renderTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_downloadedData, 0);
}

@end