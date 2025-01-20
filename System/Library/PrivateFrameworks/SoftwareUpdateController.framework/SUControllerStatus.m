@interface SUControllerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)failForwardMode;
- (SUControllerStatus)init;
- (SUControllerStatus)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)managerState;
- (int64_t)updateState;
- (void)encodeWithCoder:(id)a3;
- (void)setFailForwardMode:(BOOL)a3;
- (void)setManagerState:(int64_t)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation SUControllerStatus

- (SUControllerStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUControllerStatus;
  result = [(SUControllerStatus *)&v3 init];
  if (result)
  {
    result->_failForwardMode = 0;
    result->_managerState = 0;
    result->_updateState = 0;
  }
  return result;
}

- (SUControllerStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUControllerStatus;
  v5 = [(SUControllerStatus *)&v7 init];
  if (v5)
  {
    v5->_managerState = [v4 decodeInt64ForKey:@"managerState"];
    v5->_updateState = [v4 decodeInt64ForKey:@"updateState"];
    v5->_failForwardMode = [v4 decodeBoolForKey:@"failForwardMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerStatus managerState](self, "managerState"), @"managerState");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerStatus updateState](self, "updateState"), @"updateState");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerStatus failForwardMode](self, "failForwardMode"), @"failForwardMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_super v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = SUControllerStringForManagerState([(SUControllerStatus *)self managerState]);
  v5 = SUControllerStringForManagerState([(SUControllerStatus *)self updateState]);
  BOOL v6 = [(SUControllerStatus *)self failForwardMode];
  objc_super v7 = @"NO";
  if (v6) {
    objc_super v7 = @"YES";
  }
  v8 = [v3 stringWithFormat:@"\n       ManagerState: %@\n        UpdateState: %@\n    FailForwardMode: %@\n", v4, v5, v7];

  return v8;
}

- (id)summary
{
  objc_super v3 = NSString;
  id v4 = SUControllerStringForManagerState([(SUControllerStatus *)self managerState]);
  v5 = SUControllerStringForManagerState([(SUControllerStatus *)self updateState]);
  BOOL v6 = [v3 stringWithFormat:@"%@(%@)", v4, v5];

  return v6;
}

- (int64_t)managerState
{
  return self->_managerState;
}

- (void)setManagerState:(int64_t)a3
{
  self->_managerState = a3;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (BOOL)failForwardMode
{
  return self->_failForwardMode;
}

- (void)setFailForwardMode:(BOOL)a3
{
  self->_failForwardMode = a3;
}

@end