@interface REMMigrationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isObserver;
- (NSString)log;
- (NSString)state;
- (REMMigrationResult)initWithCoder:(id)a3;
- (REMMigrationResult)initWithState:(id)a3 IsObserver:(BOOL)a4 timeElapsed:(double)a5 listsMigrated:(unint64_t)a6 remindersMigrated:(unint64_t)a7 log:(id)a8;
- (double)timeElapsed;
- (id)description;
- (unint64_t)listsMigrated;
- (unint64_t)remindersMigrated;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMMigrationResult

- (REMMigrationResult)initWithState:(id)a3 IsObserver:(BOOL)a4 timeElapsed:(double)a5 listsMigrated:(unint64_t)a6 remindersMigrated:(unint64_t)a7 log:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)REMMigrationResult;
  v17 = [(REMMigrationResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_state, a3);
    v18->_isObserver = a4;
    v18->_timeElapsed = a5;
    v18->_listsMigrated = a6;
    v18->_remindersMigrated = a7;
    objc_storeStrong((id *)&v18->_log, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMMigrationResult *)self state];
  [v4 encodeObject:v5 forKey:@"state"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMMigrationResult isObserver](self, "isObserver"), @"isObserver");
  [(REMMigrationResult *)self timeElapsed];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeElapsed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMMigrationResult listsMigrated](self, "listsMigrated"), @"listsMigrated");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMMigrationResult remindersMigrated](self, "remindersMigrated"), @"remindersMigrated");
  id v6 = [(REMMigrationResult *)self log];
  [v4 encodeObject:v6 forKey:@"log"];
}

- (REMMigrationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isObserver"];
  [v4 decodeDoubleForKey:@"timeElapsed"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"listsMigrated"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"remindersMigrated"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"log"];

  v12 = [(REMMigrationResult *)self initWithState:v5 IsObserver:v6 timeElapsed:v9 listsMigrated:v10 remindersMigrated:v11 log:v8];
  return v12;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p ("), v5, self;

  double v7 = [(REMMigrationResult *)self state];
  [v6 appendFormat:@"state: %@, ", v7];

  double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[REMMigrationResult isObserver](self, "isObserver"));
  [v6 appendFormat:@"isObserver: %@, ", v8];

  uint64_t v9 = NSNumber;
  [(REMMigrationResult *)self timeElapsed];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  [v6 appendFormat:@"timeElapsed: %@, ", v10];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REMMigrationResult listsMigrated](self, "listsMigrated"));
  [v6 appendFormat:@"listsMigrated: %@, ", v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REMMigrationResult remindersMigrated](self, "remindersMigrated"));
  [v6 appendFormat:@"remindersMigrated: %@, ", v12];

  v13 = [(REMMigrationResult *)self log];
  [v6 appendFormat:@"log: %@>"], v13);

  return v6;
}

- (NSString)state
{
  return self->_state;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (double)timeElapsed
{
  return self->_timeElapsed;
}

- (unint64_t)listsMigrated
{
  return self->_listsMigrated;
}

- (unint64_t)remindersMigrated
{
  return self->_remindersMigrated;
}

- (NSString)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end