@interface PDRemoteAlertHandle
- (NSString)description;
- (PDRemoteAlertHandle)init;
- (void)dealloc;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation PDRemoteAlertHandle

- (PDRemoteAlertHandle)init
{
  return 0;
}

- (void)dealloc
{
  sub_100224394((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PDRemoteAlertHandle;
  [(PDRemoteAlertHandle *)&v3 dealloc];
}

- (NSString)description
{
  result = (NSString *)objc_alloc((Class)NSString);
  unint64_t interfaceType = self->_interfaceType;
  if (interfaceType >= 0xF)
  {
    __break(1u);
  }
  else
  {
    v5 = -[NSString initWithFormat:](result, "initWithFormat:", @"<PDRemoteAlertHandle: %p; interface: %@; sbsHandle: %p>",
           self,
           *(&off_100741588 + interfaceType),
           self->_handle);
    return v5;
  }
  return result;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t interfaceType = self->_interfaceType;
    if (interfaceType >= 0xF)
    {
      __break(1u);
      return;
    }
    uint64_t v7 = (uint64_t)*(&off_100741588 + interfaceType);
    int v12 = 134218242;
    v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDRemoteAlertHandle (%p): %{public}@ activated.", (uint8_t *)&v12, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  v8 = self->_activationTracker;
  id completion = self->_completion;
  if (completion)
  {
    v10 = (void (**)(id, uint64_t))objc_retainBlock(completion);
    id v11 = self->_completion;
    self->_id completion = 0;
  }
  else
  {
    v10 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  sub_100223CE4((uint64_t)v8);
  if (v10) {
    v10[2](v10, 1);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_4;
  }
  unint64_t interfaceType = self->_interfaceType;
  if (interfaceType < 0xF)
  {
    uint64_t v7 = (uint64_t)*(&off_100741588 + interfaceType);
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDRemoteAlertHandle (%p): %{public}@ deactivated.", (uint8_t *)&v8, 0x16u);
LABEL_4:

    sub_100224394((uint64_t)self);
    return;
  }
  __break(1u);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    v9 = self;
    __int16 v10 = 2048;
    id v11 = a3;
    __int16 v12 = 2112;
    id v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDRemoteAlertHandle (%p): SBSRemoteAlertHandle %p invalidated with error %@.", (uint8_t *)&v8, 0x20u);
  }

  sub_100224394((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationTracker, 0);
  objc_storeStrong((id *)&self->_invalidationActions, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end