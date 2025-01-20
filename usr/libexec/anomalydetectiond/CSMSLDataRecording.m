@interface CSMSLDataRecording
- (BOOL)isComplete;
- (BOOL)shouldDeleteTTR;
- (BOOL)shouldUpload;
- (BOOL)ttrManagedMsl;
- (CSMSLDataRecording)initWithURL:(id)a3;
- (NSDictionary)metadata;
- (NSURL)url;
- (NSURL)urlToCopyToOnStop;
- (id).cxx_construct;
- (void)dumpMetadata;
- (void)recordAccel800:(id)a3;
- (void)recordAccel:(id)a3;
- (void)recordActivityPhone:(id)a3;
- (void)recordCompanionStatus:(id)a3;
- (void)recordDeviceMotion:(id)a3;
- (void)recordGPS:(id)a3;
- (void)recordHgAccel:(id)a3;
- (void)recordKappaTrigger:(id)a3;
- (void)recordMag:(id)a3;
- (void)recordPressure:(id)a3;
- (void)recordPressureCalibration:(id)a3;
- (void)recordRemoteAudioOutput:(id)a3;
- (void)recordRemoteSample:(id)a3;
- (void)recordRoadInfo:(id)a3;
- (void)recordSafetyHertzSample:(id)a3;
- (void)recordSoundPressureLevel:(id)a3;
- (void)recordSteps:(id)a3;
- (void)recordTrustedAudio:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setShouldDeleteTTR:(BOOL)a3;
- (void)setShouldUpload:(BOOL)a3;
- (void)setTtrManagedMsl:(BOOL)a3;
- (void)setUrlToCopyToOnStop:(id)a3;
- (void)stopAndKeep:(BOOL)a3;
- (void)updateMetadata:(id)a3;
- (void)writeMetadataToDisk:(id)a3;
@end

@implementation CSMSLDataRecording

- (CSMSLDataRecording)initWithURL:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSMSLDataRecording;
  v6 = [(CSMSLDataRecording *)&v27 init];
  if (v6)
  {
    v24 = +[NSFileManager defaultManager];
    v7 = [v5 path];
    v8 = [v7 stringByDeletingLastPathComponent];

    id v26 = 0;
    unsigned __int8 v9 = [v24 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v25 = v26;
    objc_storeStrong((id *)v6 + 6, a3);
    if ((v9 & 1) == 0)
    {
      if (qword_1003DB780 != -1) {
        dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
      }
      v10 = qword_1003DB788;
      if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Unable to create %@ directory: %@", buf, 0x16u);
      }
    }
    id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.anomalydetectiond"];
    [v11 setBool:1 forKey:@"LoggingEnabled"];
    if (qword_1003DB780 != -1) {
      dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
    }
    v12 = qword_1003DB788;
    if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *((void *)v6 + 6);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Writing files to %@.", buf, 0xCu);
    }
    *(void *)buf = 1048576000;
    *(void *)&buf[8] = 0x3200015180;
    v14 = [v6 url];
    id v15 = [v14 path];
    sub_100007BC0(&buf[16], (char *)[v15 UTF8String]);
    sub_100007BC0(&v31, "");
    sub_100007BC0(&__p, "msl");
    int v35 = 4;
    uint64_t v36 = 300;

    sub_1002761B8(v28);
    long long v16 = *(_OWORD *)v28;
    memset(v28, 0, sizeof(v28));
    v17 = (std::__shared_weak_count *)*((void *)v6 + 2);
    *(_OWORD *)(v6 + 8) = v16;
    if (v17)
    {
      sub_10000BB9C(v17);
      if (*(void *)&v28[8]) {
        sub_10000BB9C(*(std::__shared_weak_count **)&v28[8]);
      }
    }
    if (v30 >= 0) {
      v18 = &buf[16];
    }
    else {
      v18 = *(unsigned char **)&buf[16];
    }
    if ((CMMsl::Writer::open(*((void *)v6 + 1), (uint64_t)v18, v35) & 1) == 0)
    {
      if (qword_1003DB780 != -1) {
        dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
      }
      v19 = qword_1003DB788;
      if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_FAULT))
      {
        if (v30 >= 0) {
          v20 = &buf[16];
        }
        else {
          v20 = *(unsigned char **)&buf[16];
        }
        *(_DWORD *)v28 = 136315138;
        *(void *)&v28[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Error opening recording %s", v28, 0xCu);
      }
      v21 = (std::__shared_weak_count *)*((void *)v6 + 2);
      *((void *)v6 + 1) = 0;
      *((void *)v6 + 2) = 0;
      if (v21) {
        sub_10000BB9C(v21);
      }
    }
    *((void *)v6 + 3) = 0;
    v22 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = 0;

    *((_WORD *)v6 + 17) = 256;
    if (v34 < 0) {
      operator delete(__p);
    }
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  return (CSMSLDataRecording *)v6;
}

- (void)writeMetadataToDisk:(id)a3
{
  v4 = [a3 absoluteString];
  id v5 = +[NSString stringWithFormat:@"file:%@.metadata", v4];

  v6 = +[NSURL URLWithString:v5];
  v7 = [(CSMSLDataRecording *)self metadata];
  id v12 = 0;
  unsigned __int8 v8 = [v7 writeToURL:v6 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (qword_1003DB780 != -1) {
      dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
    }
    v10 = (id)qword_1003DB788;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 description];
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error writing meta data file: %@", buf, 0xCu);
    }
  }
}

