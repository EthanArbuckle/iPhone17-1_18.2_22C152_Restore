@interface SUSettingsStatefulErrorContextProvider
- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5;
- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5 download:(id)a6;
- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4;
- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (BOOL)shouldEnableUpdateButtonForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4;
- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4 download:(id)a5;
- (SUCoreLog)log;
- (SUSettingsStatefulUIManager)ownerManager;
- (id)initForManager:(id)a3;
- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4;
- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (id)localizedDescriptionForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (id)localizedDescriptionForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4;
- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (id)localizedTitleForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5;
- (void)setLog:(id)a3;
- (void)setOwnerManager:(id)a3;
@end

@implementation SUSettingsStatefulErrorContextProvider

- (id)initForManager:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)SUSettingsStatefulErrorContextProvider;
  v8 = [(SUSettingsStatefulErrorContextProvider *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    [(SUSettingsStatefulErrorContextProvider *)v11 setOwnerManager:location[0]];
    uint64_t v4 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettingsStatefulErrorContextProvider"];
    log = v11->_log;
    v11->_log = (SUCoreLog *)v4;
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  v11 = v18;
  id v8 = location[0];
  id v9 = v16;
  id v10 = v15;
  v13 = [(SUSettingsStatefulErrorContextProvider *)v18 ownerManager];
  v12 = [(SUSettingsStatefulUIManager *)v13 currentDownload];
  BOOL v14 = -[SUSettingsStatefulErrorContextProvider isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:](v11, "isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:", v8, v9, v10);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v14;
}

- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5 download:(id)a6
{
  v25 = self;
  SEL v24 = a2;
  *((void *)&v23 + 1) = 0;
  objc_storeStrong((id *)&v23 + 1, a3);
  *(void *)&long long v23 = 0;
  objc_storeStrong((id *)&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  if (v23 == 0)
  {
    BOOL v26 = 1;
    int v20 = 1;
  }
  else
  {
    id v8 = (id)[*((id *)&v23 + 1) domain];
    id v9 = (id)[(id)v23 domain];
    BOOL v10 = 1;
    if (objc_msgSend(v8, "isEqualToString:"))
    {
      uint64_t v7 = [*((id *)&v23 + 1) code];
      BOOL v10 = v7 != [(id)v23 code];
    }

    if (v10)
    {
      BOOL v26 = 0;
      int v20 = 1;
    }
    else
    {
      char v19 = [(SUSettingsStatefulErrorContextProvider *)v25 shouldEnableUpdateButtonForError:*((void *)&v23 + 1) statefulDescriptor:v22 download:v21];
      char v18 = [(SUSettingsStatefulErrorContextProvider *)v25 shouldEnableUpdateButtonForError:(void)v23 statefulDescriptor:v22 download:v21];
      if ((v19 & 1) == v18)
      {
        id v17 = [(SUSettingsStatefulErrorContextProvider *)v25 localizedTitleForError:*((void *)&v23 + 1) statefulDescriptor:v22 download:v21];
        id v16 = [(SUSettingsStatefulErrorContextProvider *)v25 localizedTitleForError:(void)v23 statefulDescriptor:v22 download:v21];
        if (v17 || v16)
        {
          if ([v17 isEqualToString:v16])
          {
            id v15 = [(SUSettingsStatefulErrorContextProvider *)v25 localizedDescriptionForError:*((void *)&v23 + 1) statefulDescriptor:v22 download:v21];
            id v14 = [(SUSettingsStatefulErrorContextProvider *)v25 localizedDescriptionForError:(void)v23 statefulDescriptor:v22 download:v21];
            if (v15 || v14)
            {
              BOOL v26 = ([v15 isEqualToString:v14] & 1) != 0;
              int v20 = 1;
            }
            else
            {
              BOOL v26 = v22 == 0;
              int v20 = 1;
            }
            objc_storeStrong(&v14, 0);
            objc_storeStrong(&v15, 0);
          }
          else
          {
            BOOL v26 = 0;
            int v20 = 1;
          }
        }
        else
        {
          BOOL v26 = v22 == 0;
          int v20 = 1;
        }
        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v17, 0);
      }
      else
      {
        BOOL v26 = 0;
        int v20 = 1;
      }
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong((id *)&v23 + 1, 0);
  return v26;
}

- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v8 = v14;
  id v6 = location[0];
  id v7 = v12;
  BOOL v10 = [(SUSettingsStatefulErrorContextProvider *)v14 ownerManager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 currentDownload];
  BOOL v11 = -[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:download:](v8, "shouldIgnoreUpdateError:withStatefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4 download:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  uint64_t v24 = [location[0] code];
  id v15 = (id)[location[0] domain];
  char v16 = [v15 isEqualToString:*MEMORY[0x263F78360]];

  if (v16)
  {
    if (v24 == 3 || v24 == 11 || v24 == 13)
    {
      char v28 = 1;
      int v23 = 1;
      goto LABEL_41;
    }
    char v21 = 0;
    BOOL v12 = 1;
    if (v26)
    {
      id v22 = (id)[v26 descriptor];
      char v21 = 1;
      BOOL v12 = v22 == 0;
    }
    if (v21) {

    }
    if (v12)
    {
      char v28 = 0;
      int v23 = 1;
      goto LABEL_41;
    }
    char v19 = 0;
    BOOL v11 = 1;
    if (v25)
    {
      id v20 = (id)[v25 progress];
      char v19 = 1;
      BOOL v11 = 1;
      if (v20) {
        BOOL v11 = [v26 currentState] != 2;
      }
    }
    if (v19) {

    }
    if (v11)
    {
      char v28 = 0;
      int v23 = 1;
      goto LABEL_41;
    }
    id v18 = (id)[v25 progress];
    id v9 = (id)[v18 phase];
    BOOL v10 = 0;
    if ([v9 isEqualToString:*MEMORY[0x263F78428]])
    {
      [v18 percentComplete];
      BOOL v10 = v5 >= 1.0;
    }

    if (v10)
    {
      switch(v24)
      {
        case 33:
        case 34:
        case 8:
        case 31:
        case 9:
        case 83:
        case 26:
          char v28 = 1;
          int v23 = 1;
LABEL_40:
          objc_storeStrong(&v18, 0);
          goto LABEL_41;
        case 6:
          char v28 = 1;
          int v23 = 1;
          goto LABEL_40;
        case 20:
          id v8 = (id)[location[0] userInfo];
          id v7 = getkSUInstallationConstraintsUnmetKey_2();
          id v17 = (id)objc_msgSend(v8, "objectForKey:");

          if (v17 && [v17 unsignedIntegerValue] == 4)
          {
            char v28 = 1;
            int v23 = 1;
          }
          else
          {
            int v23 = 0;
          }
          objc_storeStrong(&v17, 0);
          if (v23) {
            goto LABEL_40;
          }
          break;
      }
    }
    char v28 = 0;
    int v23 = 1;
    goto LABEL_40;
  }
  char v28 = 0;
  int v23 = 1;
LABEL_41:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v8 = v14;
  id v6 = location[0];
  id v7 = v12;
  BOOL v10 = [(SUSettingsStatefulErrorContextProvider *)v14 ownerManager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 currentDownload];
  BOOL v11 = -[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:download:](v8, "shouldEnableUpdateButtonForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  if ([(SUSettingsStatefulErrorContextProvider *)v22 shouldIgnoreUpdateError:location[0] withStatefulDescriptor:v20 download:v19])
  {
    char v23 = 1;
    int v18 = 1;
  }
  else
  {
    id v11 = (id)[location[0] domain];
    id v10 = getSUErrorDomain_4();
    char v12 = objc_msgSend(v11, "isEqualToString:");

    if (v12)
    {
      if ((unint64_t)([location[0] code] - 33) > 1) {
        char v23 = 0;
      }
      else {
        char v23 = [(SUSettingsStatefulErrorContextProvider *)v22 shouldEnableUpdateButtonForNetworkError:location[0] statefulDescriptor:v20 download:v19];
      }
      int v18 = 1;
    }
    else
    {
      id v9 = [(SUSettingsStatefulErrorContextProvider *)v22 log];
      id v17 = (id)[(SUCoreLog *)v9 oslog];

      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        log = v17;
        os_log_type_t type = v16;
        id v8 = (id)[v20 humanReadableUpdateName];
        id v15 = v8;
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v24, (uint64_t)v15, (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, log, type, "Receieved an unexpected non-SUS error for descriptor %{public}@. Not ignoring. Error: %{public}@", v24, 0x16u);

        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong(&v17, 0);
      char v23 = 0;
      int v18 = 1;
    }
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v8 = v14;
  id v6 = location[0];
  id v7 = v12;
  id v10 = [(SUSettingsStatefulErrorContextProvider *)v14 ownerManager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 currentDownload];
  id v11 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:download:](v8, "localizedTitleForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  id v41 = 0;
  objc_storeStrong(&v41, a5);
  if ([(SUSettingsStatefulErrorContextProvider *)v44 shouldIgnoreUpdateError:location[0] withStatefulDescriptor:v42 download:v41])
  {
    id v45 = 0;
    int v40 = 1;
  }
  else
  {
    id v39 = 0;
    id v31 = (id)[location[0] domain];
    id v30 = getSUErrorDomain_4();
    char v32 = objc_msgSend(v31, "isEqualToString:");

    if (v32)
    {
      unint64_t v38 = [location[0] code];
      if (v38 <= 6)
      {
        unint64_t v6 = v38 - 6;
        char v5 = 0;
      }
      else
      {
        unint64_t v6 = v38 - 6;
        char v5 = 1;
      }
      if ((v5 & 1) == 0)
      {
        switch(v6)
        {
          case 0uLL:
            id v29 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v7 = (id)[v29 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSUFFICIENT_DISK_SPACE" value:&stru_26DCD7690 table:@"Software Update"];
            id v8 = v39;
            id v39 = v7;

            break;
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 0x14uLL:
          case 0x1BuLL:
          case 0x1CuLL:
          case 0x33uLL:
          case 0x4DuLL:
            id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v9 = (id)[v28 localizedStringForKey:@"UPDATE_ERROR_TITLE_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v10 = v39;
            id v39 = v9;

            break;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xCuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x1AuLL:
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
          case 0x27uLL:
          case 0x28uLL:
          case 0x29uLL:
          case 0x2AuLL:
          case 0x2BuLL:
          case 0x2CuLL:
          case 0x2DuLL:
          case 0x2EuLL:
          case 0x2FuLL:
          case 0x30uLL:
          case 0x31uLL:
          case 0x32uLL:
          case 0x34uLL:
          case 0x35uLL:
          case 0x36uLL:
          case 0x37uLL:
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x41uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x46uLL:
          case 0x47uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x50uLL:
          case 0x51uLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x63uLL:
            break;
          case 0xBuLL:
          case 0xDuLL:
          case 0x64uLL:
            id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v15 = (id)[v26 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v16 = v39;
            id v39 = v15;

            break;
          case 0xEuLL:
            id v13 = [(SUSettingsStatefulErrorContextProvider *)v44 localizedTitleForUnmetConstraintsError:location[0] statefulDescriptor:v42 download:v41];
            id v14 = v39;
            id v39 = v13;

            break;
          case 0x19uLL:
            id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v11 = (id)[v27 localizedStringForKey:@"UPDATE_ERROR_TITLE_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v12 = v39;
            id v39 = v11;

            break;
          case 0x62uLL:
            objc_storeStrong(&v39, @"Unable to Update");
            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    if (!v39)
    {
      uint64_t v25 = [(SUSettingsStatefulErrorContextProvider *)v44 log];
      id v37 = (id)[(SUCoreLog *)v25 oslog];

      char v36 = 16;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        log = v37;
        os_log_type_t type = v36;
        id v24 = (id)[v42 humanReadableUpdateName];
        id v35 = v24;
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v46, (uint64_t)v35, (uint64_t)location[0]);
        _os_log_error_impl(&dword_228401000, log, type, "Couldn't map the error into a localizable title for %{public}@: %{public}@", v46, 0x16u);

        objc_storeStrong(&v35, 0);
      }
      objc_storeStrong(&v37, 0);
      id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = (id)[v21 localizedStringForKey:@"UPDATE_ERROR_TITLE_GENERAL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
      id v18 = v39;
      id v39 = v17;
    }
    id v45 = v39;
    int v40 = 1;
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  id v19 = v45;
  return v19;
}

- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v8 = v14;
  id v6 = location[0];
  id v7 = v12;
  id v10 = [(SUSettingsStatefulErrorContextProvider *)v14 ownerManager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 currentDownload];
  id v11 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:download:](v8, "localizedDescriptionForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  v132 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v130 = 0;
  objc_storeStrong(&v130, a4);
  id v129 = 0;
  objc_storeStrong(&v129, a5);
  if ([(SUSettingsStatefulErrorContextProvider *)v132 shouldIgnoreUpdateError:location[0] withStatefulDescriptor:v130 download:v129])
  {
    id v133 = 0;
    int v128 = 1;
  }
  else
  {
    id v127 = 0;
    id v68 = (id)[location[0] domain];
    id v67 = getSUErrorDomain_4();
    char v69 = objc_msgSend(v68, "isEqualToString:");

    if (v69)
    {
      unint64_t v126 = [location[0] code];
      if (v126 <= 6)
      {
        unint64_t v6 = v126 - 6;
        char v5 = 0;
      }
      else
      {
        unint64_t v6 = v126 - 6;
        char v5 = 1;
      }
      if ((v5 & 1) == 0)
      {
        switch(v6)
        {
          case 0uLL:
            v48 = (void *)MEMORY[0x263F086F0];
            uint64_t v47 = (void *)MEMORY[0x263F78250];
            id v49 = (id)[v130 descriptor];
            id v111 = (id)objc_msgSend(v48, "stringFromByteCount:countStyle:", objc_msgSend(v47, "totalDiskSpaceForUpdate:"), 2);

            v50 = NSString;
            id v51 = (id)[v130 descriptor];
            char v109 = 0;
            char v107 = 0;
            char v105 = 0;
            char v103 = 0;
            char v101 = 0;
            if (v51
              && (id v110 = (id)[v130 descriptor],
                  char v109 = 1,
                  ([v110 isSplatOnly] & 1) != 0))
            {
              id v108 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v107 = 1;
              id v106 = (id)[v108 localizedStringForKey:@"RSR_STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
              char v105 = 1;
              id v46 = v106;
            }
            else
            {
              id v104 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v103 = 1;
              id v102 = (id)[v104 localizedStringForKey:@"STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
              char v101 = 1;
              id v46 = v102;
            }
            id v21 = (id)objc_msgSend(v50, "stringWithFormat:", v46, v111);
            id v22 = v127;
            id v127 = v21;

            if (v101) {
            if (v103)
            }

            if (v105) {
            if (v107)
            }

            if (v109) {
            int v128 = 2;
            }
            objc_storeStrong(&v111, 0);
            break;
          case 1uLL:
          case 0x14uLL:
          case 0x33uLL:
            id v66 = (id)[v130 descriptor];
            char v124 = 0;
            char v122 = 0;
            char v120 = 0;
            char v118 = 0;
            char v116 = 0;
            if (v66
              && (id v125 = (id)[v130 descriptor],
                  char v124 = 1,
                  ([v125 isSplatOnly] & 1) != 0))
            {
              id v123 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v122 = 1;
              id v121 = (id)[v123 localizedStringForKey:@"RSR_ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
              char v120 = 1;
              objc_storeStrong(&v127, v121);
            }
            else
            {
              id v119 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v118 = 1;
              id v117 = (id)[v119 localizedStringForKey:@"ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
              char v116 = 1;
              objc_storeStrong(&v127, v117);
            }
            if (v116) {

            }
            if (v118) {
            if (v120)
            }

            if (v122) {
            if (v124)
            }

            break;
          case 2uLL:
            goto LABEL_25;
          case 3uLL:
          case 0x4DuLL:
            if ([v130 currentState] == 3)
            {
              id v56 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v55 = (id)SFLocalizableWAPIStringKeyForKey();
              id v17 = (id)objc_msgSend(v56, "localizedStringForKey:value:table:");
              id v18 = v127;
              id v127 = v17;
            }
            else
            {
              id v53 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v54 = (id)[v130 descriptor];
              char v112 = 0;
              if (v54)
              {
                id v113 = (id)[v130 descriptor];
                char v112 = 1;
                [v113 isSplatOnly];
              }
              id v52 = (id)SFLocalizableWAPIStringKeyForKey();
              id v19 = (id)objc_msgSend(v53, "localizedStringForKey:value:table:");
              id v20 = v127;
              id v127 = v19;

              if (v112) {
            }
              }
            break;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xCuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x1AuLL:
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
          case 0x27uLL:
          case 0x28uLL:
          case 0x29uLL:
          case 0x2AuLL:
          case 0x2BuLL:
          case 0x2CuLL:
          case 0x2DuLL:
          case 0x2EuLL:
          case 0x2FuLL:
          case 0x30uLL:
          case 0x31uLL:
          case 0x32uLL:
          case 0x34uLL:
          case 0x35uLL:
          case 0x36uLL:
          case 0x37uLL:
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x41uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x46uLL:
          case 0x47uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x50uLL:
          case 0x51uLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x63uLL:
            break;
          case 0xBuLL:
            id v45 = (id)[v130 descriptor];
            char v99 = 0;
            char v97 = 0;
            char v95 = 0;
            char v93 = 0;
            char v91 = 0;
            char v89 = 0;
            char v87 = 0;
            if (v45
              && (id v100 = (id)[v130 descriptor],
                  char v99 = 1,
                  ([v100 isSplatOnly] & 1) != 0))
            {
              id v98 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v97 = 1;
              id v96 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RSR_VERIFICATION_FAILED"];
              char v95 = 1;
              id v94 = (id)objc_msgSend(v98, "localizedStringForKey:value:table:");
              char v93 = 1;
              objc_storeStrong(&v127, v94);
            }
            else
            {
              id v92 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v91 = 1;
              id v90 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"VERIFICATION_FAILED"];
              char v89 = 1;
              id v88 = (id)objc_msgSend(v92, "localizedStringForKey:value:table:");
              char v87 = 1;
              objc_storeStrong(&v127, v88);
            }
            if (v87) {

            }
            if (v89) {
            if (v91)
            }

            if (v93) {
            if (v95)
            }

            if (v97) {
            if (v99)
            }

            break;
          case 0xDuLL:
            v43 = NSString;
            id v44 = (id)[v130 descriptor];
            char v85 = 0;
            char v83 = 0;
            char v81 = 0;
            char v79 = 0;
            char v77 = 0;
            if (v44
              && (id v86 = (id)[v130 descriptor],
                  char v85 = 1,
                  ([v86 isSplatOnly] & 1) != 0))
            {
              id v84 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v83 = 1;
              id v82 = (id)[v84 localizedStringForKey:@"RSR_PERSONALIZATION_FAILED" value:&stru_26DCD7690 table:@"Software Update"];
              char v81 = 1;
              id v42 = v82;
            }
            else
            {
              id v80 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v79 = 1;
              id v78 = (id)[v80 localizedStringForKey:@"PERSONALIZATION_FAILED" value:&stru_26DCD7690 table:@"Software Update"];
              char v77 = 1;
              id v42 = v78;
            }
            id v41 = (id)[v130 humanReadableUpdateName];
            id v25 = (id)objc_msgSend(v43, "stringWithFormat:", v42, v41);
            id v26 = v127;
            id v127 = v25;

            if (v77) {
            if (v79)
            }

            if (v81) {
            if (v83)
            }

            if (v85) {
            break;
            }
          case 0xEuLL:
            id v23 = [(SUSettingsStatefulErrorContextProvider *)v132 localizedDescriptionForUnmetConstraintsError:location[0] statefulDescriptor:v130 download:v129];
            id v24 = v127;
            id v127 = v23;

            break;
          case 0x19uLL:
            id v60 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v59 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_NOT_OTA_DOWNLOADABLE"];
            id v13 = (id)objc_msgSend(v60, "localizedStringForKey:value:table:");
            id v14 = v127;
            id v127 = v13;

            break;
          case 0x1BuLL:
          case 0x1CuLL:
            id v7 = [(SUSettingsStatefulErrorContextProvider *)v132 localizedDescriptionForNetworkError:location[0] statefulDescriptor:v130 download:v129];
            id v8 = v127;
            id v127 = v7;

            if (!v127)
            {
LABEL_25:
              if ([v130 currentState] == 3)
              {
                id v65 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v64 = (id)SFLocalizableWAPIStringKeyForKey();
                id v9 = (id)objc_msgSend(v65, "localizedStringForKey:value:table:");
                id v10 = v127;
                id v127 = v9;
              }
              else
              {
                id v62 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v63 = (id)[v130 descriptor];
                char v114 = 0;
                if (v63)
                {
                  id v115 = (id)[v130 descriptor];
                  char v114 = 1;
                  [v115 isSplatOnly];
                }
                id v61 = (id)SFLocalizableWAPIStringKeyForKey();
                id v11 = (id)objc_msgSend(v62, "localizedStringForKey:value:table:");
                id v12 = v127;
                id v127 = v11;

                if (v114) {
              }
                }
            }
            break;
          case 0x62uLL:
            objc_storeStrong(&v127, @"INTERNAL ONLY: Device needs to be rooted from snapshot to update.\nAs root user, run 'snapshottool golive 0' then 'reboot'.\nYou'll be able to update once the device boots back.");
            break;
          case 0x64uLL:
            id v58 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v57 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_NOT_OTA_INSTALLABLE"];
            id v15 = (id)objc_msgSend(v58, "localizedStringForKey:value:table:");
            id v16 = v127;
            id v127 = v15;

            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    else
    {
      id v39 = (id)[location[0] domain];
      char v40 = [v39 isEqualToString:@"com.apple.preferences.softwareupdate"];

      if ((v40 & 1) != 0 && [location[0] code] == 1)
      {
        id v38 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v27 = (id)[v38 localizedStringForKey:@"UPDATE_REQUESTED_EXPLANATION" value:&stru_26DCD7690 table:@"Software Update"];
        id v28 = v127;
        id v127 = v27;
      }
    }
    if (location[0] && !v127)
    {
      id v37 = [(SUSettingsStatefulErrorContextProvider *)v132 log];
      os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v37 oslog];

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v35 = type;
        id v36 = (id)[v130 humanReadableUpdateName];
        id v74 = v36;
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v134, (uint64_t)v74, (uint64_t)location[0]);
        _os_log_error_impl(&dword_228401000, log, v35, "Couldn't map the error into a localizable title for %{public}@: %{public}@", v134, 0x16u);

        objc_storeStrong(&v74, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v127, &stru_26DCD7690);
    }
    char v72 = 0;
    char v33 = 0;
    if (location[0])
    {
      char v33 = 0;
      if ([v127 isEqualToString:&stru_26DCD7690])
      {
        id v73 = (id)[MEMORY[0x263F82670] currentDevice];
        char v72 = 1;
        char v33 = objc_msgSend(v73, "sf_isInternalInstall");
      }
    }
    if (v72) {

    }
    if (v33)
    {
      id v29 = (id)[NSString stringWithFormat:@"[Internal Only] An unresolvable error has occurred, please file a radar. Error Code: %ld.", objc_msgSend(location[0], "code")];
      id v30 = v127;
      id v127 = v29;
    }
    id v133 = v127;
    int v128 = 1;
    objc_storeStrong(&v127, 0);
  }
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v130, 0);
  objc_storeStrong(location, 0);
  id v31 = v133;
  return v31;
}

- (BOOL)shouldEnableUpdateButtonForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  if ([v29 currentState] != 3) {
    goto LABEL_16;
  }
  id v27 = 0;
  id v12 = objc_alloc(MEMORY[0x263F02D30]);
  id v13 = dispatch_get_global_queue(33, 0);
  id v26 = (id)objc_msgSend(v12, "initWithQueue:");

  id v25 = 0;
  id v23 = 0;
  id v14 = (id)[v26 getPreferredDataSubscriptionContextSync:&v23];
  objc_storeStrong(&v25, v23);
  id v24 = v14;
  if (v14)
  {
    id v20 = 0;
    id v19 = 0;
    id v9 = (void *)[v26 copyRegistrationStatus:v24 error:&v19];
    objc_storeStrong(&v20, v19);
    id v5 = v27;
    id v27 = v9;

    if (!v27)
    {
      id v8 = [(SUSettingsStatefulErrorContextProvider *)v31 log];
      os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v8 oslog];

      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v7 = (id)[v20 description];
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v7);
        _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "Failed to copyRegistrationStatus from CoreTelephony. %@", v33, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v11 = [(SUSettingsStatefulErrorContextProvider *)v31 log];
    id v22 = (id)[(SUCoreLog *)v11 oslog];

    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      id v10 = (id)[v25 description];
      __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v10);
      _os_log_error_impl(&dword_228401000, (os_log_t)v22, v21, "Failed to get preferred CTXPCServiceSubscriptionContext. %@", v34, 0xCu);
    }
    objc_storeStrong(&v22, 0);
  }
  if ([v27 isEqualToString:*MEMORY[0x263F03010]] & 1) != 0 && (PSIsDataRoamingEnabled())
  {
    char v32 = 1;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  if (!v17) {
LABEL_16:
  }
    char v32 = 0;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32 & 1;
}

- (id)localizedTitleForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  float v35 = 0.0;
  char v33 = 0;
  char v31 = 0;
  if (v37 && (v34 = (id)[v37 descriptor], char v33 = 1, v34))
  {
    id v32 = (id)[v37 descriptor];
    char v31 = 1;
    SURequiredBatteryLevelForInstallation();
    float v24 = v5;
  }
  else
  {
    SUPrefsRequiredBatteryLevelForInstall_0();
    float v24 = v6;
  }
  if (v31) {

  }
  if (v33) {
  float v35 = v24;
  }
  id v19 = (id)[location[0] userInfo];
  id v18 = getkSUInstallationConstraintsUnmetKey_2();
  id v17 = (id)objc_msgSend(v19, "objectForKey:");
  uint64_t v20 = [v17 unsignedIntegerValue];

  uint64_t v30 = v20;
  os_log_type_t v21 = [(SUSettingsStatefulErrorContextProvider *)v39 ownerManager];
  id v22 = [(SUSettingsStatefulUIManager *)v21 options];
  BOOL v23 = 0;
  if (![(SUSettingsStatefulUIOptions *)v22 clientIsBuddy]) {
    BOOL v23 = (v30 & 4) != 0;
  }

  if (v23)
  {
    id v16 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v40 = (id)[v16 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSUFFICIENT_DISK_SPACE" value:&stru_26DCD7690 table:@"Software Update"];

    int v29 = 1;
  }
  else if (v30)
  {
    double v7 = floorf(100.0 * v35) / 100.0;
    *(float *)&double v7 = v7;
    int v28 = LODWORD(v7);
    id v11 = (void *)MEMORY[0x263F08A30];
    id v12 = (id)[NSNumber numberWithFloat:v7];
    id v27 = (id)objc_msgSend(v11, "localizedStringFromNumber:numberStyle:");

    id v13 = NSString;
    id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = (id)[v15 localizedStringForKey:@"UPDATE_ERROR_TITLE_LOW_BATTERY" value:&stru_26DCD7690 table:@"Software Update"];
    id v40 = (id)[v13 stringWithFormat:v27];

    int v29 = 1;
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v40 = (id)[v10 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];

    int v29 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v8 = v40;
  return v8;
}

- (id)localizedDescriptionForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v46 = 0;
  objc_storeStrong(&v46, a4);
  id v45 = 0;
  objc_storeStrong(&v45, a5);
  uint64_t v44 = [location[0] code];
  if ([v46 currentState] != 3) {
    goto LABEL_34;
  }
  id v43 = 0;
  id v18 = objc_alloc(MEMORY[0x263F02D30]);
  id v19 = dispatch_get_global_queue(33, 0);
  id v42 = (id)objc_msgSend(v18, "initWithQueue:");

  id v41 = 0;
  id v39 = 0;
  id v20 = (id)[v42 getPreferredDataSubscriptionContextSync:&v39];
  objc_storeStrong(&v41, v39);
  id v40 = v20;
  if (v20)
  {
    id v36 = 0;
    id v35 = 0;
    id v15 = (void *)[v42 copyRegistrationStatus:v40 error:&v35];
    objc_storeStrong(&v36, v35);
    id v5 = v43;
    id v43 = v15;

    if (!v43)
    {
      id v14 = [(SUSettingsStatefulErrorContextProvider *)v48 log];
      id v34 = (id)[(SUCoreLog *)v14 oslog];

      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        id v13 = (id)[v36 description];
        __os_log_helper_16_2_1_8_66((uint64_t)v50, (uint64_t)v13);
        _os_log_error_impl(&dword_228401000, (os_log_t)v34, OS_LOG_TYPE_ERROR, "Failed to copyRegistrationStatus from CoreTelephony. Error: %{public}@", v50, 0xCu);
      }
      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v17 = [(SUSettingsStatefulErrorContextProvider *)v48 log];
    id v38 = (id)[(SUCoreLog *)v17 oslog];

    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      id v16 = (id)[v41 description];
      __os_log_helper_16_2_1_8_66((uint64_t)v51, (uint64_t)v16);
      _os_log_error_impl(&dword_228401000, (os_log_t)v38, v37, "Failed to get preferred CTXPCServiceSubscriptionContext. error: %{public}@", v51, 0xCu);
    }
    objc_storeStrong(&v38, 0);
  }
  if ([v43 isEqualToString:*MEMORY[0x263F03010]])
  {
    if (PSIsDataRoamingEnabled())
    {
      id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v49 = (id)[v12 localizedStringForKey:@"DOWNLOAD_RESUME_ROAMING_REQUIRED" value:&stru_26DCD7690 table:@"Software Update"];
    }
    else
    {
      id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = (id)SFLocalizableWAPIStringKeyForKey();
      id v49 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:");
    }
    int v33 = 1;
  }
  else if (v44 == 33)
  {
    id v9 = (id)[v46 descriptor];
    char v31 = 0;
    char v29 = 0;
    char v27 = 0;
    char v25 = 0;
    char v23 = 0;
    if (v9
      && (id v32 = (id)[v46 descriptor],
          char v31 = 1,
          ([v32 isSplatOnly] & 1) != 0))
    {
      id v30 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v29 = 1;
      id v28 = (id)[v30 localizedStringForKey:@"RSR_ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
      char v27 = 1;
      id v6 = v28;
    }
    else
    {
      id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v25 = 1;
      id v24 = (id)[v26 localizedStringForKey:@"ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
      char v23 = 1;
      id v6 = v24;
    }
    id v49 = v6;
    if (v23) {

    }
    if (v25) {
    if (v27)
    }

    if (v29) {
    if (v31)
    }

    int v33 = 1;
  }
  else
  {
    int v33 = 0;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  if (!v33) {
LABEL_34:
  }
    id v49 = 0;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  double v7 = v49;
  return v7;
}

- (id)localizedDescriptionForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v251 = 0;
  objc_storeStrong(&v251, a4);
  id v250 = 0;
  objc_storeStrong(&v250, a5);
  id v57 = (id)[v251 descriptor];
  SURequiredBatteryLevelForInstallation();
  float v58 = v5;

  float v6 = 100.0 * v58;
  float v7 = floorf(v6) / 100.0;
  float v249 = v7;
  id v59 = (void *)MEMORY[0x263F086F0];
  id v60 = (id)[v251 descriptor];
  id v248 = (id)objc_msgSend(v59, "stringFromByteCount:countStyle:", objc_msgSend(v60, "installationSize"), 2);

  id v63 = (id)[location[0] userInfo];
  id v62 = getkSUInstallationConstraintsUnmetKey_2();
  id v61 = (id)objc_msgSend(v63, "objectForKey:");
  uint64_t v64 = [v61 unsignedIntegerValue];

  uint64_t v247 = v64;
  if ((v64 & 8) != 0)
  {
    id v54 = (id)[v251 descriptor];
    char v245 = 0;
    char v243 = 0;
    char v241 = 0;
    char v239 = 0;
    char v237 = 0;
    char v235 = 0;
    char v233 = 0;
    if (v54
      && (id v246 = (id)[v251 descriptor],
          char v245 = 1,
          ([v246 isSplatOnly] & 1) != 0))
    {
      id v244 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v243 = 1;
      id v242 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RSR_INSTALL_DELAYED_OTA_RESTORE"];
      char v241 = 1;
      id v240 = (id)objc_msgSend(v244, "localizedStringForKey:value:table:");
      char v239 = 1;
      id v9 = v240;
    }
    else
    {
      id v238 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v237 = 1;
      id v236 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"INSTALL_DELAYED_OTA_RESTORE"];
      char v235 = 1;
      id v234 = (id)objc_msgSend(v238, "localizedStringForKey:value:table:");
      char v233 = 1;
      id v9 = v234;
    }
    id v253 = v9;
    if (v233) {

    }
    if (v235) {
    if (v237)
    }

    if (v239) {
    if (v241)
    }

    if (v243) {
    if (v245)
    }

    int v232 = 1;
  }
  else
  {
    uint64_t v231 = 7;
    uint64_t v230 = 3;
    uint64_t v229 = 5;
    uint64_t v228 = 6;
    uint64_t v52 = (void *)MEMORY[0x263F08A30];
    *(float *)&double v8 = v249;
    id v53 = (id)[NSNumber numberWithFloat:v8];
    id v227 = (id)objc_msgSend(v52, "localizedStringFromNumber:numberStyle:");

    char v226 = 0;
    char v225 = SUPrefsconnectedToCharger_0((uint64_t)&v226) & 1;
    if ((v247 & v231) == v231)
    {
      v50 = NSString;
      id v51 = (id)[v251 descriptor];
      char v223 = 0;
      char v221 = 0;
      char v219 = 0;
      char v217 = 0;
      char v215 = 0;
      if (v51
        && (id v224 = (id)[v251 descriptor],
            char v223 = 1,
            ([v224 isSplatOnly] & 1) != 0))
      {
        id v222 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v221 = 1;
        id v220 = (id)[v222 localizedStringForKey:@"RSR_BATTERY_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v219 = 1;
        id v49 = v220;
      }
      else
      {
        id v218 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v217 = 1;
        id v216 = (id)[v218 localizedStringForKey:@"BATTERY_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v215 = 1;
        id v49 = v216;
      }
      id v253 = (id)objc_msgSend(v50, "stringWithFormat:", v49, v227, v248);
      if (v215) {

      }
      if (v217) {
      if (v219)
      }

      if (v221) {
      if (v223)
      }

      int v232 = 1;
    }
    else if ((v247 & v228) == v228)
    {
      uint64_t v47 = NSString;
      id v48 = (id)[v251 descriptor];
      char v213 = 0;
      char v211 = 0;
      char v209 = 0;
      char v207 = 0;
      char v205 = 0;
      if (v48
        && (id v214 = (id)[v251 descriptor],
            char v213 = 1,
            ([v214 isSplatOnly] & 1) != 0))
      {
        id v212 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v211 = 1;
        id v210 = (id)[v212 localizedStringForKey:@"RSR_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v209 = 1;
        id v46 = v210;
      }
      else
      {
        id v208 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v207 = 1;
        id v206 = (id)[v208 localizedStringForKey:@"STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v205 = 1;
        id v46 = v206;
      }
      id v253 = (id)objc_msgSend(v47, "stringWithFormat:", v46, v248);
      if (v205) {

      }
      if (v207) {
      if (v209)
      }

      if (v211) {
      if (v213)
      }

      int v232 = 1;
    }
    else if ((v247 & v230) == v230)
    {
      uint64_t v44 = NSString;
      id v45 = (id)[v251 descriptor];
      char v203 = 0;
      char v201 = 0;
      char v199 = 0;
      char v197 = 0;
      char v195 = 0;
      if (v45
        && (id v204 = (id)[v251 descriptor],
            char v203 = 1,
            ([v204 isSplatOnly] & 1) != 0))
      {
        id v202 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v201 = 1;
        id v200 = (id)[v202 localizedStringForKey:@"RSR_BATTERY_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v199 = 1;
        id v43 = v200;
      }
      else
      {
        id v198 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v197 = 1;
        id v196 = (id)[v198 localizedStringForKey:@"BATTERY_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v195 = 1;
        id v43 = v196;
      }
      id v253 = (id)objc_msgSend(v44, "stringWithFormat:", v43, v227);
      if (v195) {

      }
      if (v197) {
      if (v199)
      }

      if (v201) {
      if (v203)
      }

      int v232 = 1;
    }
    else if ((v247 & v229) == v229)
    {
      id v41 = NSString;
      id v42 = (id)[v251 descriptor];
      char v193 = 0;
      char v191 = 0;
      char v189 = 0;
      char v187 = 0;
      char v185 = 0;
      if (v42
        && (id v194 = (id)[v251 descriptor],
            char v193 = 1,
            ([v194 isSplatOnly] & 1) != 0))
      {
        id v192 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v191 = 1;
        id v190 = (id)[v192 localizedStringForKey:@"RSR_BATTERY_AND_STORAGE_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v189 = 1;
        id v40 = v190;
      }
      else
      {
        id v188 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v187 = 1;
        id v186 = (id)[v188 localizedStringForKey:@"BATTERY_AND_STORAGE_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v185 = 1;
        id v40 = v186;
      }
      id v253 = (id)objc_msgSend(v41, "stringWithFormat:", v40, v227, v248);
      if (v185) {

      }
      if (v187) {
      if (v189)
      }

      if (v191) {
      if (v193)
      }

      int v232 = 1;
    }
    else if (v247 & 1) == 0 || (v225)
    {
      if ((v247 & 1) != 0 && (v225 & 1) != 0 && (v226 & 1) == 0)
      {
        id v35 = NSString;
        id v36 = (id)[v251 descriptor];
        char v173 = 0;
        char v171 = 0;
        char v169 = 0;
        char v167 = 0;
        char v165 = 0;
        if (v36
          && (id v174 = (id)[v251 descriptor],
              char v173 = 1,
              ([v174 isSplatOnly] & 1) != 0))
        {
          id v172 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v171 = 1;
          id v170 = (id)[v172 localizedStringForKey:@"RSR_BATTERY_WIRED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v169 = 1;
          id v34 = v170;
        }
        else
        {
          id v168 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v167 = 1;
          id v166 = (id)[v168 localizedStringForKey:@"BATTERY_WIRED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v165 = 1;
          id v34 = v166;
        }
        id v253 = (id)objc_msgSend(v35, "stringWithFormat:", v34, v227);
        if (v165) {

        }
        if (v167) {
        if (v169)
        }

        if (v171) {
        if (v173)
        }

        int v232 = 1;
      }
      else if (v247 & 1) != 0 && (v225 & 1) != 0 && (v226)
      {
        id v32 = NSString;
        id v33 = (id)[v251 descriptor];
        char v163 = 0;
        char v161 = 0;
        char v159 = 0;
        char v157 = 0;
        char v155 = 0;
        if (v33
          && (id v164 = (id)[v251 descriptor],
              char v163 = 1,
              ([v164 isSplatOnly] & 1) != 0))
        {
          id v162 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v161 = 1;
          id v160 = (id)[v162 localizedStringForKey:@"RSR_BATTERY_WIRELESS_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v159 = 1;
          id v31 = v160;
        }
        else
        {
          id v158 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v157 = 1;
          id v156 = (id)[v158 localizedStringForKey:@"BATTERY_WIRELESS_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v155 = 1;
          id v31 = v156;
        }
        id v253 = (id)objc_msgSend(v32, "stringWithFormat:", v31, v227);
        if (v155) {

        }
        if (v157) {
        if (v159)
        }

        if (v161) {
        if (v163)
        }

        int v232 = 1;
      }
      else if ((v247 & 4) != 0)
      {
        char v29 = NSString;
        id v30 = (id)[v251 descriptor];
        char v153 = 0;
        char v151 = 0;
        char v149 = 0;
        char v147 = 0;
        char v145 = 0;
        if (v30
          && (id v154 = (id)[v251 descriptor],
              char v153 = 1,
              ([v154 isSplatOnly] & 1) != 0))
        {
          id v152 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v151 = 1;
          id v150 = (id)[v152 localizedStringForKey:@"RSR_STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
          char v149 = 1;
          id v28 = v150;
        }
        else
        {
          id v148 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v147 = 1;
          id v146 = (id)[v148 localizedStringForKey:@"STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
          char v145 = 1;
          id v28 = v146;
        }
        id v253 = (id)objc_msgSend(v29, "stringWithFormat:", v28, v248);
        if (v145) {

        }
        if (v147) {
        if (v149)
        }

        if (v151) {
        if (v153)
        }

        int v232 = 1;
      }
      else if ((v247 & 2) != 0)
      {
        id v27 = (id)[v251 descriptor];
        char v143 = 0;
        char v141 = 0;
        char v139 = 0;
        char v137 = 0;
        char v135 = 0;
        if (v27
          && (id v144 = (id)[v251 descriptor],
              char v143 = 1,
              ([v144 isSplatOnly] & 1) != 0))
        {
          id v142 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v141 = 1;
          id v140 = (id)[v142 localizedStringForKey:@"RSR_NETWORK_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v139 = 1;
          id v10 = v140;
        }
        else
        {
          id v138 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v137 = 1;
          id v136 = (id)[v138 localizedStringForKey:@"NETWORK_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v135 = 1;
          id v10 = v136;
        }
        id v253 = v10;
        if (v135) {

        }
        if (v137) {
        if (v139)
        }

        if (v141) {
        if (v143)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x80) != 0)
      {
        id v26 = (id)[v251 descriptor];
        char v133 = 0;
        char v131 = 0;
        char v129 = 0;
        char v127 = 0;
        char v125 = 0;
        if (v26
          && (id v134 = (id)[v251 descriptor],
              char v133 = 1,
              ([v134 isSplatOnly] & 1) != 0))
        {
          id v132 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v131 = 1;
          id v130 = (id)[v132 localizedStringForKey:@"RSR_SYNCING_DATA_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v129 = 1;
          id v11 = v130;
        }
        else
        {
          id v128 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v127 = 1;
          id v126 = (id)[v128 localizedStringForKey:@"SYNCING_DATA_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v125 = 1;
          id v11 = v126;
        }
        id v253 = v11;
        if (v125) {

        }
        if (v127) {
        if (v129)
        }

        if (v131) {
        if (v133)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x100) != 0)
      {
        id v25 = (id)[v251 descriptor];
        char v123 = 0;
        char v121 = 0;
        char v119 = 0;
        char v117 = 0;
        char v115 = 0;
        if (v25
          && (id v124 = (id)[v251 descriptor],
              char v123 = 1,
              ([v124 isSplatOnly] & 1) != 0))
        {
          id v122 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v121 = 1;
          id v120 = (id)[v122 localizedStringForKey:@"RSR_PHONE_CALL_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v119 = 1;
          id v12 = v120;
        }
        else
        {
          id v118 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v117 = 1;
          id v116 = (id)[v118 localizedStringForKey:@"PHONE_CALL_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v115 = 1;
          id v12 = v116;
        }
        id v253 = v12;
        if (v115) {

        }
        if (v117) {
        if (v119)
        }

        if (v121) {
        if (v123)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x40) != 0)
      {
        id v24 = (id)[v251 descriptor];
        char v113 = 0;
        char v111 = 0;
        char v109 = 0;
        char v107 = 0;
        char v105 = 0;
        if (v24
          && (id v114 = (id)[v251 descriptor],
              char v113 = 1,
              ([v114 isSplatOnly] & 1) != 0))
        {
          id v112 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v111 = 1;
          id v110 = (id)[v112 localizedStringForKey:@"RSR_RESTORING_FROM_BACKUP_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v109 = 1;
          id v13 = v110;
        }
        else
        {
          id v108 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v107 = 1;
          id v106 = (id)[v108 localizedStringForKey:@"RESTORING_FROM_BACKUP_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v105 = 1;
          id v13 = v106;
        }
        id v253 = v13;
        if (v105) {

        }
        if (v107) {
        if (v109)
        }

        if (v111) {
        if (v113)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x200) != 0)
      {
        id v23 = (id)[v251 descriptor];
        char v103 = 0;
        char v101 = 0;
        char v99 = 0;
        char v97 = 0;
        char v95 = 0;
        if (v23
          && (id v104 = (id)[v251 descriptor],
              char v103 = 1,
              ([v104 isSplatOnly] & 1) != 0))
        {
          id v102 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v101 = 1;
          id v100 = (id)[v102 localizedStringForKey:@"RSR_CARPLAY_CONNECTED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v99 = 1;
          id v14 = v100;
        }
        else
        {
          id v98 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v97 = 1;
          id v96 = (id)[v98 localizedStringForKey:@"CARPLAY_CONNECTED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v95 = 1;
          id v14 = v96;
        }
        id v253 = v14;
        if (v95) {

        }
        if (v97) {
        if (v99)
        }

        if (v101) {
        if (v103)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x400) != 0)
      {
        id v22 = (id)[v251 descriptor];
        char v93 = 0;
        char v91 = 0;
        char v89 = 0;
        char v87 = 0;
        char v85 = 0;
        if (v22
          && (id v94 = (id)[v251 descriptor],
              char v93 = 1,
              ([v94 isSplatOnly] & 1) != 0))
        {
          id v92 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v91 = 1;
          id v90 = (id)[v92 localizedStringForKey:@"RSR_MEDIA_PLAYING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v89 = 1;
          id v15 = v90;
        }
        else
        {
          id v88 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v87 = 1;
          id v86 = (id)[v88 localizedStringForKey:@"MEDIA_PLAYING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v85 = 1;
          id v15 = v86;
        }
        id v253 = v15;
        if (v85) {

        }
        if (v87) {
        if (v89)
        }

        if (v91) {
        if (v93)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x800) != 0)
      {
        id v21 = (id)[v251 descriptor];
        char v83 = 0;
        char v81 = 0;
        char v79 = 0;
        char v77 = 0;
        char v75 = 0;
        if (v21
          && (id v84 = (id)[v251 descriptor],
              char v83 = 1,
              ([v84 isSplatOnly] & 1) != 0))
        {
          id v82 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v81 = 1;
          id v80 = (id)[v82 localizedStringForKey:@"RSR_DRIVING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v79 = 1;
          id v16 = v80;
        }
        else
        {
          id v78 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v77 = 1;
          id v76 = (id)[v78 localizedStringForKey:@"DRIVING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v75 = 1;
          id v16 = v76;
        }
        id v253 = v16;
        if (v75) {

        }
        if (v77) {
        if (v79)
        }

        if (v81) {
        if (v83)
        }

        int v232 = 1;
      }
      else if ((v247 & 0x1000) != 0)
      {
        id v20 = (id)[v251 descriptor];
        char v73 = 0;
        char v71 = 0;
        char v69 = 0;
        char v67 = 0;
        char v65 = 0;
        if (v20
          && (id v74 = (id)[v251 descriptor],
              char v73 = 1,
              ([v74 isSplatOnly] & 1) != 0))
        {
          id v72 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v71 = 1;
          id v70 = (id)[v72 localizedStringForKey:@"RSR_WOMBAT_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v69 = 1;
          id v17 = v70;
        }
        else
        {
          id v68 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v67 = 1;
          id v66 = (id)[v68 localizedStringForKey:@"WOMBAT_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          char v65 = 1;
          id v17 = v66;
        }
        id v253 = v17;
        if (v65) {

        }
        if (v67) {
        if (v69)
        }

        if (v71) {
        if (v73)
        }

        int v232 = 1;
      }
      else
      {
        id v253 = 0;
        int v232 = 1;
      }
    }
    else
    {
      id v38 = NSString;
      id v39 = (id)[v251 descriptor];
      char v183 = 0;
      char v181 = 0;
      char v179 = 0;
      char v177 = 0;
      char v175 = 0;
      if (v39
        && (id v184 = (id)[v251 descriptor],
            char v183 = 1,
            ([v184 isSplatOnly] & 1) != 0))
      {
        id v182 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v181 = 1;
        id v180 = (id)[v182 localizedStringForKey:@"RSR_BATTERY_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v179 = 1;
        id v37 = v180;
      }
      else
      {
        id v178 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v177 = 1;
        id v176 = (id)[v178 localizedStringForKey:@"BATTERY_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        char v175 = 1;
        id v37 = v176;
      }
      id v253 = (id)objc_msgSend(v38, "stringWithFormat:", v37, v227);
      if (v175) {

      }
      if (v177) {
      if (v179)
      }

      if (v181) {
      if (v183)
      }

      int v232 = 1;
    }
    objc_storeStrong(&v227, 0);
  }
  objc_storeStrong(&v248, 0);
  objc_storeStrong(&v250, 0);
  objc_storeStrong(&v251, 0);
  objc_storeStrong(location, 0);
  id v18 = v253;
  return v18;
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