@interface MBDeviceTransferProgressModel
+ (BOOL)shouldUpdateTimeEstimateForProgressPhase:(unint64_t)a3;
+ (double)_totalProgressForPhaseProgress:(double)a3 phase:(unint64_t)a4;
- (MBDeviceTransferProgress)lastUpdateProgressInfo;
- (MBDeviceTransferProgress)progressInfo;
- (MBDeviceTransferProgressModel)initWithEstimator:(id)a3;
- (MBDeviceTransferProgressModelDelegate)delegate;
- (MBDurationEstimation)estimator;
- (NSDate)fileTransferStartDate;
- (NSDate)restoreStartDate;
- (void)_updateTotalProgressWithTransferInfo:(_MBPeerTransferDriveTransferInfo *)a3 phaseProgress:(double)a4 phase:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setEstimator:(id)a3;
- (void)setFileTransferStartDate:(id)a3;
- (void)setLastUpdateProgressInfo:(id)a3;
- (void)setProgressInfo:(id)a3;
- (void)setRestoreStartDate:(id)a3;
- (void)updateTotalProgressWithPhase:(unint64_t)a3 transferInfo:(_MBPeerTransferDriveTransferInfo *)a4;
- (void)updateTotalProgressWithPhaseProgress:(double)a3 phase:(unint64_t)a4;
@end

@implementation MBDeviceTransferProgressModel

+ (double)_totalProgressForPhaseProgress:(double)a3 phase:(unint64_t)a4
{
  unint64_t v4 = 5;
  if (a4 + 1 < 5) {
    unint64_t v4 = a4 + 1;
  }
  return dbl_1003B38C8[a4] + a3 * (dbl_1003B38C8[v4] - dbl_1003B38C8[a4]);
}

+ (BOOL)shouldUpdateTimeEstimateForProgressPhase:(unint64_t)a3
{
  return a3 - 3 < 2;
}

- (MBDeviceTransferProgressModel)initWithEstimator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBDeviceTransferProgressModel;
  v6 = [(MBDeviceTransferProgressModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_estimator, a3);
    uint64_t v8 = objc_opt_new();
    progressInfo = v7->_progressInfo;
    v7->_progressInfo = (MBDeviceTransferProgress *)v8;

    v7->_progressLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)updateTotalProgressWithPhaseProgress:(double)a3 phase:(unint64_t)a4
{
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  v5[0] = v4;
  v5[1] = v4;
  [(MBDeviceTransferProgressModel *)self _updateTotalProgressWithTransferInfo:v5 phaseProgress:a4 phase:a3];
}

- (void)updateTotalProgressWithPhase:(unint64_t)a3 transferInfo:(_MBPeerTransferDriveTransferInfo *)a4
{
  long long v4 = *(_OWORD *)&a4->var2;
  double v5 = fmin((double)a4->var1 / (double)a4->var3, 1.0);
  v6[0] = *(_OWORD *)&a4->var0;
  v6[1] = v4;
  [(MBDeviceTransferProgressModel *)self _updateTotalProgressWithTransferInfo:v6 phaseProgress:a3 phase:v5];
}

