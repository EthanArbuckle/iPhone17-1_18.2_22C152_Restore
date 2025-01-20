@interface SEMCascadeEntityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCascadeEntityInfo:(id)a3;
- (SEMCascadeEntityInfo)init;
- (SEMCascadeEntityInfo)initWithCoder:(id)a3;
- (SEMCascadeEntityInfo)initWithContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5 personaIdentifier:(id)a6;
- (id)allMetaContent;
- (id)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)personaIdentifier;
- (id)sourceIdentifier;
- (id)sourceIdentifierOrConstant;
- (id)toINPersons:(id *)a3;
- (id)toKVItem:(id *)a3;
- (id)toKVItems:(id *)a3;
- (unint64_t)hash;
- (unsigned)entityType;
- (unsigned)itemType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMCascadeEntityInfo

- (SEMCascadeEntityInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMCascadeEntityInfo)initWithContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5 personaIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SEMCascadeEntityInfo;
  v15 = [(SEMCascadeEntityInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_content, a3);
    objc_storeStrong((id *)&v16->_allMetaContent, a4);
    objc_storeStrong((id *)&v16->_sourceIdentifier, a5);
    objc_storeStrong((id *)&v16->_personaIdentifier, a6);
  }

  return v16;
}

- (unsigned)entityType
{
  return 1;
}

- (id)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (id)sourceIdentifierOrConstant
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    v5 = sourceIdentifier;
    goto LABEL_3;
  }
  int v8 = objc_msgSend_itemType(self, a2, v2, v3);
  if (v8 <= 42183)
  {
    if (v8 <= 18539)
    {
      switch(v8)
      {
        case 7690:
          v5 = @"HomeKit";
          goto LABEL_3;
        case 12996:
          v5 = @"Health";
          goto LABEL_3;
        case 15757:
          v5 = @"CoreRoutine";
          goto LABEL_3;
      }
    }
    else if (v8 > 27121)
    {
      if (v8 == 27122)
      {
        v5 = @"FindMy";
        goto LABEL_3;
      }
      if (v8 == 36434)
      {
        v5 = @"Applications";
        goto LABEL_3;
      }
    }
    else
    {
      if (v8 == 18540)
      {
        v5 = @"MediaPlayer";
        goto LABEL_3;
      }
      if (v8 == 19668)
      {
        v5 = @"Contacts";
        goto LABEL_3;
      }
    }
    goto LABEL_39;
  }
  if (v8 <= 53613)
  {
    if (v8 == 42184)
    {
      v5 = @"Podcasts";
      goto LABEL_3;
    }
    if (v8 == 49066)
    {
      v5 = @"CarPlay";
      goto LABEL_3;
    }
    int v12 = 53601;
  }
  else
  {
    if (v8 <= 61508)
    {
      if (v8 == 53614)
      {
        v5 = @"Fitness";
        goto LABEL_3;
      }
      if (v8 == 54385)
      {
        v5 = @"Calendar";
        goto LABEL_3;
      }
      goto LABEL_39;
    }
    if (v8 == 61509)
    {
      v5 = @"UserAccount";
      goto LABEL_3;
    }
    int v12 = 62158;
  }
  if (v8 == v12)
  {
    v5 = @"UserFeedbackLearning";
    goto LABEL_3;
  }
LABEL_39:
  id v13 = (void *)MEMORY[0x263F50070];
  uint64_t v14 = objc_msgSend_itemType(self, v9, v10, v11);
  objc_msgSend_descriptionForTypeIdentifier_(v13, v15, v14, v16);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    v19 = "-[SEMCascadeEntityInfo sourceIdentifierOrConstant]";
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, "%s Missing expected sourceIdentifier for itemType: %@", (uint8_t *)&v18, 0x16u);
  }
LABEL_3:
  return v5;
}

- (id)personaIdentifier
{
  return self->_personaIdentifier;
}

- (unsigned)itemType
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend_itemType(v2, v3, v4, v5);
}