- (void)stopAndKeep:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isComplete = 1;
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    v6 = *((void *)ptr + 1);
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = sub_100270AF8;
    v37 = &unk_1003AA558;
    v38 = ptr;
    dispatch_sync(v6, block);
    CMMsl::Writer::sync((CMMsl::Writer *)self->_writer.__ptr_);
    cntrl = self->_writer.__cntrl_;
    self->_writer.__ptr_ = 0;
    self->_writer.__cntrl_ = 0;
    if (cntrl) {
      sub_10000BB9C((std::__shared_weak_count *)cntrl);
    }
  }
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  if (qword_1003DB780 != -1) {
    dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
  }
  id v9 = qword_1003DB788;
  if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_DEFAULT))
  {
    BOOL ttrManagedMsl = self->_ttrManagedMsl;
    urlToCopyToOnStop = self->_urlToCopyToOnStop;
    *(_DWORD *)block = 67109634;
    *(_DWORD *)&block[4] = v3;
    *(_WORD *)&block[8] = 1024;
    *(_DWORD *)&block[10] = ttrManagedMsl;
    *(_WORD *)&block[14] = 2112;
    *(void *)&block[16] = urlToCopyToOnStop;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "stopAndKeep,%d,%d,%@", block, 0x18u);
  }
  if (!v3) {
    goto LABEL_33;
  }
  if (self->_ttrManagedMsl && self->_urlToCopyToOnStop)
  {
    if (qword_1003DB780 != -1) {
      dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
    }
    id v12 = qword_1003DB788;
    if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_urlToCopyToOnStop;
      *(_DWORD *)block = 138412290;
      *(void *)&block[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Copying MSL to: %@", block, 0xCu);
    }
    if (qword_1003DB780 != -1) {
      dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
    }
    v14 = (id)qword_1003DB788;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSURL *)self->_url path];
      *(_DWORD *)block = 138412290;
      *(void *)&block[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "source path: %@", block, 0xCu);
    }
    long long v16 = [(NSURL *)self->_urlToCopyToOnStop URLByDeletingLastPathComponent];
    v17 = [v16 path];
    id v35 = 0;
    [v8 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v18 = v35;

    if (v18)
    {
      if (qword_1003DB780 != -1) {
        dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
      }
      v19 = (id)qword_1003DB788;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v18 description];
        *(_DWORD *)block = 138412290;
        *(void *)&block[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "dir create error: %@", block, 0xCu);
      }
    }
    v21 = [(NSURL *)self->_url path];
    v22 = [(NSURL *)self->_urlToCopyToOnStop path];
    id v34 = v18;
    [v8 copyItemAtPath:v21 toPath:v22 error:&v34];
    id v23 = v34;

    if (v23)
    {
      if (qword_1003DB780 != -1) {
        dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
      }
      v24 = (id)qword_1003DB788;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [v23 description];
        *(_DWORD *)block = 138412290;
        *(void *)&block[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "copy error: %@", block, 0xCu);
      }
    }
  }
  if (self->_shouldDeleteTTR)
  {
LABEL_33:
    if (qword_1003DB780 != -1) {
      dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
    }
    id v26 = qword_1003DB788;
    if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)block = 138477827;
      *(void *)&block[4] = url;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "deleting MSL file: %{private}@", block, 0xCu);
    }
    v28 = [(NSURL *)self->_url path];
    id v33 = 0;
    unsigned __int8 v29 = [v8 removeItemAtPath:v28 error:&v33];
    id v30 = v33;

    if ((v29 & 1) == 0)
    {
      if (qword_1003DB780 != -1) {
        dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
      }
      v31 = qword_1003DB788;
      if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_FAULT))
      {
        char v32 = self->_url;
        *(_DWORD *)block = 138478083;
        *(void *)&block[4] = v32;
        *(_WORD *)&block[12] = 2113;
        *(void *)&block[14] = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "unable to delete file %{private}@: %{private}@", block, 0x16u);
      }
    }
  }
}

- (void)recordAccel800:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    long long v16 = off_1003A6748;
    bzero(&v17, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeAccel800((uint64_t)&v16);
    id v5 = [v4 timestamp];
    v21 |= 1u;
    double v19 = (double)(unint64_t)v5 * 0.000001;
    CMMsl::Accel800::makeSuper((uint64_t)v18);
    uint64_t v6 = *((void *)v18 + 1);
    id v7 = [v4 timestamp];
    *(unsigned char *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    uint64_t v8 = *((void *)v18 + 1);
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    uint64_t v10 = *((void *)v18 + 1);
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    uint64_t v12 = *((void *)v18 + 1);
    int v13 = *((_DWORD *)[v4 c_struct] + 4);
    *(unsigned char *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    id v15 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }
}

- (void)recordHgAccel:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    long long v16 = off_1003A6748;
    bzero(v17, 0x260uLL);
    bzero(&v18, 0xBB4uLL);
    CMMsl::Item::makeHgAccel((uint64_t)&v16);
    id v5 = [v4 timestamp];
    v20 |= 1u;
    v17[76] = (double)(unint64_t)v5 * 0.000001;
    CMMsl::HgAccel::makeSuper((uint64_t)v19);
    uint64_t v6 = *((void *)v19 + 1);
    id v7 = [v4 timestamp];
    *(unsigned char *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    uint64_t v8 = *((void *)v19 + 1);
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    uint64_t v10 = *((void *)v19 + 1);
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    uint64_t v12 = *((void *)v19 + 1);
    int v13 = *((_DWORD *)[v4 c_struct] + 4);
    *(unsigned char *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    id v15 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }
}

- (void)recordDeviceMotion:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    id v30 = off_1003A6748;
    bzero(v31, 0x260uLL);
    bzero(&v32, 0xBB4uLL);
    CMMsl::Item::makeDeviceMotion((uint64_t)&v30);
    id v5 = [v4 timestamp];
    v34 |= 1u;
    v31[76] = (double)(unint64_t)v5 * 0.000001;
    uint64_t v6 = v33;
    id v7 = [v4 timestamp];
    *(_DWORD *)(v6 + 124) |= 0x10u;
    *(double *)(v6 + 40) = (double)(unint64_t)v7;
    uint64_t v8 = v33;
    double v9 = *(float *)[v4 c_struct];
    *(_DWORD *)(v8 + 124) |= 2u;
    *(double *)(v8 + 16) = v9;
    uint64_t v10 = v33;
    double v11 = *((float *)[v4 c_struct] + 1);
    *(_DWORD *)(v10 + 124) |= 4u;
    *(double *)(v10 + 24) = v11;
    uint64_t v12 = v33;
    double v13 = *((float *)[v4 c_struct] + 2);
    *(_DWORD *)(v12 + 124) |= 8u;
    *(double *)(v12 + 32) = v13;
    uint64_t v14 = v33;
    double v15 = *((float *)[v4 c_struct] + 3);
    *(_DWORD *)(v14 + 124) |= 1u;
    *(double *)(v14 + 8) = v15;
    uint64_t v16 = v33;
    int v17 = *((_DWORD *)[v4 c_struct] + 4);
    *(_DWORD *)(v16 + 124) |= 0x2000u;
    *(_DWORD *)(v16 + 80) = v17;
    uint64_t v18 = v33;
    int v19 = *((_DWORD *)[v4 c_struct] + 5);
    *(_DWORD *)(v18 + 124) |= 0x4000u;
    *(_DWORD *)(v18 + 84) = v19;
    uint64_t v20 = v33;
    int v21 = *((_DWORD *)[v4 c_struct] + 6);
    *(_DWORD *)(v20 + 124) |= 0x8000u;
    *(_DWORD *)(v20 + 88) = v21;
    uint64_t v22 = v33;
    int v23 = *((_DWORD *)[v4 c_struct] + 7);
    *(_DWORD *)(v22 + 124) |= 0x40000u;
    *(_DWORD *)(v22 + 100) = v23;
    uint64_t v24 = v33;
    int v25 = *((_DWORD *)[v4 c_struct] + 8);
    *(_DWORD *)(v24 + 124) |= 0x80000u;
    *(_DWORD *)(v24 + 104) = v25;
    uint64_t v26 = v33;
    int v27 = *((_DWORD *)[v4 c_struct] + 9);
    *(_DWORD *)(v26 + 124) |= 0x100000u;
    *(_DWORD *)(v26 + 108) = v27;
    ptr = self->_writer.__ptr_;
    unsigned __int8 v29 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v30;
    dispatch_sync(v29, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v30);
  }
}

