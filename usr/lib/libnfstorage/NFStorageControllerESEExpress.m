@interface NFStorageControllerESEExpress
- (id)_deleteAllESEExpressEntities;
- (id)dbProtectionType;
- (id)fetchESEExpressEntitiesWithError:(id *)a3;
- (id)name;
- (void)deleteAllESEExpressEntities;
- (void)updateESEExpressEntitiesWithConfig:(id)a3;
@end

@implementation NFStorageControllerESEExpress

- (void)updateESEExpressEntitiesWithConfig:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  if (v6)
  {
    v7 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __68__NFStorageControllerESEExpress_updateESEExpressEntitiesWithConfig___block_invoke;
    v19[3] = &unk_2646276F8;
    v19[4] = self;
    SEL v21 = a2;
    id v20 = v5;
    [v7 performBlockAndWait:v19];
  }
  else
  {
    v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v14, ClassName, Name, 152);
    }
    dispatch_get_specific(*v8);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v23 = v17;
      __int16 v24 = 2082;
      v25 = object_getClassName(self);
      __int16 v26 = 2082;
      v27 = sel_getName(a2);
      __int16 v28 = 1024;
      int v29 = 152;
      _os_log_impl(&dword_2227A9000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }
  }
}

- (id)_deleteAllESEExpressEntities
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v4 = +[ExpressESEEntity fetchRequest];
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v4];
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
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", v14, ClassName, Name, 142, v8);
    }
    dispatch_get_specific(*v9);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v25 = v17;
      __int16 v26 = 2082;
      v27 = v18;
      __int16 v28 = 2082;
      int v29 = v19;
      __int16 v30 = 1024;
      int v31 = 142;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_impl(&dword_2227A9000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", buf, 0x2Cu);
    }
  }

  return v8;
}

