@interface ContextState
- (BOOL)dataPreferred;
- (NSString)registrationState;
- (NSString)signalBarState;
- (id)init:(unint64_t)a3 mnc:(int64_t)a4 mcc:(int64_t)a5 dataPreferred:(BOOL)a6 signalBarState:(id)a7 registrationState:(id)a8;
- (int64_t)mcc;
- (int64_t)mnc;
- (unint64_t)startTime;
- (void)setDataPreferred:(BOOL)a3;
- (void)setMcc:(int64_t)a3;
- (void)setMnc:(int64_t)a3;
- (void)setRegistrationState:(id)a3;
- (void)setSignalBarState:(id)a3;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation ContextState

- (id)init:(unint64_t)a3 mnc:(int64_t)a4 mcc:(int64_t)a5 dataPreferred:(BOOL)a6 signalBarState:(id)a7 registrationState:(id)a8
{
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)ContextState;
  v16 = [(ContextState *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(ContextState *)v16 setStartTime:a3];
    [(ContextState *)v17 setMnc:a4];
    [(ContextState *)v17 setMcc:a5];
    [(ContextState *)v17 setDataPreferred:v9];
    [(ContextState *)v17 setSignalBarState:v14];
    [(ContextState *)v17 setRegistrationState:v15];
  }

  return v17;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (int64_t)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int64_t)a3
{
  self->_mnc = a3;
}

- (int64_t)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int64_t)a3
{
  self->_mcc = a3;
}

- (BOOL)dataPreferred
{
  return self->_dataPreferred;
}

- (void)setDataPreferred:(BOOL)a3
{
  self->_dataPreferred = a3;
}

- (NSString)signalBarState
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignalBarState:(id)a3
{
}

- (NSString)registrationState
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegistrationState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationState, 0);

  objc_storeStrong((id *)&self->_signalBarState, 0);
}

@end