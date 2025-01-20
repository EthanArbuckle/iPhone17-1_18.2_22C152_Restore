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
  return (id)[a1 errorWithCode:a3 underlyingErrors:MEMORY[0x263EFFA68]];
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v5 count]) {
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F083F0]];
  }
  v7 = [MEMORY[0x263F087E8] errorWithDomain:SCDaemonErrorDomain code:a3 userInfo:v6];

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
    v4 = [MEMORY[0x263EFF980] array];
    [(SCDaemonError *)v3 setUnderlyingErrors:v4];
  }
  return v3;
}

- (id)toError
{
  if ([(SCDaemonError *)self code]
    || ([(SCDaemonError *)self underlyingErrors],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
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