void __66__NFStorageControllerESEExpress_fetchESEExpressEntitiesWithError___block_invoke(uint64_t a1)
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[ExpressESEEntity fetchRequest];
  v3 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  v119 = (void *)v2;
  id v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v26 = objc_opt_new();
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    if (![v5 count])
    {
      v6 = v5;
      v104 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v106 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v110 = 45;
        if (isMetaClass) {
          uint64_t v110 = 43;
        }
        v106(6, "%c[%{public}s %{public}s]:%i Nothing in DB - return an empty array", v110, ClassName, Name, 66);
      }
      dispatch_get_specific(*v104);
      v15 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      v111 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v111)) {
        int v112 = 43;
      }
      else {
        int v112 = 45;
      }
      v113 = object_getClassName(*(id *)(a1 + 32));
      v114 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      int v135 = v112;
      __int16 v136 = 2082;
      v137 = v113;
      __int16 v138 = 2082;
      v139 = v114;
      __int16 v140 = 1024;
      int v141 = 66;
      SEL v21 = "%c[%{public}s %{public}s]:%i Nothing in DB - return an empty array";
      v22 = v15;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      uint32_t v24 = 34;
      goto LABEL_11;
    }
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v118 = v5;
    int v29 = v5;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v126 objects:v133 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      char v32 = 0;
      uint64_t v33 = *(void *)v127;
      uint64_t v121 = *MEMORY[0x263F07F80];
      uint64_t v122 = *MEMORY[0x263F08320];
      uint64_t v120 = *MEMORY[0x263F08338];
      unint64_t v34 = 0x263F08000uLL;
      uint64_t v123 = *(void *)v127;
      uint64_t v124 = a1;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v127 != v33) {
            objc_enumerationMutation(v29);
          }
          v36 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          if ([v36 version] == 1)
          {
            if ([v36 version] == 1)
            {
              v37 = objc_opt_new();
              v38 = [v36 passID];
              [v37 setObject:v38 forKeyedSubscript:@"passUniqueID"];

              v39 = [v36 aid];
              [v37 setObject:v39 forKeyedSubscript:@"appletIdentifier"];

              v40 = [v36 keyID];

              if (v40)
              {
                v41 = [v36 keyID];
                [v37 setObject:v41 forKeyedSubscript:@"keyIdentifier"];
              }
              v42 = [*(id *)(v34 + 2584) numberWithBool:[v36 expressEnabled]];
              [v37 setObject:v42 forKeyedSubscript:@"expressEnabled"];

              v43 = [*(id *)(v34 + 2584) numberWithBool:[v36 inSessionOnly]];
              [v37 setObject:v43 forKeyedSubscript:@"inSessionOnly"];

              v44 = [*(id *)(v34 + 2584) numberWithBool:[v36 uwbExpressEnabled]];
              [v37 setObject:v44 forKeyedSubscript:@"UWBExpressEnabled"];

              v45 = [*(id *)(v34 + 2584) numberWithBool:[v36 isUserChoice]];
              [v37 setObject:v45 forKeyedSubscript:@"userChoice"];

              v46 = [v36 type];
              [v37 setObject:v46 forKeyedSubscript:@"ExpressType"];

              v47 = [v36 ecp2Info];

              if (v47)
              {
                v48 = [v36 ecp2Info];
                [v37 setObject:v48 forKeyedSubscript:@"ECP2Info"];
              }
              v49 = [v36 readerID];

              if (v49)
              {
                v50 = [v36 readerID];
                [v37 setObject:v50 forKeyedSubscript:@"readerIdentifier"];
              }
              v51 = [v36 moduleID];
              [v37 setObject:v51 forKeyedSubscript:@"moduleIdentifier"];

              v52 = [*(id *)(v34 + 2584) numberWithInt:[v36 groupActivationStyle]];
              [v37 setObject:v52 forKeyedSubscript:@"groupActivationStyle"];

              v53 = [v36 groupHead];

              if (v53)
              {
                v54 = [v36 groupHead];
                [v37 setObject:v54 forKeyedSubscript:@"groupHead"];
              }
              v55 = [v36 groupMembers];

              if (v55)
              {
                v56 = [v36 groupMembers];
                [v37 setObject:v56 forKeyedSubscript:@"groupMembers"];
              }
              v57 = [v36 aliroGroupResolvingKeys];

              if (v57)
              {
                v58 = [v36 aliroGroupResolvingKeys];
                [v37 setObject:v58 forKeyedSubscript:@"aliroGroupResolvingKeys"];
              }
              v59 = [v36 associatedReaderIdentifiers];

              if (v59)
              {
                v60 = [v36 associatedReaderIdentifiers];
                [v37 setObject:v60 forKeyedSubscript:@"associatedReaderIdentifiers"];
              }
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v37];
            }
            else
            {
              v61 = v29;
              dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
              uint64_t v62 = NFLogGetLogger();
              if (v62)
              {
                v63 = (void (*)(uint64_t, const char *, ...))v62;
                v64 = object_getClass(*(id *)(a1 + 32));
                BOOL v65 = class_isMetaClass(v64);
                v66 = object_getClassName(*(id *)(a1 + 32));
                v67 = sel_getName(*(SEL *)(a1 + 56));
                uint64_t v117 = [v36 version];
                v115 = v67;
                a1 = v124;
                uint64_t v68 = 45;
                if (v65) {
                  uint64_t v68 = 43;
                }
                v63(3, "%c[%{public}s %{public}s]:%i Unknown version info %d", v68, v66, v115, 101, v117);
              }
              uint64_t v69 = v31;
              dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
              v70 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                v71 = object_getClass(*(id *)(a1 + 32));
                if (class_isMetaClass(v71)) {
                  int v72 = 43;
                }
                else {
                  int v72 = 45;
                }
                v73 = object_getClassName(*(id *)(a1 + 32));
                v74 = sel_getName(*(SEL *)(a1 + 56));
                int v75 = [v36 version];
                *(_DWORD *)buf = 67110146;
                int v135 = v72;
                __int16 v136 = 2082;
                v137 = v73;
                __int16 v138 = 2082;
                v139 = v74;
                __int16 v140 = 1024;
                int v141 = 101;
                __int16 v142 = 1024;
                LODWORD(v143) = v75;
                _os_log_impl(&dword_2227A9000, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown version info %d", buf, 0x28u);
              }

              id v76 = objc_alloc(MEMORY[0x263F087E8]);
              v77 = [NSString stringWithUTF8String:"nfcd"];
              v131[0] = v122;
              v78 = [NSString stringWithUTF8String:"Decoding Error"];
              v132[0] = v78;
              v132[1] = &unk_26D4E9460;
              v131[1] = @"Line";
              v131[2] = @"Method";
              v79 = [NSString initWithFormat:@"%s", sel_getName(*(SEL *)(a1 + 56))];
              v132[2] = v79;
              v131[3] = v121;
              v80 = [NSString initWithFormat:@"%s:%d", sel_getName(*(SEL *)(v124 + 56)), 102];
              v132[3] = v80;
              v131[4] = v120;
              v81 = (void *)[[NSString alloc] initWithFormat:@"incorrect ESE model version"];
              v132[4] = v81;
              v82 = [NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:5];
              uint64_t v83 = [v76 initWithDomain:v77 code:23 userInfo:v82];
              uint64_t v84 = *(void *)(*(void *)(v124 + 40) + 8);
              v85 = *(void **)(v84 + 40);
              *(void *)(v84 + 40) = v83;

              a1 = v124;
              uint64_t v86 = *(void *)(*(void *)(v124 + 48) + 8);
              v37 = *(void **)(v86 + 40);
              *(void *)(v86 + 40) = 0;
              char v32 = 1;
              int v29 = v61;
              uint64_t v31 = v69;
              uint64_t v33 = v123;
              unint64_t v34 = 0x263F08000;
            }
          }
          else
          {
            char v32 = 1;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v126 objects:v133 count:16];
      }
      while (v31);

      int v25 = v118;
      if ((v32 & 1) == 0) {
        goto LABEL_73;
      }
      v87 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      int v88 = [v87 hasChanges];

      if (!v88) {
        goto LABEL_73;
      }
      id v89 = (id)[*(id *)(a1 + 32) _deleteAllESEExpressEntities];
      v90 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      uint64_t v91 = *(void *)(*(void *)(a1 + 40) + 8);
      id v125 = *(id *)(v91 + 40);
      [v90 save:&v125];
      objc_storeStrong((id *)(v91 + 40), v125);

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        goto LABEL_73;
      }
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v92 = NFLogGetLogger();
      if (v92)
      {
        v93 = (void (*)(uint64_t, const char *, ...))v92;
        v94 = object_getClass(*(id *)(a1 + 32));
        BOOL v95 = class_isMetaClass(v94);
        v96 = object_getClassName(*(id *)(a1 + 32));
        v97 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v98 = 45;
        if (v95) {
          uint64_t v98 = 43;
        }
        v93(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v98, v96, v97, 114, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      }
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v99 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v99)) {
          int v100 = 43;
        }
        else {
          int v100 = 45;
        }
        v101 = object_getClassName(*(id *)(a1 + 32));
        v102 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v103 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 67110146;
        int v135 = v100;
        __int16 v136 = 2082;
        v137 = v101;
        __int16 v138 = 2082;
        v139 = v102;
        __int16 v140 = 1024;
        int v141 = 114;
        __int16 v142 = 2114;
        uint64_t v143 = v103;
        _os_log_impl(&dword_2227A9000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", buf, 0x2Cu);
      }
    }
    else
    {
      int v25 = v5;
    }

