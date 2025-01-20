@interface FREditorialAssembly
- (FREditorialAssembly)initWithFeldsparContext:(id)a3 dataProviderFactory:(id)a4;
- (FRFeldsparContext)feldsparContext;
- (FRFlintDataProviderFactory)dataProviderFactory;
- (void)loadInRegistry:(id)a3;
@end

@implementation FREditorialAssembly

- (FREditorialAssembly)initWithFeldsparContext:(id)a3 dataProviderFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FREditorialAssembly;
  v9 = [(FREditorialAssembly *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v10->_dataProviderFactory, a4);
  }

  return v10;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = [v4 publicContainer];
  id v6 = [v5 registerProtocol:&OBJC_PROTOCOL___FRToCEditorialManager factory:&stru_1000CA538];

  id v7 = [v4 publicContainer];
  id v8 = [v7 registerProtocol:&OBJC_PROTOCOL___TSEditorialItemProvider factory:&stru_1000CA578];

  v9 = [v4 publicContainer];
  v10 = [v9 registerProtocol:&OBJC_PROTOCOL___NUFontRegistration factory:&stru_1000CA5B8];
  id v11 = [v10 inScope:2];

  objc_super v12 = [v4 privateContainer];
  v13 = [v12 registerProtocol:&OBJC_PROTOCOL___FREditorialItemDownloader name:@"editorialTagDownloader" factory:&stru_1000CA5F8];
  id v14 = [v13 inScope:2];

  v15 = [v4 privateContainer];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10000D4D0;
  v42[3] = &unk_1000CA620;
  v42[4] = self;
  v16 = [v15 registerProtocol:&OBJC_PROTOCOL___FREditorialItemDownloader name:@"editorialArticleDownloader" factory:v42];
  id v17 = [v16 inScope:2];

  v18 = [v4 privateContainer];
  v19 = [v18 registerProtocol:&OBJC_PROTOCOL___FRArticleEditorialItemProvider factory:&stru_1000CA660];
  id v20 = [v19 inScope:2];

  v21 = [v4 privateContainer];
  v22 = [v21 registerProtocol:&OBJC_PROTOCOL___FREditorialItemEntryManager factory:&stru_1000CA6A0];
  v23 = [v22 withConfiguration:&stru_1000CA6E0];
  id v24 = [v23 inScope:2];

  v25 = [v4 privateContainer];
  v26 = [v25 registerProtocol:&OBJC_PROTOCOL___FREditorialItemCreator factory:&stru_1000CA720];
  id v27 = [v26 inScope:2];

  v28 = [v4 privateContainer];
  v29 = [v28 registerProtocol:&OBJC_PROTOCOL___FREditorialItemThumbnailCreator factory:&stru_1000CA760];
  id v30 = [v29 inScope:2];

  v31 = [v4 privateContainer];
  v32 = [v31 registerProtocol:&OBJC_PROTOCOL___FREditorialConfigurationProvider factory:&stru_1000CA7A0];
  id v33 = [v32 inScope:2];

  v34 = [v4 privateContainer];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000098F8;
  v41[3] = &unk_1000CA7C8;
  v41[4] = self;
  v35 = [v34 registerClass:objc_opt_class() name:@"editorialLocalStore" factory:v41];
  id v36 = [v35 inScope:2];

  v37 = [v4 privateContainer];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000E478;
  v40[3] = &unk_1000CA7F0;
  v40[4] = self;
  v38 = [v37 registerClass:objc_opt_class() factory:v40];
  id v39 = [v38 inScope:2];
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);

  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end