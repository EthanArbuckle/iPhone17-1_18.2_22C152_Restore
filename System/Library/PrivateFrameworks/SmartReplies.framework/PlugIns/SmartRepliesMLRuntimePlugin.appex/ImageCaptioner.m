@interface ImageCaptioner
+ (id)_memeStringForTag:(id)a3;
+ (id)_metricsClientIdentifier;
- (BOOL)imageContainsPotentiallyUnsafeContent:(CGImage *)a3;
- (CVNLPCaptionHandler)_createCaptionHandlerIfNeeded;
- (ImageCaptioner)init;
- (id)CVNLPCaptionForImage:(CGImage *)a3 modelURL:(id)a4 minimumConfidenceForCVNLPCaption:(double)a5;
- (id)_foodRecognitionRequest;
- (id)_newJunkRequest;
- (id)_newMemeRequest;
- (id)_newSceneNetV5Request;
- (id)topMemeCaptionForImage:(CGImage *)a3;
@end

@implementation ImageCaptioner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsLogger, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

- (id)_newJunkRequest
{
  id v2 = objc_alloc_init((Class)VNClassifyJunkImageRequest);
  uint64_t v8 = 0;
  unsigned int v3 = [v2 setRevision:3737841669 error:&v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Failed";
    if (v3) {
      CFStringRef v4 = @"Succeeded";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ to set revision for meme identification", buf, 0xCu);
  }
  if (v3) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_newMemeRequest
{
  id v2 = objc_alloc_init((Class)VNClassifyMemeImageRequest);
  uint64_t v8 = 0;
  unsigned int v3 = [v2 setRevision:3 error:&v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Failed";
    if (v3) {
      CFStringRef v4 = @"Succeeded";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ to set revision for meme identification", buf, 0xCu);
  }
  if (v3) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_foodRecognitionRequest
{
  id v2 = objc_alloc_init((Class)VNRecognizeFoodAndDrinkRequest);
  uint64_t v8 = 0;
  unsigned int v3 = [v2 setRevision:3737841664 error:&v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Failed";
    if (v3) {
      CFStringRef v4 = @"Succeeded";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ to set revision for food recognition", buf, 0xCu);
  }
  if (v3) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_newSceneNetV5Request
{
  id v2 = objc_alloc_init((Class)VNClassifyImageRequest);
  uint64_t v8 = 0;
  unsigned int v3 = [v2 setRevision:2 error:&v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Failed";
    if (v3) {
      CFStringRef v4 = @"Succeeded";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ to set revision for image tagging", buf, 0xCu);
  }
  if (v3) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (CVNLPCaptionHandler)_createCaptionHandlerIfNeeded
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Creating a captioner handler, if necessary", buf, 2u);
  }
  captionHandlerRef = self->_captionHandlerRef;
  if (!captionHandlerRef)
  {
    if (self->_modelURL)
    {
      id v4 = objc_alloc_init((Class)NSMutableDictionary);
      [v4 setObject:CVNLPCaptionModelTransformer forKeyedSubscript:CVNLPCaptionModelType];
      [v4 setObject:self->_modelURL forKeyedSubscript:CVNLPCaptionModelPath];
      [v4 setObject:&off_100014F80 forKeyedSubscript:CVNLPBeamSearchSize];
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:CVNLPCaptionEnableGenderedCaptions];
      v5 = (CVNLPCaptionHandler *)CVNLPCaptionHandlerCreate();
      self->_captionHandlerRef = v5;
      captionHandlerRef = v5;
    }
    else
    {
      return 0;
    }
  }
  return captionHandlerRef;
}

- (id)CVNLPCaptionForImage:(CGImage *)a3 modelURL:(id)a4 minimumConfidenceForCVNLPCaption:(double)a5
{
  id v8 = a4;
  objc_storeStrong((id *)&self->_modelURL, a4);
  captionHandlerRef = self->_captionHandlerRef;
  if (!captionHandlerRef)
  {
    captionHandlerRef = [(ImageCaptioner *)self _createCaptionHandlerIfNeeded];
    self->_captionHandlerRef = captionHandlerRef;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to compute caption for an image", buf, 2u);
    captionHandlerRef = self->_captionHandlerRef;
  }
  if (captionHandlerRef)
  {
    CFStringRef v10 = (void *)CVNLPCaptionCopyForImage();
    v11 = v10;
    v15 = [v10 objectForKeyedSubscript:@"CVNLPCaptions"];
    v16 = [v15 firstObject];
    v17 = [v16 objectForKeyedSubscript:@"CVNLPGeneratedCaption"];

    v18 = [v15 firstObject];
    v19 = [v18 objectForKeyedSubscript:@"CVNLPGeneratedCaptionScore"];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found a caption for the image via CVNLP with confidence: %@", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v17;
      __int16 v28 = 2112;
      double v29 = *(double *)&v19;
      __int16 v30 = 2048;
      double v31 = a5;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "--- “%@”, confidence: %@, threshold: %f", buf, 0x20u);
    }
    [v19 doubleValue];
    if (v20 >= a5)
    {
      metricsLogger = self->_metricsLogger;
      v24 = [(id)objc_opt_class() _metricsClientIdentifier];
      [v19 floatValue];
      -[MetricsLogger recordImageCaptioningResultWithClientIdentifier:success:failureType:confidence:](metricsLogger, "recordImageCaptioningResultWithClientIdentifier:success:failureType:confidence:", v24, 1, 0);

      id v14 = v17;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v19;
        __int16 v28 = 2048;
        double v29 = a5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Image caption not returned since confidence %@ < threshold %f", buf, 0x16u);
      }
      v21 = self->_metricsLogger;
      v22 = [(id)objc_opt_class() _metricsClientIdentifier];
      [v19 floatValue];
      -[MetricsLogger recordImageCaptioningResultWithClientIdentifier:success:failureType:confidence:](v21, "recordImageCaptioningResultWithClientIdentifier:success:failureType:confidence:", v22, 0, 4);

      id v14 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not create a caption handler. There might not be an available asset. Bailing from captioning.", buf, 2u);
    }
    v12 = self->_metricsLogger;
    v13 = [(id)objc_opt_class() _metricsClientIdentifier];
    [(MetricsLogger *)v12 recordImageCaptioningResultWithClientIdentifier:v13 success:0 failureType:1 confidence:0.0];

    id v14 = 0;
  }

  return v14;
}

- (BOOL)imageContainsPotentiallyUnsafeContent:(CGImage *)a3
{
  uint64_t v96 = SCMLUseAnyAvailableDevice;
  v97 = &off_100014F68;
  v5 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
  id v6 = [objc_alloc((Class)SCMLHandler) initWithOptions:v5 error:0];
  id v86 = 0;
  id v7 = [v6 classifyImage:a3 error:&v86];
  double v8 = COERCE_DOUBLE(v86);
  if (v8 != 0.0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    double v89 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error calling into SCML: %@", buf, 0xCu);
  }
  if (v7 == (id)1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "This image is sensitive per SCML. Don't caption this image.", buf, 2u);
    }
    metricsLogger = self->_metricsLogger;
    CFStringRef v10 = [(id)objc_opt_class() _metricsClientIdentifier];
    [(MetricsLogger *)metricsLogger recordImageCaptioningResultWithClientIdentifier:v10 success:0 failureType:3 confidence:0.0];
    BOOL v11 = 1;
  }
  else
  {
    double v74 = v8;
    id v69 = v6;
    v70 = v5;
    id v12 = objc_alloc_init((Class)VN6Mb1ME89lyW3HpahkEygIG);
    [v12 setRevision:2];
    id v13 = objc_alloc_init((Class)VNVYvzEtX1JlUdu8xx5qhDI);
    v68 = self;
    id v14 = [(ImageCaptioner *)self _newJunkRequest];
    id v15 = [objc_alloc((Class)VNImageRequestHandler) initWithCGImage:a3 orientation:1 options:&__NSDictionary0__struct];
    v95[0] = v12;
    v95[1] = v13;
    v75 = v14;
    v95[2] = v14;
    v16 = +[NSArray arrayWithObjects:v95 count:3];
    v71 = v15;
    [v15 performRequests:v16 error:0];

    v17 = +[NSMutableArray array];
    id v73 = v12;
    v18 = [v12 results];
    [v17 addObjectsFromArray:v18];

    v72 = v13;
    v19 = [v13 results];
    [v17 addObjectsFromArray:v19];

    v93[0] = VN3FNQUJVIs2puI1uPc9mxh7;
    LODWORD(v20) = 1018444120;
    id obja = +[NSNumber numberWithFloat:v20];
    v94[0] = obja;
    v93[1] = VNSY8t4EoTztuqIL02g8uVA0;
    LODWORD(v21) = 1036831949;
    v22 = +[NSNumber numberWithFloat:v21];
    v94[1] = v22;
    v93[2] = VN4QuphG8kE4qDaDycivBkX5;
    LODWORD(v23) = 1035489772;
    v24 = +[NSNumber numberWithFloat:v23];
    v94[2] = v24;
    v93[3] = VN7gQUejje8mmnE9GSTsVBVV;
    LODWORD(v25) = 1032805417;
    v26 = +[NSNumber numberWithFloat:v25];
    v94[3] = v26;
    v93[4] = VNa9xpOJNvRoaW9plFGZ9Eo0;
    LODWORD(v27) = 1034147594;
    __int16 v28 = +[NSNumber numberWithFloat:v27];
    v94[4] = v28;
    v93[5] = VN2vIWnsZbk4Su55oeWfKDq1;
    LODWORD(v29) = 1034147594;
    __int16 v30 = +[NSNumber numberWithFloat:v29];
    v94[5] = v30;
    v93[6] = VNmNJnu0xlW8CZXt6hJ7Rpb0;
    LODWORD(v31) = 1041865114;
    v32 = +[NSNumber numberWithFloat:v31];
    v94[6] = v32;
    v93[7] = VN35FOB1QhtSfYGRIJvTgtTq;
    LODWORD(v33) = 1041865114;
    v34 = +[NSNumber numberWithFloat:v33];
    v94[7] = v34;
    v93[8] = VN81aedeb999c79d74e79af7f1c922cf97;
    LODWORD(v35) = 1032805417;
    v36 = +[NSNumber numberWithFloat:v35];
    v94[8] = v36;
    v37 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:9];

    v38 = [v37 allKeys];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v39 = v17;
    id v40 = [v39 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v83;
      while (2)
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v83 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v45 = [v44 identifier];
          [v44 confidence];
          float v47 = v46;
          v48 = [v37 objectForKeyedSubscript:v45];
          [v48 floatValue];
          float v50 = v49;

          if ([v38 containsObject:v45]) {
            BOOL v51 = v47 <= v50;
          }
          else {
            BOOL v51 = 1;
          }
          if (!v51)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              double v89 = v47;
              __int16 v90 = 2048;
              double v91 = v50;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "This image looks unsafe with confidence %f/%f. Don't caption this image.", buf, 0x16u);
            }
            v60 = v68->_metricsLogger;
            v61 = [(id)objc_opt_class() _metricsClientIdentifier];
            [(MetricsLogger *)v60 recordImageCaptioningResultWithClientIdentifier:v61 success:0 failureType:3 confidence:0.0];
            id obj = v39;
