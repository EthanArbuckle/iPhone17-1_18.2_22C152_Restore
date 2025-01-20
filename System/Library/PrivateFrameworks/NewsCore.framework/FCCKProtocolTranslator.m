@interface FCCKProtocolTranslator
+ (id)sharedInstance;
- (id)fieldValueFromObject:(uint64_t)a1;
- (id)fieldValueOfType:(void *)a3 withObject:;
- (id)objectRepresentationFromFieldValue:(uint64_t)a1;
- (id)pQueryFromQuery:(void *)a3 error:;
- (id)pRecordIdentifierFromRecordID:(uint64_t)a1;
- (id)pReferenceFromReference:(uint64_t)a1 error:(void *)a2;
- (id)recordFromPRecord:(uint64_t)a1;
- (id)referenceFromPReference:(void *)a1 error:(void *)a2;
- (uint64_t)fieldValueTypeFromObject:(uint64_t)a1;
@end

@implementation FCCKProtocolTranslator

- (id)recordFromPRecord:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  uint64_t v58 = a1;
  id v59 = 0;
  if (!a1 || !v3) {
    goto LABEL_32;
  }
  v5 = [MEMORY[0x1E4F1A310] defaultRecordZone];
  v6 = [v5 zoneID];
  uint64_t v7 = [v6 copy];

  id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v9 = [v4 recordIdentifier];
  v10 = (void *)v9;
  if (v9)
  {
    id v11 = *(id *)(v9 + 8);
    v12 = v11;
    if (v11)
    {
      v13 = (void *)*((void *)v11 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_6:
  id v14 = v13;
  uint64_t v15 = [v8 initWithRecordName:v14 zoneID:v7];

  id v16 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  v17 = [v4 type];
  v18 = [v17 name];
  v55 = (void *)v15;
  v19 = (void *)[v16 _initSkippingValidationWithRecordType:v18 recordID:v15];

  v20 = [v4 etag];
  id v59 = v19;
  [v19 setEtag:v20];

  v56 = (void *)v7;
  if ([v4 hasTimeStatistics])
  {
    uint64_t v21 = [v4 timeStatistics];
    v22 = (void *)v21;
    if (!v21 || !*(void *)(v21 + 8))
    {
      [v19 setCreationDate:0];
      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v24 = [v4 timeStatistics];
    v25 = (void *)v24;
    if (v24)
    {
      v26 = (double *)*(id *)(v24 + 8);
      v27 = v26;
      if (v26)
      {
        double v28 = v26[1];
LABEL_12:
        v29 = [v23 dateWithTimeIntervalSinceReferenceDate:v28];
        [v19 setCreationDate:v29];

LABEL_14:
        uint64_t v30 = [v4 timeStatistics];
        v31 = (void *)v30;
        if (!v30 || !*(void *)(v30 + 16))
        {
          [v19 setModificationDate:0];
          goto LABEL_21;
        }
        v32 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v33 = [v4 timeStatistics];
        v34 = (void *)v33;
        if (v33)
        {
          v35 = (double *)*(id *)(v33 + 16);
          v36 = v35;
          if (v35)
          {
            double v37 = v35[1];
LABEL_19:
            v38 = [v32 dateWithTimeIntervalSinceReferenceDate:v37];
            [v19 setModificationDate:v38];

LABEL_21:
            goto LABEL_22;
          }
        }
        else
        {
          v36 = 0;
        }
        double v37 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {
      v27 = 0;
    }
    double v28 = 0.0;
    goto LABEL_12;
  }
LABEL_22:
  [v19 setTrackChanges:0];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v57 = v4;
  v39 = [v4 fields];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v45 = [v44 identifier];
        v46 = [v45 name];
        char v47 = [v46 hasPrefix:@"_"];

        if ((v47 & 1) == 0)
        {
          v48 = [v59 valueStore];
          v49 = [v44 value];
          v50 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](v58, v49);
          v51 = [v44 identifier];
          v52 = [v51 name];
          [v48 setObjectNoValidate:v50 forKey:v52];
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v41);
  }

  [v59 setTrackChanges:1];
  v4 = v57;
  v53 = [v57 conflictLoserEtags];
  [v59 setConflictLoserEtags:v53];

  [v59 setKnownToServer:1];
LABEL_32:

  return v59;
}

- (id)objectRepresentationFromFieldValue:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (!a1)
  {
    id v8 = 0;
    goto LABEL_15;
  }
  v5 = [v3 listValues];
  if (v5 || [v4 type] == 16)
  {

LABEL_5:
    v6 = [v4 listValues];
    uint64_t v7 = [v6 count];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v4 listValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](a1, *(void *)(*((void *)&v25 + 1) + 8 * i));
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v11);
    }

    goto LABEL_15;
  }
  if ([v4 type] == 9) {
    goto LABEL_5;
  }
  id v8 = 0;
  switch([v4 type])
  {
    case 1u:
      uint64_t v16 = [v4 bytesValue];
      goto LABEL_32;
    case 2u:
      v18 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v19 = [v4 dateValue];
      id v20 = (id)v19;
      if (v19) {
        double v21 = *(double *)(v19 + 8);
      }
      else {
        double v21 = 0.0;
      }
      id v8 = [v18 dateWithTimeIntervalSinceReferenceDate:v21];
      goto LABEL_30;
    case 3u:
      uint64_t v16 = [v4 stringValue];
      goto LABEL_32;
    case 5u:
      v22 = [v4 referenceValue];
      id v24 = 0;
      id v8 = -[FCCKProtocolTranslator referenceFromPReference:error:](v22, &v24);
      id v20 = v24;

      if ((v20 || !v8) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)[[NSString alloc] initWithFormat:@"Invalid field value (record identifier) from server: %@", v20];
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = "-[FCCKProtocolTranslator objectRepresentationFromFieldValue:]";
        __int16 v31 = 2080;
        v32 = "FCCKProtocolTranslator.m";
        __int16 v33 = 1024;
        int v34 = 251;
        __int16 v35 = 2114;
        v36 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
LABEL_30:

      break;
    case 7u:
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "signedValue"));
      goto LABEL_32;
    case 8u:
      v17 = NSNumber;
      [v4 doubleValue];
      uint64_t v16 = objc_msgSend(v17, "numberWithDouble:");
