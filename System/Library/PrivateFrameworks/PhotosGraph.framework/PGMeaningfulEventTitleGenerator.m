@interface PGMeaningfulEventTitleGenerator
- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6;
- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6 featureNodes:(id)a7;
- (id)_meaningLabelForTitle;
- (id)_timeTitle;
- (id)_title;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGMeaningfulEventTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

- (id)_timeTitle
{
  v3 = objc_alloc_init(PGTimeTitleOptions);
  if ([(NSString *)self->_meaningLabel isEqualToString:@"Birthday"]) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  [(PGTimeTitleOptions *)v3 setAllowedFormats:v4];
  v5 = [(PGTitleGenerator *)self momentNodes];
  [(PGTimeTitleOptions *)v3 setMomentNodes:v5];

  v6 = [(PGTitleGenerator *)self usedLocationNodes];
  [(PGTimeTitleOptions *)v3 setLocationNodes:v6];

  v7 = +[PGTimeTitleUtility timeTitleWithOptions:v3];
  v8 = +[PGTitle titleWithString:v7 category:5];

  return v8;
}

- (id)_meaningLabelForTitle
{
  v3 = self->_meaningLabel;
  if ([(NSString *)v3 isEqualToString:@"AmusementPark"]
    || [(NSString *)v3 isEqualToString:@"Festival"]
    || [(NSString *)v3 isEqualToString:@"Museum"])
  {
    uint64_t v4 = kPGGraphNodeMeaningEntertainment;
  }
  else
  {
    if (![(NSString *)v3 isEqualToString:@"Concert"]
      && ![(NSString *)v3 isEqualToString:@"Theater"]
      && ![(NSString *)v3 isEqualToString:@"Dance"])
    {
      goto LABEL_6;
    }
    uint64_t v4 = kPGGraphNodeMeaningPerformance;
  }
  v5 = *v4;

  v3 = (NSString *)v5;
LABEL_6:
  if (self->_meaningIsReliable) {
    goto LABEL_7;
  }
  if (_meaningLabelForTitle_onceToken2 != -1) {
    dispatch_once(&_meaningLabelForTitle_onceToken2, &__block_literal_global_64591);
  }
  v6 = [(id)_meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel objectForKeyedSubscript:v3];
  if (!v6) {
LABEL_7:
  }
    v6 = v3;
  if ([(NSString *)v3 isEqualToString:@"Wedding"])
  {
    v7 = @"Celebration";

    v6 = @"Celebration";
  }

  return v6;
}

void __56__PGMeaningfulEventTitleGenerator__meaningLabelForTitle__block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Wedding";
  v2[1] = @"AmusementPark";
  v3[0] = @"Celebration";
  v3[1] = @"Entertainment";
  v2[2] = @"Performance";
  v2[3] = @"Concert";
  v3[2] = @"Entertainment";
  v3[3] = @"Entertainment";
  v2[4] = @"Festival";
  v2[5] = @"Theater";
  v3[4] = @"Entertainment";
  v3[5] = @"Entertainment";
  v2[6] = @"Dance";
  v2[7] = @"Museum";
  v3[6] = @"Entertainment";
  v3[7] = @"Entertainment";
  v2[8] = @"NightOut";
  v2[9] = @"SportEvent";
  v3[8] = @"Entertainment";
  v3[9] = @"Entertainment";
  v2[10] = @"WinterSport";
  v2[11] = @"Diving";
  v3[10] = @"Activity";
  v3[11] = @"Activity";
  v2[12] = @"Hiking";
  v2[13] = @"Climbing";
  v3[12] = @"Activity";
  v3[13] = @"Activity";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  v1 = (void *)_meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel;
  _meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel = v0;
}

- (id)_title
{
  v3 = [(PGMeaningfulEventTitleGenerator *)self _meaningLabelForTitle];
  if ([(MAElementCollection *)self->_featureNodes count]
    && [v3 isEqualToString:@"HolidayEvent"])
  {
    uint64_t v4 = +[PGGraphNodeCollection subsetInCollection:self->_featureNodes];
    if ([v4 count])
    {
      v5 = [v4 localizedHolidayNames];
      v6 = [v5 anyObject];

      v7 = +[PGTitle titleWithString:v6 category:5];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGMeaningfulEventTitleGenerator.m] MeaningfulEvent memory of type kPGGraphNodeMeaningHolidayEvent has no featureNode of type PGGraphHolidayNode.", v13, 2u);
      }
      v7 = 0;
    }
  }
  else
  {
    v8 = [PGSpecBasedTitleGenerator alloc];
    v9 = [(PGTitleGenerator *)self momentNodes];
    v10 = [(PGTitleGenerator *)self titleGenerationContext];
    v11 = [(PGSpecBasedTitleGenerator *)v8 initWithMomentNodes:v9 meaningLabel:v3 titleGenerationContext:v10];

    [(PGSpecBasedTitleGenerator *)v11 setLineBreakBehavior:[(PGTitleGenerator *)self lineBreakBehavior]];
    v7 = [(PGSpecBasedTitleGenerator *)v11 title];
  }
  return v7;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  v5 = [(PGMeaningfulEventTitleGenerator *)self _title];
  v6 = [(PGMeaningfulEventTitleGenerator *)self _timeTitle];
  v7 = [v5 stringValue];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v4[2](v4, v5, v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PGMeaningfulEventTitleGenerator;
    [(PGTitleGenerator *)&v9 _generateTitleAndSubtitleWithResult:v4];
  }
}

- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6
{
  return [(PGMeaningfulEventTitleGenerator *)self initWithCollection:a3 meaningLabel:a4 meaningIsReliable:a5 titleGenerationContext:a6 featureNodes:0];
}

- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6 featureNodes:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PGMeaningfulEventTitleGenerator;
  v15 = [(PGDefaultCollectionTitleGenerator *)&v18 initWithCollection:a3 keyAsset:0 curatedAssetCollection:0 titleGenerationContext:a6];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_meaningLabel, a4);
    v16->_meaningIsReliable = a5;
    objc_storeStrong((id *)&v16->_featureNodes, a7);
  }

  return v16;
}

@end