- (void)_updateTotalProgressWithTransferInfo:(_MBPeerTransferDriveTransferInfo *)a3 phaseProgress:(double)a4 phase:(unint64_t)a5
{
  +[MBDeviceTransferProgressModel _totalProgressForPhaseProgress:phase:](MBDeviceTransferProgressModel, "_totalProgressForPhaseProgress:phase:", a5);
  double v10 = v9;
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  unint64_t var3 = a3->var3;
  v15 = [(MBDeviceTransferProgressModel *)self progressInfo];
  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  v17 = [(MBDeviceTransferProgressModel *)self lastUpdateProgressInfo];
  [v15 progress];
  BOOL v19 = v10 - v18 >= 0.005 || a4 >= 1.0;
  int64_t v65 = var3;
  if (a5 == 4)
  {
    v22 = [v15 restoreStartDate];

    if (!v22)
    {
      v23 = [(MBDeviceTransferProgressModel *)self restoreStartDate];
      [v15 setRestoreStartDate:v23];
    }
    if (!self->_restoreStarted)
    {
      self->_restoreStarted = 1;
      v24 = [(MBDeviceTransferProgressModel *)self estimator];
      [v24 resetStartTime];
    }
    goto LABEL_13;
  }
  if (a5 != 3)
  {
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v20 = [(MBDeviceTransferProgressModel *)self fileTransferStartDate];
  v21 = [v15 fileTransferStartDate];

  if (!v21) {
    [v15 setFileTransferStartDate:v20];
  }
  p_progressLock = &self->_progressLock;
LABEL_14:
  if (var0 >= 1)
  {
    if (!self->_fileTransferStarted)
    {
      self->_fileTransferStarted = 1;
      [(MBDeviceTransferProgressModel *)self estimator];
      int64_t v64 = var1;
      v25 = v17;
      int64_t v26 = var2;
      v27 = v20;
      v29 = v28 = p_progressLock;
      [v29 reset];

      p_progressLock = v28;
      v20 = v27;
      int64_t var2 = v26;
      v17 = v25;
      int64_t var1 = v64;
    }
    [v15 setFilesTransferred:var0];
    if (v19)
    {
      BOOL v19 = 1;
    }
    else if (v17)
    {
      v30 = [v17 filesTransferred];
      v31 = v17;
      int64_t v32 = var2;
      v33 = v20;
      v34 = p_progressLock;
      if ((unint64_t)v30 <= var0) {
        v35 = (unsigned char *)var0;
      }
      else {
        v35 = v30;
      }
      unint64_t v36 = v35 - (unsigned char *)[v31 filesTransferred];
      p_progressLock = v34;
      v20 = v33;
      int64_t var2 = v32;
      v17 = v31;
      BOOL v19 = v36 > 0x63;
    }
    else
    {
      BOOL v19 = 0;
    }
    if (var2 <= var0) {
      int64_t v37 = var0;
    }
    else {
      int64_t v37 = var2;
    }
    [v15 setTotalFileCount:v37];
  }
  if (var1 >= 1)
  {
    [v15 setBytesTransferred:var1];
    if (v19)
    {
      if (v65 <= var1) {
        int64_t v38 = var1;
      }
      else {
        int64_t v38 = v65;
      }
      [v15 setTotalByteCount:v38];
      goto LABEL_45;
    }
    if (v17)
    {
      v39 = [v17 bytesTransferred];
      if ((unint64_t)v39 <= var1) {
        v40 = (unsigned char *)var1;
      }
      else {
        v40 = v39;
      }
      unint64_t v41 = v40 - (unsigned char *)[v17 bytesTransferred];
      if (v65 <= var1) {
        int64_t v42 = var1;
      }
      else {
        int64_t v42 = v65;
      }
      [v15 setTotalByteCount:v42];
      if (v41 > 0x5F5E0FF) {
        goto LABEL_45;
      }
    }
    else
    {
      if (v65 <= var1) {
        int64_t v62 = var1;
      }
      else {
        int64_t v62 = v65;
      }
      [v15 setTotalByteCount:v62];
    }
LABEL_65:
    os_unfair_lock_unlock(p_progressLock);
    goto LABEL_66;
  }
  if (!v19) {
    goto LABEL_65;
  }
LABEL_45:
  switch(a5)
  {
    case 1uLL:
      CFStringRef v43 = @"init";
      break;
    case 2uLL:
      CFStringRef v43 = @"preflight";
      break;
    case 3uLL:
      CFStringRef v43 = @"backup";
      break;
    case 4uLL:
      CFStringRef v43 = @"restore";
      break;
    case 5uLL:
      __assert_rtn("MBDeviceTransferProgressPhaseDescription", "MBDeviceTransferProgressModel.h", 33, "0");
    default:
      CFStringRef v43 = @"unspecified";
      break;
  }
  [v15 setPhaseDescription:v43];
  [v15 setPhase:a5];
  [v15 progress];
  objc_msgSend(v15, "setProgress:", fmax(v10, v44));
  if ([(id)objc_opt_class() shouldUpdateTimeEstimateForProgressPhase:a5])
  {
    v45 = [(MBDeviceTransferProgressModel *)self estimator];
    double v46 = fmax(v10 + -0.1, 0.0);
    *(float *)&double v46 = v46;
    unsigned int v47 = [v45 shouldUpdateWithProgress:v46];

    if (v47)
    {
      v48 = [(MBDeviceTransferProgressModel *)self estimator];
      objc_msgSend(v15, "setMinutesRemaining:", objc_msgSend(v48, "minutesRemaining"));
    }
  }
  id v49 = [v15 copy];

  [(MBDeviceTransferProgressModel *)self setLastUpdateProgressInfo:v49];
  os_unfair_lock_unlock(p_progressLock);
  double v50 = -1.0;
  if (var1 >= 1)
  {
    if (v20)
    {
      v51 = +[NSDate date];
      [v51 timeIntervalSinceDate:v20];
      double v53 = v52;

      if (v53 > 0.0) {
        double v50 = (double)var1 / v53 / 1000000.0;
      }
    }
  }
  v54 = MBGetDefaultLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    [v49 progress];
    uint64_t v56 = v55;
    id v57 = [v49 minutesRemaining];
    id v58 = [v49 filesTransferred];
    id v59 = [v49 bytesTransferred];
    v60 = [v49 phaseDescription];
    *(_DWORD *)buf = 134219266;
    uint64_t v67 = v56;
    __int16 v68 = 2048;
    id v69 = v57;
    __int16 v70 = 2048;
    id v71 = v58;
    __int16 v72 = 2048;
    id v73 = v59;
    __int16 v74 = 2048;
    double v75 = v50;
    __int16 v76 = 2112;
    v77 = v60;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "p:%.2f, m:%ld, f:%llu, b:%llu, r:%.3fMB/s, p:\"%@\"", buf, 0x3Eu);

    [v49 progress];
    [v49 minutesRemaining];
    [v49 filesTransferred];
    [v49 bytesTransferred];
    v63 = [v49 phaseDescription];
    _MBLog();
  }
  v61 = [(MBDeviceTransferProgressModel *)self delegate];
  [v61 updatedTotalProgress:v49];

  v17 = v49;
LABEL_66:
}

- (MBDeviceTransferProgressModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBDeviceTransferProgressModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MBDeviceTransferProgress)progressInfo
{
  return self->_progressInfo;
}

- (void)setProgressInfo:(id)a3
{
}

- (NSDate)fileTransferStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileTransferStartDate:(id)a3
{
}

- (NSDate)restoreStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRestoreStartDate:(id)a3
{
}

- (MBDurationEstimation)estimator
{
  return self->_estimator;
}

- (void)setEstimator:(id)a3
{
}

- (MBDeviceTransferProgress)lastUpdateProgressInfo
{
  return self->_lastUpdateProgressInfo;
}

- (void)setLastUpdateProgressInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateProgressInfo, 0);
  objc_storeStrong((id *)&self->_estimator, 0);
  objc_storeStrong((id *)&self->_restoreStartDate, 0);
  objc_storeStrong((id *)&self->_fileTransferStartDate, 0);
  objc_storeStrong((id *)&self->_progressInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end