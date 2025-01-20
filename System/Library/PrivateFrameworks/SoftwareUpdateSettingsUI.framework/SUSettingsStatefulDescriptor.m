@interface SUSettingsStatefulDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptor:(id)a3;
- (BOOL)updateDownloadable;
- (NSError)updateDownloadError;
- (SUCoreLog)log;
- (SUDescriptor)descriptor;
- (SUSettingsStatefulUIManager)ownerManager;
- (id)description;
- (id)humanReadableUpdateName;
- (id)initForDescriptor:(unint64_t)a3 fromScanResults:(id)a4 managedBy:(id)a5;
- (unint64_t)currentState;
- (unint64_t)descriptorType;
- (unint64_t)maskedDescriptorType;
- (void)assignState:(unint64_t)a3;
- (void)assignState:(unint64_t)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7;
- (void)assignState:(unint64_t)a3 fromScanResults:(id)a4 withConcreteError:(id)a5;
- (void)resolveInstallationError:(id)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDescriptor:(id)a3;
- (void)setDescriptorType:(unint64_t)a3;
- (void)setLog:(id)a3;
- (void)setOwnerManager:(id)a3;
- (void)setUpdateDownloadError:(id)a3;
- (void)setUpdateDownloadable:(BOOL)a3;
- (void)updateStateFromConcreteDownload:(id)a3 downloadable:(BOOL)a4 downloadError:(id)a5 isUpdateReadyForInstallation:(BOOL)a6 updateInstallationError:(id)a7 error:(id)a8;
- (void)updateStateFromProgressedDownload:(id)a3;
- (void)updateStateWithScanResults:(id)a3 andWithConcreteError:(id)a4;
@end

@implementation SUSettingsStatefulDescriptor

- (id)initForDescriptor:(unint64_t)a3 fromScanResults:(id)a4 managedBy:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v42 = self;
  SEL v41 = a2;
  unint64_t v40 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v5 = v42;
  id v42 = 0;
  v37.receiver = v5;
  v37.super_class = (Class)SUSettingsStatefulDescriptor;
  v28 = [(SUSettingsStatefulDescriptor *)&v37 init];
  id v42 = v28;
  objc_storeStrong(&v42, v28);
  if (!v28) {
    goto LABEL_14;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettingsStatefulDescriptor"];
  v7 = (void *)*((void *)v42 + 6);
  *((void *)v42 + 6) = v6;

  *((void *)v42 + 2) = 0;
  *((void *)v42 + 3) = v40;
  [v42 setOwnerManager:v38];
  if (!v40)
  {
    id v25 = (id)[location preferredDescriptor];
    objc_msgSend(v42, "setDescriptor:");

    char v8 = [location preferredUpdateDownloadable];
    [v42 setUpdateDownloadable:v8 & 1];
    id v26 = (id)[location preferredUpdateDownloadError];
    objc_msgSend(v42, "setUpdateDownloadError:");

LABEL_9:
    id v11 = (id)[v42 descriptor];
    BOOL v16 = v11 != 0;

    if (!v16)
    {
      id v15 = (id)[v42 log];
      id v31 = (id)[v15 oslog];

      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v31;
        os_log_type_t v14 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_impl(&dword_228401000, v13, v14, "Could not instantiate a stateful descriptor descriptor for nil SUDescriptor.", v29, 2u);
      }
      objc_storeStrong(&v31, 0);
      id v43 = 0;
      int v32 = 1;
      goto LABEL_15;
    }
    [v42 updateStateWithScanResults:location andWithConcreteError:0];
LABEL_14:
    id v43 = v42;
    int v32 = 1;
    goto LABEL_15;
  }
  if (v40 == 1)
  {
    id v23 = (id)[location alternateDescriptor];
    objc_msgSend(v42, "setDescriptor:");

    char v9 = [location alternateUpdateDownloadable];
    [v42 setUpdateDownloadable:v9 & 1];
    id v24 = (id)[location alternateUpdateDownloadError];
    objc_msgSend(v42, "setUpdateDownloadError:");

    goto LABEL_9;
  }
  id v22 = (id)[v42 log];
  id v36 = (id)[v22 oslog];

  os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
  {
    log = v36;
    os_log_type_t type = v35;
    v21 = SUSettingsDescriptorTypeToString(v40);
    v17 = v21;
    v34 = v17;
    v10 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v10);
    v33 = v20;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v44, (uint64_t)v17, (uint64_t)v33);
    _os_log_impl(&dword_228401000, log, type, "Could not use descriptor of type %{public}@ for %{public}@ instantiation.", v44, 0x16u);

    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v36, 0);
  id v43 = v42;
  int v32 = 1;
