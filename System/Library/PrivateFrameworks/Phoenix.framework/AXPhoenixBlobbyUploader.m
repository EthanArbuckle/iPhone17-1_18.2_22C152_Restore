@interface AXPhoenixBlobbyUploader
+ (id)_getStringforDate:(id)a3;
+ (id)sharedUploader;
- (AXPhoenixBlobbyUploader)init;
- (id)_dateStringForHeaderForDate:(id)a3;
- (id)_getAuthorizationForRequest:(id)a3 headers:(id)a4;
- (id)_hmacSHA1WithKey:(id)a3 forData:(id)a4;
- (id)_md5OfData:(id)a3;
- (id)_prefixFromPackageFilePath:(id)a3;
- (id)_urlRequestForFileAtPath:(id)a3 bucket:(id)a4 prefix:(id)a5 error:(id *)a6;
- (void)_completeUploadRequestWithData:(id)a3 urlResponse:(id)a4 error:(id)a5 forPackagePath:(id)a6 withCompletion:(id)a7;
- (void)_uploadPackage:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6;
- (void)_uploadPackagePath:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6;
- (void)uploadPackages:(id)a3 toBucket:(id)a4 withCompletion:(id)a5;
@end

@implementation AXPhoenixBlobbyUploader

- (id)_hmacSHA1WithKey:(id)a3 forData:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v12)
  {
    key = (void *)[location[0] bytes];
    uint64_t keyLength = [location[0] length];
    data = (void *)[v12 bytes];
    CCHmac(0, key, keyLength, data, [v12 length], macOut);
    id v10 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:macOut length:20];
    id v14 = v10;
    int v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v14 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  v4 = v14;
  return v4;
}

- (id)_getAuthorizationForRequest:(id)a3 headers:(id)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v26 = (id)[MEMORY[0x263EFF980] array];
  id v20 = (id)[location[0] HTTPMethod];
  objc_msgSend(v26, "addObject:");

  id v25 = (id)[v27 objectForKey:@"Content-MD5"];
  if (v25) {
    v18 = (__CFString *)v25;
  }
  else {
    v18 = &stru_26EA3C2C8;
  }
  [v26 addObject:v18];
  id v24 = (id)[v27 objectForKey:@"Content-Type"];
  if (v24) {
    v17 = (__CFString *)v24;
  }
  else {
    v17 = &stru_26EA3C2C8;
  }
  [v26 addObject:v17];
  id v23 = (id)[v27 objectForKey:@"Date"];
  if (v23) {
    uint64_t v16 = (__CFString *)v23;
  }
  else {
    uint64_t v16 = &stru_26EA3C2C8;
  }
  [v26 addObject:v16];
  id v5 = v26;
  id v7 = (id)[location[0] URL];
  id v6 = (id)[v7 path];
  objc_msgSend(v5, "addObject:");

  id v22 = (id)[v26 componentsJoinedByString:@"\n"];
  v8 = v29;
  id v11 = [(NSDictionary *)v29->_bucketInfo objectForKeyedSubscript:@"SecretKey"];
  id v10 = (id)[v11 dataUsingEncoding:4];
  id v9 = (id)[v22 dataUsingEncoding:134217984];
  id v21 = -[AXPhoenixBlobbyUploader _hmacSHA1WithKey:forData:](v8, "_hmacSHA1WithKey:forData:", v10);

  id v12 = NSString;
  id v14 = [(NSDictionary *)v29->_bucketInfo objectForKeyedSubscript:@"AccessIdentifier"];
  id v13 = (id)[v21 base64EncodedStringWithOptions:0];
  id v15 = (id)[v12 stringWithFormat:@"AWS %@:%@", v14, v13];

  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (id)_dateStringForHeaderForDate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    [v9 setDateFormat:@"EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss Z"];
    id v5 = v9;
    id v6 = (id)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
    objc_msgSend(v5, "setTimeZone:");

    id v7 = v9;
    id v8 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    objc_msgSend(v7, "setLocale:");

    id v12 = (id)[v9 stringFromDate:location[0]];
    int v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v12 = 0;
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v12;
  return v3;
}

