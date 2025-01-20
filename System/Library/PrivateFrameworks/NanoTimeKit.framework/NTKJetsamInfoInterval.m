@interface NTKJetsamInfoInterval
- (BOOL)waitUntilDirtyMemoryDrained;
- (BOOL)waitUntilDirtyMemoryReaches:(int64_t)a3 maxWaitMS:(int)a4;
- (NSString)label;
- (NTKJetsamInfoInterval)initWithLabel:(id)a3;
- (jetsam_info)currentInfo;
- (jetsam_info)startInfo;
- (void)logCurrentInterval;
- (void)reset;
@end

@implementation NTKJetsamInfoInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NTKJetsamInfoInterval)initWithLabel:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKJetsamInfoInterval;
  v6 = [(NTKJetsamInfoInterval *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    uint64_t v8 = objc_opt_new();
    fetcher = v7->_fetcher;
    v7->_fetcher = (NTKJetsamInfoFetcher *)v8;

    if ([(NTKJetsamInfoFetcher *)v7->_fetcher getInfo:&v7->_startInfo])
    {
      if ([(NTKJetsamInfoFetcher *)v7->_fetcher resetInterval])
      {
        v10 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          label = v7->_label;
          double v12 = (double)v7->_startInfo.currentKB * 0.0009765625;
          *(_DWORD *)buf = 138412546;
          v16 = label;
          __int16 v17 = 2048;
          double v18 = v12;
          _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f", buf, 0x16u);
        }
      }
    }
  }

  return v7;
}

- (jetsam_info)currentInfo
{
  retstr->maxLifetimeKB = -1;
  retstr->maxIntervalKB = -1;
  retstr->currentKB = -1;
  return (jetsam_info *)-[NTKJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:");
}

- (void)logCurrentInterval
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v7 = 0;
  if ([(NTKJetsamInfoFetcher *)self->_fetcher getInfo:v6])
  {
    v3 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      double v5 = (double)self->_startInfo.currentKB * 0.0009765625;
      *(_DWORD *)buf = 138413058;
      v9 = label;
      __int16 v10 = 2048;
      double v11 = v5;
      __int16 v12 = 2048;
      double v13 = (double)v7 * 0.0009765625;
      __int16 v14 = 2048;
      double v15 = (double)v6[0] * 0.0009765625;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f, max: %.3f, end: %.3f", buf, 0x2Au);
    }
  }
}

- (void)reset
{
  [(NTKJetsamInfoFetcher *)self->_fetcher getInfo:&self->_startInfo];
  fetcher = self->_fetcher;
  [(NTKJetsamInfoFetcher *)fetcher resetInterval];
}

- (BOOL)waitUntilDirtyMemoryReaches:(int64_t)a3 maxWaitMS:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NTKJetsamInfoInterval *)self currentInfo];
  int64_t v7 = v15;
  if (v15 > a3 && a4 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      *(_OWORD *)__rqtp = xmmword_1BC8A1F90;
      nanosleep((const timespec *)__rqtp, 0);
      v9 += 100;
      [(NTKJetsamInfoInterval *)self currentInfo];
      int64_t v7 = v14;
    }
    while (v14 > a3 && (int)v9 < a4);
    double v11 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      *(_DWORD *)__rqtp = 138413058;
      *(void *)&__rqtp[4] = label;
      *(_WORD *)&__rqtp[12] = 2048;
      *(void *)&__rqtp[14] = v9;
      __int16 v17 = 2048;
      double v18 = (float)((float)a3 * 0.00097656);
      __int16 v19 = 2048;
      double v20 = (float)((float)v14 * 0.00097656);
      _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': waited %ld ms for footprint to get below %.3fMB, current = %.3fMB", __rqtp, 0x2Au);
    }
  }
  return v7 <= a3;
}

- (BOOL)waitUntilDirtyMemoryDrained
{
  return [(NTKJetsamInfoInterval *)self waitUntilDirtyMemoryReaches:self->_startInfo.currentKB + 2048 maxWaitMS:1000];
}

- (NSString)label
{
  return self->_label;
}

- (jetsam_info)startInfo
{
  *retstr = self[1];
  return self;
}

@end