@interface lite_printer_t
+ (id)existingPrinterWithEndpoint:(id)a3;
+ (id)gatherLogInfo;
+ (void)_startPrinterResolution:(id)a3 session:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)realizePrinterWithResolvedEndpoint:(id)a3 session:(id)a4 completionHandler:(id)a5;
+ (void)withLitePrinterForSessionEndpoint:(id)a3 completionHandler:(id)a4;
- (BOOL)pin_required;
- (NSArray)attrs_media_source_supported;
- (NSArray)printerStateReasons;
- (NSDictionary)dids;
- (NSSet)attrs_document_format_supported;
- (NSSet)attrs_printer_native_formats;
- (NSSet)jpegFeatures;
- (NSSet)mandatoryJobAttributes;
- (NSString)deviceID;
- (NSString)displayName;
- (NSString)driverformat;
- (NSString)location;
- (NSString)printerStateMessage;
- (NSURL)device_uri;
- (NSURL)quotaManagementURL;
- (NSURLCredential)defaultCredentialForPrinter;
- (PKPrinterBonjourEndpoint)bonjourName;
- (PKPrinterBrowseInfo)browseInfo;
- (PKPrinterDescription)printerDescription;
- (id)description;
- (id)logInfo;
- (id)makeAndModel;
- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3 session:(id)a4;
- (id)txtRecord;
- (int)documentPasswordSupported;
- (int)max_jpeg;
- (int)max_jpeg_x;
- (int)max_jpeg_y;
- (int)max_pdf;
- (int)preferred_landscape;
- (int)print_scaling_supported;
- (int64_t)_checkAccessWithSession:(id)a3;
- (int64_t)busy;
- (int64_t)reasons_changed;
- (lite_job_t)currentJob;
- (lite_printer_t)initWithBrowseInfo:(id)a3 description:(id)a4;
- (printer_type_from_cups_t)printer_type_from_cups;
- (unsigned)reasons;
- (void)_logInitialization;
- (void)_updateDescPrinterDescription:(id)a3;
- (void)checkAccessWithSession:(id)a3 completionHandler:(id)a4;
- (void)clearCredential;
- (void)forceRefreshCurrentDescriptionForSession:(id)a3 completionHandler:(id)a4;
- (void)identifyPrinterWithSession:(id)a3 message:(id)a4 actions:(id)a5;
- (void)refreshCurrentDescriptionForSession:(id)a3 completionHandler:(id)a4;
- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 session:(id)a4 completionHandler:(id)a5;
- (void)setBusy:(int64_t)a3;
- (void)setCurrentJob:(id)a3;
- (void)setDefaultCredentialForPrinter:(id)a3;
- (void)setReasonsBits:(unsigned int)a3;
- (void)updatePrinterState:(id)a3 message:(id)a4;
@end

@implementation lite_printer_t

- (lite_printer_t)initWithBrowseInfo:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)lite_printer_t;
  v9 = [(lite_printer_t *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_browseInfo, a3);
    objc_storeStrong((id *)&v10->_printerDescription, a4);
    uint64_t v11 = +[NSDate date];
    printerDescriptionTime = v10->_printerDescriptionTime;
    v10->_printerDescriptionTime = (NSDate *)v11;

    uint64_t v13 = objc_opt_new();
    printerOperationQueue = v10->_printerOperationQueue;
    v10->_printerOperationQueue = (NSOperationQueue *)v13;

    if (qword_1000C8AB8 != -1) {
      dispatch_once(&qword_1000C8AB8, &stru_100095A60);
    }
    [(NSOperationQueue *)v10->_printerOperationQueue setUnderlyingQueue:qword_1000C8AB0];
    [(NSOperationQueue *)v10->_printerOperationQueue setMaxConcurrentOperationCount:4];
    [(lite_printer_t *)v10 _logInitialization];
  }

  return v10;
}

- (void)setReasonsBits:(unsigned int)a3
{
  if (self->_reasons != a3)
  {
    self->_reasons = a3;
    self->_reasons_changed = time(0);
  }
}

- (void)updatePrinterState:(id)a3 message:(id)a4
{
  v6 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_printerStateMessage, a4);
  id v8 = a4;
  printerStateReasons = self->_printerStateReasons;
  self->_printerStateReasons = v6;
}

