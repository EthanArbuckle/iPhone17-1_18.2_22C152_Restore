@interface ICEmptyTextSelectionRect
- (BOOL)_drawsOwnHighlight;
@end

@implementation ICEmptyTextSelectionRect

- (BOOL)_drawsOwnHighlight
{
  return 1;
}

@end