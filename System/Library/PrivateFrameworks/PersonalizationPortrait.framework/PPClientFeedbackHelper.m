@interface PPClientFeedbackHelper
- (NSString)clientIdentifier;
- (PPClientFeedbackHelper)initWithParentObject:(id)a3;
- (void)setClientIdentifier:(id)a3;
@end

@implementation PPClientFeedbackHelper

- (PPClientFeedbackHelper)initWithParentObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPClientFeedbackHelper;
  v5 = [(PPClientFeedbackHelper *)&v10 init];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    parentObjectClass = v5->_parentObjectClass;
    v5->_parentObjectClass = (NSString *)v7;
  }
  return v5;
}

- (void)setClientIdentifier:(id)a3
{
  id v10 = a3;
  if (![v10 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PPClientFeedbackHelper.m" lineNumber:18 description:@"clientIdentifier must not be nil or zero length"];
  }
  if ((unint64_t)[v10 length] >= 0xB)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPClientFeedbackHelper.m", 19, @"clientIdentifier was longer than %d characters.  Please choose a shorter identifer", 10);
  }
  v6 = self;
  objc_sync_enter(v6);
  if (([v10 isEqualToString:v6->_clientIdentifier] & 1) == 0)
  {
    if ([(NSString *)v6->_clientIdentifier length])
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v6, @"PPClientFeedbackHelper.m", 22, @"clientIdentifier cannot be set twice on the same %@ to different values.  It is currently set to \"%@\". If two different clients are needed in the same process, initialize with \"init\" instead of using \"defaultStore\"." object file lineNumber description], v6->_parentObjectClass, v6->_clientIdentifier);
    }
    objc_storeStrong((id *)&v6->_clientIdentifier, a3);
  }
  objc_sync_exit(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_parentObjectClass, 0);
}

- (NSString)clientIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clientIdentifier;
  objc_sync_exit(v2);

  return v3;
}

@end