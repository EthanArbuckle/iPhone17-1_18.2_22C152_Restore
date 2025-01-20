void sub_19511D364(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

MRLanguageOption *MRLanguageOptionCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v11 = objc_alloc_init(MRLanguageOption);
  [(MRLanguageOption *)v11 setType:a2];
  [(MRLanguageOption *)v11 setLanguageTag:a3];
  [(MRLanguageOption *)v11 setCharacteristics:a4];
  [(MRLanguageOption *)v11 setDisplayName:a5];
  [(MRLanguageOption *)v11 setIdentifier:a6];
  return v11;
}

MRLanguageOption *MRLanguageOptionCreateAutomaticLanguageOptionForType(uint64_t a1)
{
  return MRLanguageOptionCreate(a1, a1, @"__AUTO__", 0, 0, 0);
}

uint64_t MRLanguageOptionIsAutomaticLanguageOptionForType(void *a1, int a2)
{
  id v3 = a1;
  if ([v3 type] != a2) {
    goto LABEL_5;
  }
  v4 = [v3 characteristics];

  if (v4
    || ([v3 displayName], v5 = objc_claimAutoreleasedReturnValue(), v5, v5)
    || ([v3 identifier], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
LABEL_5:
    uint64_t v7 = 0;
  }
  else
  {
    v9 = [v3 languageTag];
    uint64_t v7 = [v9 isEqualToString:@"__AUTO__"];
  }
  return v7;
}

uint64_t MRLanguageOptionCopyLanguageTag(void *a1)
{
  v1 = [a1 languageTag];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRLanguageOptionCopyCharacteristics(void *a1)
{
  v1 = [a1 characteristics];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRLanguageOptionCopyDisplayName(void *a1)
{
  v1 = [a1 displayName];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRLanguageOptionCopyIdentifier(void *a1)
{
  v1 = [a1 identifier];
  uint64_t v2 = [v1 copy];

  return v2;
}

__CFString *MRLanguageOptionTypeCopyDescription(int a1)
{
  v1 = @"NULL";
  if (a1 == 1) {
    v1 = @"MRLanguageOptionTypeLegible";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"MRLanguageOptionTypeAudible";
  }
}

uint64_t MRLanguageOptionCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

uint64_t MRLanguageOptionsCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

MRLanguageOption *MRLanguageOptionCreateFromExternalRepresentation(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (MRLanguageOption *)v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v3 = v1,
          uint64_t v2 = [[MRLanguageOption alloc] initWithProtobuf:v3], v3, !v2))
    {
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v5 = objc_opt_class();
      v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
      id v11 = 0;
      uint64_t v2 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v1 error:&v11];
      id v7 = v11;
      if (v7)
      {
        v8 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v7;
          _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Error %@ deserializing languageOption", buf, 0xCu);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v2;
        uint64_t v2 = [[MRLanguageOption alloc] initWithProtobuf:v9];
      }
    }
  }

  return v2;
}

uint64_t MRLanguageOptionsCreateFromExternalRepresentation(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = MSVPropertyListDataClasses();
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    v4 = [v2 setByAddingObjectsFromArray:v3];

    MSVUnarchivedObjectOfClasses();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v1;
    }
    else {
      id v5 = 0;
    }
  }
  uint64_t v6 = objc_msgSend(v5, "mr_map:", &__block_literal_global_80);

  return v6;
}

MRLanguageOption *__MRLanguageOptionsCreateFromExternalRepresentation_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = MRLanguageOptionCreateFromExternalRepresentation(a2);

  return v2;
}

MRLanguageOptionGroup *MRLanguageOptionGroupCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_alloc_init(MRLanguageOptionGroup);
  [(MRLanguageOptionGroup *)v7 setLanguageOptions:a2];
  [(MRLanguageOptionGroup *)v7 setDefaultLanguageOption:a3];
  [(MRLanguageOptionGroup *)v7 setAllowsEmptySelection:a4];
  return v7;
}

uint64_t MRLanguageOptionGroupCopyLanguageOptions(void *a1)
{
  id v1 = [a1 languageOptions];
  uint64_t v2 = [v1 copy];

  return v2;
}

void *MRLanguageOptionGroupGetDefaultLanguageOption(void *a1)
{
  id v1 = [a1 defaultLanguageOption];

  return v1;
}

uint64_t MRLanguageOptionGroupCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

uint64_t MRLanguageOptionGroupsCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

MRLanguageOptionGroup *MRLanguageOptionGroupCreateFromExternalRepresentation(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (MRLanguageOptionGroup *)v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v3 = v1,
          uint64_t v2 = [[MRLanguageOptionGroup alloc] initWithProtobuf:v3], v3, !v2))
    {
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
      id v11 = 0;
      uint64_t v2 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v1 error:&v11];
      id v7 = v11;
      if (v7)
      {
        v8 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v7;
          _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Error %@ deserializing languageOptionGroup", buf, 0xCu);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v2;
        uint64_t v2 = [[MRLanguageOptionGroup alloc] initWithProtobuf:v9];
      }
    }
  }

  return v2;
}

uint64_t MRLanguageOptionGroupsCreateFromExternalRepresentation(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = MSVPropertyListDataClasses();
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    v4 = [v2 setByAddingObjectsFromArray:v3];

    MSVUnarchivedObjectOfClasses();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v1;
    }
    else {
      id v5 = 0;
    }
  }
  uint64_t v6 = objc_msgSend(v5, "mr_map:", &__block_literal_global_49_1);

  return v6;
}

MRLanguageOptionGroup *__MRLanguageOptionGroupsCreateFromExternalRepresentation_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = MRLanguageOptionGroupCreateFromExternalRepresentation(a2);

  return v2;
}

uint64_t MRLanguageOptionIsEqualToLanguageOption(void *a1, const char *a2)
{
  return [a1 isEqual:a2];
}

BOOL _MRWakeDeviceMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t _MRPreloadedPlaybackSessionInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRVolumeControlCapabilitiesDidChangeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 4) {
        break;
      }
      if (v17 == 3)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 16;
        goto LABEL_26;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(_MRVolumeControlAvailabilityProtobuf);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (_MRVolumeControlAvailabilityProtobufReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadString();
    uint64_t v20 = 24;
LABEL_26:
    uint64_t v18 = *(_MRVolumeControlAvailabilityProtobuf **)(a1 + v20);
    *(void *)(a1 + v20) = v19;
LABEL_27:

    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRPlaybackQueueCapabilitiesProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 4u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRequest;
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v24 = v27++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRequest;
            goto LABEL_50;
          }
        }
        char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRequest;
LABEL_47:
        *(unsigned char *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRange;
            goto LABEL_47;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v24 = v19++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRange;
            goto LABEL_50;
          }
        }
        char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByRange;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v31 = 0;
    unsigned int v32 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 12) |= 1u;
    while (1)
    {
      uint64_t v33 = *v3;
      unint64_t v34 = *(void *)(a2 + v33);
      if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
      {
        char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByIdentifiers;
        goto LABEL_47;
      }
      char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
      *(void *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0) {
        break;
      }
      v31 += 7;
      BOOL v24 = v32++ > 8;
      if (v24)
      {
        uint64_t v20 = 0;
        char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByIdentifiers;
        goto LABEL_50;
      }
    }
    char v25 = &OBJC_IVAR____MRPlaybackQueueCapabilitiesProtobuf__requestByIdentifiers;
LABEL_48:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_50:
    *(unsigned char *)(a1 + *v25) = v20 != 0;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRUpdateOutputDevicesMessageProtobufReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v18 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
        [a1 addClusterAwareOutputDevices:v18];
        goto LABEL_23;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
        [a1 addOutputDevices:v18];
LABEL_23:
        if (!PBReaderPlaceMark()
          || (_MRAVOutputDeviceDescriptorProtobufReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadString();
    char v18 = (_MRAVOutputDeviceDescriptorProtobuf *)a1[2];
    a1[2] = v19;
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRRegisterGameControllerResponseMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_195125714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose((const void *)(v47 - 176), 8);
  _Block_object_dispose((const void *)(v47 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_195128100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951284A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_195128840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195128970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MRGetVolumeResultMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 12) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRNowPlayingInfoProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_81;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 56;
          goto LABEL_81;
        case 3u:
          *(_WORD *)(a1 + 120) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v97 = 8;
          goto LABEL_150;
        case 4u:
          *(_WORD *)(a1 + 120) |= 2u;
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v97 = 16;
          goto LABEL_150;
        case 5u:
          *(_WORD *)(a1 + 120) |= 0x20u;
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)(a2 + *v4))
          {
            int v28 = *(_DWORD *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v28 = 0;
          }
          *(_DWORD *)(a1 + 72) = v28;
          continue;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(_WORD *)(a1 + 120) |= 0x40u;
          while (2)
          {
            uint64_t v32 = *v3;
            uint64_t v33 = *(void *)(a2 + v32);
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v15 = v30++ >= 9;
                if (v15)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_106:
          uint64_t v93 = 96;
          goto LABEL_111;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v31 = 0;
          *(_WORD *)(a1 + 120) |= 0x80u;
          while (2)
          {
            uint64_t v38 = *v3;
            uint64_t v39 = *(void *)(a2 + v38);
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v40;
              v31 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v15 = v37++ >= 9;
                if (v15)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_110:
          uint64_t v93 = 100;
LABEL_111:
          *(_DWORD *)(a1 + v93) = v31;
          continue;
        case 8u:
          *(_WORD *)(a1 + 120) |= 8u;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v97 = 32;
LABEL_150:
          *(void *)(a1 + v97) = v23;
          continue;
        case 9u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 104;
          goto LABEL_81;
        case 0xAu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(_WORD *)(a1 + 120) |= 0x10u;
          while (2)
          {
            uint64_t v47 = *v3;
            uint64_t v48 = *(void *)(a2 + v47);
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                BOOL v15 = v45++ >= 9;
                if (v15)
                {
                  uint64_t v46 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_115:
          uint64_t v94 = 40;
          goto LABEL_128;
        case 0xBu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          *(_WORD *)(a1 + 120) |= 0x400u;
          while (2)
          {
            uint64_t v54 = *v3;
            uint64_t v55 = *(void *)(a2 + v54);
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
              *(void *)(a2 + v54) = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v15 = v52++ >= 9;
                if (v15)
                {
                  uint64_t v53 = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v53 = 0;
          }
LABEL_119:
          BOOL v95 = v53 != 0;
          uint64_t v96 = 114;
          goto LABEL_141;
        case 0xCu:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          *(_WORD *)(a1 + 120) |= 0x1000u;
          while (2)
          {
            uint64_t v61 = *v3;
            uint64_t v62 = *(void *)(a2 + v61);
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
              *(void *)(a2 + v61) = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v15 = v59++ >= 9;
                if (v15)
                {
                  uint64_t v60 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v60 = 0;
          }
LABEL_123:
          BOOL v95 = v60 != 0;
          uint64_t v96 = 116;
          goto LABEL_141;
        case 0xDu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v46 = 0;
          *(_WORD *)(a1 + 120) |= 4u;
          while (2)
          {
            uint64_t v67 = *v3;
            uint64_t v68 = *(void *)(a2 + v67);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
              *(void *)(a2 + v67) = v69;
              v46 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                BOOL v15 = v66++ >= 9;
                if (v15)
                {
                  uint64_t v46 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_127:
          uint64_t v94 = 24;
LABEL_128:
          *(void *)(a1 + v94) = v46;
          continue;
        case 0xEu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 80;
          goto LABEL_81;
        case 0xFu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 88;
          goto LABEL_81;
        case 0x10u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 64;
LABEL_81:
          v71 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 0x11u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          *(_WORD *)(a1 + 120) |= 0x200u;
          while (2)
          {
            uint64_t v75 = *v3;
            uint64_t v76 = *(void *)(a2 + v75);
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
              *(void *)(a2 + v75) = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v15 = v73++ >= 9;
                if (v15)
                {
                  uint64_t v74 = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v74 = 0;
          }
LABEL_132:
          BOOL v95 = v74 != 0;
          uint64_t v96 = 113;
          goto LABEL_141;
        case 0x12u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          *(_WORD *)(a1 + 120) |= 0x100u;
          while (2)
          {
            uint64_t v82 = *v3;
            uint64_t v83 = *(void *)(a2 + v82);
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
              *(void *)(a2 + v82) = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v15 = v80++ >= 9;
                if (v15)
                {
                  uint64_t v81 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v81 = 0;
          }
LABEL_136:
          BOOL v95 = v81 != 0;
          uint64_t v96 = 112;
          goto LABEL_141;
        case 0x13u:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          *(_WORD *)(a1 + 120) |= 0x800u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v89 = *v3;
        uint64_t v90 = *(void *)(a2 + v89);
        unint64_t v91 = v90 + 1;
        if (v90 == -1 || v91 > *(void *)(a2 + *v4)) {
          break;
        }
        char v92 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
        *(void *)(a2 + v89) = v91;
        v88 |= (unint64_t)(v92 & 0x7F) << v86;
        if ((v92 & 0x80) == 0) {
          goto LABEL_138;
        }
        v86 += 7;
        BOOL v15 = v87++ >= 9;
        if (v15)
        {
          uint64_t v88 = 0;
          goto LABEL_140;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_138:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v88 = 0;
      }
LABEL_140:
      BOOL v95 = v88 != 0;
      uint64_t v96 = 115;
LABEL_141:
      *(unsigned char *)(a1 + v96) = v95;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRNotificationMessageProtobufReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        [a1 addPlayerPath:v18];
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v18->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_28;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        PBReaderReadString();
        uint64_t v18 = (_MRNowPlayingPlayerPathProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          [a1 addNotification:v18];
        }
LABEL_28:

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadData();
    uint64_t v18 = (_MRNowPlayingPlayerPathProtobuf *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      [a1 addUserInfo:v18];
    }
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19512D198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512D3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512D628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512D794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512D900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512DA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512DE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512E074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19512E544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19512E888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19512EB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MRRequestGroupSessionMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(_MRRequestDetailsProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRRequestDetailsProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t MRMediaRemoteActiveEndpointChangeTypeCopyDescription(uint64_t a1)
{
  id v1 = @"Deferrable";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = @"Immediate";
  }
  return [(__CFString *)v2 copy];
}

uint64_t MRMediaRemoteActiveEndpointOperationCopyDescription(uint64_t a1)
{
  id v1 = @"Clear";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = @"Update";
  }
  return [(__CFString *)v2 copy];
}

void MRAVEndpointGetActiveSystemEndpointUID(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  int v7 = +[MRNowPlayingOriginClientManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __MRAVEndpointGetActiveSystemEndpointUID_block_invoke;
  v9[3] = &unk_1E57D3590;
  id v10 = v5;
  id v8 = v5;
  [v7 handleActiveSystemEndpointOutputDeviceUIDForType:a1 queue:v6 completion:v9];
}

uint64_t __MRAVEndpointGetActiveSystemEndpointUID_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRAVEndpointUpdateActiveSystemEndpoint(void *a1, uint64_t a2, void *a3, void *a4)
{
}

void MRAVEndpointUpdateActiveSystemEndpointWithReason(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (MRAVEndpointIsLocalEndpoint(a1))
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v12 = [a1 outputDevices];
    char v13 = [v12 firstObject];
    uint64_t v11 = [v13 uid];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v19, "isGroupLeader", (void)v21))
          {
            uint64_t v20 = [v19 uid];

            uint64_t v11 = (void *)v20;
            goto LABEL_13;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType((uint64_t)v11, v10, 1, a3, v8, v9);
}

void MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
}

void MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  unint64_t v12 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:a1 reason:a4];
  [(MRUpdateActiveSystemEndpointRequest *)v12 setChangeType:a3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType_block_invoke;
  v14[3] = &unk_1E57D76A8;
  id v15 = v10;
  id v13 = v10;
  [(MRUpdateActiveSystemEndpointRequest *)v12 perform:v11 completion:v14];
}

void __MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void MRAVEndpointResolveActiveSystemEndpoint(void *a1, void *a2)
{
}

void MRAVEndpointResolveActiveSystemEndpointWithTimeout(void *a1, void *a2, double a3)
{
  uint64_t v5 = MRActiveEndpointTypeForCurrentApplication_onceToken;
  id v6 = a2;
  id v7 = a1;
  id v9 = v7;
  if (v5 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&MRActiveEndpointTypeForCurrentApplication_onceToken, &__block_literal_global_83);
    id v8 = v9;
  }
  MRAVEndpointResolveActiveSystemEndpointWithType(MRActiveEndpointTypeForCurrentApplication_type, v8, v6, a3);
}

uint64_t MRActiveEndpointTypeForBundleIdentifier(void *a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 supportGroupSessionActiveEndpoint];

  if (!v3) {
    goto LABEL_6;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v20[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v7 = (void *)[v4 initWithArray:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v9 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  v19[0] = v9;
  id v10 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemAppleTVApplicationDisplayID();
  v19[1] = v10;
  id v11 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
  v19[2] = v11;
  unint64_t v12 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  v19[3] = v12;
  id v13 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  v19[4] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  id v15 = (void *)[v8 initWithArray:v14];

  if (![v7 containsObject:v1])
  {
    char v17 = [v15 containsObject:v1];

    if (v17)
    {
      uint64_t v16 = 5;
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v16 = 0;
    goto LABEL_7;
  }

  uint64_t v16 = 4;
LABEL_7:

  return v16;
}

uint64_t MRNowPlayingClientCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [MRClient alloc];

  return (uint64_t)[(MRClient *)v2 initWithData:a1];
}

uint64_t MRNowPlayingClientCreateExternalRepresentation(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"CFDataRef MRNowPlayingClientCreateExternalRepresentation(MRNowPlayingClientRef)"];
      uint64_t v7 = objc_opt_class();
      [v5 handleFailureInFunction:v6, @"MRNowPlayingPlayerPath.m", 52, @"Type mismatch, expecting %@ found %@", v7, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 data];
  uint64_t v3 = [v2 copy];

  return v3;
}

uint64_t MRNowPlayingClientCopy(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingClientRef MRNowPlayingClientCopy(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 59, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRNowPlayingClientCreateSkeletonFrom(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingClientRef MRNowPlayingClientCreateSkeletonFrom(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 73, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 skeleton];

  return v2;
}

void MRNowPlayingClientSetProcessIdentifier(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetProcessIdentifier(MRNowPlayingClientRef, pid_t)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 80, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setProcessIdentifier:a2];
}

void MRNowPlayingClientSetBundleIdentifier(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetBundleIdentifier(MRNowPlayingClientRef, CFStringRef)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 94, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setBundleIdentifier:a2];
}

void MRNowPlayingClientSetParentAppBundleIdentifier(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetParentAppBundleIdentifier(MRNowPlayingClientRef, CFStringRef)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 108, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setParentApplicationBundleIdentifier:a2];
}

uint64_t MRNowPlayingClientGetUserIdentifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"uid_t MRNowPlayingClientGetUserIdentifier(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 115, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 processUserIdentifier];

  return v2;
}

void MRNowPlayingClientSetUserIdentifier(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetUserIdentifier(MRNowPlayingClientRef, uid_t)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 122, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setProcessUserIdentifier:a2];
}

uint64_t MRNowPlayingClientGetNowPlayingVisibility(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingClientVisibility MRNowPlayingClientGetNowPlayingVisibility(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 129, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 visibility];

  return v2;
}

void MRNowPlayingClientSetNowPlayingVisibility(void *a1, unsigned int a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetNowPlayingVisibility(MRNowPlayingClientRef, MRNowPlayingClientVisibility)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 136, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setVisibility:a2];
}

float MRNowPlayingClientGetTintColor(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [NSString stringWithUTF8String:"MRColor MRNowPlayingClientGetTintColor(MRNowPlayingClientRef)"];
      uint64_t v12 = objc_opt_class();
      [v10 handleFailureInFunction:v11, @"MRNowPlayingPlayerPath.m", 143, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 tintColor];

  if (v2)
  {
    uint64_t v3 = [v1 tintColor];
    [v3 red];
    float v5 = v4;
    id v6 = [v1 tintColor];
    [v6 green];
    uint64_t v7 = [v1 tintColor];
    [v7 blue];
    id v8 = [v1 tintColor];
    [v8 alpha];
  }
  else
  {
    float v5 = -1.0;
  }

  return v5;
}

void MRNowPlayingClientSetTintColor(void *a1, float a2, float a3, float a4, float a5)
{
  id v17 = a1;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientSetTintColor(MRNowPlayingClientRef, MRColor)");
      uint64_t v16 = objc_opt_class();
      [v14 handleFailureInFunction:v15, @"MRNowPlayingPlayerPath.m", 160, @"Type mismatch, expecting %@ found %@", v16, objc_opt_class() file lineNumber description];
    }
  }
  if (MRColorIsNull(a2, a3, a4, a5))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MRColorComponents);
    *(float *)&double v10 = a2;
    [(MRColorComponents *)v9 setRed:v10];
    *(float *)&double v11 = a3;
    [(MRColorComponents *)v9 setGreen:v11];
    *(float *)&double v12 = a4;
    [(MRColorComponents *)v9 setBlue:v12];
    *(float *)&double v13 = a5;
    [(MRColorComponents *)v9 setAlpha:v13];
  }
  [v17 setTintColor:v9];
}

uint64_t MRNowPlayingClientSetDisplayName(void *a1, const char *a2)
{
  return [a1 setDisplayName:a2];
}

void *MRNowPlayingClientGetDisplayName(void *a1)
{
  id v1 = [a1 displayName];

  return v1;
}

void MRNowPlayingClientAppendBundleIdentifier(void *a1, uint64_t a2)
{
  id v9 = a1;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!a2) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientAppendBundleIdentifier(MRNowPlayingClientRef, CFStringRef)");
  uint64_t v8 = objc_opt_class();
  [v6 handleFailureInFunction:v7, @"MRNowPlayingPlayerPath.m", 204, @"Type mismatch, expecting %@ found %@", v8, objc_opt_class() file lineNumber description];

  if (a2)
  {
LABEL_4:
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    float v4 = [v9 extendedBundleIdentifierHierarchy];
    float v5 = (void *)[v3 initWithArray:v4];

    [v5 addObject:a2];
    [v9 setExtendedBundleIdentifierHierarchy:v5];
  }
LABEL_5:
}

uint64_t MRNowPlayingClientSetAppIconURL(void *a1, const char *a2)
{
  return [a1 setAppIcon:a2];
}

uint64_t MRNowPlayingClientCopyAppIconURL(void *a1)
{
  id v1 = [a1 appIcon];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRNowPlayingClientGetHasAuxillaryProperties(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      float v5 = [NSString stringWithUTF8String:"_Bool MRNowPlayingClientGetHasAuxillaryProperties(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 228, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 hasAuxiliaryProperties];

  return v2;
}

uint64_t MRNowPlayingClientEqualToClient(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MRNowPlayingClientEqualToClient(MRNowPlayingClientRef, MRNowPlayingClientRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 236, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MRNowPlayingClientEqualToClient(MRNowPlayingClientRef, MRNowPlayingClientRef)");
    uint64_t v12 = objc_opt_class();
    [v10 handleFailureInFunction:v11, @"MRNowPlayingPlayerPath.m", 237, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  if (v3 == v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v3 isEqual:v4];
  }

  return v5;
}

void MRNowPlayingClientMerge(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientMerge(MRNowPlayingClientRef, MRNowPlayingClientRef)");
    uint64_t v6 = objc_opt_class();
    [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 246, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];

    if (!v3) {
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingClientMerge(MRNowPlayingClientRef, MRNowPlayingClientRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 247, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
  }
  if (v10) {
    [v10 mergeFrom:v3];
  }
LABEL_8:
}

uint64_t MRNowPlayingPlayerCopy(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingPlayerRef MRNowPlayingPlayerCopy(MRNowPlayingPlayerRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 267, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRNowPlayingPlayerCreateSkeletonFrom(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingPlayerRef MRNowPlayingPlayerCreateSkeletonFrom(MRNowPlayingClientRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 274, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 skeleton];

  return v2;
}

void MRNowPlayingPlayerSetIdentifier(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerSetIdentifier(MRNowPlayingPlayerRef, CFStringRef)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 281, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setIdentifier:a2];
}

void MRNowPlayingPlayerSetDisplayName(void *a1, uint64_t a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerSetDisplayName(MRNowPlayingPlayerRef, CFStringRef)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 288, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setDisplayName:a2];
}

void MRNowPlayingPlayerSetAudioSessionType(void *a1, unsigned int a2)
{
  id v6 = a1;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerSetAudioSessionType(MRNowPlayingPlayerRef, MRNowPlayingPlayerAudioSessionType)");
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRNowPlayingPlayerPath.m", 295, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [v6 setAudioSessionType:a2];
}

void *MRNowPlayingPlayerGetDisplayName(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFStringRef MRNowPlayingPlayerGetDisplayName(MRNowPlayingPlayerRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 309, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 displayName];

  return v2;
}

uint64_t MRNowPlayingPlayerGetAudioSessionType(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingPlayerAudioSessionType MRNowPlayingPlayerGetAudioSessionType(MRNowPlayingPlayerRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 316, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 audioSessionType];

  return v2;
}

__CFString *MRNowPlayingPlayerAudioSessionTypeCopyDescription(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E57D78D0[a1];
  }
}

uint64_t MRNowPlayingPlayerGetHasAuxillaryProperties(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"_Bool MRNowPlayingPlayerGetHasAuxillaryProperties(MRNowPlayingPlayerRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 341, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 hasAuxiliaryProperties];

  return v2;
}

uint64_t MRNowPlayingPlayerCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [MRPlayer alloc];

  return (uint64_t)[(MRPlayer *)v2 initWithData:a1];
}

uint64_t MRNowPlayingPlayerCreateExternalRepresentation(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRNowPlayingPlayerEqualToPlayer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MRNowPlayingPlayerEqualToPlayer(MRNowPlayingPlayerRef, MRNowPlayingPlayerRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 360, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MRNowPlayingPlayerEqualToPlayer(MRNowPlayingPlayerRef, MRNowPlayingPlayerRef)");
    uint64_t v12 = objc_opt_class();
    [v10 handleFailureInFunction:v11, @"MRNowPlayingPlayerPath.m", 361, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  if (v3 == v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v3 isEqual:v4];
  }

  return v5;
}

void MRNowPlayingPlayerMerge(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerMerge(MRNowPlayingPlayerRef, MRNowPlayingPlayerRef)");
    uint64_t v6 = objc_opt_class();
    [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 370, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];

    if (!v3) {
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerMerge(MRNowPlayingPlayerRef, MRNowPlayingPlayerRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 371, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
  }
  if (v10) {
    [v10 mergeFrom:v3];
  }
LABEL_8:
}

uint64_t MRNowPlayingPlayerPathCreateSkeletonFrom(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRNowPlayingPlayerPathRef MRNowPlayingPlayerPathCreateSkeletonFrom(MRNowPlayingPlayerPathRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 397, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 skeleton];

  return v2;
}

void MRNowPlayingPlayerPathSetOrigin(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetOrigin(MRNowPlayingPlayerPathRef, MROriginRef)");
    uint64_t v6 = objc_opt_class();
    [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 426, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];

    if (!v3) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetOrigin(MRNowPlayingPlayerPathRef, MROriginRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 427, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  [v10 setOrigin:v3];
}

void MRNowPlayingPlayerPathSetClient(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetClient(MRNowPlayingPlayerPathRef, MRNowPlayingClientRef)");
    uint64_t v6 = objc_opt_class();
    [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 435, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];

    if (!v3) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetClient(MRNowPlayingPlayerPathRef, MRNowPlayingClientRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 436, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  [v10 setClient:v3];
}

void MRNowPlayingPlayerPathSetPlayer(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetPlayer(MRNowPlayingPlayerPathRef, MRNowPlayingPlayerRef)");
    uint64_t v6 = objc_opt_class();
    [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 444, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];

    if (!v3) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRNowPlayingPlayerPathSetPlayer(MRNowPlayingPlayerPathRef, MRNowPlayingPlayerRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRNowPlayingPlayerPath.m", 445, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  [v10 setPlayer:v3];
}

uint64_t MRNowPlayingPlayerPathCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [MRPlayerPath alloc];

  return (uint64_t)[(MRPlayerPath *)v2 initWithData:a1];
}

uint64_t MRNowPlayingPlayerPathCreateExternalRepresentation(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFDataRef MRNowPlayingPlayerPathCreateExternalRepresentation(MRNowPlayingPlayerPathRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 457, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 data];

  return v2;
}

uint64_t MRNowPlayingPlayerPathClientEqualToPlayerPathClient(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool MRNowPlayingPlayerPathClientEqualToPlayerPathClient(MRNowPlayingPlayerPathRef, MRNowPlayingPlayerPathRef)");
    uint64_t v13 = objc_opt_class();
    [v11 handleFailureInFunction:v12, @"MRNowPlayingPlayerPath.m", 474, @"Type mismatch, expecting %@ found %@", v13, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool MRNowPlayingPlayerPathClientEqualToPlayerPathClient(MRNowPlayingPlayerPathRef, MRNowPlayingPlayerPathRef)");
    uint64_t v16 = objc_opt_class();
    [v14 handleFailureInFunction:v15, @"MRNowPlayingPlayerPath.m", 475, @"Type mismatch, expecting %@ found %@", v16, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  if (v3 == v4)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v5 = [v3 origin];
    uint64_t v6 = [v4 origin];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [v3 client];
      uint64_t v8 = [v4 client];
      uint64_t v9 = [v7 isEqual:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

uint64_t MRNowPlayingPlayerPathGetIsResolved(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"_Bool MRNowPlayingPlayerPathGetIsResolved(MRNowPlayingPlayerPathRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 483, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 isResolved];

  return v2;
}

void MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  id v7 = a1;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal(MRNowPlayingPlayerPathRef, __strong dispatch_queue_t, void (^__strong)(MRNowPlayingPlayerPathRef, _Bool))");
    uint64_t v13 = objc_opt_class();
    [v11 handleFailureInFunction:v12, @"MRNowPlayingPlayerPath.m", 511, @"Type mismatch, expecting %@ found %@", v13, objc_opt_class() file lineNumber description];

    if (!v6) {
      goto LABEL_12;
    }
  }
  else if (!v6)
  {
    goto LABEL_12;
  }
  if (!v5)
  {
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  if ([v7 isResolved])
  {
    if (!v7)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal(MRNowPlayingPlayerPathRef, __strong dispatch_queue_t, void (^__strong)(MRNowPlayingPlayerPathRef, _Bool))");
      [v14 handleFailureInFunction:v15 file:@"MRNowPlayingPlayerPath.m" lineNumber:517 description:@"NULL playerPath cannot be 'resolved'"];
    }
    char v9 = [v7 isLocal];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke;
    block[3] = &unk_1E57D7778;
    id v10 = (id *)v19;
    v19[0] = v6;
    v19[1] = v7;
    char v20 = v9;
    dispatch_async(v5, block);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke_2;
    v16[3] = &unk_1E57D2318;
    id v10 = &v17;
    id v17 = v6;
    MRMediaRemoteNowPlayingResolvePlayerPath(v7, v5, v16);
  }

LABEL_12:
}

uint64_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t IsLocal = MRNowPlayingPlayerPathIsLocal(a2);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);

  return v5(v3, a2, IsLocal);
}

uint64_t MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync(void *a1, void *a2)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync(MRNowPlayingPlayerPathRef, MRNowPlayingPlayerPathRef *)");
      uint64_t v12 = objc_opt_class();
      [v10 handleFailureInFunction:v11, @"MRNowPlayingPlayerPath.m", 531, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__33;
  long long v21 = __Block_byref_object_dispose__33;
  id v22 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v6 = [v5 workerQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync_block_invoke;
  v13[3] = &unk_1E57D77A0;
  id v15 = &v23;
  uint64_t v16 = &v17;
  id v7 = v4;
  id v14 = v7;
  MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal(a1, v6, v13);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a2) {
    *a2 = (id)v18[5];
  }
  uint64_t v8 = *((unsigned __int8 *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v8;
}

void sub_1951337C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync_block_invoke(void *a1, void *a2, char a3)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  dispatch_semaphore_t v4 = a1[4];

  return dispatch_semaphore_signal(v4);
}

uint64_t MRMediaRemoteNowPlayingPlayerPathCreateError(void *a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    BOOL v9 = 0;
    uint64_t v10 = 27;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"CFErrorRef MRMediaRemoteNowPlayingPlayerPathCreateError(MRNowPlayingPlayerPathRef)"];
    uint64_t v18 = objc_opt_class();
    [v16 handleFailureInFunction:v17, @"MRNowPlayingPlayerPath.m", 554, @"Type mismatch, expecting %@ found %@", v18, objc_opt_class() file lineNumber description];
  }
  uint64_t v2 = [v1 origin];

  if (!v2)
  {
    BOOL v9 = 0;
    uint64_t v10 = 5;
    goto LABEL_15;
  }
  uint64_t v3 = [v1 client];
  if (!v3) {
    goto LABEL_14;
  }
  dispatch_semaphore_t v4 = (void *)v3;
  uint64_t v5 = [v1 client];
  if (![v5 processIdentifier])
  {

    goto LABEL_14;
  }
  id v6 = [v1 client];
  id v7 = [v6 bundleIdentifier];

  if (!v7)
  {
LABEL_14:
    BOOL v9 = 0;
    uint64_t v10 = 35;
    goto LABEL_15;
  }
  uint64_t v8 = [v1 player];

  BOOL v9 = v8 != 0;
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 29;
  }
LABEL_15:
  uint64_t v19 = @"playerPathDescription";
  uint64_t v11 = [v1 description];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  if (!v11) {

  }
  if (v9) {
    uint64_t ErrorWithUserInfo = 0;
  }
  else {
    uint64_t ErrorWithUserInfo = MRMediaRemoteCreateErrorWithUserInfo(v10, (uint64_t)v13);
  }

  return ErrorWithUserInfo;
}

uint64_t MRNowPlayingPlayerPathCopyStringRepresentation(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      dispatch_semaphore_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFStringRef MRNowPlayingPlayerPathCopyStringRepresentation(MRNowPlayingPlayerRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRNowPlayingPlayerPath.m", 582, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 description];

  return v2;
}

uint64_t MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "MRNowPlayingPlayerPathRef MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(MRNowPlayingPlayerPathRef, MROriginRef)");
      uint64_t v11 = objc_opt_class();
      [v9 handleFailureInFunction:v10, @"MRNowPlayingPlayerPath.m", 589, @"Type mismatch, expecting %@ found %@", v11, objc_opt_class() file lineNumber description];
    }
  }
  dispatch_semaphore_t v4 = [MRPlayerPath alloc];
  uint64_t v5 = [v3 client];
  uint64_t v6 = [v3 player];
  uint64_t v7 = [(MRPlayerPath *)v4 initWithOrigin:a2 client:v5 player:v6];

  return v7;
}

void *MRMediaRemoteGetLocalNowPlayingClient()
{
  v0 = +[MRClient localClient];

  return v0;
}

void *MRMediaRemoteGetDefaultNowPlayingPlayer()
{
  v0 = +[MRPlayer defaultPlayer];

  return v0;
}

void *MRMediaRemoteGetLocalNowPlayingPlayerPath()
{
  v0 = +[MRPlayerPath localPlayerPath];

  return v0;
}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_7(id *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = [NSString stringWithFormat:@"Redirecting to cluster leader: %@", v3];
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a1[4];
    id v7 = a1[5];
    *(_DWORD *)buf = 138543874;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v3)
  {
    id v8 = a1[5];
    v18[0] = @"MREndpointConnectionCorrelationIDUserInfoKey";
    v18[1] = @"MREndpointConnectionReasonUserInfoKey";
    v19[0] = v8;
    v19[1] = @"clusterLeaderRedirection";
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_99;
    v11[3] = &unk_1E57D7860;
    id v16 = a1[7];
    id v12 = v3;
    id v13 = a1[4];
    id v14 = a1[5];
    id v15 = a1[6];
    id v17 = a1[8];
    [v12 connectToExternalDeviceWithUserInfo:v9 completion:v11];
  }
  else
  {
    uint64_t v10 = (void (**)(id, void, void *))a1[7];
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:48 description:@"Could not resolve playerPath for clusterLeaderRedirection"];
    v10[2](v10, 0, v9);
  }
}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_99(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    dispatch_semaphore_t v4 = [*(id *)(a1 + 32) origin];
    if (v4)
    {
      uint64_t v5 = NSString;
      id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
      id v7 = [v5 stringWithFormat:@"Connect to origin: %@, endpoint: %@", v4, v6];

      id v8 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v11 = [*(id *)(a1 + 56) playerPathByRedirectingToOrigin:v4];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 64);
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:117 description:@"Connected to endpoint but endpoint disconnected shortly after (could not get origin)"];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
    }
  }
}

