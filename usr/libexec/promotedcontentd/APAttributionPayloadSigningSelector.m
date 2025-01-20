@interface APAttributionPayloadSigningSelector
+ (id)selectorWithAttributionConfig;
- (APAttributionPayloadSigningSelector)initWithSigningPercentageFPDIValue:(unsigned int)a3;
- (int64_t)selectRandomSigningService;
- (unsigned)signingPercentageFPDI;
- (void)setSigningPercentageFPDI:(unsigned int)a3;
@end

@implementation APAttributionPayloadSigningSelector

+ (id)selectorWithAttributionConfig
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Loading attribution config", (uint8_t *)&v13, 2u);
  }

  v4 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  v5 = v4;
  if (v4
    && ([v4 signingPercentageFPDI], v6 = objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = [v5 signingPercentageFPDI];
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Using attribution config loaded value %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = [v5 signingPercentageFPDI];
    uint64_t v10 = (uint64_t)[v9 unsignedIntValue];
  }
  else
  {
    uint64_t v10 = 10000;
  }
  id v11 = [objc_alloc((Class)a1) initWithSigningPercentageFPDIValue:v10];

  return v11;
}

- (APAttributionPayloadSigningSelector)initWithSigningPercentageFPDIValue:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APAttributionPayloadSigningSelector;
  result = [(APAttributionPayloadSigningSelector *)&v5 init];
  if (result) {
    result->_signingPercentageFPDI = a3;
  }
  return result;
}

- (int64_t)selectRandomSigningService
{
  uint32_t v3 = arc4random_uniform(0x2710u);
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 67109120;
    LODWORD(v13) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Signging service selector random number chosen (%u)", (uint8_t *)&v12, 8u);
  }

  unsigned int v5 = [(APAttributionPayloadSigningSelector *)self signingPercentageFPDI];
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = @"FPDI service";
    if (v3 > v5) {
      v7 = @"Mescal service";
    }
    v8 = v7;
    unsigned int v9 = [(APAttributionPayloadSigningSelector *)self signingPercentageFPDI];
    int v12 = 138412546;
    int v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Selected [(%@)] for signing threshold (%d)", (uint8_t *)&v12, 0x12u);
  }
  if (v3 <= v5) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2;
  }

  return v10;
}

- (unsigned)signingPercentageFPDI
{
  return self->_signingPercentageFPDI;
}

- (void)setSigningPercentageFPDI:(unsigned int)a3
{
  self->_signingPercentageFPDI = a3;
}

@end