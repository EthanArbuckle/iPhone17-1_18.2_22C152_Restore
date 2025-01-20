@interface SBFolderStatsQueryableMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBFolderStatsQueryableMetric)init;
@end

@implementation SBFolderStatsQueryableMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  if (a3 == 11)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__SBFolderStatsQueryableMetric_handleEvent_withContext___block_invoke;
    v6[3] = &unk_1E6AF9508;
    v6[4] = self;
    [a4 stateForQueryName:0 completion:v6];
  }
  return a3 == 11;
}

- (SBFolderStatsQueryableMetric)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBFolderStatsQueryableMetric;
  v2 = [(SBFolderStatsQueryableMetric *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93718]);
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = [v3 initWithFeatureId:@"SpringBoard" event:@"DockApps" registerProperties:MEMORY[0x1E4F1CBF0]];
    dockAppsTracker = v2->_dockAppsTracker;
    v2->_dockAppsTracker = (PETDistributionEventTracker *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"DockFolders" registerProperties:v4];
    dockFoldersTracker = v2->_dockFoldersTracker;
    v2->_dockFoldersTracker = (PETDistributionEventTracker *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"DockItems" registerProperties:v4];
    dockItemsTracker = v2->_dockItemsTracker;
    v2->_dockItemsTracker = (PETDistributionEventTracker *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"Pages" registerProperties:v4];
    pageTracker = v2->_pageTracker;
    v2->_pageTracker = (PETDistributionEventTracker *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"Folders" registerProperties:v4];
    folderTracker = v2->_folderTracker;
    v2->_folderTracker = (PETDistributionEventTracker *)v13;
  }
  return v2;
}

void __56__SBFolderStatsQueryableMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FA7500]];
  unint64_t v4 = [v3 unsignedIntegerValue];

  uint64_t v5 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FA7508]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FA7518]];
  unint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FA7510]];
  unint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = 0;
  while (v6 >= qword_1D8FD0B80[v11])
  {
    if (++v11 == 20)
    {
      double v12 = 100.0;
      goto LABEL_8;
    }
  }
  if ((int)v11 <= 1) {
    LODWORD(v11) = 1;
  }
  double v12 = (double)qword_1D8FD0B80[(v11 - 1)];
LABEL_8:
  unint64_t v13 = v10 - v4;
  double v14 = (double)v4;
  uint64_t v15 = MEMORY[0x1E4F1CBF0];
  [*(id *)(*(void *)(a1 + 32) + 16) trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:v14];
  [*(id *)(*(void *)(a1 + 32) + 24) trackEventWithPropertyValues:v15 value:(double)v10];
  [*(id *)(*(void *)(a1 + 32) + 8) trackEventWithPropertyValues:v15 value:(double)v13];
  [*(id *)(*(void *)(a1 + 32) + 32) trackEventWithPropertyValues:v15 value:(double)v8];
  [*(id *)(*(void *)(a1 + 32) + 40) trackEventWithPropertyValues:v15 value:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderTracker, 0);
  objc_storeStrong((id *)&self->_pageTracker, 0);
  objc_storeStrong((id *)&self->_dockItemsTracker, 0);
  objc_storeStrong((id *)&self->_dockFoldersTracker, 0);
  objc_storeStrong((id *)&self->_dockAppsTracker, 0);
}

@end