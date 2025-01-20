@interface PXTimelineSchedulerOptions
+ (id)_sortTimelineSizesFromSet:(id)a3;
- (NSArray)bestContentStartTimeHours;
- (PXTimelineSchedulerOptions)init;
- (double)bestContentEntryDuration;
- (double)timelineEntryDuration;
- (unint64_t)numberOfTimelines;
- (unint64_t)timelineForSize;
- (unint64_t)timelineIndex;
- (void)setBestContentEntryDuration:(double)a3;
- (void)setBestContentStartTimeHours:(id)a3;
- (void)setNumberOfTimelines:(unint64_t)a3;
- (void)setTimelineEntryDuration:(double)a3;
- (void)setTimelineForSize:(unint64_t)a3;
- (void)setTimelineIndex:(unint64_t)a3;
- (void)updateOptionsForTimelineSize:(unint64_t)a3 withTimelineSizes:(id)a4;
@end

@implementation PXTimelineSchedulerOptions

- (void).cxx_destruct
{
}

- (void)setNumberOfTimelines:(unint64_t)a3
{
  self->_numberOfTimelines = a3;
}

- (unint64_t)numberOfTimelines
{
  return self->_numberOfTimelines;
}

- (void)setTimelineIndex:(unint64_t)a3
{
  self->_timelineIndex = a3;
}

- (unint64_t)timelineIndex
{
  return self->_timelineIndex;
}

- (void)setTimelineForSize:(unint64_t)a3
{
  self->_timelineForSize = a3;
}

- (unint64_t)timelineForSize
{
  return self->_timelineForSize;
}

- (void)setBestContentStartTimeHours:(id)a3
{
}

- (NSArray)bestContentStartTimeHours
{
  return self->_bestContentStartTimeHours;
}

- (void)setBestContentEntryDuration:(double)a3
{
  self->_bestContentEntryDuration = a3;
}

- (double)bestContentEntryDuration
{
  return self->_bestContentEntryDuration;
}

- (void)setTimelineEntryDuration:(double)a3
{
  self->_timelineEntryDuration = a3;
}

- (double)timelineEntryDuration
{
  return self->_timelineEntryDuration;
}

- (void)updateOptionsForTimelineSize:(unint64_t)a3 withTimelineSizes:(id)a4
{
  id v6 = a4;
  id v10 = [(id)objc_opt_class() _sortTimelineSizesFromSet:v6];

  [(PXTimelineSchedulerOptions *)self setTimelineForSize:a3];
  -[PXTimelineSchedulerOptions setNumberOfTimelines:](self, "setNumberOfTimelines:", [v10 count]);
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [v10 indexOfObject:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  [(PXTimelineSchedulerOptions *)self setTimelineIndex:v9];
}

- (PXTimelineSchedulerOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXTimelineSchedulerOptions;
  v2 = [(PXTimelineSchedulerOptions *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = (double *)MEMORY[0x1E4F8B7B8];
    v2->_timelineEntryDuration = 3600.0;
    v2->_bestContentEntryDuration = *v4;
    uint64_t v5 = [(id)*MEMORY[0x1E4F8B7C0] copy];
    bestContentStartTimeHours = v3->_bestContentStartTimeHours;
    v3->_bestContentStartTimeHours = (NSArray *)v5;

    v3->_timelineForSize = 0;
    v3->_timelineIndex = 0;
    v3->_numberOfTimelines = 1;
  }
  return v3;
}

+ (id)_sortTimelineSizesFromSet:(id)a3
{
  uint64_t v5 = [a3 allObjects];
  id v6 = (void *)[v5 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXTimelineSchedulerOptions__sortTimelineSizesFromSet___block_invoke;
  v8[3] = &unk_1E5DC0038;
  id v9 = &unk_1F02D49A8;
  SEL v10 = a2;
  id v11 = a1;
  [v6 sortUsingComparator:v8];

  return v6;
}

uint64_t __56__PXTimelineSchedulerOptions__sortTimelineSizesFromSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) indexOfObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL) {
    PXAssertGetLog();
  }
  if (v7 < v8) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

@end