LABEL_15:
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v42, 0);
  return v43;
}

- (id)humanReadableUpdateName
{
  v3 = NSString;
  id v5 = (id)[(SUDescriptor *)self->_descriptor humanReadableUpdateName];
  v4 = SUSettingsDescriptorTypeToString(self->_descriptorType);
  id v6 = (id)[v3 stringWithFormat:@"%@ (%@)", v5, v4];

  return v6;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = [(SUDescriptor *)v6->_descriptor isEqual:location[0]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)isEqual:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (v20 == location[0])
    {
      char v21 = 1;
      int v18 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = location[0];
        id v6 = v20;
        id v7 = (id)[v17 descriptor];
        char v15 = 0;
        char v13 = 0;
        char v11 = 0;
        char v9 = 0;
        BOOL v8 = 0;
        if (-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v6, "isEqualToDescriptor:"))
        {
          uint64_t v5 = [v17 currentState];
          BOOL v8 = 0;
          if (v5 == [(SUSettingsStatefulDescriptor *)v20 currentState])
          {
            int v4 = [(SUSettingsStatefulDescriptor *)v20 updateDownloadable];
            BOOL v8 = 0;
            if (v4 == ([v17 updateDownloadable] & 1))
            {
              BOOL v16 = [(SUSettingsStatefulDescriptor *)v20 ownerManager];
              char v15 = 1;
              os_log_type_t v14 = [(SUSettingsStatefulUIManager *)v16 errorContextProvider];
              char v13 = 1;
              v12 = [(SUSettingsStatefulDescriptor *)v20 updateDownloadError];
              char v11 = 1;
              id v10 = (id)[v17 updateDownloadError];
              char v9 = 1;
              BOOL v8 = -[SUSettingsStatefulErrorContextProvider isError:intrinsicallyEquivalentToError:withStatefulDescriptor:](v14, "isError:intrinsicallyEquivalentToError:withStatefulDescriptor:", v12);
            }
          }
        }
        char v21 = v8;
        if (v9) {

        }
        if (v11) {
        if (v13)
        }

        if (v15) {
        int v18 = 1;
        }
        objc_storeStrong(&v17, 0);
      }
      else
      {
        char v21 = 0;
        int v18 = 1;
      }
    }
  }
  else
  {
    char v21 = 0;
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v21 & 1;
}

