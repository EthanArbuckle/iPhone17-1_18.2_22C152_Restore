@interface AEAudiobookBookmarkTimeSnapshot
+ (BOOL)supportsSecureCoding;
- (AEAudiobookBookmarkTimeSnapshot)initWithBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4;
- (AEAudiobookBookmarkTimeSnapshot)initWithCoder:(id)a3;
- (NSDate)bookmarkTimeTimestamp;
- (double)bookmarkTime;
- (double)newestBookmarkTimeFromBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setBookmarkTimeTimestamp:(id)a3;
@end

@implementation AEAudiobookBookmarkTimeSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTime];
  [v4 encodeDouble:@"AEAudiobookBookmarkTime" forKey:];
  id v5 = [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTimeTimestamp];
  [v4 encodeObject:v5 forKey:@"AEAudiobookBookmarkTimestamp"];
}

- (AEAudiobookBookmarkTimeSnapshot)initWithBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AEAudiobookBookmarkTimeSnapshot;
  v8 = [(AEAudiobookBookmarkTimeSnapshot *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_bookmarkTime = a3;
    objc_storeStrong((id *)&v8->_bookmarkTimeTimestamp, a4);
  }

  return v9;
}

- (AEAudiobookBookmarkTimeSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAudiobookBookmarkTimeSnapshot *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"AEAudiobookBookmarkTime"];
    v5->_bookmarkTime = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AEAudiobookBookmarkTimestamp"];
    bookmarkTimeTimestamp = v5->_bookmarkTimeTimestamp;
    v5->_bookmarkTimeTimestamp = (NSDate *)v7;
  }
  return v5;
}

- (double)newestBookmarkTimeFromBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTimeTimestamp];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v6 timeIntervalSinceReferenceDate];
  double v11 = v10;

  v12 = BDSCloudKitAudiobookLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 <= v11)
  {
    if (v13)
    {
      v17 = [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTimeTimestamp];
      [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTime];
      int v20 = 138413058;
      v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Audiobook Bookmark time snapshot date: %@ time:%lf < cloud date: %@ time: %lf.  Assuming Cloud time.", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    if (v13)
    {
      v14 = [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTimeTimestamp];
      [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTime];
      int v20 = 138413058;
      v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Audiobook Bookmark time snapshot date: %@ time:%lf > cloud date: %@ time: %lf.  Assuming snapshot time.", (uint8_t *)&v20, 0x2Au);
    }
    [(AEAudiobookBookmarkTimeSnapshot *)self bookmarkTime];
    a3 = v16;
  }

  return a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (NSDate)bookmarkTimeTimestamp
{
  return self->_bookmarkTimeTimestamp;
}

- (void)setBookmarkTimeTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end