@interface CLTimeZoneManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLTimeZoneManagerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)manager;
- (void)setManager:(void *)a3;
@end

@implementation CLTimeZoneManagerAdapter

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
  if (qword_10247EE08 != -1) {
    dispatch_once(&qword_10247EE08, &stru_1022D3850);
  }
  return (id)qword_10247EE00;
}

- (CLTimeZoneManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTimeZoneManagerAdapter;
  return [(CLTimeZoneManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTimeZoneManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLTimeZoneManagerClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
}

+ (BOOL)isSupported
{
  if (qword_10247EE10 != -1) {
    dispatch_once(&qword_10247EE10, &stru_1022D3870);
  }
  return qword_10247EE18 != 0;
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

@end