uint64_t MRMediaRemoteNowPlayingCopyResolvedPlayerPath(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (uint64_t)v3;
  if (([v3 isResolved] & 1) == 0)
  {
    uint64_t v5 = +[MRMediaRemoteServiceClient sharedServiceClient];
    id v6 = [v5 activePlayerPath];

    if (!v6) {
      goto LABEL_13;
    }
    id v7 = [v3 origin];
    uint64_t v8 = [v6 origin];
    uint64_t v9 = [v3 client];
    uint64_t v10 = [v6 client];
    uint64_t v11 = [v3 player];
    uint64_t v12 = [v6 player];
    __int16 v17 = a2;
    if (v7 && ![v7 isEqual:v8] || v9 && !objc_msgSend(v9, "isEqual:", v10))
    {
      id v13 = (void *)v8;
    }
    else
    {
      id v13 = (void *)v8;
      if (!v11 || [v11 isEqual:v12])
      {
        uint64_t v4 = [v6 copy];
        int v14 = 0;
        goto LABEL_12;
      }
    }
    int v14 = 1;
LABEL_12:

    a2 = v17;
    if (!v14)
    {
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    __int16 v15 = (void *)MRGetSharedService();
    uint64_t v4 = MRMediaRemoteServiceCopyResolvedPlayerPath(v15, v3, a2);
    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

void MRMediaRemoteRemovePlayerPathInvalidationHandler(uint64_t a1)
{
  id v2 = +[MRMediaRemoteServiceClient sharedServiceClient];
  [v2 removeInvalidationHandler:a1];
}

uint64_t _MRRegisterForGameControllerEventsMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGetVolumeControlCapabilitiesResultMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(_MRVolumeControlAvailabilityProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (_MRVolumeControlAvailabilityProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *MRHIDTouchPhaseCopyDescription(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E57D79E0[a1];
  }
}

uint64_t MRHIDTouchEventCopyDescription(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 8);
  if (v1 > 5) {
    id v2 = 0;
  }
  else {
    id v2 = off_1E57D79E0[v1];
  }
  return [[NSString alloc] initWithFormat:@"{\n\tpoint = {%f, %f}\n\tphase = %@\n\ttimestamp = %llu\n\tfinger = %u\n}", *(float *)a1, *(float *)(a1 + 4), v2, *(void *)(a1 + 16), *(unsigned int *)(a1 + 24)];
}

CFStringRef MRHIDButtonEventCopyDescription(unint64_t a1, char a2)
{
  id v2 = "true";
  if ((a2 & 1) == 0) {
    id v2 = "false";
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"{\n\tusagePage = %u\n\tusage = %u\n\tdown = %s\n}", a1, HIDWORD(a1), v2);
}

BOOL _MRPlayerClientParticipantsUpdateMessageProtobufReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v17 = objc_alloc_init(_MRPlaybackQueueParticipantProtobuf);
    [a1 addParticipants:v17];
    if (!PBReaderPlaceMark() || !_MRPlaybackQueueParticipantProtobufReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRSupportedCommandsProtobufReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(_MRCommandInfoProtobuf);
        [a1 addSupportedCommand:v17];
        if (!PBReaderPlaceMark() || (_MRCommandInfoProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t MRMediaRemoteApplicationSupportsBrowsableContent(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"Boolean MRMediaRemoteApplicationSupportsBrowsableContent(CFStringRef)"];
    [v6 handleFailureInFunction:v7, @"MRBrowsableContent.m", 41, @"Invalid parameter not satisfying: %@", @"bundleID" file lineNumber description];
  }
  v8[0] = @"com.apple.developer.playable-content";
  id v2 = (void *)MRMediaRemoteCopyApplicationEntitlements(a1, [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.developer.playable-content"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

id _MRMediaRemoteApplicationValueForKeyInBundle(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:a1];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
      id v6 = [v3 bundleURL];
      id v7 = [v5 bundleWithURL:v6];
      char v8 = [v7 infoDictionary];

      unsigned int v9 = [v8 objectForKey:a2];
    }
    else
    {
      unsigned int v9 = 0;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

uint64_t MRMediaRemoteApplicationSupportsSectionedBrowsing(uint64_t a1)
{
  uint64_t v1 = _MRMediaRemoteApplicationValueForKeyInBundle(a1, @"UIBrowsableContentSupportsSectionedBrowsing");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

uint64_t MRMediaRemoteApplicationSupportsImmediatePlayback(uint64_t a1)
{
  uint64_t v1 = _MRMediaRemoteApplicationValueForKeyInBundle(a1, @"UIBrowsableContentSupportsImmediatePlayback");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

uint64_t MRMediaRemoteBeginLoadingBrowsableContent(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v13 = a2;
  uint64_t v14 = a3;
  id v3 = a1;
  id v4 = [NSString alloc];
  uint64_t v5 = MRMediaRemoteIndexPathCopyDescription(&v13);
  id v6 = (void *)[v4 initWithFormat:@"bundleID=%@, indexPath=%@", v3, v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"beginLoadingBrowsableContent", 0];
  char v8 = v7;
  if (v6) {
    [v7 appendFormat:@" for %@", v6];
  }
  unsigned int v9 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v8;
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unint64_t v10 = (void *)MRGetSharedService();
  uint64_t v11 = MRMediaRemoteServiceBeginLoadingBrowsableContent(v10, v3, v13, v14);

  return v11;
}

__CFString *MRMediaRemoteIndexPathCopyDescription(void *a1)
{
  if (!a1) {
    return 0;
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (a1[1])
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      CFStringAppendFormat(Mutable, 0, @"%llu ", *(void *)(*a1 + 8 * v3));
      uint64_t v3 = v4;
    }
    while (a1[1] > (unint64_t)v4++);
  }
  return Mutable;
}

void MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  char v8 = [v6 date];
  unsigned int v9 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v10 = [v9 UUIDString];

  id v11 = a1;
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"nowPlayingContentIdentifiers", v10];
  char v13 = v12;
  if (v11) {
    [v12 appendFormat:@" for %@", v11];
  }
  uint64_t v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v27 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  int v15 = (void *)MRGetSharedService();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers_block_invoke;
  v20[3] = &unk_1E57D7A78;
  id v21 = v11;
  char v22 = @"nowPlayingContentIdentifiers";
  id v23 = v10;
  id v24 = v8;
  id v25 = v5;
  id v16 = v5;
  id v17 = v8;
  id v18 = v10;
  id v19 = v11;
  MRMediaRemoteServiceCopyBrowsableContentNowPlayingIdentifiers(v15, v19, v7, v20);
}

uint64_t __MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  id v5 = _MRLogForCategory(0xAuLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      if (!v6) {
        goto LABEL_14;
      }
      uint64_t v8 = a1[5];
      uint64_t v7 = a1[6];
      uint64_t v9 = a1[4];
      unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[7]];
      int v26 = 138544386;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      uint64_t v29 = v7;
      __int16 v30 = 2112;
      uint64_t v31 = a2;
      __int16 v32 = 2114;
      uint64_t v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      unint64_t v12 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      char v13 = v5;
      uint32_t v14 = 52;
      goto LABEL_13;
    }
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v19 = a1[5];
    uint64_t v20 = a1[6];
    unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:a1[7]];
    int v26 = 138544130;
    uint64_t v27 = v19;
    __int16 v28 = 2114;
    uint64_t v29 = v20;
    __int16 v30 = 2112;
    uint64_t v31 = a2;
    __int16 v32 = 2048;
    uint64_t v33 = v21;
    unint64_t v12 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_10;
  }
  if (v4)
  {
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v16 = a1[5];
    uint64_t v15 = a1[6];
    uint64_t v17 = a1[4];
    unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:a1[7]];
    int v26 = 138544130;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    __int16 v30 = 2114;
    uint64_t v31 = v17;
    __int16 v32 = 2048;
    uint64_t v33 = v18;
    unint64_t v12 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_10:
    char v13 = v5;
    uint32_t v14 = 42;
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v22 = a1[5];
  uint64_t v23 = a1[6];
  unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:a1[7]];
  int v26 = 138543874;
  uint64_t v27 = v22;
  __int16 v28 = 2114;
  uint64_t v29 = v23;
  __int16 v30 = 2048;
  uint64_t v31 = v24;
  unint64_t v12 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
  char v13 = v5;
  uint32_t v14 = 32;
LABEL_13:
  _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v26, v14);

LABEL_14:
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteBrowsableContentSupportsPlaybackProgress(void *a1, const void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a4;
  unint64_t v10 = [v8 date];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v12 = [v11 UUIDString];

  id v13 = a1;
  id v14 = [NSString alloc];
  uint64_t v15 = MRMediaRemoteIndexPathCopyDescription(&v33);
  uint64_t v16 = (void *)[v14 initWithFormat:@"bundleID=%@, indexPath=%@", v13, v15];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"supportsBrowsableContentPlaybackProgress", v12];
  uint64_t v18 = v17;
  if (v16) {
    [v17 appendFormat:@" for %@", v16];
  }
  uint64_t v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v20 = (void *)MRGetSharedService();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __MRMediaRemoteBrowsableContentSupportsPlaybackProgress_block_invoke;
  v27[3] = &unk_1E57D7AA0;
  id v28 = v16;
  uint64_t v29 = @"supportsBrowsableContentPlaybackProgress";
  id v30 = v12;
  id v31 = v10;
  id v32 = v7;
  uint64_t v21 = v33;
  uint64_t v22 = v34;
  id v23 = v7;
  id v24 = v10;
  id v25 = v12;
  id v26 = v16;
  MRMediaRemoteServiceGetBrowsableContentSupportsPlaybackProgress(v20, v13, v21, v22, v9, v27);
}

uint64_t __MRMediaRemoteBrowsableContentSupportsPlaybackProgress_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithBool:a2];

  uint64_t v5 = a1[4];
  BOOL v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      unint64_t v10 = [NSNumber numberWithBool:a2];
      uint64_t v11 = a1[4];
      unint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:a1[7]];
      int v31 = 138544386;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = v13;
      id v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v15 = v6;
      uint32_t v16 = 52;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v24 = a1[5];
      uint64_t v25 = a1[6];
      unint64_t v10 = [NSNumber numberWithBool:a2];
      unint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:a1[7]];
      int v31 = 138544130;
      uint64_t v32 = v24;
      __int16 v33 = 2114;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v26;
      id v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      uint64_t v15 = v6;
      uint32_t v16 = 42;
    }
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v31, v16);
  }
  else
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v18 = a1[5];
      uint64_t v17 = a1[6];
      uint64_t v19 = (void *)a1[4];
      unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[7]];
      int v31 = 138544130;
      uint64_t v32 = v18;
      __int16 v33 = 2114;
      uint64_t v34 = v17;
      __int16 v35 = 2114;
      uint64_t v36 = v19;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v27 = a1[5];
      uint64_t v28 = a1[6];
      unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[7]];
      int v31 = 138543874;
      uint64_t v32 = v27;
      __int16 v33 = 2114;
      uint64_t v34 = v28;
      __int16 v35 = 2048;
      uint64_t v36 = v29;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
  }

LABEL_15:
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteGetCountOfBrowsableContentChildItems(void *a1, const void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  __int16 v33 = a2;
  uint64_t v34 = a3;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a4;
  unint64_t v10 = [v8 date];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v12 = [v11 UUIDString];

  id v13 = a1;
  id v14 = [NSString alloc];
  uint64_t v15 = MRMediaRemoteIndexPathCopyDescription(&v33);
  uint32_t v16 = (void *)[v14 initWithFormat:@"bundleID=%@, indexPath=%@", v13, v15];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"countOfBrowsableContentChildItems", v12];
  uint64_t v18 = v17;
  if (v16) {
    [v17 appendFormat:@" for %@", v16];
  }
  uint64_t v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v20 = (void *)MRGetSharedService();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __MRMediaRemoteGetCountOfBrowsableContentChildItems_block_invoke;
  v27[3] = &unk_1E57D7AC8;
  id v28 = v16;
  uint64_t v29 = @"countOfBrowsableContentChildItems";
  id v30 = v12;
  id v31 = v10;
  id v32 = v7;
  uint64_t v21 = v33;
  uint64_t v22 = v34;
  id v23 = v7;
  id v24 = v10;
  id v25 = v12;
  id v26 = v16;
  MRMediaRemoteServiceGetCountOfBrowsableContentChildItems(v20, v13, v21, v22, v9, v27);
}

uint64_t __MRMediaRemoteGetCountOfBrowsableContentChildItems_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:a2];

  uint64_t v5 = a1[4];
  BOOL v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      unint64_t v10 = [NSNumber numberWithUnsignedLongLong:a2];
      uint64_t v11 = a1[4];
      unint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:a1[7]];
      int v31 = 138544386;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = v13;
      id v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v15 = v6;
      uint32_t v16 = 52;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v24 = a1[5];
      uint64_t v25 = a1[6];
      unint64_t v10 = [NSNumber numberWithUnsignedLongLong:a2];
      unint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:a1[7]];
      int v31 = 138544130;
      uint64_t v32 = v24;
      __int16 v33 = 2114;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v26;
      id v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      uint64_t v15 = v6;
      uint32_t v16 = 42;
    }
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v31, v16);
  }
  else
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v18 = a1[5];
      uint64_t v17 = a1[6];
      uint64_t v19 = (void *)a1[4];
      unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[7]];
      int v31 = 138544130;
      uint64_t v32 = v18;
      __int16 v33 = 2114;
      uint64_t v34 = v17;
      __int16 v35 = 2114;
      uint64_t v36 = v19;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v27 = a1[5];
      uint64_t v28 = a1[6];
      unint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[7]];
      int v31 = 138543874;
      uint64_t v32 = v27;
      __int16 v33 = 2114;
      uint64_t v34 = v28;
      __int16 v35 = 2048;
      uint64_t v36 = v29;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
  }

LABEL_15:
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteGetBrowsableContentChildItems(void *a1, const void *a2, uint64_t a3, int64_t a4, int64_t a5, void *a6, void *a7)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  id v11 = a7;
  unint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a6;
  id v14 = [v12 date];
  uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
  uint32_t v16 = [v15 UUIDString];

  id v17 = a1;
  id v18 = [NSString alloc];
  uint64_t v19 = MRMediaRemoteIndexPathCopyDescription(&v38);
  int64_t v31 = a5;
  uint64_t v20 = (void *)[v18 initWithFormat:@"bundleID=%@, indexPath=%@, location=%ld, length=%ld", v17, v19, a4, a5];

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"browsableContentChildItems", v16];
  uint64_t v22 = v21;
  if (v20) {
    [v21 appendFormat:@" for %@", v20];
  }
  uint32_t v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v24 = (void *)MRGetSharedService();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __MRMediaRemoteGetBrowsableContentChildItems_block_invoke;
  v32[3] = &unk_1E57D7A78;
  id v33 = v20;
  uint64_t v34 = @"browsableContentChildItems";
  id v35 = v16;
  id v36 = v14;
  id v37 = v11;
  uint64_t v26 = v38;
  uint64_t v25 = v39;
  id v27 = v11;
  id v28 = v14;
  id v29 = v16;
  id v30 = v20;
  MRMediaRemoteServiceCopyBrowsableContentChildItems(v24, v17, v26, v25, a4, v31, v13, v32);
}

uint64_t __MRMediaRemoteGetBrowsableContentChildItems_block_invoke(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MRContentItemsCopyMinimalReadableDescription(a2, 0);

  uint64_t v5 = a1[4];
  BOOL v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_14;
      }
      uint64_t v18 = a1[5];
      uint64_t v17 = a1[6];
      uint64_t v19 = (__CFString *)a1[4];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [(__CFString *)v13 timeIntervalSinceDate:a1[7]];
      int v36 = 138544130;
      uint64_t v37 = v18;
      __int16 v38 = 2114;
      uint64_t v39 = v17;
      __int16 v40 = 2114;
      uint64_t v41 = v19;
      __int16 v42 = 2048;
      uint64_t v43 = v20;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v7) {
        goto LABEL_14;
      }
      uint64_t v32 = a1[5];
      uint64_t v33 = a1[6];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [(__CFString *)v13 timeIntervalSinceDate:a1[7]];
      int v36 = 138543874;
      uint64_t v37 = v32;
      __int16 v38 = 2114;
      uint64_t v39 = v33;
      __int16 v40 = 2048;
      uint64_t v41 = v34;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v22 = v6;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v36, v23);
    goto LABEL_13;
  }
  if (v5)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    unint64_t v10 = MRContentItemsCopyMinimalReadableDescription(a2, 0);
    uint64_t v11 = a1[4];
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
    id v13 = v10;
    id v14 = [v12 date];
    [v14 timeIntervalSinceDate:a1[7]];
    uint64_t v16 = v15;

    int v36 = 138544386;
    uint64_t v37 = v8;
    __int16 v38 = 2114;
    uint64_t v39 = v9;
    __int16 v40 = 2112;
    uint64_t v41 = v10;
    __int16 v42 = 2114;
    uint64_t v43 = v11;
    __int16 v44 = 2048;
    uint64_t v45 = v16;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", (uint8_t *)&v36, 0x34u);

LABEL_13:
    goto LABEL_14;
  }
  if (v7)
  {
    uint64_t v24 = a1[5];
    uint64_t v25 = a1[6];
    uint64_t v26 = MRContentItemsCopyMinimalReadableDescription(a2, 0);
    id v27 = (void *)MEMORY[0x1E4F1C9C8];
    id v28 = v26;
    id v29 = [v27 date];
    [v29 timeIntervalSinceDate:a1[7]];
    uint64_t v31 = v30;

    int v36 = 138544130;
    uint64_t v37 = v24;
    __int16 v38 = 2114;
    uint64_t v39 = v25;
    __int16 v40 = 2112;
    uint64_t v41 = v26;
    __int16 v42 = 2048;
    uint64_t v43 = v31;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", (uint8_t *)&v36, 0x2Au);
  }
LABEL_14:

  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteRequestPlaybackInitialization(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v4 = MRMediaRemoteIndexPathCopyDescription(&v10);
  id v5 = a1;
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"browsableContentPlaybackInitalization", v5];
  BOOL v7 = v6;
  if (v4) {
    [v6 appendFormat:@" for %@", v4];
  }
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v9 = (void *)MRGetSharedService();
  MRMediaRemoteServiceRequestPlaybackInitialization(v9, v5, v10, v11);
}

void MRMediaRemotePostBrowsableContentNotification(void *a1, void *a2)
{
  uint64_t v4 = (void *)MRGetSharedService();

  MRMediaRemoteServicePostBrowsableContentNotification(v4, a1, a2);
}

void MRMediaRemoteGetContentItemsForIdentifiers(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a3;
  unint64_t v10 = [v8 date];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v12 = [v11 UUIDString];

  id v13 = a1;
  id v14 = a2;
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"bundleID=%@, identifiers=%@", v13, v14];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"supportedBrowsableContentAPIs", v12];
  uint64_t v17 = v16;
  if (v15) {
    [v16 appendFormat:@" for %@", v15];
  }
  uint64_t v18 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v19 = (void *)MRGetSharedService();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke;
  v24[3] = &unk_1E57D7AF0;
  id v25 = v15;
  uint64_t v26 = @"supportedBrowsableContentAPIs";
  id v27 = v12;
  id v28 = v10;
  id v29 = v7;
  id v20 = v7;
  id v21 = v10;
  id v22 = v12;
  id v23 = v15;
  MRMediaRemoteServiceGetContentItemsForIdentifiers(v19, v13, v14, v9, v24);
}

uint64_t __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  id v7 = _MRLogForCategory(0xAuLL);
  uint64_t v8 = v7;
  if (a2 && !a3)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v9) {
        goto LABEL_22;
      }
      uint64_t v11 = a1[5];
      uint64_t v10 = a1[6];
      uint64_t v12 = a1[4];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544386;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      uint64_t v40 = a2;
      __int16 v41 = 2114;
      uint64_t v42 = v12;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      uint64_t v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v16 = v8;
      uint32_t v17 = 52;
      goto LABEL_16;
    }
    if (!v9) {
      goto LABEL_22;
    }
    uint64_t v28 = a1[5];
    uint64_t v29 = a1[6];
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v28;
    __int16 v37 = 2114;
    uint64_t v38 = v29;
    __int16 v39 = 2112;
    uint64_t v40 = a2;
    __int16 v41 = 2048;
    uint64_t v42 = v30;
    uint64_t v15 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (a3)
  {
    BOOL v18 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (!v18) {
        goto LABEL_22;
      }
      uint64_t v20 = a1[5];
      uint64_t v19 = a1[6];
      uint64_t v21 = a1[4];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544386;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      uint64_t v38 = v19;
      __int16 v39 = 2114;
      uint64_t v40 = a3;
      __int16 v41 = 2114;
      uint64_t v42 = v21;
      __int16 v43 = 2048;
      uint64_t v44 = v22;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
      goto LABEL_17;
    }
    if (v18) {
      __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1();
    }
  }
  else
  {
    BOOL v23 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v23) {
        goto LABEL_22;
      }
      uint64_t v25 = a1[5];
      uint64_t v24 = a1[6];
      uint64_t v26 = a1[4];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544130;
      uint64_t v36 = v25;
      __int16 v37 = 2114;
      uint64_t v38 = v24;
      __int16 v39 = 2114;
      uint64_t v40 = v26;
      __int16 v41 = 2048;
      uint64_t v42 = v27;
      uint64_t v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      uint64_t v16 = v8;
      uint32_t v17 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v35, v17);
LABEL_17:

      goto LABEL_22;
    }
    if (v23)
    {
      uint64_t v31 = a1[5];
      uint64_t v32 = a1[6];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138543874;
      uint64_t v36 = v31;
      __int16 v37 = 2114;
      uint64_t v38 = v32;
      __int16 v39 = 2048;
      uint64_t v40 = v33;
      uint64_t v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v16 = v8;
      uint32_t v17 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

void MRMediaRemoteSetBrowsableContentEndpoint(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", a1);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setBrowsableContentEndpoint", 0];
  uint64_t v4 = v3;
  if (v2) {
    [v3 appendFormat:@" for %@", v2];
  }
  id v5 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetBrowsableContentEndpoint((uint64_t)v6, a1);
  MRMediaRemoteServicePostBrowsableContentNotification(v6, @"kMRMediaRemoteBrowsableContentEndpointChangedNotification", 0);
}

void MRMediaRemoteGetSupportedBrowsableContentAPIs(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  uint64_t v8 = [v6 date];
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];

  id v11 = a1;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"supportedBrowsableContentAPIs", v10];
  id v13 = v12;
  if (v11) {
    [v12 appendFormat:@" for %@", v11];
  }
  uint64_t v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = (void *)MRGetSharedService();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __MRMediaRemoteGetSupportedBrowsableContentAPIs_block_invoke;
  v20[3] = &unk_1E57D7B18;
  id v21 = v11;
  uint64_t v22 = @"supportedBrowsableContentAPIs";
  id v23 = v10;
  id v24 = v8;
  id v25 = v5;
  id v16 = v5;
  id v17 = v8;
  id v18 = v10;
  id v19 = v11;
  MRMediaRemoteServiceGetSupportedBrowsableContentAPI(v15, v19, v7, v20);
}

void __MRMediaRemoteGetSupportedBrowsableContentAPIs_block_invoke(void *a1, uint64_t a2, __CFError *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MRMediaRemoteCopyBrowsableContentAPIMaskDescription(a2);
  uint64_t v7 = a1[4];
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  uint64_t v9 = v8;
  if (!a3 && v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10) {
        goto LABEL_22;
      }
      uint64_t v12 = a1[5];
      uint64_t v11 = a1[6];
      uint64_t v13 = a1[4];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v37 = 138544386;
      uint64_t v38 = v12;
      __int16 v39 = 2114;
      uint64_t v40 = v11;
      __int16 v41 = 2112;
      uint64_t v42 = v6;
      __int16 v43 = 2114;
      uint64_t v44 = v13;
      __int16 v45 = 2048;
      uint64_t v46 = v15;
      id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v17 = v9;
      uint32_t v18 = 52;
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = a1[5];
    uint64_t v30 = a1[6];
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v37 = 138544130;
    uint64_t v38 = v29;
    __int16 v39 = 2114;
    uint64_t v40 = v30;
    __int16 v41 = 2112;
    uint64_t v42 = v6;
    __int16 v43 = 2048;
    uint64_t v44 = v31;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (a3)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v19) {
        goto LABEL_22;
      }
      uint64_t v21 = a1[5];
      uint64_t v20 = a1[6];
      uint64_t v22 = a1[4];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v37 = 138544386;
      uint64_t v38 = v21;
      __int16 v39 = 2114;
      uint64_t v40 = v20;
      __int16 v41 = 2114;
      uint64_t v42 = a3;
      __int16 v43 = 2114;
      uint64_t v44 = v22;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);
      goto LABEL_17;
    }
    if (v19) {
      __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1();
    }
  }
  else
  {
    BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v24) {
        goto LABEL_22;
      }
      uint64_t v26 = a1[5];
      uint64_t v25 = a1[6];
      uint64_t v27 = (void *)a1[4];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v37 = 138544130;
      uint64_t v38 = v26;
      __int16 v39 = 2114;
      uint64_t v40 = v25;
      __int16 v41 = 2114;
      uint64_t v42 = v27;
      __int16 v43 = 2048;
      uint64_t v44 = v28;
      id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      id v17 = v9;
      uint32_t v18 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v24)
    {
      uint64_t v32 = a1[5];
      uint64_t v33 = a1[6];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v37 = 138543874;
      uint64_t v38 = v32;
      __int16 v39 = 2114;
      uint64_t v40 = v33;
      __int16 v41 = 2048;
      uint64_t v42 = v34;
      id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v17 = v9;
      uint32_t v18 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  uint64_t v35 = a1[8];
  if (v35)
  {
    if (a3) {
      CFIndex Code = CFErrorGetCode(a3);
    }
    else {
      CFIndex Code = 0;
    }
    (*(void (**)(uint64_t, uint64_t, CFIndex))(v35 + 16))(v35, a2, Code);
  }
}

__CFString *MRMediaRemoteCopyBrowsableContentAPIMaskDescription(char a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = v3;
  if (a1)
  {
    [v3 addObject:@"BeginLoadingContent"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"PlaybackProgress"];
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v4 addObject:@"ContentFetching"];
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v4 addObject:@"InitiatePlayback"];
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v4 addObject:@"InitializePlaybackQueue"];
  if ((a1 & 0x40) != 0) {
LABEL_7:
  }
    [v4 addObject:@"ContextChanges"];
LABEL_8:
  if ([v4 count])
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [v4 componentsJoinedByString:@", "];
    uint64_t v7 = (__CFString *)[v5 initWithFormat:@"(%@)", v6];
  }
  else
  {
    uint64_t v7 = @"(None)";
  }

  return v7;
}

void MRMediaRemoteGetAppsSupportingBrowsableContentAPIs(unsigned int a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = MRMediaRemoteCopyBrowsableContentAPIMaskDescription(a1);
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  BOOL v10 = [v9 UUIDString];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"appsSupportingBrowsableContentAPIs", v10];
  uint64_t v12 = v11;
  if (v7) {
    [v11 appendFormat:@" for %@", v7];
  }
  uint64_t v13 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v14 = (void *)MRGetSharedService();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __MRMediaRemoteGetAppsSupportingBrowsableContentAPIs_block_invoke;
  v19[3] = &unk_1E57D7B40;
  uint64_t v20 = v7;
  uint64_t v21 = @"appsSupportingBrowsableContentAPIs";
  id v22 = v10;
  id v23 = v8;
  id v24 = v5;
  id v15 = v5;
  id v16 = v8;
  id v17 = v10;
  uint32_t v18 = v7;
  MRMediaRemoteServiceGetAppsSupportingBrowsableContentAPIs(v14, a1, v6, v19);
}

uint64_t __MRMediaRemoteGetAppsSupportingBrowsableContentAPIs_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  uint64_t v7 = _MRLogForCategory(0xAuLL);
  uint64_t v8 = v7;
  if (a2 && !a3)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v9) {
        goto LABEL_22;
      }
      uint64_t v11 = a1[5];
      uint64_t v10 = a1[6];
      uint64_t v12 = a1[4];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544386;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      uint64_t v40 = a2;
      __int16 v41 = 2114;
      uint64_t v42 = v12;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      id v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v16 = v8;
      uint32_t v17 = 52;
      goto LABEL_16;
    }
    if (!v9) {
      goto LABEL_22;
    }
    uint64_t v28 = a1[5];
    uint64_t v29 = a1[6];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v28;
    __int16 v37 = 2114;
    uint64_t v38 = v29;
    __int16 v39 = 2112;
    uint64_t v40 = a2;
    __int16 v41 = 2048;
    uint64_t v42 = v30;
    id v15 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (a3)
  {
    BOOL v18 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (!v18) {
        goto LABEL_22;
      }
      uint64_t v20 = a1[5];
      uint64_t v19 = a1[6];
      uint64_t v21 = a1[4];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544386;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      uint64_t v38 = v19;
      __int16 v39 = 2114;
      uint64_t v40 = a3;
      __int16 v41 = 2114;
      uint64_t v42 = v21;
      __int16 v43 = 2048;
      uint64_t v44 = v22;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
      goto LABEL_17;
    }
    if (v18) {
      __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1();
    }
  }
  else
  {
    BOOL v23 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v23) {
        goto LABEL_22;
      }
      uint64_t v25 = a1[5];
      uint64_t v24 = a1[6];
      uint64_t v26 = a1[4];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138544130;
      uint64_t v36 = v25;
      __int16 v37 = 2114;
      uint64_t v38 = v24;
      __int16 v39 = 2114;
      uint64_t v40 = v26;
      __int16 v41 = 2048;
      uint64_t v42 = v27;
      id v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      id v16 = v8;
      uint32_t v17 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v35, v17);
LABEL_17:

      goto LABEL_22;
    }
    if (v23)
    {
      uint64_t v31 = a1[5];
      uint64_t v32 = a1[6];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v35 = 138543874;
      uint64_t v36 = v31;
      __int16 v37 = 2114;
      uint64_t v38 = v32;
      __int16 v39 = 2048;
      uint64_t v40 = v33;
      id v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v16 = v8;
      uint32_t v17 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

void MRMediaRemoteSetSupportedBrowsableContentAPIs(unsigned int a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = MRMediaRemoteCopyBrowsableContentAPIMaskDescription(a1);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setSupportedBrowsableContentAPIs", 0];
  BOOL v9 = v8;
  if (v7) {
    [v8 appendFormat:@" for %@", v7];
  }
  uint64_t v10 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v9;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v11 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetSupportedBrowsableContentAPI(v11, a1, v6, v5);
}

void MRMediaRemoteInvalidateBrowsableContent()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"invalidateBrowsableContentDataSource", 0];
  uint64_t v1 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v4 = v0;
    _os_log_impl(&dword_194F3C000, v1, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v2 = (void *)MRGetSharedService();
  MRMediaRemoteServicePostBrowsableContentNotification(v2, @"kMRMediaRemoteApplicationInvalidatedBrowsableContentDataSourceNotification", 0);
}

void MRMediaRemoteUpdateNowPlayingIdentifiers(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithArray:a1];
  BOOL v9 = @"kMRMediaRemoteUpdatedNowPlayingIdentifiersInfoKey";
  v10[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setBrowsableContentNowPlayingIdentifiers", 0];
  uint64_t v4 = v3;
  if (v1) {
    [v3 appendFormat:@" for %@", v1];
  }
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v6 = (void *)MRGetSharedService();
  MRMediaRemoteServicePostBrowsableContentNotification(v6, @"kMRMediaRemoteBrowsableContentNowPlayingIdentifiersUpdatedNotification", v2);
}

void MRMediaRemoteUpdateBrowsableContentItems(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    uint64_t v7 = *MEMORY[0x1E4F1CF80];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation(v7, *(void **)(*((void *)&v18 + 1) + 8 * v8));
        [v2 addObject:ExternalRepresentation];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:0];
  uint64_t v24 = @"kMRMediaRemoteUpdatedContentItemsDataUserInfoKey";
  uint64_t v25 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v13 = (void *)[v12 initWithFormat:@"%@<%@>", @"setBrowsableContentItems", 0, (void)v18];
  uint64_t v14 = MRContentItemsCopyMinimalReadableDescription(v3, 0);

  if (v14)
  {
    id v15 = MRContentItemsCopyMinimalReadableDescription(v3, 0);
    [v13 appendFormat:@" for %@", v15];
  }
  id v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v23 = v13;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint32_t v17 = (void *)MRGetSharedService();
  MRMediaRemoteServicePostBrowsableContentNotification(v17, @"kMRMediaRemoteContentItemsUpdatedNotification", v11);
}