- (id)description
{
  os_log_type_t v30 = self;
  v29[1] = (id)a2;
  v29[0] = &stru_26DCD7690;
  id v23 = [(SUSettingsStatefulDescriptor *)v30 ownerManager];
  char v27 = 0;
  char v25 = 0;
  char v24 = 0;
  if (v23)
  {
    v28 = [(SUSettingsStatefulDescriptor *)v30 ownerManager];
    char v27 = 1;
    char v22 = 1;
    if (![(SUSettingsStatefulUIManager *)v28 hidingPreferredDescriptor])
    {
      id v26 = [(SUSettingsStatefulDescriptor *)v30 ownerManager];
      char v25 = 1;
      char v22 = [(SUSettingsStatefulUIManager *)v26 hidingAlternateDescriptor];
    }
    char v24 = v22;
  }
  if (v25) {

  }
  if (v27) {
  if (v24)
  }
  {
    v20 = NSString;
    char v21 = SUSettingsDescriptorTypeToString([(SUSettingsStatefulDescriptor *)v30 maskedDescriptorType]);
    id v2 = (id)[v20 stringWithFormat:@"maskedType = %@, ", v21];
    id v3 = v29[0];
    v29[0] = v2;
  }
  char v13 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  int v18 = NSStringFromClass(v4);
  id v7 = v30;
  id v17 = SUSettingsDescriptorTypeToString(v30->_descriptorType);
  id v8 = v29[0];
  BOOL v16 = SUSettingsDescriptorStateToString(v30->_currentState);
  unint64_t currentState = v30->_currentState;
  id v15 = (id)[(SUDescriptor *)v30->_descriptor humanReadableUpdateName];
  descriptor = v30->_descriptor;
  uint64_t v5 = "YES";
  if (!v30->_updateDownloadable) {
    uint64_t v5 = "NO";
  }
  char v11 = v5;
  updateDownloadError = v30->_updateDownloadError;
  id WeakRetained = objc_loadWeakRetained((id *)&v30->_ownerManager);
  v19 = (id)[v13 stringWithFormat:@"<%@: %p> { os_log_type_t type = %@, %@currentState = %@ (%lu), descriptor = %@ (%p), updateDownloadable = %s, updateDownloadError = %@, owner = %p }", v18, v7, v17, v8, v16, currentState, v15, descriptor, v11, updateDownloadError, WeakRetained];

  objc_storeStrong(v29, 0);
  return v19;
}

