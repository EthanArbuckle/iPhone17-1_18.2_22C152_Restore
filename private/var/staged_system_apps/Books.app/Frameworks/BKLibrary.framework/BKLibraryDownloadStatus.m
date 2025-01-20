@interface BKLibraryDownloadStatus
+ (id)statusWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6;
- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8;
- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8 error:(id)a9;
- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 supplementalContentState:(int64_t)a5 progressValue:(double)a6 timeRemaining:(int64_t)a7 bytesDownloaded:(unint64_t)a8 fileSize:(unint64_t)a9 error:(id)a10;
- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 supplementalContentState:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8;
- (BOOL)canPause;
- (BOOL)canRestart;
- (BOOL)canResume;
- (BOOL)canStart;
- (BOOL)hasFinished;
- (BOOL)internetReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProgressAndStateEqual:(id)a3;
- (BOOL)waitingToBeDownloadable;
- (NSError)error;
- (NSString)assetID;
- (NSString)description;
- (double)progressValue;
- (id)stateStringDescription:(int64_t)a3;
- (int64_t)combinedState;
- (int64_t)state;
- (int64_t)supplementalContentState;
- (int64_t)timeRemaining;
- (unint64_t)bytesDownloaded;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)updateWithStatus:(id)a3;
- (void)updateWithWaitingToBeDownloadable:(BOOL)a3;
@end

@implementation BKLibraryDownloadStatus

+ (id)statusWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6
{
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithAssetID:v10 state:a4 progressValue:a6 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:a5];

  return v11;
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8
{
  return [(BKLibraryDownloadStatus *)self initWithAssetID:a3 state:a4 progressValue:a6 timeRemaining:a7 bytesDownloaded:a8 fileSize:0 error:a5];
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 supplementalContentState:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8
{
  return [(BKLibraryDownloadStatus *)self initWithAssetID:a3 state:0 supplementalContentState:a4 progressValue:a6 timeRemaining:a7 bytesDownloaded:a8 fileSize:a5 error:0];
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8 error:(id)a9
{
  return [(BKLibraryDownloadStatus *)self initWithAssetID:a3 state:a4 supplementalContentState:0 progressValue:a6 timeRemaining:a7 bytesDownloaded:a8 fileSize:a5 error:a9];
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 supplementalContentState:(int64_t)a5 progressValue:(double)a6 timeRemaining:(int64_t)a7 bytesDownloaded:(unint64_t)a8 fileSize:(unint64_t)a9 error:(id)a10
{
  id v17 = a3;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BKLibraryDownloadStatus;
  v19 = [(BKLibraryDownloadStatus *)&v26 init];
  if (v19)
  {
    v20 = (NSString *)[v17 copy];
    assetID = v19->_assetID;
    v19->_assetID = v20;

    v19->_state = a4;
    v19->_supplementalContentState = a5;
    if (a4) {
      int64_t v22 = a4;
    }
    else {
      int64_t v22 = a5;
    }
    double v23 = fmin(a6, 1.0);
    if (v23 < 0.0) {
      double v23 = 0.0;
    }
    v19->_progressValue = v23;
    v19->_combinedState = v22;
    v19->_timeRemaining = a7;
    v19->_bytesDownloaded = a8;
    v19->_fileSize = a9;
    v24 = +[BKReachability sharedReachabilityForInternetConnection];
    v19->_internetReachable = [v24 currentReachabilityStatus] != 0;

    objc_storeStrong((id *)&v19->_error, a10);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  v6 = BUDynamicCast();

  if (!v6)
  {
    unsigned __int8 v19 = 0;
    goto LABEL_14;
  }
  v7 = [(BKLibraryDownloadStatus *)self assetID];
  v8 = [v6 assetID];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [(BKLibraryDownloadStatus *)self state];
    if (v9 == [v6 state])
    {
      id v10 = [(BKLibraryDownloadStatus *)self supplementalContentState];
      if (v10 == [v6 supplementalContentState])
      {
        id v11 = [(BKLibraryDownloadStatus *)self combinedState];
        if (v11 == [v6 combinedState])
        {
          [(BKLibraryDownloadStatus *)self progressValue];
          double v13 = v12;
          [v6 progressValue];
          if (vabdd_f64(v13, v14) < 0.001)
          {
            id v15 = [(BKLibraryDownloadStatus *)self timeRemaining];
            if (v15 == [v6 timeRemaining])
            {
              id v16 = [(BKLibraryDownloadStatus *)self bytesDownloaded];
              if (v16 == [v6 bytesDownloaded])
              {
                id v17 = [(BKLibraryDownloadStatus *)self fileSize];
                if (v17 == [v6 fileSize])
                {
                  unsigned int v18 = [(BKLibraryDownloadStatus *)self internetReachable];
                  if (v18 == [v6 internetReachable])
                  {
                    v21 = [(BKLibraryDownloadStatus *)self error];
                    if (v21 || ([v6 error], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      int64_t v22 = [(BKLibraryDownloadStatus *)self error];
                      double v23 = [v6 error];
                      unsigned __int8 v19 = [v22 isEqual:v23];

                      if (v21)
                      {
LABEL_21:

                        goto LABEL_12;
                      }
                    }
                    else
                    {
                      unsigned __int8 v19 = 1;
                    }

                    goto LABEL_21;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  unsigned __int8 v19 = 0;
LABEL_12:

LABEL_14:
  return v19;
}

- (BOOL)isProgressAndStateEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  if (v5)
  {
    v6 = [(BKLibraryDownloadStatus *)self assetID];
    v7 = [v5 assetID];
    if ([v6 isEqualToString:v7]
      && (id v8 = -[BKLibraryDownloadStatus state](self, "state"), v8 == [v5 state]))
    {
      [(BKLibraryDownloadStatus *)self progressValue];
      double v10 = v9;
      [v5 progressValue];
      BOOL v12 = vabdd_f64(v10, v11) < 0.001;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(BKLibraryDownloadStatus *)self assetID];
  id v4 = [v3 hash];

  int64_t v5 = (unsigned char *)[(BKLibraryDownloadStatus *)self state] - (unsigned char *)v4 + 32 * (void)v4;
  int64_t v6 = [(BKLibraryDownloadStatus *)self supplementalContentState] + 32 * v5 - v5;
  int64_t v7 = [(BKLibraryDownloadStatus *)self combinedState] + 32 * v6 - v6;
  [(BKLibraryDownloadStatus *)self progressValue];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  int64_t v9 = (int64_t)[v8 hash] + 32 * v7 - v7;

  int64_t v10 = [(BKLibraryDownloadStatus *)self timeRemaining] + 32 * v9 - v9;
  int64_t v11 = [(BKLibraryDownloadStatus *)self bytesDownloaded] + 32 * v10 - v10;
  uint64_t v12 = 31 * ([(BKLibraryDownloadStatus *)self fileSize] + 32 * v11 - v11);
  uint64_t v13 = v12 + [(BKLibraryDownloadStatus *)self internetReachable];
  double v14 = [(BKLibraryDownloadStatus *)self error];
  id v15 = (char *)[v14 hash] + 32 * v13 - v13 + 0x2E97294E4B2C1;

  return (unint64_t)v15;
}

- (void)updateWithStatus:(id)a3
{
  id v14 = a3;
  id v4 = [v14 assetID];
  int64_t v5 = [(BKLibraryDownloadStatus *)self assetID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    if ([v14 state] != self->_state)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"state"];
      self->_state = (int64_t)[v14 state];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"state"];
    }
    if ([v14 supplementalContentState] != self->_supplementalContentState)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"supplementalContentState"];
      self->_supplementalContentState = (int64_t)[v14 supplementalContentState];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"supplementalContentState"];
    }
    if ([v14 combinedState] != self->_combinedState)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"combinedState"];
      self->_combinedState = (int64_t)[v14 combinedState];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"combinedState"];
    }
    [v14 progressValue];
    if (v7 != self->_progressValue)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"progressValue"];
      [v14 progressValue];
      self->_progressValue = v8;
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"progressValue"];
    }
    if ([v14 timeRemaining] != self->_timeRemaining)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"timeRemaining"];
      self->_timeRemaining = (int64_t)[v14 timeRemaining];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"timeRemaining"];
    }
    if ([v14 bytesDownloaded] != self->_bytesDownloaded
      && [v14 bytesDownloaded] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"bytesDownloaded"];
      self->_bytesDownloaded = (unint64_t)[v14 bytesDownloaded];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"bytesDownloaded"];
    }
    if ([v14 fileSize] != self->_fileSize
      && [v14 fileSize] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"fileSize"];
      self->_fileSize = (unint64_t)[v14 fileSize];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"fileSize"];
    }
    if (self->_internetReachable != [v14 internetReachable])
    {
      [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"internetReachable"];
      self->_internetReachable = [v14 internetReachable];
      [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"internetReachable"];
    }
    int64_t v9 = [v14 error];
    if (v9 || self->_error)
    {
      int64_t v10 = [v14 error];
      unsigned __int8 v11 = [v10 isEqual:self->_error];

      if ((v11 & 1) == 0)
      {
        [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"error"];
        uint64_t v12 = [v14 error];
        error = self->_error;
        self->_error = v12;

        [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"error"];
      }
    }
  }
}