- (void)recordGPS:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v26 = off_1003A6748;
    bzero(v27, 0x260uLL);
    bzero(&v28, 0xBB4uLL);
    CMMsl::Item::makeMotionGPSLocation((uint64_t)&v26);
    double v5 = *((double *)[v4 c_struct] + 8) * 0.000001;
    v30 |= 1u;
    *(double *)&v27[76] = v5;
    uint64_t v6 = v29;
    uint64_t v7 = *(v4.c_struct + 8);
    *(_DWORD *)(v6 + 180) |= 0x800u;
    *(void *)(v6 + 96) = v7;
    uint64_t v8 = v29;
    double v9 = *(float *)[v4 c_struct];
    *(_DWORD *)(v8 + 180) |= 0x200u;
    *(double *)(v8 + 80) = v9;
    uint64_t v10 = v29;
    double v11 = *((float *)[v4 c_struct] + 1);
    *(_DWORD *)(v10 + 180) |= 0x400u;
    *(double *)(v10 + 88) = v11;
    uint64_t v12 = v29;
    double v13 = *((float *)[v4 c_struct] + 2);
    *(_DWORD *)(v12 + 180) |= 2u;
    *(double *)(v12 + 16) = v13;
    uint64_t v14 = v29;
    double v15 = *((float *)[v4 c_struct] + 3);
    *(_DWORD *)(v14 + 180) |= 4u;
    *(double *)(v14 + 24) = v15;
    uint64_t v16 = v29;
    double v17 = *((float *)[v4 c_struct] + 12);
    *(_DWORD *)(v16 + 180) |= 0x20u;
    *(double *)(v16 + 48) = v17;
    uint64_t v18 = v29;
    int v19 = *((_DWORD *)[v4 c_struct] + 13);
    *(_DWORD *)(v18 + 180) |= 0x8000u;
    *(_DWORD *)(v18 + 132) = v19;
    uint64_t v20 = v29;
    int v21 = *((_DWORD *)[v4 c_struct] + 14);
    *(_DWORD *)(v20 + 180) |= 0x4000u;
    *(_DWORD *)(v20 + 128) = v21;
    uint64_t v22 = v29;
    int v23 = *((_DWORD *)[v4 c_struct] + 15);
    *(_DWORD *)(v22 + 180) |= 0x800000u;
    *(_DWORD *)(v22 + 164) = v23;
    ptr = self->_writer.__ptr_;
    int v25 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v26;
    dispatch_sync(v25, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v26);
  }
}

- (void)recordSteps:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v18 = off_1003A6748;
    bzero(v19, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeKappaSteps((uint64_t)&v18);
    id v5 = [v4 timestamp];
    v22 |= 1u;
    v19[76] = (double)(unint64_t)v5 * 0.000001;
    uint64_t v6 = v21;
    uint64_t v7 = [v4 c_struct];
    *(unsigned char *)(v6 + 32) |= 1u;
    *(void *)(v6 + 8) = v7;
    uint64_t v8 = v21;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 32) |= 0x10u;
    *(_DWORD *)(v8 + 28) = v9;
    uint64_t v10 = v21;
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v10 + 32) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    uint64_t v12 = v21;
    int v13 = *((_DWORD *)[v4 c_struct] + 4);
    *(unsigned char *)(v12 + 32) |= 2u;
    *(_DWORD *)(v12 + 16) = v13;
    uint64_t v14 = v21;
    int v15 = *((unsigned __int8 *)[v4 c_struct] + 20);
    *(unsigned char *)(v14 + 32) |= 8u;
    *(_DWORD *)(v14 + 24) = v15;
    ptr = self->_writer.__ptr_;
    double v17 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v18;
    dispatch_sync(v17, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v18);
  }
}