LABEL_73:
    v15 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    [v15 reset];
    goto LABEL_74;
  }
  v6 = v5;
  id v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v8 = NFLogGetLogger();
  if (v8)
  {
    v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(*(id *)(a1 + 32));
    BOOL v11 = class_isMetaClass(v10);
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v14 = 45;
    if (v11) {
      uint64_t v14 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v14, v12, v13, 59, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v7);
  v15 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
  v16 = object_getClass(*(id *)(a1 + 32));
  if (class_isMetaClass(v16)) {
    int v17 = 43;
  }
  else {
    int v17 = 45;
  }
  v18 = object_getClassName(*(id *)(a1 + 32));
  v19 = sel_getName(*(SEL *)(a1 + 56));
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(_DWORD *)buf = 67110146;
  int v135 = v17;
  __int16 v136 = 2082;
  v137 = v18;
  __int16 v138 = 2082;
  v139 = v19;
  __int16 v140 = 1024;
  int v141 = 59;
  __int16 v142 = 2114;
  uint64_t v143 = v20;
  SEL v21 = "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@";
  v22 = v15;
  os_log_type_t v23 = OS_LOG_TYPE_ERROR;
  uint32_t v24 = 44;
LABEL_11:
  _os_log_impl(&dword_2227A9000, v22, v23, v21, buf, v24);
LABEL_12:
  int v25 = v6;
LABEL_74:
}

