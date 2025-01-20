@interface NDAssembly
- (NDAssembly)initWithDocumentDirectoryFileURL:(id)a3 cacheDirectoryFileURL:(id)a4;
- (NSURL)cacheDirectoryFileURL;
- (NSURL)documentDirectoryFileURL;
- (void)loadInRegistry:(id)a3;
@end

@implementation NDAssembly

- (NDAssembly)initWithDocumentDirectoryFileURL:(id)a3 cacheDirectoryFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NDAssembly;
  v8 = [(NDAssembly *)&v14 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    documentDirectoryFileURL = v8->_documentDirectoryFileURL;
    v8->_documentDirectoryFileURL = v9;

    v11 = (NSURL *)[v7 copy];
    cacheDirectoryFileURL = v8->_cacheDirectoryFileURL;
    v8->_cacheDirectoryFileURL = v11;
  }
  return v8;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = FCBundle();
  id v6 = [v5 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  id v7 = FCBundle();
  v8 = [v7 objectForInfoDictionaryKey:@"CFBundleVersion"];

  v9 = [v4 publicContainer];
  uint64_t v10 = objc_opt_class();
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100014DBC;
  v49[3] = &unk_100061ED8;
  v49[4] = self;
  id v50 = v6;
  id v51 = v8;
  id v11 = v8;
  id v12 = v6;
  v13 = [v9 registerClass:v10 factory:v49];
  id v14 = [v13 inScope:2];

  v15 = [v4 publicContainer];
  id v16 = [v15 registerProtocol:&OBJC_PROTOCOL___FCNewsAppConfigurationManager factory:&stru_100061F18];

  v17 = [v4 publicContainer];
  id v18 = [v17 registerProtocol:&OBJC_PROTOCOL___FCCoreConfigurationManager factory:&stru_100061F38];

  v19 = [v4 publicContainer];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100014F8C;
  v48[3] = &unk_100061F60;
  v48[4] = self;
  v20 = [v19 registerClass:objc_opt_class() factory:v48];
  v21 = [v20 withConfiguration:&stru_100061FA0];
  id v22 = [v21 inScope:2];

  v23 = [v4 publicContainer];
  v24 = [v23 registerClass:objc_opt_class() factory:&stru_100061FE8];
  id v25 = [v24 inScope:2];

  v26 = [v4 publicContainer];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100015328;
  v47[3] = &unk_100061F60;
  v47[4] = self;
  v27 = [v26 registerProtocol:&OBJC_PROTOCOL___FCContentContext factory:v47];
  id v28 = [v27 inScope:2];

  v29 = [v4 publicContainer];
  v30 = [v29 registerProtocol:&OBJC_PROTOCOL___FCANFHelper factory:&stru_100062008];
  id v31 = [v30 inScope:2];

  v32 = [v4 publicContainer];
  v33 = [v32 registerProtocol:&OBJC_PROTOCOL___NDURLResolutionService factory:&stru_100062028];
  id v34 = [v33 inScope:2];

  v35 = [v4 publicContainer];
  v36 = [v35 registerClass:objc_opt_class() factory:&stru_100062048];
  id v37 = [v36 inScope:2];

  v38 = [v4 publicContainer];
  id v39 = [v38 registerProtocol:&OBJC_PROTOCOL___FCContentVariantProviding factory:&stru_100062068];

  v40 = [v4 privateContainer];
  v41 = [v40 registerClass:objc_opt_class() factory:&stru_100062088];
  id v42 = [v41 inScope:2];

  v43 = [v4 privateContainer];
  id v44 = [v43 registerProtocol:&OBJC_PROTOCOL___FCFeldsparIDProvider factory:&stru_1000620A8];

  v45 = [v4 publicContainer];

  id v46 = [v45 registerProtocol:&OBJC_PROTOCOL___FCNotificationPoolServiceType factory:&stru_1000620C8];
}

- (NSURL)documentDirectoryFileURL
{
  return self->_documentDirectoryFileURL;
}

- (NSURL)cacheDirectoryFileURL
{
  return self->_cacheDirectoryFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryFileURL, 0);

  objc_storeStrong((id *)&self->_documentDirectoryFileURL, 0);
}

@end