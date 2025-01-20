@interface UMLManager
+ (id)sharedManager;
- (BOOL)addNewUser:(id)a3 toUserManifest:(id)a4 saveToPath:(id)a5;
- (BOOL)createPrimaryUserLayoutWithOnUserVolumePath:(id)a3 fromSystemVolumePath:(id)a4 withError:(id *)a5;
- (BOOL)createUserLayoutForUserwithUserID:(int)a3 withAKSSetup:(BOOL)a4 onUserVolumePath:(id)a5 fromSystemVolumePath:(id)a6 withError:(id *)a7;
- (BOOL)removeAnUser:(id)a3 fromUserManifest:(id)a4 saveToPath:(id)a5;
- (BOOL)saveManifest:(id)a3 toPath:(id)a4;
- (BOOL)updatePrimaryUser:(id)a3 onSharedDataVolumePath:(id)a4 withDiskNode:(id)a5 withVolumeuuid:(id)a6 withVolumeName:(id)a7 withError:(id *)a8;
- (BOOL)updateUser:(id)a3 inManifest:(id)a4 withDiskNode:(id)a5 volumeUUID:(id)a6 volumeName:(id)a7 withSharedDataVolumePath:(id)a8 withError:(id *)a9;
- (id)createPrimaryUserOnSharedDataVolumePath:(id)a3 withError:(id *)a4;
- (id)loadManifestFromSharedDataVolumePath:(id)a3;
- (id)readUserManifestOnSharedDataVolumePath:(id)a3 withError:(id *)a4;
@end

@implementation UMLManager

+ (id)sharedManager
{
  if (qword_26A8C3860 != -1) {
    dispatch_once(&qword_26A8C3860, &unk_270CAA028);
  }
  v2 = (void *)qword_26A8C3858;
  return v2;
}

- (id)createPrimaryUserOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [NSNumber numberWithInt:501];
  [v6 setValue:v7 forKey:@"MKBUserSessionID"];

  v8 = [NSNumber numberWithInt:501];
  [v6 setValue:v8 forKey:@"MKBUserSessionGroupID"];

  [v6 setValue:@"UserSessionOther" forKey:@"MKBUserTypeKey"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionShortName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionFirstName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionLastName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionDisplayName"];
  [v6 setValue:@"en_US" forKey:@"MKBUserSessionLanguage"];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  [v6 setValue:v10 forKey:@"MKBUserSessionUUID"];

  v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v11 UUIDString];
  [v6 setValue:v12 forKey:@"MKBUserSessionAlternateUUID"];

  v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:1.0];
  v14 = [v13 description];
  [v6 setValue:v14 forKey:@"MKBUserSessionCreateTimeStamp"];

  v15 = [v13 description];
  [v6 setValue:v15 forKey:@"MKBUserSessionLoginTimeStamp"];

  v16 = [NSNumber numberWithBool:0];
  [v6 setValue:v16 forKey:@"MKBUserSessionLoginUser"];

  v17 = [NSNumber numberWithBool:0];
  [v6 setValue:v17 forKey:@"MKBUserSessionDirty"];

  v18 = [NSNumber numberWithBool:1];
  [v6 setValue:v18 forKey:@"MKBUserSessionForeground"];

  v19 = [NSNumber numberWithBool:1];
  [v6 setValue:v19 forKey:@"MKBUserSessionisPrimary"];

  v20 = [NSNumber numberWithBool:1];
  [v6 setValue:v20 forKey:@"MKBUserSessionisAdminKey"];

  [v6 setValue:@"/var/mobile" forKey:@"MKBUserSessionLibinfoHomeDir"];
  uint64_t v21 = +[UMLUser userFromManifestDictionary:v6];
  if (v21)
  {
    v22 = v21;
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    v23 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = v13;
      v25 = v11;
      id v26 = v5;
      uint64_t v56 = 0;
      unsigned int v27 = sub_2608CE99C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        unsigned int v28 = v27;
      }
      else {
        unsigned int v28 = v27 & 0xFFFFFFFE;
      }
      if (v28)
      {
        __int16 v55 = 0;
        LODWORD(v53) = 2;
        v52 = &v55;
        uint64_t v29 = _os_log_send_and_compose_impl();
        v30 = (void *)v29;
        if (v29) {
          sub_2608CE9C4(v29);
        }
      }
      else
      {
        v30 = 0;
      }
      free(v30);
      id v5 = v26;
      v11 = v25;
      v13 = v24;
    }

    v36 = [v22 userManifestDictionary];
    if (v36)
    {
      if (self) {
        manifest = self->_manifest;
      }
      else {
        manifest = 0;
      }
      if (-[UMLManager addNewUser:toUserManifest:saveToPath:](self, "addNewUser:toUserManifest:saveToPath:", v6, manifest, v5, v52, v53))
      {
        if (qword_26A8C3870 != -1) {
          dispatch_once(&qword_26A8C3870, &unk_270CAA048);
        }
        v38 = (id)qword_26A8C3868;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v56 = 0;
          unsigned int v39 = sub_2608CE99C();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            unsigned int v40 = v39;
          }
          else {
            unsigned int v40 = v39 & 0xFFFFFFFE;
          }
          if (v40)
          {
            __int16 v55 = 0;
            uint64_t v41 = _os_log_send_and_compose_impl();
            v42 = (void *)v41;
            if (v41) {
              sub_2608CE9C4(v41);
            }
          }
          else
          {
            v42 = 0;
          }
          free(v42);
        }
