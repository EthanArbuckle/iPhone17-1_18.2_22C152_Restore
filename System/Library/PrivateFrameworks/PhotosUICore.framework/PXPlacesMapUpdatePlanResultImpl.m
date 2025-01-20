@interface PXPlacesMapUpdatePlanResultImpl
- (NSMutableSet)annotationsToAddImmediately;
- (NSMutableSet)annotationsToRedraw;
- (NSMutableSet)annotationsToRemoveAfterAnimationHasEnded;
- (NSMutableSet)annotationsToRemoveAfterAnimationHasStarted;
- (NSMutableSet)annotationsToRemoveImmediately;
- (NSMutableSet)annotationsWithUpdatedIndex;
- (NSMutableSet)overlaysToAddImmediately;
- (NSMutableSet)overlaysToRemoveImmediately;
- (NSString)description;
- (PXPlacesMapUpdatePlanResultImpl)init;
@end

@implementation PXPlacesMapUpdatePlanResultImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaysToRemoveImmediately, 0);
  objc_storeStrong((id *)&self->_overlaysToAddImmediately, 0);
  objc_storeStrong((id *)&self->_annotationsWithUpdatedIndex, 0);
  objc_storeStrong((id *)&self->_annotationsToRedraw, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveAfterAnimationHasEnded, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveAfterAnimationHasStarted, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveImmediately, 0);
  objc_storeStrong((id *)&self->_annotationsToAddImmediately, 0);
}

- (NSMutableSet)overlaysToRemoveImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableSet)overlaysToAddImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)annotationsWithUpdatedIndex
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableSet)annotationsToRedraw
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)annotationsToRemoveAfterAnimationHasEnded
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)annotationsToRemoveAfterAnimationHasStarted
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)annotationsToRemoveImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableSet)annotationsToAddImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v19.receiver = self;
  v19.super_class = (Class)PXPlacesMapUpdatePlanResultImpl;
  v4 = [(PXPlacesMapUpdatePlanResultImpl *)&v19 description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendString:@"---------------------\n"];
  v6 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToAddImmediately];
  uint64_t v7 = [v6 count];
  v8 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToAddImmediately];
  [v5 appendFormat:@"- Add Immediately: %lu:\n%@\n\n", v7, v8];

  v9 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveImmediately];
  uint64_t v10 = [v9 count];
  v11 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveImmediately];
  [v5 appendFormat:@"- Remove Immediately: %lu:\n%@\n\n", v10, v11];

  v12 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveAfterAnimationHasStarted];
  uint64_t v13 = [v12 count];
  v14 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveAfterAnimationHasStarted];
  [v5 appendFormat:@"- Remove After Animation Started: %lu:\n%@\n\n", v13, v14];

  v15 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveAfterAnimationHasEnded];
  uint64_t v16 = [v15 count];
  v17 = [(PXPlacesMapUpdatePlanResultImpl *)self annotationsToRemoveAfterAnimationHasEnded];
  [v5 appendFormat:@"- Remove After Animation Ended: %lu:\n%@\n\n", v16, v17];

  return (NSString *)v5;
}

- (PXPlacesMapUpdatePlanResultImpl)init
{
  v20.receiver = self;
  v20.super_class = (Class)PXPlacesMapUpdatePlanResultImpl;
  v2 = [(PXPlacesMapUpdatePlanResultImpl *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    annotationsToAddImmediately = v2->_annotationsToAddImmediately;
    v2->_annotationsToAddImmediately = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    annotationsToRemoveImmediately = v2->_annotationsToRemoveImmediately;
    v2->_annotationsToRemoveImmediately = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    annotationsToRemoveAfterAnimationHasEnded = v2->_annotationsToRemoveAfterAnimationHasEnded;
    v2->_annotationsToRemoveAfterAnimationHasEnded = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    annotationsToRemoveAfterAnimationHasStarted = v2->_annotationsToRemoveAfterAnimationHasStarted;
    v2->_annotationsToRemoveAfterAnimationHasStarted = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    annotationsToRedraw = v2->_annotationsToRedraw;
    v2->_annotationsToRedraw = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    annotationsWithUpdatedIndex = v2->_annotationsWithUpdatedIndex;
    v2->_annotationsWithUpdatedIndex = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    overlaysToAddImmediately = v2->_overlaysToAddImmediately;
    v2->_overlaysToAddImmediately = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    overlaysToRemoveImmediately = v2->_overlaysToRemoveImmediately;
    v2->_overlaysToRemoveImmediately = (NSMutableSet *)v17;
  }
  return v2;
}

@end