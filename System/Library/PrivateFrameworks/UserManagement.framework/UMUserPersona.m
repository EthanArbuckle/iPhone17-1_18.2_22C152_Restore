@interface UMUserPersona
+ (BOOL)currentPersonaMatchesPath:(id)a3;
+ (id)currentPersona;
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
- (BOOL)isDataSeparatedPersona;
- (BOOL)isDefaultPersona;
- (BOOL)isDisabled;
- (BOOL)isEnterprisePersona;
- (BOOL)isEqualToPersona:(id)a3;
- (BOOL)isGuestPersona;
- (BOOL)isPersonalPersona;
- (BOOL)isSystemPersona;
- (NSString)userPersonaNickName;
- (NSString)userPersonaUniqueString;
- (UMUserPersona)init;
- (id)copyCurrentPersonaContextWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createPersonaContextForBackgroundProcessingWithIdentityString:(id)a3;
- (id)createPersonaContextForBackgroundProcessingWithPersonaUniqueString:(id)a3;
- (id)generateAndRestorePersonaContextWithIdentityString:(id)a3;
- (id)generateAndRestorePersonaContextWithPersonaUniqueString:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)restorePersonaWithSavedPersonaContext:(id)a3;
- (unint64_t)userPersonaType;
- (unsigned)gid;
- (unsigned)uid;
- (void)setGid:(unsigned int)a3;
- (void)setIsDataSeparatedPersona:(BOOL)a3;
- (void)setIsDefaultPersona:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsEnterprisePersona:(BOOL)a3;
- (void)setIsGuestPersona:(BOOL)a3;
- (void)setIsPersonalPersona:(BOOL)a3;
- (void)setIsSystemPersona:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUserPersonaNickName:(id)a3;
- (void)setUserPersonaType:(unint64_t)a3;
- (void)setUserPersonaUniqueString:(id)a3;
@end

@implementation UMUserPersona

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (id)restorePersonaWithSavedPersonaContext:(id)a3
{
  if (a3) {
    objc_msgSend_contextAdopt(a3, a2, (uint64_t)a3);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPersonaNickName, 0);
  objc_storeStrong((id *)&self->_userPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->personaName, 0);
}

- (id)generateAndRestorePersonaContextWithPersonaUniqueString:(id)a3
{
  id v4 = a3;
  if (sub_190C3AB20())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, *MEMORY[0x1E4F28798], 45, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = sub_190C39F9C;
    v16 = sub_190C39F54;
    id v17 = 0;
    v7 = sub_190C3AB40();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_190C3A360;
    v9[3] = &unk_1E56C6810;
    id v10 = v4;
    v11 = &v12;
    sub_190C3BBDC((uint64_t)v7, self, v9);

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  return v6;
}

+ (id)currentPersona
{
  v2 = objc_opt_new();
  return v2;
}

- (UMUserPersona)init
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)UMUserPersona;
  v2 = [(UMUserPersona *)&v26 init];
  if (v2)
  {
    char v3 = sub_190C3AB20();
    uint64_t v34 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    memset(v33, 0, sizeof(v33));
    int v27 = 2;
    uint64_t current_persona = voucher_get_current_persona();
    if ((v3 & 1) == 0)
    {
      uint64_t v5 = current_persona;
      if (current_persona != -1)
      {
        if ((kpersona_info() & 0x80000000) == 0)
        {
          int v6 = DWORD1(v28);
          *((_DWORD *)v2 + 6) = HIDWORD(v34);
          *((_DWORD *)v2 + 7) = -101;
          v2[23] = 0;
          switch(v6)
          {
            case 2:
              uint64_t v7 = 2;
              v2[17] = 1;
              *(_DWORD *)(v2 + 18) = 0;
              v2[22] = 1;
              v8 = (void *)*((void *)v2 + 5);
              v9 = @"Enterprise";
              goto LABEL_12;
            case 4:
              uint64_t v7 = 3;
              *(_DWORD *)(v2 + 17) = 0x10000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((void *)v2 + 5);
              v9 = @"System";
              goto LABEL_12;
            case 5:
              *(_WORD *)(v2 + 17) = 256;
              *(_DWORD *)(v2 + 19) = 0;
              v21 = (void *)*((void *)v2 + 5);
              *((void *)v2 + 5) = @"Personal";
              *((void *)v2 + 6) = 0;

              goto LABEL_13;
            case 6:
              uint64_t v7 = 5;
              *(_DWORD *)(v2 + 17) = 0x1000000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((void *)v2 + 5);
              v9 = @"Default";
LABEL_12:
              *((void *)v2 + 5) = v9;
              *((void *)v2 + 6) = v7;

LABEL_13:
              uint64_t v23 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)v33 + 4);
              v20 = (void *)*((void *)v2 + 4);
              *((void *)v2 + 4) = v23;
              break;
            default:
              goto LABEL_8;
          }
          goto LABEL_14;
        }
        id v10 = __error();
        strerror(*v10);
        id v17 = sub_190C3B80C((uint64_t)UMLogMessage, @"Could not get current persona Info for id:%d with error:%s", v11, v12, v13, v14, v15, v16, v5);
        v18 = sub_190C3C3A4();
        sub_190C3B464((uint64_t)v18, v17);
      }
    }
LABEL_8:
    *((void *)v2 + 3) = 0x6400000064;
    v2[23] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    *(_WORD *)(v2 + 21) = 0;
    v19 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = @"Invalid";
    *((void *)v2 + 6) = 1000;

    v20 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = 0;