- (void)_logInitialization
{
  v3 = [(PKPrinterBrowseInfo *)self->_browseInfo txtRecord];
  if (v3)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100011290;
    v16[3] = &unk_100095710;
    v4 = (id)objc_opt_new();
    v17 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v16];
    v5 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(lite_printer_t *)self displayName];
      id v7 = [v6 UTF8String];
      id v8 = [v4 componentsJoinedByString:@","];
      *(_DWORD *)buf = 134218498;
      v19 = self;
      __int16 v20 = 2082;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Printer<%p> %{public}s] init from txt {%@}", buf, 0x20u);
    }
  }
  else if (self->_printerDescription)
  {
    v4 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(lite_printer_t *)self displayName];
      id v10 = [v9 UTF8String];
      uint64_t v11 = [(PKPrinterDescription *)self->_printerDescription deviceID];
      *(_DWORD *)buf = 134218498;
      v19 = self;
      __int16 v20 = 2082;
      id v21 = v10;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Printer<%p> %{public}s] init from desc device id {%@}", buf, 0x20u);
    }
  }
  else
  {
    v4 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(lite_printer_t *)self displayName];
      id v13 = [v12 UTF8String];
      browseInfo = self->_browseInfo;
      printerDescription = self->_printerDescription;
      *(_DWORD *)buf = 134218754;
      v19 = self;
      __int16 v20 = 2082;
      id v21 = v13;
      __int16 v22 = 2112;
      v23 = browseInfo;
      __int16 v24 = 2112;
      v25 = printerDescription;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Printer<%p> %{public}s] init from info {%@} desc {%@}", buf, 0x2Au);
    }
  }
}

+ (id)gatherLogInfo
{
  liteLockPrinters();
  v2 = objc_opt_new();
  v3 = (void *)qword_1000C8A90;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011458;
  v6[3] = &unk_100095738;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  pthread_mutex_unlock(&stru_1000C5A60);

  return v4;
}

- (id)logInfo
{
  CFStringRef v5 = @"desc";
  v2 = [(lite_printer_t *)self description];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (id)description
{
  v3 = [(lite_printer_t *)self currentJob];
  if (v3)
  {
    id v4 = [(lite_printer_t *)self currentJob];
    CFStringRef v5 = [v4 description];
  }
  else
  {
    CFStringRef v5 = @"idle";
  }

  v10.receiver = self;
  v10.super_class = (Class)lite_printer_t;
  id v6 = [(lite_printer_t *)&v10 description];
  id v7 = [(lite_printer_t *)self displayName];
  id v8 = +[NSString stringWithFormat:@"%@ { '%@', %@ }", v6, v7, v5];

  return v8;
}

- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 session:(id)a4 completionHandler:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  int v9 = objc_msgSend(a3->var1, "op_or_status");
  objc_super v10 = 0;
  if (v9 > 78)
  {
    if (v9 == 79 || v9 == 16386) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v9 != 11 && v9 != 60)
  {
LABEL_9:
    objc_super v10 = [(lite_printer_t *)self displayName];
  }
LABEL_10:
  id v12 = [device_http_t alloc];
  id v13 = [(lite_printer_t *)self device_uri];
  v14 = [v17 ippURL:v13];
  v15 = [(device_http_t *)v12 initWithSessionURL:v14 displayNameForCertTrust:v10];

  objc_super v16 = [(lite_printer_t *)self bonjourName];
  sub_100011840(v16, v15);

  [(device_http_t *)v15 sendSingleIPPRequest:a3 completionHandler:v8];
}

- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3 session:(id)a4
{
  id v6 = a4;
  int v7 = objc_msgSend(a3->var1, "op_or_status");
  id v8 = 0;
  if (v7 > 78)
  {
    if (v7 == 79 || v7 == 16386) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v7 != 11 && v7 != 60)
  {
LABEL_9:
    id v8 = [(lite_printer_t *)self displayName];
  }
LABEL_10:
  objc_super v10 = [device_http_t alloc];
  uint64_t v11 = [(lite_printer_t *)self device_uri];
  id v12 = [v6 ippURL:v11];
  id v13 = [(device_http_t *)v10 initWithSessionURL:v12 displayNameForCertTrust:v8];

  v14 = [(lite_printer_t *)self bonjourName];
  sub_100011840(v14, v13);

  v15 = [(device_http_t *)v13 sendSingleIPPRequest:a3];

  return v15;
}