LABEL_58:

        goto LABEL_62;
      }
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      v43 = (id)qword_26A8C3868;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        if (a4)
        {
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:0];
        }
        v38 = v22;
        v22 = 0;
        goto LABEL_58;
      }
      id v44 = v5;
      uint64_t v56 = 0;
      unsigned int v47 = sub_2608CE99C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        unsigned int v48 = v47;
      }
      else {
        unsigned int v48 = v47 & 0xFFFFFFFE;
      }
      if (v48)
      {
        __int16 v55 = 0;
LABEL_51:
        uint64_t v49 = _os_log_send_and_compose_impl();
        v50 = (void *)v49;
        if (v49) {
          sub_2608CE9C4(v49);
        }
        goto LABEL_54;
      }
    }
    else
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      v43 = (id)qword_26A8C3868;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      id v44 = v5;
      uint64_t v56 = 0;
      unsigned int v45 = sub_2608CE99C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        unsigned int v46 = v45;
      }
      else {
        unsigned int v46 = v45 & 0xFFFFFFFE;
      }
      if (v46)
      {
        __int16 v55 = 0;
        goto LABEL_51;
      }
    }
    v50 = 0;
LABEL_54:
    free(v50);
    id v5 = v44;
    goto LABEL_55;
  }
  if (qword_26A8C3870 != -1) {
    dispatch_once(&qword_26A8C3870, &unk_270CAA048);
  }
  v31 = (id)qword_26A8C3868;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    uint64_t v56 = 0;
    unsigned int v32 = sub_2608CE99C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      unsigned int v33 = v32;
    }
    else {
      unsigned int v33 = v32 & 0xFFFFFFFE;
    }
    if (v33)
    {
      __int16 v55 = 0;
      uint64_t v34 = _os_log_send_and_compose_impl();
      v35 = (void *)v34;
      if (v34) {
        sub_2608CE9C4(v34);
      }
    }
    else
    {
      v35 = 0;
    }
    free(v35);
  }

  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

  return v22;
}

- (BOOL)updatePrimaryUser:(id)a3 onSharedDataVolumePath:(id)a4 withDiskNode:(id)a5 withVolumeuuid:(id)a6 withVolumeName:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14 && v16 && v17)
  {
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    v19 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v20 = sub_2608CE99C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = v20 & 0xFFFFFFFE;
      }
      if (v21)
      {
        LODWORD(v31) = 2;
        uint64_t v22 = _os_log_send_and_compose_impl();
        v23 = (void *)v22;
        if (v22) {
          sub_2608CE9C4(v22);
        }
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }

    if (self) {
      manifest = self->_manifest;
    }
    else {
      manifest = 0;
    }
    LOBYTE(a8) = -[UMLManager updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:](self, "updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:", v14, manifest, v16, v17, v18, v15, a8, v31);
  }
  else
  {
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    v24 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      unsigned int v25 = sub_2608CE99C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        unsigned int v26 = v25;
      }
      else {
        unsigned int v26 = v25 & 0xFFFFFFFE;
      }
      if (v26)
      {
        uint64_t v27 = _os_log_send_and_compose_impl();
        unsigned int v28 = (void *)v27;
        if (v27) {
          sub_2608CE9C4(v27);
        }
      }
      else
      {
        unsigned int v28 = 0;
      }
      free(v28);
    }

    if (a8)
    {
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];

      LOBYTE(a8) = 0;
      id v14 = 0;
    }
  }

  return (char)a8;
}

