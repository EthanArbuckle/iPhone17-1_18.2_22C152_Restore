@interface HSModel
- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7;
- (HSModel)init;
- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation HSModel

- (HSModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)HSModel;
  v2 = [(HSModel *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater.HSQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004018;
  v7[3] = &unk_100025088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7
{
  v13 = +[NSMutableArray array];
  v14 = +[NSMutableArray array];
  v15 = "valid";
  if (!a6) {
    v15 = "NULL";
  }
  NSLog(@"getHSModelForEngineMajorVersion: majorVersion=%lu minorVersion=%lu numHSModels=%lu buffer=%s length=%zu\n", a3, a4, a5, v15, a7);
  if (!a6)
  {
    NSLog(@"Empty buffer\n", v33);
    goto LABEL_40;
  }
  unint64_t v38 = a5;
  v39 = v14;
  unint64_t v36 = a3;
  unint64_t v37 = a4;
  v35 = self;
  if (a5)
  {
    if (a7 >= 4)
    {
      uint64_t v16 = 0;
      v17 = 0;
      v18 = 0;
      id v19 = 0;
      LODWORD(a5) = 0;
      int v20 = 0;
      while (1)
      {
        unsigned int v21 = a6[v16];
        if (v21 >= 2)
        {
          NSLog(@"Unexpected modelType = 0x%x\n", a6[v16], v34);
          goto LABEL_31;
        }
        uint64_t v22 = (v20 + 2);
        unint64_t v23 = a6[v20 + 1];
        if (a7 - v22 <= v23)
        {
          NSLog(@"Bad buffer: remaining bytes %lu is less than localeCodeLen %d\n", a7 - v22, v23);
          goto LABEL_31;
        }
        if (v19) {

        }
        id v19 = [objc_alloc((Class)NSString) initWithBytes:&a6[v22] length:v23 encoding:4];
        if (!v19)
        {
          NSLog(@"Failed to create localeCode\n");

          goto LABEL_36;
        }
        int v24 = v22 + v23;
        uint64_t v25 = (v22 + v23 + 1);
        unint64_t v26 = a6[v24];
        if (a7 - v25 < v26)
        {
          NSLog(@"Bad buffer: remaining bytes %lu is less than hashLen %d\n", a7 - v25, v26);
          goto LABEL_31;
        }
        if (v18) {

        }
        id v27 = [objc_alloc((Class)NSString) initWithBytes:&a6[v25] length:v26 encoding:4];
        if (!v27)
        {
          NSLog(@"Failed to create hash\n");

          goto LABEL_35;
        }
        v18 = v27;
        if (v17) {

        }
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2050000000;
        v28 = (void *)qword_10002F9B8;
        uint64_t v44 = qword_10002F9B8;
        if (!qword_10002F9B8)
        {
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10000496C;
          v40[3] = &unk_100025100;
          v40[4] = &v41;
          sub_10000496C((uint64_t)v40);
          v28 = (void *)v42[3];
        }
        v29 = v28;
        _Block_object_dispose(&v41, 8);
        id v30 = [[v29 alloc] initWithData:0 hash:v18 locale:v19 digest:0 signature:0 certificate:0];
        if (!v30) {
          break;
        }
        v17 = v30;
        v31 = v13;
        if (v21) {
          v31 = v39;
        }
        [v31 addObject:v17];
        uint64_t v16 = (v25 + v26);
        a5 = (a5 + 1);
        int v20 = v25 + v26;
        if (a7 - 3 <= v16) {
          goto LABEL_24;
        }
      }
      NSLog(@"Failed to create CSVoiceTriggerRTModel asset\n");
      goto LABEL_34;
    }
    NSLog(@"Invalid length=%zu\n", a7);
LABEL_40:
    LOBYTE(v19) = 0;
    goto LABEL_26;
  }
  id v19 = 0;
  v18 = 0;
  v17 = 0;
LABEL_24:
  if (a5 == v38)
  {
    v14 = v39;
    NSLog(@"Requesting HSModel: majorVersion=%lu minorVersion=%lu assetCount=%d downloaded[%lu] preInstalled[%lu], on Queue: %@\n", v36, v37, a5, [v13 count], objc_msgSend(v39, "count"), v35->_queue);
    [(HSModel *)v35 scheduleCoreSpeechTask:v36 minorVersion:v37 downloadedModels:v13 preinstalledModels:v39];

    LOBYTE(v19) = 1;
    goto LABEL_26;
  }
  NSLog(@"assetCount %u != numHSModels %lu\n", a5, v38);
LABEL_31:

LABEL_34:
LABEL_35:

  LOBYTE(v19) = 0;
LABEL_36:
  v14 = v39;
LABEL_26:

  return (char)v19;
}

- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->delegate)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000462C;
    v15[3] = &unk_1000250D8;
    v15[4] = self;
    v12 = objc_retainBlock(v15);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v13 = (void *)qword_10002F9C8;
    uint64_t v19 = qword_10002F9C8;
    if (!qword_10002F9C8)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      unsigned int v21 = sub_100004B34;
      uint64_t v22 = &unk_100025100;
      unint64_t v23 = &v16;
      sub_100004B34((uint64_t)&buf);
      v13 = (void *)v17[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v16, 8);
    [v14 voiceTriggerRTModelForVersion:a3 minorVersion:a4 downloadedModels:v10 preinstalledModels:v11 completion:v12];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end