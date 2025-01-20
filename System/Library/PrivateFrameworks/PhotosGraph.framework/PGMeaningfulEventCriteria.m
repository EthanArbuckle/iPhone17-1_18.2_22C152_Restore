@interface PGMeaningfulEventCriteria
- (BOOL)isDebug;
- (PGGraph)graph;
- (PGMeaningfulEventCollectionTrait)datesTrait;
- (PGMeaningfulEventCollectionTrait)peopleTrait;
- (PGMeaningfulEventCollectionTrait)poisTrait;
- (PGMeaningfulEventCollectionTrait)publicEventCategoriesTrait;
- (PGMeaningfulEventCollectionTrait)roisTrait;
- (PGMeaningfulEventCollectionTrait)socialGroupsTrait;
- (PGMeaningfulEventCriteria)initWithGraph:(id)a3;
- (PGMeaningfulEventLocationCollectionTrait)locationsTrait;
- (PGMeaningfulEventLocationMobilityTrait)locationMobilityTrait;
- (PGMeaningfulEventNumberTrait)maximumDurationTrait;
- (PGMeaningfulEventNumberTrait)minimumDurationTrait;
- (PGMeaningfulEventNumberTrait)numberOfPeopleTrait;
- (PGMeaningfulEventPartOfDayTrait)allPartsOfDayTrait;
- (PGMeaningfulEventPartOfDayTrait)significantPartsOfDayTrait;
- (PGMeaningfulEventSceneCollectionTrait)scenesTrait;
- (id)_debugDescriptionWithMomentNode:(id)a3;
- (void)setAllPartsOfDayTrait:(id)a3;
- (void)setDatesTrait:(id)a3;
- (void)setDebug:(BOOL)a3;
- (void)setLocationMobilityTrait:(id)a3;
- (void)setLocationsTrait:(id)a3;
- (void)setMaximumDurationTrait:(id)a3;
- (void)setMinimumDurationTrait:(id)a3;
- (void)setNumberOfPeopleTrait:(id)a3;
- (void)setPeopleTrait:(id)a3;
- (void)setPoisTrait:(id)a3;
- (void)setPublicEventCategoriesTrait:(id)a3;
- (void)setRoisTrait:(id)a3;
- (void)setScenesTrait:(id)a3;
- (void)setSignificantPartsOfDayTrait:(id)a3;
- (void)setSocialGroupsTrait:(id)a3;
@end

@implementation PGMeaningfulEventCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoriesTrait, 0);
  objc_storeStrong((id *)&self->_locationMobilityTrait, 0);
  objc_storeStrong((id *)&self->_allPartsOfDayTrait, 0);
  objc_storeStrong((id *)&self->_significantPartsOfDayTrait, 0);
  objc_storeStrong((id *)&self->_maximumDurationTrait, 0);
  objc_storeStrong((id *)&self->_minimumDurationTrait, 0);
  objc_storeStrong((id *)&self->_socialGroupsTrait, 0);
  objc_storeStrong((id *)&self->_numberOfPeopleTrait, 0);
  objc_storeStrong((id *)&self->_peopleTrait, 0);
  objc_storeStrong((id *)&self->_datesTrait, 0);
  objc_storeStrong((id *)&self->_locationsTrait, 0);
  objc_storeStrong((id *)&self->_poisTrait, 0);
  objc_storeStrong((id *)&self->_roisTrait, 0);
  objc_storeStrong((id *)&self->_scenesTrait, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void)setPublicEventCategoriesTrait:(id)a3
{
}

- (PGMeaningfulEventCollectionTrait)publicEventCategoriesTrait
{
  return self->_publicEventCategoriesTrait;
}

- (void)setLocationMobilityTrait:(id)a3
{
}

- (void)setAllPartsOfDayTrait:(id)a3
{
}

- (void)setSignificantPartsOfDayTrait:(id)a3
{
}

- (void)setMaximumDurationTrait:(id)a3
{
}

- (void)setMinimumDurationTrait:(id)a3
{
}

- (void)setSocialGroupsTrait:(id)a3
{
}

- (void)setNumberOfPeopleTrait:(id)a3
{
}

- (void)setPeopleTrait:(id)a3
{
}

- (void)setDatesTrait:(id)a3
{
}

- (void)setLocationsTrait:(id)a3
{
}

- (void)setPoisTrait:(id)a3
{
}

- (void)setRoisTrait:(id)a3
{
}

- (void)setScenesTrait:(id)a3
{
}

- (PGGraph)graph
{
  return self->_graph;
}

