@interface MXService
- (BOOL)diagnosticsSupported;
- (BOOL)isStarted;
- (BOOL)metricsSupported;
- (BOOL)startService;
- (BOOL)stopService;
- (MXService)init;
- (MXService)initWithSourceID:(int64_t)a3;
- (NSString)currentClient;
- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4;
- (id)getMetricsForClient:(id)a3;
- (id)pruneSourceData:(id)a3;
- (int64_t)sourceID;
- (void)setCurrentClient:(id)a3;
@end

@implementation MXService

- (MXService)init
{
  return [(MXService *)self initWithSourceID:0];
}

- (MXService)initWithSourceID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXService;
  result = [(MXService *)&v5 init];
  if (result)
  {
    result->_isStarted = 0;
    result->_sourceID = a3;
  }
  return result;
}

- (id)getMetricsForClient:(id)a3
{
  return 0;
}

- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4
{
  return 0;
}

- (BOOL)startService
{
  BOOL isStarted = self->_isStarted;
  if (!self->_isStarted) {
    self->_BOOL isStarted = 1;
  }
  return !isStarted;
}

- (BOOL)stopService
{
  BOOL isStarted = self->_isStarted;
  if (self->_isStarted) {
    self->_BOOL isStarted = 0;
  }
  return isStarted;
}

- (BOOL)metricsSupported
{
  return 0;
}

- (BOOL)diagnosticsSupported
{
  return 0;
}

- (id)pruneSourceData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v26 = a3;
  v4 = +[MXUtilities getServicesAllowlist];
  objc_super v5 = objc_msgSend(&unk_26EB8AAA8, "objectAtIndexedSubscript:", -[MXService sourceID](self, "sourceID"));
  v25 = [v4 objectForKeyedSubscript:v5];

  unsigned int outCount = 0;
  v6 = (objc_class *)objc_opt_class();
  v27 = class_copyPropertyList(v6, &outCount);
  if (outCount)
  {
    unint64_t v8 = 0;
    *(void *)&long long v7 = 138412546;
    long long v24 = v7;
    do
    {
      Name = property_getName(v27[v8]);
      if (Name)
      {
        v10 = objc_msgSend(NSString, "stringWithCString:encoding:", Name, objc_msgSend(NSString, "defaultCStringEncoding", v24));
        v11 = [v25 allKeys];
        int v12 = [v11 containsObject:v10];

        if (v12)
        {
          v13 = [v26 valueForKey:v10];
          v14 = [v25 objectForKeyedSubscript:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            unsigned int v28 = 0;
            v16 = (objc_class *)objc_opt_class();
            v17 = class_copyPropertyList(v16, &v28);
            if (v28)
            {
              for (unint64_t i = 0; i < v28; ++i)
              {
                v19 = property_getName(v17[i]);
                if (v19)
                {
                  v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, objc_msgSend(NSString, "defaultCStringEncoding"));
                  v21 = [v15 allKeys];
                  char v22 = [v21 containsObject:v20];

                  if ((v22 & 1) == 0) {
                    [v13 setValue:0 forKey:v20];
                  }
                }
              }
            }
            free(v17);
          }
          [v26 setValue:v13 forKey:v10];
        }
        else
        {
          [v26 setValue:0 forKey:v10];
        }
      }
      ++v8;
    }
    while (v8 < outCount);
  }
  free(v27);

  return v26;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (NSString)currentClient
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end