- (id)fetchESEExpressEntitiesWithError:(id *)a3
{
  v38[5] = *MEMORY[0x263EF8340];
  v6 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  if (v6)
  {
    *(void *)buf = 0;
    *(void *)v35 = buf;
    *(void *)&v35[8] = 0x3032000000;
    *(void *)&v35[16] = __Block_byref_object_copy__0;
    *(void *)&v35[24] = __Block_byref_object_dispose__0;
    id v36 = 0;
    uint64_t v28 = 0;
    int v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__0;
    char v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    id v7 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __66__NFStorageControllerESEExpress_fetchESEExpressEntitiesWithError___block_invoke;
    v27[3] = &unk_264627680;
    v27[4] = self;
    v27[5] = &v28;
    v27[6] = buf;
    v27[7] = a2;
    [v7 performBlockAndWait:v27];

    if (a3) {
      *a3 = (id) v29[5];
    }
    a3 = (id *)*(id *)(*(void *)v35 + 40);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v14, ClassName, Name, 44);
    }
    dispatch_get_specific(*v8);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v17;
      *(_WORD *)v35 = 2082;
      *(void *)&v35[2] = object_getClassName(self);
      *(_WORD *)&v35[10] = 2082;
      *(void *)&v35[12] = sel_getName(a2);
      *(_WORD *)&v35[20] = 1024;
      *(_DWORD *)&v35[22] = 44;
      _os_log_impl(&dword_2227A9000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }

    if (a3)
    {
      id v18 = objc_alloc(MEMORY[0x263F087E8]);
      v19 = [NSString stringWithUTF8String:"nfcd"];
      v37[0] = *MEMORY[0x263F08320];
      uint64_t v20 = [NSString stringWithUTF8String:"Unknown Error"];
      v38[0] = v20;
      v38[1] = &unk_26D4E9448;
      v37[1] = @"Line";
      v37[2] = @"Method";
      SEL v21 = [NSString alloc][NSString initWithFormat:@"%s", sel_getName(a2)];
      v38[2] = v21;
      v37[3] = *MEMORY[0x263F07F80];
      v22 = [[NSString alloc] initWithFormat:@"%s:%d", sel_getName(a2), 46];
      v38[3] = v22;
      v37[4] = *MEMORY[0x263F08338];
      os_log_type_t v23 = (void *)[[NSString alloc] initWithFormat:@"managedObjectContext is NULL"];
      v38[4] = v23;
      uint32_t v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
      *a3 = (id)[v18 initWithDomain:v19 code:6 userInfo:v24];

      a3 = 0;
    }
  }

  return a3;
}

