@interface CRLFreehandDrawingCustomizedLassoTool
- (BOOL)_isLassoTool;
- (CRLFreehandDrawingCustomizedLassoTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6;
@end

@implementation CRLFreehandDrawingCustomizedLassoTool

- (CRLFreehandDrawingCustomizedLassoTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingCustomizedLassoTool;
  return [(CRLFreehandDrawingCustomizedLassoTool *)&v7 initWithCustomIdentifier:a3 configuration:a4 color:a5 weight:a6];
}

- (BOOL)_isLassoTool
{
  return 1;
}

@end