LABEL_32:
      id v8 = (void *)v16;
      break;
    default:
      break;
  }
LABEL_15:

  return v8;
}

+ (id)sharedInstance
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FCCKProtocolTranslator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB5D1AD0 != -1) {
    dispatch_once(&qword_1EB5D1AD0, block);
  }
  v1 = (void *)_MergedGlobals_215;
  return v1;
}

- (id)pRecordIdentifierFromRecordID:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = a2;
    id v3 = objc_opt_new();
    v4 = [v2 recordName];
    v5 = -[NSString _FCCKPIdentifierWithType:](v4, 1);
    -[FCCKPRecordIdentifier setValue:]((uint64_t)v3, v5);

    v6 = [v2 zoneID];

    id v7 = v6;
    id v8 = objc_opt_new();
    uint64_t v9 = [v7 zoneName];
    uint64_t v10 = -[NSString _FCCKPIdentifierWithType:](v9, 6);
    -[FCCKPRecordZoneIdentifier setValue:]((uint64_t)v8, v10);

    uint64_t v11 = [v7 ownerName];

    if (([v11 isEqualToString:*MEMORY[0x1E4F19C08]] & 1) == 0
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"unknown owner"];
      int v17 = 136315906;
      v18 = "-[FCCKProtocolTranslator pUserIdentifierFromUserRecordName:]";
      __int16 v19 = 2080;
      id v20 = "FCCKProtocolTranslator.m";
      __int16 v21 = 1024;
      int v22 = 68;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v17, 0x26u);
    }
    uint64_t v12 = -[NSString _FCCKPIdentifierWithType:](@"_defaultOwner", 7);
    -[FCCKPRecordZoneIdentifier setOwnerIdentifier:]((uint64_t)v8, v12);

    if (v8) {
      v13 = (void *)v8[1];
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14) {
      id v14 = v8;
    }

    -[FCCKPRecordIdentifier setZoneIdentifier:]((uint64_t)v3, v14);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)pQueryFromQuery:(void *)a3 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    v6 = objc_opt_new();
    id v7 = [v5 predicate];
    id v32 = 0;
    id v8 = [v7 FCCKPQueryFiltersWithTranslator:a1 error:&v32];
    id v9 = v32;

    if (v8)
    {
      uint64_t v10 = CKVerifyFilters(v8);

      if (!v10)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = v8;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v12);
              }
              -[FCCKPQuery addFilters:]((uint64_t)v6, *(void **)(*((void *)&v28 + 1) + 8 * i));
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v13);
        }

        uint64_t v16 = objc_alloc_init(FCCKPRecordType);
        int v17 = [v5 recordType];
        [(FCCKPRecordType *)v16 setName:v17];

        -[FCCKPQuery addTypes:]((uint64_t)v6, v16);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v18 = [v5 sortDescriptors];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v18);
              }
              int v22 = [*(id *)(*((void *)&v24 + 1) + 8 * j) FCCKPQuerySort];
              -[FCCKPQuery addSorts:]((uint64_t)v6, v22);
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v19);
        }

        id v11 = v6;
        goto LABEL_23;
      }
      id v9 = (id)v10;
    }
    if (a3)
    {
      id v9 = v9;
      *a3 = v9;
    }

    id v11 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v11 = 0;
