@interface _MNJunctionViewPreloadEvent
- (BOOL)needsPreload;
- (GEOComposedGuidanceEvent)junctionViewEvent;
- (void)setJunctionViewEvent:(id)a3;
- (void)setNeedsPreload:(BOOL)a3;
@end

@implementation _MNJunctionViewPreloadEvent

- (GEOComposedGuidanceEvent)junctionViewEvent
{
  return self->_junctionViewEvent;
}

- (void)setJunctionViewEvent:(id)a3
{
}

- (BOOL)needsPreload
{
  return self->_needsPreload;
}

- (void)setNeedsPreload:(BOOL)a3
{
  self->_needsPreload = a3;
}

- (void).cxx_destruct
{
}

@end