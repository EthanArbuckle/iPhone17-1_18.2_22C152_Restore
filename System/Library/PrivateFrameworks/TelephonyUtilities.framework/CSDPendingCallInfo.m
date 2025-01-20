@interface CSDPendingCallInfo
- (CSDPendingCallInfo)initWithCallSource:(id)a3 withCallUpdate:(id)a4 withProvider:(id)a5 callUUID:(id)a6;
- (CXCallSource)callSource;
- (CXCallUpdate)callUpdate;
- (NSUUID)callUUID;
- (TUCallProvider)provider;
@end

@implementation CSDPendingCallInfo

- (CSDPendingCallInfo)initWithCallSource:(id)a3 withCallUpdate:(id)a4 withProvider:(id)a5 callUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSDPendingCallInfo;
  v15 = [(CSDPendingCallInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_callSource, a3);
    objc_storeStrong((id *)&v16->_callUpdate, a4);
    objc_storeStrong((id *)&v16->_provider, a5);
    objc_storeStrong((id *)&v16->_callUUID, a6);
  }

  return v16;
}

- (CXCallSource)callSource
{
  return self->_callSource;
}

- (CXCallUpdate)callUpdate
{
  return self->_callUpdate;
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_callUpdate, 0);

  objc_storeStrong((id *)&self->_callSource, 0);
}

@end