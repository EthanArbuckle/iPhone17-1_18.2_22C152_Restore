@interface NMGenericMessageLogAction
+ (id)logActionWithMessage:(id)a3;
- (NMGenericMessageLogAction)initWithMessage:(id)a3;
- (id)logMessage;
@end

@implementation NMGenericMessageLogAction

+ (id)logActionWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMessage:v4];

  return v5;
}

- (NMGenericMessageLogAction)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMGenericMessageLogAction;
  v6 = [(NMGenericMessageLogAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (id)logMessage
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end