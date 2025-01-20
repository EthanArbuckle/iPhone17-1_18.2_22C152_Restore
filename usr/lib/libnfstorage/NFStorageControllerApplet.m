@interface NFStorageControllerApplet
- (id)_deleteAllAppletEntities;
- (id)dbProtectionType;
- (id)fetchAppletEntitiesWithError:(id *)a3;
- (id)name;
- (id)updateAppletEntitiesWithConfig:(id)a3;
- (void)deleteAllAppletEntities;
@end

@implementation NFStorageControllerApplet

void __58__NFStorageControllerApplet_fetchAppletEntitiesWithError___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  v2 = +[AppletEntity fetchRequest];
  v3 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v13, ClassName, Name, 52, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
    dispatch_get_specific(*v6);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 67110146;
      int v65 = v16;
      __int16 v66 = 2082;
      v67 = v17;
      __int16 v68 = 2082;
      v69 = v18;
      __int16 v70 = 1024;
      int v71 = 52;
      __int16 v72 = 2114;
      uint64_t v73 = v19;
      v20 = "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@";
      v21 = v14;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
      uint32_t v23 = 44;
LABEL_11:
      _os_log_impl(&dword_2227A9000, v21, v22, v20, buf, v23);
    }
  }
  else if ([v5 count])
  {
    v14 = [v5 firstObject];
    if ([v14 version] == 4)
    {
      v24 = [NSNumber numberWithUnsignedLongLong:-[NSObject crsUpdateCounter](v14, "crsUpdateCounter")];
      v25 = [v14 applets];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v27 = objc_alloc(MEMORY[0x263EFF8C0]);
        v28 = [v14 applets];
        v29 = (void *)[v27 initWithArray:v28];
      }
      else
      {
        v29 = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v24 forKey:@"crsUpdateCounter"];
      v56 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v57 = [NSString alloc];
      v58 = [v14 seid];
      v59 = (void *)[v57 initWithString:v58];
      [v56 setObject:v59 forKey:@"seid"];

      if (v29) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v29 forKey:@"applets"];
      }
      v60 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      [v60 reset];
    }
    else
    {
      v41 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(*(id *)(a1 + 32));
        BOOL v45 = class_isMetaClass(v44);
        v46 = object_getClassName(*(id *)(a1 + 32));
        v47 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v62 = [v14 version];
        uint64_t v48 = 45;
        if (v45) {
          uint64_t v48 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i Wrong applet storage version %llu, expecting %d", v48, v46, v47, 63, v62, 4);
      }
      dispatch_get_specific(*v41);
      v49 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        v52 = object_getClassName(*(id *)(a1 + 32));
        v53 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v54 = [v14 version];
        *(_DWORD *)buf = 67110402;
        int v65 = v51;
        __int16 v66 = 2082;
        v67 = v52;
        __int16 v68 = 2082;
        v69 = v53;
        __int16 v70 = 1024;
        int v71 = 63;
        __int16 v72 = 2048;
        uint64_t v73 = v54;
        __int16 v74 = 1024;
        int v75 = 4;
        _os_log_impl(&dword_2227A9000, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong applet storage version %llu, expecting %d", buf, 0x32u);
      }

      id v55 = (id)[*(id *)(a1 + 32) _deleteAllAppletEntities];
    }
  }
  else
  {
    v30 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      v32 = (void (*)(uint64_t, const char *, ...))v31;
      v33 = object_getClass(*(id *)(a1 + 32));
      BOOL v34 = class_isMetaClass(v33);
      v35 = object_getClassName(*(id *)(a1 + 32));
      v61 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v36 = 45;
      if (v34) {
        uint64_t v36 = 43;
      }
      v32(6, "%c[%{public}s %{public}s]:%i No applets found in storage", v36, v35, v61, 58);
    }
    dispatch_get_specific(*v30);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v37 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      v39 = object_getClassName(*(id *)(a1 + 32));
      v40 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      int v65 = v38;
      __int16 v66 = 2082;
      v67 = v39;
      __int16 v68 = 2082;
      v69 = v40;
      __int16 v70 = 1024;
      int v71 = 58;
      v20 = "%c[%{public}s %{public}s]:%i No applets found in storage";
      v21 = v14;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      uint32_t v23 = 34;
      goto LABEL_11;
    }
  }
}

