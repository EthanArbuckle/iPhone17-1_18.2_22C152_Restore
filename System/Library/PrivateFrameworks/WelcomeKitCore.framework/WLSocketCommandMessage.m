@interface WLSocketCommandMessage
- (NSString)command;
- (WLSocketCommandMessage)initWithCommandString:(id)a3;
- (void)setCommand:(id)a3;
@end

@implementation WLSocketCommandMessage

- (WLSocketCommandMessage)initWithCommandString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLSocketCommandMessage;
  v5 = [(WLSocketMessage *)&v8 initWithType:1];
  v6 = v5;
  if (v5) {
    [(WLSocketCommandMessage *)v5 setCommand:v4];
  }

  return v6;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end