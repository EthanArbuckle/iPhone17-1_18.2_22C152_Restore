@interface NFStorageController
- (id)homePath;
- (id)managedObjectContext;
- (id)managedObjectModel;
@end

@implementation NFStorageController

- (id)managedObjectModel
{
  id v1 = a1[2];
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    v4 = NSURL;
    id v5 = [NSString alloc];
    v6 = [a1 name];
    v7 = (void *)[v5 initWithFormat:@"/System/Library/PrivateFrameworks/NearField.framework/NFStorage%@Model.momd", v6];
    v8 = [v4 URLWithString:v7];

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v8];
    id v10 = a1[2];
    a1[2] = (id)v9;

    id v2 = a1[2];
  }

  return v2;
}

- (id)managedObjectContext
{
  id v1 = a1;
  v119[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = a1[1];
    if (v2)
    {
      id v1 = (id *)v2;
      goto LABEL_55;
    }
    id v3 = a1[3];
    if (v3)
    {
      id v4 = v3;
      goto LABEL_53;
    }
    id v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = -[NFStorageController homePath]();
    uint64_t v7 = *MEMORY[0x263EFF0E0];
    uint64_t v118 = *MEMORY[0x263EFF0E0];
    v119[0] = *MEMORY[0x263F080B0];
    v8 = [NSDictionary dictionaryWithObjects:v119 forKeys:&v118 count:1];
    id v103 = 0;
    [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:&v103];
    uint64_t v9 = v103;

    if (v9)
    {
      id v10 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v1);
        Name = sel_getName(sel_persistentStoreCoordinator);
        v17 = -[NFStorageController homePath]();
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v12(3, "%c[%{public}s %{public}s]:%i Failed to create home directory %{public}@: %{public}@", v18, ClassName, Name, 75, v17, v9);
      }
      dispatch_get_specific(*v10);
      v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = object_getClass(v1);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        v22 = object_getClassName(v1);
        v23 = sel_getName(sel_persistentStoreCoordinator);
        v24 = -[NFStorageController homePath]();
        *(_DWORD *)buf = 67110402;
        int v107 = v21;
        __int16 v108 = 2082;
        v109 = v22;
        __int16 v110 = 2082;
        v111 = v23;
        __int16 v112 = 1024;
        int v113 = 75;
        __int16 v114 = 2114;
        v115 = v24;
        __int16 v116 = 2114;
        v117 = v9;
        _os_log_impl(&dword_2227A9000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create home directory %{public}@: %{public}@", buf, 0x36u);
      }
      id v4 = 0;
LABEL_52:

      if (!v4)
      {
LABEL_54:
        id v1 = (id *)v1[1];

        goto LABEL_55;
      }
LABEL_53:
      uint64_t v81 = [objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
      id v82 = v1[1];
      v1[1] = (id)v81;

      [v1[1] setPersistentStoreCoordinator:v4];
      goto LABEL_54;
    }
    v25 = NSURL;
    v26 = -[NFStorageController homePath]();
    id v27 = [NSString alloc];
    v28 = [v1 name];
    v29 = (void *)[v27 initWithFormat:@"NFStorage%@.sqlite", v28];
    v30 = [v26 stringByAppendingPathComponent:v29];

    v19 = [v25 fileURLWithPath:v30];

    v31 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v32 = *MEMORY[0x263EFF008];
    v104[0] = *MEMORY[0x263EFF070];
    v104[1] = v32;
    v105[0] = MEMORY[0x263EFFA88];
    v105[1] = MEMORY[0x263EFFA88];
    v104[2] = v7;
    v33 = [v1 dbProtectionType];
    v105[2] = v33;
    v34 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:3];
    v35 = [v31 dictionaryWithDictionary:v34];

    v36 = -[NFStorageController managedObjectModel](v1);

    if (v36)
    {
      id v37 = objc_alloc(MEMORY[0x263EFF320]);
      v38 = -[NFStorageController managedObjectModel](v1);
      uint64_t v39 = [v37 initWithManagedObjectModel:v38];
      id v40 = v1[3];
      v1[3] = (id)v39;

      id v41 = v1[3];
      uint64_t v42 = *MEMORY[0x263EFF168];
      id v102 = 0;
      v43 = [v41 addPersistentStoreWithType:v42 configuration:0 URL:v19 options:v35 error:&v102];
      v44 = v102;

      if (v43)
      {
        uint64_t v9 = v44;
LABEL_50:
        id v4 = v1[3];
        goto LABEL_51;
      }
      v57 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v58 = NFLogGetLogger();
      if (v58)
      {
        v59 = (void (*)(uint64_t, const char *, ...))v58;
        v60 = object_getClass(v1);
        BOOL v61 = class_isMetaClass(v60);
        v94 = object_getClassName(v1);
        v98 = sel_getName(sel_persistentStoreCoordinator);
        uint64_t v62 = 45;
        if (v61) {
          uint64_t v62 = 43;
        }
        v57 = (const void **)MEMORY[0x263F8C6C0];
        v59(3, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type: %{public}@", v62, v94, v98, 105, v44);
      }
      dispatch_get_specific(*v57);
      v63 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v64 = object_getClass(v1);
        if (class_isMetaClass(v64)) {
          int v65 = 43;
        }
        else {
          int v65 = 45;
        }
        v66 = object_getClassName(v1);
        v67 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        int v107 = v65;
        v57 = (const void **)MEMORY[0x263F8C6C0];
        __int16 v108 = 2082;
        v109 = v66;
        __int16 v110 = 2082;
        v111 = v67;
        __int16 v112 = 1024;
        int v113 = 105;
        __int16 v114 = 2114;
        v115 = v44;
        _os_log_impl(&dword_2227A9000, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type: %{public}@", buf, 0x2Cu);
      }

      dispatch_get_specific(*v57);
      uint64_t v68 = NFLogGetLogger();
      if (v68)
      {
        v69 = (void (*)(uint64_t, const char *, ...))v68;
        v70 = object_getClass(v1);
        BOOL v71 = class_isMetaClass(v70);
        v95 = object_getClassName(v1);
        v99 = sel_getName(sel_persistentStoreCoordinator);
        uint64_t v72 = 45;
        if (v71) {
          uint64_t v72 = 43;
        }
        v57 = (const void **)MEMORY[0x263F8C6C0];
        v69(3, "%c[%{public}s %{public}s]:%i Deleting old DB at %{public}@", v72, v95, v99, 108, v19);
      }
      dispatch_get_specific(*v57);
      v73 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v74 = object_getClass(v1);
        if (class_isMetaClass(v74)) {
          int v75 = 43;
        }
        else {
          int v75 = 45;
        }
        v76 = object_getClassName(v1);
        v77 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        int v107 = v75;
        v57 = (const void **)MEMORY[0x263F8C6C0];
        __int16 v108 = 2082;
        v109 = v76;
        __int16 v110 = 2082;
        v111 = v77;
        __int16 v112 = 1024;
        int v113 = 108;
        __int16 v114 = 2114;
        v115 = v19;
        _os_log_impl(&dword_2227A9000, v73, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Deleting old DB at %{public}@", buf, 0x2Cu);
      }

      v78 = [MEMORY[0x263F08850] defaultManager];
      [v78 removeItemAtURL:v19 error:0];

      id v79 = v1[3];
      v101 = v44;
      v80 = [v79 addPersistentStoreWithType:v42 configuration:0 URL:v19 options:v35 error:&v101];
      uint64_t v9 = v101;

      if (v80) {
        goto LABEL_50;
      }
      dispatch_get_specific(*v57);
      uint64_t v84 = NFLogGetLogger();
      if (v84)
      {
        v85 = (void (*)(uint64_t, const char *, ...))v84;
        v86 = object_getClass(v1);
        BOOL v87 = class_isMetaClass(v86);
        v96 = object_getClassName(v1);
        v100 = sel_getName(sel_persistentStoreCoordinator);
        uint64_t v88 = 45;
        if (v87) {
          uint64_t v88 = 43;
        }
        v85(3, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type after removing: %{public}@", v88, v96, v100, 116, v9);
      }
      dispatch_get_specific(*v57);
      v89 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        v90 = object_getClass(v1);
        if (class_isMetaClass(v90)) {
          int v91 = 43;
        }
        else {
          int v91 = 45;
        }
        v92 = object_getClassName(v1);
        v93 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        int v107 = v91;
        __int16 v108 = 2082;
        v109 = v92;
        __int16 v110 = 2082;
        v111 = v93;
        __int16 v112 = 1024;
        int v113 = 116;
        __int16 v114 = 2114;
        v115 = v9;
        _os_log_impl(&dword_2227A9000, v89, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type after removing: %{public}@", buf, 0x2Cu);
      }
    }
    else
    {
      v45 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v46 = NFLogGetLogger();
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(v1);
        BOOL v49 = class_isMetaClass(v48);
        v50 = object_getClassName(v1);
        v97 = sel_getName(sel_persistentStoreCoordinator);
        uint64_t v51 = 45;
        if (v49) {
          uint64_t v51 = 43;
        }
        v47(3, "%c[%{public}s %{public}s]:%i Failed to load model", v51, v50, v97, 95);
      }
      dispatch_get_specific(*v45);
      v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = object_getClass(v1);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        v55 = object_getClassName(v1);
        v56 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67109890;
        int v107 = v54;
        __int16 v108 = 2082;
        v109 = v55;
        __int16 v110 = 2082;
        v111 = v56;
        __int16 v112 = 1024;
        int v113 = 95;
        _os_log_impl(&dword_2227A9000, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to load model", buf, 0x22u);
      }

      uint64_t v9 = 0;
    }
    id v4 = 0;
LABEL_51:

    goto LABEL_52;
  }
LABEL_55:

  return v1;
}

- (id)homePath
{
  uid_t v0 = geteuid();
  if (!v0) {
    uid_t v0 = getuid();
  }
  id v1 = getpwuid(v0);
  if (v1) {
    id v1 = (passwd *)[[NSString alloc] initWithUTF8String:v1->pw_dir];
  }
  id v2 = [(passwd *)v1 stringByAppendingPathComponent:@"/Library/NFStorage/"];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);

  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end