- (id)_md5OfData:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  data = (void *)[location[0] bytes];
  CC_MD5(data, [location[0] length], md);
  id v5 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:16];
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)_getStringforDate:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  [v6 setDateFormat:@"yyyyMMdd"];
  id v5 = (id)[v6 stringFromDate:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_urlRequestForFileAtPath:(id)a3 bucket:(id)a4 prefix:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  id v44 = 0;
  objc_storeStrong(&v44, a5);
  v43 = (uint64_t *)a6;
  id v42 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:location[0] options:8 error:a6];
  if (*a6)
  {
    id v41 = (id)AXLogBackTap();
    os_log_type_t v40 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v51, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)location[0], *v43);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v41, v40, "[PHOENIX] %s Unable to memory map %@ %@", v51, 0x20u);
    }
    objc_storeStrong(&v41, 0);
    id v48 = 0;
    int v39 = 1;
  }
  else
  {
    id v38 = (id)[location[0] lastPathComponent];
    id v37 = (id)[NSString stringWithFormat:@"%@/%@/%@", v45, v44, v38];
    id v20 = NSURL;
    id v25 = (id)[NSString stringWithFormat:@"%@", v37];
    id v24 = (id)[MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    id v23 = (id)objc_msgSend(v25, "stringByAddingPercentEncodingWithAllowedCharacters:");
    v19 = NSURL;
    id v22 = [(NSDictionary *)v47->_bucketInfo objectForKeyedSubscript:@"Endpoint"];
    id v21 = (id)objc_msgSend(v19, "URLWithString:");
    id v36 = (id)objc_msgSend(v20, "URLWithString:relativeToURL:", v23);

    id v35 = (id)AXLogBackTap();
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v50, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)v36);
      _os_log_impl(&dword_2372C8000, (os_log_t)v35, v34, "[PHOENIX] %s Blobby upload URL: %@", v50, 0x16u);
    }
    objc_storeStrong(&v35, 0);
    id v6 = objc_alloc(MEMORY[0x263F089E0]);
    id v33 = (id)[v6 initWithURL:v36];
    [v33 setHTTPMethod:@"PUT"];
    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v32 setObject:@"application/octet-stream" forKeyedSubscript:@"Content-Type"];
    id v12 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v42, "length"));
    objc_msgSend(v32, "setObject:forKeyedSubscript:");

    id v14 = [(AXPhoenixBlobbyUploader *)v47 _md5OfData:v42];
    id v13 = (id)[v14 base64EncodedStringWithOptions:0];
    objc_msgSend(v32, "setObject:forKeyedSubscript:");

    id v15 = v47;
    id v17 = (id)[MEMORY[0x263EFF910] date];
    id v16 = -[AXPhoenixBlobbyUploader _dateStringForHeaderForDate:](v15, "_dateStringForHeaderForDate:");
    objc_msgSend(v32, "setObject:forKeyedSubscript:");

    [v32 setObject:@"100-continue" forKeyedSubscript:@"Expect"];
    id v18 = [(AXPhoenixBlobbyUploader *)v47 _getAuthorizationForRequest:v33 headers:v32];
    objc_msgSend(v32, "setObject:forKeyedSubscript:");

    [v33 setAllHTTPHeaderFields:v32];
    [v33 setCachePolicy:1];
    [v33 setHTTPShouldHandleCookies:0];
    [v33 setTimeoutInterval:(double)kRequestTimeout];
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = oslog;
      os_log_type_t v10 = v30;
      id v11 = (id)[v33 allHTTPHeaderFields];
      id v29 = v11;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v49, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)v29);
      _os_log_impl(&dword_2372C8000, v9, v10, "[PHOENIX] %s URL request: %@", v49, 0x16u);

      objc_storeStrong(&v29, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v48 = v33;
    int v39 = 1;
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  id v7 = v48;
  return v7;
}