void MRMediaRemoteFinishedPlaybackInitialization(uint64_t a1, uint64_t a2, __CFError *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a1;
  v15[1] = a2;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a1 length:8 * a2];
  long long v18 = @"kMRMediaRemoteIndexPathDataUserInfoKey";
  v19[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (a3)
  {
    uint64_t v7 = (__CFString *)CFErrorCopyDescription(a3);
    if (v7) {
      [v6 setObject:v7 forKeyedSubscript:@"kMRMediaRemoteBrowsableContentErrorLocalizedDescriptionKey"];
    }
    uint64_t v8 = (void *)[(__CFString *)(id)CFErrorGetDomain(a3) copy];
    if (v8)
    {
      [v6 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteBrowsableContentErrorDomainKey"];
      BOOL v9 = [NSNumber numberWithLong:CFErrorGetCode(a3)];
      [v6 setObject:v9 forKeyedSubscript:@"kMRMediaRemoteBrowsableContentErrorCodeKey"];
    }
  }
  uint64_t v10 = MRMediaRemoteIndexPathCopyDescription(v15);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"finishedBrowsableContentPlaybackInitialization", 0];
  id v12 = v11;
  if (v10) {
    [v11 appendFormat:@" for %@", v10];
  }
  uint64_t v13 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v17 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v14 = (void *)MRGetSharedService();
  MRMediaRemoteServicePostBrowsableContentNotification(v14, @"kMRMediaRemoteApplicationInitiatedPlaybackOfContentItemNotification", v6);
}

void sub_19513EBD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19513EC74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19513ECF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195140100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_195140C70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1951416F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 256), 8);
  _Block_object_dispose((const void *)(v43 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_195141C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1951422C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_195142CE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_195143238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195143E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 256), 8);
  _Block_object_dispose((const void *)(v47 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1951443C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195144A7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class initAVAudioSession_2()
{
  if (AVFoundationLibrary_sOnce_7 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_7, &__block_literal_global_212);
  }
  Class result = objc_getClass("AVAudioSession");
  classAVAudioSession_2 = (uint64_t)result;
  getAVAudioSessionClass_2[0] = (uint64_t (*)())AVAudioSessionFunction_2;
  return result;
}

id AVAudioSessionFunction_2()
{
  return (id)classAVAudioSession_2;
}

uint64_t OUTLINED_FUNCTION_6_1(void *a1, const char *a2)
{
  uint64_t v4 = *(void *)(v2 + 48);
  return [a1 timeIntervalSinceDate:v4];
}

BOOL _MRDestinationProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_29;
      case 2u:
        long long v19 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || (_MRAVEndpointDescriptorProtobufReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_27;
      case 3u:
        long long v19 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 32), v19);
        if (PBReaderPlaceMark()
          && _MRNowPlayingPlayerPathProtobufReadFrom((id *)&v19->super.super.isa, a2))
        {
LABEL_27:
          PBReaderRecallMark();
LABEL_30:

LABEL_31:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_34:

        return 0;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_29:
        long long v19 = *(_MRAVEndpointDescriptorProtobuf **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_30;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_31;
    }
  }
}

uint64_t _MRVolumeMutedDidChangeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGroupSessionLeaderDiscoveryMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL MRGroupSessionAllowsMigrationForEndpoint(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 groupSessionInfo];

  if (v2)
  {
    uint64_t v3 = [v1 designatedGroupLeader];
    BOOL v4 = [v3 transportType] != 6;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

__CFString *NSStringFromMRAVEndpointConnectionType(unint64_t a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_1E57D8860[a1];
  }
}

void sub_195149CB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19514E538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_195151538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 224), 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_195155734(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19515CD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *MRAVEndpointCreateUniqueIdentifier(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  switch(a1)
  {
    case 1:
      uint64_t v7 = @"LOCAL";
      break;
    case 2:
      [NSString stringWithFormat:@"direct://%@", v5, v9];
      goto LABEL_9;
    case 3:
      [NSString stringWithFormat:@"relay://%@/%@", v5, v6];
      goto LABEL_9;
    case 4:
      [NSString stringWithFormat:@"airplay://%@", v6, v9];
      goto LABEL_9;
    case 5:
      [NSString stringWithFormat:@"remote-hosted://%@/%@", v5, v6];
      goto LABEL_9;
    case 6:
      [NSString stringWithFormat:@"local-hosted://%@/%@", v5, v6];
LABEL_9:
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t MRExternalDeviceCopyUniqueIdentifier(void *a1)
{
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    char v8 = [NSString stringWithUTF8String:"CFStringRef MRExternalDeviceCopyUniqueIdentifier(MRExternalDeviceRef)"];
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 25, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 deviceInfo];
  BOOL v4 = [v3 identifier];
  uint64_t v5 = [v4 copy];

  return v5;
}

uint64_t MRExternalDeviceCopyName(void *a1)
{
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"CFStringRef MRExternalDeviceCopyName(MRExternalDeviceRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 35, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 name];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRExternalDeviceCopyHostName(void *a1)
{
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"CFStringRef MRExternalDeviceCopyHostName(MRExternalDeviceRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 45, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 hostName];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRExternalDeviceCopySystemBuildVersion(void *a1)
{
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    char v8 = [NSString stringWithUTF8String:"CFStringRef MRExternalDeviceCopySystemBuildVersion(MRExternalDeviceRef)"];
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 55, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 deviceInfo];
  uint64_t v4 = [v3 buildVersion];
  uint64_t v5 = [v4 copy];

  return v5;
}

uint64_t MRExternalDeviceGetNetworkPort(void *a1)
{
  if (!a1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"int64_t MRExternalDeviceGetNetworkPort(MRExternalDeviceRef)"];
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 66, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 port];
  return v3;
}

uint64_t MRExternalDeviceCopyDeviceInfo(void *a1)
{
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"MRPairedDeviceRef MRExternalDeviceCopyDeviceInfo(MRExternalDeviceRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 76, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 deviceInfo];
  uint64_t v4 = [v3 copy];

  return v4;
}

void MRExternalDeviceSetNameCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    char v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetNameCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDeviceNameCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 91, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setNameCallback:v5 withQueue:v9];
}

uint64_t MRExternalDeviceIsValid(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isValid];
  return v3;
}

uint64_t MRExternalDeviceCopyCustomOrigin(void *a1)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"MROriginRef MRExternalDeviceCopyCustomOrigin(MRExternalDeviceRef)"];
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 113, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 customOrigin];
  return v3;
}

void MRExternalDeviceSetWantsNowPlayingUpdates(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetWantsNowPlayingUpdates(MRExternalDeviceRef, _Bool)");
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 123, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v4 = (void *)MEMORY[0x199718E70]();
  [a1 setWantsNowPlayingNotifications:a2];
}

void MRExternalDeviceSetWantsNowPlayingArtworkUpdates(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetWantsNowPlayingArtworkUpdates(MRExternalDeviceRef, _Bool)");
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 133, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v4 = (void *)MEMORY[0x199718E70]();
  [a1 setWantsNowPlayingArtworkNotifications:a2];
}

void MRExternalDeviceSetWantsVolumeUpdates(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetWantsVolumeUpdates(MRExternalDeviceRef, _Bool)");
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 143, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v4 = (void *)MEMORY[0x199718E70]();
  [a1 setWantsVolumeNotifications:a2];
}

void MRExternalDeviceSetWantsOutputDeviceUpdates(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetWantsOutputDeviceUpdates(MRExternalDeviceRef, _Bool)");
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 153, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v4 = (void *)MEMORY[0x199718E70]();
  [a1 setWantsOutputDeviceNotifications:a2];
}

void MRExternalDeviceGetVolume(void *a1, void *a2, void *a3)
{
}

void MRExternalDeviceGetOutputDeviceUIDVolume(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceGetOutputDeviceUIDVolume(MRExternalDeviceRef, CFStringRef, __strong dispatch_queue_t, __strong MRExternalDeviceGetVolumeCallback)");
    [v11 handleFailureInFunction:v12, @"MRExternalDevice_Deprecated.m", 175, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x199718E70]();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __MRExternalDeviceGetOutputDeviceUIDVolume_block_invoke;
  v13[3] = &unk_1E57D6020;
  id v10 = v8;
  id v14 = v10;
  [a1 outputDeviceVolume:a2 queue:v7 completion:v13];
}

void MRExternalDeviceGetOutputDeviceVolume(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (const void *)MRAVOutputDeviceCopyUniqueIdentifier(a2);
  MRExternalDeviceGetOutputDeviceUIDVolume(a1, (uint64_t)v9, v8, v7);

  if (v9)
  {
    CFRelease(v9);
  }
}

uint64_t __MRExternalDeviceGetOutputDeviceUIDVolume_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRExternalDeviceSetVolume(void *a1, void *a2, void *a3, float a4)
{
}

void MRExternalDeviceSetOutputDeviceUIDVolume(void *a1, uint64_t a2, void *a3, void *a4, float a5)
{
  id v9 = a3;
  id v10 = a4;
  if (!a1)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    int v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetOutputDeviceUIDVolume(MRExternalDeviceRef, CFStringRef, float, __strong dispatch_queue_t, __strong MRExternalDeviceSetVolumeCallback)");
    [v14 handleFailureInFunction:v15, @"MRExternalDevice_Deprecated.m", 201, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v11 = (void *)MEMORY[0x199718E70]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __MRExternalDeviceSetOutputDeviceUIDVolume_block_invoke;
  v16[3] = &unk_1E57D0FE8;
  id v12 = v10;
  id v17 = v12;
  *(float *)&double v13 = a5;
  [a1 setOutputDeviceVolume:a2 outputDeviceUID:v9 queue:v16 completion:v13];
}

void MRExternalDeviceSetOutputDeviceVolume(void *a1, void *a2, void *a3, void *a4, float a5)
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (const void *)MRAVOutputDeviceCopyUniqueIdentifier(a2);
  MRExternalDeviceSetOutputDeviceUIDVolume(a1, (uint64_t)v11, v10, v9, a5);

  if (v11)
  {
    CFRelease(v11);
  }
}

uint64_t __MRExternalDeviceSetOutputDeviceUIDVolume_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRExternalDeviceSetVolumeChangedCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetVolumeChangedCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDeviceVolumeCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 215, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setVolumeCallback:v5 withQueue:v9];
}

void MRExternalDeviceSendButtonEvent(void *a1, uint64_t a2, unsigned int a3)
{
  if (!a1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSendButtonEvent(MRExternalDeviceRef, MRHIDButtonEvent)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 225, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  objc_msgSend(a1, "sendButtonEvent:", a2, a3);
}

BOOL MRExternalDeviceIsConnected(void *a1)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"_Bool MRExternalDeviceIsConnected(MRExternalDeviceRef)"];
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 235, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  BOOL v3 = [a1 connectionState] == 2;
  return v3;
}

void MRExternalDeviceConnect(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"void MRExternalDeviceConnect(MRExternalDeviceRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 245, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  id v8 = @"MRExternalDeviceConnectionReasonUserInfoKey";
  v9[0] = @"deprecated";
  BOOL v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a1;
  id v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 connectWithOptions:0 userInfo:v5];
}

void MRExternalDeviceConnectEx(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceConnectEx(MRExternalDeviceRef, MRExternalDeviceConnectOptions)");
    [v8 handleFailureInFunction:v9, @"MRExternalDevice_Deprecated.m", 257, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v4 = (void *)MEMORY[0x199718E70]();
  id v10 = @"MRExternalDeviceConnectionReasonUserInfoKey";
  v11[0] = @"deprecated";
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a1;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 connectWithOptions:a2 userInfo:v7];
}

void MRExternalDeviceDisconnect(void *a1)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"void MRExternalDeviceDisconnect(MRExternalDeviceRef)"];
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 269, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  id v3 = a1;
  Error = (void *)MRMediaRemoteCreateError(104);
  [v3 disconnect:Error];
}

uint64_t MRExternalDeviceGetConnectionState(void *a1)
{
  if (!a1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"MRExternalDeviceConnectionState MRExternalDeviceGetConnectionState(MRExternalDeviceRef)"];
    [v5 handleFailureInFunction:v6, @"MRExternalDevice_Deprecated.m", 280, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 connectionState];
  return v3;
}

void MRExternalDeviceSetConnectionStateCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetConnectionStateCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDeviceConnectionStateCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 292, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setConnectionStateCallback:v5 withQueue:v9];
}

void MRExternalDeviceSetPairingCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetPairingCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDevicePairingCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 302, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setPairingCallback:v5 withQueue:v9];
}

uint64_t MRExternalDeviceIsPairingAllowed(void *a1)
{
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"_Bool MRExternalDeviceIsPairingAllowed(MRExternalDeviceRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 312, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 deviceInfo];
  uint64_t v4 = [v3 isPairingAllowed];

  return v4;
}

void MRExternalDeviceSetPairingAllowedCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetPairingAllowedCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDevicePairingAllowedCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 324, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setPairingAllowedCallback:v5 withQueue:v9];
}

uint64_t MRExternalDeviceIsPaired()
{
  return 1;
}

void MRExternalDeviceGetPairedDevices(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  if (!v1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"void MRExternalDeviceGetPairedDevices(void (^__strong)(CFArrayRef))"];
    [v11 handleFailureInFunction:v12, @"MRExternalDevice_Deprecated.m", 344, @"Invalid parameter not satisfying: %@", @"completion" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [[MRExternalDevicePairingSession alloc] initWithDevice:0];
  [(MRExternalDevicePairingSession *)v3 open];
  uint64_t v4 = [(MRExternalDevicePairingSession *)v3 pairedDevices];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v1[2](v1, v5);
}

void MRExternalDeviceDeletePairedDevice(uint64_t a1)
{
  if (!a1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"void MRExternalDeviceDeletePairedDevice(CFStringRef)"];
    [v6 handleFailureInFunction:v7, @"MRExternalDevice_Deprecated.m", 362, @"Invalid parameter not satisfying: %@", @"identifier" file lineNumber description];
  }
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = objc_alloc_init(MRDeviceInfo);
  [(MRDeviceInfo *)v3 setIdentifier:a1];
  uint64_t v4 = [[MRExternalDevicePairingSession alloc] initWithDevice:v3];
  [(MRExternalDevicePairingSession *)v4 open];
  id v5 = [(MRExternalDevicePairingSession *)v4 removePeer];
}

void MRExternalDeviceRequestOutputContextModification(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = a6;
  id v13 = a7;
  if (!a1)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceRequestOutputContextModification(MRExternalDeviceRef, MRAVOutputContextType, CFArrayRef, CFArrayRef, CFArrayRef, __strong dispatch_queue_t, void (^__strong)(CFErrorRef))");
    [v24 handleFailureInFunction:v25, @"MRExternalDevice_Deprecated.m", 382, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  long long v14 = (void *)MEMORY[0x199718E70]();
  id v15 = a1;
  long long v16 = [MRRequestDetails alloc];
  id v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];
  uint64_t v19 = [(MRRequestDetails *)v16 initWithName:@"MRExternalDeviceRequestOutputContextModification" requestID:v18 reason:0];

  if ([a3 count])
  {
    uint64_t v20 = 1;
  }
  else if ([a4 count])
  {
    uint64_t v20 = 2;
    a3 = a4;
  }
  else
  {
    if (![a5 count])
    {
      uint64_t v20 = 0;
      id v21 = 0;
      goto LABEL_10;
    }
    uint64_t v20 = 3;
    a3 = a5;
  }
  id v21 = a3;
LABEL_10:
  char v22 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v19 type:v20 outputDeviceUIDs:v21];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __MRExternalDeviceRequestOutputContextModification_block_invoke;
  v26[3] = &unk_1E57D0FE8;
  id v23 = v13;
  id v27 = v23;
  [v15 modifyTopologyWithRequest:v22 withReplyQueue:v12 completion:v26];
}

uint64_t __MRExternalDeviceRequestOutputContextModification_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRExternalDeviceSetCustomDataCallback(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSetCustomDataCallback(MRExternalDeviceRef, __strong dispatch_queue_t, __strong MRExternalDeviceCustomDataCallback)");
    [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 417, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 setCustomDataCallback:v5 withQueue:v9];
}

void MRExternalDeviceSendCustomData(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_8:
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSendCustomData(MRExternalDeviceRef, CFStringRef, CFDataRef)");
    [v9 handleFailureInFunction:v10, @"MRExternalDevice_Deprecated.m", 430, @"Invalid parameter not satisfying: %@", @"name" file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSendCustomData(MRExternalDeviceRef, CFStringRef, CFDataRef)");
  [v7 handleFailureInFunction:v8, @"MRExternalDevice_Deprecated.m", 429, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

  if (!a2) {
    goto LABEL_8;
  }
LABEL_3:
  if (a3) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  id v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDeviceSendCustomData(MRExternalDeviceRef, CFStringRef, CFDataRef)");
  [v11 handleFailureInFunction:v12, @"MRExternalDevice_Deprecated.m", 431, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];

LABEL_4:
  id v6 = (void *)MEMORY[0x199718E70]();
  [a1 sendCustomData:a3 withName:a2];
}

void MRExternalDevicePing(void *a1, void *a2, void *a3, double a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (a1)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDevicePing(MRExternalDeviceRef, CFTimeInterval, __strong dispatch_queue_t, __strong MRExternalDevicePingCallback)");
    [v10 handleFailureInFunction:v11, @"MRExternalDevice_Deprecated.m", 441, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRExternalDevicePing(MRExternalDeviceRef, CFTimeInterval, __strong dispatch_queue_t, __strong MRExternalDevicePingCallback)");
  [v12 handleFailureInFunction:v13, @"MRExternalDevice_Deprecated.m", 442, @"Invalid parameter not satisfying: %@", @"callback" file lineNumber description];

LABEL_3:
  id v9 = (void *)MEMORY[0x199718E70]();
  [a1 ping:v8 callback:v14 withQueue:a4];
}

CFStringRef MRExternalDeviceConnectionStateCopyDescription(unsigned int a1)
{
  if (a1 > 3) {
    CFStringRef v1 = 0;
  }
  else {
    CFStringRef v1 = off_1E57D8898[a1];
  }
  return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1);
}

CFStringRef MRExternalDeviceConnectOptionsCopyDescription(char a1)
{
  if (a1) {
    CFStringRef v1 = @"(EnableSystemAuthenticationPrompt)";
  }
  else {
    CFStringRef v1 = @"(None)";
  }
  return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1);
}

uint64_t MRAVOutputDeviceTypeFromAVType(unint64_t a1)
{
  if (a1 < 5) {
    return (a1 + 1);
  }
  else {
    return 0;
  }
}

unint64_t MRAVOutputDeviceClusterTypeFromAVClusterType(unint64_t result)
{
  if (result < 3) {
    return dword_1952245B0[result];
  }
  return result;
}

Class initNINearbyObject()
{
  if (NearbyInteractionLibrary_sOnce != -1) {
    dispatch_once(&NearbyInteractionLibrary_sOnce, &__block_literal_global_234);
  }
  Class result = objc_getClass("NINearbyObject");
  classNINearbyObject = (uint64_t)result;
  getNINearbyObjectClass = (uint64_t (*)())NINearbyObjectFunction;
  return result;
}

id NINearbyObjectFunction()
{
  return (id)classNINearbyObject;
}

void *__NearbyInteractionLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/NearbyInteraction.framework/NearbyInteraction", 2);
  NearbyInteractionLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t MRPowerLogDeviceTypeFromDeviceInfo(void *a1)
{
  uint64_t v1 = [a1 deviceClass];
  if ((unint64_t)(v1 - 1) > 8) {
    return -1;
  }
  else {
    return qword_1952245C0[v1 - 1];
  }
}

uint64_t MRPowerLogConnectionTransportTypeFromTransport(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v2 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v2 = 3;
        }
        else {
          uint64_t v2 = -1;
        }
      }
    }
  }

  return v2;
}

uint64_t initPLLogRegisteredEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (PowerLogLibrary_sOnce != -1) {
    dispatch_once(&PowerLogLibrary_sOnce, &__block_literal_global_45_0);
  }
  uint64_t v8 = (uint64_t (*)())dlsym((void *)PowerLogLibrary_sLib, "PLLogRegisteredEvent");
  softLinkPLLogRegisteredEvent = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

void *__PowerLogLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
  PowerLogLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_195164AD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195164EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195164F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195165034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195166F08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195166F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19516749C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195167620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195167848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195167B70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195167E98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19516813C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195168388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195168500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19516863C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951689A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195168B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195169080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v20 - 112));
  _Unwind_Resume(a1);
}

void sub_19516910C()
{
}

void sub_195169114()
{
}

void sub_19516911C()
{
}

void sub_195169124()
{
}

void sub_19516912C()
{
}

void sub_195169134()
{
}

void sub_19516A204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19516A35C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _MRVirtualTouchEventProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v38 = 8;
          goto LABEL_54;
        case 2u:
          *(unsigned char *)(a1 + 32) |= 2u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v38 = 16;
LABEL_54:
          *(void *)(a1 + v38) = v20;
          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 8u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_44:
          uint64_t v37 = 28;
          goto LABEL_49;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v3;
        uint64_t v34 = *(void *)(a2 + v33);
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v35;
        v26 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_46;
        }
        v31 += 7;
        BOOL v15 = v32++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_48:
      uint64_t v37 = 24;
LABEL_49:
      *(_DWORD *)(a1 + v37) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *NSStringFromMRPlayerAudioSessionType(uint64_t a1)
{
  uint64_t v1 = 2 * (a1 == 2);
  if (a1 == 1) {
    uint64_t v1 = 1;
  }
  return off_1E57D8BA0[v1];
}

uint64_t MRDeviceSupportsSystemAperture()
{
  return softLinkSBSIsSystemApertureAvailable();
}

void sub_19516C36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19516C89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19516CB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MRPrefersExpandedLockScreenPlatter()
{
  v0 = +[MRUserSettings currentSettings];
  uint64_t v1 = [v0 prefersExpandedLockScreenPlatter];

  return v1;
}

void MRSetPrefersExpandedLockScreenPlatter(uint64_t a1)
{
  id v2 = +[MRUserSettings currentSettings];
  [v2 setPrefersExpandedLockScreenPlatter:a1];
}

void MRSetUIServiceRelayEndpoint(void *a1)
{
  id v2 = a1;
  if (MRProcessIsUIService())
  {
    uint64_t v1 = MRGetSharedService();
    [v1 setUIServiceRelayEndpoint:v2];
  }
}

uint64_t MRSupportsSystemUIActivities()
{
  if (MRSupportsSystemUIActivities_onceToken != -1) {
    dispatch_once(&MRSupportsSystemUIActivities_onceToken, &__block_literal_global_267);
  }
  return MRSupportsSystemUIActivities___supportsSystemUIActivities;
}

void __MRSupportsSystemUIActivities_block_invoke()
{
  if (MRProcessIsMediaRemoteDaemon())
  {
    uint64_t v1 = (uint64_t (**)(void))MEMORY[0x1997190F0](MRSupportsSystemUIActivitiesBlock);
    if (v1) {
      MRSupportsSystemUIActivities___supportsSystemUIActivities = v1[2]();
    }
    v0 = (void *)MRSupportsSystemUIActivitiesBlock;
    MRSupportsSystemUIActivitiesBlock = 0;
  }
  else
  {
    MRGetSharedService();
    uint64_t v1 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    MRSupportsSystemUIActivities___supportsSystemUIActivities = [v1 deviceSupportsUISessions];
  }
}

uint64_t MRUseInternalUI()
{
  v0 = +[MRUserSettings currentSettings];
  uint64_t v1 = [v0 internalUI];

  return v1;
}

uint64_t initSBSIsSystemApertureAvailable()
{
  if (SpringBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_270);
  }
  v0 = (uint64_t (*)())dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSIsSystemApertureAvailable");
  softLinkSBSIsSystemApertureAvailable = v0;

  return v0();
}

void *__SpringBoardServicesLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2);
  SpringBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t MRAVOutputDeviceArrayContainsLocalDevice(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "isLocalDevice", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

BOOL MRAVOutputDeviceArrayContainsOnlyLocalDevices(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "isLocalDevice", (void)v8))
        {

          BOOL v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  BOOL v6 = [v1 count] != 0;
LABEL_11:

  return v6;
}

BOOL MRAVOutputDeviceArrayContainsOnlyAirPlayDevices(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "deviceType", (void)v8) != 1)
        {

          BOOL v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  BOOL v6 = [v1 count] != 0;
LABEL_11:

  return v6;
}

BOOL MRAVOutputDeviceArrayContainsOnlyGroupableDevices(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "isGroupable", (void)v8))
        {

          BOOL v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  BOOL v6 = [v1 count] != 0;
LABEL_11:

  return v6;
}

uint64_t MRAVOutputDeviceArrayNumberOfLogicalDevices(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "logicalDeviceID", (void)v13);
        if (v9) {
          [v8 logicalDeviceID];
        }
        else {
        long long v10 = [v8 uid];
        }
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [v2 count];
  return v11;
}

id MRAVOutputDeviceArrayDescription(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) debugName];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v9 = [NSString alloc];
  if ([v2 count] == 1)
  {
    long long v10 = [v2 firstObject];
    uint64_t v11 = (void *)[v9 initWithFormat:@"%@", v10];
  }
  else
  {
    uint64_t v11 = (void *)[v9 initWithFormat:@"%@", v2];
  }

  return v11;
}

uint64_t MRAVOutputDeviceCopyLogicalDeviceID(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  id v3 = [a1 logicalDeviceID];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceGetName(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 name];
  return v3;
}

uint64_t MRAVOutputDeviceGetUniqueIdentifier(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 uid];
  return v3;
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 uid];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceGetSubtype(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 deviceSubtype];
  return v3;
}

uint64_t MRAVOutputDeviceGetModelID(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 modelID];
  return v3;
}

uint64_t MRAVOutputDeviceCopyFirmwareVersion(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 firmwareVersion];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceGetGroupIdentifier(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 groupID];
  return v3;
}

uint64_t MRAVOutputDeviceCopyGroupIdentifier(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 groupID];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceGetMACAddress(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 MACAddress];
  return v3;
}

uint64_t MRAVOutputDeviceCopyMACAddress(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 MACAddress];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceCopyPlayingPairedDeviceName(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 playingPairedDeviceName];
  uint64_t v4 = [v3 copy];

  return v4;
}

uint64_t MRAVOutputDeviceCanAccessRemoteAssets(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 canAccessRemoteAssets];
  return v3;
}

uint64_t MRAVOutputDeviceIsRemoteControllable(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isRemoteControllable];
  return v3;
}

uint64_t MRAVOutputDeviceCanRelayCommunicationChannel(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 canRelayCommunicationChannel];
  return v3;
}

uint64_t MRAVOutputDeviceSupportsBufferedAirPlay(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 supportsBufferedAirPlay];
  return v3;
}

uint64_t MRAVOutputDeviceIsGroupLeader(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isGroupLeader];
  return v3;
}

uint64_t MRAVOutputDeviceGroupContainsGroupLeader(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 groupContainsGroupLeader];
  return v3;
}

uint64_t MRAVOutputDeviceisAirPlayReceiverSessionActive(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isAirPlayReceiverSessionActive];
  return v3;
}

uint64_t MRAVOutputDeviceParentGroupContainsDiscoverableLeader(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 parentGroupContainsDiscoverableLeader];
  return v3;
}

uint64_t MRAVOutputDeviceParentGroupIdentifier(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 parentGroupIdentifier];
  return v3;
}

uint64_t MRAVOutputDeviceIsGroupable(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isGroupable];
  return v3;
}

uint64_t MRAVOutputDeviceSupportsBluetoothSharing(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 supportsBluetoothSharing];
  return v3;
}

uint64_t MRAVOutputDeviceIsProxyGroupPlayer(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isProxyGroupPlayer];
  return v3;
}

uint64_t MRAVOutputDeviceIsPickedOnPairedDevice(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isPickedOnPairedDevice];
  return v3;
}

uint64_t MRAVOutputDeviceIsVolumeControlAvailable(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isVolumeControlAvailable];
  return v3;
}

float MRAVOutputDeviceGetBatteryLevel(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  [a1 batteryLevel];
  float v4 = v3;
  return v4;
}

uint64_t MRAVOutputDeviceCanAccessAppleMusic(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 canAccessAppleMusic];
  return v3;
}

uint64_t MRAVOutputDeviceCanPlayEncryptedProgressiveDownloadAssets(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 canPlayEncryptedProgressiveDownloadAssets];
  return v3;
}

uint64_t MRAVOutputDeviceCanFetchMediaDataFromSender(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 canFetchMediaDataFromSender];
  return v3;
}

uint64_t MRAVOutputDevicePresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
  return v3;
}

uint64_t MRAVOutputDeviceGetModelSpecificInformation(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 modelSpecificInfo];
  return v3;
}

uint64_t MRAVOutputDeviceSupportsExternalScreen(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 supportsExternalScreen];
  return v3;
}

uint64_t MRAVOutputDeviceRequiresAuthorization(void *a1)
{
  id v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 requiresAuthorization];
  return v3;
}

uint64_t MRAVOutputDeviceCreateLocalDevice()
{
  return 0;
}

MRAVConcreteOutputDevice *MRAVOutputDeviceCreateFromAVOutputDevice(void *a1)
{
  id v1 = a1;
  id v2 = [MRAVOutputDeviceSourceInfo alloc];
  uint64_t v3 = [v1 deviceID];
  float v4 = [(MRAVOutputDeviceSourceInfo *)v2 initWithRoutingContextUID:v3 multipleBuiltInDevices:0];

  uint64_t v5 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v1 sourceInfo:v4];
  return v5;
}

void MRAVOutputDeviceSetRecentAVOutputDeviceUID(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetRecentAVOutputDeviceUID(v6, v7, a1, v5);
}

void MRAVOutputDeviceGetRecentAVOutputDeviceUIDs(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  float v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetRecentAVOutputDeviceUIDs(v4, v5, v3);
}

uint64_t MRAVOutputDeviceGetAVOutputDevice(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 avOutputDevice];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t MRAVCopyOutputDevicesSubstitutingLocalDevice()
{
  return 0;
}

void MRAVOutputDeviceRemoveFromParentGroup(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x199718E70]();
  id v7 = (void *)MRGetSharedService();
  MRMediaRemoteServiceRemoveFromParentGroup(v7, a1, v8, v5);
}

uint64_t MRAVOutputDeviceSupportsRapport(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 supportsRapport];
  return v3;
}

uint64_t MRAVOutputDeviceIsAddedToHomeKit(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isAddedToHomeKit];
  return v3;
}

uint64_t MRAVOutputDeviceCopyBluetoothID(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 bluetoothID];
  return v3;
}

uint64_t MRAVOutputDeviceCopyCurrentBluetoothListeningMode(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 currentBluetoothListeningMode];
  return v3;
}

uint64_t MRAVOutputDeviceSetCurrentBluetoothListeningMode(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x199718E70]();
  id v7 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 debugName];
      *(_DWORD *)buf = 138543618;
      unint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = a2;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting listening mode: %{public}@", buf, 0x16u);
    }
    id v21 = 0;
    uint64_t v10 = [v7 setCurrentBluetoothListeningMode:a2 error:&v21];
    id v11 = v21;
    if (!v11) {
      goto LABEL_16;
    }
LABEL_13:
    id v17 = _MRLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v19 = [v7 debugName];
      *(_DWORD *)buf = 138543874;
      unint64_t v23 = v19;
      __int16 v24 = 2114;
      uint64_t v25 = a2;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_error_impl(&dword_194F3C000, v17, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to set listening mode: %{public}@ - error: %{public}@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  uint64_t v12 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  long long v13 = [v7 uid];
  long long v14 = [v12 outputDeviceForUID:v13];

  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v15 = _MRLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v7 debugName];
      *(_DWORD *)buf = 138543618;
      unint64_t v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = a2;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting listening mode: %{public}@", buf, 0x16u);
    }
    id v20 = 0;
    uint64_t v10 = [v14 setCurrentBluetoothListeningMode:a2 error:&v20];
    id v11 = v20;
  }
  else
  {
    id v11 = 0;
    uint64_t v10 = 0;
  }

  if (v11) {
    goto LABEL_13;
  }
LABEL_16:
  if (a3) {
    *a3 = v11;
  }

  return v10;
}

uint64_t MRAVOutputDeviceCopyAvailableBluetoothListeningMode(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 availableBluetoothListeningModes];
  return v3;
}

uint64_t MRAVOutputDeviceSupportsHeadTrackedSpatialAudio(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 supportsHeadTrackedSpatialAudio];
  return v3;
}

uint64_t MRAVOutputDeviceAllowsHeadTrackedSpatialAudio(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 allowsHeadTrackedSpatialAudio];
  return v3;
}

uint64_t MRAVOutputDeviceSetAllowsHeadTrackedSpatialAudio(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)MEMORY[0x199718E70]();
  id v7 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = 0;
    uint64_t v8 = [v7 setAllowsHeadTrackedSpatialAudio:a2 error:&v11];
    id v9 = v11;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v9 = 0;
  uint64_t v8 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v9;
LABEL_6:

  return v8;
}

uint64_t MRAVOutputDeviceCopyHeadTrackedSpatialAudioMode(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 headTrackedSpatialAudioMode];
  return v3;
}

uint64_t MRAVOutputDeviceHeadTrackedSpatialAudioActive(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 isHeadTrackedSpatialAudioActive];
  return v3;
}

uint64_t MRAVOutputDeviceCopyDNSNames(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199718E70]();
  uint64_t v3 = [a1 dnsNames];
  return v3;
}

void sub_19516EADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t _MRRequestDetailsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_53;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_53;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_53;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_57:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 60) |= 1u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_61:
          *(void *)(a1 + 8) = v28;
          continue;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 60) |= 8u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_65:
          BOOL v45 = v34 != 0;
          uint64_t v46 = 57;
          goto LABEL_70;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 60) |= 4u;
          break;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_53:
          uint64_t v44 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 == -1 || v42 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
        *(void *)(a2 + v41) = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_67;
        }
        v38 += 7;
        BOOL v14 = v39++ >= 9;
        if (v14)
        {
          uint64_t v40 = 0;
          goto LABEL_69;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v40 = 0;
      }
LABEL_69:
      BOOL v45 = v40 != 0;
      uint64_t v46 = 56;
