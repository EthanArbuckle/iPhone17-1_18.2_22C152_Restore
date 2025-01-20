@interface SLDHighlightDisambiguationPillSlotDrawer
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
@end

@implementation SLDHighlightDisambiguationPillSlotDrawer

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SLDHighlightDisambiguationPillDrawing alloc] initWithStyle:v8 tag:v7 forRemote:v5];

  return v9;
}

@end