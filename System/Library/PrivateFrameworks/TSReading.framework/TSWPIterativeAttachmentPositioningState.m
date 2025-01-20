@interface TSWPIterativeAttachmentPositioningState
- (BOOL)hasLoopInLastPasses;
- (CGPoint)bestPosition;
- (CGPoint)position;
- (NSArray)passPositions;
- (TSWPIterativeAttachmentPositioningState)init;
- (double)mismatch;
- (double)smallestMismatch;
- (unint64_t)passCount;
- (void)dealloc;
- (void)setPosition:(CGPoint)a3 mismatch:(double)a4;
- (void)setPosition:(CGPoint)a3 mismatch:(double)a4 afterLoop:(BOOL)a5;
@end

@implementation TSWPIterativeAttachmentPositioningState

- (TSWPIterativeAttachmentPositioningState)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPIterativeAttachmentPositioningState;
  result = [(TSWPIterativeAttachmentPositioningState *)&v3 init];
  if (result) {
    result->_smallestMismatch = 1.79769313e308;
  }
  return result;
}

- (void)setPosition:(CGPoint)a3 mismatch:(double)a4
{
}

- (void)setPosition:(CGPoint)a3 mismatch:(double)a4 afterLoop:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  self->_position = a3;
  self->_mismatch = a4;
  passPositions = self->_passPositions;
  ++self->_passCount;
  if (passPositions)
  {
    v11 = -[NSArray arrayByAddingObject:](passPositions, "arrayByAddingObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3.x, a3.y));
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
    v11 = (NSArray *)objc_msgSend(v12, "initWithObjects:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y), 0);
  }
  self->_passPositions = v11;
  if (!a5)
  {
    double v13 = -a4;
    if (a4 >= 0.0) {
      double v13 = a4;
    }
    double smallestMismatch = self->_smallestMismatch;
    if (smallestMismatch < 0.0) {
      double smallestMismatch = -smallestMismatch;
    }
    if (v13 < smallestMismatch)
    {
      self->_double smallestMismatch = a4;
      self->_bestPosition.double x = x;
      self->_bestPosition.double y = y;
    }
  }
}

- (BOOL)hasLoopInLastPasses
{
  NSUInteger v3 = [(NSArray *)[(TSWPIterativeAttachmentPositioningState *)self passPositions] count];
  if (v3 < 2) {
    return 0;
  }
  NSUInteger v4 = v3;
  objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v3 - 1), "CGPointValue");
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v4 - 2), "CGPointValue");
  BOOL v11 = v8 == v10 && v6 == v9;
  if (v4 != 2)
  {
    objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v4 - 3), "CGPointValue");
    return v11 || v8 == v13 && v6 == v12;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPIterativeAttachmentPositioningState;
  [(TSWPIterativeAttachmentPositioningState *)&v3 dealloc];
}

- (unint64_t)passCount
{
  return self->_passCount;
}

- (NSArray)passPositions
{
  return self->_passPositions;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)mismatch
{
  return self->_mismatch;
}

- (double)smallestMismatch
{
  return self->_smallestMismatch;
}

- (CGPoint)bestPosition
{
  double x = self->_bestPosition.x;
  double y = self->_bestPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end