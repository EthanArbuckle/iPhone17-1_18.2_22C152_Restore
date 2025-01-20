@interface IPCNavigationActionReply
- (BOOL)success;
- (IPCNavigationActionReply)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryValue;
- (unint64_t)navigationActionError;
- (void)setNavigationActionError:(unint64_t)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation IPCNavigationActionReply

- (IPCNavigationActionReply)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPCNavigationActionReply;
  v5 = [(IPCMessageObject *)&v9 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCNavigationActionReplySuccessKey"];
    -[IPCNavigationActionReply setSuccess:](v5, "setSuccess:", [v6 BOOLValue]);

    v7 = [v4 objectForKeyedSubscript:@"kIPCNavigationActionReplyNavigationActionErrorKey"];
    -[IPCNavigationActionReply setNavigationActionError:](v5, "setNavigationActionError:", [v7 unsignedIntegerValue]);
  }
  return v5;
}

- (id)dictionaryValue
{
  v9.receiver = self;
  v9.super_class = (Class)IPCNavigationActionReply;
  v3 = [(IPCMessageObject *)&v9 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithBool:[(IPCNavigationActionReply *)self success]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCNavigationActionReplySuccessKey"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(IPCNavigationActionReply *)self navigationActionError]];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCNavigationActionReplyNavigationActionErrorKey"];

  id v7 = [v4 copy];

  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCNavigationActionReply;
  v3 = [(IPCNavigationActionReply *)&v7 description];
  id v4 = [(IPCNavigationActionReply *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (unint64_t)navigationActionError
{
  return self->_navigationActionError;
}

- (void)setNavigationActionError:(unint64_t)a3
{
  self->_navigationActionError = a3;
}

@end