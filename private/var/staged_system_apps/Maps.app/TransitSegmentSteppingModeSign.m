@interface TransitSegmentSteppingModeSign
- (BOOL)hasValidInstructions;
- (BOOL)isMatchedSign;
- (BOOL)isWalking;
- (GEOComposedRouteSegment)segment;
- (GEOComposedRouteStep)step;
- (GEOComposedString)majorFormattedInstruction;
- (GEOComposedString)minorFormattedInstruction;
- (GEOComposedString)tertiaryFormattedInstruction;
- (GEOComposedTransitTripRouteStep)boardClusteredStep;
- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage;
- (MNTransitInstruction)instruction;
- (TransitSegmentSteppingModeSign)initWithStep:(id)a3 stepIndexRange:(_NSRange)a4;
- (TransitSegmentSteppingModeSign)initWithWalkingSegment:(id)a3 stepIndexRange:(_NSRange)a4;
- (_NSRange)stepIndexRange;
- (void)setIsMatchedSign:(BOOL)a3;
- (void)setStepIndexRange:(_NSRange)a3;
@end

@implementation TransitSegmentSteppingModeSign

- (TransitSegmentSteppingModeSign)initWithStep:(id)a3 stepIndexRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TransitSegmentSteppingModeSign;
  v9 = [(TransitSegmentSteppingModeSign *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_step, a3);
    v10->_stepIndexRange.NSUInteger location = location;
    v10->_stepIndexRange.NSUInteger length = length;
    uint64_t v11 = [v8 transitInstructionInContext:1];
    instruction = v10->_instruction;
    v10->_instruction = (MNTransitInstruction *)v11;

    v13 = [MergedTransitRoutingIncidentMessage alloc];
    v14 = [v8 transitIncidents];
    v15 = [(MergedTransitRoutingIncidentMessage *)v13 initWithTransitIncidents:v14];
    incidentMessage = v10->_incidentMessage;
    v10->_incidentMessage = v15;

    v17 = v10;
  }

  return v10;
}

- (TransitSegmentSteppingModeSign)initWithWalkingSegment:(id)a3 stepIndexRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TransitSegmentSteppingModeSign;
  v9 = [(TransitSegmentSteppingModeSign *)&v33 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_segment, a3);
    v10->_stepIndexRange.NSUInteger location = location;
    v10->_stepIndexRange.NSUInteger length = length;
    uint64_t v11 = [v8 transitInstructionInContext:1];
    instruction = v10->_instruction;
    v10->_instruction = (MNTransitInstruction *)v11;

    id v13 = objc_alloc_init((Class)NSMutableSet);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = [v8 steps];
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_super v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v20 = [v19 transitIncidents];
          id v21 = [v20 count];

          if (v21)
          {
            v22 = [v19 transitIncidents];
            [v13 addObjectsFromArray:v22];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      v23 = [MergedTransitRoutingIncidentMessage alloc];
      v24 = [v13 allObjects];
      v25 = [(MergedTransitRoutingIncidentMessage *)v23 initWithTransitIncidents:v24];
      incidentMessage = v10->_incidentMessage;
      v10->_incidentMessage = v25;
    }
    else
    {
      v24 = v10->_incidentMessage;
      v10->_incidentMessage = 0;
    }

    v27 = v10;
  }

  return v10;
}

- (BOOL)isWalking
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)hasValidInstructions
{
  v2 = [(MNTransitInstruction *)self->_instruction majorInstructionStrings];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (GEOComposedString)majorFormattedInstruction
{
  v2 = [(MNTransitInstruction *)self->_instruction majorInstructionStrings];
  BOOL v3 = [v2 firstObject];

  return (GEOComposedString *)v3;
}

- (GEOComposedString)minorFormattedInstruction
{
  v2 = [(MNTransitInstruction *)self->_instruction minorInstructionStrings];
  BOOL v3 = [v2 firstObject];

  return (GEOComposedString *)v3;
}

- (GEOComposedString)tertiaryFormattedInstruction
{
  v2 = [(MNTransitInstruction *)self->_instruction tertiaryInstructionStrings];
  BOOL v3 = [v2 firstObject];

  return (GEOComposedString *)v3;
}

- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage
{
  return (GEOTransitRoutingIncidentMessage *)self->_incidentMessage;
}

- (GEOComposedTransitTripRouteStep)boardClusteredStep
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v3 = self->_step;
  if ([(GEOComposedRouteStep *)v3 maneuver] != 3
    || ([(GEOComposedRouteStep *)v3 tripSegment],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 rideOptionsCount],
        v4,
        (unint64_t)v5 <= 1))
  {

LABEL_5:
    BOOL v3 = 0;
  }

  return v3;
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (GEOComposedRouteSegment)segment
{
  return self->_segment;
}

- (_NSRange)stepIndexRange
{
  NSUInteger length = self->_stepIndexRange.length;
  NSUInteger location = self->_stepIndexRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStepIndexRange:(_NSRange)a3
{
  self->_stepIndexRange = a3;
}

- (MNTransitInstruction)instruction
{
  return self->_instruction;
}

- (BOOL)isMatchedSign
{
  return self->_isMatchedSign;
}

- (void)setIsMatchedSign:(BOOL)a3
{
  self->_isMatchedSign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_segment, 0);
  objc_storeStrong((id *)&self->_step, 0);

  objc_storeStrong((id *)&self->_incidentMessage, 0);
}

@end