void __68__NFStorageControllerESEExpress_updateESEExpressEntitiesWithConfig___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _deleteAllESEExpressEntities];
  if (v2)
  {
    id v3 = (id)v2;
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(v1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(v1 + 32));
      Name = sel_getName(*(SEL *)(v1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", v9, ClassName, Name, 163, v3);
    }
    dispatch_get_specific(*v4);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    BOOL v11 = object_getClass(*(id *)(v1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(v1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(v1 + 48));
    *(_DWORD *)buf = 67110146;
    int v73 = v12;
    __int16 v74 = 2082;
    int v75 = v13;
    __int16 v76 = 2082;
    v77 = v14;
    __int16 v78 = 1024;
    int v79 = 163;
    __int16 v80 = 2114;
    id v81 = v3;
    v15 = "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@";
LABEL_11:
    _os_log_impl(&dword_2227A9000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x2Cu);
LABEL_12:

    goto LABEL_46;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v65 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v65)
  {
    uint64_t v63 = v1;
    uint64_t v64 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v68 != v64) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x263EFF240];
        v19 = -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
        uint64_t v20 = [v18 insertNewObjectForEntityForName:@"ExpressESEEntity" inManagedObjectContext:v19];

        SEL v21 = [v17 objectForKeyedSubscript:@"appletIdentifier"];
        [v20 setAid:v21];

        v22 = [v17 objectForKeyedSubscript:@"passUniqueID"];
        [v20 setPassID:v22];

        os_log_type_t v23 = [v17 objectForKeyedSubscript:@"keyIdentifier"];

        if (v23)
        {
          uint32_t v24 = [v17 objectForKeyedSubscript:@"keyIdentifier"];
          [v20 setKeyID:v24];
        }
        int v25 = [v17 objectForKeyedSubscript:@"expressEnabled"];
        [v20 setExpressEnabled:[v25 BOOLValue]];

        uint64_t v26 = [v17 objectForKeyedSubscript:@"ExpressType"];
        [v20 setType:v26];

        uint64_t v27 = [v17 objectForKeyedSubscript:@"inSessionOnly"];
        [v20 setInSessionOnly:[v27 BOOLValue]];

        uint64_t v28 = [v17 objectForKeyedSubscript:@"UWBExpressEnabled"];
        [v20 setUwbExpressEnabled:[v28 BOOLValue]];

        int v29 = [v17 objectForKeyedSubscript:@"userChoice"];
        [v20 setIsUserChoice:[v29 BOOLValue]];

        uint64_t v30 = [v17 objectForKeyedSubscript:@"ECP2Info"];

        if (v30)
        {
          uint64_t v31 = [v17 objectForKeyedSubscript:@"ECP2Info"];
          [v20 setEcp2Info:v31];
        }
        char v32 = [v17 objectForKeyedSubscript:@"readerIdentifier"];

        if (v32)
        {
          id v33 = [v17 objectForKeyedSubscript:@"readerIdentifier"];
          [v20 setReaderID:v33];
        }
        unint64_t v34 = [v17 objectForKeyedSubscript:@"moduleIdentifier"];
        [v20 setModuleID:v34];

        v35 = [v17 objectForKeyedSubscript:@"groupActivationStyle"];
        [v20 setGroupActivationStyle:[v35 intValue]];

        id v36 = [v17 objectForKeyedSubscript:@"groupHead"];

        if (v36)
        {
          v37 = [v17 objectForKeyedSubscript:@"groupHead"];
          [v20 setGroupHead:v37];
        }
        v38 = [v17 objectForKeyedSubscript:@"groupMembers"];

        if (v38)
        {
          v39 = [v17 objectForKeyedSubscript:@"groupMembers"];
          [v20 setGroupMembers:v39];
        }
        v40 = [v17 objectForKeyedSubscript:@"aliroGroupResolvingKeys"];

        if (v40)
        {
          v41 = [v17 objectForKeyedSubscript:@"aliroGroupResolvingKeys"];
          [v20 setAliroGroupResolvingKeys:v41];
        }
        v42 = [v17 objectForKeyedSubscript:@"associatedReaderIdentifiers"];

        if (v42)
        {
          v43 = [v17 objectForKeyedSubscript:@"associatedReaderIdentifiers"];
          [v20 setAssociatedReaderIdentifiers:v43];
        }
        [v20 setVersion:1];

        uint64_t v1 = v63;
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v65);
  }

  v44 = -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  int v45 = [v44 hasChanges];

  if (!v45)
  {
    id v3 = 0;
    goto LABEL_46;
  }
  v46 = -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  id v66 = 0;
  [v46 save:&v66];
  id v3 = v66;

  if (v3)
  {
    v47 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v48 = NFLogGetLogger();
    if (v48)
    {
      v49 = (void (*)(uint64_t, const char *, ...))v48;
      v50 = object_getClass(*(id *)(v1 + 32));
      BOOL v51 = class_isMetaClass(v50);
      v59 = object_getClassName(*(id *)(v1 + 32));
      v61 = sel_getName(*(SEL *)(v1 + 48));
      uint64_t v52 = 45;
      if (v51) {
        uint64_t v52 = 43;
      }
      v49(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v52, v59, v61, 200, v3);
    }
    dispatch_get_specific(*v47);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v53 = object_getClass(*(id *)(v1 + 32));
    if (class_isMetaClass(v53)) {
      int v54 = 43;
    }
    else {
      int v54 = 45;
    }
    v55 = object_getClassName(*(id *)(v1 + 32));
    v56 = sel_getName(*(SEL *)(v1 + 48));
    *(_DWORD *)buf = 67110146;
    int v73 = v54;
    __int16 v74 = 2082;
    int v75 = v55;
    __int16 v76 = 2082;
    v77 = v56;
    __int16 v78 = 1024;
    int v79 = 200;
    __int16 v80 = 2114;
    id v81 = v3;
    v15 = "%c[%{public}s %{public}s]:%i Failed to save: %{public}@";
    goto LABEL_11;
  }
