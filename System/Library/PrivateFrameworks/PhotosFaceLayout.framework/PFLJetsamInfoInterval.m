@interface PFLJetsamInfoInterval
- (NSString)label;
- (PFLJetsamInfoInterval)initWithLabel:(id)a3;
- (jetsam_info)currentInfo;
- (jetsam_info)startInfo;
- (void)logCurrentInterval;
- (void)reset;
@end

@implementation PFLJetsamInfoInterval

- (PFLJetsamInfoInterval)initWithLabel:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFLJetsamInfoInterval;
  v6 = [(PFLJetsamInfoInterval *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    uint64_t v8 = objc_opt_new();
    fetcher = v7->_fetcher;
    v7->_fetcher = (PFLJetsamInfoFetcher *)v8;

    if ([(PFLJetsamInfoFetcher *)v7->_fetcher getInfo:&v7->_startInfo])
    {
      if ([(PFLJetsamInfoFetcher *)v7->_fetcher resetInterval])
      {
        v10 = pfl_jetsam_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          label = v7->_label;
          double v12 = (double)v7->_startInfo.currentKB * 0.0009765625;
          *(_DWORD *)buf = 138412546;
          v16 = label;
          __int16 v17 = 2048;
          double v18 = v12;
          _os_log_impl(&dword_259336000, v10, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f", buf, 0x16u);
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
  return (jetsam_info *)-[PFLJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:");
}

- (void)logCurrentInterval
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v7 = 0;
  if ([(PFLJetsamInfoFetcher *)self->_fetcher getInfo:v6])
  {
    v3 = pfl_jetsam_log();
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
      _os_log_impl(&dword_259336000, v3, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f, max: %.3f, end: %.3f", buf, 0x2Au);
    }
  }
}

- (void)reset
{
  [(PFLJetsamInfoFetcher *)self->_fetcher getInfo:&self->_startInfo];
  fetcher = self->_fetcher;
  [(PFLJetsamInfoFetcher *)fetcher resetInterval];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end