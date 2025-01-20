@interface PDCloudStoreShareInvitationRequestGenericResponse
- (BOOL)success;
- (NSError)error;
- (PDCloudStoreShareInvitationRequestGenericResponse)initWithSuccess:(BOOL)a3 error:(id)a4;
- (unint64_t)type;
@end

@implementation PDCloudStoreShareInvitationRequestGenericResponse

- (PDCloudStoreShareInvitationRequestGenericResponse)initWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDCloudStoreShareInvitationRequestGenericResponse;
  v8 = [(PDCloudStoreShareInvitationRequestGenericResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return 0;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
}

@end