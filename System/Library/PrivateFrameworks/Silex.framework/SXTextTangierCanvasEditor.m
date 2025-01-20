@interface SXTextTangierCanvasEditor
- (BOOL)wantsKeyboard;
- (id)documentRoot;
- (id)drawables;
@end

@implementation SXTextTangierCanvasEditor

- (id)documentRoot
{
  v2 = [(TSDCanvasEditor *)self interactiveCanvasController];
  v3 = [v2 documentRoot];

  return v3;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (id)drawables
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

@end