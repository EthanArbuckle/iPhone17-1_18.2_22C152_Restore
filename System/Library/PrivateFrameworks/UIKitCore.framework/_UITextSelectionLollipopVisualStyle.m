@interface _UITextSelectionLollipopVisualStyle
+ (id)inferredVisualStyle;
- (BOOL)useGrabberDotsForSelection;
- (CGSize)remoteEffectSize;
- (CGSize)shadowOffset;
- (double)bigPaddedInset;
- (double)dotOverlapOffset;
- (double)dotSizeWithEngagedEffect:(BOOL)a3;
- (double)grabberOpacity;
- (double)minimumStemLength;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)smallPaddedInset;
- (double)stemWidth;
- (id)dotRemoteEffectsForOwner:(id)a3;
- (id)remoteEffectGroupForOwner:(id)a3;
@end

@implementation _UITextSelectionLollipopVisualStyle

+ (id)inferredVisualStyle
{
  v2 = objc_alloc_init(_UITextSelectionLollipopVisualStyle);
  return v2;
}

- (double)minimumStemLength
{
  return 0.0;
}

- (double)stemWidth
{
  return 2.0;
}

- (double)smallPaddedInset
{
  return -10.0;
}

- (double)bigPaddedInset
{
  return -30.0;
}

- (CGSize)shadowOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)shadowRadius
{
  return 8.0;
}

- (double)shadowOpacity
{
  return 0.3;
}

- (double)grabberOpacity
{
  return 1.0;
}

- (double)dotOverlapOffset
{
  return 3.0;
}

- (double)dotSizeWithEngagedEffect:(BOOL)a3
{
  return 16.5;
}

- (BOOL)useGrabberDotsForSelection
{
  return 0;
}

- (CGSize)remoteEffectSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)remoteEffectGroupForOwner:(id)a3
{
  return 0;
}

- (id)dotRemoteEffectsForOwner:(id)a3
{
  return 0;
}

@end