- (void)_completeUploadRequestWithData:(id)a3 urlResponse:(id)a4 error:(id)a5 forPackagePath:(id)a6 withCompletion:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = 0;
  objc_storeStrong(&v26, a7);
  if (v28)
  {
    id v25 = (id)AXLogBackTap();
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v33, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v28);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v25, v24, "[PHOENIX] %s Upload task error: %@", v33, 0x16u);
    }
    objc_storeStrong(&v25, 0);
    (*((void (**)(id, void, id))v26 + 2))(v26, 0, v28);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v29;
      if ([v23 statusCode] == 200)
      {
        id v22 = (id)AXLogBackTap();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v10 = v22;
          os_log_type_t v11 = v21;
          id v12 = (id)[v27 lastPathComponent];
          id v20 = v12;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v20);
          _os_log_impl(&dword_2372C8000, v10, v11, "[PHOENIX] %s Upload successful for %@.", v32, 0x16u);

          objc_storeStrong(&v20, 0);
        }
        objc_storeStrong(&v22, 0);
        (*((void (**)(id, uint64_t, void))v26 + 2))(v26, 1, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = oslog;
          os_log_type_t v8 = v18;
          id v9 = (id)objc_msgSend(MEMORY[0x263F088A0], "localizedStringForStatusCode:", objc_msgSend(v23, "statusCode"));
          id v17 = v9;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v31, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v17);
          _os_log_impl(&dword_2372C8000, v7, v8, "[PHOENIX] %s Upload task response message: %@", v31, 0x16u);

          objc_storeStrong(&v17, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v23, 0);
    }
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_uploadPackage:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  id v33 = 0;
  objc_storeStrong(&v33, a6);
  id v32 = 0;
  id v30 = 0;
  id v15 = [(AXPhoenixBlobbyUploader *)v37 _urlRequestForFileAtPath:location[0] bucket:v35 prefix:v34 error:&v30];
  objc_storeStrong(&v32, v30);
  id v31 = v15;
  if (v32)
  {
    (*((void (**)(id, void, id))v33 + 2))(v33, 0, v32);
    int v29 = 1;
  }
  else
  {
    id v28 = (id)[NSURL fileURLWithPath:location[0]];
    session = v37->_session;
    id v9 = v31;
    id v10 = v28;
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = __71__AXPhoenixBlobbyUploader__uploadPackage_bucket_prefix_withCompletion___block_invoke;
    id v23 = &unk_264CCE188;
    os_log_type_t v24 = v37;
    id v25 = location[0];
    id v26 = v33;
    id v27 = [(NSURLSession *)session uploadTaskWithRequest:v9 fromFile:v10 completionHandler:&v19];
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v7 = type;
      id v8 = (id)[location[0] lastPathComponent];
      id v16 = v8;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackage:bucket:prefix:withCompletion:]", (uint64_t)v16);
      _os_log_impl(&dword_2372C8000, log, v7, "[PHOENIX] %s Uploading package: %@", v38, 0x16u);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(NSURLSessionUploadTask *)v27 resume];
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong(&v28, 0);
    int v29 = 0;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __71__AXPhoenixBlobbyUploader__uploadPackage_bucket_prefix_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [*(id *)(a1 + 32) _completeUploadRequestWithData:location[0] urlResponse:v8 error:v7 forPackagePath:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_uploadPackagePath:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  id v22 = (id)AXLogBackTap();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v28, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]", (uint64_t)location[0], (uint64_t)v25, (uint64_t)v24);
    _os_log_impl(&dword_2372C8000, (os_log_t)v22, v21, "[PHOENIX] %s Blobby uploader called with file:%@ bucket:%@ prefix:%@", v28, 0x2Au);
  }
  objc_storeStrong(&v22, 0);
  objc_initWeak(&v20, v27);
  queue = v27->_queue;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke;
  id v14 = &unk_264CCE1D8;
  objc_copyWeak(&v19, &v20);
  id v15 = location[0];
  id v16 = v25;
  id v17 = v24;
  id v18 = v23;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v20);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22[2] = (id)a1;
  v22[1] = (id)a1;
  v22[0] = objc_loadWeakRetained((id *)(a1 + 64));
  id location = (id)AXLogBackTap();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v24, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
    _os_log_impl(&dword_2372C8000, (os_log_t)location, v20, "[PHOENIX] %s Blobby uploader starting to upload %@ to %@/%@", v24, 0x2Au);
  }
  objc_storeStrong(&location, 0);
  dsema = *((void *)v22[0] + 2);
  dispatch_time_t v1 = dispatch_time(0, 1000000000 * kSemaphoreTimeoutInSeconds);
  dispatch_semaphore_wait(dsema, v1);
  id v19 = (id)AXLogBackTap();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v23, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(void *)(a1 + 32));
    _os_log_impl(&dword_2372C8000, (os_log_t)v19, v18, "[PHOENIX] %s Blobby uploader semaphore wait completed for %@", v23, 0x16u);
  }
  objc_storeStrong(&v19, 0);
  id v5 = v22[0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  int v11 = __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke_85;
  int v12 = &unk_264CCE1B0;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = v22[0];
  id v17 = *(id *)(a1 + 56);
  [v5 _uploadPackage:v2 bucket:v3 prefix:v4 withCompletion:&v8];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v22, 0);
}