- (void)recordKappaTrigger:(id)a3
{
  id v4 = a3;
  self->_triggerTime = (unint64_t)[v4 timestamp];
  if (self->_writer.__ptr_)
  {
    v58 = off_1003A6748;
    bzero(v59, 0x260uLL);
    bzero(&v60, 0xBB4uLL);
    CMMsl::Item::makeKappaTrigger((uint64_t)&v58);
    double v5 = (double)[v4 c_struct][1] * 0.000001;
    v62 |= 1u;
    *(double *)&v59[76] = v5;
    uint64_t v6 = v61;
    uint64_t v7 = *([v4 c_struct] + 1);
    *(_DWORD *)(v6 + 212) |= 4u;
    *(void *)(v6 + 96) = v7;
    uint64_t v8 = v61;
    char v9 = *(unsigned char *)[v4 c_struct] & 1;
    *(_DWORD *)(v8 + 212) |= 0x20000000u;
    *(unsigned char *)(v8 + 209) = v9;
    uint64_t v10 = v61;
    int v11 = *((_DWORD *)[v4 c_struct] + 4);
    *(_DWORD *)(v10 + 212) |= 0x10u;
    *(_DWORD *)(v10 + 112) = v11;
    uint64_t v12 = v61;
    int v13 = *((_DWORD *)[v4 c_struct] + 5);
    *(_DWORD *)(v12 + 212) |= 0x100u;
    *(_DWORD *)(v12 + 128) = v13;
    uint64_t v14 = v61;
    int v15 = *((unsigned __int8 *)[v4 c_struct] + 1);
    *(_DWORD *)(v14 + 212) |= 0x1000000u;
    *(_DWORD *)(v14 + 192) = v15;
    uint64_t v16 = v61;
    int v17 = *((char *)[v4 c_struct] + 28);
    *(_DWORD *)(v16 + 212) |= 0x20u;
    *(_DWORD *)(v16 + 116) = v17;
    uint64_t v18 = v61;
    _H0 = [v4 c_struct][20];
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v18 + 212) |= 0x2000000u;
    *(_DWORD *)(v18 + 196) = _S0;
    uint64_t v25 = v61;
    _H0 = *((_WORD *)[v4 c_struct] + 21);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v25 + 212) |= 0x4000000u;
    *(_DWORD *)(v25 + 200) = _S0;
    uint64_t v28 = v61;
    _H0 = [v4 c_struct][22];
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v28 + 212) |= 0x8000000u;
    *(_DWORD *)(v28 + 204) = _S0;
    uint64_t v31 = v61;
    uint64_t v32 = *((v4->c_struct) + 4);
    *(_DWORD *)(v31 + 212) |= 8u;
    *(void *)(v31 + 104) = v32;
    uint64_t v33 = v61;
    int v34 = *((unsigned __int8 *)[v4 c_struct] + 46);
    *(_DWORD *)(v33 + 212) |= 0x800u;
    *(_DWORD *)(v33 + 140) = v34;
    uint64_t v35 = v61;
    int v36 = *((unsigned __int8 *)[v4 c_struct] + 47);
    *(_DWORD *)(v35 + 212) |= 0x80u;
    *(_DWORD *)(v35 + 124) = v36;
    uint64_t v37 = v61;
    uint64_t v38 = *([v4 c_struct] + 7);
    *(_DWORD *)(v37 + 212) |= 2u;
    *(void *)(v37 + 88) = v38;
    uint64_t v39 = v61;
    char v40 = *((unsigned char *)[v4 c_struct] + 94);
    *(_DWORD *)(v39 + 212) |= 0x40000000u;
    *(unsigned char *)(v39 + 210) = v40;
    uint64_t v41 = v61;
    _H0 = *((_WORD *)[v4 c_struct] + 49);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v41 + 212) |= 0x1000u;
    *(_DWORD *)(v41 + 144) = _S0;
    uint64_t v44 = v61;
    _H0 = *((_WORD *)[v4 c_struct] + 50);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v44 + 212) |= 0x200u;
    *(_DWORD *)(v44 + 132) = _S0;
    uint64_t v47 = v61;
    _H0 = [v4 c_struct]._51;
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v47 + 212) |= 0x40u;
    *(_DWORD *)(v47 + 120) = _S0;
    uint64_t v50 = v61;
    int v51 = *((unsigned __int8 *)[v4 c_struct] + 104);
    *(_DWORD *)(v50 + 212) |= 0x200000u;
    *(_DWORD *)(v50 + 180) = v51;
    uint64_t v52 = v61;
    int v53 = *((unsigned __int8 *)[v4 c_struct] + 92);
    *(_DWORD *)(v52 + 212) |= 0x400u;
    *(_DWORD *)(v52 + 136) = v53;
    uint64_t v54 = v61;
    int v55 = *((unsigned __int8 *)[v4 c_struct] + 93);
    *(_DWORD *)(v54 + 212) |= 0x800000u;
    *(_DWORD *)(v54 + 188) = v55;
    ptr = self->_writer.__ptr_;
    v57 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v58;
    dispatch_sync(v57, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v58);
  }
}

- (void)recordPressure:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v14 = off_1003A6748;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    CMMsl::Item::makePressure((uint64_t)&v14);
    double v5 = (double)*(unint64_t *)[v4 c_struct] * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    uint64_t v6 = v17;
    double v7 = (double)[v4 c_struct];
    *(unsigned char *)(v6 + 24) |= 1u;
    *(double *)(v6 + 8) = v7;
    uint64_t v8 = v17;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 24) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    uint64_t v10 = v17;
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v10 + 24) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    ptr = self->_writer.__ptr_;
    int v13 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }
}

- (void)recordSoundPressureLevel:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v12 = off_1003A6748;
    bzero(v13, 0x260uLL);
    bzero(&v14, 0xBB4uLL);
    CMMsl::Item::makeSpl((uint64_t)&v12);
    double v5 = (double)[v4 c_struct] * 0.000001;
    v16 |= 1u;
    *(double *)&v13[76] = v5;
    uint64_t v6 = v15;
    uint64_t v7 = [v4 c_struct];
    *(unsigned char *)(v6 + 20) |= 1u;
    *(void *)(v6 + 8) = v7;
    uint64_t v8 = v15;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 20) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    ptr = self->_writer.__ptr_;
    int v11 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v12;
    dispatch_sync(v11, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v12);
  }
}

- (void)recordAccel:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    char v16 = off_1003A6748;
    bzero(&v17, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeAccel((uint64_t)&v16);
    id v5 = [v4 timestamp];
    v21 |= 1u;
    double v19 = (double)(unint64_t)v5 * 0.000001;
    uint64_t v6 = v18;
    id v7 = [v4 timestamp];
    *(unsigned char *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    uint64_t v8 = v18;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    uint64_t v10 = v18;
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    uint64_t v12 = v18;
    int v13 = *((_DWORD *)[v4 c_struct] + 4);
    *(unsigned char *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    uint64_t v15 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }
}

- (void)recordMag:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v18 = off_1003A6748;
    bzero(v19, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeMagnetometer((uint64_t)&v18);
    id v5 = [v4 timestamp];
    v22 |= 1u;
    v19[76] = (double)(unint64_t)v5 * 0.000001;
    uint64_t v6 = v21;
    id v7 = [v4 timestamp];
    *(unsigned char *)(v6 + 36) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    uint64_t v8 = v21;
    int v9 = *(_DWORD *)[v4 c_struct];
    *(unsigned char *)(v8 + 36) |= 8u;
    *(_DWORD *)(v8 + 24) = v9;
    uint64_t v10 = v21;
    int v11 = *((_DWORD *)[v4 c_struct] + 1);
    *(unsigned char *)(v10 + 36) |= 0x10u;
    *(_DWORD *)(v10 + 28) = v11;
    uint64_t v12 = v21;
    int v13 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v12 + 36) |= 0x20u;
    *(_DWORD *)(v12 + 32) = v13;
    uint64_t v14 = v21;
    int v15 = *((_DWORD *)[v4 c_struct] + 3);
    *(unsigned char *)(v14 + 36) |= 4u;
    *(_DWORD *)(v14 + 20) = v15;
    ptr = self->_writer.__ptr_;
    uint64_t v17 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v18;
    dispatch_sync(v17, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v18);
  }
}

- (void)recordPressureCalibration:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v20 = off_1003A6748;
    bzero(v21, 0x260uLL);
    bzero(&v22, 0xBB4uLL);
    CMMsl::Item::makePressureCalibration((uint64_t)&v20);
    double triggerTime = (double)self->_triggerTime;
    v24 |= 1u;
    *(double *)&v21[76] = triggerTime;
    uint64_t v6 = v23;
    [v4 medianToc];
    *(unsigned char *)(v6 + 32) |= 0x20u;
    *(_DWORD *)(v6 + 28) = v7;
    uint64_t v8 = v23;
    [v4 medTocFactoryTemp];
    *(unsigned char *)(v8 + 32) |= 0x10u;
    *(_DWORD *)(v8 + 24) = v9;
    uint64_t v10 = v23;
    [v4 maxTemp];
    *(unsigned char *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 20) = v11;
    uint64_t v12 = v23;
    [v4 inertialX];
    *(unsigned char *)(v12 + 32) |= 1u;
    *(_DWORD *)(v12 + 8) = v13;
    uint64_t v14 = v23;
    [v4 inertialY];
    *(unsigned char *)(v14 + 32) |= 2u;
    *(_DWORD *)(v14 + 12) = v15;
    uint64_t v16 = v23;
    [v4 inertialZ];
    *(unsigned char *)(v16 + 32) |= 4u;
    *(_DWORD *)(v16 + 16) = v17;
    ptr = self->_writer.__ptr_;
    double v19 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v20;
    dispatch_sync(v19, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v20);
  }
}

