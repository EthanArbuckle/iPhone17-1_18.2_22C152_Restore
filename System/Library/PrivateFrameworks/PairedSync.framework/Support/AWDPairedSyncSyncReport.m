@interface AWDPairedSyncSyncReport
+ (void)submitWithActivityName:(id)a3 syncDuration:(double)a4 timeoutCount:(unsigned int)a5 syncErrorCode:(unsigned int)a6 syncType:(unint64_t)a7 recordCount:(unsigned int)a8 syncByteCount:(unsigned int)a9 defaultByteCount:(unsigned int)a10 urgentByteCount:(unsigned int)a11 sawADropout:(BOOL)a12;
- (BOOL)submitMetric;
- (id)initWithActivityName:(id)a3 syncDuration:(double)a4 timeoutCount:(unsigned int)a5 syncErrorCode:(unsigned int)a6 syncType:(unint64_t)a7 recordCount:(unsigned int)a8 syncByteCount:(unsigned int)a9 defaultByteCount:(unsigned int)a10 urgentByteCount:(unsigned int)a11 sawADropout:(BOOL)a12;
@end

@implementation AWDPairedSyncSyncReport

+ (void)submitWithActivityName:(id)a3 syncDuration:(double)a4 timeoutCount:(unsigned int)a5 syncErrorCode:(unsigned int)a6 syncType:(unint64_t)a7 recordCount:(unsigned int)a8 syncByteCount:(unsigned int)a9 defaultByteCount:(unsigned int)a10 urgentByteCount:(unsigned int)a11 sawADropout:(BOOL)a12
{
  uint64_t v12 = *(void *)&a9;
  uint64_t v13 = *(void *)&a8;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  id v18 = a3;
  LOBYTE(v19) = a12;
  id v20 = [objc_alloc((Class)AWDPairedSyncSyncReport) initWithActivityName:v18 syncDuration:v16 timeoutCount:v15 syncErrorCode:a7 syncType:v13 recordCount:v12 syncByteCount:a4 defaultByteCount:__PAIR64__(a11 urgentByteCount:a10) sawADropout:v19];

  [v20 submitMetric];
}

- (id)initWithActivityName:(id)a3 syncDuration:(double)a4 timeoutCount:(unsigned int)a5 syncErrorCode:(unsigned int)a6 syncType:(unint64_t)a7 recordCount:(unsigned int)a8 syncByteCount:(unsigned int)a9 defaultByteCount:(unsigned int)a10 urgentByteCount:(unsigned int)a11 sawADropout:(BOOL)a12
{
  uint64_t v12 = *(void *)&a9;
  uint64_t v13 = *(void *)&a8;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  id v19 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AWDPairedSyncSyncReport;
  id v20 = [(AWDPairedSyncSyncReport *)&v26 init];
  if (v20)
  {
    v21 = +[PSYRegistrySingleton registry];
    v22 = [v21 getActiveDevice];

    [(AWDPairedSyncSyncReport *)v20 setIsAutomated:sub_10000418C()];
    v23 = [v22 systemBuildVersion];
    [(AWDPairedSyncSyncReport *)v20 setGizmoBuild:v23];

    v24 = [v22 valueForProperty:PDRDevicePropertyKeyHWModelString];
    [(AWDPairedSyncSyncReport *)v20 setGizmoHardware:v24];

    [(AWDPairedSyncSyncReport *)v20 setActivityName:v19];
    [(AWDPairedSyncSyncReport *)v20 setSyncDuration:(unint64_t)(a4 * 1000000000.0)];
    [(AWDPairedSyncSyncReport *)v20 setTimeoutCount:v16];
    [(AWDPairedSyncSyncReport *)v20 setSyncErrorCode:v15];
    [(AWDPairedSyncSyncReport *)v20 setSyncType:a7];
    [(AWDPairedSyncSyncReport *)v20 setRecordCount:v13];
    [(AWDPairedSyncSyncReport *)v20 setSyncByteCount:v12];
    [(AWDPairedSyncSyncReport *)v20 setDefaultByteCount:a10];
    [(AWDPairedSyncSyncReport *)v20 setUrgentByteCount:a11];
    [(AWDPairedSyncSyncReport *)v20 setSawADropout:a12];
  }
  return v20;
}

- (BOOL)submitMetric
{
  return sub_100003F68(4063232, self);
}

@end