void __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke_85(uint64_t a1, char a2, id obj)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v11 = a1;
  char v10 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  if (v10)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v14, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(void *)(a1 + 32));
      _os_log_impl(&dword_2372C8000, oslog[0], type, "[PHOENIX] %s Package %@ uploaded successfully", v14, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    os_log_t v6 = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v13, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(void *)(a1 + 32), (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, v6, v5, "[PHOENIX] %s Package upload %@ failed %@", v13, 0x20u);
    }
    objc_storeStrong((id *)&v6, 0);
  }
  os_log_t v4 = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
    _os_log_impl(&dword_2372C8000, v4, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Blobby uploader done uploading %@ to %@/%@", v12, 0x2Au);
  }
  objc_storeStrong((id *)&v4, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 16));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  objc_storeStrong(&location, 0);
}

- (id)_prefixFromPackageFilePath:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] lastPathComponent];
  id v5 = (id)[v6 componentsSeparatedByString:@"_"];
  id v4 = (id)[v5 lastObject];
  id v7 = (id)[v4 substringToIndex:10];

  objc_storeStrong(location, 0);
  return v7;
}

- (void)uploadPackages:(id)a3 toBucket:(id)a4 withCompletion:(id)a5
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  v17[0] = 0;
  v17[1] = v17;
  int v18 = 0x20000000;
  int v19 = 32;
  int v20 = 0;
  queue = v24->_queue;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke;
  int v12 = &unk_264CCE228;
  id v13 = location[0];
  id v14 = v24;
  id v15 = v22;
  v16[1] = v17;
  v16[0] = v21;
  dispatch_async(queue, &v8);
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(v17, 8);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v33 = a1;
  uint64_t v32 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
  if (v15)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v15;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(id *)(__b[1] + 8 * v11);
      if (v31)
      {
        id v27 = (id)[*(id *)(a1 + 40) _prefixFromPackageFilePath:v31];
        if ([v27 length])
        {
          id v4 = *(void **)(a1 + 40);
          id v1 = v31;
          uint64_t v2 = *(void *)(a1 + 48);
          id v3 = v27;
          uint64_t v16 = MEMORY[0x263EF8330];
          int v17 = -1073741824;
          int v18 = 0;
          int v19 = __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke_91;
          int v20 = &unk_264CCE200;
          id v21 = v31;
          id v22 = *(id *)(a1 + 32);
          v23[1] = *(id *)(a1 + 64);
          v23[0] = *(id *)(a1 + 56);
          [v4 _uploadPackagePath:v1 bucket:v2 prefix:v3 withCompletion:&v16];
          objc_storeStrong(v23, 0);
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v21, 0);
          int v24 = 0;
        }
        else
        {
          os_log_t v26 = (os_log_t)(id)AXLogBackTap();
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v5 = v26;
            os_log_type_t v6 = v25;
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v34, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)v31);
            _os_log_impl(&dword_2372C8000, v5, v6, "[PHOENIX] %s Skipping upload of invalid prefix for %@", v34, 0x16u);
          }
          objc_storeStrong((id *)&v26, 0);
          int v24 = 3;
        }
        objc_storeStrong(&v27, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          log = oslog;
          os_log_type_t v8 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v35, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)v31);
          _os_log_impl(&dword_2372C8000, log, v8, "[PHOENIX] %s Skipping upload of invalid package file path for %@", v35, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }
}