LABEL_70:
      *(unsigned char *)(a1 + v46) = v45;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRRegisterVoiceInputDeviceResponseMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__deviceID;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__deviceID;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__deviceID;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__errorCode;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__errorCode;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR____MRRegisterVoiceInputDeviceResponseMessageProtobuf__errorCode;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t MRNowPlayingArtworkCreateWithImageData(uint64_t a1, uint64_t a2)
{
  float v4 = [MRNowPlayingArtworkImage alloc];

  return (uint64_t)[(MRNowPlayingArtworkImage *)v4 initWithImageData:a1 mimeType:a2];
}

uint64_t MRNowPlayingArtworkCopyIOSurface()
{
  return 0;
}

uint64_t _MRSendCommandMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unint64_t v24 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v24->super.super.isa, a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_39:
            *(_DWORD *)(a1 + 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        unint64_t v24 = objc_alloc_init(_MRCommandOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (_MRCommandOptionsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRSetVolumeMutedMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unint64_t v24 = objc_alloc_init(_MRRequestDetailsProtobuf);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (_MRRequestDetailsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unsigned int v26 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v25;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 24) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRCommandOptionsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 424;
        goto LABEL_315;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 208;
        goto LABEL_315;
      case 4u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(void *)(a1 + 496) |= 0x20000000uLL;
        while (2)
        {
          uint64_t v23 = *v3;
          uint64_t v24 = *(void *)(a2 + v23);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if (v26 < 0)
            {
              v20 += 7;
              BOOL v15 = v21++ >= 9;
              if (v15)
              {
                uint64_t v22 = 0;
                goto LABEL_322;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_322:
        BOOL v255 = v22 != 0;
        uint64_t v256 = 480;
        goto LABEL_440;
      case 5u:
        *(void *)(a1 + 496) |= 0x100000uLL;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 416;
        goto LABEL_466;
      case 6u:
        *(void *)(a1 + 496) |= 0x800uLL;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 260;
        goto LABEL_466;
      case 7u:
        *(void *)(a1 + 496) |= 0x8000uLL;
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 344;
        goto LABEL_466;
      case 8u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(void *)(a1 + 496) |= 0x40000000uLL;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                uint64_t v36 = 0;
                goto LABEL_326;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v36 = 0;
        }
LABEL_326:
        BOOL v255 = v36 != 0;
        uint64_t v256 = 481;
        goto LABEL_440;
      case 9u:
        *(void *)(a1 + 496) |= 8uLL;
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v42);
          *(void *)(a2 + v41) = v42 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 32;
        goto LABEL_471;
      case 0xAu:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x10000uLL;
        while (2)
        {
          uint64_t v47 = *v3;
          uint64_t v48 = *(void *)(a2 + v47);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v49;
            v46 |= (unint64_t)(v50 & 0x7F) << v44;
            if (v50 < 0)
            {
              v44 += 7;
              BOOL v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_330;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_330:
        uint64_t v257 = 360;
        goto LABEL_445;
      case 0xBu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x80000uLL;
        while (2)
        {
          uint64_t v53 = *v3;
          uint64_t v54 = *(void *)(a2 + v53);
          unint64_t v55 = v54 + 1;
          if (v54 == -1 || v55 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
            *(void *)(a2 + v53) = v55;
            v46 |= (unint64_t)(v56 & 0x7F) << v51;
            if (v56 < 0)
            {
              v51 += 7;
              BOOL v15 = v52++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_334;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_334:
        uint64_t v257 = 392;
        goto LABEL_445;
      case 0xCu:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0;
        *(void *)(a1 + 496) |= 0x80uLL;
        while (2)
        {
          uint64_t v60 = *v3;
          uint64_t v61 = *(void *)(a2 + v60);
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v61);
            *(void *)(a2 + v60) = v62;
            v59 |= (unint64_t)(v63 & 0x7F) << v57;
            if (v63 < 0)
            {
              v57 += 7;
              BOOL v15 = v58++ >= 9;
              if (v15)
              {
                uint64_t v59 = 0;
                goto LABEL_338;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v59 = 0;
        }
LABEL_338:
        uint64_t v258 = 64;
        goto LABEL_343;
      case 0xDu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v59 = 0;
        *(void *)(a1 + 496) |= 0x10uLL;
        while (2)
        {
          uint64_t v66 = *v3;
          uint64_t v67 = *(void *)(a2 + v66);
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v68;
            v59 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              BOOL v15 = v65++ >= 9;
              if (v15)
              {
                uint64_t v59 = 0;
                goto LABEL_342;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v59 = 0;
        }
LABEL_342:
        uint64_t v258 = 40;
LABEL_343:
        *(void *)(a1 + v258) = v59;
        goto LABEL_472;
      case 0xEu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 336;
        goto LABEL_315;
      case 0xFu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 448;
        goto LABEL_315;
      case 0x10u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_315;
      case 0x11u:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x40000uLL;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v46 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_347;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_347:
        uint64_t v257 = 368;
        goto LABEL_445;
      case 0x12u:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v78 = 0;
        *(void *)(a1 + 496) |= 0x1000000000uLL;
        while (2)
        {
          uint64_t v79 = *v3;
          uint64_t v80 = *(void *)(a2 + v79);
          unint64_t v81 = v80 + 1;
          if (v80 == -1 || v81 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
            *(void *)(a2 + v79) = v81;
            v78 |= (unint64_t)(v82 & 0x7F) << v76;
            if (v82 < 0)
            {
              v76 += 7;
              BOOL v15 = v77++ >= 9;
              if (v15)
              {
                uint64_t v78 = 0;
                goto LABEL_351;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v78 = 0;
        }
LABEL_351:
        BOOL v255 = v78 != 0;
        uint64_t v256 = 487;
        goto LABEL_440;
      case 0x13u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_315;
      case 0x14u:
        char v83 = 0;
        unsigned int v84 = 0;
        uint64_t v85 = 0;
        *(void *)(a1 + 496) |= 0x4000000000uLL;
        while (2)
        {
          uint64_t v86 = *v3;
          uint64_t v87 = *(void *)(a2 + v86);
          unint64_t v88 = v87 + 1;
          if (v87 == -1 || v88 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v89 = *(unsigned char *)(*(void *)(a2 + *v7) + v87);
            *(void *)(a2 + v86) = v88;
            v85 |= (unint64_t)(v89 & 0x7F) << v83;
            if (v89 < 0)
            {
              v83 += 7;
              BOOL v15 = v84++ >= 9;
              if (v15)
              {
                uint64_t v85 = 0;
                goto LABEL_355;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v85 = 0;
        }
LABEL_355:
        BOOL v255 = v85 != 0;
        uint64_t v256 = 489;
        goto LABEL_440;
      case 0x15u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 432;
        goto LABEL_315;
      case 0x16u:
        char v90 = 0;
        unsigned int v91 = 0;
        uint64_t v92 = 0;
        *(void *)(a1 + 496) |= 0x2000000000uLL;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v92 |= (unint64_t)(v96 & 0x7F) << v90;
            if (v96 < 0)
            {
              v90 += 7;
              BOOL v15 = v91++ >= 9;
              if (v15)
              {
                uint64_t v92 = 0;
                goto LABEL_359;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v92 = 0;
        }
LABEL_359:
        BOOL v255 = v92 != 0;
        uint64_t v256 = 488;
        goto LABEL_440;
      case 0x17u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x200uLL;
        while (2)
        {
          uint64_t v99 = *v3;
          uint64_t v100 = *(void *)(a2 + v99);
          unint64_t v101 = v100 + 1;
          if (v100 == -1 || v101 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v102 = *(unsigned char *)(*(void *)(a2 + *v7) + v100);
            *(void *)(a2 + v99) = v101;
            v46 |= (unint64_t)(v102 & 0x7F) << v97;
            if (v102 < 0)
            {
              v97 += 7;
              BOOL v15 = v98++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_363;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_363:
        uint64_t v257 = 252;
        goto LABEL_445;
      case 0x18u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 112;
        goto LABEL_315;
      case 0x19u:
        char v103 = 0;
        unsigned int v104 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x400uLL;
        while (2)
        {
          uint64_t v105 = *v3;
          uint64_t v106 = *(void *)(a2 + v105);
          unint64_t v107 = v106 + 1;
          if (v106 == -1 || v107 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v108 = *(unsigned char *)(*(void *)(a2 + *v7) + v106);
            *(void *)(a2 + v105) = v107;
            v46 |= (unint64_t)(v108 & 0x7F) << v103;
            if (v108 < 0)
            {
              v103 += 7;
              BOOL v15 = v104++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_367;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_367:
        uint64_t v257 = 256;
        goto LABEL_445;
      case 0x1Au:
        char v109 = 0;
        unsigned int v110 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x100uLL;
        while (2)
        {
          uint64_t v111 = *v3;
          uint64_t v112 = *(void *)(a2 + v111);
          unint64_t v113 = v112 + 1;
          if (v112 == -1 || v113 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v114 = *(unsigned char *)(*(void *)(a2 + *v7) + v112);
            *(void *)(a2 + v111) = v113;
            v46 |= (unint64_t)(v114 & 0x7F) << v109;
            if (v114 < 0)
            {
              v109 += 7;
              BOOL v15 = v110++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_371;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_371:
        uint64_t v257 = 248;
        goto LABEL_445;
      case 0x1Bu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 200;
        goto LABEL_315;
      case 0x1Cu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 240;
        goto LABEL_315;
      case 0x1Du:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 184;
        goto LABEL_315;
      case 0x1Eu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 216;
        goto LABEL_315;
      case 0x1Fu:
        char v115 = 0;
        unsigned int v116 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x20000uLL;
        while (2)
        {
          uint64_t v117 = *v3;
          uint64_t v118 = *(void *)(a2 + v117);
          unint64_t v119 = v118 + 1;
          if (v118 == -1 || v119 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v118);
            *(void *)(a2 + v117) = v119;
            v46 |= (unint64_t)(v120 & 0x7F) << v115;
            if (v120 < 0)
            {
              v115 += 7;
              BOOL v15 = v116++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_375;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_375:
        uint64_t v257 = 364;
        goto LABEL_445;
      case 0x20u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96;
        goto LABEL_315;
      case 0x21u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 376;
        goto LABEL_315;
      case 0x22u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 352;
        goto LABEL_315;
      case 0x28u:
        char v122 = 0;
        unsigned int v123 = 0;
        uint64_t v124 = 0;
        *(void *)(a1 + 496) |= 0x8000000uLL;
        while (2)
        {
          uint64_t v125 = *v3;
          uint64_t v126 = *(void *)(a2 + v125);
          unint64_t v127 = v126 + 1;
          if (v126 == -1 || v127 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v128 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
            *(void *)(a2 + v125) = v127;
            v124 |= (unint64_t)(v128 & 0x7F) << v122;
            if (v128 < 0)
            {
              v122 += 7;
              BOOL v15 = v123++ >= 9;
              if (v15)
              {
                uint64_t v124 = 0;
                goto LABEL_379;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v124 = 0;
        }
LABEL_379:
        BOOL v255 = v124 != 0;
        uint64_t v256 = 478;
        goto LABEL_440;
      case 0x29u:
        char v129 = 0;
        unsigned int v130 = 0;
        uint64_t v131 = 0;
        *(void *)(a1 + 496) |= 0x10000000uLL;
        while (2)
        {
          uint64_t v132 = *v3;
          uint64_t v133 = *(void *)(a2 + v132);
          unint64_t v134 = v133 + 1;
          if (v133 == -1 || v134 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v135 = *(unsigned char *)(*(void *)(a2 + *v7) + v133);
            *(void *)(a2 + v132) = v134;
            v131 |= (unint64_t)(v135 & 0x7F) << v129;
            if (v135 < 0)
            {
              v129 += 7;
              BOOL v15 = v130++ >= 9;
              if (v15)
              {
                uint64_t v131 = 0;
                goto LABEL_383;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v131 = 0;
        }
LABEL_383:
        BOOL v255 = v131 != 0;
        uint64_t v256 = 479;
        goto LABEL_440;
      case 0x2Au:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 264;
        goto LABEL_315;
      case 0x2Bu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 456;
        goto LABEL_315;
      case 0x2Cu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 192;
        goto LABEL_315;
      case 0x2Du:
        char v136 = 0;
        unsigned int v137 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x4000uLL;
        while (2)
        {
          uint64_t v138 = *v3;
          uint64_t v139 = *(void *)(a2 + v138);
          unint64_t v140 = v139 + 1;
          if (v139 == -1 || v140 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v141 = *(unsigned char *)(*(void *)(a2 + *v7) + v139);
            *(void *)(a2 + v138) = v140;
            v46 |= (unint64_t)(v141 & 0x7F) << v136;
            if (v141 < 0)
            {
              v136 += 7;
              BOOL v15 = v137++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_387;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_387:
        uint64_t v257 = 332;
        goto LABEL_445;
      case 0x2Eu:
        char v142 = 0;
        unsigned int v143 = 0;
        uint64_t v144 = 0;
        *(void *)(a1 + 496) |= 0x400000000uLL;
        while (2)
        {
          uint64_t v145 = *v3;
          uint64_t v146 = *(void *)(a2 + v145);
          unint64_t v147 = v146 + 1;
          if (v146 == -1 || v147 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v148 = *(unsigned char *)(*(void *)(a2 + *v7) + v146);
            *(void *)(a2 + v145) = v147;
            v144 |= (unint64_t)(v148 & 0x7F) << v142;
            if (v148 < 0)
            {
              v142 += 7;
              BOOL v15 = v143++ >= 9;
              if (v15)
              {
                uint64_t v144 = 0;
                goto LABEL_391;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v144 = 0;
        }
LABEL_391:
        BOOL v255 = v144 != 0;
        uint64_t v256 = 485;
        goto LABEL_440;
      case 0x2Fu:
        char v149 = 0;
        unsigned int v150 = 0;
        uint64_t v151 = 0;
        *(void *)(a1 + 496) |= 0x800000000uLL;
        while (2)
        {
          uint64_t v152 = *v3;
          uint64_t v153 = *(void *)(a2 + v152);
          unint64_t v154 = v153 + 1;
          if (v153 == -1 || v154 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v155 = *(unsigned char *)(*(void *)(a2 + *v7) + v153);
            *(void *)(a2 + v152) = v154;
            v151 |= (unint64_t)(v155 & 0x7F) << v149;
            if (v155 < 0)
            {
              v149 += 7;
              BOOL v15 = v150++ >= 9;
              if (v15)
              {
                uint64_t v151 = 0;
                goto LABEL_395;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v151 = 0;
        }
LABEL_395:
        BOOL v255 = v151 != 0;
        uint64_t v256 = 486;
        goto LABEL_440;
      case 0x30u:
        char v156 = 0;
        unsigned int v157 = 0;
        uint64_t v158 = 0;
        *(void *)(a1 + 496) |= 0x200000000uLL;
        while (2)
        {
          uint64_t v159 = *v3;
          uint64_t v160 = *(void *)(a2 + v159);
          unint64_t v161 = v160 + 1;
          if (v160 == -1 || v161 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v162 = *(unsigned char *)(*(void *)(a2 + *v7) + v160);
            *(void *)(a2 + v159) = v161;
            v158 |= (unint64_t)(v162 & 0x7F) << v156;
            if (v162 < 0)
            {
              v156 += 7;
              BOOL v15 = v157++ >= 9;
              if (v15)
              {
                uint64_t v158 = 0;
                goto LABEL_399;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v158 = 0;
        }
LABEL_399:
        BOOL v255 = v158 != 0;
        uint64_t v256 = 484;
        goto LABEL_440;
      case 0x31u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 176;
        goto LABEL_315;
      case 0x32u:
        char v163 = 0;
        unsigned int v164 = 0;
        uint64_t v165 = 0;
        *(void *)(a1 + 496) |= 0x10000000000uLL;
        while (2)
        {
          uint64_t v166 = *v3;
          uint64_t v167 = *(void *)(a2 + v166);
          unint64_t v168 = v167 + 1;
          if (v167 == -1 || v168 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v167);
            *(void *)(a2 + v166) = v168;
            v165 |= (unint64_t)(v169 & 0x7F) << v163;
            if (v169 < 0)
            {
              v163 += 7;
              BOOL v15 = v164++ >= 9;
              if (v15)
              {
                uint64_t v165 = 0;
                goto LABEL_403;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v165 = 0;
        }
LABEL_403:
        BOOL v255 = v165 != 0;
        uint64_t v256 = 491;
        goto LABEL_440;
      case 0x33u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 280;
        goto LABEL_315;
      case 0x34u:
        char v170 = 0;
        unsigned int v171 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x1000uLL;
        while (2)
        {
          uint64_t v172 = *v3;
          uint64_t v173 = *(void *)(a2 + v172);
          unint64_t v174 = v173 + 1;
          if (v173 == -1 || v174 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v173);
            *(void *)(a2 + v172) = v174;
            v46 |= (unint64_t)(v175 & 0x7F) << v170;
            if (v175 < 0)
            {
              v170 += 7;
              BOOL v15 = v171++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_407;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_407:
        uint64_t v257 = 296;
        goto LABEL_445;
      case 0x35u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 272;
        goto LABEL_315;
      case 0x36u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 304;
        goto LABEL_315;
      case 0x37u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 288;
        goto LABEL_315;
      case 0x38u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 312;
        goto LABEL_315;
      case 0x39u:
        char v176 = 0;
        unsigned int v177 = 0;
        uint64_t v178 = 0;
        *(void *)(a1 + 496) |= 0x8000000000uLL;
        while (2)
        {
          uint64_t v179 = *v3;
          uint64_t v180 = *(void *)(a2 + v179);
          unint64_t v181 = v180 + 1;
          if (v180 == -1 || v181 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v182 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
            *(void *)(a2 + v179) = v181;
            v178 |= (unint64_t)(v182 & 0x7F) << v176;
            if (v182 < 0)
            {
              v176 += 7;
              BOOL v15 = v177++ >= 9;
              if (v15)
              {
                uint64_t v178 = 0;
                goto LABEL_411;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v178 = 0;
        }
LABEL_411:
        BOOL v255 = v178 != 0;
        uint64_t v256 = 490;
        goto LABEL_440;
      case 0x3Au:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 232;
        goto LABEL_315;
      case 0x3Bu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 168;
        goto LABEL_315;
      case 0x3Cu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 160;
        goto LABEL_315;
      case 0x3Du:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 384;
        goto LABEL_315;
      case 0x3Eu:
        *(void *)(a1 + 496) |= 4uLL;
        uint64_t v183 = *v3;
        unint64_t v184 = *(void *)(a2 + v183);
        if (v184 <= 0xFFFFFFFFFFFFFFF7 && v184 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v184);
          *(void *)(a2 + v183) = v184 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 24;
        goto LABEL_471;
      case 0x3Fu:
        *(void *)(a1 + 496) |= 2uLL;
        uint64_t v185 = *v3;
        unint64_t v186 = *(void *)(a2 + v185);
        if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v186);
          *(void *)(a2 + v185) = v186 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 16;
        goto LABEL_471;
      case 0x40u:
        *(void *)(a1 + 496) |= 1uLL;
        uint64_t v187 = *v3;
        unint64_t v188 = *(void *)(a2 + v187);
        if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v188);
          *(void *)(a2 + v187) = v188 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 8;
        goto LABEL_471;
      case 0x41u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 224;
        goto LABEL_315;
      case 0x42u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 144;
        goto LABEL_315;
      case 0x43u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_315;
      case 0x44u:
        char v189 = 0;
        unsigned int v190 = 0;
        uint64_t v191 = 0;
        *(void *)(a1 + 496) |= 0x2000000uLL;
        while (2)
        {
          uint64_t v192 = *v3;
          uint64_t v193 = *(void *)(a2 + v192);
          unint64_t v194 = v193 + 1;
          if (v193 == -1 || v194 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v195 = *(unsigned char *)(*(void *)(a2 + *v7) + v193);
            *(void *)(a2 + v192) = v194;
            v191 |= (unint64_t)(v195 & 0x7F) << v189;
            if (v195 < 0)
            {
              v189 += 7;
              BOOL v15 = v190++ >= 9;
              if (v15)
              {
                uint64_t v191 = 0;
                goto LABEL_415;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v191 = 0;
        }
LABEL_415:
        BOOL v255 = v191 != 0;
        uint64_t v256 = 476;
        goto LABEL_440;
      case 0x45u:
        char v196 = 0;
        unsigned int v197 = 0;
        uint64_t v198 = 0;
        *(void *)(a1 + 496) |= 0x4000000uLL;
        while (2)
        {
          uint64_t v199 = *v3;
          uint64_t v200 = *(void *)(a2 + v199);
          unint64_t v201 = v200 + 1;
          if (v200 == -1 || v201 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v202 = *(unsigned char *)(*(void *)(a2 + *v7) + v200);
            *(void *)(a2 + v199) = v201;
            v198 |= (unint64_t)(v202 & 0x7F) << v196;
            if (v202 < 0)
            {
              v196 += 7;
              BOOL v15 = v197++ >= 9;
              if (v15)
              {
                uint64_t v198 = 0;
                goto LABEL_419;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v198 = 0;
        }
LABEL_419:
        BOOL v255 = v198 != 0;
        uint64_t v256 = 477;
        goto LABEL_440;
      case 0x46u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 104;
        goto LABEL_315;
      case 0x47u:
        char v203 = 0;
        unsigned int v204 = 0;
        uint64_t v205 = 0;
        *(void *)(a1 + 496) |= 0x80000000uLL;
        while (2)
        {
          uint64_t v206 = *v3;
          uint64_t v207 = *(void *)(a2 + v206);
          unint64_t v208 = v207 + 1;
          if (v207 == -1 || v208 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v209 = *(unsigned char *)(*(void *)(a2 + *v7) + v207);
            *(void *)(a2 + v206) = v208;
            v205 |= (unint64_t)(v209 & 0x7F) << v203;
            if (v209 < 0)
            {
              v203 += 7;
              BOOL v15 = v204++ >= 9;
              if (v15)
              {
                uint64_t v205 = 0;
                goto LABEL_423;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v205 = 0;
        }
LABEL_423:
        BOOL v255 = v205 != 0;
        uint64_t v256 = 482;
        goto LABEL_440;
      case 0x48u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 408;
        goto LABEL_315;
      case 0x49u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 400;
        goto LABEL_315;
      case 0x4Au:
        char v210 = 0;
        unsigned int v211 = 0;
        uint64_t v212 = 0;
        *(void *)(a1 + 496) |= 0x100000000uLL;
        while (2)
        {
          uint64_t v213 = *v3;
          uint64_t v214 = *(void *)(a2 + v213);
          unint64_t v215 = v214 + 1;
          if (v214 == -1 || v215 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v216 = *(unsigned char *)(*(void *)(a2 + *v7) + v214);
            *(void *)(a2 + v213) = v215;
            v212 |= (unint64_t)(v216 & 0x7F) << v210;
            if (v216 < 0)
            {
              v210 += 7;
              BOOL v15 = v211++ >= 9;
              if (v15)
              {
                uint64_t v212 = 0;
                goto LABEL_427;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v212 = 0;
        }
LABEL_427:
        BOOL v255 = v212 != 0;
        uint64_t v256 = 483;
        goto LABEL_440;
      case 0x4Bu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 320;
        goto LABEL_315;
      case 0x4Cu:
        char v217 = 0;
        unsigned int v218 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x2000uLL;
        while (2)
        {
          uint64_t v219 = *v3;
          uint64_t v220 = *(void *)(a2 + v219);
          unint64_t v221 = v220 + 1;
          if (v220 == -1 || v221 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v222 = *(unsigned char *)(*(void *)(a2 + *v7) + v220);
            *(void *)(a2 + v219) = v221;
            v46 |= (unint64_t)(v222 & 0x7F) << v217;
            if (v222 < 0)
            {
              v217 += 7;
              BOOL v15 = v218++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_431;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_431:
        uint64_t v257 = 328;
        goto LABEL_445;
      case 0x4Du:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 72;
        goto LABEL_315;
      case 0x4Eu:
        v223 = objc_alloc_init(_MRSystemPlaybackQueueProtobuf);
        objc_storeStrong((id *)(a1 + 440), v223);
        if (!PBReaderPlaceMark() || (_MRSystemPlaybackQueueProtobufReadFrom((uint64_t)v223, a2) & 1) == 0) {
          goto LABEL_474;
        }
        goto LABEL_313;
      case 0x4Fu:
        char v224 = 0;
        unsigned int v225 = 0;
        uint64_t v226 = 0;
        *(void *)(a1 + 496) |= 0x20000000000uLL;
        while (2)
        {
          uint64_t v227 = *v3;
          uint64_t v228 = *(void *)(a2 + v227);
          unint64_t v229 = v228 + 1;
          if (v228 == -1 || v229 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v230 = *(unsigned char *)(*(void *)(a2 + *v7) + v228);
            *(void *)(a2 + v227) = v229;
            v226 |= (unint64_t)(v230 & 0x7F) << v224;
            if (v230 < 0)
            {
              v224 += 7;
              BOOL v15 = v225++ >= 9;
              if (v15)
              {
                uint64_t v226 = 0;
                goto LABEL_435;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v226 = 0;
        }
LABEL_435:
        BOOL v255 = v226 != 0;
        uint64_t v256 = 492;
        goto LABEL_440;
      case 0x50u:
        *(void *)(a1 + 496) |= 0x400000uLL;
        uint64_t v231 = *v3;
        unint64_t v232 = *(void *)(a2 + v231);
        if (v232 <= 0xFFFFFFFFFFFFFFFBLL && v232 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v232);
          *(void *)(a2 + v231) = v232 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 464;
        goto LABEL_466;
      case 0x51u:
        *(void *)(a1 + 496) |= 0x1000000uLL;
        uint64_t v233 = *v3;
        unint64_t v234 = *(void *)(a2 + v233);
        if (v234 <= 0xFFFFFFFFFFFFFFFBLL && v234 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v234);
          *(void *)(a2 + v233) = v234 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 472;
        goto LABEL_466;
      case 0x52u:
        *(void *)(a1 + 496) |= 0x800000uLL;
        uint64_t v235 = *v3;
        unint64_t v236 = *(void *)(a2 + v235);
        if (v236 <= 0xFFFFFFFFFFFFFFFBLL && v236 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v236);
          *(void *)(a2 + v235) = v236 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v259 = 468;
LABEL_466:
        *(_DWORD *)(a1 + v259) = v29;
        goto LABEL_472;
      case 0x53u:
        char v237 = 0;
        unsigned int v238 = 0;
        uint64_t v239 = 0;
        *(void *)(a1 + 496) |= 0x40000000000uLL;
        while (2)
        {
          uint64_t v240 = *v3;
          uint64_t v241 = *(void *)(a2 + v240);
          unint64_t v242 = v241 + 1;
          if (v241 == -1 || v242 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v243 = *(unsigned char *)(*(void *)(a2 + *v7) + v241);
            *(void *)(a2 + v240) = v242;
            v239 |= (unint64_t)(v243 & 0x7F) << v237;
            if (v243 < 0)
            {
              v237 += 7;
              BOOL v15 = v238++ >= 9;
              if (v15)
              {
                uint64_t v239 = 0;
                goto LABEL_439;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v239 = 0;
        }
LABEL_439:
        BOOL v255 = v239 != 0;
        uint64_t v256 = 493;
LABEL_440:
        *(unsigned char *)(a1 + v256) = v255;
        goto LABEL_472;
      case 0x54u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 80;
        goto LABEL_315;
      case 0x55u:
        *(void *)(a1 + 496) |= 0x40uLL;
        uint64_t v244 = *v3;
        unint64_t v245 = *(void *)(a2 + v244);
        if (v245 <= 0xFFFFFFFFFFFFFFF7 && v245 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v245);
          *(void *)(a2 + v244) = v245 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 56;
        goto LABEL_471;
      case 0x56u:
        char v246 = 0;
        unsigned int v247 = 0;
        uint64_t v46 = 0;
        *(void *)(a1 + 496) |= 0x200000uLL;
        while (2)
        {
          uint64_t v248 = *v3;
          uint64_t v249 = *(void *)(a2 + v248);
          unint64_t v250 = v249 + 1;
          if (v249 == -1 || v250 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v251 = *(unsigned char *)(*(void *)(a2 + *v7) + v249);
            *(void *)(a2 + v248) = v250;
            v46 |= (unint64_t)(v251 & 0x7F) << v246;
            if (v251 < 0)
            {
              v246 += 7;
              BOOL v15 = v247++ >= 9;
              if (v15)
              {
                LODWORD(v46) = 0;
                goto LABEL_444;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_444:
        uint64_t v257 = 420;
LABEL_445:
        *(_DWORD *)(a1 + v257) = v46;
        goto LABEL_472;
      case 0x57u:
        v223 = objc_alloc_init(_MRDictionaryProtobuf);
        objc_storeStrong((id *)(a1 + 152), v223);
        if PBReaderPlaceMark() && (_MRDictionaryProtobufReadFrom(v223, a2))
        {
LABEL_313:
          PBReaderRecallMark();

LABEL_472:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_474:

        return 0;
      case 0x58u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
LABEL_315:
        v252 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_472;
      case 0x59u:
        *(void *)(a1 + 496) |= 0x20uLL;
        uint64_t v253 = *v3;
        unint64_t v254 = *(void *)(a2 + v253);
        if (v254 <= 0xFFFFFFFFFFFFFFF7 && v254 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v43 = *(void *)(*(void *)(a2 + *v7) + v254);
          *(void *)(a2 + v253) = v254 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v43 = 0;
        }
        uint64_t v260 = 48;
LABEL_471:
        *(void *)(a1 + v260) = v43;
        goto LABEL_472;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_472;
    }
  }
}

uint64_t _MRRegisterVoiceInputDeviceMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(_MRVoiceInputDeviceDescriptorProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || !_MRVoiceInputDeviceDescriptorProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19517FB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19517FCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19517FDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1997190F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__53(uint64_t a1)
{
}

void sub_195180054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19518029C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951804E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19518072C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195180974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195180BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195180E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19518104C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195181294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195181508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195181624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195181898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951819F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951823C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_195183018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951831A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951835FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1951836B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195183744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195183898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195183A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195183AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_195183B40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195183D30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195184160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19518439C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951849F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195184AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195184CDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id AVSystemControllerFunction_0()
{
  return (id)classAVSystemController_0;
}

id AVSystemController_SubscribeToNotificationsAttributeFunction()
{
  return (id)constantValAVSystemController_SubscribeToNotificationsAttribute;
}

id AVSystemController_CanBeNowPlayingAppAttributeFunction_0()
{
  return (id)constantValAVSystemController_CanBeNowPlayingAppAttribute_0;
}

BOOL _MRDiscoveryUpdateEndpointsProtobufMessageReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
        [a1 addEndpoints:v17];
        if (!PBReaderPlaceMark() || (_MRAVEndpointDescriptorProtobufReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = objc_alloc_init(_MRDiscoverySessionConfigurationProtobuf);
    objc_storeStrong(a1 + 1, v17);
    if (!PBReaderPlaceMark()
      || (_MRDiscoverySessionConfigurationProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRRemoteArtworkProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
LABEL_24:
        char v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 16;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRLyricsEventProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v22 = objc_alloc_init(_MRLyricsTokenProtobuf);
        objc_storeStrong((id *)(a1 + 24), v22);
        if (!PBReaderPlaceMark() || !_MRLyricsTokenProtobufReadFrom((uint64_t)v22, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        if (v18 == 2)
        {
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v26 = 8;
        }
        else
        {
          if (v18 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          *(unsigned char *)(a1 + 32) |= 2u;
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v26 = 16;
        }
        *(void *)(a1 + v26) = v21;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRSendCommandResultHandlerDialogProtobufReadFrom(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 24;
        goto LABEL_26;
      }
      if (v17 == 1)
      {
        unint64_t v18 = objc_alloc_init(_MRSendCommandResultHandlerDialogActionProtobuf);
        [a1 addActions:v18];
        if (!PBReaderPlaceMark()
          || (_MRSendCommandResultHandlerDialogActionProtobufReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadString();
    uint64_t v20 = 16;
LABEL_26:
    unint64_t v18 = *(_MRSendCommandResultHandlerDialogActionProtobuf **)&a1[v20];
    *(void *)&a1[v20] = v19;
LABEL_27:

    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGroupSessionInfoProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  float v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_38;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_38;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_49:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_53:
          BOOL v39 = v28 != 0;
          uint64_t v40 = 36;
          goto LABEL_58;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_38:
          uint64_t v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v3;
        unint64_t v37 = *(void *)(a2 + v36);
        if (v37 == -1 || v37 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
        *(void *)(a2 + v36) = v37 + 1;
        v35 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0) {
          goto LABEL_55;
        }
        v33 += 7;
        BOOL v14 = v34++ >= 9;
        if (v14)
        {
          uint64_t v35 = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v35 = 0;
      }
LABEL_57:
      BOOL v39 = v35 != 0;
      uint64_t v40 = 37;
LABEL_58:
      *(unsigned char *)(a1 + v40) = v39;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

CFTypeRef MRContentItemGetSubtitle(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 subtitle];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetSubtitle(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetSubtitle(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 138, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetSubtitle_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetSubtitle_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  id v7 = [v6 subtitle];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  unsigned int v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  unint64_t v10 = [v5 metadata];
  uint64_t v11 = [v10 subtitle];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setSubtitle:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetClassicalWork(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 classicalWork];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetClassicalWork(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetClassicalWork(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 150, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetClassicalWork_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetClassicalWork_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  id v7 = [v6 classicalWork];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  unsigned int v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  unint64_t v10 = [v5 metadata];
  uint64_t v11 = [v10 classicalWork];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setClassicalWork:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetSeriesName(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 seriesName];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetSeriesName(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetSeriesName(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 209, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetSeriesName_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetSeriesName_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  id v7 = [v6 seriesName];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  unsigned int v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  unint64_t v10 = [v5 metadata];
  uint64_t v11 = [v10 seriesName];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setSeriesName:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetDirectorName(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 directorName];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetDirectorName(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetDirectorName(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 221, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetDirectorName_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetDirectorName_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  id v7 = [v6 directorName];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  unsigned int v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  unint64_t v10 = [v5 metadata];
  uint64_t v11 = [v10 directorName];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setDirectorName:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemGetSeasonNumber(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 seasonNumber];

  return v2;
}

void MRContentItemSetSeasonNumber(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 seasonNumber] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasSeasonNumber];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setSeasonNumber:a2];

LABEL_8:
}

uint64_t MRContentItemGetEpisodeNumber(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 episodeNumber];

  return v2;
}

void MRContentItemSetEpisodeNumber(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 episodeNumber] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasEpisodeNumber];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setEpisodeNumber:a2];

LABEL_8:
}

uint64_t MRContentItemGetPlayCount(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 playCount];

  return v2;
}

void MRContentItemSetPlayCount(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 playCount] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasPlayCount];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setPlayCount:a2];

LABEL_8:
}

void MRContentItemSetDiscNumber(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 discNumber] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasDiscNumber];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setDiscNumber:a2];

LABEL_8:
}

void MRContentItemSetTotalDiscCount(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 totalDiscCount] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasTotalDiscCount];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setTotalDiscCount:a2];

LABEL_8:
}

void MRContentItemSetTotalTrackCount(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 totalTrackCount] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasTotalTrackCount];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setTotalTrackCount:a2];

LABEL_8:
}

uint64_t MRContentItemGetIsCurrentlyPlaying(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isCurrentlyPlaying];

  return v2;
}

void MRContentItemSetIsCurrentlyPlaying(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isCurrentlyPlaying] != a2)
  {

LABEL_6:
    id v7 = [v8 metadata];
    [v7 setCurrentlyPlaying:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasCurrentlyPlaying];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetHasDuration(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 hasDuration];

  return v2;
}

float MRContentItemGetPlaybackProgress(void *a1)
{
  id v1 = [a1 metadata];
  [v1 playbackProgress];
  float v3 = v2;

  return v3;
}

void MRContentItemSetPlaybackProgress(void *a1, float a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v10 = a1;
  float v4 = [v10 metadata];
  [v4 playbackProgress];
  if (v5 == a2)
  {
    char v6 = [v10 metadata];
    char v7 = [v6 hasPlaybackProgress];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [v10 metadata];
  *(float *)&double v9 = a2;
  [v8 setPlaybackProgress:v9];

LABEL_8:
}

void MRContentItemSetElapsedTimeTimestamp(void *a1, double a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v9 = a1;
  float v4 = [v9 metadata];
  [v4 elapsedTimeTimestamp];
  if (v5 == a2)
  {
    char v6 = [v9 metadata];
    char v7 = [v6 hasElapsedTimeTimestamp];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [v9 metadata];
  [v8 setElapsedTimeTimestamp:a2];

LABEL_8:
}

void MRContentItemSetStartTime(void *a1, double a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v9 = a1;
  float v4 = [v9 metadata];
  [v4 startTime];
  if (v5 == a2)
  {
    char v6 = [v9 metadata];
    char v7 = [v6 hasStartTime];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [v9 metadata];
  [v8 setStartTime:a2];

LABEL_8:
}

void MRContentItemSetCurrentPlaybackDate(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MRContentItemSetCurrentPlaybackDate_block_invoke;
  v2[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v2[4] = a2;
  MRContentItemSetMetadataRef(a1, a2, v2);
}

BOOL __MRContentItemSetCurrentPlaybackDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  char v7 = [v6 currentPlaybackDate];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 currentPlaybackDate];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setCurrentPlaybackDate:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetCurrentPlaybackDate(void *a1)
{
  id v1 = [a1 metadata];
  float v2 = [v1 currentPlaybackDate];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

CFTypeRef MRContentItemGetLocalizedContentRating(void *a1)
{
  id v1 = [a1 metadata];
  float v2 = [v1 localizedContentRating];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetLocalizedContentRating(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetLocalizedContentRating(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 485, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetLocalizedContentRating_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetLocalizedContentRating_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 localizedContentRating];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 localizedContentRating];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setLocalizedContentRating:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemGetIsContainer(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isContainer];

  return v2;
}

void MRContentItemSetIsContainer(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isContainer] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setContainer:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasContainer];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetIsStreamingContent(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isStreamingContent];

  return v2;
}

void MRContentItemSetIsStreamingContent(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isStreamingContent] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setStreamingContent:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasStreamingContent];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetIsSharable(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isSharable];

  return v2;
}

void MRContentItemSetIsSharable(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isSharable] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setSharable:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasSharable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetIsLiked(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isLiked];

  return v2;
}

void MRContentItemSetIsLiked(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isLiked] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setLiked:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasLiked];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetIsInWishList(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isInWishList];

  return v2;
}

void MRContentItemSetIsInWishList(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isInWishList] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setInWishList:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasInWishList];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

void MRContentItemSetLocalizedDurationString(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetLocalizedDurationString(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 594, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetLocalizedDurationString_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetLocalizedDurationString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 localizedDurationString];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 localizedDurationString];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setLocalizedDurationString:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetDurationStringLocalizationKey(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 durationStringLocalizationKey];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetDurationStringLocalizationKey(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetDurationStringLocalizationKey(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 606, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetDurationStringLocalizationKey_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetDurationStringLocalizationKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 durationStringLocalizationKey];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 durationStringLocalizationKey];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setDurationStringLocalizationKey:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetExplicitItem(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 isExplicitItem] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setExplicitItem:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasExplicitItem];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetPlaylistType(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 playlistType];

  return v2;
}

void MRContentItemSetPlaylistType(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 playlistType] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasPlaylistType];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v7 = [v8 metadata];
  [v7 setPlaylistType:a2];

LABEL_8:
}

uint64_t MRContentItemGetRadioStationType(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 radioStationType];

  return v2;
}

void MRContentItemSetRadioStationType(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  float v4 = [v8 metadata];
  if ([v4 radioStationType] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasRadioStationType];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v7 = [v8 metadata];
  [v7 setRadioStationType:a2];

LABEL_8:
}

CFTypeRef MRContentItemGetAssetURL(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 assetURL];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetAssetURL(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MRContentItemSetAssetURL_block_invoke;
  v2[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v2[4] = a2;
  MRContentItemSetMetadataRef(a1, a2, v2);
}

BOOL __MRContentItemSetAssetURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  char v7 = [v6 assetURL];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 assetURL];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setAssetURL:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetArtworkData(void *a1, uint64_t a2)
{
  id v4 = a1;
  float v3 = objc_alloc_init(MRArtwork);
  [(MRArtwork *)v3 setImageData:a2];
  [v4 setArtwork:v3];
  if (!a2) {
    MRContentItemSetArtworkDataSize(v4, 0, 0);
  }
}

void MRContentItemSetArtworkDataSize(void *a1, uint64_t a2, uint64_t a3)
{
  char v6 = [a1 artwork];
  [v6 setWidth:a2];

  id v7 = [a1 artwork];
  [v7 setHeight:a3];
}

CFTypeRef MRContentItemGetArtworkMIMEType(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 artworkMIMEType];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetArtworkMIMEType(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetArtworkMIMEType(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 736, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetArtworkMIMEType_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetArtworkMIMEType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  id v7 = [v6 artworkMIMEType];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  uint64_t v11 = [v10 artworkMIMEType];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setArtworkMIMEType:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemGetArtworkDataWidth(void *a1)
{
  id v1 = [a1 artwork];
  uint64_t v2 = [v1 width];

  return v2;
}

uint64_t MRContentItemGetArtworkDataHeight(void *a1)
{
  id v1 = [a1 artwork];
  uint64_t v2 = [v1 height];

  return v2;
}

CFTypeRef MRContentItemGetInfo(void *a1)
{
  CFTypeRef result = [a1 info];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

uint64_t MRContentItemSetInfo(void *a1, const char *a2)
{
  return [a1 setInfo:a2];
}

void MRContentItemSetHasInfo(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 infoAvailable] != a2)
  {

LABEL_6:
    id v7 = [v8 metadata];
    [v7 setInfoAvailable:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasInfoAvailable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

CFTypeRef MRContentItemGetTranscriptAlignments(void *a1)
{
  CFTypeRef result = [a1 transcriptAlignments];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

void MRContentItemSetTranscriptAlignments(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (id)[a2 mutableCopy];
  [v3 setTranscriptAlignments:v4];
}

uint64_t MRContentItemGetHasTranscriptAlignments(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 transcriptAlignmentsAvailable];

  return v2;
}

void MRContentItemSetHasTranscriptAlignments(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 transcriptAlignmentsAvailable] != a2)
  {

LABEL_6:
    id v7 = [v8 metadata];
    [v7 setTranscriptAlignmentsAvailable:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasTranscriptAlignmentsAvailable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

void MRContentItemSetAvailableLanguageOptions(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [v4 firstObject];
    if (v6
      && (id v7 = (void *)v6,
          [v5 firstObject],
          id v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          v7,
          (isKindOfClass & 1) != 0))
    {
      id v10 = _MRLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "MRContentItemSetAvailableLanguageOptions: Expecting a CFArrayRef of MRLanguageOptionGroupRefs but instead found a CFArrayRef of CFDataRef. Please fix.", buf, 2u);
      }

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = MRLanguageOptionGroupCreateFromExternalRepresentation(*(void **)(*((void *)&v19 + 1) + 8 * v16));
            if (v17) {
              objc_msgSend(v11, "addObject:", v17, (void)v19);
            }

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }
    }
    else
    {
      id v11 = v5;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v18 = objc_msgSend(v11, "mutableCopy", (void)v19);
  [v3 setAvailableLanguageOptions:v18];
}

void MRContentItemSetCurrentLanguageOptions(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 firstObject];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 firstObject],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    id v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "MRContentItemSetCurrentLanguageOptions: Expecting a CFArrayRef of MRLanguageOptionRefs but instead found a CFArrayRef of CFDataRef. Please fix.", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = MRLanguageOptionCreateFromExternalRepresentation(*(void **)(*((void *)&v18 + 1) + 8 * v15));
          if (v16) {
            objc_msgSend(v10, "addObject:", v16, (void)v18);
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = v4;
  }
  uint64_t v17 = objc_msgSend(v10, "mutableCopy", (void)v18);
  [v3 setCurrentLanguageOptions:v17];
}

void MRContentItemSetHasLanguageOptions(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 languageOptionsAvailable] != a2)
  {

LABEL_6:
    id v7 = [v8 metadata];
    [v7 setLanguageOptionsAvailable:a2];

    goto LABEL_7;
  }
  uint64_t v5 = [v8 metadata];
  char v6 = [v5 hasLanguageOptionsAvailable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

void MRContentItemSetSections(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (id)[a2 mutableCopy];
  [v3 setSections:v4];
}

uint64_t MRContentItemGetNumberOfSections(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 numberOfSections];

  return v2;
}

void MRContentItemSetNumberOfSections(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 numberOfSections] == a2)
  {
    uint64_t v5 = [v8 metadata];
    char v6 = [v5 hasNumberOfSections];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setNumberOfSections:a2];

LABEL_8:
}

CFTypeRef MRContentItemGetArtworkURL(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 artworkURL];
  id v3 = [v2 absoluteString];

  if (!v3) {
    return 0;
  }

  return CFAutorelease(v3);
}

CFTypeRef MRContentItemGetArtworkURLTemplates(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 artworkURLTemplates];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetArtworkURLTemplates(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MRContentItemSetArtworkURLTemplates_block_invoke;
  v2[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v2[4] = a2;
  MRContentItemSetMetadataRef(a1, a2, v2);
}

BOOL __MRContentItemSetArtworkURLTemplates_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  id v7 = [v6 artworkURLTemplates];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 artworkURLTemplates];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setArtworkURLTemplates:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetArtworkURL(void *a1, const __CFString *a2)
{
  CFURLRef v3 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __MRContentItemSetArtworkURL_block_invoke;
  v4[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v4[4] = v3;
  MRContentItemSetMetadataRef(a1, (uint64_t)v3, v4);
  if (v3) {
    CFRelease(v3);
  }
}

BOOL __MRContentItemSetArtworkURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  id v7 = [v6 artworkURL];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 artworkURL];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setArtworkURL:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetLyricsURL(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 lyricsURL];
  CFURLRef v3 = [v2 absoluteString];

  if (!v3) {
    return 0;
  }

  return CFAutorelease(v3);
}

void MRContentItemSetLyricsURL(void *a1, const __CFString *a2)
{
  CFURLRef v3 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __MRContentItemSetLyricsURL_block_invoke;
  v4[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v4[4] = v3;
  MRContentItemSetMetadataRef(a1, (uint64_t)v3, v4);
  if (v3) {
    CFRelease(v3);
  }
}

BOOL __MRContentItemSetLyricsURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  id v7 = [v6 lyricsURL];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 lyricsURL];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setLyricsURL:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetHasLyrics(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 lyricsAvailable] != a2)
  {

LABEL_6:
    id v7 = [v8 metadata];
    [v7 setLyricsAvailable:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasLyricsAvailable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetRadioStationIdentifier(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 radioStationIdentifier];

  return v2;
}

void MRContentItemSetRadioStationIdentifier(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 radioStationIdentifier] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasRadioStationIdentifier];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setRadioStationIdentifier:a2];

LABEL_8:
}

void MRContentItemSetITunesStoreIdentifier(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 iTunesStoreIdentifier] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasITunesStoreIdentifier];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setITunesStoreIdentifier:a2];

LABEL_8:
}

void MRContentItemSetITunesStoreSubscriptionIdentifier(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 iTunesStoreSubscriptionIdentifier] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasITunesStoreSubscriptionIdentifier];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setITunesStoreSubscriptionIdentifier:a2];

LABEL_8:
}

void MRContentItemSetITunesStoreAlbumIdentifier(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 iTunesStoreAlbumIdentifier] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasITunesStoreAlbumIdentifier];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setITunesStoreAlbumIdentifier:a2];

LABEL_8:
}

CFTypeRef MRContentItemGetPurchaseInfoData(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 purchaseInfoData];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetPurchaseInfoData(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MRContentItemSetPurchaseInfoData_block_invoke;
  v2[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v2[4] = a2;
  MRContentItemSetMetadataRef(a1, a2, v2);
}

BOOL __MRContentItemSetPurchaseInfoData_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  id v7 = [v6 purchaseInfoData];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 purchaseInfoData];
  char v12 = [v11 isEqualToData:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setPurchaseInfoData:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemGetDownloadState(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 downloadState];

  return v2;
}

void MRContentItemSetDownloadState(void *a1, unsigned int a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 downloadState] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasDownloadState];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v8 metadata];
  [v7 setDownloadState:a2];

LABEL_8:
}

float MRContentItemGetDownloadProgress(void *a1)
{
  id v1 = [a1 metadata];
  [v1 downloadProgress];
  float v3 = v2;

  return v3;
}

void MRContentItemSetDownloadProgress(void *a1, float a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v10 = a1;
  id v4 = [v10 metadata];
  [v4 downloadProgress];
  if (v5 == a2)
  {
    char v6 = [v10 metadata];
    char v7 = [v6 hasDownloadProgress];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [v10 metadata];
  *(float *)&double v9 = a2;
  [v8 setDownloadProgress:v9];

LABEL_8:
}

uint64_t MRContentItemCopyAppMetrics(void *a1)
{
  id v1 = [a1 metadata];
  float v2 = [v1 appMetrics];
  uint64_t v3 = [v2 copy];

  return v3;
}

void MRContentItemSetAppMetrics(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MRContentItemSetAppMetrics_block_invoke;
  v2[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v2[4] = a2;
  MRContentItemSetMetadataRef(a1, a2, v2);
}

BOOL __MRContentItemSetAppMetrics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [v5 metadata];
  char v7 = [v6 appMetrics];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  double v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 appMetrics];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v6 = [v5 metadata];
    [v6 setAppMetrics:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemGetIsAdvertisement(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isAdvertisement];

  return v2;
}

void MRContentItemSetIsAdvertisement(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 isAdvertisement] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setAdvertisement:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasAdvertisement];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t MRContentItemGetIsSteerable(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 isSteerable];

  return v2;
}

void MRContentItemSetIsSteerable(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  id v4 = [v8 metadata];
  if ([v4 isSteerable] != a2)
  {

LABEL_6:
    char v7 = [v8 metadata];
    [v7 setSteerable:a2];

    goto LABEL_7;
  }
  id v5 = [v8 metadata];
  char v6 = [v5 hasSteerable];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

void MRContentItemSetCollectionIdentifier(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetCollectionIdentifier(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 1143, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetCollectionIdentifier_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetCollectionIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 collectionIdentifier];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  double v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 collectionIdentifier];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setCollectionIdentifier:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetProfileIdentifier(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 profileIdentifier];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

CFTypeRef MRContentItemGetServiceIdentifier(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 serviceIdentifier];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

void MRContentItemSetServiceIdentifier(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetServiceIdentifier(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 1185, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetServiceIdentifier_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetServiceIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 serviceIdentifier];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  double v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 serviceIdentifier];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setServiceIdentifier:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetProfileIdentifier(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetProfileIdentifier(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 1190, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetProfileIdentifier_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetProfileIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 profileIdentifier];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  double v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 profileIdentifier];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setProfileIdentifier:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

void MRContentItemSetBrandIdentifier(void *a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    a2 = (void *)[a2 performSelector:sel_stringValue];
  }
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRContentItemSetBrandIdentifier(MRContentItemRef, CFStringRef)");
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRContentItem_Deprecated.m", 1195, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRContentItemSetBrandIdentifier_block_invoke;
  v7[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v7[4] = a2;
  MRContentItemSetMetadataRef(a1, (uint64_t)a2, v7);
}

BOOL __MRContentItemSetBrandIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 metadata];
  char v7 = [v6 brandIdentifier];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  double v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  id v11 = [v10 brandIdentifier];
  char v12 = [v11 isEqualToString:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v6 = [v5 metadata];
    [v6 setBrandIdentifier:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

CFTypeRef MRContentItemGetBrandIdentifier(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 brandIdentifier];

  if (!v2) {
    return 0;
  }

  return CFAutorelease(v2);
}

CFTypeRef MRContentItemGetParentIdentifier(void *a1)
{
  CFTypeRef result = [a1 parentIdentifier];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

uint64_t MRContentItemSetParentIdentifier(void *a1, const char *a2)
{
  return [a1 setParentIdentifier:a2];
}

CFTypeRef MRContentItemGetAncestorIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 ancestorIdentifier];
  if (v2) {
    [v1 ancestorIdentifier];
  }
  else {
  uint64_t v3 = [v1 identifier];
  }

  CFTypeRef v4 = CFAutorelease(v3);
  return v4;
}

uint64_t MRContentItemSetAncestorIdentifier(void *a1, const char *a2)
{
  return [a1 setAncestorIdentifier:a2];
}

uint64_t MRContentItemGetEpisodeType(void *a1)
{
  id v1 = [a1 metadata];
  uint64_t v2 = [v1 episodeType];

  return v2;
}

uint64_t MRContentItemSetRequestIdentifier(void *a1, const char *a2)
{
  return [a1 setRequestIdentifier:a2];
}

void MRContentItemSetReportingAdamID(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  CFTypeRef v4 = [v8 metadata];
  if ([v4 reportingAdamID] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasReportingAdamID];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v7 = [v8 metadata];
  [v7 setReportingAdamID:a2];

LABEL_8:
}

void MRContentItemSetLyricsAdamID(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  MRCreateItemMetadataIfNotPresent(a1);
  id v8 = a1;
  CFTypeRef v4 = [v8 metadata];
  if ([v4 lyricsAdamID] == a2)
  {
    id v5 = [v8 metadata];
    char v6 = [v5 hasLyricsAdamID];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v7 = [v8 metadata];
  [v7 setLyricsAdamID:a2];

LABEL_8:
}

BOOL MRContentItemCalculatedPlaybackPositionIsEqual(void *a1, void *a2)
{
  CFTypeRef v4 = [MEMORY[0x1E4F1C9C8] date];
  double CalculatedPlaybackPosition = _MRContentItemGetCalculatedPlaybackPosition(a1, v4);
  double v6 = _MRContentItemGetCalculatedPlaybackPosition(a2, v4);
  char v7 = [a1 metadata];
  [v7 playbackRate];
  float v9 = v8;

  id v10 = [a2 metadata];
  [v10 playbackRate];
  float v12 = v11;

  if (v9 >= v12) {
    uint64_t v13 = a2;
  }
  else {
    uint64_t v13 = a1;
  }
  uint64_t v14 = [v13 metadata];
  [v14 playbackRate];
  float v16 = v15;

  return vabdd_f64(CalculatedPlaybackPosition, v6) < v16;
}

void MRContentItemSetArtworkFileURL(void *a1, const __CFString *a2)
{
  CFURLRef v3 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __MRContentItemSetArtworkFileURL_block_invoke;
  v4[3] = &__block_descriptor_40_e27_B24__0__MRContentItem_8_v16l;
  v4[4] = v3;
  MRContentItemSetMetadataRef(a1, (uint64_t)v3, v4);
  if (v3) {
    CFRelease(v3);
  }
}

BOOL __MRContentItemSetArtworkFileURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = [v5 metadata];
  char v7 = [v6 artworkFileURL];
  BOOL v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  float v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  id v10 = [v5 metadata];
  float v11 = [v10 artworkFileURL];
  char v12 = [v11 isEqual:a3];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    double v6 = [v5 metadata];
    [v6 setArtworkFileURL:v13];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

uint64_t MRContentItemCreateFromNowPlayingInfo(uint64_t a1)
{
  uint64_t v2 = [MRContentItem alloc];

  return (uint64_t)[(MRContentItem *)v2 initWithNowPlayingInfo:a1];
}

uint64_t MRContentItemEqualToItem(void *a1, const char *a2)
{
  return [a1 isEqual:a2];
}

uint64_t MRContentItemCopyExtractedIdentifierFromNowPlayingInfo(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

void *MRContentItemsCopyIdentifiers(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    CFURLRef v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          float v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    CFURLRef v3 = 0;
  }

  return v3;
}

uint64_t MRContentItemCopyReadableDescription(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

__CFString *MRContentItemsCopyReadableDescription(void *a1, uint64_t a2)
{
  return _MRContentItemsCopyReadableDescription(a1, a2, 0);
}

void *MRContentItemCreateMergedItem(void *a1, void *a2)
{
  CFURLRef v3 = (void *)[a1 copy];
  MRContentItemMerge(v3, a2);
  return v3;
}

void *MRContentItemCopyWithIdentifier(void *a1, uint64_t a2)
{
  CFURLRef v3 = (void *)[a1 copy];
  [v3 setIdentifier:a2];
  return v3;
}

uint64_t _MRVideoThumbnailProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadData();
        long long v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void MRVirtualVoiceInputSetRecordingEndpoint(uint64_t a1)
{
  uint64_t v2 = (void *)MRGetSharedService();

  MRMediaRemoteServiceSetVoiceRecordingEndpoint(v2, a1);
}

void MRVirtualVoiceInputSetRecordingState(unsigned int a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a4;
  id v9 = a3;
  char v8 = (void *)MRGetSharedService();
  MRMediaRemoteServiceVirtualVoiceSetRecordingState(v8, a1, a2, v9, v7);
}

void MRVirtualVoiceInputGetDevices(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  id v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceVirtualVoiceGetDevices(v4, v5, v3);
}

void MRVirtualVoiceInputRegisterDevice(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceVirtualVoiceRegisterDevice(v6, a1, v7, v5);
}

void MRVirtualVoiceInputUnregisterDevice(unsigned int a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceVirtualVoiceUnregisterDevice(v6, a1, v7, v5);
}

void MRVirtualVoiceInputSetRecordingStateCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v5 = [v7 notificationClient];
  [v5 setReceivesVoiceInputRecordingStateNotifications:1];

  uint64_t v6 = +[MRVVIClient sharedClient];
  [v6 setRecordingStateCallback:v4 forDeviceID:a1];
}

void MRVirtualVoiceInputProcessAudioData(unsigned int a1, const char *a2, double a3, double a4, float a5)
{
  unint64_t v10 = (void *)MRGetSharedService();

  MRMediaRemoteServiceVirtualVoiceProcessAudioData(v10, a1, a2, a3, a4, a5);
}

void sub_19518F694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MRClientUpdatesConfigurationProtobufReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        a1[24] |= 4u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_67;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_69;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_69:
        BOOL v55 = v19 != 0;
        uint64_t v56 = 18;
        goto LABEL_90;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        a1[24] |= 1u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                uint64_t v26 = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_73:
        BOOL v55 = v26 != 0;
        uint64_t v56 = 16;
        goto LABEL_90;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        a1[24] |= 0x20u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                uint64_t v32 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_77:
        BOOL v55 = v32 != 0;
        uint64_t v56 = 21;
        goto LABEL_90;
      case 4u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v38 = 0;
        a1[24] |= 2u;
        while (2)
        {
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 1;
            v38 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v14 = v37++ >= 9;
              if (v14)
              {
                uint64_t v38 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v38 = 0;
        }
LABEL_81:
        BOOL v55 = v38 != 0;
        uint64_t v56 = 17;
        goto LABEL_90;
      case 5u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        a1[24] |= 8u;
        while (2)
        {
          uint64_t v45 = *v3;
          unint64_t v46 = *(void *)(a2 + v45);
          if (v46 == -1 || v46 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v46 + 1;
            v44 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v14 = v43++ >= 9;
              if (v14)
              {
                uint64_t v44 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_85:
        BOOL v55 = v44 != 0;
        uint64_t v56 = 19;
        goto LABEL_90;
      case 6u:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v50 = 0;
        a1[24] |= 0x10u;
        while (2)
        {
          uint64_t v51 = *v3;
          unint64_t v52 = *(void *)(a2 + v51);
          if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v50 |= (unint64_t)(v53 & 0x7F) << v48;
            if (v53 < 0)
            {
              v48 += 7;
              BOOL v14 = v49++ >= 9;
              if (v14)
              {
                uint64_t v50 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v50 = 0;
        }
LABEL_89:
        BOOL v55 = v50 != 0;
        uint64_t v56 = 20;
LABEL_90:
        a1[v56] = v55;
        goto LABEL_91;
      case 7u:
        uint64_t v54 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        [a1 addSubscribedPlayerPaths:v54];
        if (PBReaderPlaceMark()
          && _MRNowPlayingPlayerPathProtobufReadFrom((id *)&v54->super.super.isa, a2))
        {
          PBReaderRecallMark();

LABEL_91:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_91;
    }
  }
}

void sub_195191598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951916FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_195192A7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_195193DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19519580C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951959A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951960AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195196804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

void sub_195196BB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195196C64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_195197058(_Unwind_Exception *a1)
{
}

void sub_195197724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _MRSystemPlaybackCustomDataQueueProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_195198AE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1951996DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19519B198(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id initValAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired()
{
  if (AVFoundationLibrary_sOnce_10 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_10, &__block_literal_global_97);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib_10, "AVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired");
  if (v0) {
    objc_storeStrong((id *)&constantValAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired, *v0);
  }
  getAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired = (uint64_t (*)())AVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequiredFunction;
  uint64_t v1 = (void *)constantValAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired;

  return v1;
}

id AVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequiredFunction()
{
  return (id)constantValAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired;
}

id initValAVOutputDeviceGroupAddOutputDeviceOptionInitiator()
{
  if (AVFoundationLibrary_sOnce_10 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_10, &__block_literal_global_97);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib_10, "AVOutputDeviceGroupAddOutputDeviceOptionInitiator");
  if (v0) {
    objc_storeStrong((id *)&constantValAVOutputDeviceGroupAddOutputDeviceOptionInitiator, *v0);
  }
  getAVOutputDeviceGroupAddOutputDeviceOptionInitiator = (uint64_t (*)())AVOutputDeviceGroupAddOutputDeviceOptionInitiatorFunction;
  uint64_t v1 = (void *)constantValAVOutputDeviceGroupAddOutputDeviceOptionInitiator;

  return v1;
}

id AVOutputDeviceGroupAddOutputDeviceOptionInitiatorFunction()
{
  return (id)constantValAVOutputDeviceGroupAddOutputDeviceOptionInitiator;
}

id initValAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator()
{
  if (AVFoundationLibrary_sOnce_10 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_10, &__block_literal_global_97);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib_10, "AVOutputDeviceGroupRemoveOutputDeviceOptionInitiator");
  if (v0) {
    objc_storeStrong((id *)&constantValAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator, *v0);
  }
  getAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator = (uint64_t (*)())AVOutputDeviceGroupRemoveOutputDeviceOptionInitiatorFunction;
  uint64_t v1 = (void *)constantValAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator;

  return v1;
}

id AVOutputDeviceGroupRemoveOutputDeviceOptionInitiatorFunction()
{
  return (id)constantValAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator;
}

id initValAVOutputDeviceGroupVolumeDidChangeNotification()
{
  if (AVFoundationLibrary_sOnce_10 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_10, &__block_literal_global_97);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib_10, "AVOutputDeviceGroupVolumeDidChangeNotification");
  if (v0) {
    objc_storeStrong((id *)&constantValAVOutputDeviceGroupVolumeDidChangeNotification, *v0);
  }
  getAVOutputDeviceGroupVolumeDidChangeNotification = (uint64_t (*)())AVOutputDeviceGroupVolumeDidChangeNotificationFunction;
  uint64_t v1 = (void *)constantValAVOutputDeviceGroupVolumeDidChangeNotification;

  return v1;
}

id AVOutputDeviceGroupVolumeDidChangeNotificationFunction()
{
  return (id)constantValAVOutputDeviceGroupVolumeDidChangeNotification;
}

id initValAVOutputDeviceGroupVolumeControlTypeDidChangeNotification()
{
  if (AVFoundationLibrary_sOnce_10 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_10, &__block_literal_global_97);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib_10, "AVOutputDeviceGroupVolumeControlTypeDidChangeNotification");
  if (v0) {
    objc_storeStrong((id *)&constantValAVOutputDeviceGroupVolumeControlTypeDidChangeNotification, *v0);
  }
  getAVOutputDeviceGroupVolumeControlTypeDidChangeNotification = (uint64_t (*)())AVOutputDeviceGroupVolumeControlTypeDidChangeNotificationFunction;
  uint64_t v1 = (void *)constantValAVOutputDeviceGroupVolumeControlTypeDidChangeNotification;

  return v1;
}

id AVOutputDeviceGroupVolumeControlTypeDidChangeNotificationFunction()
{
  return (id)constantValAVOutputDeviceGroupVolumeControlTypeDidChangeNotification;
}

id AVOutputDeviceVolumeDidChangeNotificationFunction_0()
{
  return (id)constantValAVOutputDeviceVolumeDidChangeNotification_0;
}

id AVOutputDeviceCanSetVolumeDidChangeNotificationFunction_0()
{
  return (id)constantValAVOutputDeviceCanSetVolumeDidChangeNotification_0;
}

BOOL _MRUpdateContentItemMessageProtobufReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_MRContentItemProtobuf);
        [a1 addContentItems:v17];
        if (!PBReaderPlaceMark() || (_MRContentItemProtobufReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
    objc_storeStrong(a1 + 2, v17);
    if (!PBReaderPlaceMark() || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *MRIRRouteBuiltInSpeakerIdentifier()
{
  return @"Speaker";
}

uint64_t _MRAudioBufferProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
        objc_storeStrong((id *)(a1 + 40), v17);
        if PBReaderPlaceMark() && (_MRAudioFormatSettingsProtobufReadFrom((uint64_t)v17, a2)) {
          goto LABEL_48;
        }
        goto LABEL_64;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_52:
        uint64_t v37 = 16;
        goto LABEL_61;
      case 3u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_56:
        uint64_t v37 = 8;
        goto LABEL_61;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v21 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_60:
        uint64_t v37 = 24;
LABEL_61:
        *(void *)(a1 + v37) = v21;
        goto LABEL_62;
      case 5u:
        uint64_t v35 = PBReaderReadData();
        char v36 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v35;

        goto LABEL_62;
      case 6u:
        uint64_t v17 = objc_alloc_init(_MRAudioStreamPacketDescriptionProtobuf);
        [(id)a1 addPacketDescriptions:v17];
        if (PBReaderPlaceMark()
          && (_MRAudioStreamPacketDescriptionProtobufReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_62:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_64:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_62;
    }
  }
}

uint64_t _MRGameControllerMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_38;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_40;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_38:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_40:
        *(void *)(a1 + 8) = v19;
        goto LABEL_41;
      case 2u:
        char v24 = objc_alloc_init(_MRGameControllerMotionProtobuf);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || !_MRGameControllerMotionProtobufReadFrom((uint64_t)v24, a2)) {
          goto LABEL_43;
        }
        goto LABEL_36;
      case 3u:
        char v24 = objc_alloc_init(_MRGameControllerButtonsProtobuf);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || !_MRGameControllerButtonsProtobufReadFrom((uint64_t)v24, a2)) {
          goto LABEL_43;
        }
        goto LABEL_36;
      case 4u:
        char v24 = objc_alloc_init(_MRGameControllerDigitizerProtobuf);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark()
          && (_MRGameControllerDigitizerProtobufReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

void sub_1951A13C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers(uint64_t a1)
{
  uint64_t v2 = [MRPlaybackQueueRequest alloc];

  return (uint64_t)[(MRPlaybackQueueRequest *)v2 initWithIdentifiers:a1];
}

uint64_t MRPlaybackQueueRequestCreateWithCurrentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [MRPlaybackQueueRequest alloc];

  return (uint64_t)-[MRPlaybackQueueRequest initWithIdentifiers:range:](v6, "initWithIdentifiers:range:", a3, a1, a2);
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestCopy(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = [NSString stringWithUTF8String:"MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopy(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 40, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 copy];
}

void *MRPlaybackQueueRequestCopyWithRange(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      char v8 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopyWithRange(MRPlaybackQueueRequestRef, CFRange)");
      uint64_t v9 = objc_opt_class();
      [v7 handleFailureInFunction:v8, @"MRPlaybackQueueRequest_Deprecated.m", 48, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
    }
  }

  return MRPlaybackQueueRequestCopyWithCurrentState(a1, a2, a3, 0);
}

void *MRPlaybackQueueRequestCopyWithCurrentState(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopyWithCurrentState(MRPlaybackQueueRequestRef, CFRange, CFArrayRef)");
      uint64_t v12 = objc_opt_class();
      [v10 handleFailureInFunction:v11, @"MRPlaybackQueueRequest_Deprecated.m", 56, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
    }
  }
  char v8 = (void *)[v7 copy];
  [v8 setContentItemIdentifiers:a4];
  [v8 setLocation:a2];
  [v8 setLength:a3];

  return v8;
}

void *MRPlaybackQueueRequestCreateMergedRequest(void *a1, void *a2)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      char v8 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateMergedRequest(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
      uint64_t v9 = objc_opt_class();
      [v7 handleFailureInFunction:v8, @"MRPlaybackQueueRequest_Deprecated.m", 67, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];
    }
  }
  id v4 = a2;
  uint64_t v5 = (void *)[a1 copy];
  [v5 mergeFrom:v4];

  return v5;
}

uint64_t MRPlaybackQueueRequestSetIncludeLyrics(void *a1, const char *a2)
{
  return [a1 setIncludeLyrics:a2];
}

uint64_t MRPlaybackQueueRequestSetIncludeAlignments(void *a1, uint64_t a2)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestSetIncludeAlignments(MRPlaybackQueueRequestRef, _Bool)");
      uint64_t v7 = objc_opt_class();
      [v5 handleFailureInFunction:v6, @"MRPlaybackQueueRequest_Deprecated.m", 120, @"Type mismatch, expecting %@ found %@", v7, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 setIncludeAlignments:a2];
}

void MRPlaybackQueueRequestSetIncludeArtwork(void *a1, double a2, double a3)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestSetIncludeArtwork(MRPlaybackQueueRequestRef, double, double)");
      uint64_t v8 = objc_opt_class();
      [v6 handleFailureInFunction:v7, @"MRPlaybackQueueRequest_Deprecated.m", 136, @"Type mismatch, expecting %@ found %@", v8, objc_opt_class() file lineNumber description];
    }
  }
  id v9 = a1;
  [v9 setArtworkWidth:a2];
  [v9 setArtworkHeight:a3];
}

void *MRPlaybackQueueRequestGetRequestID(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFStringRef MRPlaybackQueueRequestGetRequestID(MRPlaybackQueueRequestRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRPlaybackQueueRequest_Deprecated.m", 145, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [a1 requestIdentifier];

  return v2;
}

uint64_t MRPlaybackQueueRequestSetRequestID(void *a1, uint64_t a2)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestSetRequestID(MRPlaybackQueueRequestRef, CFStringRef)");
      uint64_t v7 = objc_opt_class();
      [v5 handleFailureInFunction:v6, @"MRPlaybackQueueRequest_Deprecated.m", 153, @"Type mismatch, expecting %@ found %@", v7, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 setRequestIdentifier:a2];
}

uint64_t MRPlaybackQueueRequestCopyDescription(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = [NSString stringWithUTF8String:"CFStringRef MRPlaybackQueueRequestCopyDescription(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 161, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [a1 description];
  return objc_claimAutoreleasedReturnValue();
}

void *MRPlaybackQueueRequestGetLabel(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFStringRef MRPlaybackQueueRequestGetLabel(MRPlaybackQueueRequestRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRPlaybackQueueRequest_Deprecated.m", 177, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [a1 label];

  return v2;
}

void *MRPlaybackQueueRequestGetRequestedIdentifiers(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"CFArrayRef MRPlaybackQueueRequestGetRequestedIdentifiers(MRPlaybackQueueRequestRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRPlaybackQueueRequest_Deprecated.m", 185, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [a1 contentItemIdentifiers];

  return v2;
}

BOOL MRPlaybackQueueRequestRangeContainsNowPlayingItem(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestRangeContainsNowPlayingItem(MRPlaybackQueueRequestRef)"];
      uint64_t v10 = objc_opt_class();
      [v8 handleFailureInFunction:v9, @"MRPlaybackQueueRequest_Deprecated.m", 201, @"Type mismatch, expecting %@ found %@", v10, objc_opt_class() file lineNumber description];
    }
  }
  id v2 = a1;
  uint64_t v3 = [v2 location];
  uint64_t v4 = [v2 location];
  uint64_t v5 = [v2 length];

  return v3 < 1 && v5 + v4 > 0;
}

uint64_t MRPlaybackQueueRequestGetIncludeLyrics(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestGetIncludeLyrics(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 219, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 includeLyrics];
}

uint64_t MRPlaybackQueueRequestGetArtworkWidth(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"double MRPlaybackQueueRequestGetArtworkWidth(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 259, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 artworkWidth];
}

uint64_t MRPlaybackQueueRequestGetArtworkHeight(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"double MRPlaybackQueueRequestGetArtworkHeight(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 267, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 artworkHeight];
}

uint64_t MRPlaybackQueueRequestShouldRequestItem(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestShouldRequestItem(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 275, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 shouldRequestItem];
}

uint64_t MRPlaybackQueueRequestShouldRequestItemNotConsideringMetadata(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestShouldRequestItemNotConsideringMetadata(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 283, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 shouldRequestItemNotConsideringMetadata];
}

uint64_t MRPlaybackQueueRequestContainsNonDefaultAssets(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestContainsNonDefaultAssets(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 291, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 containsNonDefaultAssets];
}

uint64_t MRPlaybackQueueRequestCreateSkeletonFrom(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateSkeletonFrom(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 299, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [a1 skeleton];
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestCreateExternalRepresentation(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"CFDataRef MRPlaybackQueueRequestCreateExternalRepresentation(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 307, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }
  [a1 data];
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestHasRange(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestHasRange(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 315, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 hasRange];
}

uint64_t MRPlaybackQueueRequestCreateFromExternalRepresentation(uint64_t a1)
{
  id v2 = [MRPlaybackQueueRequest alloc];

  return (uint64_t)[(MRPlaybackQueueRequest *)v2 initWithData:a1];
}

uint64_t MRPlaybackQueueRequestMerge(void *a1, uint64_t a2)
{
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestMerge(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v7 = objc_opt_class();
    [v5 handleFailureInFunction:v6, @"MRPlaybackQueueRequest_Deprecated.m", 328, @"Type mismatch, expecting %@ found %@", v7, objc_opt_class() file lineNumber description];

    if (!a2) {
      goto LABEL_6;
    }
  }
  else if (!a2)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestMerge(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v10 = objc_opt_class();
    [v8 handleFailureInFunction:v9, @"MRPlaybackQueueRequest_Deprecated.m", 329, @"Type mismatch, expecting %@ found %@", v10, objc_opt_class() file lineNumber description];
  }
LABEL_6:

  return [a1 mergeFrom:a2];
}

uint64_t MRPlaybackQueueRequestMatch(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRPlaybackQueueRequest_Deprecated.m", 340, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v12 = objc_opt_class();
    [v10 handleFailureInFunction:v11, @"MRPlaybackQueueRequest_Deprecated.m", 341, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  if (v3) {
    uint64_t v5 = [v3 match:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t MRPlaybackQueueRequestIsExactMatch(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestIsExactMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MRPlaybackQueueRequest_Deprecated.m", 350, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestIsExactMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    uint64_t v12 = objc_opt_class();
    [v10 handleFailureInFunction:v11, @"MRPlaybackQueueRequest_Deprecated.m", 351, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  uint64_t v5 = [v3 exactMatch:v4];

  return v5;
}

uint64_t MRPlaybackQueueRequestGetReturnContentItemAssetsInUserCompletion()
{
  return 1;
}

uint64_t MRPlaybackQueueRequestCreateFromTransactionName(uint64_t a1)
{
  id v2 = [MRPlaybackQueueRequest alloc];

  return (uint64_t)[(MRPlaybackQueueRequest *)v2 initFromTransactionName:a1];
}

uint64_t MRPlaybackQueueRequestCreateDefaultWithRange(uint64_t a1, uint64_t a2)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestSetIsLegacyNowPlayingInfoRequest(void *a1, uint64_t a2)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRPlaybackQueueRequestSetIsLegacyNowPlayingInfoRequest(MRPlaybackQueueRequestRef, _Bool)");
      uint64_t v7 = objc_opt_class();
      [v5 handleFailureInFunction:v6, @"MRPlaybackQueueRequest_Deprecated.m", 378, @"Type mismatch, expecting %@ found %@", v7, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 setLegacyNowPlayingInfoRequest:a2];
}

uint64_t MRPlaybackQueueRequestGetIsLegacyNowPlayingInfoRequest(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = [NSString stringWithUTF8String:"_Bool MRPlaybackQueueRequestGetIsLegacyNowPlayingInfoRequest(MRPlaybackQueueRequestRef)"];
      uint64_t v5 = objc_opt_class();
      [v3 handleFailureInFunction:v4, @"MRPlaybackQueueRequest_Deprecated.m", 386, @"Type mismatch, expecting %@ found %@", v5, objc_opt_class() file lineNumber description];
    }
  }

  return [a1 isLegacyNowPlayingInfoRequest];
}

MRPlaybackQueueRequest *MRPlaybackQueueRequestCreateAssetsFrom(uint64_t a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateAssetsFrom(MRPlaybackQueueRequestRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MRPlaybackQueueRequest_Deprecated.m", 394, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  id v2 = objc_alloc_init(MRPlaybackQueueRequest);
  MRPlaybackQueueRequestMerge(v2, a1);
  return v2;
}

void sub_1951A3F7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

uint64_t MRBundlePermittedForJoiningGroupSessions(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.Music"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.MediaRemoteUI"];
  }

  return v2;
}

uint64_t MRGroupSessionRouteTypeFromModelIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"AppleTV"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 containsString:@"AudioAccessory5"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 containsString:@"AudioAccessory"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *MRGroupSessionRouteTypeToModelIdentifier(char a1)
{
  if ((a1 - 8) > 3u) {
    return 0;
  }
  else {
    return off_1E57D9748[(char)(a1 - 8)];
  }
}

id MRGroupSessionTokenCreateWithInvitationData(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "MRGroupSessionToken * _Nonnull MRGroupSessionTokenCreateWithInvitationData(NSData *__strong _Nonnull, NSString * _Nullable __strong, NSNumber *__strong _Nonnull)");
    [v11 handleFailureInFunction:v12, @"MRGroupSession.m", 473, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];
  }
  uint64_t v8 = MRGetSharedService();
  uint64_t v9 = [v8 createTokenWithInvitationData:v5 equivalentMediaIdentifier:v6 version:v7];

  return v9;
}

id MRGroupSessionRouteMakeName(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2 <= 0xB && ((1 << a2) & 0xB00) == 0)
  {
    if (((1 << a2) & 6) != 0)
    {
      id v5 = NSString;
      id v6 = @"GROUPSESSION_ROUTE_FORMAT_CAR";
LABEL_7:
      id v7 = MRLocalizedStringWithFormat(v6);
      objc_msgSend(v5, "stringWithFormat:", v7, v4);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    if (a2 == 5)
    {
      id v5 = NSString;
      id v6 = @"GROUPSESSION_ROUTE_FORMAT_SPEAKER";
      goto LABEL_7;
    }
  }
  id v8 = v3;
LABEL_9:

  return v8;
}

void MRGroupSessionJoinSessionWithToken(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRGroupSessionJoinSessionWithToken(MRGroupSessionToken *__strong _Nonnull, void (^__strong _Nonnull)(NSString *__strong, NSError * _Nullable __strong))");
    [v10 handleFailureInFunction:v11, @"MRGroupSession.m", 526, @"Invalid parameter not satisfying: %@", @"token" file lineNumber description];
  }
  id v5 = MRGetSharedService();
  id v6 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Requesting to join session with token: %@", buf, 0xCu);
  }

  id v7 = MRGroupSessionSubsystemGetQueue();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MRGroupSessionJoinSessionWithToken_block_invoke;
  v12[3] = &unk_1E57D9610;
  id v13 = v3;
  id v14 = v4;
  id v8 = v3;
  id v9 = v4;
  [v5 joinGroupSessionWithToken:v8 queue:v7 completion:v12];
}

id MRGroupSessionSubsystemGetQueue()
{
  if (MRGroupSessionSubsystemGetQueue_onceToken != -1) {
    dispatch_once(&MRGroupSessionSubsystemGetQueue_onceToken, &__block_literal_global_100);
  }
  v0 = (void *)MRGroupSessionSubsystemGetQueue___queue;

  return v0;
}

void __MRGroupSessionJoinSessionWithToken_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      id v8 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __MRGroupSessionJoinSessionWithToken_block_invoke_cold_1(a1, (uint64_t)v7, v8);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) equivalentMediaIdentifier];
      uint64_t v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (void *)v9;
      }
      else {
        uint64_t v11 = v5;
      }
      id v12 = v11;

      id v13 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Joined group session: %{public}@. Waiting for ASE", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v31 = 0x3032000000;
      uint64_t v32 = __Block_byref_object_copy__45;
      unint64_t v33 = __Block_byref_object_dispose__45;
      id v34 = 0;
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      char v29 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_325;
      v22[3] = &unk_1E57D95E8;
      unsigned int v26 = v28;
      id v14 = v12;
      id v23 = v14;
      p_long long buf = &buf;
      id v24 = v5;
      id v25 = *(id *)(a1 + 40);
      int v15 = (void *)MEMORY[0x1997190F0](v22);
      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_329;
      v20[3] = &unk_1E57D42B8;
      uint64_t v17 = v15;
      id v21 = v17;
      uint64_t v18 = [v16 addObserverForName:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0 queue:0 usingBlock:v20];
      uint64_t v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v18;

      v17[2](v17);
      _Block_object_dispose(v28, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
}

void sub_1951A6950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __MRGroupSessionJoinSessionWithToken_block_invoke_325(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRGroupSessionSubsystemGetQueue();
  dispatch_assert_queue_V2(v2);

  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = +[MRNowPlayingOriginClientManager sharedManager];
    id v4 = [v3 activeSystemEndpointOutputDeviceUIDForType:0];
    int v5 = [v4 isEqualToString:a1[4]];

    if (v5)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:*(void *)(*(void *)(a1[8] + 8) + 40)];

      id v7 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = a1[5];
        int v9 = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Resolved ASE to session: %@", (uint8_t *)&v9, 0xCu);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

void __MRGroupSessionJoinSessionWithToken_block_invoke_329(uint64_t a1)
{
  uint64_t v2 = MRGroupSessionSubsystemGetQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_2;
  block[3] = &unk_1E57D0FC0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __MRGroupSessionJoinSessionWithToken_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void MRGroupSessionLeaveSessionWithIdentifier(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRGroupSessionLeaveSessionWithIdentifier(NSString *__strong _Nonnull, void (^__strong _Nonnull)(NSError * _Nullable __strong))");
    [v9 handleFailureInFunction:v10, @"MRGroupSession.m", 566, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" file lineNumber description];
  }
  int v5 = MRGetSharedService();
  id v6 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Requesting to leave session with identifier: %@", buf, 0xCu);
  }

  id v7 = MRGroupSessionSubsystemGetQueue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __MRGroupSessionLeaveSessionWithIdentifier_block_invoke;
  v11[3] = &unk_1E57D0FE8;
  id v12 = v4;
  id v8 = v4;
  [v5 leaveGroupSessionWithIdentifier:v3 queue:v7 completion:v11];
}

void __MRGroupSessionLeaveSessionWithIdentifier_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Failed to leave session with error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id MRGroupSessionSubsystemGetNotificationQueue()
{
  if (MRGroupSessionSubsystemGetNotificationQueue_onceToken != -1) {
    dispatch_once(&MRGroupSessionSubsystemGetNotificationQueue_onceToken, &__block_literal_global_601);
  }
  v0 = (void *)MRGroupSessionSubsystemGetNotificationQueue___queue;

  return v0;
}

void sub_1951A7260(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

__CFString *MRGroupSessionRouteTypeDescription(unsigned int a1)
{
  if (a1 < 0xC && ((0xB27u >> a1) & 1) != 0)
  {
    id v1 = off_1E57D9768[(char)a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MRGroupSessionRouteType-Unknown(%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

void sub_1951A7BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A7CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A7E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A7FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A8154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A82F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A8490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A85E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A8798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A8948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951A8DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951A9324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951A9758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void MRGroupSessionSendEvent(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  MRGetSharedService();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = MRGroupSessionSubsystemGetQueue();
  [v6 sendEvent:v4 queue:v5 completion:v3];
}

void sub_1951AA03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MRSetGroupSessionNearbyContactDiscoveryEnabled(uint64_t a1)
{
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 groupSessionNearbyContactDiscoveryEnabled];

  if (v3 != a1)
  {
    id v4 = +[MRUserSettings currentSettings];
    [v4 setGroupSessionNearbyContactDiscoveryEnabled:a1];
  }
}

uint64_t MRGroupSessionNearbyContactDiscoveryEnabled()
{
  v0 = +[MRUserSettings currentSettings];
  uint64_t v1 = [v0 groupSessionNearbyContactDiscoveryEnabled];

  return v1;
}

void MRSetGroupSessionContactAutoApprovalEnabled(uint64_t a1)
{
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 groupSessionContactAutoApprovalEnabled];

  if (v3 != a1)
  {
    id v4 = +[MRUserSettings currentSettings];
    [v4 setGroupSessionContactAutoApprovalEnabled:a1];
  }
}

uint64_t MRGroupSessionContactAutoApprovalEnabled()
{
  v0 = +[MRUserSettings currentSettings];
  uint64_t v1 = [v0 groupSessionContactAutoApprovalEnabled];

  return v1;
}

void __MRGroupSessionSubsystemGetQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRGroupSessionSubsystem.targetQueue", v2);
  uint64_t v1 = (void *)MRGroupSessionSubsystemGetQueue___queue;
  MRGroupSessionSubsystemGetQueue___queue = (uint64_t)v0;
}

void __MRGroupSessionSubsystemGetNotificationQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRGroupSessionSubsystem.targetNotificationQueue", v2);
  uint64_t v1 = (void *)MRGroupSessionSubsystemGetNotificationQueue___queue;
  MRGroupSessionSubsystemGetNotificationQueue___queue = (uint64_t)v0;
}

id MRGroupSessionRouteTypeLocalizedString(int a1)
{
  if ((a1 - 1) > 0xA) {
    uint64_t v1 = @"GROUPSESSION_ROUTE_SPEAKER";
  }
  else {
    uint64_t v1 = off_1E57D97C8[(char)(a1 - 1)];
  }
  uint64_t v2 = MRLocalizedString(v1);

  return v2;
}

uint64_t MROutputDeviceTypeFromGroupSessionRoute(int a1)
{
  if ((a1 - 1) > 0xA) {
    return 0;
  }
  else {
    return dword_1952246B0[(char)(a1 - 1)];
  }
}

uint64_t MROutputDeviceSubtypeFromGroupSessionRoute(int a1)
{
  if ((a1 - 1) > 0xA) {
    return 0;
  }
  else {
    return dword_1952246DC[(char)(a1 - 1)];
  }
}

uint64_t MRGroupSessionRouteTypeForOutputDevices(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v6, "deviceType", (void)v15) == 3)
        {
          unsigned __int8 v13 = 2;
          goto LABEL_32;
        }
        if ([v6 deviceType] == 2 || objc_msgSend(v6, "deviceType") == 5)
        {
          if ([v6 deviceSubtype] == 14
            || (+[MRUserSettings currentSettings],
                uint64_t v7 = objc_claimAutoreleasedReturnValue(),
                char v8 = [v7 startGroupSessionsForAllRouteSubtypes],
                v7,
                (v8 & 1) != 0))
          {
            unsigned __int8 v13 = 1;
            goto LABEL_32;
          }
          if ([v6 deviceSubtype] == 1)
          {
            int v9 = +[MRSharedSettings currentSettings];
            char v10 = [v9 supportGroupSessionHome];

            if (v10)
            {
LABEL_27:
              unsigned __int8 v13 = 5;
              goto LABEL_32;
            }
          }
        }
        if ([v6 deviceType] == 1)
        {
          uint64_t v11 = +[MRSharedSettings currentSettings];
          int v12 = [v11 supportGroupSessionHome];

          if (v12)
          {
            if ([v6 deviceSubtype] == 13)
            {
              unsigned __int8 v13 = 11;
              goto LABEL_32;
            }
            if ([v6 deviceSubtype] == 12
              || [v6 deviceSubtype] == 15)
            {
              if ([v6 isB520Device]) {
                unsigned __int8 v13 = 9;
              }
              else {
                unsigned __int8 v13 = 8;
              }
              goto LABEL_32;
            }
            if ([v6 deviceSubtype] == 1
              || [v6 deviceSubtype] == 11
              || [v6 deviceSubtype] == 17)
            {
              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
      unsigned __int8 v13 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }
LABEL_32:

  return v13;
}

MRGroupComposition *MRGroupCompositionForMRGroupSessionRouteType(int a1)
{
  uint64_t v2 = objc_alloc_init(MRGroupComposition);
  uint64_t v3 = v2;
  switch(a1)
  {
    case 0:
      [(MRGroupComposition *)v2 setUnknownCount:1];
      break;
    case 1:
      [(MRGroupComposition *)v2 setVehicleCount:1];
      break;
    case 2:
      [(MRGroupComposition *)v2 setCarplayCount:1];
      break;
    case 5:
      [(MRGroupComposition *)v2 setLofiCount:1];
      break;
    case 8:
      [(MRGroupComposition *)v2 setHomePodCount:1];
      break;
    case 9:
      [(MRGroupComposition *)v2 setHomePodMiniCount:1];
      break;
    case 11:
      [(MRGroupComposition *)v2 setAtvCount:1];
      break;
    default:
      break;
  }

  return v3;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t _MRRemoveClientMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        long long v17 = objc_alloc_init(_MRNowPlayingClientProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRNowPlayingClientProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951AF49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951AFB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 240), 8);
  _Block_object_dispose((const void *)(v53 - 192), 8);
  _Block_object_dispose((const void *)(v53 - 144), 8);
  _Block_object_dispose((const void *)(v53 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1951B2370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1951B24A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MRGroupSessionIdentityShareMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        long long v17 = objc_alloc_init(_MRUserIdentityProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRUserIdentityProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRGetRemoteTextInputSessionProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  id v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t _MRAudioFadeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        long long v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGameControllerAccelerationProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadData();
              unsigned int v19 = *(void **)(a1 + 8);
              *(void *)(a1 + 8) = v18;

              goto LABEL_43;
            case 2u:
              *(unsigned char *)(a1 + 32) |= 2u;
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
                *(void *)(a2 + v28) = v29 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v30 = 20;
              goto LABEL_42;
            case 3u:
              *(unsigned char *)(a1 + 32) |= 4u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v30 = 24;
              goto LABEL_42;
            case 4u:
              *(unsigned char *)(a1 + 32) |= 8u;
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v30 = 28;
              goto LABEL_42;
            case 5u:
              *(unsigned char *)(a1 + 32) |= 1u;
              uint64_t v25 = *v3;
              unint64_t v26 = *(void *)(a2 + v25);
              if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
                *(void *)(a2 + v25) = v26 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v30 = 16;
LABEL_42:
              *(_DWORD *)(a1 + v30) = v22;
              goto LABEL_43;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_43:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951B5974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _MRKeyboardMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v24;
      }
      else if (v17 == 3)
      {
        unint64_t v26 = objc_alloc_init(_MRTextEditingAttributesProtobuf);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || !_MRTextEditingAttributesProtobufReadFrom((uint64_t)v26, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *MRGroupTopologyModificationRequestTypeDescription(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E57D98E8[(int)a1];
  }

  return v1;
}

uint64_t _MRErrorProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_31;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 8) = v22;
        goto LABEL_39;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_31;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_31:
        unint64_t v26 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_39;
      case 5u:
        uint64_t v27 = objc_alloc_init(_MRErrorProtobuf);
        [(id)a1 addUnderlyingErrors:v27];
        if PBReaderPlaceMark() && (_MRErrorProtobufReadFrom(v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t _MRGetVolumeMutedMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRAudioDataBlockProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
      }
      else
      {
        if (v18 == 2)
        {
          unsigned int v19 = objc_alloc_init(_MRAudioTimeProtobuf);
          objc_storeStrong((id *)(a1 + 24), v19);
          if (!PBReaderPlaceMark() || !_MRAudioTimeProtobufReadFrom((uint64_t)v19, a2))
          {
LABEL_36:

            return 0;
          }
        }
        else
        {
          if (v18 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          unsigned int v19 = objc_alloc_init(_MRAudioBufferProtobuf);
          objc_storeStrong((id *)(a1 + 16), v19);
          if (!PBReaderPlaceMark() || (_MRAudioBufferProtobufReadFrom((uint64_t)v19, a2) & 1) == 0) {
            goto LABEL_36;
          }
        }
        PBReaderRecallMark();
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRRegisterGameControllerMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_MRGameControllerPropertiesProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (_MRGameControllerPropertiesProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRSendCommandResultMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 68) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_52;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_54:
        *(_DWORD *)(a1 + 64) = v20;
        goto LABEL_65;
      case 2u:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v25 = 0;
            unsigned int v26 = 0;
            uint64_t v27 = 0;
            while (1)
            {
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_40;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          while (1)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_64;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
          PBRepeatedInt32Add();
        }
        goto LABEL_65;
      case 3u:
        PBReaderReadData();
        uint64_t v31 = (_MRNowPlayingPlayerPathProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v31) {
          [(id)a1 addHandlerReturnStatusData:v31];
        }
        goto LABEL_50;
      case 4u:
        uint64_t v32 = PBReaderReadString();
        unint64_t v33 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v32;

        goto LABEL_65;
      case 5u:
        uint64_t v31 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 56), v31);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v31->super.super.isa, a2))
        {
          goto LABEL_68;
        }
        goto LABEL_49;
      case 6u:
        uint64_t v31 = objc_alloc_init(_MRSendCommandResultProtobuf);
        objc_storeStrong((id *)(a1 + 40), v31);
        if PBReaderPlaceMark() && (_MRSendCommandResultProtobufReadFrom((uint64_t)v31, a2))
        {
LABEL_49:
          PBReaderRecallMark();
LABEL_50:

LABEL_65:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_68:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_65;
    }
  }
}

void MRServiceClientPlaybackSessionCallback(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v14 = a3;
  int v5 = +[MRNowPlayingOriginClientManager sharedManager];
  id v6 = [v5 originClientForPlayerPath:a1];

  uint64_t v7 = [v6 playbackSessionCallback];
  char v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void (**)(id, void, void *)))(v7 + 16))(v7, a2, a1, v14);
  }
  else
  {
    unsigned int v9 = +[MRNowPlayingOriginClientManager sharedManager];
    unint64_t v10 = [v9 playerClientForPlayerPath:a1];

    uint64_t v11 = [v10 clientCallbacks];
    unint64_t v12 = [v11 playbackSessionCallback];

    if (v12)
    {
      v12[2](v12, a2, v14);
    }
    else
    {
      Error = (void *)MRMediaRemoteCreateError(15);
      v14[2](v14, 0, Error);
    }
  }
}

void MRServiceClientPlaybackSessionMigrateBeginCallback(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  char v8 = +[MRNowPlayingOriginClientManager sharedManager];
  unsigned int v9 = [v8 originClientForPlayerPath:v5];

  unint64_t v10 = [v9 playbackSessionMigrateBeginCallback];
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke;
    v18[3] = &unk_1E57D0F98;
    id v19 = v7;
    ((void (**)(void, id, id, void *))v10)[2](v10, v6, v5, v18);
    uint64_t v11 = v19;
  }
  else
  {
    unint64_t v12 = +[MRNowPlayingOriginClientManager sharedManager];
    uint64_t v11 = [v12 playerClientForPlayerPath:v5];

    char v13 = [v11 clientCallbacks];
    BOOL v14 = [v13 playbackSessionMigrateBeginCallback];

    if (v14)
    {
      [v11 addPendingPlaybackSessionMigrateEvent:v6];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke_2;
      v16[3] = &unk_1E57D0F98;
      id v17 = v7;
      ((void (**)(void, id, void *))v14)[2](v14, v6, v16);
    }
    else
    {
      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:15];
      (*((void (**)(id, void *))v7 + 2))(v7, v15);
    }
  }
}

uint64_t __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRServiceClientPlaybackSessionMigrateEndCallback(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[MRNowPlayingOriginClientManager sharedManager];
  unint64_t v12 = [v11 originClientForPlayerPath:v7];

  char v13 = [v12 playbackSessionMigrateEndCallback];
  if (v13)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke;
    v21[3] = &unk_1E57D0F98;
    id v22 = v10;
    ((void (**)(void, id, id, id, void *))v13)[2](v13, v9, v8, v7, v21);
    BOOL v14 = v22;
  }
  else
  {
    int v15 = +[MRNowPlayingOriginClientManager sharedManager];
    BOOL v14 = [v15 playerClientForPlayerPath:v7];

    int v16 = [v14 clientCallbacks];
    id v17 = [v16 playbackSessionMigrateEndCallback];

    if (v17)
    {
      if ([v14 removePendingPlaybackSessionMigrateEvent:v9])
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke_2;
        v19[3] = &unk_1E57D0F98;
        id v20 = v10;
        ((void (**)(void, id, id, void *))v17)[2](v17, v9, v8, v19);
      }
      else
      {
        (*((void (**)(id, void))v10 + 2))(v10, 0);
      }
    }
    else
    {
      char v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:15];
      (*((void (**)(id, void *))v10 + 2))(v10, v18);
    }
  }
}

uint64_t __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void MRServiceClientPlaybackSessionMigrateRequestCallback(void *a1, void *a2, void *a3, void *a4)
{
  id v19 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v11 = [v10 originClientForPlayerPath:v19];

  uint64_t v12 = [v11 playbackSessionMigrateRequestCallback];
  char v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id, id, id, void (**)(id, id, void *)))(v12 + 16))(v12, v7, v8, v19, v9);
  }
  else
  {
    BOOL v14 = +[MRNowPlayingOriginClientManager sharedManager];
    int v15 = [v14 playerClientForPlayerPath:v19];

    int v16 = [v15 clientCallbacks];
    id v17 = [v16 playbackSessionMigrateRequestCallback];

    if (v17)
    {
      ((void (**)(void, id, id, void (**)(id, id, void *)))v17)[2](v17, v7, v8, v9);
    }
    else
    {
      Error = (void *)MRMediaRemoteCreateError(15);
      v9[2](v9, v8, Error);
    }
  }
}

uint64_t _MRPlaybackSessionMigrateResponseMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v17 = objc_alloc_init(_MRPlaybackSessionMigrateRequestProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (_MRPlaybackSessionMigrateRequestProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void *MRLyricsItemGetLyrics(void *a1)
{
  uint64_t v1 = [a1 lyrics];

  return v1;
}

void *MRLyricsItemGetToken(void *a1)
{
  uint64_t v1 = [a1 token];

  return v1;
}

_MRLyricsTokenProtobuf *MRLyricsItemTokenCreate(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = MSVArchivedDataWithRootObject();
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = objc_alloc_init(_MRLyricsTokenProtobuf);
  [(_MRLyricsTokenProtobuf *)v4 setIdentifier:a1];
  [(_MRLyricsTokenProtobuf *)v4 setUserData:v3];
  return v4;
}

_MRLyricsTokenProtobuf *MRLyricsItemTokenCreateWithData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc_init(_MRLyricsTokenProtobuf);
  [(_MRLyricsTokenProtobuf *)v4 setIdentifier:a1];
  [(_MRLyricsTokenProtobuf *)v4 setUserData:a2];
  return v4;
}

void *MRLyricsItemTokenGetIdentifier(void *a1)
{
  uint64_t v1 = [a1 identifier];

  return v1;
}

void *MRLyricsItemTokenGetUserInfo(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 userData];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v4 = [v1 userData];
    uint64_t v2 = (void *)MSVUnarchivedObjectOfClasses();
  }
  return v2;
}

_MRLyricsEventProtobuf *MRLyricsEventCreateBegin(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc_init(_MRLyricsEventProtobuf);
  MEMORY[0x199718090](a1);
  -[_MRLyricsEventProtobuf setStartTime:](v4, "setStartTime:");
  [(_MRLyricsEventProtobuf *)v4 setToken:a2];
  return v4;
}

_MRLyricsEventProtobuf *MRLyricsEventCreateEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(_MRLyricsEventProtobuf);
  MEMORY[0x199718090](a1);
  -[_MRLyricsEventProtobuf setStartTime:](v6, "setStartTime:");
  if (a2)
  {
    MEMORY[0x199718090](a2);
    -[_MRLyricsEventProtobuf setEndTime:](v6, "setEndTime:");
  }
  [(_MRLyricsEventProtobuf *)v6 setToken:a3];
  return v6;
}

uint64_t MRLyricsItemTokenCreateExternalRepresentation(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRLyricsItemTokenCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [_MRLyricsTokenProtobuf alloc];

  return (uint64_t)[(_MRLyricsTokenProtobuf *)v2 initWithData:a1];
}

void *MRLyricsEventGetToken(void *a1)
{
  id v1 = [a1 token];

  return v1;
}

uint64_t MRLyricsEventCreateExternalRepresentation(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRLyricsEventCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [_MRLyricsEventProtobuf alloc];

  return (uint64_t)[(_MRLyricsEventProtobuf *)v2 initWithData:a1];
}

void MRMediaRemoteSetBeginLyricsEventCallback(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MRNowPlayingOriginClientManager sharedManager];
  id v5 = [v4 originClientForOrigin:a1];

  [v5 setBeginLyricsEventCallback:v3];
}

void MRMediaRemoteSetBeginLyricsEventCallbackForPlayer(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MRNowPlayingOriginClientManager sharedManager];
  id v6 = [v4 playerClientForPlayerPath:a1];

  id v5 = [v6 clientCallbacks];
  [v5 setBeginLyricsEventCallback:v3];
}

void MRMediaRemoteSetEndLyricsEventCallback(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MRNowPlayingOriginClientManager sharedManager];
  id v5 = [v4 originClientForOrigin:a1];

  [v5 setEndLyricsEventCallback:v3];
}

void MRMediaRemoteSetEndLyricsEventCallbackForPlayer(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MRNowPlayingOriginClientManager sharedManager];
  id v6 = [v4 playerClientForPlayerPath:a1];

  id v5 = [v6 clientCallbacks];
  [v5 setEndLyricsEventCallback:v3];
}

void MRMediaRemoteRemoteSendLyricsEvent(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [[MRPlayerPath alloc] initWithOrigin:a1 client:a2 player:0];
  MRMediaRemoteRemoteSendLyricsEventForPlayer(v4, a3);
}

void MRMediaRemoteRemoteSendLyricsEventForPlayer(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _MRLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = a2;
    __int16 v8 = 2112;
    unsigned int v9 = a1;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Sending Lyrics Event: %@ for PlayerPath %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSendLyricsEvent(v5, a1, a2);
}

void sub_1951BCF7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD07C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD188(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD1F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD274(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD2DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD3C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD89C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951BD9BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _onClientQueue_MRCreateSectionsForRequest(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  __int16 v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    char v18 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    [v17 handleFailureInFunction:v18, @"MRPlaybackQueueServiceClient.m", 203, @"Invalid parameter not satisfying: %@", @"clientState" file lineNumber description];

    if (v8)
    {
LABEL_3:
      if (v9) {
        goto LABEL_4;
      }
LABEL_13:
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
      [v21 handleFailureInFunction:v22, @"MRPlaybackQueueServiceClient.m", 205, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];

      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  id v20 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  [v19 handleFailureInFunction:v20, @"MRPlaybackQueueServiceClient.m", 204, @"Invalid parameter not satisfying: %@", @"datasource" file lineNumber description];

  if (!v9) {
    goto LABEL_13;
  }
LABEL_4:
  if (v10) {
    goto LABEL_5;
  }
LABEL_14:
  char v23 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  [v23 handleFailureInFunction:v24, @"MRPlaybackQueueServiceClient.m", 206, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

LABEL_5:
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = v8[2](v8, 0, v10);
  if (v12)
  {
    char v13 = (void *)v12;
    uint64_t v14 = 1;
    do
    {
      [v11 addObject:v13];

      char v13 = (void *)v8[2](v8, v14++, v10);
    }
    while (v13);
  }
  int v15 = (void *)[v11 copy];

  return v15;
}

id _onQueue_MRCreateSectionsForRequest(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  char v34 = v7;
  if (!v7)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    [v27 handleFailureInFunction:v28, @"MRPlaybackQueueServiceClient.m", 223, @"Invalid parameter not satisfying: %@", @"clientState" file lineNumber description];
  }
  unsigned int v35 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {
    unint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    char v30 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    [v29 handleFailureInFunction:v30, @"MRPlaybackQueueServiceClient.m", 224, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v32 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  [v31 handleFailureInFunction:v32, @"MRPlaybackQueueServiceClient.m", 225, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

LABEL_5:
  id v11 = MRContentItemCopyMinimalReadableDescription(v10);
  uint64_t v12 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ requesting child item of %{public}@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v52 = __Block_byref_object_copy__48;
  uint64_t v53 = __Block_byref_object_dispose__48;
  id v54 = (id)MEMORY[0x1E4F1CBF0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v46;
LABEL_9:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(obj);
      }
      int v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
      uint64_t v17 = [v16 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___onQueue_MRCreateSectionsForRequest_block_invoke;
      block[3] = &unk_1E57D9B48;
      void block[4] = v16;
      id v41 = v10;
      uint64_t v44 = buf;
      id v42 = v7;
      id v43 = v9;
      dispatch_sync((dispatch_queue_t)v17, block);

      LOBYTE(v17) = *(void *)(*(void *)&buf[8] + 40) == 0;
      if ((v17 & 1) == 0) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v13) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        Identifier = (const char *)MRContentItemGetIdentifier(v10);
        MRContentItemSetParentIdentifier(v22, Identifier);
        AncestorIdentifier = (const char *)MRContentItemGetAncestorIdentifier(v10);
        MRContentItemSetAncestorIdentifier(v22, AncestorIdentifier);
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v19);
  }

  id v25 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v25;
}

void sub_1951BF068(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

MRPlaybackQueue *_onClientQueue_MRCreatePlaybackQueueForOffset(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueue *_onClientQueue_MRCreatePlaybackQueueForOffset(NSRange, __strong MRPlaybackQueueDataSourceCreateContentItemCallback)");
    [v12 handleFailureInFunction:v13, @"MRPlaybackQueueServiceClient.m", 276, @"Invalid parameter not satisfying: %@", @"datasource" file lineNumber description];
  }
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a2];
  for (uint64_t i = 0; a2; --a2)
  {
    id v8 = (void *)v5[2](v5, a1);
    uint64_t v9 = [v6 count];
    if (v8)
    {
      if (!v9) {
        uint64_t i = a1;
      }
      [v6 addObject:v8];
    }
    else if (v9)
    {
      break;
    }

    ++a1;
  }
  id v10 = [[MRPlaybackQueue alloc] initWithContentItems:v6 location:i];

  return v10;
}

id _onQueue_MRCreatePlaybackQueueForOffset(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v19 = a2;
  if (!v3)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForOffset(MRPlaybackQueueRequest *__strong, NSArray<MSVCallback *> *__strong)");
    [v17 handleFailureInFunction:v18, @"MRPlaybackQueueServiceClient.m", 299, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  unint64_t v29 = __Block_byref_object_copy__48;
  char v30 = __Block_byref_object_dispose__48;
  id v31 = 0;
  uint64_t v4 = [v3 range];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v4;
    uint64_t v20 = 0;
    while (1)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = v19;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v23;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = [v12 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = ___onQueue_MRCreatePlaybackQueueForOffset_block_invoke;
          block[3] = &unk_1E57D9B70;
          void block[4] = v12;
          void block[5] = &v26;
          block[6] = v20 + v7;
          block[7] = v7;
          block[8] = v6;
          dispatch_sync(v13, block);

          if (v27[5]) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
            if (v9) {
              goto LABEL_7;
            }
            break;
          }
        }
      }

      uint64_t v14 = (void *)v27[5];
      if (v14) {
        break;
      }
      if (++v20 == v6)
      {
        uint64_t v14 = 0;
        break;
      }
    }
  }
  else
  {
    uint64_t v14 = (void *)v27[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v26, 8);

  return v15;
}

void sub_1951BF560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForIdentifier(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v29 = v4;
  if (!v3)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v24 = objc_msgSend(NSString, "stringWithUTF8String:", "MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForIdentifier(MRPlaybackQueueRequest *__strong, NSArray<MSVCallback *> *__strong)");
    [v23 handleFailureInFunction:v24, @"MRPlaybackQueueServiceClient.m", 323, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];

    id v4 = v29;
  }
  uint64_t v26 = v3;
  uint64_t v5 = [v3 contentItemIdentifiers];
  long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    uint64_t v27 = *MEMORY[0x1E4F1CF80];
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * v10);
        if ([v4 count])
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v12 = v4;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v32 = v10;
            uint64_t v15 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v37 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                id v18 = [v17 block];
                id v19 = [v17 queue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = ___onQueue_MRCreatePlaybackQueueForIdentifier_block_invoke;
                block[3] = &unk_1E57D0EA8;
                id v35 = v18;
                void block[4] = v11;
                id v34 = v6;
                id v20 = v18;
                dispatch_sync(v19, block);
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v14);
            uint64_t v9 = v28;
            id v4 = v29;
            uint64_t v8 = v30;
            uint64_t v10 = v32;
          }
        }
        else
        {
          id v12 = (id)MRContentItemCreate(v27, v11);
          [v6 addObject:v12];
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v8);
  }

  uint64_t v21 = [[MRPlaybackQueue alloc] initWithContentItems:v6];

  return v21;
}

void OUTLINED_FUNCTION_1_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t _MRPlaybackQueueContextProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        id v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *MR_NSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  id v4 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{{%.*g, %.*g}, {%.*g, %.*g}}", 17, *(void *)&a1, 17, *(void *)&a2, 17, *(void *)&a3, 17, *(void *)&a4);

  return v4;
}

uint64_t _MRTransactionPacketsProtobufReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_MRTransactionPacketProtobuf);
        [a1 addPackets:v17];
        if (!PBReaderPlaceMark() || (_MRTransactionPacketProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951C4D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t _MRAudioStreamPacketDescriptionProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_51:
        uint64_t v36 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 24) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_45;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_47;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_47:
            *(void *)(a1 + 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 4u;
        while (1)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 1;
          v26 |= (unint64_t)(v34 & 0x7F) << v30;
          if ((v34 & 0x80) == 0) {
            goto LABEL_53;
          }
          v30 += 7;
          BOOL v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_55:
        uint64_t v36 = 20;
      }
      *(_DWORD *)(a1 + v36) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951C6368(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C6890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C69B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C73C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C7664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C7968(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C7B2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C7D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C8898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C8D44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C8E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C9004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C9628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951C96CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initPCProgressEvent()
{
  if (ProximityControlLibrary_sOnce != -1) {
    dispatch_once(&ProximityControlLibrary_sOnce, &__block_literal_global_109);
  }
  Class result = objc_getClass("PCProgressEvent");
  classPCProgressEvent = (uint64_t)result;
  getPCProgressEventClass = (uint64_t (*)())PCProgressEventFunction;
  return result;
}

id PCProgressEventFunction()
{
  return (id)classPCProgressEvent;
}

void *__ProximityControlLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ProximityControl.framework/ProximityControl", 2);
  ProximityControlLibrary_sLib = (uint64_t)result;
  return result;
}

Class initPCMediaRemoteDisplayContext()
{
  if (ProximityControlLibrary_sOnce != -1) {
    dispatch_once(&ProximityControlLibrary_sOnce, &__block_literal_global_109);
  }
  Class result = objc_getClass("PCMediaRemoteDisplayContext");
  classPCMediaRemoteDisplayContext = (uint64_t)result;
  getPCMediaRemoteDisplayContextClass = (uint64_t (*)())PCMediaRemoteDisplayContextFunction;
  return result;
}

id PCMediaRemoteDisplayContextFunction()
{
  return (id)classPCMediaRemoteDisplayContext;
}

BOOL _MRTransactionKeyProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRSendHIDReportMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRRemovePlayerMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

_MRDiagnosticProtobuf *MRDiagnosticCreate(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "MRDiagnosticRef MRDiagnosticCreate(CFDateRef, CFStringRef)");
    [v6 handleFailureInFunction:v7, @"MRDiagnostic.m", 17, @"Invalid parameter not satisfying: %@", @"date" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    unsigned int v9 = objc_msgSend(NSString, "stringWithUTF8String:", "MRDiagnosticRef MRDiagnosticCreate(CFDateRef, CFStringRef)");
    [v8 handleFailureInFunction:v9, @"MRDiagnostic.m", 18, @"Invalid parameter not satisfying: %@", @"info" file lineNumber description];

    goto LABEL_3;
  }
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  id v4 = objc_alloc_init(_MRDiagnosticProtobuf);
  MEMORY[0x199718090](a1);
  -[_MRDiagnosticProtobuf setDateGenerated:](v4, "setDateGenerated:");
  [(_MRDiagnosticProtobuf *)v4 setDiagnosticInfo:a2];
  return v4;
}

uint64_t MRDiagnosticCreateFromExternalRepresentation(uint64_t a1)
{
  uint64_t v2 = [_MRDiagnosticProtobuf alloc];

  return (uint64_t)[(_MRDiagnosticProtobuf *)v2 initWithData:a1];
}

uint64_t MRDiagnosticCreateExternalRepresentation(void *a1)
{
  uint64_t v1 = [a1 data];
  uint64_t v2 = [v1 copy];

  return v2;
}

CFDateRef MRDiagnosticCopyDateCreated(void *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [a1 dateGenerated];

  return CFDateCreate(v1, v2);
}

uint64_t MRDiagnosticCopyInfo(void *a1)
{
  CFAllocatorRef v1 = [a1 diagnosticInfo];
  uint64_t v2 = [v1 copy];

  return v2;
}

void MRMediaRemoteCollectDiagnostic(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  id v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCollectDiagnostic(v4, v5, v3);
}

void MRMediaRemoteCollectClientDiagnostics(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  id v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCollectClientDiagnostics(v4, v5, v3);
}

MRMutableVirtualTouchDeviceDescriptor *MRVirtualTouchDeviceDescriptorCreate()
{
  return objc_alloc_init(MRMutableVirtualTouchDeviceDescriptor);
}

uint64_t MRVirtualTouchDeviceDescriptorSetIsAbsolute(void *a1, const char *a2)
{
  return [a1 setAbsolute:a2];
}

uint64_t MRVirtualTouchDeviceDescriptorSetDisplayIntegrated(void *a1, const char *a2)
{
  return [a1 setIntegratedDisplay:a2];
}

uint64_t _MRCryptoPairingMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v17;

          continue;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_53:
          uint64_t v43 = 20;
          goto LABEL_67;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_57:
          BOOL v44 = v28 != 0;
          uint64_t v45 = 24;
          goto LABEL_62;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 28) |= 8u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_61:
          BOOL v44 = v34 != 0;
          uint64_t v45 = 25;
LABEL_62:
          *(unsigned char *)(a1 + v45) = v44;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v3;
        unint64_t v41 = *(void *)(a2 + v40);
        if (v41 == -1 || v41 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v41 + 1;
        v22 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0) {
          goto LABEL_64;
        }
        v38 += 7;
        BOOL v14 = v39++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_66;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_66:
      uint64_t v43 = 16;
LABEL_67:
      *(_DWORD *)(a1 + v43) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void MRMediaRemoteSetSystemAppPlaybackQueue(uint64_t a1, void *a2, void *a3)
{
}

void MRMediaRemoteSetSystemAppPlaybackQueueWithContext(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  if (MRSystemAppPlaybackQueueGetType(a1) == 3 || !MRShouldUseLegacyMusicApplicationAsSystemMediaApp()) {
    uint64_t v11 = @"(System Media Application)";
  }
  else {
    uint64_t v11 = @"com.apple.LegacyMusic";
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __MRMediaRemoteSetSystemAppPlaybackQueueWithContext_block_invoke;
  v13[3] = &unk_1E57D4D40;
  id v14 = v10;
  id v12 = v10;
  MRMediaRemoteSetAppPlaybackQueueWithContext((uint64_t)v11, a1, a2, a3, v9, v13);
}

void MRMediaRemoteSetAppPlaybackQueueWithContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v14 = [[MRClient alloc] initWithProcessIdentifier:0 bundleIdentifier:a1];
  char v13 = [[MRPlayerPath alloc] initWithOrigin:a3 client:v14 player:0];
  MRMediaRemoteSetAppPlaybackQueueForPlayer(a2, 0, v13, a4, v12, v11);
}

uint64_t __MRMediaRemoteSetSystemAppPlaybackQueueWithContext_block_invoke(uint64_t a1, int a2, CFIndex a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!a2)
    {
      _MRSendCommandReplyContainsSuccessfulStatus(a3);
      uint64_t result = *(void *)(a1 + 32);
    }
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

CFIndex _MRSendCommandReplyContainsSuccessfulStatus(CFIndex result)
{
  if (result)
  {
    CFArrayRef v1 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    int valuePtr = 0;
    if (result)
    {
      unint64_t v2 = result;
      unint64_t v3 = 0;
      unsigned int v4 = 1;
      do
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v1, v3);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
        uint64_t result = valuePtr == 0;
        unint64_t v3 = v4++;
        if (valuePtr) {
          BOOL v6 = v2 > v3;
        }
        else {
          BOOL v6 = 0;
        }
      }
      while (v6);
    }
  }
  return result;
}

void MRMediaRemoteSetAppPlaybackQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __MRMediaRemoteSetAppPlaybackQueue_block_invoke;
  v11[3] = &unk_1E57D4D40;
  id v12 = v9;
  id v10 = v9;
  MRMediaRemoteSetAppPlaybackQueueWithContext(a1, a2, a3, 0, a4, v11);
}

uint64_t __MRMediaRemoteSetAppPlaybackQueue_block_invoke(uint64_t a1, int a2, CFIndex a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!a2)
    {
      _MRSendCommandReplyContainsSuccessfulStatus(a3);
      uint64_t result = *(void *)(a1 + 32);
    }
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void MRMediaRemoteSetAppPlaybackQueueForPlayer(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__49;
  uint64_t v23 = __Block_byref_object_dispose__49;
  id v24 = 0;
  char v13 = (MRPlayerPath *)[a3 copy];
  if (!v13) {
    char v13 = objc_alloc_init(MRPlayerPath);
  }
  [(MRPlayerPath *)v13 origin];

  if (a1)
  {
    if (a2)
    {
      uint64_t v14 = [a2 mutableCopy];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    int v15 = (void *)v14;
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(*MEMORY[0x1E4F1CF80], a1);
    if (ExternalRepresentation) {
      [v15 setObject:ExternalRepresentation forKeyedSubscript:@"kMRMediaRemoteOptionSystemAppPlaybackQueueData"];
    }
    if (a4) {
      [v15 setObject:a4 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];
    }
    if (v20[5]) {
      -[MRPlayerPath setOrigin:](v13, "setOrigin:");
    }
    MRMediaRemoteSendCommandToPlayer(122, v15, v13, 1, v11, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __MRMediaRemoteSetAppPlaybackQueueForPlayer_block_invoke_2;
    block[3] = &unk_1E57D0FC0;
    id v18 = v12;
    dispatch_async(v11, block);
    int v15 = v18;
  }

  _Block_object_dispose(&v19, 8);
}

void sub_1951CE77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MRMediaRemoteSetAppPlaybackQueueForPlayer_block_invoke_2(uint64_t a1)
{
  unint64_t v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to setAppPlaybackQueue with an empty queue. Did you mean to send a MRSystemAppPlaybackQueueTypeEmpty?", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 7, MEMORY[0x1E4F1CBF0]);
  }
  return result;
}

void MRMediaRemoteInsertSystemAppPlaybackQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a4;
  id v9 = a5;
  if (MRSystemAppPlaybackQueueGetType(a1) == 3 || !MRShouldUseLegacyMusicApplicationAsSystemMediaApp()) {
    id v10 = @"(System Media Application)";
  }
  else {
    id v10 = @"com.apple.LegacyMusic";
  }
  MRMediaRemoteInsertSystemAppPlaybackQueueForApp((uint64_t)v10, a1, a2, a3, v11, v9);
}

void MRMediaRemoteInsertSystemAppPlaybackQueueForApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  uint64_t v14 = [[MRClient alloc] initWithProcessIdentifier:0 bundleIdentifier:a1];
  char v13 = [[MRPlayerPath alloc] initWithOrigin:a4 client:v14 player:0];
  MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(a2, a3, 0, v13, v12, v11);
}

void MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  uint64_t v14 = [[MRClient alloc] initWithProcessIdentifier:0 bundleIdentifier:@"(System Media Application)"];
  char v13 = [[MRPlayerPath alloc] initWithOrigin:a4 client:v14 player:0];
  MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(a1, a2, a3, v13, v12, v11);
}

void MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  uint64_t v12 = *MEMORY[0x1E4F1CF80];
  id v13 = a5;
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(v12, a1);
  int v15 = (void *)[a3 mutableCopy];
  int v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  }
  id v18 = v17;

  uint64_t v19 = [NSNumber numberWithInt:a2];
  [v18 setObject:v19 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackQueueInsertionPosition"];

  [v18 setObject:ExternalRepresentation forKeyedSubscript:@"kMRMediaRemoteOptionSystemAppPlaybackQueueData"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer_block_invoke;
  v21[3] = &unk_1E57D4D40;
  id v22 = v11;
  id v20 = v11;
  MRMediaRemoteSendCommandToPlayer(125, v18, a4, 1, v13, v21);
}

uint64_t __MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer_block_invoke(uint64_t result, int a2, CFArrayRef theArray)
{
  if (*(void *)(result + 32))
  {
    uint64_t v5 = result;
    if (theArray && (Count = CFArrayGetCount(theArray), int valuePtr = 0, Count))
    {
      unint64_t v7 = Count;
      CFIndex v8 = 0;
      unsigned int v9 = 1;
      while (1)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v8);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
        if (valuePtr == 4) {
          break;
        }
        CFIndex v8 = v9;
        if (v7 <= v9++) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      if (!a2) {
        _MRSendCommandReplyContainsSuccessfulStatus((CFIndex)theArray);
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(v5 + 32) + 16))();
  }
  return result;
}

void MRMediaRemoteReportPlaybackError(__CFError *a1, uint64_t a2)
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];

  if (v5) {
    [v7 setObject:v5 forKey:@"kMRMediaRemotePlaybackErrorApplicationUserInfoKey"];
  }
  if (a2) {
    [v7 setObject:a2 forKey:@"kMRMediaRemotePlaybackErrorReasonUserInfoKey"];
  }
  if (a1)
  {
    CFDataRef ErrorExternalRepresentation = MRMediaRemoteCreateErrorExternalRepresentation(a1);
    if (ErrorExternalRepresentation) {
      [v7 setObject:ErrorExternalRepresentation forKey:@"_kMRMediaRemotePlaybackErrorDataUserInfoKey"];
    }
  }
  MRMediaRemotePostClientNotification(@"kMRMediaRemoteApplicationDidReportPlaybackErrorNotification", v7);
}

