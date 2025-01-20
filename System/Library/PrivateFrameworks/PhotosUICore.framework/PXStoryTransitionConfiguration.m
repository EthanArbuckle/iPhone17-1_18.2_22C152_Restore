@interface PXStoryTransitionConfiguration
- (PXGEntityManager)entityManager;
- (PXStoryTimeline)timeline;
- (PXStoryTimelineSpec)timelineSpec;
- (PXStoryTransitionModel)transitionModel;
- (PXStoryTransitionSource)source;
- (void)setEntityManager:(id)a3;
- (void)setSource:(id)a3;
- (void)setTimeline:(id)a3;
- (void)setTimelineSpec:(id)a3;
- (void)setTransitionModel:(id)a3;
@end

@implementation PXStoryTransitionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_transitionModel, 0);
  objc_storeStrong((id *)&self->_timelineSpec, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

- (void)setSource:(id)a3
{
}

- (PXStoryTransitionSource)source
{
  return self->_source;
}

- (void)setEntityManager:(id)a3
{
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)setTransitionModel:(id)a3
{
}

- (PXStoryTransitionModel)transitionModel
{
  return self->_transitionModel;
}

- (void)setTimelineSpec:(id)a3
{
}

- (PXStoryTimelineSpec)timelineSpec
{
  return self->_timelineSpec;
}

- (void)setTimeline:(id)a3
{
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

@end