- (void)recordRemoteAudioOutput:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    v56 = off_1003A6748;
    bzero(v57, 0x260uLL);
    bzero(&v58, 0xBB4uLL);
    CMMsl::Item::makeKappaRemoteAudioResult((uint64_t)&v56);
    double v5 = (double)*(unint64_t *)[v4 c_struct] * 0.000001;
    v60 |= 1u;
    *(double *)&v57[76] = v5;
    uint64_t v6 = v59;
    uint64_t v7 = [v4 c_struct];
    *(void *)(v6 + 204) |= 1uLL;
    *(void *)(v6 + 8) = v7;
    uint64_t v8 = v59;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(void *)(v8 + 204) |= 0x200000uLL;
    *(_DWORD *)(v8 + 108) = v9;
    uint64_t v10 = v59;
    int v11 = *((_DWORD *)[v4 c_struct] + 3);
    *(void *)(v10 + 204) |= 0x2000uLL;
    *(_DWORD *)(v10 + 76) = v11;
    uint64_t v12 = v59;
    int v13 = *((_DWORD *)[v4 c_struct] + 4);
    *(void *)(v12 + 204) |= 0x20uLL;
    *(_DWORD *)(v12 + 44) = v13;
    uint64_t v14 = v59;
    int v15 = *((_DWORD *)[v4 c_struct] + 5);
    *(void *)(v14 + 204) |= 0x2000000uLL;
    *(_DWORD *)(v14 + 124) = v15;
    uint64_t v16 = v59;
    char v17 = *((unsigned char *)[v4 c_struct] + 24);
    *(void *)(v16 + 204) |= 0x200000000000000uLL;
    *(unsigned char *)(v16 + 180) = v17;
    uint64_t v18 = v59;
    char v19 = *((unsigned char *)[v4 c_struct] + 25);
    *(void *)(v18 + 204) |= 0x200000000uLL;
    *(unsigned char *)(v18 + 156) = v19;
    uint64_t v20 = v59;
    char v21 = *((unsigned char *)[v4 c_struct] + 26);
    __int16 v22 = *(_WORD *)(v20 + 212);
    v20 += 212;
    char v23 = *(unsigned char *)(v20 + 2);
    *(_WORD *)uint64_t v20 = v22 | 0x200;
    *(unsigned char *)(v20 + 2) = v23;
    *(unsigned char *)(v20 - 16) = v21;
    uint64_t v24 = v59;
    char v25 = *((unsigned char *)[v4 c_struct] + 27);
    *(void *)(v24 + 204) |= 0x20000000000uLL;
    *(unsigned char *)(v24 + 164) = v25;
    uint64_t v26 = v59;
    char v27 = *((unsigned char *)[v4 c_struct] + 28);
    *(void *)(v26 + 204) |= 0x2000000000000uLL;
    *(unsigned char *)(v26 + 172) = v27;
    uint64_t v28 = v59;
    char v29 = *((unsigned char *)[v4 c_struct] + 29);
    __int16 v30 = *(_WORD *)(v28 + 212);
    v28 += 212;
    char v31 = *(unsigned char *)(v28 + 2);
    *(_WORD *)uint64_t v28 = v30 | 2;
    *(unsigned char *)(v28 + 2) = v31;
    *(unsigned char *)(v28 - 24) = v29;
    uint64_t v32 = v59;
    int v33 = *((_DWORD *)[v4 c_struct] + 8);
    *(void *)(v32 + 204) |= 0x20000uLL;
    *(_DWORD *)(v32 + 92) = v33;
    uint64_t v34 = v59;
    int v35 = *((_DWORD *)[v4 c_struct] + 9);
    *(void *)(v34 + 204) |= 0x200uLL;
    *(_DWORD *)(v34 + 60) = v35;
    uint64_t v36 = v59;
    int v37 = *((_DWORD *)[v4 c_struct] + 10);
    *(void *)(v36 + 204) |= 0x20000000uLL;
    *(_DWORD *)(v36 + 140) = v37;
    uint64_t v38 = v59;
    char v39 = *((unsigned char *)[v4 c_struct] + 44);
    *(void *)(v38 + 204) |= 0x2000000000000000uLL;
    *(unsigned char *)(v38 + 184) = v39;
    uint64_t v40 = v59;
    char v41 = *((unsigned char *)[v4 c_struct] + 45);
    *(void *)(v40 + 204) |= 0x2000000000uLL;
    *(unsigned char *)(v40 + 160) = v41;
    uint64_t v42 = v59;
    char v43 = *((unsigned char *)[v4 c_struct] + 46);
    __int16 v44 = *(_WORD *)(v42 + 212);
    v42 += 212;
    char v45 = *(unsigned char *)(v42 + 2);
    *(_WORD *)uint64_t v42 = v44 | 0x2000;
    *(unsigned char *)(v42 + 2) = v45;
    *(unsigned char *)(v42 - 12) = v43;
    uint64_t v46 = v59;
    char v47 = *((unsigned char *)[v4 c_struct] + 47);
    *(void *)(v46 + 204) |= 0x200000000000uLL;
    *(unsigned char *)(v46 + 168) = v47;
    uint64_t v48 = v59;
    char v49 = *((unsigned char *)[v4 c_struct] + 48);
    *(void *)(v48 + 204) |= 0x20000000000000uLL;
    *(unsigned char *)(v48 + 176) = v49;
    uint64_t v50 = v59;
    char v51 = *((unsigned char *)[v4 c_struct] + 49);
    __int16 v52 = *(_WORD *)(v50 + 212);
    v50 += 212;
    char v53 = *(unsigned char *)(v50 + 2);
    *(_WORD *)uint64_t v50 = v52 | 4;
    *(unsigned char *)(v50 + 2) = v53;
    *(unsigned char *)(v50 - 23) = v51;
    ptr = self->_writer.__ptr_;
    int v55 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v56;
    dispatch_sync(v55, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v56);
  }
}

