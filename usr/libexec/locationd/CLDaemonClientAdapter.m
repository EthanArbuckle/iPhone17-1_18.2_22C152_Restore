@interface CLDaemonClientAdapter
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLDaemonClientAdapter)initWithDaemonClient:(void *)a3;
- (void)client;
- (void)setClient:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonClientAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLDaemonClientAdapter)initWithDaemonClient:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLDaemonClientAdapter;
  result = [(CLDaemonClientAdapter *)&v5 init];
  if (result) {
    result->_client = a3;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

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

- (void)client
{
  return self->_client;
}

- (void)setClient:(void *)a3
{
  self->_client = a3;
}

@end