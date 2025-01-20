@interface _PXDiagnosticsNotificationReplyHandle
- (_PXDiagnosticsNotificationReplyHandle)initWithIDNumber:(int64_t)a3 replyBlock:(id)a4;
- (id)replyBlock;
- (int64_t)idNumber;
- (void)replyWithInfo:(id)a3;
@end

@implementation _PXDiagnosticsNotificationReplyHandle

- (void).cxx_destruct
{
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (int64_t)idNumber
{
  return self->_idNumber;
}

- (void)replyWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(_PXDiagnosticsNotificationReplyHandle *)self replyBlock];
  v5[2](v5, [(_PXDiagnosticsNotificationReplyHandle *)self idNumber], v4);
}

- (_PXDiagnosticsNotificationReplyHandle)initWithIDNumber:(int64_t)a3 replyBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXDiagnosticsNotificationReplyHandle;
  v7 = [(_PXDiagnosticsNotificationReplyHandle *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_idNumber = a3;
    uint64_t v9 = [v6 copy];
    id replyBlock = v8->_replyBlock;
    v8->_id replyBlock = (id)v9;
  }
  return v8;
}

@end