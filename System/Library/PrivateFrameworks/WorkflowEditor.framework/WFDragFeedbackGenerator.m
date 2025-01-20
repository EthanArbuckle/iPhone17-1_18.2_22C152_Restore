@interface WFDragFeedbackGenerator
- (WFDragFeedbackGenerator)init;
- (WFDragFeedbackGenerator)initWithCollectionView:(id)a3;
- (_UIDragSnappingFeedbackGenerator)feedbackGenerator;
- (int64_t)activeDragSessions;
- (void)draggedObjectLanded;
- (void)draggedObjectLifted;
- (void)draggingItemDropped;
- (void)draggingItemSnapped;
- (void)draggingStarted;
- (void)dropTargetUpdated;
- (void)objectSnapped;
- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4;
- (void)positionUpdated;
- (void)setActiveDragSessions:(int64_t)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)userInteractionCancelled;
- (void)userInteractionEnded;
- (void)userInteractionStarted;
@end

@implementation WFDragFeedbackGenerator

- (void).cxx_destruct
{
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (_UIDragSnappingFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setActiveDragSessions:(int64_t)a3
{
  self->_activeDragSessions = a3;
}

- (int64_t)activeDragSessions
{
  return self->_activeDragSessions;
}

- (void)objectSnapped
{
  if (objc_opt_respondsToSelector())
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator objectSnapped];
  }
}

- (void)draggedObjectLanded
{
  if (objc_opt_respondsToSelector())
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator draggedObjectLanded];
  }
}

- (void)draggedObjectLifted
{
  if (objc_opt_respondsToSelector())
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator draggedObjectLifted];
  }
}

- (void)dropTargetUpdated
{
  if (objc_opt_respondsToSelector())
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator dropTargetUpdated];
  }
}

- (void)positionUpdated
{
  if (objc_opt_respondsToSelector())
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator positionUpdated];
  }
}

- (void)userInteractionCancelled
{
  int64_t v2 = self->_activeDragSessions - 1;
  self->_activeDragSessions = v2;
  if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator userInteractionCancelled];
  }
}

- (void)userInteractionEnded
{
  int64_t v2 = self->_activeDragSessions - 1;
  self->_activeDragSessions = v2;
  if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator userInteractionEnded];
  }
}

- (void)userInteractionStarted
{
  int64_t activeDragSessions = self->_activeDragSessions;
  self->_int64_t activeDragSessions = activeDragSessions + 1;
  if (!activeDragSessions && (objc_opt_respondsToSelector() & 1) != 0)
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(_UIDragSnappingFeedbackGenerator *)feedbackGenerator userInteractionStarted];
  }
}

- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(_UIDragSnappingFeedbackGenerator *)self->_feedbackGenerator performFeedbackWithDelay:v6 insideBlock:a3];
  }
}

- (void)draggingItemDropped
{
  [(WFDragFeedbackGenerator *)self userInteractionEnded];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__WFDragFeedbackGenerator_draggingItemDropped__block_invoke;
  v3[3] = &unk_264BFDBA0;
  v3[4] = self;
  [(WFDragFeedbackGenerator *)self performFeedbackWithDelay:v3 insideBlock:0.3];
}

uint64_t __46__WFDragFeedbackGenerator_draggingItemDropped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) draggedObjectLanded];
}

- (void)draggingItemSnapped
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__WFDragFeedbackGenerator_draggingItemSnapped__block_invoke;
  v2[3] = &unk_264BFDBA0;
  v2[4] = self;
  [(WFDragFeedbackGenerator *)self performFeedbackWithDelay:v2 insideBlock:0.05];
}

uint64_t __46__WFDragFeedbackGenerator_draggingItemSnapped__block_invoke(uint64_t a1)
{
  int64_t v2 = *(uint64_t **)(a1 + 32);
  if (v2[1] <= 0)
  {
    [v2 userInteractionStarted];
    [*(id *)(a1 + 32) objectSnapped];
    v4 = *(void **)(a1 + 32);
    return [v4 userInteractionEnded];
  }
  else
  {
    return [v2 objectSnapped];
  }
}

- (void)draggingStarted
{
  [(WFDragFeedbackGenerator *)self userInteractionStarted];
  [(WFDragFeedbackGenerator *)self draggedObjectLifted];
}

- (WFDragFeedbackGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFDragFeedbackGenerator;
  int64_t v2 = [(WFDragFeedbackGenerator *)&v7 init];
  if (v2)
  {
    v3 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F82F40]);
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = v3;

    v5 = v2;
  }

  return v2;
}

- (WFDragFeedbackGenerator)initWithCollectionView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDragFeedbackGenerator.m", 29, @"Invalid parameter not satisfying: %@", @"collectionView" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFDragFeedbackGenerator;
  id v6 = [(WFDragFeedbackGenerator *)&v12 init];
  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v5 _reorderFeedbackGenerator];
      feedbackGenerator = v6->_feedbackGenerator;
      v6->_feedbackGenerator = (_UIDragSnappingFeedbackGenerator *)v7;
    }
    v9 = v6;
  }

  return v6;
}

@end