- (id)content
{
  return self->_content;
}

- (id)allMetaContent
{
  return self->_allMetaContent;
}

- (id)toKVItem:(id *)a3
{
  uint64_t v4 = objc_msgSend_toKVItems_(self, a2, (uint64_t)a3, v3);
  int v8 = objc_msgSend_firstObject(v4, v5, v6, v7);

  return v8;
}

- (id)toKVItems:(id *)a3
{
  convertedInstances = self->_convertedInstances;
  if (convertedInstances)
  {
LABEL_2:
    uint64_t v5 = convertedInstances;
  }
  else
  {
    unint64_t v8 = objc_msgSend_count(self->_allMetaContent, a2, (uint64_t)a3, v3);
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    if (v8 <= 1)
    {
      uint64_t v12 = 1;
      uint64_t v13 = objc_msgSend_initWithCapacity_(v9, v10, 1, v11);
    }
    else
    {
      uint64_t v12 = v8;
      uint64_t v13 = objc_msgSend_initWithCapacity_(v9, v10, v8, v11);
    }
    uint64_t v16 = (NSArray *)v13;
    uint64_t v17 = 0;
    while (1)
    {
      if (v8
        && (objc_msgSend_objectAtIndex_(self->_allMetaContent, v14, v17, v15),
            (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = (void *)v18;
        id v20 = objc_alloc(MEMORY[0x263F31710]);
        v23 = objc_msgSend_initWithContent_metaContent_error_(v20, v21, (uint64_t)self->_content, (uint64_t)v19, a3);
        if (!v23) {
          goto LABEL_16;
        }
      }
      else
      {
        id v24 = objc_alloc(MEMORY[0x263F317A8]);
        v23 = objc_msgSend_initWithContent_error_(v24, v25, (uint64_t)self->_content, (uint64_t)a3);
        v19 = 0;
        if (!v23) {
          goto LABEL_16;
        }
      }
      uint64_t v26 = objc_msgSend_itemFromCascadeItem_error_(MEMORY[0x263F510B8], v22, (uint64_t)v23, (uint64_t)a3);
      if (!v26) {
        break;
      }
      v29 = (void *)v26;
      objc_msgSend_addObject_(v16, v27, v26, v28);

      if (v12 == ++v17)
      {
        v30 = self->_convertedInstances;
        self->_convertedInstances = v16;

        convertedInstances = self->_convertedInstances;
        goto LABEL_2;
      }
    }

LABEL_16:
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)toINPersons:(id *)a3
{
  uint64_t v200 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
    uint64_t v11 = objc_msgSend_content(self, v8, v9, v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v177 = self;
      uint64_t v12 = objc_opt_new();
      uint64_t v16 = objc_msgSend_givenName(v11, v13, v14, v15);
      objc_msgSend_setGivenName_(v12, v17, (uint64_t)v16, v18);

      uint64_t v22 = objc_msgSend_middleName(v11, v19, v20, v21);
      objc_msgSend_setMiddleName_(v12, v23, (uint64_t)v22, v24);

      uint64_t v28 = objc_msgSend_familyName(v11, v25, v26, v27);
      objc_msgSend_setFamilyName_(v12, v29, (uint64_t)v28, v30);

      v34 = objc_msgSend_nickname(v11, v31, v32, v33);
      objc_msgSend_setNickname_(v12, v35, (uint64_t)v34, v36);

      v40 = objc_msgSend_namePrefix(v11, v37, v38, v39);
      objc_msgSend_setNamePrefix_(v12, v41, (uint64_t)v40, v42);

      v46 = objc_msgSend_nameSuffix(v11, v43, v44, v45);
      objc_msgSend_setNameSuffix_(v12, v47, (uint64_t)v46, v48);

      v52 = objc_msgSend_phoneticGivenName(v11, v49, v50, v51);
      v56 = objc_msgSend_phoneticMiddleName(v11, v53, v54, v55);
      v60 = objc_msgSend_phoneticFamilyName(v11, v57, v58, v59);
      if (objc_msgSend_length(v52, v61, v62, v63)
        || objc_msgSend_length(v56, v64, v65, v66)
        || objc_msgSend_length(v60, v67, v68, v69))
      {
        v73 = objc_opt_new();
        objc_msgSend_setGivenName_(v73, v74, (uint64_t)v52, v75);
        objc_msgSend_setMiddleName_(v73, v76, (uint64_t)v56, v77);
        objc_msgSend_setFamilyName_(v73, v78, (uint64_t)v60, v79);
        objc_msgSend_setPhoneticRepresentation_(v12, v80, (uint64_t)v73, v81);
      }
      v174 = v56;
      v175 = v52;
      v82 = objc_msgSend_array(MEMORY[0x263EFF980], v70, v71, v72, v60);
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      v176 = v11;
      v86 = objc_msgSend_phoneNumbers(v11, v83, v84, v85);
      uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v87, (uint64_t)&v187, (uint64_t)v193, 16);
      if (v88)
      {
        uint64_t v89 = v88;
        uint64_t v90 = *(void *)v188;
        do
        {
          for (uint64_t i = 0; i != v89; ++i)
          {
            if (*(void *)v188 != v90) {
              objc_enumerationMutation(v86);
            }
            v92 = *(void **)(*((void *)&v187 + 1) + 8 * i);
            id v93 = objc_alloc(MEMORY[0x263F0FD20]);
            v97 = objc_msgSend_stringValue(v92, v94, v95, v96);
            v101 = objc_msgSend_label(v92, v98, v99, v100);
            v103 = objc_msgSend_initWithValue_type_label_(v93, v102, (uint64_t)v97, 2, v101);

            objc_msgSend_addObject_(v82, v104, (uint64_t)v103, v105);
          }
          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v106, (uint64_t)&v187, (uint64_t)v193, 16);
        }
        while (v89);
      }

      long long v185 = 0u;
      long long v186 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      v110 = objc_msgSend_emailAddresses(v176, v107, v108, v109);
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v110, v111, (uint64_t)&v183, (uint64_t)v192, 16);
      if (v112)
      {
        uint64_t v113 = v112;
        uint64_t v114 = *(void *)v184;
        do
        {
          for (uint64_t j = 0; j != v113; ++j)
          {
            if (*(void *)v184 != v114) {
              objc_enumerationMutation(v110);
            }
            v116 = *(void **)(*((void *)&v183 + 1) + 8 * j);
            id v117 = objc_alloc(MEMORY[0x263F0FD20]);
            v121 = objc_msgSend_email(v116, v118, v119, v120);
            v125 = objc_msgSend_label(v116, v122, v123, v124);
            v127 = objc_msgSend_initWithValue_type_label_(v117, v126, (uint64_t)v121, 1, v125);

            objc_msgSend_addObject_(v82, v128, (uint64_t)v127, v129);
          }
          uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v110, v130, (uint64_t)&v183, (uint64_t)v192, 16);
        }
        while (v113);
      }

      if (!objc_msgSend_count(v82, v131, v132, v133))
      {
        id v136 = objc_alloc(MEMORY[0x263F0FD20]);
        v138 = objc_msgSend_initWithValue_type_(v136, v137, 0, 0);
        objc_msgSend_addObject_(v82, v139, (uint64_t)v138, v140);
      }
      uint64_t v141 = 0;
      v142 = v177;
      do
      {
        allMetaContent = v142->_allMetaContent;
        uint64_t v178 = v141;
        if (allMetaContent)
        {
          v144 = objc_msgSend_objectAtIndex_(allMetaContent, v134, v141, v135);
          v148 = objc_msgSend_sourceItemIdentifier(v144, v145, v146, v147);
        }
        else
        {
          v148 = 0;
        }
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v149 = v82;
        uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v179, (uint64_t)v191, 16);
        if (v151)
        {
          uint64_t v152 = v151;
          uint64_t v153 = *(void *)v180;
          do
          {
            for (uint64_t k = 0; k != v152; ++k)
            {
              if (*(void *)v180 != v153) {
                objc_enumerationMutation(v149);
              }
              uint64_t v155 = *(void *)(*((void *)&v179 + 1) + 8 * k);
              id v156 = objc_alloc(MEMORY[0x263F0FD18]);
              v158 = objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_(v156, v157, v155, (uint64_t)v12, 0, 0, v148, 0);
              objc_msgSend_addObject_(v7, v159, (uint64_t)v158, v160);
            }
            uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v161, (uint64_t)&v179, (uint64_t)v191, 16);
          }
          while (v152);
        }

        v142 = v177;
        uint64_t v141 = v178 + 1;
      }
      while (v178 + 1 < (unint64_t)objc_msgSend_count(v177->_allMetaContent, v162, v163, v164));
      id v165 = v7;

      uint64_t v11 = v176;
    }
    else
    {
      v166 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v168 = v166;
        v169 = (objc_class *)objc_opt_class();
        v170 = NSStringFromClass(v169);
        v171 = (objc_class *)objc_opt_class();
        v172 = NSStringFromClass(v171);
        *(_DWORD *)buf = 136315650;
        v195 = "-[SEMCascadeEntityInfo toINPersons:]";
        __int16 v196 = 2112;
        v197 = v170;
        __int16 v198 = 2112;
        v199 = v172;
        _os_log_error_impl(&dword_25C7CA000, v168, OS_LOG_TYPE_ERROR, "%s Unexpected converted content class: %@ expected: %@", buf, 0x20u);
      }
      id v165 = 0;
    }
  }
  else
  {
    id v165 = 0;
  }
  return v165;
}

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)SEMCascadeEntityInfo;
  uint64_t v3 = [(SEMCascadeEntityInfo *)&v22 description];
  uint64_t v4 = (void *)MEMORY[0x263F50070];
  uint64_t v8 = objc_msgSend_itemType(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_descriptionForTypeIdentifier_(v4, v9, v8, v10);
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    objc_msgSend_stringWithFormat_(NSString, v11, @"sourceIdentifier: %@, ", v12, self->_sourceIdentifier);
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = &stru_2709E04D0;
  }
  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier)
  {
    objc_msgSend_stringWithFormat_(NSString, v11, @"personaIdentifier: %@, ", v12, self->_personaIdentifier);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v3, v18, @" itemType: %@, %@%@content: %@, allMetaContent: %@", v19, v13, v15, v17, self->_content, self->_allMetaContent);
  }
  else
  {
    uint64_t v17 = &stru_2709E04D0;
    objc_msgSend_stringByAppendingFormat_(v3, v11, @" itemType: %@, %@%@content: %@, allMetaContent: %@", v12, v13, v15, &stru_2709E04D0, self->_content, self->_allMetaContent);
  uint64_t v20 = };
  if (personaIdentifier) {

  }
  if (sourceIdentifier) {
  return v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = (id *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  objc_storeStrong(v8 + 1, self->_content);
  objc_storeStrong(v8 + 2, self->_allMetaContent);
  objc_storeStrong(v8 + 3, self->_sourceIdentifier);
  objc_storeStrong(v8 + 4, self->_personaIdentifier);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SEMCascadeEntityInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToCascadeEntityInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToCascadeEntityInfo = objc_msgSend_isEqualToCascadeEntityInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToCascadeEntityInfo = 0;
  }

  return isEqualToCascadeEntityInfo;
}

