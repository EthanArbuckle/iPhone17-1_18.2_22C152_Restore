@interface SMMadridMessageResultWaitingForProcessing
- (BOOL)success;
- (NSError)error;
- (NSString)messageGUID;
- (SMMadridMessageResultWaitingForProcessing)initWithMessageGUID:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)setError:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation SMMadridMessageResultWaitingForProcessing

- (SMMadridMessageResultWaitingForProcessing)initWithMessageGUID:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)SMMadridMessageResultWaitingForProcessing;
    v11 = [(SMMadridMessageResultWaitingForProcessing *)&v16 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_messageGUID, a3);
      v12->_success = a4;
      objc_storeStrong((id *)&v12->_error, a5);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_messageGUID, 0);
}

@end