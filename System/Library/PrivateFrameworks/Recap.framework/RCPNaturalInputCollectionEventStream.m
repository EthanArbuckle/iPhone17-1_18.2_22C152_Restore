@interface RCPNaturalInputCollectionEventStream
- (NSMutableArray)eventBuffer;
- (NSMutableDictionary)currentManipulatorsBySourceGroup;
- (RCPEventSenderProperties)senderProperties;
- (RCPMachTimestampProvider)timestampProvider;
- (RCPNaturalInputCollectionEventStream)initWithCurrentTimeOffset:(double)a3 timestampProvider:(id)a4 senderProperties:(id)a5;
- (RCPNaturalInputCollectionSelection)currentSelection;
- (double)currentTimeOffset;
- (id)finalizedEvents;
- (int64_t)currentPhase;
- (void)advanceTime:(double)a3;
- (void)closeManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6;
- (void)commitEvent;
- (void)finish;
- (void)moveManipulatorByDelta:(CGVector)a3 withZDelta:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6;
- (void)moveManipulatorToLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6;
- (void)moveSelectionByDelta:(CGVector)a3 withZDelta:(double)a4;
- (void)moveSelectionByDelta:(CGVector)a3 zDelta:(double)a4 directionDelta:(CGVector)a5 zDirectionDelta:(double)a6;
- (void)moveSelectionToLocation:(CGPoint)a3 withZPosition:(double)a4;
- (void)moveSelectionToLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6;
- (void)openManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6;
- (void)setCurrentManipulatorsBySourceGroup:(id)a3;
- (void)setCurrentPhase:(int64_t)a3;
- (void)setCurrentSelection:(id)a3;
- (void)setCurrentTimeOffset:(double)a3;
- (void)setEventBuffer:(id)a3;
- (void)setSenderProperties:(id)a3;
- (void)setTimestampProvider:(id)a3;
- (void)updatePhase;
@end

@implementation RCPNaturalInputCollectionEventStream

- (RCPNaturalInputCollectionEventStream)initWithCurrentTimeOffset:(double)a3 timestampProvider:(id)a4 senderProperties:(id)a5
{
  v8 = (RCPMachTimestampProvider *)a4;
  v9 = (RCPEventSenderProperties *)a5;
  v21.receiver = self;
  v21.super_class = (Class)RCPNaturalInputCollectionEventStream;
  v10 = [(RCPNaturalInputCollectionEventStream *)&v21 init];
  v10->_currentTimeOffset = a3;
  timestampProvider = v10->_timestampProvider;
  v10->_timestampProvider = v8;
  v12 = v8;

  senderProperties = v10->_senderProperties;
  v10->_senderProperties = v9;
  v14 = v9;

  currentSelection = v10->_currentSelection;
  v10->_currentSelection = 0;

  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  currentManipulatorsBySourceGroup = v10->_currentManipulatorsBySourceGroup;
  v10->_currentManipulatorsBySourceGroup = (NSMutableDictionary *)v16;

  v10->_currentPhase = 3;
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  eventBuffer = v10->_eventBuffer;
  v10->_eventBuffer = (NSMutableArray *)v18;

  return v10;
}

- (void)advanceTime:(double)a3
{
  [(RCPNaturalInputCollectionEventStream *)self currentTimeOffset];
  double v6 = v5 + a3;
  [(RCPNaturalInputCollectionEventStream *)self setCurrentTimeOffset:v6];
}

- (void)openManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  v8 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, 1, a3.x, a3.y, a4);
  v9 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
  v10 = [NSNumber numberWithInteger:a5];
  [v9 setObject:v8 forKeyedSubscript:v10];

  [(RCPNaturalInputCollectionEventStream *)self updatePhase];
  [(RCPNaturalInputCollectionEventStream *)self commitEvent];
}

- (void)closeManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  v8 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, 0, a3.x, a3.y, a4);
  v9 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
  v10 = [NSNumber numberWithInteger:a5];
  [v9 setObject:v8 forKeyedSubscript:v10];

  [(RCPNaturalInputCollectionEventStream *)self updatePhase];
  [(RCPNaturalInputCollectionEventStream *)self commitEvent];
}

- (void)moveManipulatorByDelta:(CGVector)a3 withZDelta:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  double dy = a3.dy;
  double dx = a3.dx;
  v12 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
  v13 = [NSNumber numberWithInteger:a5];
  id v22 = [v12 objectForKeyedSubscript:v13];

  if (v22)
  {
    [v22 location];
    double v15 = dx + v14;
    [v22 location];
    double v17 = dy + v16;
    [v22 zPosition];
    v19 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, [v22 isOpen], v15, v17, v18 + a4);
    v20 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
    objc_super v21 = [NSNumber numberWithInteger:a5];
    [v20 setObject:v19 forKeyedSubscript:v21];

    [(RCPNaturalInputCollectionEventStream *)self updatePhase];
    [(RCPNaturalInputCollectionEventStream *)self commitEvent];
  }
}