- (void)updateWithWaitingToBeDownloadable:(BOOL)a3
{
  if (self->_waitingToBeDownloadable != a3)
  {
    [(BKLibraryDownloadStatus *)self willChangeValueForKey:@"waitingToBeDownloadable"];
    self->_waitingToBeDownloadable = a3;
    [(BKLibraryDownloadStatus *)self didChangeValueForKey:@"waitingToBeDownloadable"];
  }
}

- (BOOL)canPause
{
  return (unint64_t)(self->_state - 3) < 2;
}

- (BOOL)canResume
{
  return self->_state == 6;
}

- (BOOL)canRestart
{
  return self->_state == 7;
}

- (BOOL)canStart
{
  return self->_state < 2uLL;
}

- (BOOL)hasFinished
{
  return (self->_state < 0xCuLL) & (0xDA0u >> self->_state);
}

- (id)stateStringDescription:(int64_t)a3
{
  return off_D2E08[a3];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  assetID = self->_assetID;
  unsigned int v6 = [(BKLibraryDownloadStatus *)self stateStringDescription:self->_state];
  uint64_t v7 = [(BKLibraryDownloadStatus *)self stateStringDescription:self->_supplementalContentState];
  double v8 = (void *)v7;
  CFStringRef v9 = @"YES";
  if (!self->_internetReachable) {
    CFStringRef v9 = @"NO";
  }
  int64_t v10 = +[NSString stringWithFormat:@"<%@ %p assetID=%@ state=%@ supplementalContentState=%@ progressValue=%f timeRemaining=%ld internetReachable=%@ error=%@>", v4, self, assetID, v6, v7, *(void *)&self->_progressValue, self->_timeRemaining, v9, self->_error];

  return (NSString *)v10;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (double)progressValue
{
  return self->_progressValue;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)supplementalContentState
{
  return self->_supplementalContentState;
}

- (int64_t)combinedState
{
  return self->_combinedState;
}

- (int64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (BOOL)internetReachable
{
  return self->_internetReachable;
}

- (BOOL)waitingToBeDownloadable
{
  return self->_waitingToBeDownloadable;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end