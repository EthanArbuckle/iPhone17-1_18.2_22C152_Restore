@interface CLMotionCuesServiceAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLMotionCuesServiceAdapter)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
@end

@implementation CLMotionCuesServiceAdapter

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
  if (qword_10247AD20 != -1) {
    dispatch_once(&qword_10247AD20, &stru_1022B5C58);
  }
  return (id)qword_10247AD18;
}

- (CLMotionCuesServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionCuesServiceAdapter;
  return [(CLMotionCuesServiceAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionCuesServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionCuesServiceClientProtocol];
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
}

- (void)endService
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end