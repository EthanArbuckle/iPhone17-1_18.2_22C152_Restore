@interface ACCComponents
+ (id)components;
- (ACCSSOTGTStoragePolicy)tgtStoragePolicy;
- (ACCTicketManagerProtocol)ticketManager;
- (id)createHandlerWithClass:(Class)a3 context:(id)a4;
- (void)dealloc;
- (void)setTgtStoragePolicy:(id)a3;
- (void)setTicketManager:(id)a3;
@end

@implementation ACCComponents

+ (id)components
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACCComponents;
  return [super components];
}

- (void)dealloc
{
  [(ACCComponents *)self setTgtStoragePolicy:0];
  [(ACCComponents *)self setTicketManager:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCComponents;
  [(ACFComponents *)&v3 dealloc];
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  return (id)[(objc_class *)a3 handlerWithContext:a4];
}

- (ACCSSOTGTStoragePolicy)tgtStoragePolicy
{
  return self->_tgtStoragePolicy;
}

- (void)setTgtStoragePolicy:(id)a3
{
}

- (ACCTicketManagerProtocol)ticketManager
{
  return self->_ticketManager;
}

- (void)setTicketManager:(id)a3
{
}

@end