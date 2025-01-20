@interface SKHandleInvitability
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (BOOL)isInvitable;
- (BOOL)wasRemoved;
- (SKHandleInvitability)initWithCoder:(id)a3;
- (SKHandleInvitability)initWithIsInvitable:(BOOL)a3 wasRemoved:(BOOL)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKHandleInvitability

- (SKHandleInvitability)initWithIsInvitable:(BOOL)a3 wasRemoved:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKHandleInvitability;
  result = [(SKHandleInvitability *)&v7 init];
  if (result)
  {
    result->_isInvitable = a3;
    result->_wasRemoved = a4;
  }
  return result;
}

+ (id)logger
{
  if (logger_onceToken_7 != -1) {
    dispatch_once(&logger_onceToken_7, &__block_literal_global_7);
  }
  v2 = (void *)logger__logger_7;
  return v2;
}

uint64_t __30__SKHandleInvitability_logger__block_invoke()
{
  logger__logger_7 = (uint64_t)os_log_create("com.apple.StatusKit", "SKHandleInvitability");
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; isInvitable = \"%d\"; wasRemoved = \"%d\">;",
               objc_opt_class(),
               self,
               [(SKHandleInvitability *)self isInvitable],
               [(SKHandleInvitability *)self wasRemoved]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isInvitable = self->_isInvitable;
  id v5 = a3;
  [v5 encodeBool:isInvitable forKey:@"IsInvitable"];
  [v5 encodeBool:self->_wasRemoved forKey:@"WasRemoved"];
}

- (SKHandleInvitability)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"IsInvitable"];
  uint64_t v6 = [v4 decodeBoolForKey:@"WasRemoved"];

  return [(SKHandleInvitability *)self initWithIsInvitable:v5 wasRemoved:v6];
}

- (BOOL)isInvitable
{
  return self->_isInvitable;
}

- (BOOL)wasRemoved
{
  return self->_wasRemoved;
}

@end