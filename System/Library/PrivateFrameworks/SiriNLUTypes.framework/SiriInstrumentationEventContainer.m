@interface SiriInstrumentationEventContainer
- (NLXSchemaNLXClientEvent)mainEvent;
- (NSArray)tier1Events;
- (void)setMainEvent:(id)a3;
- (void)setTier1Events:(id)a3;
@end

@implementation SiriInstrumentationEventContainer

- (NLXSchemaNLXClientEvent)mainEvent
{
  return self->_mainEvent;
}

- (NSArray)tier1Events
{
  return self->_tier1Events;
}

- (void)setMainEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tier1Events, 0);
  objc_storeStrong((id *)&self->_mainEvent, 0);
}

- (void)setTier1Events:(id)a3
{
}

@end