- (void)updateStateWithScanResults:(id)a3 andWithConcreteError:(id)a4
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  uint64_t v15 = [(SUSettingsStatefulDescriptor *)v18 maskedDescriptorType];
  char v9 = v18;
  id v10 = (id)[location[0] currentDownload];
  if (v15) {
    int v7 = [location[0] alternateUpdateDownloadable] & 1;
  }
  else {
    int v7 = [location[0] preferredUpdateDownloadable] & 1;
  }
  char v13 = 0;
  char v11 = 0;
  if (v15)
  {
    id v12 = (id)[location[0] alternateUpdateDownloadError];
    char v11 = 1;
    id v6 = v12;
  }
  else
  {
    id v14 = (id)[location[0] preferredUpdateDownloadError];
    char v13 = 1;
    id v6 = v14;
  }
  char v4 = [location[0] isUpdateReadyForInstallation];
  id v5 = (id)[location[0] updateInstallationError];
  -[SUSettingsStatefulDescriptor updateStateFromConcreteDownload:downloadable:downloadError:isUpdateReadyForInstallation:updateInstallationError:error:](v9, "updateStateFromConcreteDownload:downloadable:downloadError:isUpdateReadyForInstallation:updateInstallationError:error:", v10, v7 != 0, v6, v4 & 1);

  if (v11) {
  if (v13)
  }

  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3 fromScanResults:(id)a4 withConcreteError:(id)a5
{
  v20 = self;
  SEL v19 = a2;
  unint64_t v18 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  uint64_t v15 = [(SUSettingsStatefulDescriptor *)v20 maskedDescriptorType];
  id v8 = v20;
  unint64_t v9 = v18;
  id v10 = (id)[location currentDownload];
  if (v15) {
    int v6 = [location alternateUpdateDownloadable] & 1;
  }
  else {
    int v6 = [location preferredUpdateDownloadable] & 1;
  }
  char v13 = 0;
  char v11 = 0;
  if (v15)
  {
    id v12 = (id)[location alternateUpdateDownloadError];
    char v11 = 1;
    id v5 = v12;
  }
  else
  {
    id v14 = (id)[location preferredUpdateDownloadError];
    char v13 = 1;
    id v5 = v14;
  }
  [(SUSettingsStatefulDescriptor *)v8 assignState:v9 fromConcreteDownload:v10 downloadable:v6 != 0 downloadError:v5 error:v16];
  if (v11) {

  }
  if (v13) {
  objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)updateStateFromConcreteDownload:(id)a3 downloadable:(BOOL)a4 downloadError:(id)a5 isUpdateReadyForInstallation:(BOOL)a6 updateInstallationError:(id)a7 error:(id)a8
{
  os_log_type_t v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  BOOL v26 = a6;
  id v25 = 0;
  objc_storeStrong(&v25, a7);
  id v24 = 0;
  objc_storeStrong(&v24, a8);
  id v8 = [(SUSettingsStatefulDescriptor *)v30 descriptor];
  BOOL v19 = v8 != 0;

  if (v19)
  {
    char v21 = 0;
    LOBYTE(v13) = 1;
    if (location[0])
    {
      id v12 = v30;
      id v22 = (id)[location[0] descriptor];
      char v21 = 1;
      int v13 = !-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v12, "isEqualToDescriptor:");
    }
    if (v21) {

    }
    if (v13)
    {
      [(SUSettingsStatefulDescriptor *)v30 assignState:1 fromConcreteDownload:location[0] downloadable:v28 downloadError:v27 error:v24];
      int v23 = 1;
    }
    else
    {
      id v20 = (id)[location[0] progress];
      if ([v20 isDone])
      {
        if (v26)
        {
          [(SUSettingsStatefulDescriptor *)v30 assignState:4 fromConcreteDownload:location[0] downloadable:v28 downloadError:v27 error:v24];
          int v23 = 1;
        }
        else
        {
          [(SUSettingsStatefulDescriptor *)v30 resolveInstallationError:v25 fromConcreteDownload:location[0] downloadable:v28 downloadError:v27 error:v24];
          int v23 = 0;
        }
      }
      else
      {
        id v10 = v30;
        id v11 = (id)[v20 phase];
        if (SUPrefsDownloadPhaseIsStalled(v11)) {
          uint64_t v9 = 3;
        }
        else {
          uint64_t v9 = 2;
        }
        [(SUSettingsStatefulDescriptor *)v10 assignState:v9 fromConcreteDownload:location[0] downloadable:v28 downloadError:v27 error:v24];

        int v23 = 1;
      }
      objc_storeStrong(&v20, 0);
    }
  }
  else
  {
    [(SUSettingsStatefulDescriptor *)v30 assignState:0];
    int v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v57 = self;
  SEL v56 = a2;
  unint64_t v55 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v53 = a5;
  id v52 = 0;
  objc_storeStrong(&v52, a6);
  id v51 = 0;
  objc_storeStrong(&v51, a7);
  id v37 = (id)[location progress];
  char v38 = [v37 isDone];

  if (v38)
  {
    id v31 = v57;
    id v32 = (id)[location descriptor];
    BOOL v33 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](v31, "isEqualToDescriptor:");

    if (v33) {
      objc_storeStrong(&v52, 0);
    }
  }
  id v50 = [(SUSettingsStatefulDescriptor *)v57 updateDownloadError];
  v57->_updateDownloadable = v53;
  if (v51) {
    objc_storeStrong((id *)&v57->_updateDownloadError, v51);
  }
  else {
    objc_storeStrong((id *)&v57->_updateDownloadError, v52);
  }
  uint64_t v7 = [(SUSettingsStatefulDescriptor *)v57 currentState];
  if (v7 != v55) {
    goto LABEL_15;
  }
  v29 = [(SUSettingsStatefulDescriptor *)v57 ownerManager];
  BOOL v28 = [(SUSettingsStatefulUIManager *)v29 errorContextProvider];
  BOOL v30 = [(SUSettingsStatefulErrorContextProvider *)v28 isError:v50 intrinsicallyEquivalentToError:v57->_updateDownloadError withStatefulDescriptor:v57 download:location];

  if (!v30)
  {
    id v17 = [(SUSettingsStatefulDescriptor *)v57 log];
    os_log_t v43 = (os_log_t)(id)[(SUCoreLog *)v17 oslog];

    os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v43;
      os_log_type_t v12 = v42;
      id v16 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      id v8 = v16;
      SEL v41 = v8;
      uint64_t v15 = [(SUSettingsStatefulDescriptor *)v57 descriptor];
      id v14 = (id)[(SUDescriptor *)v15 humanReadableUpdateName];
      id v9 = v14;
      id v40 = v9;
      id v10 = v57;
      int v13 = SUSettingsDescriptorStateToString(v55);
      v39 = v13;
      __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v58, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v39, v55, (uint64_t)v50, (uint64_t)v57->_updateDownloadError);
      _os_log_impl(&dword_228401000, v11, v12, "%s [%{public}@, %{public}@, %p]: Allowing to re-assign the state %{public}@ (%ld) because the old error is not intrinsically equivalent to the new error.\n\tPrevious Error: %{public}@\n\tNew Error: %{public}@", v58, 0x52u);

      objc_storeStrong((id *)&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong((id *)&v41, 0);
    }
    objc_storeStrong((id *)&v43, 0);
LABEL_15:
    [(SUSettingsStatefulDescriptor *)v57 assignState:v55];
    int v44 = 0;
    goto LABEL_16;
  }
  id v27 = [(SUSettingsStatefulDescriptor *)v57 log];
  os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v27 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v22 = type;
    BOOL v26 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
    unint64_t v18 = v26;
    v47 = v18;
    id v25 = [(SUSettingsStatefulDescriptor *)v57 descriptor];
    id v24 = (id)[(SUDescriptor *)v25 humanReadableUpdateName];
    id v19 = v24;
    id v46 = v19;
    id v20 = v57;
    int v23 = SUSettingsDescriptorStateToString(v55);
    uint64_t v45 = v23;
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0((uint64_t)v59, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v45, v55);
    _os_log_impl(&dword_228401000, log, v22, "%s [%{public}@, %{public}@, %p]: Skipping on state assignment as it matches the current state: %{public}@ (%ld)", v59, 0x3Eu);

    objc_storeStrong((id *)&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong((id *)&v47, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v44 = 1;
LABEL_16:
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&location, 0);
}

