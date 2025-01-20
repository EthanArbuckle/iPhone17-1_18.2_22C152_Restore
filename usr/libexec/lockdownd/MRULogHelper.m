@interface MRULogHelper
- (MRULogHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation MRULogHelper

- (MRULogHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MRULogHelper;
  result = [(MRULogHelper *)&v8 init];
  if (result)
  {
    result->_logFunction = a4;
    result->_logContext = a5;
    result->_verbose = 1;
  }
  return result;
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
  [(MRULogHelper *)self logInternal:a3 arguments:&v3];
}

- (void)verboseLog:(id)a3
{
  if (self->_verbose) {
    [(MRULogHelper *)self logInternal:a3 arguments:&v3];
  }
}

@end