@interface _CarMetadataGuidanceEventPair
- (GEOComposedGuidanceEvent)guidanceEvent;
- (NSNumber)cpIndex;
- (void)setCpIndex:(id)a3;
- (void)setGuidanceEvent:(id)a3;
@end

@implementation _CarMetadataGuidanceEventPair

- (GEOComposedGuidanceEvent)guidanceEvent
{
  return self->_guidanceEvent;
}

- (void)setGuidanceEvent:(id)a3
{
}

- (NSNumber)cpIndex
{
  return self->_cpIndex;
}

- (void)setCpIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpIndex, 0);

  objc_storeStrong((id *)&self->_guidanceEvent, 0);
}

@end