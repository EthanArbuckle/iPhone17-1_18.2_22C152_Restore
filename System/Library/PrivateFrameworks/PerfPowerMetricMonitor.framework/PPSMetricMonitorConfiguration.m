@interface PPSMetricMonitorConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
+ (id)instrumentsConfiguration;
- (BOOL)emitSignposts;
- (BOOL)includeBackBoardUsage;
- (BOOL)updateDelegate;
- (PPSMetricMonitorConfiguration)initWithCoder:(id)a3;
- (PPSMetricMonitorConfiguration)initWithMode:(int64_t)a3 updateInterval:(double)a4 updateDelegate:(BOOL)a5;
- (double)updateInterval;
- (id)description;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)setEmitSignposts:(BOOL)a3;
- (void)setIncludeBackBoardUsage:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setUpdateDelegate:(BOOL)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation PPSMetricMonitorConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMode:0 updateInterval:1 updateDelegate:0.2];
  return v2;
}

+ (id)instrumentsConfiguration
{
  v2 = objc_opt_class();
  return (id)[v2 defaultConfiguration];
}

- (PPSMetricMonitorConfiguration)initWithMode:(int64_t)a3 updateInterval:(double)a4 updateDelegate:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PPSMetricMonitorConfiguration;
  result = [(PPSMetricMonitorConfiguration *)&v9 init];
  if (result)
  {
    result->_mode = a3;
    result->_updateInterval = a4;
    result->_updateDelegate = a5;
    *(_WORD *)&result->_includeBackBoardUsage = 256;
  }
  return result;
}

- (PPSMetricMonitorConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSMetricMonitorConfiguration;
  v5 = [(PPSMetricMonitorConfiguration *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    v5->_mode = (int)[v6 intValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateInterval"];
    [v7 doubleValue];
    v5->_updateInterval = v8;

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateDelegate"];
    v5->_updateDelegate = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeBackBoardUsage"];
    v5->_includeBackBoardUsage = [v10 BOOLValue];

    v5->_emitSignposts = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", -[PPSMetricMonitorConfiguration mode](self, "mode"));
  [v5 encodeObject:v6 forKey:@"mode"];

  v7 = NSNumber;
  [(PPSMetricMonitorConfiguration *)self updateInterval];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v5 encodeObject:v8 forKey:@"updateInterval"];

  objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"));
  [v5 encodeObject:v9 forKey:@"updateDelegate"];

  objc_msgSend(NSNumber, "numberWithBool:", -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v10 forKey:@"includeBackBoardUsage"];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(PPSMetricMonitorConfiguration *)self mode];
  [(PPSMetricMonitorConfiguration *)self updateInterval];
  return (id)[v3 stringWithFormat:@"PPSMetricMonitorConfig(mode: %ld updateInterval: %f updateDelegate: %d includeBackBoardUsage: %d)"], v4, v5, -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"), -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)updateDelegate
{
  return self->_updateDelegate;
}

- (void)setUpdateDelegate:(BOOL)a3
{
  self->_updateDelegate = a3;
}

- (BOOL)includeBackBoardUsage
{
  return self->_includeBackBoardUsage;
}

- (void)setIncludeBackBoardUsage:(BOOL)a3
{
  self->_includeBackBoardUsage = a3;
}

- (BOOL)emitSignposts
{
  return self->_emitSignposts;
}

- (void)setEmitSignposts:(BOOL)a3
{
  self->_emitSignposts = a3;
}

@end