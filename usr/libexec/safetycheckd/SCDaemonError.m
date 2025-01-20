@interface SCDaemonError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4;
- (NSMutableArray)underlyingErrors;
- (SCDaemonError)init;
- (id)toError;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
- (void)setUnderlyingErrors:(id)a3;
@end

@implementation SCDaemonError

+ (id)errorWithCode:(int64_t)a3
{
  return [a1 errorWithCode:a3 underlyingErrors:&__NSArray0__struct];
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableDictionary dictionary];
  if ([v5 count]) {
    [v6 setObject:v5 forKeyedSubscript:NSMultipleUnderlyingErrorsKey];
  }
  v7 = +[NSError errorWithDomain:SCDaemonErrorDomain code:a3 userInfo:v6];

  return v7;
}

- (SCDaemonError)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCDaemonError;
  v2 = [(SCDaemonError *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SCDaemonError *)v2 setCode:0];
    v4 = +[NSMutableArray array];
    [(SCDaemonError *)v3 setUnderlyingErrors:v4];
  }
  return v3;
}

- (id)toError
{
  if ([(SCDaemonError *)self code]
    || ([(SCDaemonError *)self underlyingErrors],
        v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        v4))
  {
    int64_t v5 = [(SCDaemonError *)self code];
    objc_super v6 = [(SCDaemonError *)self underlyingErrors];
    v7 = +[SCDaemonError errorWithCode:v5 underlyingErrors:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
  self->_underlyingErrors = (NSMutableArray *)a3;
}

@end