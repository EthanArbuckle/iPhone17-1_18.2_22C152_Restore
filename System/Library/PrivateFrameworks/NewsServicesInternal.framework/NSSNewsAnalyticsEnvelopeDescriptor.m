@interface NSSNewsAnalyticsEnvelopeDescriptor
- (NSSNewsAnalyticsEnvelopeDescriptor)init;
- (NSSNewsAnalyticsEnvelopeDescriptor)initWithContentType:(int)a3 contentTypeVersion:(int)a4 contentTypeMinorVersion:(int)a5 contentTypePatchVersion:(int)a6;
- (int)contentType;
- (int)contentTypeMinorVersion;
- (int)contentTypePatchVersion;
- (int)contentTypeVersion;
@end

@implementation NSSNewsAnalyticsEnvelopeDescriptor

- (NSSNewsAnalyticsEnvelopeDescriptor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsAnalyticsEnvelopeDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NSSNewsAnalyticsPBEventAccumulator.m";
    __int16 v11 = 1024;
    int v12 = 32;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSNewsAnalyticsEnvelopeDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSSNewsAnalyticsEnvelopeDescriptor)initWithContentType:(int)a3 contentTypeVersion:(int)a4 contentTypeMinorVersion:(int)a5 contentTypePatchVersion:(int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NSSNewsAnalyticsEnvelopeDescriptor;
  result = [(NSSNewsAnalyticsEnvelopeDescriptor *)&v11 init];
  if (result)
  {
    result->_contentType = a3;
    result->_contentTypeVersion = a4;
    result->_contentTypeMinorVersion = a5;
    result->_contentTypePatchVersion = a6;
  }
  return result;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)contentTypeVersion
{
  return self->_contentTypeVersion;
}

- (int)contentTypeMinorVersion
{
  return self->_contentTypeMinorVersion;
}

- (int)contentTypePatchVersion
{
  return self->_contentTypePatchVersion;
}

@end