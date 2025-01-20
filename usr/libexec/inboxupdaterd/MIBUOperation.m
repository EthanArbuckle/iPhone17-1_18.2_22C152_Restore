@interface MIBUOperation
+ (unint64_t)currentOperationCode;
- (BOOL)inProgress;
- (BOOL)isCommandAllowed:(id)a3;
- (BOOL)saveOpCode;
- (MIBUOperation)initWithDelegate:(id)a3;
- (MIBUOperationDelegate)delegate;
- (NSDictionary)details;
- (NSError)error;
- (OS_dispatch_queue)syncQueue;
- (unint64_t)opCode;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setOpCode:(unint64_t)a3;
- (void)setSyncQueue:(id)a3;
- (void)terminateNow;
@end

@implementation MIBUOperation

+ (unint64_t)currentOperationCode
{
  v2 = +[MIBUDefaultPreferences objectForKey:@"CurrentOperation"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (MIBUOperation)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIBUOperation;
  v5 = [(MIBUOperation *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUOperation *)v5 setOpCode:0];
    [(MIBUOperation *)v6 setDelegate:v4];
    id v7 = +[NSString stringWithFormat:@"com.apple.mibu_%@_op_queue", objc_opt_class()];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    [(MIBUOperation *)v6 setSyncQueue:v8];

    error = v6->_error;
    v6->_error = 0;
  }
  return v6;
}

- (void)resume
{
  v3 = [(MIBUOperation *)self syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016F68;
  block[3] = &unk_100059D00;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)terminateNow
{
  v3 = [(MIBUOperation *)self syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FF8;
  block[3] = &unk_100059D00;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSDictionary)details
{
  return 0;
}

- (BOOL)inProgress
{
  unint64_t v3 = +[MIBUOperation currentOperationCode];
  if (v3) {
    LOBYTE(v3) = v3 == [(MIBUOperation *)self opCode];
  }
  return v3;
}

- (BOOL)saveOpCode
{
  v2 = +[NSNumber numberWithUnsignedInteger:[(MIBUOperation *)self opCode]];
  BOOL v3 = +[MIBUDefaultPreferences setObject:v2 forKey:@"CurrentOperation"];

  return v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)opCode
{
  return self->_opCode;
}

- (void)setOpCode:(unint64_t)a3
{
  self->_opCode = a3;
}

- (MIBUOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MIBUOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_error, 0);
}

@end