- (id)fetchAppletEntitiesWithError:(id *)a3
{
  v61[5] = *MEMORY[0x263EF8340];
  v6 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  if (v6)
  {
    *(void *)id v57 = 0;
    *(void *)v58 = v57;
    *(void *)&v58[8] = 0x3032000000;
    *(void *)&v58[16] = __Block_byref_object_copy_;
    *(void *)&v58[24] = __Block_byref_object_dispose_;
    id v59 = (id)objc_opt_new();
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    BOOL v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    v7 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __58__NFStorageControllerApplet_fetchAppletEntitiesWithError___block_invoke;
    v40[3] = &unk_264627680;
    v40[4] = self;
    v40[5] = &v41;
    v40[6] = v57;
    v40[7] = a2;
    [v7 performBlockAndWait:v40];

    if (a3) {
      *a3 = (id) v42[5];
    }
    v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v11 = 43;
      }
      else {
        uint64_t v11 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i applets: %{public}@", v11, ClassName, Name, 86, *(void *)(*(void *)v58 + 40));
    }
    dispatch_get_specific(*v8);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      uint64_t v19 = *(void *)(*(void *)v58 + 40);
      *(_DWORD *)buf = 67110146;
      int v48 = v16;
      __int16 v49 = 2082;
      v50 = v17;
      __int16 v51 = 2082;
      v52 = v18;
      __int16 v53 = 1024;
      int v54 = 86;
      __int16 v55 = 2114;
      uint64_t v56 = v19;
      _os_log_impl(&dword_2227A9000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applets: %{public}@", buf, 0x2Cu);
    }

    id v20 = *(id *)(*(void *)v58 + 40);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(v57, 8);
  }
  else
  {
    v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      uint32_t v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v39 = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v27, v26, v39, 36);
    }
    dispatch_get_specific(*v21);
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)id v57 = 67109890;
      *(_DWORD *)&v57[4] = v30;
      *(_WORD *)v58 = 2082;
      *(void *)&v58[2] = object_getClassName(self);
      *(_WORD *)&v58[10] = 2082;
      *(void *)&v58[12] = sel_getName(a2);
      *(_WORD *)&v58[20] = 1024;
      *(_DWORD *)&v58[22] = 36;
      _os_log_impl(&dword_2227A9000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v57, 0x22u);
    }

    if (a3)
    {
      id v31 = objc_alloc(MEMORY[0x263F087E8]);
      v32 = [NSString stringWithUTF8String:"nfcd"];
      v60[0] = *MEMORY[0x263F08320];
      v33 = [NSString stringWithUTF8String:"Unknown Error"];
      v61[0] = v33;
      v61[1] = &unk_26D4E93A0;
      v60[1] = @"Line";
      v60[2] = @"Method";
      BOOL v34 = [[NSString alloc] initWithFormat:@"%s", sel_getName(a2)];
      v61[2] = v34;
      v60[3] = *MEMORY[0x263F07F80];
      v35 = [[NSString alloc] initWithFormat:@"%s:%d", sel_getName(a2), 38];
      v61[3] = v35;
      v60[4] = *MEMORY[0x263F08338];
      uint64_t v36 = (void *)[[NSString alloc] initWithFormat:@"managedObjectContext is NULL"];
      v61[4] = v36;
      v37 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];
      *a3 = (id)[v31 initWithDomain:v32 code:6 userInfo:v37];
    }
    id v20 = 0;
  }

  return v20;
}

- (id)name
{
  return @"Applet";
}

- (id)dbProtectionType
{
  return (id)*MEMORY[0x263F080B0];
}

