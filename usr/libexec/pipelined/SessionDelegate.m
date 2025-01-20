@interface SessionDelegate
- (SessionDelegate)initWithUploadDb:(void *)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSessionDidFinishEventsForBackgroundURLSession;
@end

@implementation SessionDelegate

- (SessionDelegate)initWithUploadDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SessionDelegate;
  result = [(SessionDelegate *)&v5 init];
  if (result) {
    result->_uploadDb = a3;
  }
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  uploadDb = self->_uploadDb;
  v14 = *((void *)uploadDb + 96);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034CFA8;
  block[3] = &unk_100469238;
  id v18 = v11;
  id v19 = v12;
  v20 = uploadDb;
  int64_t v21 = a6;
  int64_t v22 = a7;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v14, block);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession
{
  NSLog(@"Received notification that it finished events for background URL session", a2);
  if (qword_10047BED8 == -1)
  {
    v2 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_100469320);
    v2 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      return;
    }
  }
  *(_WORD *)v3 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finish background event invoked", v3, 2u);
}

@end