- (BOOL)createPrimaryUserLayoutWithOnUserVolumePath:(id)a3 fromSystemVolumePath:(id)a4 withError:(id *)a5
{
  return [(UMLManager *)self createUserLayoutForUserwithUserID:501 withAKSSetup:1 onUserVolumePath:a3 fromSystemVolumePath:a4 withError:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_se, 0);
}

- (BOOL)createUserLayoutForUserwithUserID:(int)a3 withAKSSetup:(BOOL)a4 onUserVolumePath:(id)a5 fromSystemVolumePath:(id)a6 withError:(id *)a7
{
  BOOL v9 = a4;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v11 && v12)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@/System/Library/Templates/User/", v12];
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    id v15 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v66 = 0;
      unsigned int v16 = sub_2608CE99C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        *(_DWORD *)v63 = 138412546;
        *(void *)&v63[4] = v14;
        __int16 v64 = 2112;
        id v65 = v11;
        uint64_t v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18) {
          sub_2608CE9C4(v18);
        }
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (self) {
      se = self->_se;
    }
    else {
      se = 0;
    }
    uint64_t v27 = se;
    unsigned int v28 = sub_2608CA9F0((uint64_t)v27);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_2608CFF04;
    v61[3] = &unk_265565E80;
    int v62 = a3;
    v61[4] = self;
    uint64_t v29 = (void *)v14;
    char v30 = [v28 clonePath:v14 toPath:v11 error:a7 handler:v61];

    if (v30)
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v31 = v29;
      unsigned int v32 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v66 = 0;
        unsigned int v33 = sub_2608CE99C();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          *(_DWORD *)v63 = 138543618;
          *(void *)&v63[4] = v29;
          __int16 v64 = 2114;
          id v65 = v11;
          uint64_t v35 = _os_log_send_and_compose_impl();
          v36 = (void *)v35;
          if (v35) {
            sub_2608CE9C4(v35);
          }
        }
        else
        {
          v36 = 0;
        }
        free(v36);
      }

      if (!v9)
      {
        if (qword_26A8C3870 != -1) {
          dispatch_once(&qword_26A8C3870, &unk_270CAA048);
        }
        v37 = (id)qword_26A8C3868;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_99;
        }
        *(void *)v63 = 0;
        unsigned int v47 = sub_2608CE99C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          unsigned int v48 = v47;
        }
        else {
          unsigned int v48 = v47 & 0xFFFFFFFE;
        }
        if (v48)
        {
          LOWORD(v66) = 0;
          goto LABEL_86;
        }
LABEL_97:
        uint64_t v56 = 0;
LABEL_98:
        free(v56);
LABEL_99:
        BOOL v25 = 1;
        goto LABEL_100;
      }
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      v42 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(void *)v63 = 0;
        unsigned int v43 = sub_2608CE99C();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          unsigned int v44 = v43;
        }
        else {
          unsigned int v44 = v43 & 0xFFFFFFFE;
        }
        if (v44)
        {
          LODWORD(v66) = 67109120;
          HIDWORD(v66) = a3;
          uint64_t v45 = _os_log_send_and_compose_impl();
          unsigned int v46 = (void *)v45;
          if (v45) {
            sub_2608CE9C4(v45);
          }
        }
        else
        {
          unsigned int v46 = 0;
        }
        free(v46);
      }

      if (self) {
        uint64_t v49 = self->_se;
      }
      else {
        uint64_t v49 = 0;
      }
      v50 = v49;
      v51 = sub_2608CA9D4((uint64_t)v50);
      char v52 = [v51 bootstrapVolumeWithMountPoint:v11 user:a3 error:a7];

      if (v52)
      {
        if (qword_26A8C3870 != -1) {
          dispatch_once(&qword_26A8C3870, &unk_270CAA048);
        }
        v37 = (id)qword_26A8C3868;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_99;
        }
        *(void *)v63 = 0;
        unsigned int v53 = sub_2608CE99C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          unsigned int v54 = v53;
        }
        else {
          unsigned int v54 = v53 & 0xFFFFFFFE;
        }
        if (v54)
        {
          LOWORD(v66) = 0;
LABEL_86:
          uint64_t v55 = _os_log_send_and_compose_impl();
          uint64_t v56 = (void *)v55;
          if (v55) {
            sub_2608CE9C4(v55);
          }
          goto LABEL_98;
        }
        goto LABEL_97;
      }
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      v37 = (id)qword_26A8C3868;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      *(void *)v63 = 0;
      unsigned int v57 = sub_2608CE99C();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        unsigned int v58 = v57;
      }
      else {
        unsigned int v58 = v57 & 0xFFFFFFFE;
      }
      if (!v58)
      {
        uint64_t v41 = 0;
        goto LABEL_71;
      }
      LOWORD(v66) = 0;
      uint64_t v40 = _os_log_send_and_compose_impl();
      uint64_t v41 = (void *)v40;
      if (v40) {
        goto LABEL_96;
      }
    }
    else
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v31 = v29;
      v37 = (id)qword_26A8C3868;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        BOOL v25 = 0;
