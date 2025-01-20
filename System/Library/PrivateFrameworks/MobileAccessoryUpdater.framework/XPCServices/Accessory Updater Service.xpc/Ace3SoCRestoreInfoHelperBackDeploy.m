@interface Ace3SoCRestoreInfoHelperBackDeploy
- (Ace3SoCRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation Ace3SoCRestoreInfoHelperBackDeploy

- (Ace3SoCRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)Ace3SoCRestoreInfoHelperBackDeploy;
  v9 = [(Ace3SoCRestoreInfoHelperBackDeploy *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = [v8 objectForKeyedSubscript:@"Options"];
    v12 = [v11 objectForKeyedSubscript:@"Verbose"];

    if (v12) {
      v10->_verbose = 1;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [(Ace3SoCRestoreInfoHelperBackDeploy *)v10 verboseLog:@"%@: options = %@", v14, v8];
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
  [(Ace3SoCRestoreInfoHelperBackDeploy *)self logInternal:a3 arguments:&v3];
}

- (void)verboseLog:(id)a3
{
  if (self->_verbose) {
    [(Ace3SoCRestoreInfoHelperBackDeploy *)self logInternal:a3 arguments:&v3];
  }
}

@end