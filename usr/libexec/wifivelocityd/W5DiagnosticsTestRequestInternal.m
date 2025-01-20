@interface W5DiagnosticsTestRequestInternal
- (BOOL)includeEvents;
- (NSArray)testRequests;
- (NSDictionary)configuration;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5DiagnosticsTestRequestInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reply;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setIncludeEvents:(BOOL)a3;
- (void)setReply:(id)a3;
- (void)setTestRequests:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5DiagnosticsTestRequestInternal

- (W5DiagnosticsTestRequestInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestRequestInternal;
  v2 = [(W5DiagnosticsTestRequestInternal *)&v5 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:@"com.apple.wifivelocity.W5DiagnosticsTestRequestInternal" transaction:v3];
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:self->_transaction];

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestRequestInternal;
  [(W5DiagnosticsTestRequestInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5DiagnosticsTestRequestInternal allocWithZone:a3] init];
  [(W5DiagnosticsTestRequestInternal *)v4 setUuid:self->_uuid];
  [(W5DiagnosticsTestRequestInternal *)v4 setIncludeEvents:self->_includeEvents];
  [(W5DiagnosticsTestRequestInternal *)v4 setTestRequests:self->_testRequests];
  [(W5DiagnosticsTestRequestInternal *)v4 setConfiguration:self->_configuration];
  [(W5DiagnosticsTestRequestInternal *)v4 setReply:self->_reply];
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSArray)testRequests
{
  return self->_testRequests;
}

- (void)setTestRequests:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)includeEvents
{
  return self->_includeEvents;
}

- (void)setIncludeEvents:(BOOL)a3
{
  self->_includeEvents = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end