- (void)recordRoadInfo:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v14 = off_1003A6748;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    CMMsl::Item::makeKappaRoads((uint64_t)&v14);
    double v5 = (double)[v4 c_struct] * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    uint64_t v6 = v17;
    uint64_t v7 = [v4 c_struct];
    *(unsigned char *)(v6 + 32) |= 2u;
    *(void *)(v6 + 16) = v7;
    float v8 = *((double *)[v4 c_struct] + 1);
    if (v8 > 1000.0) {
      float v8 = 1000.0;
    }
    uint64_t v9 = v17;
    *(unsigned char *)(v17 + 32) |= 4u;
    *(float *)(v9 + 24) = v8;
    uint64_t v10 = v17;
    int v11 = *((unsigned __int8 *)[v4 c_struct] + 16);
    *(unsigned char *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 28) = v11;
    ptr = self->_writer.__ptr_;
    int v13 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }
}

- (void)recordTrustedAudio:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    v88 = off_1003A6748;
    bzero(v89, 0x260uLL);
    bzero(&v90, 0xBB4uLL);
    CMMsl::Item::makeSafetyTrustedAudioResult((uint64_t)&v88);
    double v5 = (double)[v4 c_struct] * 0.000001;
    v92 |= 1u;
    *(double *)&v89[76] = v5;
    uint64_t v6 = v91;
    id v7 = [v4 timestamp];
    *(void *)(v6 + 212) |= 0x800uLL;
    *(void *)(v6 + 96) = v7;
    uint64_t v8 = v91;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(void *)(v8 + 212) |= 0x200000uLL;
    *(_DWORD *)(v8 + 140) = v9;
    uint64_t v10 = v91;
    uint64_t v11 = (*(v4->c_struct) + 2);
    *(void *)(v10 + 212) |= 0x40uLL;
    *(void *)(v10 + 56) = v11;
    uint64_t v12 = v91;
    int v13 = *((_DWORD *)[v4 c_struct] + 6);
    *(void *)(v12 + 212) |= 0x10000uLL;
    *(_DWORD *)(v12 + 120) = v13;
    uint64_t v14 = v91;
    int v15 = *((_DWORD *)[v4 c_struct] + 7);
    *(void *)(v14 + 212) |= 0x1000000uLL;
    *(_DWORD *)(v14 + 152) = v15;
    uint64_t v16 = v91;
    int v17 = *((_DWORD *)[v4 c_struct] + 8);
    *(void *)(v16 + 212) |= 0x100000uLL;
    *(_DWORD *)(v16 + 136) = v17;
    uint64_t v18 = v91;
    uint64_t v19 = *([v4 c_struct] + 5);
    *(void *)(v18 + 212) |= 0x20uLL;
    *(void *)(v18 + 48) = v19;
    uint64_t v20 = v91;
    int v21 = *((_DWORD *)[v4 c_struct] + 12);
    *(void *)(v20 + 212) |= 0x40000uLL;
    *(_DWORD *)(v20 + 128) = v21;
    uint64_t v22 = v91;
    int v23 = *((_DWORD *)[v4 c_struct] + 13);
    *(void *)(v22 + 212) |= 0x800000uLL;
    *(_DWORD *)(v22 + 148) = v23;
    uint64_t v24 = v91;
    int v25 = *((_DWORD *)[v4 c_struct] + 14);
    *(void *)(v24 + 212) |= 0x400000uLL;
    *(_DWORD *)(v24 + 144) = v25;
    uint64_t v26 = v91;
    uint64_t v27 = [v4 c_struct][8];
    *(void *)(v26 + 212) |= 0x80uLL;
    *(void *)(v26 + 64) = v27;
    uint64_t v28 = v91;
    int v29 = *((_DWORD *)[v4 c_struct] + 18);
    *(void *)(v28 + 212) |= 0x20000uLL;
    *(_DWORD *)(v28 + 124) = v29;
    uint64_t v30 = v91;
    int v31 = *((_DWORD *)[v4 c_struct] + 19);
    *(void *)(v30 + 212) |= 0x80000uLL;
    *(_DWORD *)(v30 + 132) = v31;
    uint64_t v32 = v91;
    char v33 = *((unsigned char *)[v4 c_struct] + 80);
    *(void *)(v32 + 212) |= 0x4000000000uLL;
    *(unsigned char *)(v32 + 208) = v33;
    uint64_t v34 = v91;
    int v35 = *((_DWORD *)[v4 c_struct] + 22);
    *(void *)(v34 + 212) |= 0x40000000uLL;
    *(_DWORD *)(v34 + 176) = v35;
    uint64_t v36 = v91;
    uint64_t v37 = [v4 c_struct][12];
    *(void *)(v36 + 212) |= 0x200uLL;
    *(void *)(v36 + 80) = v37;
    uint64_t v38 = v91;
    int v39 = *((_DWORD *)[v4 c_struct] + 26);
    *(void *)(v38 + 212) |= 0x2000000uLL;
    *(_DWORD *)(v38 + 156) = v39;
    uint64_t v40 = v91;
    int v41 = *((_DWORD *)[v4 c_struct] + 27);
    *(void *)(v40 + 212) |= 0x200000000uLL;
    *(_DWORD *)(v40 + 188) = v41;
    uint64_t v42 = v91;
    int v43 = *((_DWORD *)[v4 c_struct] + 28);
    *(void *)(v42 + 212) |= 0x20000000uLL;
    *(_DWORD *)(v42 + 172) = v43;
    uint64_t v44 = v91;
    uint64_t v45 = [v4 c_struct][15];
    *(void *)(v44 + 212) |= 0x100uLL;
    *(void *)(v44 + 72) = v45;
    uint64_t v46 = v91;
    int v47 = *((_DWORD *)[v4 c_struct] + 32);
    *(void *)(v46 + 212) |= 0x8000000uLL;
    *(_DWORD *)(v46 + 164) = v47;
    uint64_t v48 = v91;
    int v49 = *((_DWORD *)[v4 c_struct] + 33);
    *(void *)(v48 + 212) |= (unint64_t)&_mh_execute_header;
    *(_DWORD *)(v48 + 184) = v49;
    uint64_t v50 = v91;
    int v51 = *((_DWORD *)[v4 c_struct] + 34);
    *(void *)(v50 + 212) |= 0x80000000uLL;
    *(_DWORD *)(v50 + 180) = v51;
    uint64_t v52 = v91;
    uint64_t v53 = [v4 c_struct][18];
    *(void *)(v52 + 212) |= 0x400uLL;
    *(void *)(v52 + 88) = v53;
    uint64_t v54 = v91;
    int v55 = *((_DWORD *)[v4 c_struct] + 38);
    *(void *)(v54 + 212) |= 0x4000000uLL;
    *(_DWORD *)(v54 + 160) = v55;
    uint64_t v56 = v91;
    int v57 = [v4 c_struct][39];
    *(void *)(v56 + 212) |= 0x10000000uLL;
    *(_DWORD *)(v56 + 168) = v57;
    uint64_t v58 = v91;
    char v59 = *((unsigned char *)[v4 c_struct] + 160);
    *(void *)(v58 + 212) |= 0x8000000000uLL;
    *(unsigned char *)(v58 + 209) = v59;
    uint64_t v60 = v91;
    int v61 = *((_DWORD *)[v4 c_struct] + 46);
    *(void *)(v60 + 212) |= 0x2000uLL;
    *(_DWORD *)(v60 + 108) = v61;
    uint64_t v62 = v91;
    int v63 = *((_DWORD *)[v4 c_struct] + 47);
    *(void *)(v62 + 212) |= 0x8000uLL;
    *(_DWORD *)(v62 + 116) = v63;
    uint64_t v64 = v91;
    int v65 = *((_DWORD *)[v4 c_struct] + 48);
    *(void *)(v64 + 212) |= 0x4000uLL;
    *(_DWORD *)(v64 + 112) = v65;
    uint64_t v66 = v91;
    uint64_t v67 = *((*(v4, "c_struct") + 25));
    *(void *)(v66 + 212) |= 0x10uLL;
    *(void *)(v66 + 40) = v67;
    uint64_t v68 = v91;
    uint64_t v69 = [v4 c_struct][26];
    *(void *)(v68 + 212) |= 8uLL;
    *(void *)(v68 + 32) = v69;
    uint64_t v70 = v91;
    uint64_t v71 = *((v4->c_struct) + 27);
    *(void *)(v70 + 212) |= 4uLL;
    *(void *)(v70 + 24) = v71;
    uint64_t v72 = v91;
    uint64_t v73 = *((*[v4 c_struct] + 28));
    *(void *)(v72 + 212) |= 2uLL;
    *(void *)(v72 + 16) = v73;
    uint64_t v74 = v91;
    uint64_t v75 = [v4 c_struct][29];
    *(void *)(v74 + 212) |= 1uLL;
    *(void *)(v74 + 8) = v75;
    uint64_t v76 = v91;
    int v77 = *((_DWORD *)[v4 c_struct] + 60);
    *(void *)(v76 + 212) |= 0x1000uLL;
    *(_DWORD *)(v76 + 104) = v77;
    uint64_t v78 = v91;
    int v79 = *((_DWORD *)[v4 c_struct] + 42);
    *(void *)(v78 + 212) |= 0x800000000uLL;
    *(_DWORD *)(v78 + 196) = v79;
    uint64_t v80 = v91;
    int v81 = *((_DWORD *)[v4 c_struct] + 43);
    *(void *)(v80 + 212) |= 0x2000000000uLL;
    *(_DWORD *)(v80 + 204) = v81;
    uint64_t v82 = v91;
    int v83 = *((_DWORD *)[v4 c_struct] + 44);
    *(void *)(v82 + 212) |= 0x1000000000uLL;
    *(_DWORD *)(v82 + 200) = v83;
    uint64_t v84 = v91;
    int v85 = *((_DWORD *)[v4 c_struct] + 45);
    *(void *)(v84 + 212) |= 0x400000000uLL;
    *(_DWORD *)(v84 + 192) = v85;
    ptr = self->_writer.__ptr_;
    v87 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v88;
    dispatch_sync(v87, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v88);
  }
}

