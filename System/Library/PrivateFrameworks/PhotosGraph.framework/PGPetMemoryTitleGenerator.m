@interface PGPetMemoryTitleGenerator
- (BOOL)useAdventureTitle;
- (BOOL)usePetAndPersonTitle;
- (NSString)seasonName;
- (PGGraphPersonNodeCollection)personNodeAsCollection;
- (PGGraphPetNodeCollection)petNodes;
- (PGPetMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setPersonNodeAsCollection:(id)a3;
- (void)setPetNodes:(id)a3;
- (void)setSeasonName:(id)a3;
- (void)setUseAdventureTitle:(BOOL)a3;
- (void)setUsePetAndPersonTitle:(BOOL)a3;
@end

@implementation PGPetMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_petNodes, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

- (void)setPersonNodeAsCollection:(id)a3
{
}

- (PGGraphPersonNodeCollection)personNodeAsCollection
{
  return self->_personNodeAsCollection;
}

- (void)setPetNodes:(id)a3
{
}

- (PGGraphPetNodeCollection)petNodes
{
  return self->_petNodes;
}

- (void)setUsePetAndPersonTitle:(BOOL)a3
{
  self->_usePetAndPersonTitle = a3;
}

- (BOOL)usePetAndPersonTitle
{
  return self->_usePetAndPersonTitle;
}

- (void)setUseAdventureTitle:(BOOL)a3
{
  self->_useAdventureTitle = a3;
}

- (BOOL)useAdventureTitle
{
  return self->_useAdventureTitle;
}

- (void)setSeasonName:(id)a3
{
}

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    v41 = v4;
    if (self->_useAdventureTitle)
    {
      v5 = [(PGGraphPetNodeCollection *)self->_petNodes names];
      v6 = [v5 anyObject];

      uint64_t v7 = [v6 length];
      v8 = NSString;
      if (v7)
      {
        v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:@"PGPetAdventuresMemoryTitleWithNameFormat" value:@"PGPetAdventuresMemoryTitleWithNameFormat" table:@"Localizable"];
        objc_msgSend(v8, "localizedStringWithFormat:", v10, v6);
      }
      else
      {
        v9 = [NSString localizedStringWithFormat:@"PGPetAdventuresMemoryTitleFormat"];
        v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v10 localizedStringForKey:v9 value:v9 table:@"Localizable"];
      v18 = };

      v17 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v18];

      if (!v17)
      {
        v20 = 0;
        goto LABEL_34;
      }
      uint64_t v19 = +[PGTitle titleWithString:v17 category:1];
LABEL_12:
      v20 = (void *)v19;
LABEL_34:

      goto LABEL_35;
    }
    if (!self->_usePetAndPersonTitle)
    {
      v21 = [(PGGraphPetNodeCollection *)self->_petNodes names];
      v6 = [v21 anyObject];

      if ([v6 length])
      {
        uint64_t v22 = +[PGTitle titleWithString:v6 category:1];
        if (v22)
        {
          v20 = (void *)v22;
LABEL_35:

          if ([(NSString *)self->_seasonName length])
          {
            v36 = [(PGTitleGenerator *)self momentNodes];
            v37 = +[PGSeasonMemoryTitleGenerator seasonSubtitleWithMomentNodes:v36 seasonName:self->_seasonName];
          }
          else
          {
            v36 = objc_alloc_init(PGTimeTitleOptions);
            v38 = [(PGTitleGenerator *)self momentNodes];
            [(PGTimeTitleOptions *)v36 setMomentNodes:v38];

            [(PGTimeTitleOptions *)v36 setAllowedFormats:20];
            v39 = [(PGTitleGenerator *)self featuredYearNodes];
            [(PGTimeTitleOptions *)v36 setFeaturedYearNodes:v39];

            v40 = +[PGTimeTitleUtility timeTitleWithOptions:v36];
            v37 = +[PGTitle titleWithString:v40 category:5];
          }
          v41[2](v41, v20, v37);

          v4 = v41;
          goto LABEL_39;
        }
      }
      v25 = [PGSpecBasedTitleGenerator alloc];
      v26 = [(PGTitleGenerator *)self momentNodes];
      v27 = [(PGTitleGenerator *)self titleGenerationContext];
      v17 = [(PGSpecBasedTitleGenerator *)v25 initWithMomentNodes:v26 memoryCategory:0 subcategory:212 titleGenerationContext:v27];

      uint64_t v19 = [(PGSpecBasedTitleGenerator *)v17 title];
      goto LABEL_12;
    }
    unint64_t v11 = [(MAElementCollection *)self->_personNodeAsCollection count];
    v12 = [(PGGraphPetNodeCollection *)self->_petNodes names];
    v13 = v12;
    if (v11)
    {
      v6 = [v12 anyObject];

      v14 = [(PGPetMemoryTitleGenerator *)self personNodeAsCollection];
      v15 = [v14 anyNode];

      if ([v15 isMeNode])
      {
        v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"PGPeopleTitleFormatMePerson" value:@"PGPeopleTitleFormatMePerson" table:@"Localizable"];

LABEL_23:
        if ([v6 length] && -[PGSpecBasedTitleGenerator length](v17, "length"))
        {
          v28 = NSString;
          v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v30 = [v29 localizedStringForKey:@"PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@" value:@"PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@" table:@"Localizable"];
          v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v6, v17);

          v32 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v31];

          if (v32)
          {
            v20 = +[PGTitle titleWithString:v32 category:1];
            if (v20)
            {
LABEL_33:

              goto LABEL_34;
            }
          }
        }
        else
        {
          v32 = 0;
        }
        v33 = [NSString localizedStringWithFormat:@"PGPetAndPersonMemoryTitleFormat"];
        v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:v33 value:v33 table:@"Localizable"];

        v32 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v35];

        if (v32)
        {
          v20 = +[PGTitle titleWithString:v32 category:1];
        }
        else
        {
          v20 = 0;
        }

        goto LABEL_33;
      }
      uint64_t v24 = +[PGPeopleTitleUtility nameFromPersonNode:v15 serviceManager:self->_serviceManager];
    }
    else
    {
      v23 = [v12 allObjects];
      v15 = [v23 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

      if ([v15 count] != 2)
      {
        v17 = 0;
        v6 = 0;
        goto LABEL_23;
      }
      v6 = [v15 objectAtIndexedSubscript:0];
      uint64_t v24 = [v15 objectAtIndexedSubscript:1];
    }
    v17 = (PGSpecBasedTitleGenerator *)v24;
    goto LABEL_23;
  }
LABEL_39:
}

- (PGPetMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGPetMemoryTitleGenerator;
  v9 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:a4 titleGenerationContext:v8];
  if (v9)
  {
    uint64_t v10 = [v8 serviceManager];
    serviceManager = v9->_serviceManager;
    v9->_serviceManager = (CLSServiceManager *)v10;
  }
  return v9;
}

@end