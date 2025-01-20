@interface APItunesMetaData
- (APItunesMetaData)initWithBundleID:(id)a3;
- (BOOL)installedAsTestApp;
- (BOOL)installedByAppStore;
- (BOOL)isAttributed;
- (BOOL)loadMetaDataWithError:(id *)a3;
- (NSNumber)adamID;
- (NSString)bundleID;
- (NSString)conversionDate;
- (NSString)distributorID;
- (NSString)impressionDate;
- (NSString)purchaseDate;
- (NSURL)bundleURL;
- (void)setBundleID:(id)a3;
@end

@implementation APItunesMetaData

- (APItunesMetaData)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APItunesMetaData;
  v6 = [(APItunesMetaData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (NSString)distributorID
{
  id v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = [(APItunesMetaData *)self bundleID];
  id v12 = 0;
  id v5 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v12];
  id v6 = v12;

  if (v6)
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [(APItunesMetaData *)self bundleID];
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to look up Application Record for %{public}@ due to error: %{public}@", buf, 0x16u);
    }
    objc_super v9 = 0;
  }
  else
  {
    v7 = [v5 iTunesMetadata];
    v10 = [v7 distributorInfo];
    objc_super v9 = [v10 distributorID];
  }

  return (NSString *)v9;
}

- (BOOL)installedByAppStore
{
  v2 = [(APItunesMetaData *)self distributorID];
  unsigned __int8 v3 = [@"com.apple.AppStore" isEqualToString:v2];

  return v3;
}

- (BOOL)installedAsTestApp
{
  if ([(APItunesMetaData *)self installedByAppStore]) {
    return 0;
  }
  v4 = [(APItunesMetaData *)self distributorID];

  if (!v4) {
    return 1;
  }
  id v5 = [(APItunesMetaData *)self distributorID];
  unsigned __int8 v6 = [@"com.apple.TestFlight" isEqualToString:v5];

  return v6;
}

- (BOOL)loadMetaDataWithError:(id *)a3
{
  if ([(APItunesMetaData *)self installedAsTestApp])
  {
    id v5 = APLogForCategory();
    BOOL v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [(APItunesMetaData *)self bundleID];
      v8 = [(APItunesMetaData *)self distributorID];
      *(_DWORD *)buf = 138543619;
      id v55 = v7;
      __int16 v56 = 2113;
      v57 = v8;
      objc_super v9 = "%{public}@ App was installed as a test app: %{private}@";
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v9, buf, 0x16u);

LABEL_34:
    }
  }
  else
  {
    unsigned __int8 v10 = [(APItunesMetaData *)self installedByAppStore];
    id v5 = APLogForCategory();
    BOOL v11 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v11)
      {
        id v12 = [(APItunesMetaData *)self bundleID];
        *(_DWORD *)buf = 138543362;
        id v55 = v12;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ App is from App Store", buf, 0xCu);
      }
      id v13 = objc_alloc((Class)LSApplicationRecord);
      v14 = [(APItunesMetaData *)self bundleID];
      id v51 = 0;
      id v7 = [v13 initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v51];
      id v5 = v51;

      if (v5)
      {
        __int16 v15 = APLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = [(APItunesMetaData *)self bundleID];
          v17 = [v5 localizedDescription];
          *(_DWORD *)buf = 138543618;
          id v55 = v16;
          __int16 v56 = 2114;
          v57 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find bundle URL from bundle ID %{public}@, error %{public}@", buf, 0x16u);
        }
        if (a3)
        {
          NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
          CFStringRef v53 = @"Could not find bundle URL";
          v18 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          *a3 = +[NSError errorWithDomain:@"com.apple.ap.itunesMetaData" code:3 userInfo:v18];
        }
      }
      v19 = [v7 bundleContainerURL];
      bundleURL = self->_bundleURL;
      self->_bundleURL = v19;

      v21 = self->_bundleURL;
      if (+[APSystemInternal isAppleInternalInstall])
      {
        id v22 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:0];
        v23 = [v22 valueForKey:@"APAttribution.itunesMetadataFileUrl"];
        if (v23)
        {
          uint64_t v24 = +[NSURL fileURLWithPath:v23];

          v21 = (NSURL *)v24;
        }
      }
      v25 = APLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [(NSURL *)v21 absoluteString];
        *(_DWORD *)buf = 138477827;
        id v55 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Loading meta data from %{private}@", buf, 0xCu);
      }
      if (v21)
      {
        v50 = v5;
        v27 = +[MIStoreMetadata metadataForBundleContainerURL:v21 error:&v50];
        v28 = v50;

        if (v27)
        {
          v29 = [v27 iAdAttribution];
          self->_isAttributed = [v29 BOOLValue];

          v30 = [v27 itemID];
          adamID = self->_adamID;
          self->_adamID = v30;

          v32 = [v27 purchaseDate];
          purchaseDate = self->_purchaseDate;
          self->_purchaseDate = v32;

          v34 = [v27 iAdConversionDate];
          conversionDate = self->_conversionDate;
          self->_conversionDate = v34;

          v36 = [v27 iAdImpressionDate];
          impressionDate = self->_impressionDate;
          self->_impressionDate = v36;

          BOOL v6 = 1;
          if (self->_conversionDate) {
            self->_isAttributed = 1;
          }
        }
        else
        {
          v42 = APLogForCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = [(APItunesMetaData *)self bundleID];
            v44 = [v28 localizedDescription];
            *(_DWORD *)buf = 138412546;
            id v55 = v43;
            __int16 v56 = 2112;
            v57 = v44;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Error loading the itunesMetadata file %@, %@", buf, 0x16u);
          }
          v45 = [(APItunesMetaData *)self bundleID];
          v46 = [v28 localizedDescription];
          v47 = +[NSString stringWithFormat:@"Error loading the itunesMetadata file %@, %@", v45, v46];
          v48 = [v28 userInfo];
          CreateDiagnosticReport();

          BOOL v6 = 0;
        }
        id v5 = v28;
      }
      else
      {
        v38 = APLogForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = [(APItunesMetaData *)self bundleID];
          *(_DWORD *)buf = 138412290;
          id v55 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Meta data URL is nil for %@", buf, 0xCu);
        }
        v27 = [(APItunesMetaData *)self bundleID];
        v40 = +[NSString stringWithFormat:@"Meta data URL is nil for %@", v27];
        v41 = [v5 userInfo];
        CreateDiagnosticReport();

        BOOL v6 = 0;
      }

      goto LABEL_34;
    }
    if (v11)
    {
      id v7 = [(APItunesMetaData *)self bundleID];
      v8 = [(APItunesMetaData *)self distributorID];
      *(_DWORD *)buf = 138543619;
      id v55 = v7;
      __int16 v56 = 2113;
      v57 = v8;
      objc_super v9 = "%{public}@ App is not from App Store: %{private}@";
      BOOL v6 = 1;
      goto LABEL_24;
    }
    BOOL v6 = 1;
  }

  return v6;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (BOOL)isAttributed
{
  return self->_isAttributed;
}

- (NSString)conversionDate
{
  return self->_conversionDate;
}

- (NSString)impressionDate
{
  return self->_impressionDate;
}

- (NSString)purchaseDate
{
  return self->_purchaseDate;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_impressionDate, 0);
  objc_storeStrong((id *)&self->_conversionDate, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

@end