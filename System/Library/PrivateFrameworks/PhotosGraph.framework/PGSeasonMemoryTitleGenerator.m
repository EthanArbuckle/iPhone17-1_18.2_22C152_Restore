@interface PGSeasonMemoryTitleGenerator
+ (id)seasonSubtitleWithMomentNodes:(id)a3 seasonName:(id)a4;
- (NSString)season;
- (PGSeasonMemoryTitleGenerator)initWithMomentNodes:(id)a3 seasonName:(id)a4 titleGenerationContext:(id)a5;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setSeason:(id)a3;
@end

@implementation PGSeasonMemoryTitleGenerator

- (void).cxx_destruct
{
}

- (void)setSeason:(id)a3
{
}

- (NSString)season
{
  return self->_season;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  v12 = (void (**)(id, void *, void *))a3;
  v4 = [NSString localizedStringWithFormat:@"PGSeasonMemoryTitleFormat%@", self->_season];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:v4 table:@"Localizable"];

  v7 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v6];

  if (v7)
  {
    v8 = +[PGTitle titleWithString:v7 category:1];
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_class();
  v10 = [(PGTitleGenerator *)self momentNodes];
  v11 = [v9 seasonSubtitleWithMomentNodes:v10 seasonName:0];

  if (v12) {
    v12[2](v12, v8, v11);
  }
}

- (PGSeasonMemoryTitleGenerator)initWithMomentNodes:(id)a3 seasonName:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGSeasonMemoryTitleGenerator;
  v10 = [(PGTitleGenerator *)&v13 initWithMomentNodes:a3 type:0 titleGenerationContext:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_season, a4);
  }

  return v11;
}

+ (id)seasonSubtitleWithMomentNodes:(id)a3 seasonName:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:a3];
  v7 = objc_opt_new();
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  [v7 setMomentNodes:v8];

  [v7 setAllowedFormats:4];
  [v7 setFilterDates:0];
  id v9 = +[PGTimeTitleUtility timeTitleWithOptions:v7];
  v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  if (v5)
  {
    v11 = [NSString stringWithFormat:@"PGSeasonMemoryTitleFormat%@Year", v5];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v13 = [v12 localizedStringForKey:v11 value:v11 table:@"Localizable"];
    v17 = v10;
    PFStringWithValidatedFormat();
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_4:
      v15 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    id v14 = v9;
  }
  v15 = +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v14, 5, v17);

LABEL_7:
  return v15;
}

@end