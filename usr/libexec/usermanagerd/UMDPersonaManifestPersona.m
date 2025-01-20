@interface UMDPersonaManifestPersona
- (BOOL)isEqual:(id)a3;
- (UMDPersonaManifestPersona)init;
- (unint64_t)hash;
@end

@implementation UMDPersonaManifestPersona

- (UMDPersonaManifestPersona)init
{
  v3.receiver = self;
  v3.super_class = (Class)UMDPersonaManifestPersona;
  result = [(UMDPersonaManifestPersona *)&v3 init];
  if (!result) {
    sub_1000B08C8();
  }
  result->_type = 1000;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (UMDPersonaManifestPersona *)a3;
  if (self == v5)
  {
    unsigned __int8 v12 = 1;
    goto LABEL_107;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned __int8 v12 = 0;
    goto LABEL_107;
  }
  v6 = v5;
  v7 = v6;
  if (self)
  {
    unsigned int type = self->_type;
    if (v6)
    {
LABEL_5:
      unsigned int v9 = v6->_type;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int type = 0;
    if (v6) {
      goto LABEL_5;
    }
  }
  unsigned int v9 = 0;
LABEL_6:
  unsigned int v146 = v9;
  unsigned int v147 = type;
  if (type != v9)
  {
    uint64_t v145 = 0;
    int v148 = 0;
    uint64_t v144 = 0;
    uint64_t v143 = 0;
    memset(v133, 0, sizeof(v133));
    uint64_t v142 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    goto LABEL_30;
  }
  if (!self || (v10 = self->_uuid) == 0)
  {
    if (!v7 || (v20 = v7->_uuid) == 0)
    {
      v126 = 0;
      v123 = 0;
      uint64_t v145 = 0x100000000;
      if (self) {
        goto LABEL_22;
      }
LABEL_112:
      unsigned int kernelID = 0;
      if (v7) {
        goto LABEL_23;
      }
      goto LABEL_113;
    }
    v123 = v20;
    if (self) {
      v11 = self->_uuid;
    }
    else {
      v11 = 0;
    }
    v126 = 0;
    HIDWORD(v145) = 1;
    goto LABEL_19;
  }
  v126 = v10;
  v11 = self->_uuid;
  HIDWORD(v145) = 0;
  if (v7)
  {
LABEL_19:
    v131 = v11;
    uunsigned int uid = v7->_uuid;
    goto LABEL_20;
  }
  v131 = v11;
  uunsigned int uid = 0;
LABEL_20:
  v125 = uuid;
  LODWORD(v145) = 1;
  if (!-[NSUUID isEqual:](v131, "isEqual:"))
  {
LABEL_29:
    int v148 = 0;
    uint64_t v144 = 0;
    uint64_t v143 = 0;
    memset(v133, 0, sizeof(v133));
    uint64_t v142 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    goto LABEL_30;
  }
  if (!self) {
    goto LABEL_112;
  }
LABEL_22:
  unsigned int kernelID = self->_kernelID;
  if (v7)
  {
LABEL_23:
    unsigned int v23 = v7->_kernelID;
    goto LABEL_24;
  }
LABEL_113:
  unsigned int v23 = 0;
LABEL_24:
  if (kernelID != v23) {
    goto LABEL_29;
  }
  if (!self)
  {
    p_isa = (id *)&v7->super.isa;
    if (!v7)
    {
      int v37 = 0;
      v116 = 0;
      v122 = 0;
      int v43 = 0;
      v113 = 0;
      v119 = 0;
      LODWORD(v142) = 0;
      v112 = 0;
      v115 = 0;
      HIDWORD(v144) = 1;
      goto LABEL_211;
    }
    v122 = 0;
    HIDWORD(v144) = 1;
    v116 = v7->_nickname;
    if (!v116)
    {
      int v37 = 0;
      v116 = 0;
      goto LABEL_172;
    }
    v25 = 0;
    goto LABEL_117;
  }
  v24 = self->_nickname;
  if (!v24)
  {
    if (!v7)
    {
      v119 = self->_bundleIDs;
      if (v119)
      {
        v121 = self->_bundleIDs;
        v122 = 0;
        int v37 = 0;
        v116 = 0;
        HIDWORD(v143) = 0;
        bundleIDs = 0;
        HIDWORD(v144) = 1;
        goto LABEL_133;
      }
      int v37 = 0;
      v116 = 0;
      v122 = 0;
      HIDWORD(v144) = 1;
LABEL_183:
      v115 = self->_observers;
      if (v115)
      {
        v118 = self->_observers;
        v119 = 0;
        int v43 = 0;
        v113 = 0;
        HIDWORD(v142) = 0;
        observers = 0;
        HIDWORD(v143) = 1;
        goto LABEL_148;
      }
      int v43 = 0;
      v113 = 0;
      v119 = 0;
      HIDWORD(v143) = 1;
LABEL_191:
      LODWORD(v144) = v37;
      uint64_t v142 = 0x100000000;
      LODWORD(v143) = v43;
      v115 = 0;
      v112 = 0;
      if (self->_isDeleting)
      {
        int v148 = 1;
        *(_DWORD *)&v133[16] = 1;
        *(void *)v133 = 1;
        v112 = 0;
        unsigned __int8 v12 = 0;
        *(void *)&v133[8] = 0;
        uint64_t v141 = 0;
        uint64_t v140 = 0;
        int v13 = 0;
        uint64_t v139 = 0;
        int v14 = 0;
        uint64_t v138 = 0;
        uint64_t v137 = 0;
        int v132 = 0;
        uint64_t v136 = 0;
        int v15 = 0;
        uint64_t v135 = 0;
        int v16 = 0;
        uint64_t v134 = 0;
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        goto LABEL_30;
      }
      goto LABEL_193;
    }
    v34 = v7->_nickname;
    if (!v34)
    {
      p_bundleIDs = &self->_bundleIDs;
      v39 = self->_bundleIDs;
      int v37 = 0;
      v116 = 0;
      if (v39)
      {
        v119 = v39;
        HIDWORD(v144) = 1;
        v122 = 0;
        HIDWORD(v143) = 0;
LABEL_131:
        v121 = *p_bundleIDs;
LABEL_132:
        bundleIDs = v7->_bundleIDs;
        goto LABEL_133;
      }
      HIDWORD(v144) = 1;
      v122 = 0;
LABEL_129:
      v40 = v7->_bundleIDs;
      if (!v40)
      {
        p_observers = &self->_observers;
        int v43 = 0;
        HIDWORD(v143) = 1;
        v115 = self->_observers;
        v113 = 0;
        if (v115)
        {
          v119 = 0;
          HIDWORD(v142) = 0;
LABEL_146:
          v118 = *p_observers;
LABEL_147:
          observers = v7->_observers;
          goto LABEL_148;
        }
        v119 = 0;
LABEL_144:
        v45 = v7->_observers;
        if (!v45)
        {
          v115 = 0;
          v112 = 0;
          BOOL isDeleting = self->_isDeleting;
          uint64_t v142 = 0x100000000;
          goto LABEL_155;
        }
        v112 = v45;
        v115 = 0;
        p_observers = &self->_observers;
        HIDWORD(v142) = 1;
        goto LABEL_146;
      }
      v113 = v40;
      v119 = 0;
      p_bundleIDs = &self->_bundleIDs;
      HIDWORD(v143) = 1;
      goto LABEL_131;
    }
    v116 = v34;
    v25 = self->_nickname;
    v122 = 0;
    HIDWORD(v144) = 1;
    goto LABEL_117;
  }
  v122 = v24;
  v25 = self->_nickname;
  HIDWORD(v144) = 0;
  if (v7)
  {
LABEL_117:
    v124 = v25;
    nickname = v7->_nickname;
    goto LABEL_118;
  }
  v124 = v25;
  nickname = 0;
LABEL_118:
  v120 = nickname;
  if (!-[NSString isEqual:](v124, "isEqual:"))
  {
    uint64_t v143 = 0;
    memset(v133, 0, sizeof(v133));
    uint64_t v142 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    int v148 = 1;
    LODWORD(v144) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    int v37 = 1;
    p_isa = (id *)&v7->super.isa;
    if (!v7)
    {
      int v43 = 0;
      v113 = 0;
      v119 = 0;
      LODWORD(v142) = 0;
      v112 = 0;
      v115 = 0;
LABEL_211:
      HIDWORD(v143) = 1;
      goto LABEL_212;
    }
LABEL_172:
    v119 = 0;
    HIDWORD(v143) = 1;
    v113 = (NSSet *)p_isa[6];
    if (!v113)
    {
      int v43 = 0;
      v113 = 0;
LABEL_177:
      v115 = 0;
      HIDWORD(v142) = 1;
      v112 = (NSSet *)p_isa[7];
      if (!v112)
      {
        LODWORD(v142) = 0;
        v112 = 0;
        v7 = (UMDPersonaManifestPersona *)p_isa;
LABEL_186:
        LODWORD(v143) = v43;
        LODWORD(v144) = v37;
        if (v7->_isDeleting || v7->_isDisabled) {
          goto LABEL_158;
        }
LABEL_198:
        if (v7)
        {
          v52 = v7->_displayName;
          if (v52)
          {
            v128 = v52;
            if (self) {
              v50 = self->_displayName;
            }
            else {
              v50 = 0;
            }
            v51 = 0;
            HIDWORD(v141) = 1;
            goto LABEL_203;
          }
        }
LABEL_213:
        v130 = 0;
        v128 = 0;
        uint64_t v141 = 0x100000000;
        goto LABEL_214;
      }
      v118 = 0;
      v7 = (UMDPersonaManifestPersona *)p_isa;
      goto LABEL_147;
    }
    v121 = 0;
    v7 = (UMDPersonaManifestPersona *)p_isa;
    goto LABEL_132;
  }
  v36 = self->_bundleIDs;
  if (!v36)
  {
    int v37 = 1;
    if (!v7) {
      goto LABEL_183;
    }
    goto LABEL_129;
  }
  v119 = v36;
  HIDWORD(v143) = 0;
  int v37 = 1;
  v121 = self->_bundleIDs;
  if (v7) {
    goto LABEL_132;
  }
  bundleIDs = 0;
LABEL_133:
  v117 = bundleIDs;
  if (![(NSSet *)v121 isEqual:v117])
  {
    LODWORD(v144) = v37;
    *(void *)v133 = 0;
    *(void *)&v133[8] = 0;
    uint64_t v142 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    int v148 = 1;
    *(_DWORD *)&v133[16] = 1;
    LODWORD(v143) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    int v43 = 1;
    p_isa = (id *)&v7->super.isa;
    if (v7) {
      goto LABEL_177;
    }
    LODWORD(v142) = 0;
    v112 = 0;
    v115 = 0;
LABEL_212:
    HIDWORD(v142) = 1;
    v7 = 0;
    goto LABEL_213;
  }
  v42 = self->_observers;
  if (!v42)
  {
    int v43 = 1;
    if (!v7) {
      goto LABEL_191;
    }
    goto LABEL_144;
  }
  v115 = v42;
  HIDWORD(v142) = 0;
  int v43 = 1;
  v118 = self->_observers;
  if (v7) {
    goto LABEL_147;
  }
  observers = 0;
LABEL_148:
  v114 = observers;
  if (!-[NSSet isEqual:](v118, "isEqual:"))
  {
    LODWORD(v143) = v43;
    LODWORD(v144) = v37;
    *(void *)&v133[8] = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    *(_DWORD *)&v133[4] = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    int v148 = 1;
LABEL_153:
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    LODWORD(v142) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    LODWORD(v142) = 1;
    if (!v7) {
      goto LABEL_198;
    }
    goto LABEL_186;
  }
  BOOL isDeleting = self->_isDeleting;
  if (!v7)
  {
    LODWORD(v143) = v43;
    LODWORD(v144) = v37;
    int v148 = 1;
    if (self->_isDeleting)
    {
      *(void *)&v133[8] = 0;
      uint64_t v141 = 0;
      uint64_t v140 = 0;
      int v13 = 0;
      uint64_t v139 = 0;
      int v14 = 0;
      uint64_t v138 = 0;
      *(_DWORD *)&v133[4] = 0;
      uint64_t v137 = 0;
      int v132 = 0;
      uint64_t v136 = 0;
      int v15 = 0;
      uint64_t v135 = 0;
      int v16 = 0;
      uint64_t v134 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      unsigned __int8 v12 = 0;
      goto LABEL_153;
    }
    LODWORD(v142) = 1;
LABEL_193:
    if (self->_isDisabled) {
      goto LABEL_158;
    }
    int v37 = v144;
    int v43 = v143;
    goto LABEL_195;
  }
  LODWORD(v142) = 1;
LABEL_155:
  if (((isDeleting ^ v7->_isDeleting) & 1) != 0 || self->_isDisabled != v7->_isDisabled)
  {
    LODWORD(v143) = v43;
    LODWORD(v144) = v37;
LABEL_158:
    *(void *)&v133[8] = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    int v148 = 1;
    *(_DWORD *)&v133[16] = 1;
    *(void *)v133 = 1;
    goto LABEL_30;
  }
LABEL_195:
  v49 = self->_displayName;
  if (!v49) {
    goto LABEL_198;
  }
  v130 = v49;
  v50 = self->_displayName;
  HIDWORD(v141) = 0;
  if (!v7)
  {
    v111 = v50;
    displayName = 0;
    goto LABEL_204;
  }
  v51 = v130;
LABEL_203:
  v111 = v50;
  v130 = v51;
  displayName = v7->_displayName;
LABEL_204:
  v109 = displayName;
  if (!-[NSString isEqual:](v111, "isEqual:"))
  {
    int v148 = 1;
    LODWORD(v143) = v43;
    LODWORD(v144) = v37;
    *(void *)&v133[4] = 0;
    uint64_t v140 = 0;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    int v132 = 0;
    *(_DWORD *)v133 = 1;
    LODWORD(v141) = 1;
    goto LABEL_30;
  }
  LODWORD(v141) = 1;
LABEL_214:
  LODWORD(v144) = v37;
  LODWORD(v143) = v43;
  if (self && (v54 = self->_createTime) != 0)
  {
    v129 = v54;
    v55 = self->_createTime;
    HIDWORD(v140) = 0;
    if (!v7)
    {
      v110 = v55;
      createTime = 0;
      goto LABEL_224;
    }
    v56 = v129;
  }
  else
  {
    if (!v7 || (v57 = v7->_createTime) == 0)
    {
      v129 = 0;
      v127 = 0;
      uint64_t v140 = 0x100000000;
      goto LABEL_228;
    }
    v127 = v57;
    if (self) {
      v55 = self->_createTime;
    }
    else {
      v55 = 0;
    }
    v56 = 0;
    HIDWORD(v140) = 1;
  }
  v110 = v55;
  v129 = v56;
  createTime = v7->_createTime;
LABEL_224:
  v107 = createTime;
  if (!-[NSDate isEqual:](v110, "isEqual:"))
  {
    int v148 = 1;
    int v13 = 0;
    uint64_t v139 = 0;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 0;
    *(_DWORD *)&v133[8] = 1;
    LODWORD(v140) = 1;
    goto LABEL_30;
  }
  LODWORD(v140) = 1;
LABEL_228:
  if (self && (v59 = self->_loginTime) != 0)
  {
    v106 = v59;
    v60 = self->_loginTime;
    HIDWORD(v139) = 0;
    if (!v7)
    {
      v108 = v60;
      loginTime = 0;
      goto LABEL_238;
    }
  }
  else
  {
    if (!v7 || (v61 = v7->_loginTime) == 0)
    {
      v106 = 0;
      v100 = 0;
      uint64_t v139 = 0x100000000;
      goto LABEL_242;
    }
    v100 = v61;
    if (self) {
      v60 = self->_loginTime;
    }
    else {
      v60 = 0;
    }
    v106 = 0;
    HIDWORD(v139) = 1;
  }
  v108 = v60;
  loginTime = v7->_loginTime;
LABEL_238:
  v104 = loginTime;
  if (!-[NSDate isEqual:](v108, "isEqual:"))
  {
    int v148 = 1;
    int v14 = 0;
    uint64_t v138 = 0;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 0;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    LODWORD(v139) = 1;
    goto LABEL_30;
  }
  LODWORD(v139) = 1;
LABEL_242:
  if (self && (v63 = self->_volumeUUID) != 0)
  {
    v103 = v63;
    v64 = self->_volumeUUID;
    HIDWORD(v138) = 0;
    if (!v7)
    {
      v105 = v64;
      volumeUUID = 0;
      goto LABEL_252;
    }
  }
  else
  {
    if (!v7 || (v65 = v7->_volumeUUID) == 0)
    {
      v103 = 0;
      v96 = 0;
      uint64_t v138 = 0x100000000;
      goto LABEL_256;
    }
    v96 = v65;
    if (self) {
      v64 = self->_volumeUUID;
    }
    else {
      v64 = 0;
    }
    v103 = 0;
    HIDWORD(v138) = 1;
  }
  v105 = v64;
  volumeUUID = v7->_volumeUUID;
LABEL_252:
  v101 = volumeUUID;
  if (!-[NSUUID isEqual:](v105, "isEqual:"))
  {
    int v148 = 1;
    uint64_t v137 = 0;
    int v132 = 0;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 0;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    LODWORD(v138) = 1;
    goto LABEL_30;
  }
  LODWORD(v138) = 1;
LABEL_256:
  if (self && (v67 = self->_homeUUID) != 0)
  {
    v68 = v67;
    v69 = self->_homeUUID;
    HIDWORD(v137) = 0;
    if (!v7)
    {
      v102 = v69;
      homeUUID = 0;
      goto LABEL_266;
    }
  }
  else
  {
    if (!v7)
    {
      v68 = 0;
      v93 = 0;
      uint64_t v137 = 0x100000000;
      goto LABEL_270;
    }
    v93 = v7->_homeUUID;
    if (!v93)
    {
      v68 = 0;
      v93 = 0;
      uint64_t v137 = 0x100000000;
      goto LABEL_270;
    }
    if (self) {
      v69 = self->_homeUUID;
    }
    else {
      v69 = 0;
    }
    v68 = 0;
    HIDWORD(v137) = 1;
  }
  v102 = v69;
  homeUUID = v7->_homeUUID;
LABEL_266:
  v97 = homeUUID;
  int v148 = 1;
  if (!-[NSUUID isEqual:](v102, "isEqual:"))
  {
    v99 = v68;
    uint64_t v136 = 0;
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    int v132 = 0;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 1;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    LODWORD(v137) = 1;
    goto LABEL_30;
  }
  LODWORD(v137) = 1;
LABEL_270:
  v99 = v68;
  if (self && (v71 = self->_homeDir) != 0)
  {
    v95 = v71;
    v98 = self->_homeDir;
    HIDWORD(v136) = 0;
    if (!v7)
    {
      homeDir = 0;
      goto LABEL_280;
    }
  }
  else
  {
    if (!v7 || (v89 = v7->_homeDir) == 0)
    {
      v95 = 0;
      v89 = 0;
      uint64_t v136 = 0x100000000;
      goto LABEL_284;
    }
    if (self) {
      v98 = self->_homeDir;
    }
    else {
      v98 = 0;
    }
    v95 = 0;
    HIDWORD(v136) = 1;
  }
  homeDir = v7->_homeDir;
LABEL_280:
  v92 = homeDir;
  int v148 = 1;
  if (!-[NSString isEqual:](v98, "isEqual:"))
  {
    int v15 = 0;
    uint64_t v135 = 0;
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 1;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    int v132 = 1;
    LODWORD(v136) = 1;
    goto LABEL_30;
  }
  LODWORD(v136) = 1;
LABEL_284:
  if (self && (v91 = self->_deviceNode) != 0)
  {
    v94 = self->_deviceNode;
    HIDWORD(v135) = 0;
    deviceNode = v7;
    if (!v7) {
      goto LABEL_294;
    }
  }
  else
  {
    if (!v7 || (v86 = v7->_deviceNode) == 0)
    {
      v91 = 0;
      v86 = 0;
      uint64_t v135 = 0x100000000;
      goto LABEL_298;
    }
    if (self) {
      v94 = self->_deviceNode;
    }
    else {
      v94 = 0;
    }
    v91 = 0;
    HIDWORD(v135) = 1;
  }
  deviceNode = (UMDPersonaManifestPersona *)v7->_deviceNode;
LABEL_294:
  v88 = deviceNode;
  int v148 = 1;
  if (!-[NSString isEqual:](v94, "isEqual:"))
  {
    int v16 = 0;
    uint64_t v134 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 1;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    int v132 = 1;
    int v15 = 1;
    LODWORD(v135) = 1;
    goto LABEL_30;
  }
  LODWORD(v135) = 1;
LABEL_298:
  if (self && (v87 = self->_userUUID) != 0)
  {
    v90 = self->_userUUID;
    HIDWORD(v134) = 0;
    userUUID = v7;
    if (!v7) {
      goto LABEL_308;
    }
  }
  else
  {
    if (!v7 || (v84 = v7->_userUUID) == 0)
    {
      v87 = 0;
      v84 = 0;
      uint64_t v134 = 0x100000000;
      goto LABEL_312;
    }
    if (self) {
      v90 = self->_userUUID;
    }
    else {
      v90 = 0;
    }
    v87 = 0;
    HIDWORD(v134) = 1;
  }
  userUUID = v7->_userUUID;
LABEL_308:
  id v85 = userUUID;
  int v148 = 1;
  if (!-[NSUUID isEqual:](v90, "isEqual:"))
  {
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 1;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    int v132 = 1;
    int v15 = 1;
    int v16 = 1;
    LODWORD(v134) = 1;
    goto LABEL_30;
  }
  LODWORD(v134) = 1;
LABEL_312:
  if (self) {
    unsigned int uid = self->_uid;
  }
  else {
    unsigned int uid = 0;
  }
  unsigned int v76 = v7;
  if (v7) {
    unsigned int v76 = v7->_uid;
  }
  if (uid != v76) {
    goto LABEL_326;
  }
  if (self) {
    unsigned int gid = self->_gid;
  }
  else {
    unsigned int gid = 0;
  }
  unsigned int v78 = v7;
  if (v7) {
    unsigned int v78 = v7->_gid;
  }
  if (gid != v78)
  {
LABEL_326:
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    unsigned __int8 v12 = 0;
    int v148 = 1;
    *(_DWORD *)&v133[12] = 1;
    *(_DWORD *)&v133[16] = 1;
    *(_DWORD *)v133 = 1;
    *(_DWORD *)&v133[4] = 1;
    *(_DWORD *)&v133[8] = 1;
    int v13 = 1;
    int v14 = 1;
    int v132 = 1;
    int v15 = 1;
    int v16 = 1;
    goto LABEL_30;
  }
  if (self)
  {
    v82 = self->_encryptedVolumeKey;
    if (v82)
    {
      v83 = self->_encryptedVolumeKey;
      int v80 = 0;
      encryptedVolumeKey = v7;
      if (!v7) {
        goto LABEL_333;
      }
      goto LABEL_332;
    }
  }
  int v19 = (int)v7;
  if (v7)
  {
    v81 = v7->_encryptedVolumeKey;
    if (v81)
    {
      if (self) {
        v83 = self->_encryptedVolumeKey;
      }
      else {
        v83 = 0;
      }
      v82 = 0;
      int v80 = 1;
LABEL_332:
      encryptedVolumeKey = v7->_encryptedVolumeKey;
LABEL_333:
      id v3 = encryptedVolumeKey;
      unsigned __int8 v12 = [(NSData *)v83 isEqual:v3];
      int v19 = 1;
      int v148 = 1;
      *(_DWORD *)&v133[12] = 1;
      *(_DWORD *)&v133[16] = 1;
      *(_DWORD *)v133 = 1;
      *(_DWORD *)&v133[4] = 1;
      *(_DWORD *)&v133[8] = 1;
      int v13 = 1;
      int v14 = 1;
      int v132 = 1;
      int v15 = 1;
      int v16 = 1;
      int v17 = 1;
      int v18 = v80;
      goto LABEL_30;
    }
    v81 = 0;
    v82 = 0;
    int v19 = 0;
  }
  else
  {
    v81 = 0;
    v82 = 0;
  }
  int v148 = 1;
  *(_DWORD *)&v133[12] = 1;
  *(_DWORD *)&v133[16] = 1;
  *(_DWORD *)v133 = 1;
  *(_DWORD *)&v133[4] = 1;
  *(_DWORD *)&v133[8] = 1;
  int v13 = 1;
  int v14 = 1;
  int v132 = 1;
  int v15 = 1;
  int v16 = 1;
  int v17 = 1;
  int v18 = 1;
  unsigned __int8 v12 = 1;
LABEL_30:
  if (v19)
  {
    v26 = v7;
    int v27 = v15;
    int v28 = v17;
    int v29 = v14;
    int v30 = v13;
    int v31 = v18;

    int v32 = v31;
    int v13 = v30;
    int v14 = v29;
    int v17 = v28;
    int v15 = v27;
    v7 = v26;
    if (!v32) {
      goto LABEL_32;
    }
LABEL_109:

    if (!v17) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v18) {
    goto LABEL_109;
  }
LABEL_32:
  if (v17) {
LABEL_33:
  }

LABEL_34:
  if (v134)
  {
  }
  if (HIDWORD(v134)) {

  }
  if (v16) {
  if (v135)
  }
  {
  }
  if (HIDWORD(v135)) {

  }
  if (v15) {
  if (v136)
  }
  {
  }
  if (HIDWORD(v136)) {

  }
  if (v132) {
  if (v137)
  }
  {
  }
  if (HIDWORD(v137)) {

  }
  if (*(_DWORD *)&v133[4]) {
  if (v138)
  }
  {
  }
  if (HIDWORD(v138)) {

  }
  if (v14) {
  if (v139)
  }
  {
  }
  if (HIDWORD(v139)) {

  }
  if (v13) {
  if (v140)
  }
  {
  }
  if (HIDWORD(v140)) {

  }
  if (*(_DWORD *)&v133[8]) {
  if (v141)
  }
  {
  }
  if (HIDWORD(v141)) {

  }
  if (*(_DWORD *)&v133[12]) {
  if (v142)
  }
  {
  }
  if (HIDWORD(v142)) {

  }
  if (*(_DWORD *)v133) {
  if (v143)
  }
  {
  }
  if (HIDWORD(v143)) {

  }
  if (*(_DWORD *)&v133[16]) {
  if (v144)
  }
  {
  }
  if (HIDWORD(v144)) {

  }
  if (v148) {
  if (v145)
  }
  {
  }
  if (HIDWORD(v145)) {

  }
  if (v147 == v146) {
LABEL_107:
  }

  return v12;
}

- (unint64_t)hash
{
  if (self)
  {
    uint64_t type = self->_type;
    uunsigned int uid = self->_uuid;
  }
  else
  {
    uint64_t type = 0;
    uunsigned int uid = 0;
  }
  v42 = uuid;
  v5 = (char *)[(NSUUID *)v42 hash] + type;
  if (self)
  {
    v5 += self->_kernelID;
    nickname = self->_nickname;
  }
  else
  {
    nickname = 0;
  }
  v41 = nickname;
  v7 = &v5[[(NSString *)v41 hash]];
  if (self) {
    bundleIDs = self->_bundleIDs;
  }
  else {
    bundleIDs = 0;
  }
  v40 = bundleIDs;
  unsigned int v9 = (char *)[(NSSet *)v40 hash] + (void)v7;
  if (self) {
    observers = self->_observers;
  }
  else {
    observers = 0;
  }
  v39 = observers;
  v11 = (char *)[(NSSet *)v39 hash] + (void)v9;
  if (self)
  {
    v11 += self->_isDeleting + (unint64_t)self->_isDisabled;
    displayName = self->_displayName;
  }
  else
  {
    displayName = 0;
  }
  int v13 = displayName;
  int v14 = &v11[[(NSString *)v13 hash]];
  if (self) {
    createTime = self->_createTime;
  }
  else {
    createTime = 0;
  }
  int v16 = createTime;
  int v17 = (char *)[(NSDate *)v16 hash] + (void)v14;
  if (self) {
    loginTime = self->_loginTime;
  }
  else {
    loginTime = 0;
  }
  int v19 = loginTime;
  v20 = (char *)[(NSDate *)v19 hash] + (void)v17;
  if (self) {
    volumeUUID = self->_volumeUUID;
  }
  else {
    volumeUUID = 0;
  }
  v22 = volumeUUID;
  unsigned int v23 = (char *)[(NSUUID *)v22 hash] + (void)v20;
  if (self) {
    homeUUID = self->_homeUUID;
  }
  else {
    homeUUID = 0;
  }
  v25 = homeUUID;
  v26 = (char *)[(NSUUID *)v25 hash] + (void)v23;
  if (self) {
    homeDir = self->_homeDir;
  }
  else {
    homeDir = 0;
  }
  int v28 = homeDir;
  int v29 = (char *)[(NSString *)v28 hash] + (void)v26;
  if (self) {
    deviceNode = self->_deviceNode;
  }
  else {
    deviceNode = 0;
  }
  int v31 = deviceNode;
  int v32 = (char *)[(NSString *)v31 hash] + (void)v29;
  if (self) {
    userUUID = self->_userUUID;
  }
  else {
    userUUID = 0;
  }
  v34 = userUUID;
  v35 = (char *)[(NSUUID *)v34 hash] + (void)v32;
  if (self)
  {
    v35 += self->_uid + (unint64_t)self->_gid;
    encryptedVolumeKey = self->_encryptedVolumeKey;
  }
  else
  {
    encryptedVolumeKey = 0;
  }
  int v37 = &v35[(void)[(NSData *)encryptedVolumeKey hash]];

  return (unint64_t)v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedVolumeKey, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceNode, 0);
  objc_storeStrong((id *)&self->_homeDir, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_loginTime, 0);
  objc_storeStrong((id *)&self->_createTime, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_nickname, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end