uint64_t _MRReceivedCommandProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 80) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_56;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_58;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_56:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_58:
        uint64_t v39 = 24;
        goto LABEL_63;
      case 2u:
        id v24 = objc_alloc_init(_MRCommandOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || (_MRCommandOptionsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_54;
      case 3u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 80) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_62:
        uint64_t v39 = 48;
LABEL_63:
        *(_DWORD *)(a1 + v39) = v19;
        goto LABEL_68;
      case 4u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 72;
        goto LABEL_48;
      case 5u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 32;
        goto LABEL_48;
      case 6u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(unsigned char *)(a1 + 80) |= 1u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                uint64_t v34 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_67:
        *(void *)(a1 + 8) = v34;
        goto LABEL_68;
      case 7u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 64;
LABEL_48:
        char v38 = *(void **)(a1 + v31);
        *(void *)(a1 + v31) = v30;

        goto LABEL_68;
      case 8u:
        id v24 = objc_alloc_init(_MRReceivedCommandAppOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (_MRReceivedCommandAppOptionsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_70;
        }
        goto LABEL_54;
      case 9u:
        id v24 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 56), v24);
        if (PBReaderPlaceMark()
          && _MRNowPlayingPlayerPathProtobufReadFrom((id *)&v24->super.super.isa, a2))
        {
LABEL_54:
          PBReaderRecallMark();

LABEL_68:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_70:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_68;
    }
  }
}

