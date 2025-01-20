@interface WCDApplicationWorkspace
- (NSSet)allApplications;
- (NSSet)iOSApplicationsContainingComplications;
- (NSSet)iOSApplicationsContainingWatchApp;
- (NSSet)iOSApplicationsWithWatchAppInstalled;
- (NSSet)runningIndependentlyWatchApps;
- (NSSet)standaloneWatchApps;
- (NSSet)validApplications;
- (NSString)debugDescription;
- (NSString)description;
- (WCDApplicationWorkspace)init;
- (WCDApplicationWorkspaceDelegate)delegate;
- (id)_lock_applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4;
- (id)applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4;
- (id)applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4 allowPlaceholder:(BOOL)a5;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setDelegate:(id)a3;
- (void)setValidApplications:(id)a3;
@end

@implementation WCDApplicationWorkspace

- (WCDApplicationWorkspace)init
{
  v9.receiver = self;
  v9.super_class = (Class)WCDApplicationWorkspace;
  v2 = [(WCDApplicationWorkspace *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSSet set];
    validApplications = v3->_validApplications;
    v3->_validApplications = (NSSet *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    placeholderApplications = v3->_placeholderApplications;
    v3->_placeholderApplications = v6;
  }
  return v3;
}

- (id)applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4
{
  return [(WCDApplicationWorkspace *)self applicationInfoForBundleIdentifier:a3 type:a4 allowPlaceholder:0];
}

- (id)applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4 allowPlaceholder:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = [(WCDApplicationWorkspace *)self _lock_applicationInfoForBundleIdentifier:v8 type:a4];
  if (!v10 && v5)
  {
    if (a4)
    {
      v10 = [(NSMutableDictionary *)self->_placeholderApplications objectForKeyedSubscript:v8];
      if (!v10)
      {
        v10 = [[WCDApplicationInfo alloc] initWithCompanionBundleIdentifier:v8];
        [(NSMutableDictionary *)self->_placeholderApplications setObject:v10 forKeyedSubscript:v8];
        v11 = wc_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding placeholder for %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)_lock_applicationInfoForBundleIdentifier:(id)a3 type:(unint64_t)a4
{
  char v6 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_validApplications;
  id v9 = [(NSSet *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9)
  {
    id v16 = 0;
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v20;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ((v6 & 2) != 0)
      {
        uint64_t v4 = [*(id *)(*((void *)&v19 + 1) + 8 * i) watchAppBundleIdentifier];
        if ([v4 isEqualToString:v8]) {
          goto LABEL_25;
        }
      }
      if ((v6 & 4) == 0)
      {
        if ((v6 & 1) == 0)
        {
          unsigned int v14 = 0;
          goto LABEL_16;
        }
LABEL_14:
        v15 = [v13 companionAppBundleIdentifier];
        unsigned int v14 = [v15 isEqualToString:v8];

        if ((v6 & 4) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      BOOL v5 = [v13 watchExtensionBundleIdentifier];
      if ([v5 isEqualToString:v8])
      {

        if ((v6 & 2) != 0) {
LABEL_25:
        }

LABEL_26:
        id v16 = v13;
        goto LABEL_27;
      }
      if (v6) {
        goto LABEL_14;
      }
      unsigned int v14 = 0;
LABEL_15:

LABEL_16:
      if ((v6 & 2) != 0)
      {

        if (v14) {
          goto LABEL_26;
        }
      }
      else if (v14)
      {
        goto LABEL_26;
      }
    }
    id v10 = [(NSSet *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    id v16 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  return v16;
}

- (void)setValidApplications:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = +[NSMutableSet set];
  char v6 = +[NSMutableSet set];
  v56 = +[NSMutableSet set];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v53 = self;
  v7 = self->_validApplications;
  id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v12 isStandaloneWatchApp])
        {
          int v13 = [v12 watchAppBundleIdentifier];
          [v5 addObject:v13];
        }
        if ([v12 isRunningIndependently])
        {
          unsigned int v14 = [v12 watchAppBundleIdentifier];
          [v6 addObject:v14];
        }
        if ([v12 isCompanionAppInstalled])
        {
          v15 = [v12 watchAppBundleIdentifier];
          [v56 addObject:v15];
        }
      }
      id v9 = [(NSSet *)v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v9);
  }
  v54 = v6;
  v55 = v5;

  [(NSMutableDictionary *)v53->_placeholderApplications removeAllObjects];
  id v16 = (NSSet *)[v4 copy];
  validApplications = v53->_validApplications;
  v53->_validApplications = v16;

  v52 = v53->_iOSApplicationsWithWatchAppInstalled;
  v51 = v53->_iOSApplicationsContainingComplications;
  v18 = +[NSMutableSet set];
  long long v19 = +[NSMutableSet set];
  long long v20 = +[NSMutableSet set];
  long long v21 = +[NSMutableSet set];
  long long v22 = +[NSMutableSet set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v23 = v4;
  id v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v58;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
        if ([v28 isStandaloneWatchApp]) {
          [v18 addObject:v28];
        }
        if ([v28 isRunningIndependently]) {
          [v19 addObject:v28];
        }
        if ([v28 isCompanionAppInstalled]) {
          [v20 addObject:v28];
        }
        if ([v28 isWatchAppInstalled]) {
          [v21 addObject:v28];
        }
        if ([v28 hasComplications]) {
          [v22 addObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v25);
  }

  v29 = (NSSet *)[v21 copy];
  iOSApplicationsWithWatchAppInstalled = v53->_iOSApplicationsWithWatchAppInstalled;
  v53->_iOSApplicationsWithWatchAppInstalled = v29;

  v31 = (NSSet *)[v22 copy];
  iOSApplicationsContainingComplications = v53->_iOSApplicationsContainingComplications;
  v53->_iOSApplicationsContainingComplications = v31;

  os_unfair_lock_unlock(lock);
  v33 = [v18 valueForKey:@"watchAppBundleIdentifier"];
  unsigned __int8 locka = [v33 isEqual:v55];

  v34 = [v19 valueForKey:@"watchAppBundleIdentifier"];
  unsigned __int8 v48 = [v34 isEqual:v54];

  v35 = [v20 valueForKey:@"watchAppBundleIdentifier"];
  unsigned __int8 v47 = [v35 isEqual:v56];

  v36 = [v21 valueForKey:@"watchAppBundleIdentifier"];
  v37 = [(NSSet *)v52 valueForKey:@"watchAppBundleIdentifier"];
  unsigned __int8 v46 = [v36 isEqual:v37];

  v38 = [v22 valueForKey:@"watchAppBundleIdentifier"];
  v39 = [(NSSet *)v51 valueForKey:@"watchAppBundleIdentifier"];
  unsigned __int8 v40 = [v38 isEqual:v39];

  if ((v47 & 1) == 0)
  {
    v41 = [(WCDApplicationWorkspace *)v53 delegate];
    [v41 applicationWorkspace:v53 didUpdateiOSApplicationsContainingWatchApp:v20];
  }
  if ((v46 & 1) == 0)
  {
    v42 = [(WCDApplicationWorkspace *)v53 delegate];
    [v42 applicationWorkspace:v53 didUpdateiOSApplicationsWithWatchAppInstalled:v21];
  }
  if ((v40 & 1) == 0)
  {
    v43 = [(WCDApplicationWorkspace *)v53 delegate];
    [v43 applicationWorkspace:v53 didUpdateiOSApplicationsContainingComplications:v22];
  }
  if ((v48 & 1) == 0)
  {
    v44 = [(WCDApplicationWorkspace *)v53 delegate];
    [v44 applicationWorkspace:v53 didUpdateRunningIndependentlyWatchApps:v19];
  }
  if ((locka & 1) == 0)
  {
    v45 = [(WCDApplicationWorkspace *)v53 delegate];
    [v45 applicationWorkspace:v53 didUpdateStandaloneWatchApps:v18];
  }
}

- (NSSet)validApplications
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSSet *)self->_validApplications copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)allApplications
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSSet *)self->_validApplications mutableCopy];
  BOOL v5 = [(NSMutableDictionary *)self->_placeholderApplications allValues];
  [v4 addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)standaloneWatchApps
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_validApplications;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isStandaloneWatchApp", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)runningIndependentlyWatchApps
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_validApplications;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isRunningIndependently", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)iOSApplicationsContainingWatchApp
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_validApplications;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isCompanionAppInstalled", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)iOSApplicationsWithWatchAppInstalled
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSSet *)self->_iOSApplicationsWithWatchAppInstalled copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)iOSApplicationsContainingComplications
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSSet *)self->_iOSApplicationsContainingComplications copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(WCDApplicationWorkspace *)self allApplications];
  id v5 = [v3 appendUnsignedInteger:[v4 count] withName:@"allApplications.count"];

  return v3;
}