LABEL_46:
  v57 = -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  [v57 reset];
}

- (id)name
{
  return @"Express";
}

- (id)dbProtectionType
{
  return (id)*MEMORY[0x263F08098];
}

- (void)deleteAllESEExpressEntities
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);

  if (v4)
  {
    id v5 = -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__NFStorageControllerESEExpress_deleteAllESEExpressEntities__block_invoke;
    v16[3] = &unk_264627720;
    v16[4] = self;
    v16[5] = a2;
    [v5 performBlockAndWait:v16];
  }
  else
  {
    v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v12, ClassName, Name, 215);
    }
    dispatch_get_specific(*v6);
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
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
      v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 215;
      _os_log_impl(&dword_2227A9000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }
  }
}

void __60__NFStorageControllerESEExpress_deleteAllESEExpressEntities__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _deleteAllESEExpressEntities];
  if (!v2)
  {
    id v3 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    int v4 = [v3 hasChanges];

    if (v4)
    {
      id v5 = -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      id v20 = 0;
      [v5 save:&v20];
      id v2 = v20;

      if (v2)
      {
        v6 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          uint64_t v11 = 45;
          if (isMetaClass) {
            uint64_t v11 = 43;
          }
          v8(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v11, ClassName, Name, 227, v2);
        }
        dispatch_get_specific(*v6);
        uint64_t v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v13)) {
            int v14 = 43;
          }
          else {
            int v14 = 45;
          }
          v15 = object_getClassName(*(id *)(a1 + 32));
          v16 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          int v22 = v14;
          __int16 v23 = 2082;
          int v24 = v15;
          __int16 v25 = 2082;
          uint64_t v26 = v16;
          __int16 v27 = 1024;
          int v28 = 227;
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