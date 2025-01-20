@interface MIInstallable
- (BOOL)applyPatchWithError:(id *)a3;
- (BOOL)finalizeInstallationWithError:(id *)a3;
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)performPreflightWithError:(id *)a3;
- (BOOL)performVerificationWithError:(id *)a3;
- (BOOL)postFlightInstallationWithError:(id *)a3;
- (BOOL)shouldModifyExistingContainers;
- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIBundle)bundle;
- (MIInstallOptions)installOptions;
- (MIInstallable)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 operationType:(unint64_t)a9 error:(id *)a10;
- (NSString)installedDistributorID;
- (NSURL)stagingRootURL;
- (id)description;
- (id)launchServicesBundleRecordsWithError:(id *)a3;
- (id)progressBlock;
- (unint64_t)installOperationType;
- (unint64_t)installationDomain;
- (unsigned)packageFormat;
- (void)setBundle:(id)a3;
- (void)setInstallOperationType:(unint64_t)a3;
- (void)setInstalledDistributorID:(id)a3;
- (void)setProgressBlock:(id)a3;
@end

@implementation MIInstallable

- (MIInstallable)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 operationType:(unint64_t)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MIInstallable;
  v20 = [(MIInstallable *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identity, a6);
    objc_storeStrong((id *)&v21->_installOptions, a8);
    unint64_t v22 = 2;
    if (a7 != 1) {
      unint64_t v22 = a7;
    }
    v21->_installationDomain = v22;
    v21->_packageFormat = a5;
    objc_storeStrong((id *)&v21->_bundle, a3);
    objc_storeStrong((id *)&v21->_stagingRootURL, a4);
    v21->_installOperationType = a9;
  }

  return v21;
}

- (BOOL)shouldModifyExistingContainers
{
  return 1;
}

- (BOOL)applyPatchWithError:(id *)a3
{
  return 1;
}

- (BOOL)performPreflightWithError:(id *)a3
{
  return [(MIInstallable *)self applyPatchWithError:a3];
}

- (BOOL)performVerificationWithError:(id *)a3
{
  return 1;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)postFlightInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)finalizeInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4
{
  return 1;
}

- (id)launchServicesBundleRecordsWithError:(id *)a3
{
  return &__NSArray0__struct;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  return 1;
}

- (id)description
{
  v3 = [(MIInstallable *)self bundle];
  v4 = [v3 infoPlistSubset];

  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(MIInstallable *)self bundle];
  v8 = [v7 identifier];
  v9 = [(MIInstallable *)self identity];
  v10 = [v9 personaUniqueString];
  v11 = [v4 objectForKeyedSubscript:kCFBundleVersionKey];
  v12 = [v4 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ ID=%@; Persona=%@, Version=%@, ShortVersion=%@>",
    v6,
    v8,
    v10,
    v11,
  v13 = v12);

  return v13;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (MIInstallOptions)installOptions
{
  return self->_installOptions;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (NSURL)stagingRootURL
{
  return self->_stagingRootURL;
}

- (unsigned)packageFormat
{
  return self->_packageFormat;
}

- (MIBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (unint64_t)installOperationType
{
  return self->_installOperationType;
}

- (void)setInstallOperationType:(unint64_t)a3
{
  self->_installOperationType = a3;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (NSString)installedDistributorID
{
  return self->_installedDistributorID;
}

- (void)setInstalledDistributorID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedDistributorID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_stagingRootURL, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end