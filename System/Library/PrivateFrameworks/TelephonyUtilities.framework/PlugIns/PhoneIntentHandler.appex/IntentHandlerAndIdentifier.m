@interface IntentHandlerAndIdentifier
- (IntentHandlerAndIdentifier)initWithHandler:(id)a3 intentIdentifier:(id)a4;
- (NSString)intentIdentifier;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setIntentIdentifier:(id)a3;
@end

@implementation IntentHandlerAndIdentifier

- (IntentHandlerAndIdentifier)initWithHandler:(id)a3 intentIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IntentHandlerAndIdentifier;
  v9 = [(IntentHandlerAndIdentifier *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    intentIdentifier = v9->_intentIdentifier;
    v9->_intentIdentifier = v10;

    objc_storeStrong(&v9->_handler, a3);
  }

  return v9;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (void)setIntentIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

@end