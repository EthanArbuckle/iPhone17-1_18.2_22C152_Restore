@interface CXJoinCallAction
- (BOOL)isValidScreenSharingRequest;
- (TUScreenSharingRequest)tuScreenSharingRequest;
@end

@implementation CXJoinCallAction

- (TUScreenSharingRequest)tuScreenSharingRequest
{
  v3 = [(CXJoinCallAction *)self remoteMembers];
  v4 = [v3 anyObject];

  v5 = [v4 tuHandle];
  id v6 = 0;
  if ([(CXJoinCallAction *)self isValidScreenSharingRequest] && v5)
  {
    id v7 = [(CXJoinCallAction *)self screenShareRequestType];
    if (v7 == (id)1)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    if (v7 == (id)2)
    {
      uint64_t v8 = 1;
LABEL_7:
      id v6 = objc_msgSend(objc_alloc((Class)TUScreenSharingRequest), "initWithHandle:shareMyScreen:originType:shouldSendLegacyInvite:", v5, v8, 1, -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
      goto LABEL_9;
    }
    id v6 = 0;
  }
LABEL_9:

  return (TUScreenSharingRequest *)v6;
}

- (BOOL)isValidScreenSharingRequest
{
  if (![(CXJoinCallAction *)self screenShareRequestType]) {
    return 1;
  }
  v3 = [(CXJoinCallAction *)self remoteMembers];
  id v4 = [v3 count];

  if (v4 == (id)1) {
    return 1;
  }
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1003B1078((uint64_t)self, v6);
  }

  return 0;
}

@end