- (void)recordActivityPhone:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v22 = off_1003A6748;
    bzero(v23, 0x260uLL);
    bzero(&v24, 0xBB4uLL);
    CMMsl::Item::makeKappaActivityPhone((uint64_t)&v22);
    double v5 = (*(unint64_t *)[v4 c_struct:v22]) * 0.000001;
    v26 |= 1u;
    *(double *)&v23[76] = v5;
    uint64_t v6 = v25;
    uint64_t v7 = [v4 c_struct];
    v6[140] |= 1u;
    *((void *)v6 + 13) = v7;
    block = (void **)[v4 c_struct];
    LODWORD(v28) = *((_DWORD *)[v4 c_struct] + 4);
    sub_100024308(v25 + 8, (char *)&block, (uint64_t)&v28 + 4, 3uLL);
    uint64_t v8 = v25;
    int v9 = *((unsigned __int8 *)[v4 c_struct] + 20);
    v8[140] |= 4u;
    *((_DWORD *)v8 + 30) = v9;
    block = (void **)[v4 c_struct][3];
    LODWORD(v28) = [v4 c_struct][8];
    sub_100024308(v25 + 80, (char *)&block, (uint64_t)&v28 + 4, 3uLL);
    uint64_t v10 = v25;
    uint64_t v11 = *(v4.c_struct + 5);
    v10[140] |= 2u;
    *((void *)v10 + 14) = v11;
    LODWORD(block) = *((unsigned __int16 *)[v4 c_struct] + 24);
    HIDWORD(block) = *((unsigned __int16 *)[v4 c_struct] + 25);
    LODWORD(v28) = *((unsigned __int16 *)[v4 c_struct] + 26);
    HIDWORD(v28) = *((unsigned __int16 *)[v4 c_struct] + 27);
    LODWORD(v29[0]) = *((unsigned __int16 *)[v4 c_struct] + 28);
    sub_100024308(v25 + 32, (char *)&block, (uint64_t)v29 + 4, 5uLL);
    LODWORD(block) = *((unsigned __int16 *)[v4 c_struct] + 29);
    HIDWORD(block) = *((unsigned __int16 *)[v4 c_struct] + 30);
    LODWORD(v28) = [v4 c_struct][31];
    HIDWORD(v28) = *((unsigned __int16 *)[v4 c_struct] + 32);
    LODWORD(v29[0]) = *((unsigned __int16 *)[v4 c_struct] + 33);
    sub_100024308(v25 + 56, (char *)&block, (uint64_t)v29 + 4, 5uLL);
    uint64_t v12 = v25;
    int v13 = *((_DWORD *)[v4 c_struct] + 17);
    v12[140] |= 0x20u;
    *((_DWORD *)v12 + 33) = v13;
    uint64_t v14 = v25;
    int v15 = *((_DWORD *)[v4 c_struct] + 18);
    v14[140] |= 8u;
    *((_DWORD *)v14 + 31) = v15;
    uint64_t v16 = v25;
    int v17 = *((_DWORD *)[v4 c_struct] + 19);
    v16[140] |= 0x10u;
    *((_DWORD *)v16 + 32) = v17;
    uint64_t v18 = v25;
    int v19 = *((_DWORD *)[v4 c_struct] + 20);
    v18[140] |= 0x40u;
    *((_DWORD *)v18 + 34) = v19;
    ptr = self->_writer.__ptr_;
    int v21 = *((void *)ptr + 1);
    block = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29[0] = sub_100270868;
    v29[1] = &unk_1003AA578;
    v29[2] = ptr;
    v29[3] = &v22;
    dispatch_sync(v21, &block);
    CMMsl::Item::~Item((CMMsl::Item *)&v22);
  }
}