uint64_t MRTextEditingAttributesCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [MRMutableTextEditingAttributes alloc];

  return (uint64_t)[(MRTextEditingAttributes *)v5 initWithTitle:a2 prompt:a3];
}

double MRTextEditingAttributesGetInputTraits@<D0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  if (a1)
  {
    [a1 inputTraits];
  }
  else
  {
    *(void *)(x8_0 + 128) = 0;
    double result = 0.0;
    *(_OWORD *)(x8_0 + 96) = 0u;
    *(_OWORD *)(x8_0 + 112) = 0u;
    *(_OWORD *)(x8_0 + 64) = 0u;
    *(_OWORD *)(x8_0 + 80) = 0u;
    *(_OWORD *)(x8_0 + 32) = 0u;
    *(_OWORD *)(x8_0 + 48) = 0u;
    *(_OWORD *)x8_0 = 0u;
    *(_OWORD *)(x8_0 + 16) = 0u;
  }
  return result;
}

void MRTextEditingAttributesSetInputTraits(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v4 = *(_OWORD *)(a2 + 112);
    v8[6] = *(_OWORD *)(a2 + 96);
    v8[7] = v4;
    uint64_t v9 = *(void *)(a2 + 128);
    long long v5 = *(_OWORD *)(a2 + 48);
    void v8[2] = *(_OWORD *)(a2 + 32);
    void v8[3] = v5;
    long long v6 = *(_OWORD *)(a2 + 80);
    v8[4] = *(_OWORD *)(a2 + 64);
    v8[5] = v6;
    long long v7 = *(_OWORD *)(a2 + 16);
    v8[0] = *(_OWORD *)a2;
    v8[1] = v7;
    [v3 setInputTraits:v8];
  }
}

