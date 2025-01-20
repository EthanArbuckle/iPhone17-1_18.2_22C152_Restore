@interface MSUBrainDelegateImpl_softwareupdated
+ (id)sharedInstance;
- (MSUBrainDelegateImpl_softwareupdated)init;
- (Protocol)brainProtocol;
- (Protocol)delegateProtocol;
- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
@end

@implementation MSUBrainDelegateImpl_softwareupdated

- (MSUBrainDelegateImpl_softwareupdated)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSUBrainDelegateImpl_softwareupdated;
  result = [(MSUBrainDelegateImpl_softwareupdated *)&v3 init];
  if (result)
  {
    result->_brainProtocol = (Protocol *)&OBJC_PROTOCOL___MSUBrainNSXPCInterface;
    result->_delegateProtocol = (Protocol *)&OBJC_PROTOCOL___MSUBrainDelegateNSXPCInterface;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_10);
  }
  return (id)sharedInstance___instance_0;
}

- (void)connectionInterrupted
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Got connectionInterrupted notification", v1, 2u);
}

- (void)connectionInvalidated
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Got connectionInvalidated notification", v1, 2u);
}

- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6
{
  if (a6)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not implemented", a4, a5, "-[MSUBrainDelegateImpl_softwareupdated _nsxpcInvoke:args:options:completion:]", NSDebugDescriptionErrorKey);
    (*((void (**)(id, NSError *, void))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1300, +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1]), 0);
  }
}

- (Protocol)brainProtocol
{
  return self->_brainProtocol;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

@end