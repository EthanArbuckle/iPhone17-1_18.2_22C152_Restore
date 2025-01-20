@interface CMDiagramPointTransitionMapper
- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 adjustValues:(id)a7 parent:(id)a8;
- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 parent:(id)a7;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramPointTransitionMapper

- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 adjustValues:(id)a7 parent:(id)a8
{
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointTransitionMapper;
  v16 = [(CMDiagramPointMapper *)&v19 initWithPoint:a3 drawingContext:a4 orientedBounds:a5 parent:a8];
  v17 = v16;
  if (v16)
  {
    v16->mShapeType = a6;
    objc_storeStrong((id *)&v16->mAdjustValues, a7);
  }

  return v17;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v9 = a4;
  v5 = [(CMDiagramPointMapper *)self presentationWithName:@"sibTrans"];

  if (v5)
  {
    [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
    uint64_t mShapeType = self->mShapeType;
    v7 = [(CMDiagramPointMapper *)self fill];
    v8 = [(CMDiagramPointMapper *)self stroke];
    +[CMShapeRenderer renderCanonicalShape:mShapeType fill:v7 stroke:v8 adjustValues:self->mAdjustValues orientedBounds:self->super.mOrientedBounds state:v9 drawingContext:self->super.mDrawingContext];
  }
}

- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 parent:(id)a7
{
  return [(CMDiagramPointTransitionMapper *)self initWithPoint:a3 drawingContext:a4 orientedBounds:a5 shapeType:*(void *)&a6 adjustValues:0 parent:a7];
}

- (void).cxx_destruct
{
}

@end