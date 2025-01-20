@interface PGPeopleMemoryTitleGenerator
+ (id)peopleOverTimeTimeTitleOptionsWithMomentNodes:(id)a3;
- (BOOL)_person:(id)a3 isPresentInAnyMomentOfMomentNodes:(id)a4;
- (BOOL)_useSplitTimeTitlesIfNeeded;
- (NSSet)personNodes;
- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 seasonName:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7;
- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 timeTitleOptions:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7;
- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 type:(unint64_t)a5 titleGenerationContext:(id)a6;
- (PGTimeTitleOptions)timeTitleOptions;
- (id)_birthdayTitleForPeople;
- (id)_timeTitleForEarlyMoments;
- (id)_timeTitleForPeople;
- (id)_titleForChildAndPerson;
- (id)_titleForEarlyMoments;
- (id)_titleForPeople;
- (id)_titleForSocialGroup;
- (unint64_t)type;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGPeopleMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTitleOptions, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
}

- (PGTimeTitleOptions)timeTitleOptions
{
  return self->_timeTitleOptions;
}

- (NSSet)personNodes
{
  return self->_personNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

- (id)_timeTitleForPeople
{
  v2 = [(PGTitleGenerator *)self momentNodes];
  v3 = +[PGTimeTitleUtility peopleTimeTitleWithEventNodes:v2];

  v4 = +[PGTitle titleWithString:v3 category:5];

  return v4;
}

- (id)_birthdayTitleForPeople
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = self->_personNodes;
  if ([(NSSet *)self->_personNodes count] != 1)
  {
    v4 = +[PGLogging sharedLogging];
    v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v16 = [(NSSet *)self->_personNodes count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v18 = v16;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Trying to create birthday title with %lu people. Choosing any person.", buf, 0xCu);
    }

    v6 = [(NSSet *)self->_personNodes anyObject];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];

      v3 = (NSSet *)v7;
    }
  }
  v8 = [(PGTitleGenerator *)self titleGenerationContext];
  v9 = [v8 serviceManager];
  v10 = +[PGPeopleTitleUtility nameStringForPersonNodes:v3 includeMe:0 insertLineBreaks:1 serviceManager:v9];

  if (v10 && [v10 length])
  {
    v11 = NSString;
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithName %@" value:@"PGPeopleBirthdayTitleFormatWithName %@" table:@"Localizable"];
    v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v10);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_person:(id)a3 isPresentInAnyMomentOfMomentNodes:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && [v6 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "hasEdgeFromNode:", v5, (void)v13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_timeTitleForEarlyMoments
{
  v3 = objc_opt_new();
  v4 = [(PGTitleGenerator *)self momentNodes];
  [v3 setMomentNodes:v4];

  [v3 setAllowedFormats:4];
  [v3 setFilterDates:0];
  id v5 = [(PGTitleGenerator *)self featuredYearNodes];
  [v3 setFeaturedYearNodes:v5];

  id v6 = +[PGTimeTitleUtility timeTitleWithOptions:v3];
  uint64_t v7 = +[PGTitle titleWithString:v6 category:5];

  return v7;
}

- (id)_titleForEarlyMoments
{
  v3 = [PGSpecBasedTitleGenerator alloc];
  v4 = [(PGTitleGenerator *)self momentNodes];
  personNodes = self->_personNodes;
  id v6 = [(PGTitleGenerator *)self titleGenerationContext];
  uint64_t v7 = [(PGSpecBasedTitleGenerator *)v3 initWithMomentNodes:v4 personNodes:personNodes memoryCategory:219 subcategory:0 titleGenerationContext:v6];

  id v8 = [(PGSpecBasedTitleGenerator *)v7 title];

  return v8;
}

- (id)_titleForChildAndPerson
{
  v3 = [(NSSet *)self->_personNodes anyObject];
  v4 = [v3 graph];
  id v5 = +[PGGraphNodeCollection nodesInGraph:v4];
  id v6 = [v5 anyNode];

  if (v6) {
    BOOL v7 = [(NSSet *)self->_personNodes containsObject:v6];
  }
  else {
    BOOL v7 = 0;
  }
  personNodes = self->_personNodes;
  uint64_t v9 = [(PGTitleGenerator *)self titleGenerationContext];
  uint64_t v10 = [v9 serviceManager];
  v11 = +[PGPeopleTitleUtility nameStringForPersonNodes:personNodes includeMe:v7 allowUnnamed:1 allowedGroupsFormat:1 insertLineBreaks:1 serviceManager:v10];

  v12 = +[PGTitle titleWithString:v11 category:3];

  return v12;
}

- (id)_titleForSocialGroup
{
  v3 = [(NSSet *)self->_personNodes anyObject];
  v4 = [v3 graph];
  id v5 = +[PGGraphNodeCollection nodesInGraph:v4];
  id v6 = [v5 anyNode];

  if (v6)
  {
    if ([(NSSet *)self->_personNodes containsObject:v6])
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [(PGTitleGenerator *)self momentNodes];
      BOOL v7 = [(PGPeopleMemoryTitleGenerator *)self _person:v6 isPresentInAnyMomentOfMomentNodes:v8];
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  personNodes = self->_personNodes;
  uint64_t v10 = [(PGTitleGenerator *)self titleGenerationContext];
  v11 = [v10 serviceManager];
  v12 = +[PGPeopleTitleUtility nameStringForPersonNodes:personNodes includeMe:v7 insertLineBreaks:1 serviceManager:v11];

  long long v13 = +[PGTitle titleWithString:v12 category:3];

  return v13;
}

- (id)_titleForPeople
{
  personNodes = self->_personNodes;
  v3 = [(PGTitleGenerator *)self titleGenerationContext];
  v4 = [v3 serviceManager];
  id v5 = +[PGPeopleTitleUtility nameStringForPersonNodes:personNodes includeMe:0 insertLineBreaks:1 serviceManager:v4];

  id v6 = +[PGTitle titleWithString:v5 category:3];

  return v6;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  v11 = (void (**)(id, void *, void *))a3;
  if (self->_timeTitleOptions)
  {
    v4 = +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:");
    if (v4)
    {
      id v5 = +[PGTitle titleWithString:v4 category:5];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  switch(self->_type)
  {
    case 0uLL:
    case 1uLL:
      uint64_t v6 = [(PGPeopleMemoryTitleGenerator *)self _titleForPeople];
      goto LABEL_15;
    case 2uLL:
      uint64_t v6 = [(PGPeopleMemoryTitleGenerator *)self _titleForSocialGroup];
      goto LABEL_15;
    case 3uLL:
      BOOL v7 = [(PGPeopleMemoryTitleGenerator *)self _titleForEarlyMoments];
      if (v5) {
        goto LABEL_18;
      }
      uint64_t v8 = [(PGPeopleMemoryTitleGenerator *)self _timeTitleForEarlyMoments];
      goto LABEL_17;
    case 4uLL:
      BOOL v7 = [(PGPeopleMemoryTitleGenerator *)self _titleForPeople];
      uint64_t v9 = [(PGTitleGenerator *)self momentNodes];
      uint64_t v10 = +[PGSeasonMemoryTitleGenerator seasonSubtitleWithMomentNodes:v9 seasonName:self->_seasonName];

      id v5 = (void *)v10;
      goto LABEL_18;
    case 5uLL:
      uint64_t v6 = [(PGPeopleMemoryTitleGenerator *)self _titleForChildAndPerson];
LABEL_15:
      BOOL v7 = (void *)v6;
      if (v5) {
        goto LABEL_18;
      }
      uint64_t v8 = [(PGPeopleMemoryTitleGenerator *)self _timeTitleForPeople];
LABEL_17:
      id v5 = (void *)v8;
LABEL_18:
      if (v11) {
        v11[2](v11, v7, v5);
      }

      return;
    default:
      BOOL v7 = 0;
      goto LABEL_18;
  }
}

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 seasonName:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v13 = a5;
  long long v14 = [(PGPeopleMemoryTitleGenerator *)self initWithMomentNodes:a3 personNodes:a4 type:a6 titleGenerationContext:a7];
  long long v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_seasonName, a5);
  }

  return v15;
}

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 timeTitleOptions:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPeopleMemoryTitleGenerator;
  long long v15 = [(PGTitleGenerator *)&v19 initWithMomentNodes:a3 referenceDateInterval:0 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:0 titleGenerationContext:a7];
  long long v16 = v15;
  if (v15)
  {
    v15->_type = a6;
    objc_storeStrong((id *)&v15->_personNodes, a4);
    objc_storeStrong((id *)&v16->_timeTitleOptions, a5);
    v17 = [(PGTitleGenerator *)v16 locale];
    [(PGTimeTitleOptions *)v16->_timeTitleOptions setLocale:v17];
  }
  return v16;
}

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 type:(unint64_t)a5 titleGenerationContext:(id)a6
{
  return [(PGPeopleMemoryTitleGenerator *)self initWithMomentNodes:a3 personNodes:a4 timeTitleOptions:0 type:a5 titleGenerationContext:a6];
}

+ (id)peopleOverTimeTimeTitleOptionsWithMomentNodes:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PGTimeTitleOptions);
  [(PGTimeTitleOptions *)v4 setMomentNodes:v3];

  [(PGTimeTitleOptions *)v4 setAllowedFormats:20];
  [(PGTimeTitleOptions *)v4 setUsePeopleSubtitleFormatWithYears:1];
  [(PGTimeTitleOptions *)v4 setFilterDates:0];
  return v4;
}

@end