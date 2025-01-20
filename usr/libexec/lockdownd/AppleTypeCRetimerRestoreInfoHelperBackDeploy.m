@interface AppleTypeCRetimerRestoreInfoHelperBackDeploy
- (AppleTypeCRetimerRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation AppleTypeCRetimerRestoreInfoHelperBackDeploy

- (AppleTypeCRetimerRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AppleTypeCRetimerRestoreInfoHelperBackDeploy;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v10 verboseLog:@"%@: options = %@", v12, v8];
  }
  return v10;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableString) initWithFormat:v6 arguments:a4];

  [v7 appendString:@"\n"];
  logFunction = (void (*)(void *, id))self->_logFunction;
  logContext = self->_logContext;
  id v10 = v7;
  logFunction(logContext, [v10 UTF8String]);
}

- (void)log:(id)a3
{
  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self logInternal:a3 arguments:&v3];
}

- (void)verboseLog:(id)a3
{
  if (self->_verbose) {
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self logInternal:a3 arguments:&v3];
  }
}

@end