uint64_t MRTextEditingSessionCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = [MRTextEditingSession alloc];

  return (uint64_t)[(MRTextEditingSession *)v5 initWithText:a2 attributes:a3];
}

void sub_1951D8534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1951D88FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951D8C68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

uint64_t _MRSetConnectionStateMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRPlaybackSessionMigrateRequestEventProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_39;
        case 2u:
          *(unsigned char *)(a1 + 56) |= 8u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v36 = 32;
          goto LABEL_50;
        case 3u:
          *(unsigned char *)(a1 + 56) |= 2u;
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v36 = 16;
          goto LABEL_50;
        case 4u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v36 = 8;
LABEL_50:
          *(void *)(a1 + v36) = v23;
          continue;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          break;
        case 6u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
LABEL_39:
          uint64_t v35 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v3;
        uint64_t v32 = *(void *)(a2 + v31);
        unint64_t v33 = v32 + 1;
        if (v32 == -1 || v33 > *(void *)(a2 + *v4)) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
        *(void *)(a2 + v31) = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0) {
          goto LABEL_41;
        }
        v28 += 7;
        BOOL v15 = v29++ >= 9;
        if (v15)
        {
          uint64_t v30 = 0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v30 = 0;
      }
LABEL_43:
      *(void *)(a1 + 24) = v30;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MROriginClientPropertiesMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v21 = PBReaderReadString();
        unint64_t v22 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951DC284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1951DD518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MRAVReconnaissanceSessionCreate(uint64_t a1)
{
  unint64_t v2 = [MRAVReconnaissanceSession alloc];

  return (uint64_t)[(MRAVReconnaissanceSession *)v2 initWithOutputDeviceUIDs:a1 outputDeviceGroupID:0 features:8];
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingOutputGroupID(uint64_t a1)
{
  unint64_t v2 = [MRAVReconnaissanceSession alloc];

  return (uint64_t)[(MRAVReconnaissanceSession *)v2 initWithOutputDeviceUIDs:0 outputDeviceGroupID:a1 features:8];
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MRAVReconnaissanceSession alloc];

  return (uint64_t)[(MRAVReconnaissanceSession *)v4 initWithOutputDeviceUIDs:0 outputDeviceGroupID:a1 features:a2];
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs(uint64_t a1)
{
  unint64_t v2 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:0 outputDeviceGroupID:0 features:1];
  [(MRAVReconnaissanceSession *)v2 setMatchingLogicalDeviceIDs:a1];
  return v2;
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MRAVReconnaissanceSession alloc];

  return (uint64_t)[(MRAVReconnaissanceSession *)v4 initWithOutputDeviceUIDs:a1 outputDeviceGroupID:0 features:a2];
}

uint64_t MRAVReconnaissanceSessionSetUseWeakMatching(void *a1, const char *a2)
{
  return [a1 setUseWeakMatching:a2];
}

uint64_t MRAVReconnaissanceSessionSetWaitForCompleteClusters(void *a1, const char *a2)
{
  return [a1 setWaitForCompleteClusters:a2];
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints(void *a1, const char *a2)
{
  return [a1 setShouldWaitForUnanimousEndpoints:a2];
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults(void *a1, const char *a2)
{
  return [a1 setReturnPartialResults:a2];
}

uint64_t MRAVReconnaissanceSessionSetExpectedLogicalDevices(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 176) = a2;
  }
  return result;
}

void MRAVReconnaissanceSessionBeginSearch(void *a1, void *a2, double a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = a1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __MRAVReconnaissanceSessionBeginSearch_block_invoke;
    void v8[3] = &unk_1E57D7E38;
    id v9 = v6;
    id v10 = v5;
    id v7 = v6;
    [v7 beginSearchWithTimeout:v8 completion:a3];
  }
}

void __MRAVReconnaissanceSessionBeginSearch_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  char v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  id v9 = *(id *)(a1 + 32);
  v8(v7, a2, a3, a4);
}

void MRAVReconnaissanceSessionBeginEndpointsSearch(void *a1, void *a2, double a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = a1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __MRAVReconnaissanceSessionBeginEndpointsSearch_block_invoke;
    void v8[3] = &unk_1E57DA120;
    id v9 = v6;
    id v10 = v5;
    id v7 = v6;
    [v7 beginSearchWithTimeout:v8 endpointsCompletion:a3];
  }
}

void __MRAVReconnaissanceSessionBeginEndpointsSearch_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  id v10 = *(id *)(a1 + 32);
  v9(v8, a2, a3, a5);
}

void MRAVReconnaissanceSessionSetTargetAudioSessionID(void *a1, uint64_t a2)
{
  id v3 = [a1 discoverySession];
  [v3 setTargetAudioSessionID:a2];
}

void MRMediaRemoteSetWantsRouteChangeNotifications(int a1)
{
  unint64_t v2 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v3 = MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
  if (a1)
  {
    ++MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
    if (v3) {
      goto LABEL_9;
    }
    id v8 = v2;
    uint64_t v4 = [v2 notificationClient];
    id v5 = v4;
    uint64_t v6 = 1;
    goto LABEL_8;
  }
  BOOL v7 = MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers == 1;
  if (MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers >= 1)
  {
    --MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
    if (v7)
    {
      id v8 = v2;
      uint64_t v4 = [v2 notificationClient];
      id v5 = v4;
      uint64_t v6 = 0;
LABEL_8:
      [v4 setReceivesRoutesChangedNotifications:v6];

      unint64_t v2 = v8;
    }
  }
LABEL_9:
}

uint64_t MRMediaRemoteSetRouteDiscoveryMode(uint64_t a1)
{
  unint64_t v2 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetRouteDiscoveryMode(v2, a1);
  uint64_t v3 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v4 = [v3 localOriginClient];
  [v4 setRouteDiscoveryMode:a1];

  return 1;
}

void MRMediaRemoteSetApplicationPickedRoutes(uint64_t a1)
{
  unint64_t v2 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetApplicationPickedRoutes(v2, a1, 0);
  id v4 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v3 = [v4 localOriginClient];
  [v3 setApplicationPickedRoutes:a1];
}

void MRMediaRemoteSetNearbyDevice(void *a1)
{
  unint64_t v2 = (void *)MRGetSharedService();

  MRMediaRemoteServiceSetNearbyDevice(v2, a1, 0, 0);
}

void MRMediaRemoteCopyPickableRoutes_Async(void *a1, void *a2)
{
}

void MRMediaRemoteCopyPickableRoutesForCategory_Async(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v5)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"queue must be non-nil"];
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"handler must be non-nil"];
    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = +[MRMediaRemoteServiceClient sharedServiceClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke;
  v11[3] = &unk_1E57DA238;
  id v12 = v5;
  id v13 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 fetchPickableRoutesWithCategory:a1 completion:v11];
}

BOOL MRMediaRemoteSetPickedRouteWithPassword(uint64_t a1, void *a2)
{
  id v4 = (void *)MRGetSharedService();
  return MRMediaRemoteServiceSetPickedRoute(v4, a1, a2, 0);
}

BOOL MRMediaRemoteSetPickedRouteWithPasswordAndOptions(uint64_t a1, void *a2, unsigned int a3)
{
  id v6 = (void *)MRGetSharedService();
  return MRMediaRemoteServiceSetPickedRoute(v6, a1, a2, a3);
}

void MRMediaRemoteFindAndPickRoute(uint64_t a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  id v13 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (a1)
  {
    uint64_t v11 = (void *)MRGetSharedService();
    MRMediaRemoteServiceFindAndPickRoute(v11, a1, a2, a3, v13, v10);
  }
  else if (v9)
  {
    Error = (void *)MRMediaRemoteCreateError(2);
    ((void (**)(void, void *))v10)[2](v10, Error);
  }
}

void MRMediaRemoteGetPickedRouteHasVolumeControl(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[MROrigin localOrigin];
  MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin((uint64_t)v5, v4, v3);
}

void MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin_block_invoke;
  v7[3] = &unk_1E57D4C70;
  id v8 = v5;
  id v6 = v5;
  MRMediaRemoteGetPickedRoutedVolumeControlCapabilities(a1, a2, v7);
}

uint64_t __MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin_block_invoke(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

int64_t MRMediaRemoteGetLocalVolumeControlCapabilities()
{
  dispatch_queue_t v0 = [MRPlayerPath alloc];
  CFArrayRef v1 = +[MROrigin localOrigin];
  unint64_t v2 = [(MRPlayerPath *)v0 initWithOrigin:v1 client:0 player:0];

  id v3 = (void *)MRGetSharedService();
  int64_t PickedRouteVolumeControlCapabilitiesSync = MRMediaRemoteServiceGetPickedRouteVolumeControlCapabilitiesSync(v3, v2, 0);

  return PickedRouteVolumeControlCapabilitiesSync;
}

void __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = [v5 origin];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v9) {
      id Error = v9;
    }
    else {
      id Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    }
    id v8 = Error;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void MRMediaRemoteSetPickedRouteVolumeControlCapabilities(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v12 = [[MRPlayerPath alloc] initWithOrigin:a2 client:0 player:0];
  id v9 = +[MRNowPlayingOriginClientManager sharedManager];
  id v10 = [v9 originClientForPlayerPath:v12];

  [v10 setVolumeCapabilities:a1];
  uint64_t v11 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetPickedRouteVolumeControlCapabilities(v11, v12, a1, v8, v7);
}

void MRMediaRemoteGetSavedAVRoutePassword(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRMediaRemoteGetSavedAVRoutePassword(CFStringRef, __strong dispatch_queue_t, void (^__strong)(CFStringRef))");
    [v7 handleFailureInFunction:v8, @"MRAVRouting.m", 273, @"Invalid parameter not satisfying: %@", @"queue" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRMediaRemoteGetSavedAVRoutePassword(CFStringRef, __strong dispatch_queue_t, void (^__strong)(CFStringRef))");
  [v9 handleFailureInFunction:v10, @"MRAVRouting.m", 274, @"Invalid parameter not satisfying: %@", @"completion" file lineNumber description];

LABEL_3:
  id v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetSavedAVRoutePassword(v6, a1, v11, v5);
}

void MRMediaRemoteSetSavedAVRoutePassword(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v9 = a3;
  id v8 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetSavedAVRoutePassword(v8, a1, a2, v9, v7);
}

void MRMediaRemoteClearAllAVRoutePasswords()
{
  dispatch_queue_t v0 = (void *)MRGetSharedService();

  MRMediaRemoteServiceClearAllAVRoutePasswords(v0);
}

void MRMediaRemoteUnpickAirPlayAVRoutes(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  id v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceUnpickAirPlayAVRoutes(v4, v5, v3);
}

void MRMediaRemoteGetReceiverAirPlaySecuritySettings(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  id v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetReceiverAirPlaySecuritySettings(v4, v5, v3);
}

void MRMediaRemoteGetLocalDeviceIsGroupLeader(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __MRMediaRemoteGetLocalDeviceIsGroupLeader_block_invoke;
  v5[3] = &unk_1E57DA2D8;
  id v6 = v3;
  id v4 = v3;
  MRMediaRemoteRequestIsGroupLeader(a1, v5);
}

uint64_t __MRMediaRemoteGetLocalDeviceIsGroupLeader_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = [v5 origin];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v9) {
      id Error = v9;
    }
    else {
      id Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    }
    id v8 = Error;
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
}

void MRMediaRemoteSetMediaPlaybackVolume(unsigned int a1, void *a2, void *a3, float a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (objc_class *)NSNumber;
  id v9 = a2;
  id v10 = [v8 alloc];
  *(float *)&double v11 = a4;
  id v12 = (void *)[v10 initWithFloat:v11];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  char v14 = [MEMORY[0x1E4F29128] UUID];
  BOOL v15 = [v14 UUIDString];

  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setMediaPlaybackVolume", v15];
  char v17 = v16;
  if (v12) {
    [v16 appendFormat:@" for %@", v12];
  }
  uint64_t v18 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    char v28 = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unint64_t v19 = (void *)MRGetSharedService();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __MRMediaRemoteSetMediaPlaybackVolume_block_invoke;
  v23[3] = &unk_1E57DA328;
  id v24 = v15;
  id v25 = v13;
  id v26 = v7;
  id v20 = v7;
  id v21 = v13;
  id v22 = v15;
  MRMediaRemoteServiceSetMediaPlaybackVolume(v19, a1, v9, v23, a4);
}