LABEL_100:

        goto LABEL_101;
      }
      uint64_t v66 = 0;
      unsigned int v38 = sub_2608CE99C();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        *(_DWORD *)v63 = 138543618;
        *(void *)&v63[4] = v29;
        __int16 v64 = 2114;
        id v65 = v11;
        uint64_t v40 = _os_log_send_and_compose_impl();
        uint64_t v41 = (void *)v40;
        if (v40) {
LABEL_96:
        }
          sub_2608CE9C4(v40);
      }
      else
      {
        uint64_t v41 = 0;
      }
    }
LABEL_71:
    free(v41);
LABEL_72:
    BOOL v25 = 0;
    goto LABEL_100;
  }
  if (qword_26A8C3870 != -1) {
    dispatch_once(&qword_26A8C3870, &unk_270CAA048);
  }
  unsigned int v20 = (id)qword_26A8C3868;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(void *)v63 = 0;
    unsigned int v21 = sub_2608CE99C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v21 & 0xFFFFFFFE;
    }
    if (v22)
    {
      LOWORD(v66) = 0;
      uint64_t v23 = _os_log_send_and_compose_impl();
      v24 = (void *)v23;
      if (v23) {
        sub_2608CE9C4(v23);
      }
    }
    else
    {
      v24 = 0;
    }
    free(v24);
  }

  if (a7)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    BOOL v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_101:

  return v25;
}

- (id)readUserManifestOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  uint64_t v5 = [(UMLManager *)self loadManifestFromSharedDataVolumePath:a3];
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:0];
  }
  return v6;
}

- (id)loadManifestFromSharedDataVolumePath:(id)a3
{
  if (!a3)
  {
    id v11 = 0;
    goto LABEL_31;
  }
  v4 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:");
  [v4 appendString:@"/keybags/usersession.kb"];
  if (self) {
    se = self->_se;
  }
  else {
    se = 0;
  }
  v6 = se;
  v7 = sub_2608CA9F0((uint64_t)v6);
  id v20 = 0;
  v8 = [v7 dataWithContentsOfFile:v4 error:&v20];
  id v9 = v20;

  if (!v8)
  {
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    id v12 = (id)qword_26A8C3868;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    unsigned int v13 = sub_2608CE99C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      unsigned int v14 = v13;
    }
    else {
      unsigned int v14 = v13 & 0xFFFFFFFE;
    }
    if (v14)
    {
LABEL_25:
      uint64_t v17 = _os_log_send_and_compose_impl();
      uint64_t v18 = (void *)v17;
      if (v17) {
        sub_2608CE9C4(v17);
      }
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v18 = 0;
LABEL_28:
    free(v18);
LABEL_29:

    id v11 = 0;
    goto LABEL_30;
  }
  v10 = +[UMLUserManifest manifestFromData:v8];
  sub_2608CA9FC((uint64_t)self, v10);

  if (!self || !self->_manifest)
  {
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    id v12 = (id)qword_26A8C3868;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    unsigned int v15 = sub_2608CE99C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = v15 & 0xFFFFFFFE;
    }
    if (v16) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  id v11 = self->_manifest;
LABEL_30:

LABEL_31:
  return v11;
}