- (void)moveManipulatorToLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  v12 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
  v13 = [NSNumber numberWithInteger:a5];
  id v17 = [v12 objectForKeyedSubscript:v13];

  if (v17)
  {
    double v14 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, [v17 isOpen], x, y, a4);
    double v15 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
    double v16 = [NSNumber numberWithInteger:a5];
    [v15 setObject:v14 forKeyedSubscript:v16];

    [(RCPNaturalInputCollectionEventStream *)self updatePhase];
    [(RCPNaturalInputCollectionEventStream *)self commitEvent];
  }
}

- (void)moveSelectionByDelta:(CGVector)a3 withZDelta:(double)a4
{
}

- (void)moveSelectionByDelta:(CGVector)a3 zDelta:(double)a4 directionDelta:(CGVector)a5 zDirectionDelta:(double)a6
{
  double dy = a5.dy;
  double dx = a5.dx;
  double v10 = a3.dy;
  double v11 = a3.dx;
  v13 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];

  if (v13)
  {
    double v14 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v14 location];
    double v16 = v11 + v15;
    id v17 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v17 location];
    double v19 = v10 + v18;

    v20 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v20 zPosition];
    double v22 = v21 + a4;

    v23 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v23 direction];
    double v25 = dx + v24;
    v26 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v26 direction];
    double v28 = dy + v27;

    v29 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    [v29 zDirection];
    double v31 = v30 + a6;

    v32 = -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:]([RCPNaturalInputCollectionSelection alloc], "initWithLocation:zPosition:direction:zDirection:", v16, v19, v22, v25, v28, v31);
    [(RCPNaturalInputCollectionEventStream *)self setCurrentSelection:v32];
    [(RCPNaturalInputCollectionEventStream *)self updatePhase];
    [(RCPNaturalInputCollectionEventStream *)self commitEvent];
  }
}

- (void)moveSelectionToLocation:(CGPoint)a3 withZPosition:(double)a4
{
}

- (void)moveSelectionToLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6
{
  v7 = -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:]([RCPNaturalInputCollectionSelection alloc], "initWithLocation:zPosition:direction:zDirection:", a3.x, a3.y, a4, a5.x, a5.y, a6);
  [(RCPNaturalInputCollectionEventStream *)self setCurrentSelection:v7];
  [(RCPNaturalInputCollectionEventStream *)self updatePhase];
  [(RCPNaturalInputCollectionEventStream *)self commitEvent];
}

- (void)finish
{
  [(RCPNaturalInputCollectionEventStream *)self setCurrentPhase:3];
  [(RCPNaturalInputCollectionEventStream *)self commitEvent];
}

- (void)updatePhase
{
  if ([(RCPNaturalInputCollectionEventStream *)self currentPhase] == 3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(RCPNaturalInputCollectionEventStream *)self setCurrentPhase:v3];
}

- (id)finalizedEvents
{
  v2 = [(RCPNaturalInputCollectionEventStream *)self eventBuffer];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)commitEvent
{
  uint64_t v3 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
  v4 = (void *)MEMORY[0x1E4F1C978];
  if (v3)
  {
    double v5 = [(RCPNaturalInputCollectionEventStream *)self currentSelection];
    double v6 = (void *)[v5 copy];
    id v14 = [v4 arrayWithObject:v6];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C978] array];
  }

  v7 = [RCPNaturalInputCollectionEvent alloc];
  v8 = [(RCPNaturalInputCollectionEventStream *)self currentManipulatorsBySourceGroup];
  v9 = [v8 allValues];
  int64_t v10 = [(RCPNaturalInputCollectionEventStream *)self currentPhase];
  double v11 = [(RCPNaturalInputCollectionEventStream *)self timestampProvider];
  [(RCPNaturalInputCollectionEventStream *)self currentTimeOffset];
  v12 = -[RCPNaturalInputCollectionEvent initWithManipulators:selections:phase:timestamp:senderProperties:](v7, "initWithManipulators:selections:phase:timestamp:senderProperties:", v9, v14, v10, objc_msgSend(v11, "machAbsoluteTimeForTimeInterval:"), self->_senderProperties);

  v13 = [(RCPNaturalInputCollectionEventStream *)self eventBuffer];
  [v13 addObject:v12];
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)setSenderProperties:(id)a3
{
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (RCPMachTimestampProvider)timestampProvider
{
  return (RCPMachTimestampProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimestampProvider:(id)a3
{
}

- (RCPNaturalInputCollectionSelection)currentSelection
{
  return (RCPNaturalInputCollectionSelection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentSelection:(id)a3
{
}

- (NSMutableDictionary)currentManipulatorsBySourceGroup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentManipulatorsBySourceGroup:(id)a3
{
}

- (int64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(int64_t)a3
{
  self->_currentPhase = a3;
}

- (NSMutableArray)eventBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEventBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_currentManipulatorsBySourceGroup, 0);
  objc_storeStrong((id *)&self->_currentSelection, 0);
  objc_storeStrong((id *)&self->_timestampProvider, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
}

@end