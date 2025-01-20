@interface SBIconPageManagementMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBIconPageManagementMetric)init;
@end

@implementation SBIconPageManagementMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 11)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SBIconPageManagementMetric_handleEvent_withContext___block_invoke;
    v10[3] = &unk_1E6AF9508;
    v10[4] = self;
    [v6 stateForQueryName:2 completion:v10];
  }
  else
  {
    switch(a3)
    {
      case '6':
        pageManagementPresentationTracker = self->_pageManagementPresentationTracker;
        goto LABEL_8;
      case '7':
        [(PETScalarEventTracker *)self->_pageDeletionTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
        break;
      case '8':
        pageManagementPresentationTracker = self->_pageMovementTracker;
        goto LABEL_8;
      case '9':
        pageManagementPresentationTracker = self->_pageHidingTracker;
LABEL_8:
        [(PETScalarEventTracker *)pageManagementPresentationTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] setValue:1];
        break;
      default:
        break;
    }
  }

  return a3 == 11;
}

- (SBIconPageManagementMetric)init
{
  v20.receiver = self;
  v20.super_class = (Class)SBIconPageManagementMetric;
  v2 = [(SBIconPageManagementMetric *)&v20 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93718]);
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = [v3 initWithFeatureId:@"SpringBoard" event:@"VisibleIconPages" registerProperties:MEMORY[0x1E4F1CBF0]];
    pagesHiddenTracker = v2->_pagesHiddenTracker;
    v2->_pagesHiddenTracker = (PETDistributionEventTracker *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"HiddenIconPages" registerProperties:v4];
    pagesVisibleTracker = v2->_pagesVisibleTracker;
    v2->_pagesVisibleTracker = (PETDistributionEventTracker *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"TotalIconPages" registerProperties:v4];
    pagesCountTracker = v2->_pagesCountTracker;
    v2->_pagesCountTracker = (PETDistributionEventTracker *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"HasPresentedIconPageManagement" registerProperties:v4];
    pageManagementPresentationTracker = v2->_pageManagementPresentationTracker;
    v2->_pageManagementPresentationTracker = (PETScalarEventTracker *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"TotalDeletedIconPages" registerProperties:v4];
    pageDeletionTracker = v2->_pageDeletionTracker;
    v2->_pageDeletionTracker = (PETScalarEventTracker *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"HasMovedIconPage" registerProperties:v4];
    pageMovementTracker = v2->_pageMovementTracker;
    v2->_pageMovementTracker = (PETScalarEventTracker *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"HasHidIconPage" registerProperties:v4];
    pageHidingTracker = v2->_pageHidingTracker;
    v2->_pageHidingTracker = (PETScalarEventTracker *)v17;
  }
  return v2;
}

uint64_t __54__SBIconPageManagementMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4FA7570];
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7568]];

  unint64_t v8 = [v7 unsignedIntegerValue];
  uint64_t v9 = MEMORY[0x1E4F1CBF0];
  [*(id *)(*(void *)(a1 + 32) + 8) trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:(double)v8];
  [*(id *)(*(void *)(a1 + 32) + 16) trackEventWithPropertyValues:v9 value:(double)v6];
  v10 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v10 trackEventWithPropertyValues:v9 value:(double)(v8 + v6)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageHidingTracker, 0);
  objc_storeStrong((id *)&self->_pageMovementTracker, 0);
  objc_storeStrong((id *)&self->_pageDeletionTracker, 0);
  objc_storeStrong((id *)&self->_pageManagementPresentationTracker, 0);
  objc_storeStrong((id *)&self->_pagesCountTracker, 0);
  objc_storeStrong((id *)&self->_pagesVisibleTracker, 0);
  objc_storeStrong((id *)&self->_pagesHiddenTracker, 0);
}

@end