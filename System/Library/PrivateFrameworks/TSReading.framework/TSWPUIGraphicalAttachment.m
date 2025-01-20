@interface TSWPUIGraphicalAttachment
- (BOOL)wantsSelectionAtPoint:(CGPoint)a3;
- (CGSize)size;
- (double)baselineOffset;
- (id)rendererForAttachment;
- (int)elementKind;
- (void)invalidate;
@end

@implementation TSWPUIGraphicalAttachment

- (int)elementKind
{
  return 16;
}

- (id)rendererForAttachment
{
  v2 = objc_opt_new();

  return v2;
}

- (void)invalidate
{
  v3 = [(TSWPAttachment *)self parentStorage];
  unint64_t v4 = [(TSWPAttachment *)self findCharIndex];

  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v3, "p_didChangeRange:delta:broadcastKind:", v4, 1, 0, 1);
}

- (CGSize)size
{
  double v2 = 100.0;
  double v3 = 30.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)baselineOffset
{
  return -15.0;
}

- (BOOL)wantsSelectionAtPoint:(CGPoint)a3
{
  return 1;
}

@end