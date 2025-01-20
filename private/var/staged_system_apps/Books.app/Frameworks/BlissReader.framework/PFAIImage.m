@interface PFAIImage
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIImage

- (void)mapEndElementWithState:(id)a3
{
  unsigned int v5 = [(PFXDrawablePlacement *)self->super.super.mPlacement mode];
  if (v5 != 5 || ([a3 paginatedIsCurrent] & 1) == 0)
  {
    [(PFXImage *)self mapEndElementWithState:a3 forceBoundsComputation:v5 == 5];
  }
}

@end