- (id)_deleteAllAppletEntities
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[AppletEntity fetchRequest];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v4];
  v6 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  id v23 = 0;
  id v7 = (id)[v6 executeRequest:v5 error:&v23];
  id v8 = v23;

  if (v8)
  {
    v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", v14, ClassName, Name, 100, v8);
    }
    dispatch_get_specific(*v9);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      v18 = object_getClassName(self);
      uint64_t v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v25 = v17;
      __int16 v26 = 2082;
      uint64_t v27 = v18;
      __int16 v28 = 2082;
      v29 = v19;
      __int16 v30 = 1024;
      int v31 = 100;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_impl(&dword_2227A9000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", buf, 0x2Cu);
    }
  }

  return v8;
}

- (id)updateAppletEntitiesWithConfig:(id)a3
{
  v49[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  id v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  v9 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v6)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i new Applet Config=%{public}@", v12, ClassName, Name, 122, v5);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v39 = v15;
      __int16 v40 = 2082;
      uint64_t v41 = object_getClassName(self);
      __int16 v42 = 2082;
      uint64_t v43 = sel_getName(a2);
      __int16 v44 = 1024;
      int v45 = 122;
      __int16 v46 = 2114;
      id v47 = v5;
      _os_log_impl(&dword_2227A9000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new Applet Config=%{public}@", buf, 0x2Cu);
    }

    int v16 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke;
    v35[3] = &unk_2646276F8;
    v35[4] = self;
    SEL v37 = a2;
    id v36 = v5;
    [v16 performBlock:v35];

    int v17 = 0;
  }
  else
  {
    if (Logger)
    {
      v18 = object_getClass(self);
      BOOL v19 = class_isMetaClass(v18);
      id v20 = object_getClassName(self);
      uint64_t v34 = sel_getName(a2);
      uint64_t v21 = 45;
      if (v19) {
        uint64_t v21 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v21, v20, v34, 118);
    }
    dispatch_get_specific(*v7);
    uint64_t v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v39 = v24;
      __int16 v40 = 2082;
      uint64_t v41 = object_getClassName(self);
      __int16 v42 = 2082;
      uint64_t v43 = sel_getName(a2);
      __int16 v44 = 1024;
      int v45 = 118;
      _os_log_impl(&dword_2227A9000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }

    id v25 = objc_alloc(MEMORY[0x263F087E8]);
    __int16 v26 = [NSString stringWithUTF8String:"nfcd"];
    v48[0] = *MEMORY[0x263F08320];
    uint64_t v27 = [NSString stringWithUTF8String:"Invalid State"];
    v49[0] = v27;
    v49[1] = &unk_26D4E93B8;
    v48[1] = @"Line";
    v48[2] = @"Method";
    __int16 v28 = [[NSString alloc] initWithFormat:@"%s", sel_getName(a2)];
    v49[2] = v28;
    v48[3] = *MEMORY[0x263F07F80];
    v29 = [NSString initWithFormat:@"%s:%d", sel_getName(a2), 119];
    v49[3] = v29;
    __int16 v30 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    int v17 = (void *)[v25 initWithDomain:v26 code:12 userInfo:v30];
  }

  return v17;
}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  int v54 = __Block_byref_object_copy_;
  __int16 v55 = __Block_byref_object_dispose_;
  id v56 = [*(id *)(a1 + 32) _deleteAllAppletEntities];
  if (v52[5])
  {
    v2 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class)) {
        uint64_t v5 = 43;
      }
      else {
        uint64_t v5 = 45;
      }
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", v5, ClassName, Name, 129, v52[5]);
    }
    dispatch_get_specific(*v2);
    id v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v9)) {
        int v10 = 43;
      }
      else {
        int v10 = 45;
      }
      uint64_t v11 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v12 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = v52[5];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)__int16 v68 = 2082;
      *(void *)&v68[2] = v11;
      *(_WORD *)&v68[10] = 2082;
      *(void *)&v68[12] = v12;
      *(_WORD *)&v68[20] = 1024;
      *(_DWORD *)&v68[22] = 129;
      *(_WORD *)&v68[26] = 2114;
      *(void *)&v68[28] = v13;
      _os_log_impl(&dword_2227A9000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", buf, 0x2Cu);
    }

    uint64_t v14 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    [v14 reset];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)__int16 v68 = buf;
    *(void *)&v68[8] = 0x3032000000;
    *(void *)&v68[16] = __Block_byref_object_copy_;
    *(void *)&v68[24] = __Block_byref_object_dispose_;
    *(void *)&v68[32] = 0;
    uint64_t v45 = 0;
    __int16 v46 = &v45;
    uint64_t v47 = 0x3032000000;
    int v48 = __Block_byref_object_copy_;
    __int16 v49 = __Block_byref_object_dispose_;
    id v50 = 0;
    uint64_t v39 = 0;
    __int16 v40 = &v39;
    uint64_t v41 = 0x3032000000;
    __int16 v42 = __Block_byref_object_copy_;
    uint64_t v43 = __Block_byref_object_dispose_;
    id v44 = 0;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_168;
    v38[3] = &unk_2646276D0;
    int v15 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    v38[4] = *(void *)(a1 + 32);
    v38[5] = &v51;
    v38[6] = buf;
    v38[7] = &v45;
    v38[8] = &v39;
    v38[9] = v16;
    [v15 enumerateKeysAndObjectsUsingBlock:v38];
    if (!v52[5])
    {
      int v17 = (void *)MEMORY[0x263EFF240];
      v18 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      BOOL v19 = [v17 insertNewObjectForEntityForName:@"AppletEntity" inManagedObjectContext:v18];

      [v19 setVersion:4];
      [v19 setCrsUpdateCounter:[*(id *)(*(void *)v68 + 40) longLongValue]];
      [v19 setSeid:v46[5]];
      [v19 setApplets:v40[5]];
      id v20 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      int v21 = [v20 hasChanges];

      if (v21)
      {
        uint64_t v22 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
        id v23 = (id *)(v52 + 5);
        id obj = (id)v52[5];
        [v22 save:&obj];
        objc_storeStrong(v23, obj);

        if (v52[5])
        {
          int v24 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          id v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v25)
          {
            __int16 v26 = object_getClass(*(id *)(a1 + 32));
            if (class_isMetaClass(v26)) {
              uint64_t v27 = 43;
            }
            else {
              uint64_t v27 = 45;
            }
            __int16 v28 = object_getClassName(*(id *)(a1 + 32));
            v29 = sel_getName(*(SEL *)(a1 + 48));
            v25(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v27, v28, v29, 188, v52[5]);
          }
          dispatch_get_specific(*v24);
          __int16 v30 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            int v31 = object_getClass(*(id *)(a1 + 32));
            if (class_isMetaClass(v31)) {
              int v32 = 43;
            }
            else {
              int v32 = 45;
            }
            id v33 = object_getClassName(*(id *)(a1 + 32));
            uint64_t v34 = sel_getName(*(SEL *)(a1 + 48));
            uint64_t v35 = v52[5];
            *(_DWORD *)id v57 = 67110146;
            int v58 = v32;
            __int16 v59 = 2082;
            v60 = v33;
            __int16 v61 = 2082;
            uint64_t v62 = v34;
            __int16 v63 = 1024;
            int v64 = 188;
            __int16 v65 = 2114;
            uint64_t v66 = v35;
            _os_log_impl(&dword_2227A9000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v57, 0x2Cu);
          }
        }
      }
    }
    id v36 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    [v36 reset];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v51, 8);
}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_168(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 isEqualToString:@"crsUpdateCounter"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = *(void *)(a1 + 48);
LABEL_18:
        objc_storeStrong((id *)(*(void *)(v9 + 8) + 40), a3);
        goto LABEL_53;
      }
      v107 = a4;
      SEL v37 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v39 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 72));
        id v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v46 = id v45 = v8;
        uint64_t v47 = 45;
        if (isMetaClass) {
          uint64_t v47 = 43;
        }
        v39(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for counter", v47, ClassName, Name, 146, v46);

        id v8 = v45;
      }
      dispatch_get_specific(*v37);
      int v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        __int16 v49 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        uint64_t v51 = object_getClassName(*(id *)(a1 + 32));
        v52 = sel_getName(*(SEL *)(a1 + 72));
        uint64_t v53 = (objc_class *)objc_opt_class();
        int v54 = NSStringFromClass(v53);
        *(_DWORD *)buf = 67110146;
        int v118 = v50;
        __int16 v119 = 2082;
        v120 = v51;
        __int16 v121 = 2082;
        v122 = v52;
        __int16 v123 = 1024;
        int v124 = 146;
        __int16 v125 = 2114;
        v126 = v54;
        _os_log_impl(&dword_2227A9000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for counter", buf, 0x2Cu);
      }
      id v55 = objc_alloc(MEMORY[0x263F087E8]);
      id v56 = [NSString stringWithUTF8String:"nfcd"];
      v113[0] = *MEMORY[0x263F08320];
      id v57 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v114[0] = v57;
      v114[1] = &unk_26D4E93E8;
      v113[1] = @"Line";
      v113[2] = @"Method";
      int v58 = [[NSString alloc] initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 72))];
      v114[2] = v58;
      v113[3] = *MEMORY[0x263F07F80];
      id v59 = v8;
      v60 = [NSString initWithFormat:@"%s:%d", sel_getName(*(SEL *)(a1 + 72)), 147];
      v114[3] = v60;
      __int16 v61 = NSDictionary;
      uint64_t v62 = v114;
      __int16 v63 = v113;
    }
    else if ([v7 isEqualToString:@"seid"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = *(void *)(a1 + 56);
        goto LABEL_18;
      }
      v107 = a4;
      uint64_t v66 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v67 = NFLogGetLogger();
      if (v67)
      {
        __int16 v68 = (void (*)(uint64_t, const char *, ...))v67;
        uint64_t v69 = object_getClass(*(id *)(a1 + 32));
        BOOL v70 = class_isMetaClass(v69);
        int v71 = object_getClassName(*(id *)(a1 + 32));
        __int16 v72 = sel_getName(*(SEL *)(a1 + 72));
        uint64_t v73 = (objc_class *)objc_opt_class();
        NSStringFromClass(v73);
        v75 = id v74 = v8;
        uint64_t v76 = 45;
        if (v70) {
          uint64_t v76 = 43;
        }
        v68(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for seid", v76, v71, v72, 154, v75);

        id v8 = v74;
      }
      dispatch_get_specific(*v66);
      v77 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v78 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v78)) {
          int v79 = 43;
        }
        else {
          int v79 = 45;
        }
        v80 = object_getClassName(*(id *)(a1 + 32));
        v81 = sel_getName(*(SEL *)(a1 + 72));
        v82 = (objc_class *)objc_opt_class();
        v83 = NSStringFromClass(v82);
        *(_DWORD *)buf = 67110146;
        int v118 = v79;
        __int16 v119 = 2082;
        v120 = v80;
        __int16 v121 = 2082;
        v122 = v81;
        __int16 v123 = 1024;
        int v124 = 154;
        __int16 v125 = 2114;
        v126 = v83;
        _os_log_impl(&dword_2227A9000, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for seid", buf, 0x2Cu);
      }
      id v55 = objc_alloc(MEMORY[0x263F087E8]);
      id v56 = [NSString stringWithUTF8String:"nfcd"];
      v111[0] = *MEMORY[0x263F08320];
      id v57 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v112[0] = v57;
      v112[1] = &unk_26D4E9400;
      v111[1] = @"Line";
      v111[2] = @"Method";
      int v58 = [[NSString alloc] initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 72))];
      v112[2] = v58;
      v111[3] = *MEMORY[0x263F07F80];
      id v59 = v8;
      v60 = [NSString initWithFormat:@"%s:%d", sel_getName(*(SEL *)(a1 + 72)), 155];
      v112[3] = v60;
      __int16 v61 = NSDictionary;
      uint64_t v62 = v112;
      __int16 v63 = v111;
    }
    else
    {
      if (![v7 isEqualToString:@"applets"]) {
        goto LABEL_53;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
        int v64 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v108[0] = MEMORY[0x263EF8330];
        v108[1] = 3221225472;
        v108[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_181;
        v108[3] = &unk_2646276A8;
        uint64_t v65 = *(void *)(a1 + 72);
        v108[4] = *(void *)(a1 + 40);
        v108[5] = v65;
        [v64 enumerateObjectsUsingBlock:v108];
        goto LABEL_53;
      }
      v107 = a4;
      v84 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v85 = NFLogGetLogger();
      if (v85)
      {
        v86 = (void (*)(uint64_t, const char *, ...))v85;
        v87 = object_getClass(*(id *)(a1 + 32));
        BOOL v88 = class_isMetaClass(v87);
        v89 = object_getClassName(*(id *)(a1 + 32));
        v90 = sel_getName(*(SEL *)(a1 + 72));
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        v93 = id v92 = v8;
        uint64_t v94 = 45;
        if (v88) {
          uint64_t v94 = 43;
        }
        v86(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for applets", v94, v89, v90, 162, v93);

        id v8 = v92;
      }
      dispatch_get_specific(*v84);
      v95 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        v96 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v96)) {
          int v97 = 43;
        }
        else {
          int v97 = 45;
        }
        v98 = object_getClassName(*(id *)(a1 + 32));
        v99 = sel_getName(*(SEL *)(a1 + 72));
        v100 = (objc_class *)objc_opt_class();
        v101 = NSStringFromClass(v100);
        *(_DWORD *)buf = 67110146;
        int v118 = v97;
        __int16 v119 = 2082;
        v120 = v98;
        __int16 v121 = 2082;
        v122 = v99;
        __int16 v123 = 1024;
        int v124 = 162;
        __int16 v125 = 2114;
        v126 = v101;
        _os_log_impl(&dword_2227A9000, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for applets", buf, 0x2Cu);
      }
      id v55 = objc_alloc(MEMORY[0x263F087E8]);
      id v56 = [NSString stringWithUTF8String:"nfcd"];
      v109[0] = *MEMORY[0x263F08320];
      id v57 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v110[0] = v57;
      v110[1] = &unk_26D4E9418;
      v109[1] = @"Line";
      v109[2] = @"Method";
      int v58 = [[NSString alloc] initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 72))];
      v110[2] = v58;
      v109[3] = *MEMORY[0x263F07F80];
      id v59 = v8;
      v60 = [NSString initWithFormat:@"%s:%d", sel_getName(*(SEL *)(a1 + 72)), 163];
      v110[3] = v60;
      __int16 v61 = NSDictionary;
      uint64_t v62 = v110;
      __int16 v63 = v109;
    }
    v102 = [v61 dictionaryWithObjects:v62 forKeys:v63 count:4];
    uint64_t v103 = [v55 initWithDomain:v56 code:10 userInfo:v102];
    uint64_t v104 = *(void *)(*(void *)(a1 + 40) + 8);
    v105 = *(void **)(v104 + 40);
    *(void *)(v104 + 40) = v103;

    id v8 = v59;
    unsigned char *v107 = 1;
    goto LABEL_53;
  }
  id v106 = v8;
  int v10 = a4;
  uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v12 = NFLogGetLogger();
  if (v12)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))v12;
    uint64_t v14 = object_getClass(*(id *)(a1 + 32));
    BOOL v15 = class_isMetaClass(v14);
    uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 72));
    v18 = (objc_class *)objc_opt_class();
    BOOL v19 = NSStringFromClass(v18);
    uint64_t v20 = 45;
    if (v15) {
      uint64_t v20 = 43;
    }
    v13(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for key", v20, v16, v17, 141, v19);
  }
  dispatch_get_specific(*v11);
  int v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    int v24 = object_getClassName(*(id *)(a1 + 32));
    id v25 = sel_getName(*(SEL *)(a1 + 72));
    __int16 v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 67110146;
    int v118 = v23;
    __int16 v119 = 2082;
    v120 = v24;
    __int16 v121 = 2082;
    v122 = v25;
    __int16 v123 = 1024;
    int v124 = 141;
    __int16 v125 = 2114;
    v126 = v27;
    _os_log_impl(&dword_2227A9000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for key", buf, 0x2Cu);
  }
  id v28 = objc_alloc(MEMORY[0x263F087E8]);
  v29 = [NSString stringWithUTF8String:"nfcd"];
  v115[0] = *MEMORY[0x263F08320];
  __int16 v30 = [NSString stringWithUTF8String:"Invalid Parameter"];
  v116[0] = v30;
  v116[1] = &unk_26D4E93D0;
  v115[1] = @"Line";
  v115[2] = @"Method";
  int v31 = [[NSString alloc] initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 72))];
  v116[2] = v31;
  v115[3] = *MEMORY[0x263F07F80];
  int v32 = [[NSString alloc] initWithFormat:@"%s:%d", sel_getName(*(SEL *)(a1 + 72)), 142];
  v116[3] = v32;
  id v33 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];
  uint64_t v34 = [v28 initWithDomain:v29 code:10 userInfo:v33];
  uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
  id v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = v34;

  *int v10 = 1;
  id v8 = v106;