- (void)clearCredential
{
  defaultCredentialForPrinter = self->_defaultCredentialForPrinter;
  self->_defaultCredentialForPrinter = 0;
}

+ (id)existingPrinterWithEndpoint:(id)a3
{
  id v3 = a3;
  liteLockPrinters();
  id v4 = [(id)qword_1000C8A90 objectForKeyedSubscript:v3];
  pthread_mutex_unlock(&stru_1000C5A60);

  return v4;
}

+ (void)realizePrinterWithResolvedEndpoint:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (qword_1000C8A98 != -1) {
    dispatch_once(&qword_1000C8A98, &stru_100095758);
  }
  objc_super v10 = qword_1000C8AA0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CD0;
  block[3] = &unk_1000957F8;
  id v16 = v8;
  id v17 = v9;
  id v15 = v7;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  dispatch_async(v10, block);
}

+ (void)_startPrinterResolution:(id)a3 session:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 resolvedURL];
  v14 = [v10 ippURL:v13];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100012334;
  v20[3] = &unk_1000958E8;
  id v15 = v9;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v10;
  id v23 = v18;
  id v24 = v14;
  id v19 = v14;
  +[device_http_t deviceHTTPForSessionURL:v19 completionHandler:v20];
}

+ (void)withLitePrinterForSessionEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endpoint];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013050;
  v11[3] = &unk_100095910;
  id v9 = v7;
  id v13 = v9;
  id v14 = a1;
  id v10 = v6;
  id v12 = v10;
  [v8 resolveWithinPrinterToolWithTimeout:v11 completionHandler:30.0];
}

- (NSURL)device_uri
{
  return (NSURL *)[(PKPrinterBrowseInfo *)self->_browseInfo printerURL];
}

- (NSString)displayName
{
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  id v3 = [v2 displayNameForPrintKitUI];

  return (NSString *)v3;
}

- (id)txtRecord
{
  return [(PKPrinterBrowseInfo *)self->_browseInfo txtRecord];
}

