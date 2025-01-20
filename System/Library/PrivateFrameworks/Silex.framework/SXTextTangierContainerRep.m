@interface SXTextTangierContainerRep
- (BOOL)directlyManagesLayerContent;
- (void)dealloc;
@end

@implementation SXTextTangierContainerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)dealloc
{
  [(SXTextTangierContainerRep *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierContainerRep;
  [(SXTextTangierContainerRep *)&v3 dealloc];
}

@end