LABEL_24:

  return v11;
}

- (id)fieldValueFromObject:(uint64_t)a1
{
  id v2 = 0;
  if (a1 && a2)
  {
    id v4 = a2;
    uint64_t v5 = -[FCCKProtocolTranslator fieldValueTypeFromObject:](a1, v4);
    id v2 = -[FCCKProtocolTranslator fieldValueOfType:withObject:](a1, v5, v4);
  }
  return v2;
}

- (uint64_t)fieldValueTypeFromObject:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = 2;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = 3;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_11:
      uint64_t v4 = 1;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      if (![v5 count])
      {

        uint64_t v4 = 9;
        goto LABEL_24;
      }
      v6 = [v5 objectAtIndexedSubscript:0];
      CKValidateRecordArrayValue(v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v4 = 13;
LABEL_18:

        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = 11;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = 10;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (CFNumberIsFloatType((CFNumberRef)v6)) {
          uint64_t v4 = 18;
        }
        else {
          uint64_t v4 = 17;
        }
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = 15;
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v12 = [NSString alloc];
        uint64_t v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        uint64_t v15 = (void *)[v12 initWithFormat:@"Can't encode array %@ of unknown child class: %@", v5, v14];
        *(_DWORD *)buf = 136315906;
        int v17 = "-[FCCKProtocolTranslator(RecordFields) fieldValueTypeFromObject:]";
        __int16 v18 = 2080;
        uint64_t v19 = "FCCKRecordFieldConversion.m";
        __int16 v20 = 1024;
        int v21 = 98;
        __int16 v22 = 2114;
        __int16 v23 = v15;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v4 = 5;
        goto LABEL_24;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = [NSString alloc];
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = (void *)[v8 initWithFormat:@"Can't encode object %@ of class %@", v3, v10];
      *(_DWORD *)buf = 136315906;
      int v17 = "-[FCCKProtocolTranslator(RecordFields) fieldValueTypeFromObject:]";
      __int16 v18 = 2080;
      uint64_t v19 = "FCCKRecordFieldConversion.m";
      __int16 v20 = 1024;
      int v21 = 110;
      __int16 v22 = 2114;
      __int16 v23 = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (CFNumberIsFloatType((CFNumberRef)v3)) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 7;
  }
LABEL_24:

  return v4;
}

- (id)fieldValueOfType:(void *)a3 withObject:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    v6 = objc_opt_new();
    [v6 setType:a2];
    switch((int)a2)
    {
      case 1:
        [v6 setBytesValue:v5];
        break;
      case 2:
        int v17 = objc_alloc_init(FCCKPDate);
        [v6 setDateValue:v17];

        [v5 timeIntervalSinceReferenceDate];
        uint64_t v19 = v18;
        uint64_t v20 = [v6 dateValue];
        if (v20)
        {
          *(unsigned char *)(v20 + 16) |= 1u;
          *(void *)(v20 + 8) = v19;
        }

        break;
      case 3:
        [v6 setStringValue:v5];
        break;
      case 5:
        int v21 = objc_opt_new();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v22 = [v5 recordID];
          __int16 v23 = -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v22);
          [v21 setRecordIdentifier:v23];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v22 = -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v5);
            [v21 setRecordIdentifier:v22];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_31;
            }
            -[FCCKProtocolTranslator pReferenceFromReference:error:](a1, v5);
            int v21 = v22 = v21;
          }
        }

