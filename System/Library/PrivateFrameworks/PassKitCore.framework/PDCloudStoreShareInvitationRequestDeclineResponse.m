@interface PDCloudStoreShareInvitationRequestDeclineResponse
- (PDCloudStoreShareInvitationRequestDeclineResponse)initWithPriorPermission:(int64_t)a3 success:(BOOL)a4 error:(id)a5;
- (int64_t)priorPermission;
- (unint64_t)type;
@end

@implementation PDCloudStoreShareInvitationRequestDeclineResponse

- (PDCloudStoreShareInvitationRequestDeclineResponse)initWithPriorPermission:(int64_t)a3 success:(BOOL)a4 error:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PDCloudStoreShareInvitationRequestDeclineResponse;
  result = [(PDCloudStoreShareInvitationRequestGenericResponse *)&v7 initWithSuccess:a4 error:a5];
  if (result) {
    result->_priorPermission = a3;
  }
  return result;
}

- (unint64_t)type
{
  return 2;
}

- (int64_t)priorPermission
{
  return self->_priorPermission;
}

@end