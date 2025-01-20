@interface SUManagerEngineDownloadDescriptor
+ (id)phaseToString:(int64_t)a3;
- (BOOL)armInstall:(id)a3;
- (BOOL)disarmInstall;
- (MAAsset)asset;
- (NSDate)releaseDate;
- (NSString)installTonightConfig;
- (NSString)sessionID;
- (SUCoreDescriptor)coreDescriptor;
- (SUDownloadOptions)downloadOptions;
- (SUInstallOptions)installOptions;
- (SUManagerEngineDownloadDescriptor)initWithAsset:(id)a3 releaseDate:(id)a4 sessionID:(id)a5 scanOptions:(id)a6 downloadOptions:(id)a7 installTonightConfig:(id)a8 coreDescriptor:(id)a9 downloadAtPhase:(int64_t)a10;
- (SUScanOptions)scanOptions;
- (id)summary;
- (int64_t)atPhase;
- (void)resetPhase;
- (void)setAsset:(id)a3;
- (void)setAtPhase:(int64_t)a3;
- (void)setCoreDescriptor:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setInstallOptions:(id)a3;
- (void)setInstallTonightConfig:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setScanOptions:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation SUManagerEngineDownloadDescriptor

- (SUManagerEngineDownloadDescriptor)initWithAsset:(id)a3 releaseDate:(id)a4 sessionID:(id)a5 scanOptions:(id)a6 downloadOptions:(id)a7 installTonightConfig:(id)a8 coreDescriptor:(id)a9 downloadAtPhase:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SUManagerEngineDownloadDescriptor;
  v23 = [(SUManagerEngineDownloadDescriptor *)&v27 init];
  v24 = v23;
  if (v23)
  {
    [(SUManagerEngineDownloadDescriptor *)v23 setAsset:v16];
    [(SUManagerEngineDownloadDescriptor *)v24 setReleaseDate:v17];
    [(SUManagerEngineDownloadDescriptor *)v24 setSessionID:v18];
    [(SUManagerEngineDownloadDescriptor *)v24 setScanOptions:v19];
    [(SUManagerEngineDownloadDescriptor *)v24 setDownloadOptions:v20];
    [(SUManagerEngineDownloadDescriptor *)v24 setInstallOptions:0];
    [(SUManagerEngineDownloadDescriptor *)v24 setInstallTonightConfig:v21];
    [(SUManagerEngineDownloadDescriptor *)v24 setCoreDescriptor:v22];
    [(SUManagerEngineDownloadDescriptor *)v24 setAtPhase:a10];
    v25 = v24;
  }

  return v24;
}

+ (id)phaseToString:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return @"DownloadPhaseUndefined";
  }
  else {
    return off_26447D748[a3];
  }
}

- (id)summary
{
  id v3 = [NSString alloc];
  v4 = [(SUManagerEngineDownloadDescriptor *)self asset];
  v5 = [(SUManagerEngineDownloadDescriptor *)self releaseDate];
  v6 = [(SUManagerEngineDownloadDescriptor *)self sessionID];
  v7 = [(SUManagerEngineDownloadDescriptor *)self scanOptions];
  v8 = [(SUManagerEngineDownloadDescriptor *)self downloadOptions];
  v9 = [(SUManagerEngineDownloadDescriptor *)self installTonightConfig];
  v10 = +[SUManagerEngineDownloadDescriptor phaseToString:[(SUManagerEngineDownloadDescriptor *)self atPhase]];
  v11 = [(SUManagerEngineDownloadDescriptor *)self coreDescriptor];
  v12 = [v11 summary];
  v13 = (void *)[v3 initWithFormat:@"asset:%@ releaseDate:%@ sessionID:%@ scanOptions:%@ downloadOptions:%@ installTonightConfig:%@ atPhase:%@, coreDescriptor:%@", v4, v5, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (void)resetPhase
{
}

- (BOOL)armInstall:(id)a3
{
  id v4 = a3;
  if ([(SUManagerEngineDownloadDescriptor *)self atPhase] == 5
    || [(SUManagerEngineDownloadDescriptor *)self atPhase] == 6)
  {
    [(SUManagerEngineDownloadDescriptor *)self setAtPhase:6];
    BOOL v5 = 1;
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
    BOOL v5 = 0;
  }
  [(SUManagerEngineDownloadDescriptor *)self setInstallOptions:v6];

  return v5;
}

- (BOOL)disarmInstall
{
  [(SUManagerEngineDownloadDescriptor *)self setInstallOptions:0];
  int64_t v3 = [(SUManagerEngineDownloadDescriptor *)self atPhase];
  if (v3 == 6) {
    [(SUManagerEngineDownloadDescriptor *)self setAtPhase:5];
  }
  return v3 == 6;
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void)setInstallOptions:(id)a3
{
}

- (NSString)installTonightConfig
{
  return self->_installTonightConfig;
}

- (void)setInstallTonightConfig:(id)a3
{
}

- (SUCoreDescriptor)coreDescriptor
{
  return self->_coreDescriptor;
}

- (void)setCoreDescriptor:(id)a3
{
}

- (int64_t)atPhase
{
  return self->_atPhase;
}

- (void)setAtPhase:(int64_t)a3
{
  self->_atPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDescriptor, 0);
  objc_storeStrong((id *)&self->_installTonightConfig, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end