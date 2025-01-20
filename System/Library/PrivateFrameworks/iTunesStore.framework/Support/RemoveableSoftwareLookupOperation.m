@interface RemoveableSoftwareLookupOperation
- (NSArray)softwareLibraryItems;
- (void)run;
- (void)setSoftwareLibraryItems:(id)a3;
@end

@implementation RemoveableSoftwareLookupOperation

- (void)run
{
  v2 = +[NSMutableArray array];
  if (SSIsDaemon())
  {
    v3 = +[LSApplicationWorkspace defaultWorkspace];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100187DC8;
    v29[3] = &unk_1003A4DC8;
    id v30 = v2;
    [v3 enumerateApplicationsOfType:1 block:v29];
  }
  v24 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v23 = *(void *)v26;
    uint64_t v6 = SSSoftwareLibraryItemPropertyITunesItemIdentifier;
    uint64_t v7 = SSSoftwareLibraryItemBundleIdentifier;
    uint64_t v8 = SSSoftwareLibraryItemBundleVersion;
    uint64_t v9 = SSSoftwareLibraryItemPropertyITunesAccountIdentifier;
    uint64_t v10 = SSSoftwareLibraryItemPropertyFamilyAccountIdentifier;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v11);
        id v13 = objc_alloc_init((Class)SSSoftwareLibraryItem);
        v14 = [v12 itemID];
        [v13 _setValue:v14 forProperty:v6];

        objc_msgSend(v13, "setBeta:", objc_msgSend(v12, "isBetaApp"));
        objc_msgSend(v13, "setPlaceholder:", objc_msgSend(v12, "isPlaceholder"));
        objc_msgSend(v13, "setProfileValidated:", objc_msgSend(v12, "profileValidated"));
        v15 = [v12 bundleIdentifier];
        [v13 _setValue:v15 forProperty:v7];

        v16 = [v12 bundleVersion];
        [v13 _setValue:v16 forProperty:v8];

        v17 = [v12 purchaserDSID];
        [v13 _setValue:v17 forProperty:v9];

        v18 = [v12 familyID];
        [v13 _setValue:v18 forProperty:v10];

        [v24 addObject:v13];
        v11 = (char *)v11 + 1;
      }
      while (v5 != v11);
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  v19 = (NSArray *)[v24 copy];
  softwareLibraryItems = self->_softwareLibraryItems;
  self->_softwareLibraryItems = v19;

  [(RemoveableSoftwareLookupOperation *)self setSuccess:1];
}

- (NSArray)softwareLibraryItems
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSoftwareLibraryItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end