LABEL_53:
}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_181(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v18[4] = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *a4 = 1;
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    v17[0] = *MEMORY[0x263F08320];
    int v10 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v18[0] = v10;
    v18[1] = &unk_26D4E9430;
    v17[1] = @"Line";
    v17[2] = @"Method";
    uint64_t v11 = [[NSString alloc] initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 40))];
    v18[2] = v11;
    v17[3] = *MEMORY[0x263F07F80];
    uint64_t v12 = [[NSString alloc] initWithFormat:@"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 170];
    v18[3] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    uint64_t v14 = [v8 initWithDomain:v9 code:10 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (void)deleteAllAppletEntities
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  if (v4)
  {
    uint64_t v5 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__NFStorageControllerApplet_deleteAllAppletEntities__block_invoke;
    v16[3] = &unk_264627720;
    v16[4] = self;
    v16[5] = a2;
    [v5 performBlock:v16];
  }
  else
  {
    id v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v12, ClassName, Name, 204);
    }
    dispatch_get_specific(*v6);
    uint64_t v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v14;
      __int16 v19 = 2082;
      uint64_t v20 = object_getClassName(self);
      __int16 v21 = 2082;
      uint64_t v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 204;
      _os_log_impl(&dword_2227A9000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }
  }
}

void __52__NFStorageControllerApplet_deleteAllAppletEntities__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _deleteAllAppletEntities];
  if (!v2)
  {
    v3 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    int v4 = [v3 hasChanges];

    if (v4)
    {
      uint64_t v5 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      id v20 = 0;
      [v5 save:&v20];
      id v2 = v20;

      if (v2)
      {
        id v6 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v8 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          uint64_t v11 = 45;
          if (isMetaClass) {
            uint64_t v11 = 43;
          }
          v8(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v11, ClassName, Name, 216, v2);
        }
        dispatch_get_specific(*v6);
        uint64_t v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v13)) {
            int v14 = 43;
          }
          else {
            int v14 = 45;
          }
          uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
          uint64_t v16 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          int v22 = v14;
          __int16 v23 = 2082;
          int v24 = v15;
          __int16 v25 = 2082;
          __int16 v26 = v16;
          __int16 v27 = 1024;
          int v28 = 216;
          __int16 v29 = 2114;
          id v30 = v2;
          _os_log_impl(&dword_2227A9000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", buf, 0x2Cu);
        }
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  int v17 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  [v17 reset];
}

@end