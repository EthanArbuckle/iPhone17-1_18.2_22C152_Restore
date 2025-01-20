@interface PIBrushStrokeHistoryEntry
- (BOOL)closedShape;
- (BOOL)needsPixellation;
- (BOOL)skipSegmentationIntersections;
- (CGPoint)objectRemovalPoint;
- (NUBrushStroke)brushStroke;
- (PIBrushStrokeHistoryEntry)initWithDictionary:(id)a3;
- (PIBrushStrokeHistoryEntry)initWithObjectRemovalAtPoint:(CGPoint)a3;
- (PIBrushStrokeHistoryEntry)initWithStroke:(id)a3 closed:(BOOL)a4 skipSegmentationIntersections:(BOOL)a5 needsPixellation:(BOOL)a6 subjectHitTestRadius:(double)a7;
- (double)subjectHitTestRadius;
- (id)dictionaryRepresentation;
- (unint64_t)entryType;
- (void)setBrushStroke:(id)a3;
- (void)setClosedShape:(BOOL)a3;
- (void)setEntryType:(unint64_t)a3;
- (void)setNeedsPixellation:(BOOL)a3;
- (void)setObjectRemovalPoint:(CGPoint)a3;
- (void)setSkipSegmentationIntersections:(BOOL)a3;
- (void)setSubjectHitTestRadius:(double)a3;
@end

@implementation PIBrushStrokeHistoryEntry

- (void).cxx_destruct
{
}

- (void)setSubjectHitTestRadius:(double)a3
{
  self->_subjectHitTestRadius = a3;
}

- (double)subjectHitTestRadius
{
  return self->_subjectHitTestRadius;
}

- (void)setObjectRemovalPoint:(CGPoint)a3
{
  self->_objectRemovalPoint = a3;
}

- (CGPoint)objectRemovalPoint
{
  double x = self->_objectRemovalPoint.x;
  double y = self->_objectRemovalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNeedsPixellation:(BOOL)a3
{
  self->_needsPixellation = a3;
}

- (BOOL)needsPixellation
{
  return self->_needsPixellation;
}

- (void)setSkipSegmentationIntersections:(BOOL)a3
{
  self->_skipSegmentationIntersections = a3;
}

- (BOOL)skipSegmentationIntersections
{
  return self->_skipSegmentationIntersections;
}

- (void)setClosedShape:(BOOL)a3
{
  self->_closedShape = a3;
}

- (BOOL)closedShape
{
  return self->_closedShape;
}

- (void)setBrushStroke:(id)a3
{
}

- (NUBrushStroke)brushStroke
{
  return self->_brushStroke;
}

- (void)setEntryType:(unint64_t)a3
{
  self->_entryType = a3;
}

- (unint64_t)entryType
{
  return self->_entryType;
}

- (id)dictionaryRepresentation
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PIBrushStrokeHistoryEntry entryType](self, "entryType"));
  [v3 setObject:v4 forKeyedSubscript:@"entryType"];

  v5 = [(PIBrushStrokeHistoryEntry *)self brushStroke];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F7A398];
    v7 = [(PIBrushStrokeHistoryEntry *)self brushStroke];
    v8 = [v6 dictionaryFromBrushStroke:v7];
    [v3 setObject:v8 forKeyedSubscript:@"brushStroke"];
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PIBrushStrokeHistoryEntry closedShape](self, "closedShape"));
  [v3 setObject:v9 forKeyedSubscript:@"closedShape"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PIBrushStrokeHistoryEntry skipSegmentationIntersections](self, "skipSegmentationIntersections"));
  [v3 setObject:v10 forKeyedSubscript:@"skipSegmentationIntersections"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PIBrushStrokeHistoryEntry needsPixellation](self, "needsPixellation"));
  [v3 setObject:v11 forKeyedSubscript:@"needsPixellation"];

  if ([(PIBrushStrokeHistoryEntry *)self entryType] == 1)
  {
    v21[0] = @"x";
    v12 = NSNumber;
    [(PIBrushStrokeHistoryEntry *)self objectRemovalPoint];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    v21[1] = @"y";
    v22[0] = v13;
    v14 = NSNumber;
    [(PIBrushStrokeHistoryEntry *)self objectRemovalPoint];
    v16 = [v14 numberWithDouble:v15];
    v22[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 setObject:v17 forKeyedSubscript:@"objectRemovalPoint"];
  }
  v18 = NSNumber;
  [(PIBrushStrokeHistoryEntry *)self subjectHitTestRadius];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:@"subjectHitTestRadius"];

  return v3;
}

- (PIBrushStrokeHistoryEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PIBrushStrokeHistoryEntry;
  v5 = [(PIBrushStrokeHistoryEntry *)&v23 init];
  v6 = [v4 objectForKeyedSubscript:@"entryType"];
  -[PIBrushStrokeHistoryEntry setEntryType:](v5, "setEntryType:", [v6 unsignedIntegerValue]);

  v7 = [v4 objectForKeyedSubscript:@"brushStroke"];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F7A398];
    v9 = [v4 objectForKeyedSubscript:@"brushStroke"];
    v10 = [v8 brushStrokeFromDictionary:v9];
    [(PIBrushStrokeHistoryEntry *)v5 setBrushStroke:v10];
  }
  v11 = [v4 objectForKeyedSubscript:@"closedShape"];
  -[PIBrushStrokeHistoryEntry setClosedShape:](v5, "setClosedShape:", [v11 BOOLValue]);

  v12 = [v4 objectForKeyedSubscript:@"skipSegmentationIntersections"];
  -[PIBrushStrokeHistoryEntry setSkipSegmentationIntersections:](v5, "setSkipSegmentationIntersections:", [v12 BOOLValue]);

  v13 = [v4 objectForKeyedSubscript:@"needsPixellation"];
  -[PIBrushStrokeHistoryEntry setNeedsPixellation:](v5, "setNeedsPixellation:", [v13 BOOLValue]);

  v14 = [v4 objectForKeyedSubscript:@"objectRemovalPoint"];

  if (v14)
  {
    double v15 = [v4 objectForKeyedSubscript:@"objectRemovalPoint"];
    v16 = [v15 objectForKeyedSubscript:@"x"];
    [v16 doubleValue];
    double v18 = v17;
    v19 = [v15 objectForKeyedSubscript:@"y"];
    [v19 doubleValue];
    -[PIBrushStrokeHistoryEntry setObjectRemovalPoint:](v5, "setObjectRemovalPoint:", v18, v20);
  }
  v21 = [v4 objectForKeyedSubscript:@"subjectHitTestRadius"];
  [v21 doubleValue];
  -[PIBrushStrokeHistoryEntry setSubjectHitTestRadius:](v5, "setSubjectHitTestRadius:");

  return v5;
}

- (PIBrushStrokeHistoryEntry)initWithObjectRemovalAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)PIBrushStrokeHistoryEntry;
  v5 = [(PIBrushStrokeHistoryEntry *)&v7 init];
  [(PIBrushStrokeHistoryEntry *)v5 setEntryType:1];
  -[PIBrushStrokeHistoryEntry setObjectRemovalPoint:](v5, "setObjectRemovalPoint:", x, y);
  return v5;
}

- (PIBrushStrokeHistoryEntry)initWithStroke:(id)a3 closed:(BOOL)a4 skipSegmentationIntersections:(BOOL)a5 needsPixellation:(BOOL)a6 subjectHitTestRadius:(double)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PIBrushStrokeHistoryEntry;
  id v11 = a3;
  v12 = [(PIBrushStrokeHistoryEntry *)&v15 init];
  -[PIBrushStrokeHistoryEntry setEntryType:](v12, "setEntryType:", 0, v15.receiver, v15.super_class);
  v13 = (void *)[v11 copy];

  [(PIBrushStrokeHistoryEntry *)v12 setBrushStroke:v13];
  [(PIBrushStrokeHistoryEntry *)v12 setClosedShape:v10];
  [(PIBrushStrokeHistoryEntry *)v12 setSkipSegmentationIntersections:v9];
  [(PIBrushStrokeHistoryEntry *)v12 setNeedsPixellation:v8];
  [(PIBrushStrokeHistoryEntry *)v12 setSubjectHitTestRadius:a7];
  return v12;
}

@end