- (void)updateStateFromProgressedDownload:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v5 = v11;
    id v6 = (id)[location[0] descriptor];
    BOOL v7 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](v5, "isEqualToDescriptor:");

    if (v7)
    {
      id v8 = (id)[location[0] progress];
      if (([v8 isDone] & 1) == 0)
      {
        id v3 = (id)[v8 phase];
        BOOL v4 = 0;
        if (SUPrefsDownloadPhaseIsStalled(v3)) {
          BOOL v4 = v11->_currentState != 3;
        }

        if (v4)
        {
          [(SUSettingsStatefulDescriptor *)v11 assignState:3];
        }
        else if (v11->_currentState != 2)
        {
          [(SUSettingsStatefulDescriptor *)v11 assignState:2];
        }
      }
      objc_storeStrong(&v8, 0);
      int v9 = 0;
    }
    else
    {
      int v9 = 1;
    }
  }
  else
  {
    [(SUSettingsStatefulDescriptor *)v11 assignState:1];
    int v9 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v57 = self;
  SEL v56 = a2;
  unint64_t v55 = (void *)a3;
  if ([(SUSettingsStatefulDescriptor *)self currentState] == a3)
  {
    id v32 = [(SUSettingsStatefulDescriptor *)v57 log];
    id v54 = (id)[(SUCoreLog *)v32 oslog];

    os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      log = v54;
      os_log_type_t type = v53;
      id v31 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      int v23 = v31;
      id v52 = v23;
      BOOL v30 = [(SUSettingsStatefulDescriptor *)v57 descriptor];
      id v29 = (id)[(SUDescriptor *)v30 humanReadableUpdateName];
      id v24 = v29;
      id v51 = v24;
      id v25 = v57;
      BOOL v28 = SUSettingsDescriptorStateToString([(SUSettingsStatefulDescriptor *)v57 currentState]);
      id v50 = v28;
      __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0((uint64_t)v59, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:]", (uint64_t)v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v50, [(SUSettingsStatefulDescriptor *)v57 currentState]);
      _os_log_impl(&dword_228401000, log, type, "%s [%{public}@, %{public}@, %p]: Skipping on Descriptor State Assignment request: currentState == currentState (%{public}@ (%ld))", v59, 0x3Eu);

      objc_storeStrong((id *)&v50, 0);
      objc_storeStrong(&v51, 0);
      objc_storeStrong((id *)&v52, 0);
    }
    objc_storeStrong(&v54, 0);
  }
  else
  {
    os_log_type_t v22 = [(SUSettingsStatefulDescriptor *)v57 log];
    os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v22 oslog];

    os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = oslog;
      os_log_type_t v16 = v48;
      char v21 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      id v10 = v21;
      v47 = v10;
      id v20 = [(SUSettingsStatefulDescriptor *)v57 descriptor];
      id v19 = (id)[(SUDescriptor *)v20 humanReadableUpdateName];
      id v11 = v19;
      id v46 = v11;
      os_log_type_t v12 = v57;
      unint64_t v18 = SUSettingsDescriptorStateToString([(SUSettingsStatefulDescriptor *)v57 currentState]);
      int v13 = v18;
      uint64_t v45 = v13;
      uint64_t v14 = [(SUSettingsStatefulDescriptor *)v57 currentState];
      id v17 = SUSettingsDescriptorStateToString((uint64_t)v55);
      int v44 = v17;
      __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_0((uint64_t)v58, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14, (uint64_t)v44, (uint64_t)v55);
      _os_log_impl(&dword_228401000, v15, v16, "%s [%{public}@, %{public}@, %p]: Assigning Descriptor state: %{public}@ (%ld) -> %{public}@ (%ld)", v58, 0x52u);

      objc_storeStrong((id *)&v44, 0);
      objc_storeStrong((id *)&v45, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong((id *)&v47, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_t v43 = [(SUSettingsStatefulDescriptor *)v57 currentState];
    [(SUSettingsStatefulDescriptor *)v57 setCurrentState:v55];
    BOOL v7 = [(SUSettingsStatefulDescriptor *)v57 ownerManager];
    id v8 = [(SUSettingsStatefulUIManager *)v7 delegate];
    char v41 = 0;
    char v39 = 0;
    char v9 = 0;
    if (v8)
    {
      id v42 = [(SUSettingsStatefulDescriptor *)v57 ownerManager];
      char v41 = 1;
      id v40 = (id)[v42 delegate];
      char v39 = 1;
      char v9 = objc_opt_respondsToSelector();
    }
    if (v39) {

    }
    if (v41) {
    if (v9)
    }
    {
      id v6 = (id)[MEMORY[0x263F77D78] sharedCore];
      id v5 = [(SUSettingsStatefulDescriptor *)v57 ownerManager];
      BOOL v4 = [(SUSettingsStatefulUIManager *)v5 delegateCallbackQueue];
      queue = (id)objc_msgSend(v6, "selectDelegateCallbackQueue:");
      uint64_t v33 = MEMORY[0x263EF8330];
      int v34 = -1073741824;
      int v35 = 0;
      id v36 = __44__SUSettingsStatefulDescriptor_assignState___block_invoke;
      id v37 = &unk_26483BA68;
      v38[0] = v57;
      v38[1] = v43;
      v38[2] = v55;
      dispatch_async(queue, &v33);

      objc_storeStrong(v38, 0);
    }
  }
}