- (id)_debugDescriptionWithMomentNode:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  if ([v4 isSmartInteresting]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([v4 isInteresting]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v5 appendFormat:@"\n\tsmartInteresting: %@, interesting: %@", v6, v7];
  objc_msgSend(v5, "appendFormat:", @"\n\tassetCount: %lu,", objc_msgSend(v4, "numberOfAssets"));
  v8 = [(PGMeaningfulEventCriteria *)self significantPartsOfDayTrait];
  v9 = [v8 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tsignificantPartsOfDay: %@,", v9];

  v10 = [(PGMeaningfulEventCriteria *)self allPartsOfDayTrait];
  v11 = [v10 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tallPartsOfDay: %@,", v11];

  v12 = [(PGMeaningfulEventCriteria *)self minimumDurationTrait];
  v13 = [v12 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tminDuration: %@,", v13];

  v14 = [(PGMeaningfulEventCriteria *)self maximumDurationTrait];
  v15 = [v14 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tmaxDuration: %@,", v15];

  v16 = [(PGMeaningfulEventCriteria *)self numberOfPeopleTrait];
  v17 = [v16 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tnumberOfPeople: %@,", v17];

  v18 = [(PGMeaningfulEventCriteria *)self locationMobilityTrait];
  v19 = [v18 debugDescriptionWithMomentNode:v4];
  [v5 appendFormat:@"\n\tlocationMobility: %@,", v19];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke;
  aBlock[3] = &unk_1E68E7F20;
  id v20 = v5;
  id v40 = v20;
  id v21 = v4;
  id v41 = v21;
  v22 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke_2;
  v36[3] = &unk_1E68E7F20;
  id v23 = v20;
  id v37 = v23;
  id v38 = v21;
  id v24 = v21;
  v25 = (void (**)(void *, __CFString *, void *))_Block_copy(v36);
  v26 = [(PGMeaningfulEventCriteria *)self datesTrait];
  v22[2](v22, @"dates", v26);

  v27 = [(PGMeaningfulEventCriteria *)self peopleTrait];
  v22[2](v22, @"people", v27);

  v28 = [(PGMeaningfulEventCriteria *)self socialGroupsTrait];
  v22[2](v22, @"socialGroups", v28);

  v29 = [(PGMeaningfulEventCriteria *)self locationsTrait];
  v22[2](v22, @"locations", v29);

  v30 = [(PGMeaningfulEventCriteria *)self poisTrait];
  v22[2](v22, @"pois", v30);

  v31 = [(PGMeaningfulEventCriteria *)self roisTrait];
  v22[2](v22, @"rois", v31);

  v32 = [(PGMeaningfulEventCriteria *)self scenesTrait];
  v25[2](v25, @"scenes", v32);

  v33 = [(PGMeaningfulEventCriteria *)self publicEventCategoriesTrait];
  v22[2](v22, @"publicEvents", v33);

  id v34 = v23;
  return v34;
}

void __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [v5 nodes];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v5 debugDescriptionWithMomentNode:*(void *)(a1 + 40)];
    [v8 appendFormat:@"\n\t%@: %@", v10, v9];
  }
}

void __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [v5 nodes];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v5 debugDescriptionWithMomentNode:*(void *)(a1 + 40)];
    [v8 appendFormat:@"\n\t%@: %@", v10, v9];
  }
}

- (PGMeaningfulEventNumberTrait)maximumDurationTrait
{
  maximumDurationTrait = self->_maximumDurationTrait;
  if (!maximumDurationTrait)
  {
    id v4 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:0.0];
    id v5 = self->_maximumDurationTrait;
    self->_maximumDurationTrait = v4;

    maximumDurationTrait = self->_maximumDurationTrait;
  }
  return maximumDurationTrait;
}

- (PGMeaningfulEventNumberTrait)minimumDurationTrait
{
  minimumDurationTrait = self->_minimumDurationTrait;
  if (!minimumDurationTrait)
  {
    id v4 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:0.0];
    id v5 = self->_minimumDurationTrait;
    self->_minimumDurationTrait = v4;

    minimumDurationTrait = self->_minimumDurationTrait;
  }
  return minimumDurationTrait;
}

- (PGMeaningfulEventLocationMobilityTrait)locationMobilityTrait
{
  locationMobilityTrait = self->_locationMobilityTrait;
  if (!locationMobilityTrait)
  {
    id v4 = [[PGMeaningfulEventLocationMobilityTrait alloc] initWithMobility:0];
    id v5 = self->_locationMobilityTrait;
    self->_locationMobilityTrait = v4;

    locationMobilityTrait = self->_locationMobilityTrait;
  }
  return locationMobilityTrait;
}