LABEL_31:
        [v6 setReferenceValue:v21];

        break;
      case 7:
        objc_msgSend(v6, "setSignedValue:", objc_msgSend(v5, "longLongValue"));
        break;
      case 8:
        [v5 doubleValue];
        objc_msgSend(v6, "setDoubleValue:");
        break;
      case 9:
      case 10:
      case 11:
      case 13:
      case 15:
      case 17:
      case 18:
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v24 = v5;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          id v11 = MEMORY[0x1E4F14500];
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Nesting arrays not supported"];
                *(_DWORD *)buf = 136315906;
                long long v30 = "-[FCCKProtocolTranslator(RecordFields) fieldValueOfType:withObject:]";
                __int16 v31 = 2080;
                id v32 = "FCCKRecordFieldConversion.m";
                __int16 v33 = 1024;
                int v34 = 175;
                __int16 v35 = 2114;
                v36 = v15;
                _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
              uint64_t v14 = -[FCCKProtocolTranslator fieldValueFromObject:](a1, v13);
              [v6 addListValue:v14];

              ++v12;
            }
            while (v9 != v12);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
          }
          while (v9);
        }

        id v5 = v24;
        break;
      default:
        break;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __40__FCCKProtocolTranslator_sharedInstance__block_invoke()
{
  _MergedGlobals_215 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)referenceFromPReference:(void *)a1 error:(void *)a2
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 recordIdentifier];
  id v5 = (void *)MEMORY[0x1E4F1A310];
  v6 = v4;
  id v7 = [v5 defaultRecordZone];
  uint64_t v8 = [v7 zoneID];
  uint64_t v9 = (void *)[v8 copy];

  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  if (v6) {
    id v11 = (void *)v6[1];
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = v11;

  if (v12) {
    uint64_t v13 = (void *)v12[1];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = (void *)[v10 initWithRecordName:v14 zoneID:v9];

  if (v15)
  {
    if ([v3 hasType])
    {
      int v16 = [v3 type];
      if (v16 == 1)
      {
        uint64_t v17 = 1;
        goto LABEL_19;
      }
      if (v16 != 2)
      {
        if (v16 == 3)
        {
          uint64_t v17 = *MEMORY[0x1E4F19D98];
          goto LABEL_19;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected reference type"];
          *(_DWORD *)buf = 136315906;
          id v24 = "-[FCCKProtocolTranslator referenceFromPReference:error:]";
          __int16 v25 = 2080;
          long long v26 = "FCCKProtocolTranslator.m";
          __int16 v27 = 1024;
          int v28 = 115;
          __int16 v29 = 2114;
          long long v30 = v22;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    uint64_t v17 = 0;
LABEL_19:
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v15 action:v17];
    if (!a2) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v21 = (void *)[[NSString alloc] initWithFormat:@"Invalid record identifier from server %@: %@", v3, 0];
    *(_DWORD *)buf = 136315906;
    id v24 = "-[FCCKProtocolTranslator referenceFromPReference:error:]";
    __int16 v25 = 2080;
    long long v26 = "FCCKProtocolTranslator.m";
    __int16 v27 = 1024;
    int v28 = 121;
    __int16 v29 = 2114;
    long long v30 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v18 = 0;
  if (a2)
  {
LABEL_20:
    id v19 = 0;
    *a2 = 0;
  }
LABEL_21:

  return v18;
}

- (id)pReferenceFromReference:(uint64_t)a1 error:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = [v3 recordID];
    v6 = -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v5);
    [v4 setRecordIdentifier:v6];

    if ([v3 referenceAction] == 1)
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = [v3 referenceAction];
      if (v8 == *MEMORY[0x1E4F19D98]) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 2;
      }
    }
    [v4 setType:v7];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end