@interface _AddDialogsContextPair
- (NSCopying)context;
- (SAAceCommand)command;
- (_AddDialogsContextPair)initWithCommand:(id)a3 context:(id)a4;
@end

@implementation _AddDialogsContextPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

- (NSCopying)context
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (SAAceCommand)command
{
  return (SAAceCommand *)objc_getProperty(self, a2, 8, 1);
}

- (_AddDialogsContextPair)initWithCommand:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AddDialogsContextPair;
  v9 = [(_AddDialogsContextPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

@end