uint64_t __MRMediaRemoteSetMediaPlaybackVolume_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = _MRLogForCategory(0xAuLL);
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __MRMediaRemoteSetMediaPlaybackVolume_block_invoke_cold_1(a1, a2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:a1[5]];
    int v10 = 138543874;
    double v11 = @"setMediaPlaybackVolume";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v10, 0x20u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteAdjustMediaPlaybackVolumeWithAdjustment(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v10 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v9 = [v10 service];
  MRMediaRemoteServiceAdjustMediaPlaybackVolumeWithAdjustment(v9, a1, a2, v8, v7);
}

void MRMediaRemoteAdjustMediaPlaybackVolume(unsigned int a1, void *a2, void *a3, float a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (objc_class *)NSNumber;
  id v9 = a2;
  id v10 = [v8 alloc];
  *(float *)&double v11 = a4;
  __int16 v12 = (void *)[v10 initWithFloat:v11];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v14 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v15 = [v14 UUIDString];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"adjustMediaPlaybackVolume", v15];
  char v17 = v16;
  if (v12) {
    [v16 appendFormat:@" for %@", v12];
  }
  uint64_t v18 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    char v28 = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unint64_t v19 = (void *)MRGetSharedService();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke;
  v23[3] = &unk_1E57DA328;
  id v24 = v15;
  id v25 = v13;
  id v26 = v7;
  id v20 = v7;
  id v21 = v13;
  id v22 = v15;
  MRMediaRemoteServiceAdjustMediaPlaybackVolume(v19, a1, v9, v23, a4);
}

uint64_t __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = _MRLogForCategory(0xAuLL);
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke_cold_1(a1, a2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:a1[5]];
    int v10 = 138543874;
    double v11 = @"adjustMediaPlaybackVolume";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v10, 0x20u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void MRMediaRemoteMuteSystemVolume(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (objc_class *)NSNumber;
  id v7 = a2;
  uint64_t v8 = (void *)[[v6 alloc] initWithBool:a1];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  int v10 = [MEMORY[0x1E4F29128] UUID];
  double v11 = [v10 UUIDString];

  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"muteSystemVolume", v11];
  uint64_t v13 = v12;
  if (v8) {
    [v12 appendFormat:@" for %@", v8];
  }
  __int16 v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v25 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v16 = [v15 service];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __MRMediaRemoteMuteSystemVolume_block_invoke;
  v20[3] = &unk_1E57D10A8;
  id v21 = v11;
  id v22 = v9;
  id v23 = v5;
  id v17 = v5;
  id v18 = v9;
  id v19 = v11;
  MRMediaRemoteServiceSetSystemIsMuted(v16, a1, v7, v20);
}

void __MRMediaRemoteMuteSystemVolume_block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xAuLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __MRMediaRemoteMuteSystemVolume_block_invoke_cold_1(a1, v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:a1[5]];
    int v10 = 138543874;
    double v11 = @"muteSystemVolume";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

CFStringRef MRMediaRemoteCopySetPickedRouteOptionsDescription(char a1)
{
  if (a1) {
    CFStringRef v1 = @"IgnoreIncorrectPassword";
  }
  else {
    CFStringRef v1 = @"None";
  }
  return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1);
}

void MRMediaRemoteRegisterPairingHandler(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceRegisterPairingHandler(v6, a1, v7, v5);
}

void MRMediaRemoteUnregisterPairingHandler(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceUnregisterPairingHandler(v6, a1, v7, v5);
}

void MRMediaRemoteCompletePairingHandler(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v9 = a3;
  uint64_t v8 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCompletePairingHandler(v8, a1, a2, v9, v7);
}

uint64_t OUTLINED_FUNCTION_5_0(void *a1, const char *a2)
{
  uint64_t v4 = *(void *)(v2 + 40);
  return [a1 timeIntervalSinceDate:v4];
}

void sub_1951E0720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951E0938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951E0CB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951E0D48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951E15C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initAVAudioSession_3()
{
  if (AVFoundationLibrary_sOnce_12 != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce_12, &__block_literal_global_86);
  }
  Class result = objc_getClass("AVAudioSession");
  classAVAudioSession_3 = (uint64_t)result;
  getAVAudioSessionClass_3[0] = (uint64_t (*)())AVAudioSessionFunction_3;
  return result;
}

id AVAudioSessionFunction_3()
{
  return (id)classAVAudioSession_3;
}

uint64_t _MRSendButtonEventMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 20) |= 4u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_51:
        *(unsigned char *)(a1 + 16) = v26 != 0;
      }
      else
      {
        if (v17 == 2)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 20) |= 1u;
          while (1)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0) {
              goto LABEL_53;
            }
            v30 += 7;
            BOOL v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_55:
          uint64_t v36 = 8;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 20) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_47:
          uint64_t v36 = 12;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *MRApplicationActivityStatusCopyDescription(int a1)
{
  if ((a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E57DA4C0[a1 - 1];
  }
}

uint64_t MRApplicationActivityCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [MRMutableApplicationActivity alloc];

  return (uint64_t)[(MRApplicationActivity *)v5 initWithPrimaryAppDisplayID:a2 secondaryAppDisplayID:a3];
}

void MRApplicationActivityBegin(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)MRGetSharedService();
  char v8 = +[MRNowPlayingOriginClientManager sharedManager];
  unsigned int v9 = +[MROrigin localOrigin];
  id v10 = [v8 originClientForOrigin:v9];

  [v10 setActivity:a1];
  MRMediaRemoteServiceBeginActivity(v7, a1, v6, v5);
}

void MRApplicationActivityGetCurrentActivity(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  uint64_t v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetCurrentActivity(v4, v5, v3);
}

void MRApplicationActivityEnd(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceEndActivity(v6, a1, v7, v5);
}

CFUUIDRef MRApplicationActivityCopyUniqueIdentifier(void *a1)
{
  CFStringRef v1 = [a1 uniqueIdentifier];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v3 = [v1 UUIDString];
  CFUUIDRef v4 = CFUUIDCreateFromString(v2, v3);

  return v4;
}

uint64_t MRApplicationActivityCopyPrimaryAppDisplayID(void *a1)
{
  CFStringRef v1 = [a1 primaryApplicationDisplayID];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRApplicationActivityCopySecondaryAppDisplayID(void *a1)
{
  CFStringRef v1 = [a1 secondaryApplicationDisplayID];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRApplicationActivityShouldPrepareAppPlaybackQueue()
{
  return 0;
}

uint64_t _MRApplicationActivityCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

uint64_t _MRApplicationActivityCreateWithExternalRepresentation(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v3 = objc_opt_class();
    CFUUIDRef v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
    uint64_t v1 = MSVUnarchivedObjectOfClasses();
  }
  return v1;
}

void _MRApplicationActivitySetStatus(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setStatus:a2];
  }
}

uint64_t _MRAirPlayLeaderInfoProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  CFUUIDRef v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRDeviceInfoMessageProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRSendVirtualTouchEventMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  CFUUIDRef v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = objc_alloc_init(_MRVirtualTouchEventProtobuf);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || (_MRVirtualTouchEventProtobufReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRRemoteTextInputMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  CFUUIDRef v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v22 = PBReaderReadData();
        char v23 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v22;
      }
      else if (v18 == 2)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0) {
            goto LABEL_35;
          }
          v24 += 7;
          BOOL v15 = v25++ >= 9;
          if (v15)
          {
            uint64_t v26 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_37:
        *(void *)(a1 + 16) = v26;
      }
      else if (v18 == 1)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        *(void *)(a1 + 8) = v21;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951E50CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1951E5140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1951E51B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MROriginCopy(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFUUIDRef v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"MROriginRef MROriginCopy(MROriginRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MROrigin_Deprecated.m", 39, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MROriginCreateSkeletonFrom(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFUUIDRef v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"MROriginRef MROriginCreateSkeletonFrom(MROriginRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MROrigin_Deprecated.m", 46, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 skeleton];

  return v2;
}

uint64_t MROriginEqualToOrigin(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    char v8 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MROriginEqualToOrigin(MROriginRef, MROriginRef)");
    uint64_t v9 = objc_opt_class();
    [v7 handleFailureInFunction:v8, @"MROrigin_Deprecated.m", 54, @"Type mismatch, expecting %@ found %@", v9, objc_opt_class() file lineNumber description];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MROriginEqualToOrigin(MROriginRef, MROriginRef)");
    uint64_t v12 = objc_opt_class();
    [v10 handleFailureInFunction:v11, @"MROrigin_Deprecated.m", 55, @"Type mismatch, expecting %@ found %@", v12, objc_opt_class() file lineNumber description];
  }
LABEL_6:
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t MROriginGetOriginType(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"MROriginType MROriginGetOriginType(MROriginRef)"];
      uint64_t v6 = objc_opt_class();
      [v4 handleFailureInFunction:v5, @"MROrigin_Deprecated.m", 69, @"Type mismatch, expecting %@ found %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v2 = [v1 type];

  return v2;
}

void MRMediaRemoteSetWantsOriginChangeNotifications(int a1)
{
  uint64_t v2 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v3 = MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
  if (a1)
  {
    ++MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
    if (v3) {
      goto LABEL_9;
    }
    id v8 = v2;
    id v4 = [v2 notificationClient];
    uint64_t v5 = v4;
    uint64_t v6 = 1;
    goto LABEL_8;
  }
  BOOL v7 = MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers == 1;
  if (MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers >= 1)
  {
    --MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
    if (v7)
    {
      id v8 = v2;
      id v4 = [v2 notificationClient];
      uint64_t v5 = v4;
      uint64_t v6 = 0;
LABEL_8:
      [v4 setReceivesOriginChangedNotifications:v6];

      uint64_t v2 = v8;
    }
  }
LABEL_9:
}

void MRMediaRemoteGetAvailableOrigins(void *a1, void *a2)
{
  id v6 = a1;
  if (!v6)
  {
    id v6 = (id)MEMORY[0x1E4F14428];
    id v3 = MEMORY[0x1E4F14428];
  }
  id v4 = a2;
  uint64_t v5 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetAvailableOrigins(v5, v6, v4);
}

void MRMediaRemoteSetActiveOrigin(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }
  id v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    char v14 = a1;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Setting active origin: %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetActiveOrigin(v9, a1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MRMediaRemoteSetActiveOrigin_block_invoke;
  block[3] = &unk_1E57D0FC0;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v5, block);
}

uint64_t __MRMediaRemoteSetActiveOrigin_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void MRMediaRemoteGetActiveOrigin(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    if (!v3)
    {
      id v3 = (id)MEMORY[0x1E4F14428];
      id v5 = MEMORY[0x1E4F14428];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __MRMediaRemoteGetActiveOrigin_block_invoke;
    v13[3] = &unk_1E57DA530;
    id v3 = v3;
    id v14 = v3;
    id v15 = v4;
    id v6 = (void (**)(void, void, void))MEMORY[0x1997190F0](v13);
    id v7 = +[MRMediaRemoteServiceClient sharedServiceClient];
    id v8 = [v7 activePlayerPath];

    if (v8)
    {
      uint64_t v9 = [v8 origin];
      ((void (**)(void, uint64_t, void *))v6)[2](v6, 1, v9);
    }
    else
    {
      id v10 = (void *)MRGetSharedService();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __MRMediaRemoteGetActiveOrigin_block_invoke_3;
      v11[3] = &unk_1E57D3458;
      id v12 = v6;
      MRMediaRemoteServiceGetActiveOrigin(v10, v3, v11);
      uint64_t v9 = v12;
    }
  }
}

void __MRMediaRemoteGetActiveOrigin_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v5 = v4;
  msv_dispatch_async_on_queue();
}

void __MRMediaRemoteGetActiveOrigin_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    id v3 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, v2);
  }
  else
  {
    id v5 = +[MROrigin localOrigin];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v5);
  }
}

uint64_t __MRMediaRemoteGetActiveOrigin_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL _MRAudioTimeProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 2u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        char v23 = &OBJC_IVAR____MRAudioTimeProtobuf__timestamp;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 1u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    char v23 = &OBJC_IVAR____MRAudioTimeProtobuf__sampleRate;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGroupSessionRemoveRequestProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRGameControllerPropertiesProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_51;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_53;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_51:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_53:
          uint64_t v42 = 12;
          goto LABEL_62;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          unsigned int v25 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v24;

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_57:
          uint64_t v42 = 8;
          goto LABEL_62;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_61:
          uint64_t v42 = 16;
LABEL_62:
          *(_DWORD *)(a1 + v42) = v19;
          continue;
        case 5u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v40 + 1;
        v38 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0) {
          goto LABEL_64;
        }
        v36 += 7;
        BOOL v14 = v37++ >= 9;
        if (v14)
        {
          uint64_t v38 = 0;
          goto LABEL_66;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v38 = 0;
      }
LABEL_66:
      *(unsigned char *)(a1 + 32) = v38 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRAudioFormatSettingsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1951E93FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MRGroupSessionParticipantProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;

        goto LABEL_59;
      case 2u:
        uint64_t v20 = objc_alloc_init(_MRUserIdentityProtobuf);
        objc_storeStrong((id *)(a1 + 16), v20);
        if PBReaderPlaceMark() && (_MRUserIdentityProtobufReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_59:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_49:
        BOOL v39 = v23 != 0;
        uint64_t v40 = 24;
        goto LABEL_58;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_53:
        BOOL v39 = v29 != 0;
        uint64_t v40 = 25;
        goto LABEL_58;
      case 5u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        *(unsigned char *)(a1 + 28) |= 4u;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                uint64_t v35 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v35 = 0;
        }
LABEL_57:
        BOOL v39 = v35 != 0;
        uint64_t v40 = 26;
LABEL_58:
        *(unsigned char *)(a1 + v40) = v39;
        goto LABEL_59;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_59;
    }
  }
}

MRMutableVirtualVoiceInputDeviceDescriptor *MRVirtualVoiceInputDeviceDescriptorCreate()
{
  return objc_alloc_init(MRMutableVirtualVoiceInputDeviceDescriptor);
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCreateFromExternalRepresentation(uint64_t a1, uint64_t a2)
{
  id v3 = [MRVirtualVoiceInputDeviceDescriptor alloc];

  return (uint64_t)[(MRVirtualVoiceInputDeviceDescriptor *)v3 initWithData:a2];
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRVirtualVoiceInputDeviceDescriptorSetSupportedFormats(void *a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRVirtualVoiceInputDeviceDescriptorSetSupportedFormats(MRVirtualVoiceInputDeviceDescriptorRef, CFArrayRef)");
    [v5 handleFailureInFunction:v6 file:@"MRVirtualVoiceInputDeviceDescriptor.m" lineNumber:143 description:@"unsupported type"];
  }

  return [a1 setSupportedFormats:a2];
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat(void *a1)
{
  uint64_t v1 = [a1 defaultFormat];
  uint64_t v2 = [v1 copy];

  return v2;
}

uint64_t MRVirtualVoiceInputDeviceDescriptorSetDefaultAudioFormat(void *a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void MRVirtualVoiceInputDeviceDescriptorSetDefaultAudioFormat(MRVirtualVoiceInputDeviceDescriptorRef, CFDictionaryRef)");
    [v5 handleFailureInFunction:v6 file:@"MRVirtualVoiceInputDeviceDescriptor.m" lineNumber:154 description:@"unsupported type"];
  }

  return [a1 setDefaultFormat:a2];
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCreateExternalRepresentation(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

BOOL _MRColorProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 24) |= 8u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          char v27 = &OBJC_IVAR____MRColorProtobuf__red;
          goto LABEL_41;
        case 2u:
          *(unsigned char *)(a1 + 24) |= 4u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          char v27 = &OBJC_IVAR____MRColorProtobuf__green;
          goto LABEL_41;
        case 3u:
          *(unsigned char *)(a1 + 24) |= 2u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          char v27 = &OBJC_IVAR____MRColorProtobuf__blue;
          goto LABEL_41;
        case 4u:
          *(unsigned char *)(a1 + 24) |= 1u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          char v27 = &OBJC_IVAR____MRColorProtobuf__alpha;
LABEL_41:
          *(_DWORD *)(a1 + *v27) = v20;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MRSetHiliteModeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRSetReadyStateMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  id v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t _MRAVModifyOutputContextRequestProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_47;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_49;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_49:
        *(_DWORD *)(a1 + 40) = v19;
        goto LABEL_44;
      case 2u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addAddingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 3u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addRemovingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 4u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addSettingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 5u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addClusterAwareAddingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 6u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addClusterAwareRemovingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 7u:
        PBReaderReadString();
        unint64_t v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addClusterAwareSettingOutputDeviceUID:v24];
        }
        goto LABEL_43;
      case 8u:
        unint64_t v24 = objc_alloc_init(_MRGroupTopologyModificationRequestProtobuf);
        objc_storeStrong((id *)(a1 + 56), v24);
        if (PBReaderPlaceMark()
          && (_MRGroupTopologyModificationRequestProtobufReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

BOOL _MRGameControllerButtonsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = &OBJC_IVAR___MRV1NowPlayingController__playerPathInvalidationObserver;
    char v8 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__dPadX;
    unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v10 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__dPadY;
    uint64_t v11 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__a;
    unint64_t v12 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__b;
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v3;
        uint64_t v17 = *(void *)(a2 + v16);
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)(a2 + *v4)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + *v9) + v17);
        *(void *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_12;
        }
        v13 += 7;
        if (v14++ >= 9)
        {
          unint64_t v15 = 0;
          int v21 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v21 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v15 = 0;
      }
LABEL_14:
      if (v21 || (v15 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v15 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + v7[987]) |= 4u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v24);
            *(void *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = v8;
          goto LABEL_96;
        case 2u:
          *(_WORD *)(a1 + v7[987]) |= 8u;
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v33);
            *(void *)(a2 + v32) = v33 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = v10;
          goto LABEL_96;
        case 3u:
          *(_WORD *)(a1 + v7[987]) |= 1u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFFBLL && v35 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v35);
            *(void *)(a2 + v34) = v35 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = v11;
          goto LABEL_96;
        case 4u:
          *(_WORD *)(a1 + v7[987]) |= 2u;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v37);
            *(void *)(a2 + v36) = v37 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = v12;
          goto LABEL_96;
        case 5u:
          *(_WORD *)(a1 + v7[987]) |= 0x2000u;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v39);
            *(void *)(a2 + v38) = v39 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__x;
          goto LABEL_96;
        case 6u:
          *(_WORD *)(a1 + v7[987]) |= 0x4000u;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFFBLL && v41 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v41);
            *(void *)(a2 + v40) = v41 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__y;
          goto LABEL_96;
        case 7u:
          *(_WORD *)(a1 + v7[987]) |= 0x10u;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v43);
            *(void *)(a2 + v42) = v43 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftShoulder;
          goto LABEL_96;
        case 8u:
          *(_WORD *)(a1 + v7[987]) |= 0x200u;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v45);
            *(void *)(a2 + v44) = v45 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightShoulder;
          goto LABEL_96;
        case 9u:
          *(_WORD *)(a1 + v7[987]) |= 0x20u;
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v47);
            *(void *)(a2 + v46) = v47 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftThumbstickX;
          goto LABEL_96;
        case 0xAu:
          *(_WORD *)(a1 + v7[987]) |= 0x40u;
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFFBLL && v49 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v49);
            *(void *)(a2 + v48) = v49 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftThumbstickY;
          goto LABEL_96;
        case 0xBu:
          *(_WORD *)(a1 + v7[987]) |= 0x400u;
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFFBLL && v51 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v51);
            *(void *)(a2 + v50) = v51 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightThumbstickX;
          goto LABEL_96;
        case 0xCu:
          *(_WORD *)(a1 + v7[987]) |= 0x800u;
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFFBLL && v53 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v53);
            *(void *)(a2 + v52) = v53 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightThumbstickY;
          goto LABEL_96;
        case 0xDu:
          *(_WORD *)(a1 + v7[987]) |= 0x80u;
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFFBLL && v55 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v55);
            *(void *)(a2 + v54) = v55 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftTrigger;
          goto LABEL_96;
        case 0xEu:
          *(_WORD *)(a1 + v7[987]) |= 0x1000u;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFFBLL && v57 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v57);
            *(void *)(a2 + v56) = v57 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightTrigger;
          goto LABEL_96;
        case 0xFu:
          *(_WORD *)(a1 + v7[987]) |= 0x100u;
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(void *)(a2 + *v4))
          {
            int v25 = *(_DWORD *)(*(void *)(a2 + *v9) + v59);
            *(void *)(a2 + v58) = v59 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v25 = 0;
          }
          uint64_t v60 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__pause;
LABEL_96:
          *(_DWORD *)(a1 + *v60) = v25;
          goto LABEL_97;
        default:
          unint64_t v26 = v8;
          char v27 = v10;
          unsigned int v28 = v11;
          uint64_t v29 = v7;
          uint64_t v30 = v12;
          char v31 = PBReaderSkipValueWithTag();
          unint64_t v12 = v30;
          id v5 = (int *)MEMORY[0x1E4F940C8];
          int v7 = v29;
          uint64_t v11 = v28;
          unint64_t v10 = v27;
          char v8 = v26;
          if ((v31 & 1) == 0) {
            return 0;
          }
LABEL_97:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _MRPlaybackSessionRequestMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_MRPlaybackSessionRequestProtobuf);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (_MRPlaybackSessionRequestProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __MRMediaRemoteGetClientProperties_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 56)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void __MRMediaRemoteSetClientProperties_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void __MRMediaRemoteUpdateClientProperties_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MRMediaRemoteGetMediaAppIsInstalled_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

void MRMediaRemoteRequestPendingCommands_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_194F3C000, log, OS_LOG_TYPE_FAULT, "Cannot call 'RequestPendingCommands' if CanBeNowPlaying=YES", v1, 2u);
}

void __MRMediaRemoteRequestPendingCommands_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

void MRMediaRemoteCopyPendingCommands_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_194F3C000, log, OS_LOG_TYPE_FAULT, "Cannot call 'CopyPendingCommands' if tCanBeNowPlaying=YES", v1, 2u);
}

#error "1951F378C: call analysis failed (funcsize=35)"

void __MRMediaRemoteSendPlaybackSession_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [*(id *)(v1 + 40) requestID];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, 2u);
}

void __MRMediaRemoteSendPlaybackSessionMigrateBegin_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [*(id *)(v1 + 40) requestIdentifier];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, 2u);
}

void __MRMediaRemoteSendPlaybackSessionMigrateEnd_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [*(id *)(v1 + 40) requestIdentifier];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, 2u);
}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void MRMediaRemoteValidateIncomingCommandOptions_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[MRRemoteControl] Command %{public}@ missing source position option(s): %{public}@", (uint8_t *)&v3, 0x16u);
}

void MRAddDistantEndpointToXPCMessage_cold_1()
{
}

void MRAddPropertyListToXPCMessage_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_194F3C000, v1, OS_LOG_TYPE_ERROR, "Error encoding to XPC message: %@ object: %@", v2, 0x16u);
}

void MRCreatePropertyListFromXPCMessage_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "Error decoding XPC message: %@", v2, v3, v4, v5, v6);
}

void _MRDecodeObjectForKey_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "Decode Error: could not decode %{public}@", v2, v3, v4, v5, v6);
}

void _MREncodeObjectForKey_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "Encode Error: could not encode %{public}@", v2, v3, v4, v5, v6);
}

void MRCreateDecodedUserInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MRCreateDecodedUserInfo_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MRCreateDecodedUserInfo_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MRCreateEncodedUserInfo_block_invoke_11_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_6();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_194F3C000, v1, OS_LOG_TYPE_DEBUG, "Removing %{public}@ for key %{public}@ for notification user info", v2, 0x16u);
}

void MRMediaRemoteSetNowPlayingInfoForPlayer_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[NowPlayingInfo] Ignoring nowPlayingInfo update because playback queue callbacks are set", v1, 2u);
}

void MRMediaRemoteSetNowPlayingInfoForPlayer_cold_2(char a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v4 = @"Replace";
  }
  else {
    uint64_t v4 = @"Update";
  }
  uint64_t v5 = MRMediaRemoteCopyReadableDictionaryDescription(a2);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_194F3C000, a3, OS_LOG_TYPE_DEBUG, "[NowPlayingInfo] Attempting to set nowPlayingInfo with mergePolicy %@: %@", (uint8_t *)&v6, 0x16u);
}

void MRSystemAppPlaybackQueueDestroy_cold_1()
{
}

void MRSystemAppPlaybackQueueGetType_cold_1()
{
}

void MRSystemAppPlaybackQueueIsRequestingImmediatePlayback_cold_1()
{
}

void MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback_cold_1()
{
}

void MRSystemAppPlaybackQueueGetSiriRecommendationIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueGetSiriAssetInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueSetSiriAssetInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueCopyFeatureName_cold_1()
{
}

void MRSystemAppPlaybackQueueSetFeatureName_cold_1()
{
}

void MRSystemAppPlaybackQueueGetSiriWHAMetricsInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueShouldOverrideManuallyCuratedQueue_cold_1()
{
}

void MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue_cold_1()
{
}

void MRSystemAppPlaybackQueueGetUserInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueSetUserInfo_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryData_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryData", "MRRemotePlaybackQueue.m", 417, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryData_cold_1()
{
}

void MRSystemAppPlaybackQueueSetLocalQueryData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryData", "MRRemotePlaybackQueue.m", 424, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 441, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData_cold_1()
{
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 448, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 465, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID_cold_1()
{
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 472, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryShuffleMode_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 479, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryShuffleMode_cold_1()
{
}

void MRSystemAppPlaybackQueueSetLocalQueryShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 486, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryRepeatMode_cold_1()
{
}

void MRSystemAppPlaybackQueueGetLocalQueryRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 493, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryRepeatMode_cold_1()
{
}

void MRSystemAppPlaybackQueueSetLocalQueryRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 500, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetRadioStationIDType_cold_1()
{
}

void MRSystemAppPlaybackQueueSetRadioStationIDType_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIDType", "MRRemotePlaybackQueue.m", 518, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueGetRadioStationIntegerPID_cold_1()
{
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_1()
{
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 548, "queue->radioStationQueue.stationIDType == MRSystemAppRadioStationIDTypeIntegerPID");
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_3()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 547, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationStringIdentifier", "MRRemotePlaybackQueue.m", 576, "queue->radioStationQueue.stationIDType == MRSystemAppRadioStationIDTypeStationStringID");
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_3()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationStringIdentifier", "MRRemotePlaybackQueue.m", 575, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers_cold_1()
{
}

void MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers_cold_2()
{
}

void MRSystemAppPlaybackQueueSetGenericTrackIdentifiers_cold_1()
{
}

void MRSystemAppPlaybackQueueSetGenericTrackIdentifiers_cold_2()
{
}

void MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier_cold_2()
{
}

void MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier_cold_2()
{
}

void MRSystemAppPlaybackQueueGetTracklistShuffleMode_cold_1()
{
}

void MRSystemAppPlaybackQueueGetTracklistShuffleMode_cold_2()
{
}

void MRSystemAppPlaybackQueueSetTracklistShuffleMode_cold_1()
{
}

void MRSystemAppPlaybackQueueSetTracklistShuffleMode_cold_2()
{
}

void MRSystemAppPlaybackQueueGetTracklistRepeatMode_cold_1()
{
}

void MRSystemAppPlaybackQueueGetTracklistRepeatMode_cold_2()
{
}

void MRSystemAppPlaybackQueueSetTracklistRepeatMode_cold_1()
{
}

void MRSystemAppPlaybackQueueSetTracklistRepeatMode_cold_2()
{
}

void MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData_cold_1()
{
}

void MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData_cold_2()
{
}

void MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData_cold_1()
{
}

void MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData_cold_2()
{
}

void MRSystemAppPlaybackQueueCopyGeniusSeedTrack_cold_1()
{
}

void MRSystemAppPlaybackQueueCopyGeniusSeedTrack_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyGeniusSeedTrack", "MRRemotePlaybackQueue.m", 707, "queue->type == MRSystemAppPlaybackQueueTypeGenius");
}

void MRSystemAppPlaybackQueueSetGeniusSeedTrack_cold_1()
{
}

void MRSystemAppPlaybackQueueSetGeniusSeedTrack_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetGeniusSeedTrack", "MRRemotePlaybackQueue.m", 721, "queue->type == MRSystemAppPlaybackQueueTypeGenius");
}

void MRSystemAppPlaybackQueueCopyCustomDataIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueCopyCustomDataIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomDataIdentifier", "MRRemotePlaybackQueue.m", 736, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueSetCustomDataIdentifier_cold_1()
{
}

void MRSystemAppPlaybackQueueSetCustomDataIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomDataIdentifier", "MRRemotePlaybackQueue.m", 744, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueCopyCustomData_cold_1()
{
}

void MRSystemAppPlaybackQueueCopyCustomData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomData", "MRRemotePlaybackQueue.m", 756, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueSetCustomData_cold_1()
{
}

void MRSystemAppPlaybackQueueSetCustomData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomData", "MRRemotePlaybackQueue.m", 764, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 56)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

void __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "PlaybackQueueInvalidation: Client API misuse: InvalidatingPlaybackQueue instead of ContentItemChange. Sending additional contentItemChange", v1, 2u);
}

void __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 playerPath];
  int v4 = 138412546;
  uint64_t v5 = @"kMRPlayerPlaybackQueueChangedNotification";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "Sending short-circuited notification %@ for %@", (uint8_t *)&v4, 0x16u);
}

void MRAVEndpointModifyOutputDevicesInGroup_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[AVEndpoint] Failed to select playback category on auxiliary context. %{public}@", (uint8_t *)&v2, 0xCu);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:a1[6]];
  int v10 = 138544130;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_129_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[AVEndpoint] Error occurred while discovering group leader: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_145_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[AVEndpoint] Error occurred while discovering devices %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void _MRMediaRemoteLogUnsubscribedContentItems_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MRContentItemsCopyMinimalReadableDescription(a2, 0);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_194F3C000, a3, OS_LOG_TYPE_DEBUG, "Not sending contentItemChange for path %{public}@ %@", (uint8_t *)&v6, 0x16u);
}

void _MRReadNowPlayingInfoString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_194F3C000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void _MRReadNowPlayingInfoString_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void _MRMediaRemoteGetDeviceUIDWithRetryIntervals_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[GetDeviceUIDWithRetry] Unable to fetch required deviceUID after %lu retries", (uint8_t *)&v3, 0xCu);
}

void __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  os_log_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 56)];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, v8);
}

#error "1951F7F58: call analysis failed (funcsize=35)"

#error "1951F8018: call analysis failed (funcsize=46)"

#error "1951F80E0: call analysis failed (funcsize=48)"

#error "1951F81AC: call analysis failed (funcsize=48)"

#error "1951F8288: call analysis failed (funcsize=54)"

#error "1951F8350: call analysis failed (funcsize=47)"

#error "1951F8430: call analysis failed (funcsize=55)"

#error "1951F84D8: call analysis failed (funcsize=38)"

#error "1951F85D0: call analysis failed (funcsize=38)"

#error "1951F86A0: call analysis failed (funcsize=51)"

#error "1951F8764: call analysis failed (funcsize=47)"

#error "1951F8878: call analysis failed (funcsize=54)"

void MRContentItemMerge_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "Attempting to Merge a ContentItem with itself %@", (uint8_t *)&v2, 0xCu);
}

void __MRGroupSessionJoinSessionWithToken_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, a2, a3, "[MRGroupSession] Failed to join group session with token: %@, error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void _onQueue_MRInvokeClientCallbacks_cold_1(uint64_t a1, void *a2)
{
  int v2 = MRContentItemCopyMinimalReadableDescription(a2);
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_10(&dword_194F3C000, v3, v4, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ requesting assets for item %{public}@", v5, v6, v7, v8, v9);
}

void _MRHandlePlaybackQueueRequest_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[MRPlaybackQueueServiceClient] Received playbackQueueRequest %{public}@ for path %{public}@", (uint8_t *)&v3, 0x16u);
}

#error "1951FA7A0: call analysis failed (funcsize=43)"

#error "1951FA854: call analysis failed (funcsize=43)"

#error "1951FA8F4: call analysis failed (funcsize=37)"

#error "1951FA994: call analysis failed (funcsize=37)"

#error "1951FAA34: call analysis failed (funcsize=37)"

#error "1951FAAD4: call analysis failed (funcsize=37)"

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x1F410C180]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D7FA0](stream, propertyName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1F40D88F0](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1F40E8908]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MSVArchivedDataWithRootObject()
{
  return MEMORY[0x1F412EB80]();
}

uint64_t MSVCopyLocalizedModelName()
{
  return MEMORY[0x1F412EB90]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1F412EBB0]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1F412EBB8]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1F412EBD8]();
}

uint64_t MSVImageUtilitiesMakeBoundingBoxSize()
{
  return MEMORY[0x1F412EC70]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1F412EC90]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1F412EC98]();
}

uint64_t MSVProcessIsUsingRoots()
{
  return MEMORY[0x1F412ECA8]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1F412ECB0]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x1F412ECE8]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1F412ECF0]();
}

uint64_t MSVWeakLinkClass()
{
  return MEMORY[0x1F412ECF8]();
}

uint64_t MSVWeakLinkSymbol()
{
  return MEMORY[0x1F412ED00]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1F41472F0]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1F41472F8]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1F4147300]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1F4147308]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1F4147310]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1F4147318]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1F4147328]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1F4147330]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1F4147338]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1F4147340]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1F4147348]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1F4147350]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1F4147378]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1F4147388]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1F4147398]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1F41473A0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1F41473A8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1F41473B0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1F41473B8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1F41473C0]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1F41473D0]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1F41473D8]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1F41473E0]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1F41473E8]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1F41473F0]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1F41473F8]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x1F4147408]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x1F4147410]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x1F4147418]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x1F4147420]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x1F4147428]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x1F4147430]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA0]();
}

uint64_t _AXSAlwaysShowVolumeControlEnabled()
{
  return MEMORY[0x1F41788B8]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x1F4178B40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1F40D94A8]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1F40D94B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x1F412ED10]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1F412ED20]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC08](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}