- (BOOL)addNewUser:(id)a3 toUserManifest:(id)a4 saveToPath:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = [v9 users];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v37 = v10;
      unsigned int v38 = v9;
      int v14 = 0;
      char v15 = 0;
      uint64_t v16 = *(void *)v42;
      do
      {
        uint64_t v17 = 0;
        uint64_t v18 = v14;
        do
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v11);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v17), "objectForKeyedSubscript:", @"MKBUserSessionID", v35, v36);
          id v20 = [v8 objectForKeyedSubscript:@"MKBUserSessionID"];

          if (v19 == v20)
          {
            if (qword_26A8C3870 != -1) {
              dispatch_once(&qword_26A8C3870, &unk_270CAA048);
            }
            unsigned int v21 = (id)qword_26A8C3868;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v40 = 0;
              unsigned int v22 = sub_2608CE99C();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
                unsigned int v23 = v22;
              }
              else {
                unsigned int v23 = v22 & 0xFFFFFFFE;
              }
              if (v23)
              {
                __int16 v39 = 0;
                LODWORD(v36) = 2;
                uint64_t v35 = &v39;
                uint64_t v24 = _os_log_send_and_compose_impl();
                BOOL v25 = (void *)v24;
                if (v24) {
                  sub_2608CE9C4(v24);
                }
              }
              else
              {
                BOOL v25 = 0;
              }
              free(v25);
            }

            unsigned int v26 = [v38 users];
            [v26 replaceObjectAtIndex:v18 + v17 withObject:v8];

            char v15 = 1;
          }
          ++v17;
        }
        while (v13 != v17);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
        int v14 = v18 + v17;
      }
      while (v13);

      id v9 = v38;
      id v10 = v37;
      if (v15) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    unsigned int v28 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = 0;
      unsigned int v29 = sub_2608CE99C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
        unsigned int v30 = v29;
      }
      else {
        unsigned int v30 = v29 & 0xFFFFFFFE;
      }
      if (v30)
      {
        __int16 v39 = 0;
        LODWORD(v36) = 2;
        uint64_t v35 = &v39;
        uint64_t v31 = _os_log_send_and_compose_impl();
        unsigned int v32 = (void *)v31;
        if (v31) {
          sub_2608CE9C4(v31);
        }
      }
      else
      {
        unsigned int v32 = 0;
      }
      free(v32);
    }

    unsigned int v33 = [v9 users];
    [v33 addObject:v8];

LABEL_38:
    BOOL v27 = -[UMLManager saveManifest:toPath:](self, "saveManifest:toPath:", v9, v10, v35, v36);
    goto LABEL_39;
  }
  BOOL v27 = 0;
LABEL_39:

  return v27;
}

- (BOOL)removeAnUser:(id)a3 fromUserManifest:(id)a4 saveToPath:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 userManifestDictionary], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = (void *)v11;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v13 = [v9 users];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v24 = self;
      id v25 = v10;
      unsigned int v26 = v9;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v19 = [v18 objectForKeyedSubscript:@"MKBUserSessionID"];
          id v20 = [v12 objectForKeyedSubscript:@"MKBUserSessionID"];

          if (v19 == v20)
          {
            id v9 = v26;
            unsigned int v22 = [v26 users];
            [v22 removeObject:v18];

            id v10 = v25;
            BOOL v21 = [(UMLManager *)v24 saveManifest:v26 toPath:v25];
            goto LABEL_15;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      BOOL v21 = 0;
      id v10 = v25;
      id v9 = v26;
    }
    else
    {
      BOOL v21 = 0;
    }