- (id)succinctDescription
{
  v2 = [(WCDApplicationWorkspace *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = +[BSDescriptionBuilder builderWithObject:self];
  id v6 = [(WCDApplicationWorkspace *)self validApplications];
  id v7 = [v6 allObjects];
  [v5 appendArraySection:v7 withName:@"validApplications" multilinePrefix:v4 skipIfEmpty:0];

  uint64_t v8 = [(NSMutableDictionary *)self->_placeholderApplications allValues];
  [v5 appendArraySection:v8 withName:@"placeholderApplications" skipIfEmpty:1];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(WCDApplicationWorkspace *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(WCDApplicationWorkspace *)self descriptionBuilderWithMultilinePrefix:a3];
  [v3 setUseDebugDescription:1];
  id v4 = [v3 build];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(WCDApplicationWorkspace *)self succinctDescription];
}

- (NSString)debugDescription
{
  return (NSString *)[(WCDApplicationWorkspace *)self debugDescriptionWithMultilinePrefix:0];
}

- (WCDApplicationWorkspaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDApplicationWorkspaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iOSApplicationsContainingComplications, 0);
  objc_storeStrong((id *)&self->_iOSApplicationsWithWatchAppInstalled, 0);
  objc_storeStrong((id *)&self->_validApplications, 0);

  objc_storeStrong((id *)&self->_placeholderApplications, 0);
}

@end