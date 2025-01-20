@interface PXStoryResourcesPreloadingRequest
- (BOOL)isCancelled;
- (BOOL)shouldIgnoreStartingSegmentIdentifier;
- (PXStoryResourcesPreloadingRequest)initWithTimeline:(id)a3 timelineAttributes:(unint64_t)a4 startingSegmentIdentifier:(int64_t)a5 shouldIgnoreStartingSegmentIdentifier:(BOOL)a6;
- (PXStorySongResource)songResource;
- (PXStoryTimeline)timeline;
- (int64_t)startingSegmentIdentifier;
- (unint64_t)timelineAttributes;
- (void)setIsCancelled:(BOOL)a3;
- (void)setSongResource:(id)a3;
@end

@implementation PXStoryResourcesPreloadingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setSongResource:(id)a3
{
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (BOOL)shouldIgnoreStartingSegmentIdentifier
{
  return self->_shouldIgnoreStartingSegmentIdentifier;
}

- (int64_t)startingSegmentIdentifier
{
  return self->_startingSegmentIdentifier;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (PXStoryResourcesPreloadingRequest)initWithTimeline:(id)a3 timelineAttributes:(unint64_t)a4 startingSegmentIdentifier:(int64_t)a5 shouldIgnoreStartingSegmentIdentifier:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryResourcesPreloadingRequest;
  v12 = [(PXStoryResourcesPreloadingRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timeline, a3);
    v13->_timelineAttributes = a4;
    v13->_startingSegmentIdentifier = a5;
    v13->_shouldIgnoreStartingSegmentIdentifier = a6;
  }

  return v13;
}

@end