LABEL_15:
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)updateUser:(id)a3 inManifest:(id)a4 withDiskNode:(id)a5 volumeUUID:(id)a6 volumeName:(id)a7 withSharedDataVolumePath:(id)a8 withError:(id *)a9
{
  uint64_t v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = [v14 userManifestDictionary];
  id v20 = v19;
  if (v19)
  {
    [v19 setValue:v16 forKey:@"MKBUserSessionVolumeDeviceNode"];
    [v20 setValue:v17 forKey:@"MKBUserSessionVolumeUUID"];
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    BOOL v21 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = v18;
      uint64_t v51 = 0;
      unsigned int v23 = sub_2608CE99C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        unsigned int v24 = v23;
      }
      else {
        unsigned int v24 = v23 & 0xFFFFFFFE;
      }
      if (v24)
      {
        __int16 v50 = 0;
        LODWORD(v49) = 2;
        unsigned int v48 = &v50;
        uint64_t v25 = _os_log_send_and_compose_impl();
        unsigned int v26 = (void *)v25;
        if (v25) {
          sub_2608CE9C4(v25);
        }
      }
      else
      {
        unsigned int v26 = 0;
      }
      free(v26);
      id v18 = v22;
    }

    if ([(UMLManager *)self addNewUser:v20 toUserManifest:v15 saveToPath:v18])
    {
      [v14 setDiskNode:v16];
      [v14 setVolumeUUID:v17];
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v32 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = 0;
        unsigned int v33 = sub_2608CE99C();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          __int16 v50 = 0;
          uint64_t v35 = _os_log_send_and_compose_impl();
          uint64_t v36 = (void *)v35;
          if (v35) {
            sub_2608CE9C4(v35);
          }
        }
        else
        {
          uint64_t v36 = 0;
        }
        free(v36);
      }
      BOOL v46 = 1;
      goto LABEL_53;
    }
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    id v37 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = 0;
      unsigned int v38 = sub_2608CE99C();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        __int16 v50 = 0;
        LODWORD(v49) = 2;
        unsigned int v48 = &v50;
        uint64_t v40 = _os_log_send_and_compose_impl();
        long long v41 = (void *)v40;
        if (v40) {
          sub_2608CE9C4(v40);
        }
      }
      else
      {
        long long v41 = 0;
      }
      free(v41);
    }

    long long v42 = a9;
    if (a9)
    {
      long long v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08438];
      uint64_t v45 = 5;
      goto LABEL_52;
    }
LABEL_54:
    BOOL v46 = 0;
    goto LABEL_55;
  }
  if (qword_26A8C3870 != -1) {
    dispatch_once(&qword_26A8C3870, &unk_270CAA048);
  }
  long long v27 = (id)qword_26A8C3868;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = 0;
    unsigned int v28 = sub_2608CE99C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = v28 & 0xFFFFFFFE;
    }
    if (v29)
    {
      __int16 v50 = 0;
      LODWORD(v49) = 2;
      unsigned int v48 = &v50;
      uint64_t v30 = _os_log_send_and_compose_impl();
      uint64_t v31 = (void *)v30;
      if (v30) {
        sub_2608CE9C4(v30);
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
    free(v31);
  }

  long long v42 = a9;
  if (!a9) {
    goto LABEL_54;
  }
  long long v43 = (void *)MEMORY[0x263F087E8];
  uint64_t v44 = *MEMORY[0x263F08438];
  uint64_t v45 = 22;
LABEL_52:
  objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, v45, 0, v48, v49);
  BOOL v46 = 0;
  id *v42 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = v14;
  uint64_t v14 = 0;
LABEL_53:

LABEL_55:
  return v46;
}