void __44__SUSettingsStatefulDescriptor_assignState___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) ownerManager];
  id v3 = (id)[v4 delegate];
  id v2 = (id)[*(id *)(a1 + 32) ownerManager];
  objc_msgSend(v3, "statefulUIManager:descriptor:didTransitionFromDescriptorState:toState:");
}

- (void)resolveInstallationError:(id)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = 0;
  objc_storeStrong(&v73, a4);
  BOOL v72 = a5;
  id v71 = 0;
  objc_storeStrong(&v71, a6);
  id v70 = 0;
  objc_storeStrong(&v70, a7);
  uint64_t v45 = [(SUSettingsStatefulDescriptor *)v75 log];
  os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v45 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v41 = type;
    int v44 = SUSettingsDescriptorTypeToString(v75->_descriptorType);
    char v39 = v44;
    v67 = v39;
    os_log_t v43 = [(SUSettingsStatefulDescriptor *)v75 descriptor];
    id v42 = (id)[(SUDescriptor *)v43 humanReadableUpdateName];
    id v66 = v42;
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v79, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v39, (uint64_t)v66, (uint64_t)v75, (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, v41, "%s [%{public}@, %{public}@, %p]: Resolving installation error: %{public}@", v79, 0x34u);

    objc_storeStrong(&v66, 0);
    objc_storeStrong((id *)&v67, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  uint64_t v65 = 4;
  char v64 = 1;
  id v37 = (id)[location[0] domain];
  id v36 = getSUErrorDomain_0();
  char v38 = objc_msgSend(v37, "isEqualToString:");

  if (v38)
  {
    if (v70) {
      objc_storeStrong(&v70, v70);
    }
    else {
      objc_storeStrong(&v70, location[0]);
    }
    unint64_t v7 = [location[0] code];
    if (v7 <= 3)
    {
      unint64_t v9 = v7 - 3;
      char v8 = 0;
    }
    else
    {
      unint64_t v9 = v7 - 3;
      char v8 = 1;
    }
    if (v8)
    {
LABEL_23:
      os_log_type_t v16 = [(SUSettingsStatefulDescriptor *)v75 log];
      os_log_t v53 = (os_log_t)(id)[(SUCoreLog *)v16 oslog];

      os_log_type_t v52 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v11 = v53;
        os_log_type_t v12 = v52;
        uint64_t v15 = SUSettingsDescriptorTypeToString(v75->_descriptorType);
        id v10 = v15;
        id v51 = v10;
        uint64_t v14 = [(SUSettingsStatefulDescriptor *)v75 descriptor];
        id v13 = (id)[(SUDescriptor *)v14 humanReadableUpdateName];
        id v50 = v13;
        __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v76, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v10, (uint64_t)v50, (uint64_t)v75, (uint64_t)v70);
        _os_log_error_impl(&dword_228401000, v11, v12, "%s [%{public}@, %{public}@, %p]: Couldn't resolve the installation error: %{public}@", v76, 0x34u);

        objc_storeStrong(&v50, 0);
        objc_storeStrong((id *)&v51, 0);
      }
      objc_storeStrong((id *)&v53, 0);
    }
    else
    {
      switch(v9)
      {
        case 0uLL:
        case 8uLL:
        case 0xFuLL:
          BOOL v28 = [(SUSettingsStatefulDescriptor *)v75 log];
          os_log_t v58 = (os_log_t)(id)[(SUCoreLog *)v28 oslog];

          os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = v58;
            os_log_type_t v24 = v57;
            id v27 = SUSettingsDescriptorTypeToString(v75->_descriptorType);
            os_log_type_t v22 = v27;
            SEL v56 = v22;
            BOOL v26 = [(SUSettingsStatefulDescriptor *)v75 descriptor];
            id v25 = (id)[(SUDescriptor *)v26 humanReadableUpdateName];
            id v55 = v25;
            __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v77, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v22, (uint64_t)v55, (uint64_t)v75, (uint64_t)v70);
            _os_log_impl(&dword_228401000, v23, v24, "%s [%{public}@, %{public}@, %p]: Starting a new scan due to installation error: %{public}@", v77, 0x34u);

            objc_storeStrong(&v55, 0);
            objc_storeStrong((id *)&v56, 0);
          }
          objc_storeStrong((id *)&v58, 0);
          char v64 = 0;
          char v21 = [(SUSettingsStatefulDescriptor *)v75 ownerManager];
          [(SUSettingsStatefulUIManager *)v21 checkForAvailableUpdates];

          goto LABEL_19;
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 9uLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
          goto LABEL_23;
        case 0xAuLL:
        case 0xEuLL:
        case 0x10uLL:
          break;
        case 0xBuLL:
        case 0x27uLL:
          uint64_t v65 = 5;
          objc_storeStrong(&v70, 0);
          break;
        case 0x11uLL:
LABEL_19:
          id v19 = (id)[v70 userInfo];
          id v18 = getkSUInstallationConstraintsUnmetKey();
          id v17 = (id)objc_msgSend(v19, "objectForKey:");
          uint64_t v20 = [v17 unsignedIntegerValue];

          uint64_t v54 = v20;
          if (v20 != 16 && v54 != 32 && v54 != 48) {
            goto LABEL_23;
          }
          objc_storeStrong(&v70, 0);
          break;
        default:
          JUMPOUT(0);
      }
    }
    if (v64) {
      [(SUSettingsStatefulDescriptor *)v75 assignState:v65 fromConcreteDownload:v73 downloadable:v72 downloadError:v71 error:v70];
    }
    int v59 = 0;
  }
  else
  {
    int v35 = [(SUSettingsStatefulDescriptor *)v75 log];
    os_log_t v63 = (os_log_t)(id)[(SUCoreLog *)v35 oslog];

    os_log_type_t v62 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      BOOL v30 = v63;
      os_log_type_t v31 = v62;
      int v34 = SUSettingsDescriptorTypeToString(v75->_descriptorType);
      id v29 = v34;
      v61 = v29;
      uint64_t v33 = [(SUSettingsStatefulDescriptor *)v75 descriptor];
      id v32 = (id)[(SUDescriptor *)v33 humanReadableUpdateName];
      id v60 = v32;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v78, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v29, (uint64_t)v60, (uint64_t)v75);
      _os_log_error_impl(&dword_228401000, v30, v31, "%s [%{public}@, %{public}@, %p]: The installation error domain doesn't match SUSErrorDomain.", v78, 0x2Au);

      objc_storeStrong(&v60, 0);
      objc_storeStrong((id *)&v61, 0);
    }
    objc_storeStrong((id *)&v63, 0);
    int v59 = 1;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)maskedDescriptorType
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v18 = self;
  v17[1] = (id)a2;
  id v2 = [(SUSettingsStatefulDescriptor *)self ownerManager];
  BOOL v13 = v2 != 0;

  if (v13)
  {
    id v4 = [(SUSettingsStatefulDescriptor *)v18 ownerManager];
    BOOL v5 = [(SUSettingsStatefulUIManager *)v4 hidingPreferredDescriptor];

    if (v5) {
      return v18->_descriptorType != 1;
    }
    else {
      return v18->_descriptorType;
    }
  }
  else
  {
    os_log_type_t v12 = [(SUSettingsStatefulDescriptor *)v18 log];
    v17[0] = (id)[(SUCoreLog *)v12 oslog];

    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v17[0];
      os_log_type_t type = v16;
      id v11 = SUSettingsDescriptorTypeToString(v18->_descriptorType);
      id v6 = v11;
      uint64_t v15 = v6;
      id v10 = [(SUSettingsStatefulDescriptor *)v18 descriptor];
      id v9 = (id)[(SUDescriptor *)v10 humanReadableUpdateName];
      id v14 = v9;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulDescriptor maskedDescriptorType]", (uint64_t)v6, (uint64_t)v14, (uint64_t)v18);
      _os_log_impl(&dword_228401000, log, type, "%s [%{public}@, %{public}@, %p]: Could not get the masked descriptor type because the ownerManager is nil. This is likely a bug.", v20, 0x2Au);

      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v15, 0);
    }
    objc_storeStrong(v17, 0);
    return v18->_descriptorType;
  }
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_unint64_t currentState = a3;
}

- (unint64_t)descriptorType
{
  return self->_descriptorType;
}

- (void)setDescriptorType:(unint64_t)a3
{
  self->_descriptorType = a3;
}

- (SUDescriptor)descriptor
{
  return (SUDescriptor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)updateDownloadable
{
  return self->_updateDownloadable;
}

- (void)setUpdateDownloadable:(BOOL)a3
{
  self->_updateDownloadable = a3;
}

- (NSError)updateDownloadError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdateDownloadError:(id)a3
{
}

- (SUCoreLog)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (SUSettingsStatefulUIManager)ownerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerManager);
  return (SUSettingsStatefulUIManager *)WeakRetained;
}

- (void)setOwnerManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end