LABEL_42:
            id v6 = v69;
            v5 = v70;

            BOOL v11 = 1;
            goto LABEL_43;
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v82 objects:v92 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = [v75 results];
    id v52 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v79;
      while (2)
      {
        for (j = 0; j != v53; j = (char *)j + 1)
        {
          if (*(void *)v79 != v54) {
            objc_enumerationMutation(obj);
          }
          v56 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
          v45 = [v56 identifier];
          [v56 confidence];
          float v58 = v57;
          if ([&off_100014FC0 containsObject:v45] && v58 > 0.2)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              double v89 = v58;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "This image looks to be of low quality (confidence: %f). Don't caption this image.", buf, 0xCu);
            }
            v62 = v68->_metricsLogger;
            v61 = [(id)objc_opt_class() _metricsClientIdentifier];
            v63 = v62;
            v64 = v61;
            uint64_t v65 = 5;
            goto LABEL_41;
          }
          if ([&off_100014FD8 containsObject:v45] && v58 > 0.15)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The junk filter has determined that this image might be sensitive. Don't caption this image.", buf, 2u);
            }
            v66 = v68->_metricsLogger;
            v61 = [(id)objc_opt_class() _metricsClientIdentifier];
            v63 = v66;
            v64 = v61;
            uint64_t v65 = 3;
