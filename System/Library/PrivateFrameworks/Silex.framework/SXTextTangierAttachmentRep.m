@interface SXTextTangierAttachmentRep
- (BOOL)directlyManagesLayerContent;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
@end

@implementation SXTextTangierAttachmentRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return 0;
}

@end