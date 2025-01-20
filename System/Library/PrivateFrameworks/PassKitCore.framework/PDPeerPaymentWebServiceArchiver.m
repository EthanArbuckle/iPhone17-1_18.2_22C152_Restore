@interface PDPeerPaymentWebServiceArchiver
- (PDPeerPaymentWebServiceArchiver)initWithQueue:(id)a3;
- (void)archiveContext:(id)a3;
@end

@implementation PDPeerPaymentWebServiceArchiver

- (PDPeerPaymentWebServiceArchiver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentWebServiceArchiver;
  v6 = [(PDPeerPaymentWebServiceArchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10046D69C;
    block[3] = &unk_10072E1E8;
    v10 = v4;
    dispatch_async(queue, block);
    v7 = v10;
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error: We don't support archiving nil contexts!", v8, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end