- (PKPrinterBonjourEndpoint)bonjourName
{
  return (PKPrinterBonjourEndpoint *)[(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
}

- (NSString)location
{
  return (NSString *)[(PKPrinterBrowseInfo *)self->_browseInfo location];
}

- (id)makeAndModel
{
  return [(PKPrinterBrowseInfo *)self->_browseInfo makeAndModel];
}

- (BOOL)pin_required
{
  return [(PKPrinterDescription *)self->_printerDescription pin_required];
}

- (NSSet)jpegFeatures
{
  return (NSSet *)[(PKPrinterDescription *)self->_printerDescription jpegFeatures];
}

- (NSSet)attrs_document_format_supported
{
  return (NSSet *)[(PKPrinterDescription *)self->_printerDescription attrs_document_format_supported];
}

- (NSSet)attrs_printer_native_formats
{
  return (NSSet *)[(PKPrinterDescription *)self->_printerDescription attrs_printer_native_formats];
}

- (NSArray)attrs_media_source_supported
{
  return (NSArray *)[(PKPrinterDescription *)self->_printerDescription attrs_media_source_supported];
}

- (int)max_pdf
{
  return [(PKPrinterDescription *)self->_printerDescription max_pdf];
}

- (int)max_jpeg
{
  return [(PKPrinterDescription *)self->_printerDescription max_jpeg];
}

- (int)max_jpeg_x
{
  return [(PKPrinterDescription *)self->_printerDescription max_jpeg_x];
}

- (int)max_jpeg_y
{
  return [(PKPrinterDescription *)self->_printerDescription max_jpeg_y];
}

- (int)preferred_landscape
{
  return [(PKPrinterDescription *)self->_printerDescription preferred_landscape];
}

- (int)print_scaling_supported
{
  return [(PKPrinterDescription *)self->_printerDescription print_scaling_supported];
}

- (NSString)driverformat
{
  return (NSString *)[(PKPrinterDescription *)self->_printerDescription driverformat];
}

- (NSDictionary)dids
{
  return (NSDictionary *)[(PKPrinterDescription *)self->_printerDescription dids];
}

- (NSString)deviceID
{
  return (NSString *)[(PKPrinterDescription *)self->_printerDescription deviceID];
}

- (NSSet)mandatoryJobAttributes
{
  return (NSSet *)[(PKPrinterDescription *)self->_printerDescription mandatoryJobAttributes];
}

- (NSURL)quotaManagementURL
{
  return (NSURL *)[(PKPrinterDescription *)self->_printerDescription quotaManagementURL];
}

- (int)documentPasswordSupported
{
  return [(PKPrinterDescription *)self->_printerDescription documentPasswordSupported];
}

- (printer_type_from_cups_t)printer_type_from_cups
{
  return (printer_type_from_cups_t)[(PKPrinterDescription *)self->_printerDescription printer_type_from_cups_scalar];
}

- (void)identifyPrinterWithSession:(id)a3 message:(id)a4 actions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(lite_printer_t *)self device_uri];
  id v12 = [v8 ippURL:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000133D8;
  v15[3] = &unk_100095938;
  v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  +[device_http_t deviceHTTPForSessionURL:v12 completionHandler:v15];
}

- (void)checkAccessWithSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  printerOperationQueue = self->_printerOperationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013628;
  v11[3] = &unk_100095960;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(NSOperationQueue *)printerOperationQueue addOperationWithBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (int64_t)_checkAccessWithSession:(id)a3
{
  id v3 = a3;
  sub_1000152F4(v5, 4u, @"_checkAccessWithSession");
}

- (void)refreshCurrentDescriptionForSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  printerDescription = self->_printerDescription;
  if (printerDescription)
  {
    (*((void (**)(id, PKPrinterDescription *, PKPrinterBrowseInfo *))v7 + 2))(v7, printerDescription, self->_browseInfo);
    id v10 = +[NSDate date];
    [v10 timeIntervalSinceDate:self->_printerDescriptionTime];
    if (v11 > 5.0)
    {
      id v12 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(lite_printer_t *)self displayName];
        int v16 = 134218242;
        id v17 = self;
        __int16 v18 = 2082;
        id v19 = [v13 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Printer<%p> %{public}s] refreshing printer description after timeout", (uint8_t *)&v16, 0x16u);
      }
      id v14 = [v10 dateByAddingTimeInterval:30.0];
      printerDescriptionTime = self->_printerDescriptionTime;
      self->_printerDescriptionTime = v14;

      [(lite_printer_t *)self forceRefreshCurrentDescriptionForSession:v6 completionHandler:0];
    }
  }
  else
  {
    [(lite_printer_t *)self forceRefreshCurrentDescriptionForSession:v6 completionHandler:v7];
  }
}

- (void)forceRefreshCurrentDescriptionForSession:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_100014980(v7, 0xBu, @"forceRefreshCurrentDescriptionForSession");
}

- (void)_updateDescPrinterDescription:(id)a3
{
  id v7 = a3;
  if (v7) {
    objc_storeStrong((id *)&self->_printerDescription, a3);
  }
  id v5 = +[NSDate date];
  printerDescriptionTime = self->_printerDescriptionTime;
  self->_printerDescriptionTime = v5;
}

- (lite_job_t)currentJob
{
  return (lite_job_t *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentJob:(id)a3
{
}

- (int64_t)busy
{
  return self->_busy;
}

- (void)setBusy:(int64_t)a3
{
  self->_busy = a3;
}

- (NSURLCredential)defaultCredentialForPrinter
{
  return (NSURLCredential *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDefaultCredentialForPrinter:(id)a3
{
}

- (unsigned)reasons
{
  return self->_reasons;
}

- (int64_t)reasons_changed
{
  return self->_reasons_changed;
}

- (NSString)printerStateMessage
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)printerStateReasons
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (PKPrinterBrowseInfo)browseInfo
{
  return (PKPrinterBrowseInfo *)objc_getProperty(self, a2, 8, 1);
}

- (PKPrinterDescription)printerDescription
{
  return (PKPrinterDescription *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerDescription, 0);
  objc_storeStrong((id *)&self->_printerStateReasons, 0);
  objc_storeStrong((id *)&self->_printerStateMessage, 0);
  objc_storeStrong((id *)&self->_defaultCredentialForPrinter, 0);
  objc_storeStrong((id *)&self->_currentJob, 0);
  objc_storeStrong((id *)&self->_printerOperationQueue, 0);
  objc_storeStrong((id *)&self->_printerDescriptionTime, 0);

  objc_storeStrong((id *)&self->_browseInfo, 0);
}

@end