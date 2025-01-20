@interface PLBackgroundJobStatusRegistrationEvent
- (BOOL)registeredActivity;
- (NSArray)workersResponsible;
- (NSString)registeredPriorities;
- (id)statusDump;
- (void)setRegisteredActivity:(BOOL)a3;
- (void)setRegisteredPriorities:(id)a3;
- (void)setWorkersResponsible:(id)a3;
@end

@implementation PLBackgroundJobStatusRegistrationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workersResponsible, 0);
  objc_storeStrong((id *)&self->_registeredPriorities, 0);
}

- (void)setWorkersResponsible:(id)a3
{
}

- (NSArray)workersResponsible
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegisteredPriorities:(id)a3
{
}

- (NSString)registeredPriorities
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegisteredActivity:(BOOL)a3
{
  self->_registeredActivity = a3;
}

- (BOOL)registeredActivity
{
  return self->_registeredActivity;
}

- (id)statusDump
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(PLBackgroundJobStatusRegistrationEvent *)self registeredActivity])
  {
    v4 = [(PLBackgroundJobStatusRegistrationEvent *)self registeredPriorities];
    [v3 appendFormat:@"%@ activity registered by ", v4];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(PLBackgroundJobStatusRegistrationEvent *)self workersResponsible];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 appendFormat:@"%@ ", *(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [v3 appendString:@"All workers reported no work to do"];
  }
  v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobStatusRegistrationEvent;
  v11 = [(PLBackgroundJobStatusEvent *)&v14 statusDump];
  v12 = [v10 stringWithFormat:@"%@ - %@\n", v11, v3];

  return v12;
}

@end