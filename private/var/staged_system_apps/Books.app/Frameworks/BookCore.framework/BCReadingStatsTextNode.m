@interface BCReadingStatsTextNode
- (BCCFI)cachedCFI;
- (void)didTurnIntoFault;
@end

@implementation BCReadingStatsTextNode

- (void)didTurnIntoFault
{
  cachedCFI = self->_cachedCFI;
  self->_cachedCFI = 0;

  v4.receiver = self;
  v4.super_class = (Class)BCReadingStatsTextNode;
  [(BCReadingStatsTextNode *)&v4 didTurnIntoFault];
}

- (BCCFI)cachedCFI
{
  v3 = [(BCReadingStatsTextNode *)self cfi];
  cachedCFI = self->_cachedCFI;
  if (cachedCFI) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v13 = 0;
    v7 = +[BCCFI cfiWithString:v3 error:&v13];
    id v8 = v13;
    v9 = self->_cachedCFI;
    self->_cachedCFI = v7;

    if (v8)
    {
      v10 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1EE178((uint64_t)v3, (uint64_t)v8, v10);
      }
    }

    cachedCFI = self->_cachedCFI;
  }
  v11 = cachedCFI;

  return v11;
}

- (void).cxx_destruct
{
}

@end