@interface CLActivityLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLActivityLoggerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)logData:(id)a3;
- (void)logger;
- (void)setLogger:(void *)a3;
@end

@implementation CLActivityLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247ABB8 != -1) {
    dispatch_once(&qword_10247ABB8, &stru_1022B4148);
  }
  return (id)qword_10247ABB0;
}

- (CLActivityLoggerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLActivityLoggerAdapter;
  return [(CLActivityLoggerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLActivityLoggerProtocol outboundProtocol:&OBJC_PROTOCOL___CLActivityLoggerClientProtocol];
}

+ (BOOL)isSupported
{
  sub_100103240();

  return sub_10016CCBC();
}

- (void)beginService
{
  self->_logger = (void *)sub_100492944((uint64_t)[(CLActivityLoggerAdapter *)self universe]);
}

- (void)endService
{
  logger = self->_logger;
  if (logger)
  {
    sub_1004932F0((uint64_t)logger);
    operator delete();
  }
  self->_logger = 0;
}

- (void)logData:(id)a3
{
  logger = (id *)self->_logger;
  if (logger)
  {
    [*logger silo];
    if (*((unsigned char *)logger + 72))
    {
      sub_10047D1E8(logger + 3, a3);
    }
  }
}

- (void)logger
{
  return self->_logger;
}

- (void)setLogger:(void *)a3
{
  self->_logger = a3;
}

@end