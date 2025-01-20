@interface NWStatsPollHandler
- (BOOL)synchronous;
- (NWStatsManager)manager;
- (NWStatsPollHandler)init;
- (id)completionBlock;
- (id)deliveryBlock;
- (id)description;
- (int64_t)instanceNumber;
- (unint64_t)ntstatContext;
- (void)handleSnapshot:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDeliveryBlock:(id)a3;
- (void)setInstanceNumber:(int64_t)a3;
- (void)setManager:(id)a3;
- (void)setNtstatContext:(unint64_t)a3;
- (void)setSynchronous:(BOOL)a3;
@end

@implementation NWStatsPollHandler

- (id)deliveryBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setNtstatContext:(unint64_t)a3
{
  self->_ntstatContext = a3;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setManager:(id)a3
{
}

- (void)setDeliveryBlock:(id)a3
{
}

- (void)setCompletionBlock:(id)a3
{
}

- (NWStatsPollHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)NWStatsPollHandler;
  result = [(NWStatsPollHandler *)&v4 init];
  if (result)
  {
    int64_t v3 = pollHandlerNextSeqno++;
    result->_instanceNumber = v3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"NWStatsPollHandler at %p instance %lld, context %lld", self, -[NWStatsPollHandler instanceNumber](self, "instanceNumber"), self->_ntstatContext];
  return v2;
}

- (void)handleSnapshot:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NWStatsPollHandler *)self deliveryBlock];

  if (v4)
  {
    v5 = [(NWStatsPollHandler *)self deliveryBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (int64_t)instanceNumber
{
  return self->_instanceNumber;
}

- (void)setInstanceNumber:(int64_t)a3
{
  self->_instanceNumber = a3;
}

- (unint64_t)ntstatContext
{
  return self->_ntstatContext;
}

- (NWStatsManager)manager
{
  return (NWStatsManager *)objc_getProperty(self, a2, 48, 1);
}

@end