- (PGMeaningfulEventPartOfDayTrait)allPartsOfDayTrait
{
  allPartsOfDayTrait = self->_allPartsOfDayTrait;
  if (!allPartsOfDayTrait)
  {
    id v4 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:1];
    id v5 = self->_allPartsOfDayTrait;
    self->_allPartsOfDayTrait = v4;

    allPartsOfDayTrait = self->_allPartsOfDayTrait;
  }
  return allPartsOfDayTrait;
}

- (PGMeaningfulEventPartOfDayTrait)significantPartsOfDayTrait
{
  significantPartsOfDayTrait = self->_significantPartsOfDayTrait;
  if (!significantPartsOfDayTrait)
  {
    id v4 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:1];
    id v5 = self->_significantPartsOfDayTrait;
    self->_significantPartsOfDayTrait = v4;

    significantPartsOfDayTrait = self->_significantPartsOfDayTrait;
  }
  return significantPartsOfDayTrait;
}

- (PGMeaningfulEventCollectionTrait)socialGroupsTrait
{
  socialGroupsTrait = self->_socialGroupsTrait;
  if (!socialGroupsTrait)
  {
    id v4 = [PGMeaningfulEventCollectionTrait alloc];
    id v5 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:self->_graph];
    v6 = [(PGMeaningfulEventCollectionTrait *)v4 initWithNodes:v5];
    uint64_t v7 = self->_socialGroupsTrait;
    self->_socialGroupsTrait = v6;

    socialGroupsTrait = self->_socialGroupsTrait;
  }
  return socialGroupsTrait;
}

- (PGMeaningfulEventNumberTrait)numberOfPeopleTrait
{
  numberOfPeopleTrait = self->_numberOfPeopleTrait;
  if (!numberOfPeopleTrait)
  {
    id v4 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:0.0];
    id v5 = self->_numberOfPeopleTrait;
    self->_numberOfPeopleTrait = v4;

    numberOfPeopleTrait = self->_numberOfPeopleTrait;
  }
  return numberOfPeopleTrait;
}

- (PGMeaningfulEventCollectionTrait)peopleTrait
{
  peopleTrait = self->_peopleTrait;
  if (!peopleTrait)
  {
    id v4 = [PGMeaningfulEventCollectionTrait alloc];
    id v5 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:self->_graph];
    v6 = [(PGMeaningfulEventCollectionTrait *)v4 initWithNodes:v5];
    uint64_t v7 = self->_peopleTrait;
    self->_peopleTrait = v6;

    peopleTrait = self->_peopleTrait;
  }
  return peopleTrait;
}

- (PGMeaningfulEventCollectionTrait)datesTrait
{
  datesTrait = self->_datesTrait;
  if (!datesTrait)
  {
    id v4 = [PGMeaningfulEventCollectionTrait alloc];
    id v5 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:self->_graph];
    v6 = [(PGMeaningfulEventCollectionTrait *)v4 initWithNodes:v5];
    uint64_t v7 = self->_datesTrait;
    self->_datesTrait = v6;

    datesTrait = self->_datesTrait;
  }
  return datesTrait;
}

- (PGMeaningfulEventLocationCollectionTrait)locationsTrait
{
  locationsTrait = self->_locationsTrait;
  if (!locationsTrait)
  {
    id v4 = [(PGMeaningfulEventCollectionTrait *)[PGMeaningfulEventLocationCollectionTrait alloc] initWithNodes:0];
    id v5 = self->_locationsTrait;
    self->_locationsTrait = v4;

    locationsTrait = self->_locationsTrait;
  }
  return locationsTrait;
}

- (PGMeaningfulEventCollectionTrait)poisTrait
{
  poisTrait = self->_poisTrait;
  if (!poisTrait)
  {
    id v4 = [PGMeaningfulEventCollectionTrait alloc];
    id v5 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:self->_graph];
    v6 = [(PGMeaningfulEventCollectionTrait *)v4 initWithNodes:v5];
    uint64_t v7 = self->_poisTrait;
    self->_poisTrait = v6;

    poisTrait = self->_poisTrait;
  }
  return poisTrait;
}

- (PGMeaningfulEventCollectionTrait)roisTrait
{
  roisTrait = self->_roisTrait;
  if (!roisTrait)
  {
    id v4 = [PGMeaningfulEventCollectionTrait alloc];
    id v5 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:self->_graph];
    v6 = [(PGMeaningfulEventCollectionTrait *)v4 initWithNodes:v5];
    uint64_t v7 = self->_roisTrait;
    self->_roisTrait = v6;

    roisTrait = self->_roisTrait;
  }
  return roisTrait;
}

- (PGMeaningfulEventSceneCollectionTrait)scenesTrait
{
  return self->_scenesTrait;
}

- (PGMeaningfulEventCriteria)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMeaningfulEventCriteria;
  v6 = [(PGMeaningfulEventCriteria *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v7->_debug = 0;
  }

  return v7;
}

@end