LABEL_41:
            [(MetricsLogger *)v63 recordImageCaptioningResultWithClientIdentifier:v64 success:0 failureType:v65 confidence:0.0];
            goto LABEL_42;
          }
        }
        id v53 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
        if (v53) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
    id v6 = v69;
    v5 = v70;
LABEL_43:

    CFStringRef v10 = v73;
    double v8 = v74;
  }

  return v11;
}

- (id)topMemeCaptionForImage:(CGImage *)a3
{
  id v5 = [(ImageCaptioner *)self _newMemeRequest];
  v37 = self;
  id v6 = [(ImageCaptioner *)self _newJunkRequest];
  id v7 = [objc_alloc((Class)VNImageRequestHandler) initWithCGImage:a3 orientation:1 options:&__NSDictionary0__struct];
  v58[0] = v5;
  v58[1] = v6;
  double v8 = +[NSArray arrayWithObjects:v58 count:2];
  id v39 = v7;
  [v7 performRequests:v8 error:0];

  id v38 = v5;
  v9 = [v5 results];
  id v40 = v6;
  id v41 = [v6 results];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v15 = [v14 identifier];
        if (v15)
        {
          v16 = (void *)v15;
          [v14 confidence];
          float v18 = v17;
          v56[0] = @"document_receipt";
          v56[1] = @"document_boarding_pass";
          v56[2] = @"document_office_badge";
          v56[3] = @"document_passport";
          v56[4] = @"document_driving_license";
          v56[5] = @"curation_meme";
          v19 = +[NSArray arrayWithObjects:v56 count:6];
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Observed a meme tag: %@", buf, 0xCu);
          }
          if (v18 > 0.99 && ([v19 containsObject:v16] & 1) != 0)
          {
            double v29 = [(id)objc_opt_class() _memeStringForTag:v16];
            metricsLogger = v37->_metricsLogger;
            double v31 = [(id)objc_opt_class() _metricsClientIdentifier];
            *(float *)&double v32 = v18;
            [(MetricsLogger *)metricsLogger recordImageCaptioningResultWithClientIdentifier:v31 success:1 failureType:0 confidence:v32];

            id v20 = obj;
            v24 = v5;
LABEL_28:

            goto LABEL_29;
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = v41;
  id v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    v24 = v38;
    while (2)
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        v16 = [v26 identifier];
        [v26 confidence];
        float v28 = v27;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v52 = v16;
          __int16 v53 = 2048;
          double v54 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Observed a junk model tag: %@ with confidence: %f", buf, 0x16u);
        }
        if ([v16 isEqualToString:@"screenshot"] && v28 > 0.95)
        {
          double v33 = v37->_metricsLogger;
          v34 = [(id)objc_opt_class() _metricsClientIdentifier];
          *(float *)&double v35 = v28;
          [(MetricsLogger *)v33 recordImageCaptioningResultWithClientIdentifier:v34 success:1 failureType:0 confidence:v35];

          v19 = +[NSBundle mainBundle];
          double v29 = [v19 localizedStringForKey:@"SCREENSHOT" value:&stru_100014CD0 table:0];
          goto LABEL_28;
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    double v29 = 0;
  }
  else
  {
    double v29 = 0;
    v24 = v5;
  }
LABEL_29:

  return v29;
}

- (ImageCaptioner)init
{
  v7.receiver = self;
  v7.super_class = (Class)ImageCaptioner;
  id v2 = [(ImageCaptioner *)&v7 init];
  if (v2)
  {
    unsigned int v3 = objc_alloc_init(MetricsLogger);
    metricsLogger = v2->_metricsLogger;
    v2->_metricsLogger = v3;

    id v5 = v2;
  }

  return v2;
}

+ (id)_memeStringForTag:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  if ([v3 isEqualToString:@"document_receipt"])
  {
    CFStringRef v5 = @"RECEIPT";
LABEL_13:
    id v6 = [v4 localizedStringForKey:v5 value:&stru_100014CD0 table:0];
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"document_boarding_pass"])
  {
    CFStringRef v5 = @"BOARDING_PASS";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"document_office_badge"])
  {
    CFStringRef v5 = @"OFFICE_BADGE";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"document_passport"])
  {
    CFStringRef v5 = @"PASSPORT";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"document_driving_license"])
  {
    CFStringRef v5 = @"DRIVERS_LICENSE";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"curation_meme"])
  {
    CFStringRef v5 = @"MEME";
    goto LABEL_13;
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

+ (id)_metricsClientIdentifier
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

@end