@interface PGChildOutdoorMemoryTitleGenerator
- (PGChildOutdoorMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 type:(int64_t)a5 titleGenerationContext:(id)a6;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGChildOutdoorMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  if (a3)
  {
    personNode = self->_personNode;
    serviceManager = self->_serviceManager;
    v6 = (void (**)(id, void *, void *))a3;
    id v20 = +[PGPeopleTitleUtility nameFromPersonNode:personNode serviceManager:serviceManager];
    if ([v20 length])
    {
      v7 = NSString;
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"PGChildAdventuresMemoryTitle %@" value:@"PGChildAdventuresMemoryTitle %@" table:@"Localizable"];
      v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v20);

      v11 = v10;
      uint64_t v12 = 3;
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v13 localizedStringForKey:@"PGChildAdventuresMemoryTitle" value:@"PGChildAdventuresMemoryTitle" table:@"Localizable"];

      v11 = v10;
      uint64_t v12 = 1;
    }
    v14 = +[PGTitle titleWithString:v11 category:v12];
    v15 = objc_alloc_init(PGTimeTitleOptions);
    v16 = [(PGTitleGenerator *)self momentNodes];
    [(PGTimeTitleOptions *)v15 setMomentNodes:v16];

    [(PGTimeTitleOptions *)v15 setAllowedFormats:20];
    v17 = [(PGTitleGenerator *)self featuredYearNodes];
    [(PGTimeTitleOptions *)v15 setFeaturedYearNodes:v17];

    v18 = +[PGTimeTitleUtility timeTitleWithOptions:v15];
    v19 = +[PGTitle titleWithString:v18 category:5];
    v6[2](v6, v14, v19);
  }
}

- (PGChildOutdoorMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 type:(int64_t)a5 titleGenerationContext:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGChildOutdoorMemoryTitleGenerator;
  v13 = [(PGTitleGenerator *)&v18 initWithMomentNodes:a3 type:a5 titleGenerationContext:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personNode, a4);
    uint64_t v15 = [v12 serviceManager];
    serviceManager = v14->_serviceManager;
    v14->_serviceManager = (CLSServiceManager *)v15;
  }
  return v14;
}

@end