void __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke_91(uint64_t a1, char a2, id obj)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  if (!location && (v16 & 1) != 0)
  {
    id v12 = (id)AXLogBackTap();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v12, v11, "[PHOENIX] %s Upload successful.", v19, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    +[AXPhoenixDataCollectionUtils deleteItem:*(void *)(a1 + 32)];
    id v4 = +[AXPhoenixDataCollectionManager sharedInstance];
    -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v4, "updateUploadStatus:error:", [*(id *)(a1 + 40) count], 0);
  }
  else
  {
    v14[0] = (id)AXLogBackTap();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)location);
      _os_log_impl(&dword_2372C8000, (os_log_t)v14[0], v13, "[PHOENIX] %s Upload task error: %@", v20, 0x16u);
    }
    objc_storeStrong(v14, 0);
    if ([location code] == -1009)
    {
      os_log_type_t v8 = +[AXPhoenixDataCollectionManager sharedInstance];
      [(AXPhoenixDataCollectionManager *)v8 updateUploadStatus:-1 error:@"Device offline"];
    }
    else if ([location code] == -1003)
    {
      id v7 = +[AXPhoenixDataCollectionManager sharedInstance];
      [(AXPhoenixDataCollectionManager *)v7 updateUploadStatus:-1 error:@"Unable to reach server."];
    }
    else
    {
      os_log_type_t v6 = +[AXPhoenixDataCollectionManager sharedInstance];
      id v5 = (id)[location localizedDescription];
      -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v6, "updateUploadStatus:error:", -1);
    }
  }
  uint64_t v3 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v3 == [*(id *)(a1 + 40) count] && *(void *)(a1 + 48))
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v18, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s %d packages attempted to upload.", v18, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (AXPhoenixBlobbyUploader)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v15 = a2;
  id v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)AXPhoenixBlobbyUploader;
  id v16 = [(AXPhoenixBlobbyUploader *)&v14 init];
  objc_storeStrong(&v16, v16);
  if (v16)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.accessibility.phoenix.blobbyUploader", 0);
    uint64_t v3 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v2;

    dispatch_semaphore_t v4 = dispatch_semaphore_create(kMaxConcurrentUploads);
    id v5 = (void *)*((void *)v16 + 2);
    *((void *)v16 + 2) = v4;

    id v13 = (id)[MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v13 setWaitsForConnectivity:1];
    [v13 setAllowsCellularAccess:1];
    [v13 setNetworkServiceType:6];
    [v13 setTimeoutIntervalForRequest:(double)kResponseTimeout];
    id v6 = (id)[MEMORY[0x263F08BF8] sessionWithConfiguration:v13];
    id v7 = (void *)*((void *)v16 + 3);
    *((void *)v16 + 3) = v6;

    uint64_t v8 = [objc_alloc(NSDictionary) initWithContentsOfFile:@"/AppleInternal/Library/Accessibility/BucketInfo.plist"];
    uint64_t v9 = (void *)*((void *)v16 + 4);
    *((void *)v16 + 4) = v8;

    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[AXPhoenixBlobbyUploader init]", *((void *)v16 + 4));
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Loaded bucket info %@", v17, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong(&v13, 0);
  }
  os_log_type_t v11 = (AXPhoenixBlobbyUploader *)v16;
  objc_storeStrong(&v16, 0);
  return v11;
}

+ (id)sharedUploader
{
  id v5 = (dispatch_once_t *)&sharedUploader_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  dispatch_queue_t v2 = (void *)sharedUploader_blobbyUploader;
  return v2;
}

void __41__AXPhoenixBlobbyUploader_sharedUploader__block_invoke()
{
  v0 = objc_alloc_init(AXPhoenixBlobbyUploader);
  id v1 = (void *)sharedUploader_blobbyUploader;
  sharedUploader_blobbyUploader = (uint64_t)v0;
}

- (void).cxx_destruct
{
}

@end