LABEL_14:

    v24 = v2;
  }

  return (UMUserPersona *)v2;
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (BOOL)isSystemPersona
{
  return self->_isSystemPersona;
}

- (BOOL)isDefaultPersona
{
  return self->_isDefaultPersona;
}

- (id)generateAndRestorePersonaContextWithIdentityString:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_generateAndRestorePersonaContextWithPersonaUniqueString_, a3);
}

- (id)copyCurrentPersonaContextWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return objc_alloc_init(UMUserPersonaContext);
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

+ (BOOL)currentPersonaMatchesPath:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(&v31[1024], 0, 348);
  if (v3)
  {
    if ((sub_190C3AB20() & 1) == 0)
    {
      if (objc_msgSend_getCString_maxLength_encoding_(v3, v4, (uint64_t)v31, 1024, 4))
      {
        uint64_t v5 = realpath_DARWIN_EXTSN(v31, 0);
        if (v5)
        {
          int v6 = v5;
          memset(&v31[1028], 0, 344);
          *(_DWORD *)&v31[1024] = 1;
          uint64_t current_persona = voucher_get_current_persona();
          if (current_persona != -1)
          {
            uint64_t v9 = current_persona;
            if ((kpersona_info() & 0x80000000) != 0)
            {
              int v15 = *__error();
              uint64_t v16 = sub_190C3C3A4();
              strerror(v15);
              sub_190C3B80C((uint64_t)UMLogMessage, @"Could not get current persona Info for id:%d with error:%s", v17, v18, v19, v20, v21, v22, v9);
              uint64_t v13 = LABEL_16:;
              sub_190C3B464((uint64_t)v16, v13);

              LOBYTE(v13) = 0;
              goto LABEL_19;
            }
            if (*(_DWORD *)&v31[1032] == 2)
            {
              if ((kpersona_getpath() & 0x80000000) == 0)
              {
                uint64_t v12 = objc_msgSend_stringWithUTF8String_(NSString, v10, (uint64_t)v30);
                if (v12) {
                  LOBYTE(v13) = objc_msgSend_hasPrefix_(v3, v11, (uint64_t)v12);
                }
                else {
                  LOBYTE(v13) = 0;
                }

                goto LABEL_19;
              }
              int v23 = *__error();
              uint64_t v16 = sub_190C3C3A4();
              strerror(v23);
              sub_190C3B80C((uint64_t)UMLogMessage, @"Could not get persona path for id:%d with error:%s", v24, v25, v26, v27, v28, v29, v9);
              goto LABEL_16;
            }
          }
          LODWORD(v13) = objc_msgSend_hasPrefix_(v3, v8, @"/private/var/PersonaVolumes") ^ 1;
LABEL_19:
          free(v6);
          goto LABEL_12;
        }
      }
    }
  }
  LOBYTE(v13) = 0;
LABEL_12:

  return (char)v13;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (NSString)userPersonaNickName
{
  return self->_userPersonaNickName;
}

- (id)createPersonaContextForBackgroundProcessingWithIdentityString:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, a3);
}

- (id)createPersonaContextForBackgroundProcessingWithPersonaUniqueString:(id)a3
{
  id v3 = a3;
  if (sub_190C3AB20())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v4, *MEMORY[0x1E4F28798], 45, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v26 = 0;
    int v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"setup voucher for background work with account:%@", v7, v8, v9, v10, v11, v12, (uint64_t)v3);
    sub_190C3B464((uint64_t)v6, v13);

    int v14 = mach_voucher_persona_self();
    if (!v14) {
      int v15 = (const char *)HIDWORD(v26);
    }
    uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v15, *MEMORY[0x1E4F285A8], v14, 0);
    uint64_t v17 = sub_190C3C3A4();
    uint64_t v24 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to get existing mach voucher Port with error:%@", v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    sub_190C3B464((uint64_t)v17, v24);

    id v5 = v16;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  sub_190C5E74C((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  sub_190C5E74C((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return MEMORY[0x1F4181798](self, sel_commitChangesWithError_, 0);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  return 0;
}

- (BOOL)isEqualToPersona:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v7 = objc_msgSend_userPersonaType(self, v5, v6);
    if (v7 <= 5 && ((1 << v7) & 0x2D) != 0)
    {
      char v10 = 0;
      BOOL v11 = 1;
    }
    else
    {
      char v10 = 1;
      BOOL v11 = v7 != 1000;
    }
    unint64_t v13 = objc_msgSend_userPersonaType(v4, v8, v9);
    if (v13 <= 5 && ((1 << v13) & 0x2D) != 0)
    {
      if ((v10 & 1) == 0)
      {
        uint64_t v17 = objc_msgSend_userPersonaUniqueString(self, v14, v15);
        uint64_t v20 = objc_msgSend_userPersonaUniqueString(v4, v18, v19);
        char isEqualToString = objc_msgSend_isEqualToString_(v17, v21, (uint64_t)v20);

        goto LABEL_15;
      }
      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = v13 != 1000;
    }
    char isEqualToString = !v11 && !v16;
  }
  else
  {
    char isEqualToString = 0;
  }
LABEL_15:

  return isEqualToString;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (void)setIsSystemPersona:(BOOL)a3
{
  self->_isSystemPersona = a3;
}

- (void)setIsDefaultPersona:(BOOL)a3
{
  self->_isDefaultPersona = a3;
}

- (BOOL)isGuestPersona
{
  return self->_isGuestPersona;
}

- (void)setIsGuestPersona:(BOOL)a3
{
  self->_isGuestPersona = a3;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setUserPersonaUniqueString:(id)a3
{
}

- (void)setUserPersonaNickName:(id)a3
{
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

@end