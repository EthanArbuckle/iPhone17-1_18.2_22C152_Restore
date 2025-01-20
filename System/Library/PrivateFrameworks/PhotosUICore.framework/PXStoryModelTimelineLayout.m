@interface PXStoryModelTimelineLayout
- (PXStoryModel)model;
- (PXStoryModelTimelineLayout)init;
- (PXStoryModelTimelineLayout)initWithModel:(id)a3;
- (void)configureClipLayout:(id)a3;
- (void)didUpdate;
- (void)invalidateClipsCornerRadius;
- (void)invalidateDisplayedRect;
- (void)invalidateDisplayedTimeRange;
- (void)invalidateDisplayedTimeline;
- (void)invalidatePresentedTimelineTransition;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)update;
- (void)updateDisplayedTimeRange;
- (void)updateDisplayedTimeline;
- (void)updateDisplayedTimelineRect;
- (void)willUpdate;
@end

@implementation PXStoryModelTimelineLayout

- (void).cxx_destruct
{
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)ModelObservationContext_245131 == a5)
  {
    [(PXStoryModelTimelineLayout *)self handleModelChange:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryModelTimelineLayout;
    -[PXStoryTimelineLayout observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

- (void)invalidateClipsCornerRadius
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout invalidateClipsCornerRadius]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryModelTimelineLayout.m", 124, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)invalidatePresentedTimelineTransition
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout invalidatePresentedTimelineTransition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryModelTimelineLayout.m", 116, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)updateDisplayedTimelineRect
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXStoryModelTimelineLayout.m", 112, @"Method %s is a responsibility of subclass %@", "-[PXStoryModelTimelineLayout updateDisplayedTimelineRect]", v6 object file lineNumber description];

  abort();
}

- (void)invalidateDisplayedRect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout invalidateDisplayedRect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryModelTimelineLayout.m", 108, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)updateDisplayedTimeRange
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXStoryModelTimelineLayout.m", 104, @"Method %s is a responsibility of subclass %@", "-[PXStoryModelTimelineLayout updateDisplayedTimeRange]", v6 object file lineNumber description];

  abort();
}

- (void)invalidateDisplayedTimeRange
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout invalidateDisplayedTimeRange]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryModelTimelineLayout.m", 100, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)updateDisplayedTimeline
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXStoryModelTimelineLayout.m", 96, @"Method %s is a responsibility of subclass %@", "-[PXStoryModelTimelineLayout updateDisplayedTimeline]", v6 object file lineNumber description];

  abort();
}

- (void)invalidateDisplayedTimeline
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout invalidateDisplayedTimeline]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryModelTimelineLayout.m", 92, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryModelTimelineLayout;
  [(PXStoryTimelineLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryModelTimelineLayout.m", 88, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXStoryModelTimelineLayout.m", 66, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryModelTimelineLayout *)self updateDisplayedTimeline];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXStoryModelTimelineLayout.m", 70, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryModelTimelineLayout *)self updateDisplayedTimeRange];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryModelTimelineLayout.m", 73, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryModelTimelineLayout *)self updateDisplayedTimelineRect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryModelTimelineLayout.m", 76, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryModelTimelineLayout *)self updatePresentedTimelineTransition];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryModelTimelineLayout.m", 79, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryModelTimelineLayout *)self updateClipsCornerRadius];
      unint64_t v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXStoryModelTimelineLayout.m", 82, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryModelTimelineLayout;
  [(PXStoryTimelineLayout *)&v21 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryModelTimelineLayout;
  [(PXStoryTimelineLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PXStoryModelTimelineLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryModelTimelineLayout.m", 62, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)configureClipLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryModelTimelineLayout;
  id v4 = a3;
  [(PXStoryTimelineLayout *)&v6 configureClipLayout:v4];
  objc_super v5 = [(PXStoryModelTimelineLayout *)self model];
  [v4 setModel:v5];
}

- (PXStoryModelTimelineLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryModelTimelineLayout;
  objc_super v6 = [(PXStoryTimelineLayout *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    [(PXStoryModel *)v7->_model registerChangeObserver:v7 context:ModelObservationContext_245131];
    [(PXStoryModelTimelineLayout *)v7 invalidateDisplayedTimeline];
    [(PXStoryModelTimelineLayout *)v7 invalidateDisplayedTimeRange];
    [(PXStoryModelTimelineLayout *)v7 invalidateDisplayedRect];
    [(PXStoryModelTimelineLayout *)v7 invalidatePresentedTimelineTransition];
    [(PXStoryModelTimelineLayout *)v7 invalidateClipsCornerRadius];
  }

  return v7;
}

- (PXStoryModelTimelineLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryModelTimelineLayout.m", 35, @"%s is not available as initializer", "-[PXStoryModelTimelineLayout init]");

  abort();
}

@end