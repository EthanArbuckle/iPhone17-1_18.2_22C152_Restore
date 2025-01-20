@interface SMCMNoMovementStateUpdate
+ (id)convertSMCMNoMovementStateToString:(int64_t)a3;
- (NSDate)startTime;
- (SMCMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(id)a4;
- (id)description;
- (int64_t)state;
@end

@implementation SMCMNoMovementStateUpdate

- (SMCMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SMCMNoMovementStateUpdate;
  v8 = [(SMCMNoMovementStateUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_startTime, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = +[SMCMNoMovementStateUpdate convertSMCMNoMovementStateToString:[(SMCMNoMovementStateUpdate *)self state]];
  id v7 = [(SMCMNoMovementStateUpdate *)self startTime];
  v8 = [v7 stringFromDate];
  v9 = [v3 stringWithFormat:@"<%@: %p, state: %@, startTime: %@>", v5, self, v6, v8];

  return v9;
}

+ (id)convertSMCMNoMovementStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9A140[a3];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
}

@end