- (BOOL)isEqualToCascadeEntityInfo:(id)a3
{
  id v5 = a3;
  content = self->_content;
  uint64_t v10 = objc_msgSend_content(v5, v7, v8, v9);
  if (!objc_msgSend_isEqual_(content, v11, (uint64_t)v10, v12))
  {
    char isEqual = 0;
    goto LABEL_32;
  }
  allMetaContent = self->_allMetaContent;
  uint64_t v17 = allMetaContent;
  if (!allMetaContent)
  {
    uint64_t v18 = objc_msgSend_allMetaContent(v5, v13, v14, v15);
    if (!v18)
    {
      uint64_t v42 = 0;
      int v21 = 0;
      goto LABEL_10;
    }
    uint64_t v42 = (void *)v18;
    uint64_t v17 = self->_allMetaContent;
  }
  uint64_t v3 = objc_msgSend_allMetaContent(v5, v13, v14, v15);
  if ((objc_msgSend_isEqual_(v17, v19, (uint64_t)v3, v20) & 1) == 0)
  {

    char isEqual = 0;
    goto LABEL_30;
  }
  int v21 = 1;
LABEL_10:
  sourceIdentifier = self->_sourceIdentifier;
  uint64_t v24 = sourceIdentifier;
  if (!sourceIdentifier)
  {
    uint64_t v25 = objc_msgSend_sourceIdentifier(v5, v13, v14, v15);
    if (!v25)
    {
      uint64_t v39 = 0;
      int v41 = 0;
LABEL_17:
      personaIdentifier = self->_personaIdentifier;
      uint64_t v30 = personaIdentifier;
      if (!personaIdentifier)
      {
        uint64_t v31 = objc_msgSend_personaIdentifier(v5, v13, v14, v15);
        if (!v31)
        {
          uint64_t v36 = 0;
          char isEqual = 1;
          goto LABEL_25;
        }
        uint64_t v38 = (void *)v31;
        uint64_t v30 = self->_personaIdentifier;
      }
      int v32 = v21;
      uint64_t v33 = objc_msgSend_personaIdentifier(v5, v13, v14, v15);
      char isEqual = objc_msgSend_isEqual_(v30, v34, (uint64_t)v33, v35);

      int v21 = v32;
      if (personaIdentifier)
      {
        if (!v41) {
          goto LABEL_27;
        }
        uint64_t v26 = v40;
        goto LABEL_26;
      }
      uint64_t v36 = v38;
LABEL_25:

      uint64_t v26 = v40;
      if ((v41 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    uint64_t v39 = (void *)v25;
    uint64_t v24 = self->_sourceIdentifier;
  }
  uint64_t v26 = objc_msgSend_sourceIdentifier(v5, v13, v14, v15);
  if (objc_msgSend_isEqual_(v24, v27, (uint64_t)v26, v28))
  {
    v40 = v26;
    int v41 = 1;
    goto LABEL_17;
  }
  char isEqual = 0;
LABEL_26:

LABEL_27:
  if (sourceIdentifier)
  {
    if (!v21) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  if (v21) {
LABEL_29:
  }

LABEL_30:
  if (!allMetaContent) {

  }
LABEL_32:
  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_content, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_allMetaContent, v6, v7, v8) ^ v5;
  uint64_t v13 = objc_msgSend_hash(self->_sourceIdentifier, v10, v11, v12);
  return v9 ^ v13 ^ objc_msgSend_hash(self->_personaIdentifier, v14, v15, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMCascadeEntityInfo)initWithCoder:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SEMCascadeEntityInfo;
  uint64_t v7 = [(SEMCascadeEntityInfo *)&v71 init];
  if (!v7)
  {
LABEL_14:
    v57 = v7;
    goto LABEL_21;
  }
  unsigned __int16 v8 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"itemType", v6);
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"content");
  id v70 = 0;
  uint64_t v13 = objc_msgSend_contentMessageForItemType_data_error_(MEMORY[0x263F31718], v12, v8, (uint64_t)v11, &v70);
  id v14 = v70;
  content = v7->_content;
  v7->_content = (CCItemContent *)v13;

  if (v7->_content)
  {
    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    int v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"allMetaContent");

    if (v23)
    {
      uint64_t v62 = v11;
      uint64_t v63 = v7;
      id v64 = v4;
      id v24 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v28 = objc_msgSend_count(v23, v25, v26, v27);
      uint64_t v31 = objc_msgSend_initWithCapacity_(v24, v29, v28, v30);
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v61 = v23;
      id v32 = v23;
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v66, (uint64_t)v72, 16);
      if (v34)
      {
        uint64_t v36 = v34;
        uint64_t v37 = *(void *)v67;
        while (2)
        {
          uint64_t v38 = 0;
          uint64_t v39 = v14;
          do
          {
            if (*(void *)v67 != v37) {
              objc_enumerationMutation(v32);
            }
            uint64_t v40 = *(void *)(*((void *)&v66 + 1) + 8 * v38);
            id v65 = v39;
            int v41 = objc_msgSend_metaContentMessageForItemType_data_error_(MEMORY[0x263F31718], v35, v8, v40, &v65);
            id v14 = v65;

            if (!v41)
            {
              uint64_t v59 = qword_26B3549D8;
              if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[SEMCascadeEntityInfo initWithCoder:]";
                __int16 v75 = 2112;
                uint64_t v76 = v40;
                __int16 v77 = 2112;
                id v78 = v14;
                _os_log_error_impl(&dword_25C7CA000, v59, OS_LOG_TYPE_ERROR, "%s Failed to decode metacontent from data (%@): %@", buf, 0x20u);
              }

              v57 = 0;
              uint64_t v7 = v63;
              id v4 = v64;
              goto LABEL_21;
            }
            objc_msgSend_addObject_(v31, v42, (uint64_t)v41, v43);

            ++v38;
            uint64_t v39 = v14;
          }
          while (v36 != v38);
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v66, (uint64_t)v72, 16);
          if (v36) {
            continue;
          }
          break;
        }
      }

      uint64_t v47 = objc_msgSend_copy(v31, v44, v45, v46);
      uint64_t v7 = v63;
      allMetaContent = v63->_allMetaContent;
      v63->_allMetaContent = (NSArray *)v47;

      id v4 = v64;
      v23 = v61;
      uint64_t v11 = v62;
    }
    uint64_t v49 = objc_opt_class();
    uint64_t v51 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, @"sourceIdentifier");
    sourceIdentifier = v7->_sourceIdentifier;
    v7->_sourceIdentifier = (NSString *)v51;

    uint64_t v53 = objc_opt_class();
    uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v54, v53, @"personaIdentifier");
    personaIdentifier = v7->_personaIdentifier;
    v7->_personaIdentifier = (NSString *)v55;

    goto LABEL_14;
  }
  uint64_t v58 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v74 = "-[SEMCascadeEntityInfo initWithCoder:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v11;
    __int16 v77 = 2112;
    id v78 = v14;
    _os_log_error_impl(&dword_25C7CA000, v58, OS_LOG_TYPE_ERROR, "%s Failed to decode content from data (%@): %@", buf, 0x20u);
  }

  v57 = 0;
LABEL_21:

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v8 = objc_msgSend_itemType(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, @"itemType");
  uint64_t v13 = objc_msgSend_data(self->_content, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"content");

  if (self->_allMetaContent)
  {
    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v20 = objc_msgSend_count(self->_allMetaContent, v17, v18, v19);
    v23 = objc_msgSend_initWithCapacity_(v16, v21, v20, v22);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = self->_allMetaContent;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v26)
    {
      uint64_t v30 = v26;
      uint64_t v31 = *(void *)v39;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v24);
          }
          uint64_t v33 = objc_msgSend_data(*(void **)(*((void *)&v38 + 1) + 8 * v32), v27, v28, v29, (void)v38);
          objc_msgSend_addObject_(v23, v34, (uint64_t)v33, v35);

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v30);
    }

    objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v23, @"allMetaContent");
  }
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_sourceIdentifier, @"sourceIdentifier", (void)v38);
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)self->_personaIdentifier, @"personaIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedInstances, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_allMetaContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end