@interface PGExcitingMomentsMemoryTitleGenerator
- (PGExcitingMomentsMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5;
- (PGGraphPersonNodeCollection)personNodeAsCollection;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setPersonNodeAsCollection:(id)a3;
@end

@implementation PGExcitingMomentsMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

- (void)setPersonNodeAsCollection:(id)a3
{
}

- (PGGraphPersonNodeCollection)personNodeAsCollection
{
  return self->_personNodeAsCollection;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  personNodeAsCollection = self->_personNodeAsCollection;
  v5 = (void (**)(id, id, void *))a3;
  v6 = [(MANodeCollection *)personNodeAsCollection anyNode];
  v7 = +[PGPeopleTitleUtility nameFromPersonNode:v6 serviceManager:self->_serviceManager];

  if ([v7 length])
  {
    v8 = NSString;
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"PGExcitingMomentsWithPersonMemoryTypeFormat" value:@"PGExcitingMomentsWithPersonMemoryTypeFormat" table:@"Localizable"];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v9 localizedStringForKey:@"PGExcitingMomentsMemoryTypeFormat" value:@"PGExcitingMomentsMemoryTypeFormat" table:@"Localizable"];
  }

  id v17 = +[PGTitle titleWithString:v11 category:0];

  v12 = objc_alloc_init(PGTimeTitleOptions);
  v13 = [(PGTitleGenerator *)self momentNodes];
  [(PGTimeTitleOptions *)v12 setMomentNodes:v13];

  [(PGTimeTitleOptions *)v12 setAllowedFormats:20];
  v14 = [(PGTitleGenerator *)self featuredYearNodes];
  [(PGTimeTitleOptions *)v12 setFeaturedYearNodes:v14];

  v15 = +[PGTimeTitleUtility timeTitleWithOptions:v12];
  v16 = +[PGTitle titleWithString:v15 category:5];
  v5[2](v5, v17, v16);
}

- (PGExcitingMomentsMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGExcitingMomentsMemoryTitleGenerator;
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