- (BOOL)saveManifest:(id)a3 toPath:(id)a4
{
  v61[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [MEMORY[0x263F089D8] stringWithString:v7];
    id v9 = [MEMORY[0x263F089D8] stringWithString:v7];
    [v8 appendString:@"/keybags/usersession.kb"];
    [v9 appendString:@"/keybags"];
    if (self) {
      se = self->_se;
    }
    else {
      se = 0;
    }
    uint64_t v11 = sub_2608CA9F0((uint64_t)se);
    char v12 = [v11 fileExistsAtPath:v9 isDirectory:0];

    if ((v12 & 1) == 0)
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v13 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0;
        unsigned int v14 = sub_2608CE99C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          unsigned int v57 = &v59;
          uint64_t v16 = _os_log_send_and_compose_impl();
          id v17 = (void *)v16;
          if (v16) {
            sub_2608CE9C4(v16);
          }
        }
        else
        {
          id v17 = 0;
        }
        free(v17);
      }

      if (self) {
        v19 = self->_se;
      }
      else {
        v19 = 0;
      }
      id v20 = sub_2608CA9F0((uint64_t)v19);
      char v21 = [v20 makePath:v9 mode:448 error:0];

      if ((v21 & 1) == 0)
      {
        if (qword_26A8C3870 != -1) {
          dispatch_once(&qword_26A8C3870, &unk_270CAA048);
        }
        long long v27 = (id)qword_26A8C3868;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v61[0] = 0;
          unsigned int v28 = sub_2608CE99C();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            unsigned int v29 = v28;
          }
          else {
            unsigned int v29 = v28 & 0xFFFFFFFE;
          }
          if (v29)
          {
            LOWORD(v59) = 0;
            uint64_t v30 = _os_log_send_and_compose_impl();
            uint64_t v31 = (void *)v30;
            if (v30) {
              sub_2608CE9C4(v30);
            }
          }
          else
          {
            uint64_t v31 = 0;
          }
          free(v31);
        }
        BOOL v18 = 0;
        goto LABEL_96;
      }
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      id v22 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v61[0] = 0;
        unsigned int v23 = sub_2608CE99C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = v23 & 0xFFFFFFFE;
        }
        if (v24)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          unsigned int v57 = &v59;
          uint64_t v25 = _os_log_send_and_compose_impl();
          unsigned int v26 = (void *)v25;
          if (v25) {
            sub_2608CE9C4(v25);
          }
        }
        else
        {
          unsigned int v26 = 0;
        }
        free(v26);
      }
    }
    long long v27 = objc_msgSend(v6, "dataValue", v57, v58);
    if (v27)
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v32 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0;
        unsigned int v33 = sub_2608CE99C();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          LOWORD(v59) = 0;
          uint64_t v35 = _os_log_send_and_compose_impl();
          uint64_t v36 = (void *)v35;
          if (v35) {
            sub_2608CE9C4(v35);
          }
        }
        else
        {
          uint64_t v36 = 0;
        }
        free(v36);
      }

      if (self) {
        long long v42 = self->_se;
      }
      else {
        long long v42 = 0;
      }
      long long v43 = v42;
      uint64_t v44 = sub_2608CA9F0((uint64_t)v43);
      id v60 = 0;
      int v45 = [v44 atomicallyWriteData:v27 toPath:v8 error:&v60];
      id v37 = v60;

      if (v45)
      {
        if (qword_26A8C3870 != -1) {
          dispatch_once(&qword_26A8C3870, &unk_270CAA048);
        }
        BOOL v46 = (id)qword_26A8C3868;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v61[0] = 0;
          unsigned int v47 = sub_2608CE99C();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            unsigned int v48 = v47;
          }
          else {
            unsigned int v48 = v47 & 0xFFFFFFFE;
          }
          if (v48)
          {
            LOWORD(v59) = 0;
            uint64_t v49 = _os_log_send_and_compose_impl();
            __int16 v50 = (void *)v49;
            if (v49) {
              sub_2608CE9C4(v49);
            }
          }
          else
          {
            __int16 v50 = 0;
          }
          free(v50);
        }

        BOOL v18 = 1;
        goto LABEL_95;
      }
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      uint64_t v51 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v59 = 0;
        unsigned int v52 = sub_2608CE99C();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          unsigned int v53 = v52;
        }
        else {
          unsigned int v53 = v52 & 0xFFFFFFFE;
        }
        if (v53)
        {
          LODWORD(v61[0]) = 138412290;
          *(void *)((char *)v61 + 4) = v37;
          uint64_t v54 = _os_log_send_and_compose_impl();
          uint64_t v55 = (void *)v54;
          if (v54) {
            sub_2608CE9C4(v54);
          }
        }
        else
        {
          uint64_t v55 = 0;
        }
        free(v55);
      }
    }
    else
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      id v37 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v61[0] = 0;
        unsigned int v38 = sub_2608CE99C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          unsigned int v39 = v38;
        }
        else {
          unsigned int v39 = v38 & 0xFFFFFFFE;
        }
        if (v39)
        {
          LOWORD(v59) = 0;
          uint64_t v40 = _os_log_send_and_compose_impl();
          long long v41 = (void *)v40;
          if (v40) {
            sub_2608CE9C4(v40);
          }
        }
        else
        {
          long long v41 = 0;
        }
        free(v41);
      }
    }
    BOOL v18 = 0;
LABEL_95:

LABEL_96:
    goto LABEL_97;
  }
  BOOL v18 = 0;
LABEL_97:

  return v18;
}

@end