- (void)recordSafetyHertzSample:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v14 = off_1003A6748;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    double v5 = (double)[v4 c_struct] * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    CMMsl::Item::makeSafetyHertzSample((uint64_t)&v14);
    uint64_t v6 = v17;
    uint64_t v7 = [v4 c_struct];
    *(unsigned char *)(v6 + 24) |= 1u;
    *(void *)(v6 + 8) = v7;
    uint64_t v8 = v17;
    int v9 = *((unsigned __int16 *)[v4 c_struct] + 4);
    *(unsigned char *)(v8 + 24) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    uint64_t v10 = v17;
    int v11 = *((unsigned __int8 *)[v4 c_struct] + 10);
    *(unsigned char *)(v10 + 24) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    ptr = self->_writer.__ptr_;
    int v13 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }
}

- (void)recordCompanionStatus:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v12 = off_1003A6748;
    bzero(v13, 0x260uLL);
    bzero(&v14, 0xBB4uLL);
    double v5 = (double)[v4 c_struct] * 0.000001;
    v16 |= 1u;
    *(double *)&v13[76] = v5;
    CMMsl::Item::makeSafetyCompanionStatus((uint64_t)&v12);
    uint64_t v6 = v15;
    uint64_t v7 = [v4 c_struct];
    *(unsigned char *)(v6 + 20) |= 1u;
    *(void *)(v6 + 8) = v7;
    uint64_t v8 = v15;
    int v9 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v8 + 20) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    ptr = self->_writer.__ptr_;
    int v11 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v12;
    dispatch_sync(v11, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v12);
  }
}

- (void)recordRemoteSample:(id)a3
{
  id v4 = a3;
  if (self->_writer.__ptr_)
  {
    uint64_t v22 = off_1003A6748;
    bzero(v23, 0x260uLL);
    bzero(&v24, 0xBB4uLL);
    id v5 = [v4 timestamp];
    v26 |= 1u;
    v23[76] = (double)(unint64_t)v5 * 0.000001;
    CMMsl::Item::makeSafetyRemoteSample((uint64_t)&v22);
    uint64_t v6 = v25;
    int v7 = *(unsigned __int8 *)[v4 c_struct];
    *(unsigned char *)(v6 + 52) |= 0x20u;
    *(_DWORD *)(v6 + 44) = v7;
    uint64_t v8 = v25;
    int v9 = *((_DWORD *)[v4 c_struct] + 1);
    *(unsigned char *)(v8 + 52) |= 0x40u;
    *(_DWORD *)(v8 + 48) = v9;
    uint64_t v10 = v25;
    int v11 = *((_DWORD *)[v4 c_struct] + 2);
    *(unsigned char *)(v10 + 52) |= 0x10u;
    *(_DWORD *)(v10 + 40) = v11;
    uint64_t v12 = v25;
    uint64_t v13 = *([v4 c_struct] + 2);
    *(unsigned char *)(v12 + 52) |= 1u;
    *(void *)(v12 + 8) = v13;
    uint64_t v14 = v25;
    uint64_t v15 = *(v4.c_struct + 3);
    *(unsigned char *)(v14 + 52) |= 8u;
    *(void *)(v14 + 32) = v15;
    uint64_t v16 = v25;
    uint64_t v17 = *((v4->c_struct) + 4);
    *(unsigned char *)(v16 + 52) |= 4u;
    *(void *)(v16 + 24) = v17;
    uint64_t v18 = v25;
    uint64_t v19 = *((v4->c_struct) + 5);
    *(unsigned char *)(v18 + 52) |= 2u;
    *(void *)(v18 + 16) = v19;
    ptr = self->_writer.__ptr_;
    int v21 = *((void *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270868;
    block[3] = &unk_1003AA578;
    block[4] = ptr;
    block[5] = &v22;
    dispatch_sync(v21, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v22);
  }
}

- (void)updateMetadata:(id)a3
{
  id v8 = a3;
  metadata = self->_metadata;
  if (metadata) {
    id v5 = (NSDictionary *)[(NSDictionary *)metadata mutableCopy];
  }
  else {
    id v5 = (NSDictionary *)objc_opt_new();
  }
  uint64_t v6 = v5;
  [(NSDictionary *)v5 addEntriesFromDictionary:v8];
  int v7 = self->_metadata;
  self->_metadata = v6;
}

- (void)dumpMetadata
{
  v2 = [(NSDictionary *)self->_metadata allKeys];
  BOOL v3 = [v2 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

  if (qword_1003DB780 != -1) {
    dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
  }
  id v4 = qword_1003DB788;
  if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "metadata begin", buf, 2u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        if (qword_1003DB780 != -1) {
          dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
        }
        uint64_t v10 = (id)qword_1003DB788;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:v9];
          *(_DWORD *)buf = 67109634;
          int v20 = v6 + v8;
          __int16 v21 = 2112;
          uint64_t v22 = v9;
          __int16 v23 = 2112;
          uint64_t v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%d:%@ %@", buf, 0x1Cu);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v25 count:16];
      v6 += (int)v8;
    }
    while (v5);
  }

  if (qword_1003DB780 != -1) {
    dispatch_once(&qword_1003DB780, &stru_1003AD2A0);
  }
  uint64_t v12 = qword_1003DB788;
  if (os_log_type_enabled((os_log_t)qword_1003DB788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "metadata end", buf, 2u);
  }
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)ttrManagedMsl
{
  return self->_ttrManagedMsl;
}

- (void)setTtrManagedMsl:(BOOL)a3
{
  self->_BOOL ttrManagedMsl = a3;
}

- (NSURL)urlToCopyToOnStop
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUrlToCopyToOnStop:(id)a3
{
}

- (BOOL)shouldDeleteTTR
{
  return self->_shouldDeleteTTR;
}

- (void)setShouldDeleteTTR:(BOOL)a3
{
  self->_shouldDeleteTTR = a3;
}

- (BOOL)shouldUpload
{
  return self->_shouldUpload;
}

- (void)setShouldUpload:(BOOL)a3
{
  self->_shouldUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToCopyToOnStop, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  cntrl = self->_writer.__cntrl_;
  if (cntrl)
  {
    sub_10000BB9C((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end