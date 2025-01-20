@interface CKRecord(BRCSerializationAdditions)
+ (uint64_t)newFromSqliteStatement:()BRCSerializationAdditions atIndex:;
+ (uint64_t)newFromSqliteValue:()BRCSerializationAdditions;
- (BOOL)_verifyValueForRecordWithNumber:()BRCSerializationAdditions key:item:error:;
- (BOOL)deserializeiWorkSharingOptions:()BRCSerializationAdditions error:;
- (id)_createAppLibraryIfNecessary:()BRCSerializationAdditions session:;
- (id)getAndUpdateBoundaryKeyForItem:()BRCSerializationAdditions;
- (uint64_t)_deserializeValue:()BRCSerializationAdditions forKey:encrypted:expectClass:allowNil:errorDescription:;
- (uint64_t)_locateSideCarServerZone:()BRCSerializationAdditions withShareAliasReference:withSession:;
- (uint64_t)_updateSize:()BRCSerializationAdditions mtime:shouldUseEnhancedDrivePrivacy:item:error:;
- (uint64_t)deserializeAliasInfo:()BRCSerializationAdditions serverZone:error:;
- (uint64_t)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:;
- (uint64_t)deserializeSideCarInfo:()BRCSerializationAdditions error:;
- (uint64_t)deserializeStatInfo:()BRCSerializationAdditions serverMetrics:itemID:session:error:;
- (uint64_t)deserializeSymlinkTarget:()BRCSerializationAdditions error:;
- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:error:;
- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:;
- (uint64_t)locateSideCarServerZone:()BRCSerializationAdditions shareRecordName:withSession:;
- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:;
- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:;
- (uint64_t)serializeForContentUpload:()BRCSerializationAdditions size:mtime:etag:shouldUseEnhancedDrivePrivacy:error:;
- (uint64_t)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:;
- (uint64_t)serializeSystemFields:()BRCSerializationAdditions;
- (uint64_t)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:;
- (void)_deserializeRootSharingOptions:()BRCSerializationAdditions;
- (void)_processSaltingOnAppLibrary:()BRCSerializationAdditions;
- (void)_saveAppLibraryIfNecessary:()BRCSerializationAdditions;
- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:;
- (void)seralizeBirthtime:()BRCSerializationAdditions;
- (void)serializeContentBoundaryKey:()BRCSerializationAdditions;
- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:;
- (void)serializeFinderTags:()BRCSerializationAdditions forCreation:;
- (void)serializeSideCarInfo:()BRCSerializationAdditions filenameExtension:diffs:deadInServerTruth:;
- (void)serializeSpecialIdentityForFilename:()BRCSerializationAdditions parentIDIsCloudDocsRoot:parentIDisDocumentsFolder:;
- (void)serializeSystemFields:()BRCSerializationAdditions includeCZMEtag:;
- (void)setLastUsedTime:()BRCSerializationAdditions;
- (void)sqliteBind:()BRCSerializationAdditions index:;
@end

@implementation CKRecord(BRCSerializationAdditions)

- (void)sqliteBind:()BRCSerializationAdditions index:
{
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteValue:()BRCSerializationAdditions
{
  if (sqlite3_value_type(a3) == 4)
  {
    v4 = (void *)MEMORY[0x263F08928];
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)MEMORY[0x263EFF8F8];
    v7 = sqlite3_value_blob(a3);
    v8 = [v6 dataWithBytes:v7 length:sqlite3_value_bytes(a3)];
    uint64_t v9 = [v4 unarchivedObjectOfClass:v5 fromData:v8 error:0];
  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:]();
      }
    }
    return 0;
  }
  return v9;
}

+ (uint64_t)newFromSqliteStatement:()BRCSerializationAdditions atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 4)
  {
    id v6 = (void *)MEMORY[0x263F08928];
    uint64_t v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v9 = sqlite3_column_blob(a3, iCol);
    v10 = objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, iCol));
    uint64_t v11 = [v6 unarchivedObjectOfClass:v7 fromData:v10 error:0];
  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:]();
      }
    }
    return 0;
  }
  return v11;
}

- (uint64_t)_deserializeValue:()BRCSerializationAdditions forKey:encrypted:expectClass:allowNil:errorDescription:
{
  id v13 = a4;
  if (a5)
  {
    v14 = [a1 encryptedValues];
    v15 = [v14 objectForKeyedSubscript:v13];

    if (v15) {
      goto LABEL_6;
    }
  }
  else
  {
    v15 = [a1 objectForKeyedSubscript:v13];
    if (v15) {
      goto LABEL_6;
    }
  }
  if ((a7 & 1) == 0)
  {
    if (!a8) {
      goto LABEL_11;
    }
    v17 = NSString;
    v18 = [a1 recordType];
    v19 = [a1 recordID];
    [v17 stringWithFormat:@"missing key '%@' in %@ record %@", v13, v18, v19, v23, v24];
    uint64_t v21 = LABEL_16:;
    v22 = *(void **)a8;
    *(void *)a8 = v21;

    a8 = 0;
    goto LABEL_11;
  }
LABEL_6:
  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a8) {
      goto LABEL_11;
    }
    v20 = NSString;
    v18 = [a1 recordType];
    v19 = [a1 recordID];
    [v20 stringWithFormat:@"invalid value for key '%@' in %@ record %@: %@ %@", v13, v18, v19, objc_opt_class(), v15];
    goto LABEL_16;
  }
  if (a3) {
    *a3 = v15;
  }
  a8 = 1;
LABEL_11:

  return a8;
}

- (uint64_t)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v46 = 0;
  id v47 = 0;
  char v15 = [a1 _deserializeValue:&v46 forKey:@"encryptedBasename" encrypted:1 expectClass:objc_opt_class() allowNil:0 errorDescription:&v47];
  id v16 = v46;
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v47 forKeyedSubscript:@"encryptedBasename"];
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v47);
      v25 = 0;
      id v24 = 0;
      id v26 = 0;
      v18 = 0;
      uint64_t v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v25 = 0;
    id v24 = 0;
    id v26 = 0;
    v18 = 0;
    uint64_t v27 = 0;
LABEL_18:
    id v20 = v16;
    id v16 = 0;
    goto LABEL_40;
  }
  id v45 = 0;
  char v17 = [a1 _deserializeValue:&v45 forKey:@"bounceNo" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v47];
  v18 = (__CFString *)v45;
  if ((v17 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v47 forKeyedSubscript:@"bounceNo"];
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v47);
      v25 = 0;
      id v24 = 0;
      id v26 = 0;
      uint64_t v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v25 = 0;
    id v24 = 0;
    id v26 = 0;
    uint64_t v27 = 0;
LABEL_24:
    id v20 = v18;
    v18 = 0;
    goto LABEL_40;
  }
  id v44 = 0;
  char v19 = [a1 _deserializeValue:&v44 forKey:@"extension" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v47];
  id v20 = v44;
  if (v19)
  {
    if (v18 && [(__CFString *)v18 integerValue] <= 1)
    {
      v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v49 = v18;
        __int16 v50 = 2112;
        v51 = v39;
        _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] The server sent a bounceNo <= 1: %@%@", buf, 0x16u);
      }

      v18 = 0;
    }
    uint64_t v21 = (__CFString *)[[NSString alloc] initWithData:v16 encoding:4];
    if (!v21)
    {
      v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[CKRecord(BRCSerializationAdditions) deserializeFilename:basename:bounceno:extension:userInfo:error:]();
      }

      uint64_t v21 = &stru_26F3822F0;
    }
    v43 = a6;
    if ([(__CFString *)v21 length])
    {
      v22 = objc_msgSend(NSString, "stringWithUTF8String:", -[__CFString br_safeFileSystemRepresentation](v21, "br_safeFileSystemRepresentation"));

      id v23 = v22;
      id v24 = v23;
      if (v18)
      {
        v25 = [v23 stringByAppendingFormat:@" %@", v18];
      }
      else
      {
        v25 = v23;
      }
    }
    else
    {
      if (v18)
      {
        v38 = [(__CFString *)v21 stringByAppendingFormat:@" %@", v18];

        uint64_t v21 = v18;
      }
      else
      {
        v41 = brc_bread_crumbs();
        v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) deserializeFilename:basename:bounceno:extension:userInfo:error:]();
        }

        v38 = objc_msgSend(NSString, "br_emptyFilenameAlternativeName");
      }

      id v24 = v38;
      v18 = 0;
      v25 = v24;
    }
    if ([v20 length])
    {
      uint64_t v28 = [v25 stringByAppendingPathExtension:v20];

      v25 = (void *)v28;
    }
    if (a3)
    {
      uint64_t v29 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", objc_msgSend(v25, "fileSystemRepresentation"));
      v30 = *a3;
      *a3 = (void *)v29;
    }
    if (a4)
    {
      uint64_t v31 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", objc_msgSend(v24, "fileSystemRepresentation"));
      v32 = *a4;
      *a4 = (void *)v31;
    }
    if (a5) {
      objc_storeStrong(a5, v18);
    }
    if (!v43)
    {
      uint64_t v27 = 1;
      goto LABEL_41;
    }
    if (v20)
    {
      v33 = NSString;
      id v34 = v20;
      objc_msgSend(v33, "br_pathWithFileSystemRepresentation:", objc_msgSend(v34, "fileSystemRepresentation"));
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v26 = v20;
    id v20 = *v43;
    id *v43 = v26;
    uint64_t v27 = 1;
  }
  else
  {
    if (v14)
    {
      [v14 setObject:v47 forKeyedSubscript:@"extension"];
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v47);
      v25 = 0;
      id v24 = 0;
      id v26 = 0;
      uint64_t v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    v25 = 0;
    id v24 = 0;
    id v26 = 0;
    uint64_t v27 = 0;
  }
LABEL_40:

  id v20 = v26;
LABEL_41:

  return v27;
}

- (uint64_t)deserializeAliasInfo:()BRCSerializationAdditions serverZone:error:
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [v8 db];
  [v9 assertOnQueue];

  v10 = [v8 session];

  uint64_t v11 = 0;
  id v102 = 0;
  if (!a3)
  {
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v101 = 0;
  char v12 = [a1 _deserializeValue:&v101 forKey:@"parent" encrypted:0 expectClass:objc_opt_class() allowNil:0 errorDescription:&v102];
  id v13 = v101;
  id v14 = v13;
  if (v12)
  {
    id v14 = v13;

    id v100 = 0;
    char v15 = [a1 _deserializeValue:&v100 forKey:@"target" encrypted:0 expectClass:objc_opt_class() allowNil:0 errorDescription:&v102];
    id v16 = v100;
    id v17 = v16;
    if (v15)
    {
      id v17 = v16;

      id v99 = 0;
      char v18 = [a1 _deserializeValue:&v99 forKey:@"favoriteRank" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v102];
      id v19 = v99;
      id v20 = v19;
      if (v18)
      {
        id v21 = v19;

        id v98 = 0;
        char v22 = [a1 _deserializeValue:&v98 forKey:@"lastOpenTime" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v102];
        id v23 = v98;
        id v24 = v23;
        if ((v22 & 1) == 0)
        {
          if (v11)
          {
            [v11 setObject:v102 forKeyedSubscript:@"lastOpenTime"];
          }
          else if (a5)
          {
            objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v102);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_45;
        }
        id v94 = v23;

        id v97 = 0;
        char v25 = [a1 _deserializeValue:&v97 forKey:@"finderTags" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v102];
        id v26 = v97;
        uint64_t v27 = v26;
        if ((v25 & 1) == 0)
        {
          if (v11)
          {
            [v11 setObject:v102 forKeyedSubscript:@"finderTags"];
          }
          else if (a5)
          {
            objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v102);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_44;
        }
        id v28 = v26;

        if ([v11 count])
        {
          uint64_t v29 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32430] code:1001 userInfo:v11];
          if (v29)
          {
            v30 = brc_bread_crumbs();
            uint64_t v31 = brc_default_log();
            if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
            {
              v75 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v104 = "-[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:]";
              __int16 v105 = 2080;
              if (!a5) {
                v75 = "(ignored by caller)";
              }
              v106 = v75;
              __int16 v107 = 2112;
              v108 = v29;
              __int16 v109 = 2112;
              v110 = v30;
              _os_log_error_impl(&dword_23FA42000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5) {
            *a5 = v29;
          }

LABEL_44:
LABEL_45:
          uint64_t v32 = 0;
          id v14 = v21;
          goto LABEL_32;
        }
        v92 = v28;
        v93 = v21;
        v88 = [v14 recordID];
        id v34 = [v88 zoneID];
        v35 = [a1 recordID];
        v36 = [v35 zoneID];
        char v85 = [v34 isEqual:v36];

        if ((v85 & 1) == 0)
        {
          v43 = brc_bread_crumbs();
          id v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            v91 = [v14 recordID];
            v76 = [v91 zoneID];
            v87 = [a1 recordID];
            v77 = [v87 zoneID];
            *(_DWORD *)buf = 138412802;
            v104 = v76;
            __int16 v105 = 2112;
            v106 = v77;
            __int16 v107 = 2112;
            v108 = v43;
            _os_log_fault_impl(&dword_23FA42000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Aliases parent ref zoneID %@ must be equal to aliases zoneID %@!%@", buf, 0x20u);
          }
          v89 = (void *)MEMORY[0x263F087E8];
          uint64_t v45 = *MEMORY[0x263F32430];
          id v46 = [a1 recordID];
          id v47 = [v46 zoneID];
          v48 = [v14 recordID];
          v49 = [v48 zoneID];
          __int16 v50 = objc_msgSend(v89, "br_errorWithDomain:code:description:", v45, 1005, @"Records zoneID %@ must be equal to parents zoneID %@", v47, v49);

          if (v50)
          {
            v51 = brc_bread_crumbs();
            uint64_t v52 = brc_default_log();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              v78 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v104 = "-[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:]";
              __int16 v105 = 2080;
              if (!a5) {
                v78 = "(ignored by caller)";
              }
              v106 = v78;
              __int16 v107 = 2112;
              v108 = v50;
              __int16 v109 = 2112;
              v110 = v51;
              _os_log_error_impl(&dword_23FA42000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5) {
            *a5 = v50;
          }

          uint64_t v32 = 0;
          goto LABEL_74;
        }
        v81 = objc_opt_new();
        [v81 setType:3];
        v37 = [v17 recordID];
        v38 = [v37 zoneID];

        v39 = [v17 recordID];
        v40 = [v39 recordName];

        v41 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithRecordZoneID:v38];
        v83 = v41;
        if ([v41 isPrivate])
        {
          uint64_t v42 = [v10 getOrReserveLibraryRowIDForLibrary:v41];
        }
        else
        {
          uint64_t v42 = 0;
        }
        v53 = [v17 recordID];
        v82 = (void *)v42;
        v54 = objc_msgSend(v53, "brc_itemIDOfTargetWithLibraryRowID:session:", v42, v10);

        v84 = v40;
        v86 = v38;
        v90 = v54;
        if ([v40 hasPrefix:@"documentContent/"])
        {
          v79 = NSString;
          uint64_t v55 = [v38 zoneName];
          v56 = [v38 ownerName];
          v57 = [v54 itemIDString];
          uint64_t v58 = [v79 stringWithFormat:@"%@:%@/%@", v55, v56, v57];
          v59 = v81;
        }
        else
        {
          v59 = v81;
          if ([v40 hasPrefix:@"documentStructure/"])
          {
            v60 = NSString;
            v61 = [v38 zoneName];
            v56 = [v90 itemIDString];
            uint64_t v62 = [v60 stringWithFormat:@"%@/%@", v61, v56];
            v63 = (void *)v81[8];
            v81[8] = v62;

LABEL_62:
            v65 = [v14 recordID];
            v66 = objc_msgSend(v65, "brc_itemIDWithSession:", v10);
            [v59 setParentID:v66];

            v67 = [[BRFieldCKInfo alloc] initWithRecord:a1];
            [v59 setCkInfo:v67];

            objc_msgSend(v59, "setLastUsedTime:", objc_msgSend(v94, "longLongValue"));
            objc_msgSend(v59, "setFavoriteRank:", objc_msgSend(v93, "longLongValue"));
            if ([v92 length]) {
              v68 = v92;
            }
            else {
              v68 = 0;
            }
            [v59 setFinderTags:v68];
            v69 = [a1 encryptedValues];
            v70 = [v69 objectForKeyedSubscript:@"encryptedBasename"];

            if (v70)
            {
              id v95 = 0;
              id v96 = 0;
              char v71 = [a1 deserializeFilename:&v96 basename:0 bounceno:0 extension:0 userInfo:v11 error:&v95];
              v72 = (char *)v95;
              if ((v71 & 1) == 0)
              {
                brc_bread_crumbs();
                v73 = (char *)objc_claimAutoreleasedReturnValue();
                v74 = brc_default_log();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v104 = v72;
                  __int16 v105 = 2112;
                  v106 = v73;
                  _os_log_impl(&dword_23FA42000, v74, OS_LOG_TYPE_DEFAULT, "[WARNING] can't deserialize filename: %@%@", buf, 0x16u);
                }
              }
              [v59 setLogicalName:v96];
            }
            if (a3) {
              objc_storeStrong(a3, v59);
            }

            uint64_t v32 = 1;
LABEL_74:
            id v14 = v93;
            goto LABEL_32;
          }
          if (![v40 hasPrefix:@"directory/"])
          {
            v61 = brc_bread_crumbs();
            v56 = brc_default_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
              -[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:]();
            }
            goto LABEL_62;
          }
          v80 = NSString;
          uint64_t v55 = [v38 zoneName];
          v56 = [v38 ownerName];
          v57 = [v90 itemIDString];
          uint64_t v58 = [v80 stringWithFormat:@"%@:%@/%@", v55, v56, v57];
        }
        v64 = (void *)v59[8];
        v59[8] = v58;

        v61 = (void *)v55;
        goto LABEL_62;
      }
      if (v11)
      {
        [v11 setObject:v102 forKeyedSubscript:@"favoriteRank"];
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v102);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (v11)
    {
      [v11 setObject:v102 forKeyedSubscript:@"target"];
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v102);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_31;
  }
  if (v11)
  {
    [v11 setObject:v102 forKeyedSubscript:@"parent"];
LABEL_31:
    uint64_t v32 = 0;
    goto LABEL_32;
  }
  if (!a5) {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v102);
  uint64_t v32 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v32;
}

- (void)_deserializeRootSharingOptions:()BRCSerializationAdditions
{
  uint64_t v5 = [a1 share];

  if (!v5)
  {
    uint64_t v11 = 0;
    if (!a3) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [a1 encryptedPublicSharingKey];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [a1 routingKey],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    uint64_t v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[CKRecord(BRCSerializationAdditions) _deserializeRootSharingOptions:]();
    }
  }
  uint64_t v11 = 4;
  if (a3) {
LABEL_8:
  }
    *a3 = v11;
}

- (BOOL)deserializeiWorkSharingOptions:()BRCSerializationAdditions error:
{
  uint64_t v21 = 0;
  id v22 = 0;
  [a1 _deserializeRootSharingOptions:&v21];
  uint64_t v7 = 0;
  if (!a3)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v20 = 0;
  uint64_t v8 = *MEMORY[0x263EFD5A8];
  char v9 = [a1 _deserializeValue:&v20 forKey:*MEMORY[0x263EFD5A8] encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v22];
  id v10 = v20;
  uint64_t v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      [v7 setObject:v22 forKeyedSubscript:v8];
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v11 = 0;
    goto LABEL_22;
  }
  if ([v10 BOOLValue])
  {
    v21 |= 1uLL;
    id v19 = 0;
    uint64_t v12 = *MEMORY[0x263EFD5A0];
    char v13 = [a1 _deserializeValue:&v19 forKey:*MEMORY[0x263EFD5A0] encrypted:0 expectClass:objc_opt_class() allowNil:0 errorDescription:&v22];
    id v14 = v19;
    char v15 = v14;
    if (v13)
    {
      if ([v14 BOOLValue]) {
        v21 |= 2uLL;
      }
      goto LABEL_11;
    }
    if (v7)
    {
      [v7 setObject:v22 forKeyedSubscript:v12];
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_22:
    BOOL v17 = 0;
    char v15 = 0;
    goto LABEL_23;
  }
  char v15 = 0;
LABEL_11:
  uint64_t v16 = [v7 count];
  BOOL v17 = v16 == 0;
  if (a3 && !v16)
  {
    *a3 = v21;
    BOOL v17 = 1;
  }
LABEL_23:

  return v17;
}

- (uint64_t)deserializeStatInfo:()BRCSerializationAdditions serverMetrics:itemID:session:error:
{
  uint64_t v233 = *MEMORY[0x263EF8340];
  uint64_t v12 = a5;
  id v203 = a6;
  char v13 = [v203 serverDB];
  [v13 assertOnQueue];

  id v14 = 0;
  id v224 = 0;
  v196 = a3;
  if (!a3)
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
  }
  char v15 = [a1 recordID];
  uint64_t v16 = [v15 zoneID];
  BOOL v17 = [(id)v16 ownerName];
  uint64_t v18 = *MEMORY[0x263EFD488];
  int v19 = [v17 isEqualToString:*MEMORY[0x263EFD488]];

  id v223 = 0;
  id v20 = [a1 recordID];
  uint64_t v21 = [v20 recordName];
  LOBYTE(v16) = [v21 hasPrefix:@"directory/"];

  char v198 = v16;
  v202 = v12;
  v206 = v14;
  if (v16)
  {
    unsigned int v193 = 0;
  }
  else
  {
    id v22 = a7;
    id v23 = [a1 recordID];
    id v24 = [v23 recordName];
    char v25 = [v24 hasPrefix:@"documentStructure/"];

    if (v25)
    {
      int v26 = 1;
    }
    else
    {
      uint64_t v27 = [a1 recordID];
      id v28 = [v27 recordName];
      char v29 = [v28 hasPrefix:@"finderBookmark/"];

      if (v29)
      {
        int v26 = 6;
      }
      else
      {
        v30 = [a1 recordID];
        uint64_t v31 = [v30 recordName];
        char v32 = [v31 hasPrefix:@"symlink/"];

        if ((v32 & 1) == 0)
        {
          v74 = NSString;
          v75 = [a1 recordID];
          v76 = [a1 recordType];
          v77 = [v74 stringWithFormat:@"invalid record type for record %@: %@", v75, v76];
          id v224 = v77;

          if (v14)
          {
            [v14 setObject:v77 forKeyedSubscript:@"recordType"];
            v200 = 0;
            v201 = 0;
            v204 = 0;
            v205 = 0;
            v56 = 0;
            v49 = 0;
            v51 = 0;
            __int16 v50 = 0;
            id v78 = 0;
            v79 = 0;
            v80 = 0;
            id v22 = 0;
            uint64_t v81 = 0;
            uint64_t v55 = 0;
            goto LABEL_61;
          }
          if (v22)
          {
            objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v77);
            id v90 = (id)objc_claimAutoreleasedReturnValue();
            v200 = 0;
            v201 = 0;
            v204 = 0;
            v205 = 0;
            v91 = v22;
            uint64_t v55 = 0;
            v56 = 0;
            v49 = 0;
            v51 = 0;
            __int16 v50 = 0;
            id v78 = 0;
            v79 = 0;
            v80 = 0;
            id v22 = 0;
            uint64_t v81 = 0;
            void *v91 = v90;
            goto LABEL_61;
          }
          v200 = 0;
          v201 = 0;
          v204 = 0;
          v205 = 0;
          uint64_t v55 = 0;
          v56 = 0;
          v49 = 0;
          goto LABEL_74;
        }
        int v26 = 5;
      }
    }
    unsigned int v193 = v26;
    a7 = v22;
  }
  if ([v12 isDocumentsFolder]) {
    id v223 = (id)*MEMORY[0x263F324D0];
  }
  else {
    [a1 deserializeFilename:&v223 basename:0 bounceno:0 extension:0 userInfo:v14 error:a7];
  }
  id v222 = 0;
  char v33 = [a1 _deserializeValue:&v222 forKey:@"parent" encrypted:0 expectClass:objc_opt_class() allowNil:v19 ^ 1u errorDescription:&v224];
  id v34 = v222;
  if ((v33 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v224 forKeyedSubscript:@"parent"];
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    uint64_t v55 = 0;
    v56 = 0;
    v49 = 0;
    goto LABEL_59;
  }
  v191 = a7;
  id v221 = 0;
  char v35 = [a1 _deserializeValue:&v221 forKey:@"exactBirthtime" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v36 = v221;
  id v37 = v36;
  if ((v35 & 1) == 0)
  {
    if (v14)
    {
      uint64_t v52 = v14;
      v49 = v34;
      id v53 = v224;
      v54 = @"exactBirthtime";
LABEL_29:
      [v52 setObject:v53 forKeyedSubscript:v54];
LABEL_58:

      v200 = 0;
      v201 = 0;
      v204 = 0;
      v205 = 0;
      uint64_t v55 = 0;
      v56 = 0;
LABEL_59:
      v51 = 0;
      __int16 v50 = 0;
      id v78 = 0;
      v79 = 0;
      v80 = 0;
      id v22 = 0;
LABEL_60:
      uint64_t v81 = 0;
      goto LABEL_61;
    }
LABEL_56:
    v49 = v34;
    if (v191)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
      void *v191 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_58;
  }
  if (!v36)
  {
    id v220 = 0;
    char v38 = [a1 _deserializeValue:&v220 forKey:@"birthtime" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
    id v37 = v220;
    if ((v38 & 1) == 0)
    {
      if (v14)
      {
        uint64_t v52 = v14;
        v49 = v34;
        id v53 = v224;
        v54 = @"birthtime";
        goto LABEL_29;
      }
      goto LABEL_56;
    }
  }
  v190 = v34;
  v39 = [a1 recordID];
  v40 = [v39 zoneID];
  v41 = [v40 ownerName];
  int v42 = [v41 isEqualToString:v18];

  if (!v42)
  {
    id v47 = 0;
    id v188 = 0;
    id v189 = 0;
    uint64_t v45 = v190;
    goto LABEL_34;
  }
  id v219 = 0;
  char v43 = [a1 _deserializeValue:&v219 forKey:@"lastOpenTime" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v189 = v219;
  if ((v43 & 1) == 0)
  {
    v83 = v14;
    v49 = v190;
    id v22 = v37;
    if (v83)
    {
      [v83 setObject:v224 forKeyedSubscript:@"lastOpenTime"];
      v84 = v189;
    }
    else
    {
      v84 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    uint64_t v55 = 0;
    v56 = 0;
LABEL_74:
    v51 = 0;
LABEL_83:
    __int16 v50 = 0;
LABEL_84:
    id v78 = 0;
    v79 = 0;
    v80 = 0;
    goto LABEL_60;
  }
  id v218 = 0;
  char v44 = [a1 _deserializeValue:&v218 forKey:@"favoriteRank" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v188 = v218;
  uint64_t v45 = v190;
  if ((v44 & 1) == 0)
  {
    v88 = v14;
    v49 = v190;
    id v22 = v37;
    if (v88)
    {
      [v88 setObject:v224 forKeyedSubscript:@"favoriteRank"];
      v89 = v188;
      v51 = v189;
    }
    else
    {
      v89 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    uint64_t v55 = 0;
    v56 = 0;
    goto LABEL_83;
  }
  id v217 = 0;
  char v46 = [a1 _deserializeValue:&v217 forKey:@"finderTags" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v47 = v217;
  if ((v46 & 1) == 0)
  {
    v48 = v14;
    v49 = v190;
    id v22 = v37;
    if (v48)
    {
      [v48 setObject:v224 forKeyedSubscript:@"finderTags"];
      __int16 v50 = v188;
      v51 = v189;
    }
    else
    {
      __int16 v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    uint64_t v55 = 0;
    v56 = 0;
    goto LABEL_84;
  }
LABEL_34:
  v187 = v47;
  id v216 = 0;
  char v57 = [a1 _deserializeValue:&v216 forKey:@"hiddenExt" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v58 = v216;
  if ((v57 & 1) == 0)
  {
    v82 = v14;
    v49 = v45;
    id v22 = v37;
    if (v82)
    {
      [v82 setObject:v224 forKeyedSubscript:@"hiddenExt"];
      __int16 v50 = v188;
      v51 = v189;
    }
    else
    {
      __int16 v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    uint64_t v55 = 0;
    id v78 = 0;
    v79 = 0;
    v80 = 0;
    goto LABEL_94;
  }
  id v215 = 0;
  char v59 = [a1 _deserializeValue:&v215 forKey:@"xattr" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v60 = v215;
  if ((v59 & 1) == 0)
  {
    v86 = v14;
    v49 = v45;
    id v22 = v37;
    v80 = v58;
    if (v86)
    {
      id v87 = v60;
      [v86 setObject:v224 forKeyedSubscript:@"xattr"];
      id v60 = v87;
      __int16 v50 = v188;
      v51 = v189;
    }
    else
    {
      __int16 v50 = v188;
      v51 = v189;
      if (v191)
      {
        id v94 = v60;
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
        id v60 = v94;
      }
    }

    v201 = 0;
    v204 = 0;
    goto LABEL_91;
  }
  v204 = v60;
  id v214 = 0;
  char v61 = [a1 _deserializeValue:&v214 forKey:@"xattrSignature" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v62 = v214;
  if ((v61 & 1) == 0)
  {
    v92 = v14;
    v49 = v45;
    id v22 = v37;
    v80 = v58;
    if (v92)
    {
      id v93 = v62;
      [v92 setObject:v224 forKeyedSubscript:@"xattrSignature"];
      id v62 = v93;
      __int16 v50 = v188;
      v51 = v189;
    }
    else
    {
      __int16 v50 = v188;
      v51 = v189;
      if (v191)
      {
        id v96 = v62;
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
        id v62 = v96;
      }
    }

    v201 = 0;
LABEL_91:
    v205 = 0;
LABEL_92:
    uint64_t v55 = 0;
LABEL_93:
    v200 = 0;
    id v78 = 0;
    v79 = 0;
LABEL_94:
    uint64_t v81 = 0;
    v56 = v187;
    goto LABEL_61;
  }
  v205 = v62;
  id v213 = 0;
  char v63 = [a1 _deserializeValue:&v213 forKey:@"restorePath" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v64 = v213;
  v65 = v64;
  if ((v63 & 1) == 0)
  {
    id v95 = v14;
    v49 = v45;
    id v22 = v37;
    v80 = v58;
    if (v95)
    {
      [v95 setObject:v224 forKeyedSubscript:@"restorePath"];
      __int16 v50 = v188;
      v51 = v189;
    }
    else
    {
      __int16 v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v201 = 0;
    goto LABEL_92;
  }
  v186 = v64;
  id v212 = 0;
  char v66 = [a1 _deserializeValue:&v212 forKey:@"restoreParent" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v67 = v212;
  if ((v66 & 1) == 0)
  {
    id v22 = v37;
    v80 = v58;
    if (v14)
    {
      id v97 = v67;
      [v14 setObject:v224 forKeyedSubscript:@"restoreParent"];
      id v67 = v97;
      v51 = v189;
      v49 = v190;
      __int16 v50 = v188;
      uint64_t v55 = v186;
    }
    else
    {
      v51 = v189;
      v49 = v190;
      __int16 v50 = v188;
      uint64_t v55 = v186;
      if (v191)
      {
        id v98 = v67;
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
        id v67 = v98;
      }
    }

    v201 = 0;
    goto LABEL_93;
  }
  v200 = v67;
  v185 = v58;
  id v211 = 0;
  char v68 = [a1 _deserializeValue:&v211 forKey:@"countMetrics" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v69 = v211;
  if ((v68 & 1) == 0)
  {
    id v22 = v37;
    if (v14)
    {
      [v14 setObject:v224 forKeyedSubscript:@"countMetrics"];
      v51 = v189;
      v49 = v190;
      __int16 v50 = v188;
      uint64_t v55 = v186;
    }
    else
    {
      v51 = v189;
      v49 = v190;
      __int16 v50 = v188;
      uint64_t v55 = v186;
      if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v201 = 0;
    id v78 = 0;
    v79 = 0;
    uint64_t v81 = 0;
    v56 = v187;
    v80 = v185;
    goto LABEL_61;
  }
  uint64_t v70 = (uint64_t)v205;
  if (!v205 && v204)
  {
    uint64_t v70 = [v204 signature];
  }
  v205 = (void *)v70;
  v201 = v69;
  if (!v37)
  {
    v72 = brc_bread_crumbs();
    v73 = brc_default_log();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      -[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:]();
    }
    goto LABEL_110;
  }
  char v71 = v190;
  if (BRCIsBusyDate([v37 longLongValue]))
  {
    v72 = brc_bread_crumbs();
    v73 = brc_default_log();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v226 = v202;
      __int16 v227 = 2112;
      uint64_t v228 = (uint64_t)v72;
      _os_log_impl(&dword_23FA42000, v73, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring Finder busy date on %@%@", buf, 0x16u);
    }
LABEL_110:

    id v99 = NSNumber;
    id v100 = [a1 creationDate];
    [v100 timeIntervalSince1970];
    if (!(unint64_t)v101) {
      time(0);
    }
    uint64_t v102 = objc_msgSend(v99, "numberWithUnsignedLongLong:");

    id v37 = (id)v102;
    char v71 = v190;
  }
  if (v198)
  {
    id v78 = 0;
    id v103 = 0;
    goto LABEL_115;
  }
  id v210 = 0;
  char v107 = [a1 _deserializeValue:&v210 forKey:@"writable" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
  id v103 = v210;
  if (v107)
  {
    id v209 = 0;
    char v108 = [a1 _deserializeValue:&v209 forKey:@"executable" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
    id v78 = v209;
    if ((v108 & 1) == 0)
    {
      id v184 = v103;
      id v22 = v37;
      if (v14)
      {
        [v14 setObject:v224 forKeyedSubscript:@"executable"];
        v51 = v189;
        v49 = v190;
        __int16 v50 = v188;
        uint64_t v55 = v186;
      }
      else
      {
        v51 = v189;
        v49 = v190;
        __int16 v50 = v188;
        uint64_t v55 = v186;
        if (v191)
        {
          objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
          void *v191 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      id v78 = 0;
      uint64_t v81 = 0;
      goto LABEL_176;
    }
    char v71 = v190;
LABEL_115:
    uint64_t v55 = v186;
    id v199 = v78;
    if ([v14 count])
    {
      v79 = v103;
      v104 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32430] code:1001 userInfo:v14];
      if (v104)
      {
        __int16 v105 = brc_bread_crumbs();
        v106 = brc_default_log();
        if (os_log_type_enabled(v106, (os_log_type_t)0x90u))
        {
          v175 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v226 = "-[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:]";
          __int16 v227 = 2080;
          if (!v191) {
            v175 = "(ignored by caller)";
          }
          uint64_t v228 = (uint64_t)v175;
          __int16 v229 = 2112;
          v230 = v104;
          __int16 v231 = 2112;
          v232 = v105;
          _os_log_error_impl(&dword_23FA42000, v106, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      v49 = v71;
      id v22 = v37;
      if (v191) {
        void *v191 = v104;
      }

      uint64_t v81 = 0;
      __int16 v50 = v188;
      v51 = v189;
      v56 = v187;
      v80 = v185;
      goto LABEL_61;
    }
    id v184 = v103;
    if (!v71) {
      goto LABEL_132;
    }
    __int16 v109 = [v71 recordID];
    v110 = [v109 zoneID];
    uint64_t v111 = [a1 recordID];
    v112 = [v111 zoneID];
    char v182 = [v110 isEqual:v112];

    char v71 = v190;
    id v78 = v199;

    if (v182)
    {
LABEL_132:
      v183 = objc_opt_new();
      [v183 setType:v193];
      if ((v193 | 4) == 4)
      {
        uint64_t v113 = 3;
      }
      else
      {
        unsigned int v126 = [v103 BOOLValue];
        if ([v78 BOOLValue]) {
          int v127 = 2;
        }
        else {
          int v127 = 0;
        }
        uint64_t v113 = v127 | v126;
        char v71 = v190;
      }
      [v183 setMode:v113];
      [v183 setLogicalName:v223];
      if (v71)
      {
        if ([v202 isDocumentsFolder])
        {
          v128 = [BRCItemID alloc];
          v129 = [v202 appLibraryRowID];
          uint64_t v130 = [(BRCItemID *)v128 _initAsLibraryRootWithAppLibraryRowID:v129];
        }
        else
        {
          v129 = [v71 recordID];
          uint64_t v130 = objc_msgSend(v129, "brc_itemIDWithSession:", v203);
        }
        v134 = (void *)v130;
        v138 = v183;
        [v183 setParentID:v130];
      }
      else
      {
        id v131 = objc_alloc(MEMORY[0x263F325E0]);
        v132 = [a1 recordID];
        v133 = [v132 zoneID];
        v129 = (void *)[v131 initWithRecordZoneID:v133];

        v134 = [v203 sharedClientZoneByMangledID:v129];
        v135 = [BRCItemID alloc];
        v136 = [v134 dbRowID];
        id v137 = [(BRCItemID *)v135 _initAsZoneRootWithZoneRowID:v136];
        v138 = v183;
        [v183 setParentID:v137];
      }
      objc_msgSend(v138, "setBirthtime:", objc_msgSend(v37, "longLongValue"));
      objc_msgSend(v138, "setLastUsedTime:", objc_msgSend(v189, "longLongValue"));
      objc_msgSend(v138, "setFavoriteRank:", objc_msgSend(v188, "longLongValue"));
      objc_msgSend(v138, "setHiddenExt:", objc_msgSend(v185, "BOOLValue"));
      v181 = v37;
      if ([v187 length])
      {
        [v138 setFinderTags:v187];
        goto LABEL_163;
      }
      id v208 = 0;
      char v139 = [a1 _deserializeValue:&v208 forKey:@"ftags" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v224];
      id v140 = v208;
      v141 = v140;
      if (v139)
      {
        if ([v140 length]) {
          [v183 setFinderTags:v141];
        }

        v138 = v183;
LABEL_163:
        v142 = [[BRFieldCKInfo alloc] initWithRecord:a1];
        [v138 setCkInfo:v142];

        [v138 setXattrSignature:v205];
        v143 = [v204 fileURL];

        if (v143)
        {
          v144 = [v203 stageRegistry];
          v145 = [v204 fileURL];
          v146 = [v204 signature];
          [v144 saveXattrAtURL:v145 forSignature:v146 error:0];
        }
        if ([v186 length])
        {
          v147 = (void *)[[NSString alloc] initWithData:v186 encoding:4];
          [v138 setTrashPutBackPath:v147];
        }
        else
        {
          [v138 setTrashPutBackPath:0];
        }
        v148 = [v200 recordID];
        v149 = objc_msgSend(v148, "brc_itemIDWithSession:", v203);
        [v138 setTrashPutBackParentID:v149];

        v150 = [a1 creatorUserRecordID];
        uint64_t v151 = [v150 recordName];

        v152 = [v203 cachedCurrentUserRecordName];
        id v207 = 0;
        v153 = a1;
        v154 = (void *)v151;
        v155 = objc_msgSend(v153, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v152, &v207);
        id v194 = v207;

        v192 = v155;
        if (([v155 isEqualToString:v154] & 1) == 0)
        {

          id v194 = 0;
        }
        v156 = v196;
        id v78 = v199;
        v157 = v201;
        v158 = [v203 createUserKeyForOwnerName:v154];
        [v138 setCreatorRowID:v158];

        if (!v194) {
          goto LABEL_188;
        }
        v159 = [v203 serverDB];
        v160 = +[BRCAccountSessionFPFS userIdentityForName:v154 db:v159];
        v161 = v160;
        if (v160) {
          v162 = v160;
        }
        else {
          v162 = objc_alloc_init(BRFieldUserIdentity);
        }
        v163 = v162;

        uint64_t v164 = [(BRFieldUserIdentity *)v163 nameComponents];
        v165 = v163;
        if (v164)
        {
          v166 = (void *)v164;
          v167 = [(BRFieldUserIdentity *)v163 nameComponents];
          if ((objc_msgSend(v167, "br_shouldOverwriteExistingName") & 1) == 0)
          {

            v165 = v163;
            v156 = v196;
            goto LABEL_186;
          }
          char v168 = objc_msgSend(v194, "br_shouldOverwriteExistingName");

          v165 = v163;
          v156 = v196;
          if (v168)
          {
LABEL_187:

            v157 = v201;
LABEL_188:
            id v169 = objc_alloc_init(MEMORY[0x263F32638]);
            if ((unint64_t)[v157 count] >= 4)
            {
              v170 = [v157 objectAtIndexedSubscript:0];
              [v169 setQuotaUsed:v170];

              v171 = [v157 objectAtIndexedSubscript:1];
              [v169 setRecursiveChildCount:v171];

              v172 = [v157 objectAtIndexedSubscript:2];
              [v169 setSharedByMeRecursiveCount:v172];

              v173 = [v157 objectAtIndexedSubscript:3];
              [v169 setSharedAliasRecursiveCount:v173];
            }
            v141 = v154;
            if ((unint64_t)[v157 count] >= 5)
            {
              v174 = [v157 objectAtIndexedSubscript:4];
              [v169 setChildCount:v174];
            }
            uint64_t v55 = v186;
            if (v156) {
              objc_storeStrong(v156, v138);
            }
            if (a4) {
              objc_storeStrong(a4, v169);
            }

            uint64_t v81 = 1;
            goto LABEL_197;
          }
        }
        [(BRFieldUserIdentity *)v165 setNameComponents:v194];
        v166 = [v203 serverDB];
        [v166 execute:@"UPDATE users SET user_plist = %@ WHERE user_name = %@", v165, v154];
LABEL_186:

        goto LABEL_187;
      }
      if (v14)
      {
        [v14 setObject:v224 forKeyedSubscript:@"ftags"];
      }
      else if (v191)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
        uint64_t v81 = 0;
        void *v191 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_203;
      }
      uint64_t v81 = 0;
LABEL_203:
      uint64_t v55 = v186;
      v138 = v183;
LABEL_197:

      __int16 v50 = v188;
      v51 = v189;
      v56 = v187;
      v79 = v184;
      v80 = v185;
      id v22 = v181;
      v49 = v190;
      goto LABEL_61;
    }
    v114 = v190;
    v115 = brc_bread_crumbs();
    v116 = brc_default_log();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
    {
      v197 = [a1 recordType];
      v176 = [v190 recordID];
      uint64_t v177 = [v176 zoneID];
      v195 = [a1 recordID];
      v178 = [v195 zoneID];
      *(_DWORD *)buf = 138413058;
      v226 = v197;
      __int16 v227 = 2112;
      uint64_t v228 = v177;
      v179 = (void *)v177;
      __int16 v229 = 2112;
      v230 = v178;
      __int16 v231 = 2112;
      v232 = v115;
      _os_log_fault_impl(&dword_23FA42000, v116, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ parent ref zoneID %@ must be equal to record's zoneID %@!%@", buf, 0x2Au);

      v114 = v190;
    }

    v117 = (void *)MEMORY[0x263F087E8];
    uint64_t v118 = *MEMORY[0x263F32430];
    v119 = [a1 recordID];
    v120 = [v119 zoneID];
    v121 = [v114 recordID];
    v122 = [v121 zoneID];
    v123 = objc_msgSend(v117, "br_errorWithDomain:code:description:", v118, 1005, @"Records zoneID %@ must be equal to parents zoneID %@", v120, v122);

    uint64_t v55 = v186;
    if (v123)
    {
      v124 = brc_bread_crumbs();
      v125 = brc_default_log();
      if (os_log_type_enabled(v125, (os_log_type_t)0x90u))
      {
        v180 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v226 = "-[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:]";
        __int16 v227 = 2080;
        if (!v191) {
          v180 = "(ignored by caller)";
        }
        uint64_t v228 = (uint64_t)v180;
        __int16 v229 = 2112;
        v230 = v123;
        __int16 v231 = 2112;
        v232 = v124;
        _os_log_error_impl(&dword_23FA42000, v125, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    id v22 = v37;
    if (v191) {
      void *v191 = v123;
    }

    uint64_t v81 = 0;
    v51 = v189;
    v49 = v190;
    __int16 v50 = v188;
LABEL_176:
    v56 = v187;
    v79 = v184;
    v80 = v185;
    goto LABEL_61;
  }
  id v22 = v37;
  if (v14)
  {
    [v14 setObject:v224 forKeyedSubscript:@"writable"];
    __int16 v50 = v188;
    uint64_t v55 = v186;
  }
  else
  {
    __int16 v50 = v188;
    uint64_t v55 = v186;
    if (v191)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v224);
      void *v191 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  id v78 = 0;
  v79 = 0;
  uint64_t v81 = 0;
  v56 = v187;
  v80 = v185;
  v51 = v189;
  v49 = v190;
LABEL_61:

  return v81;
}

- (uint64_t)deserializeSymlinkTarget:()BRCSerializationAdditions error:
{
  id v14 = 0;
  id v15 = 0;
  uint64_t v6 = [a1 _deserializeValue:&v14 forKey:@"targetPath" encrypted:1 expectClass:objc_opt_class() allowNil:0 errorDescription:&v15];
  id v7 = v14;
  uint64_t v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v8;
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  if (a3)
  {
    if (v7)
    {
      char v9 = (objc_class *)NSString;
      id v10 = v7;
      uint64_t v11 = [[v9 alloc] initWithData:v10 encoding:4];
      uint64_t v12 = *a3;
      *a3 = (void *)v11;

      uint64_t v8 = v10;
    }
    else
    {
      id v10 = *a3;
      *a3 = 0;
    }
LABEL_9:
  }
  return v6;
}

- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:error:
{
  return [a1 deserializeVersion:a3 fakeStatInfo:a4 contentBoundaryKey:a5 clientZone:a6 outOfBandUpload:0 error:a7];
}

- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:
{
  uint64_t v205 = *MEMORY[0x263EF8340];
  id v176 = a6;
  uint64_t v177 = [v176 session];
  id v14 = 0;
  id v194 = 0;
  if (!a3)
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v192 = 0;
  unsigned int v193 = 0;
  id v190 = 0;
  id v191 = 0;
  [a1 deserializeFilename:&v193 basename:&v192 bounceno:&v190 extension:&v191 userInfo:v14 error:a8];
  id v189 = 0;
  char v15 = [a1 _deserializeValue:&v189 forKey:@"exactSize" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v16 = v189;
  id v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v194 forKeyedSubscript:@"exactSize"];
      v30 = 0;
      uint64_t v31 = 0;
      a8 = 0;
    }
    else
    {
      if (a8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        v30 = 0;
        uint64_t v31 = 0;
        char v32 = 0;
        char v33 = 0;
        id v34 = 0;
        char v35 = 0;
        uint64_t v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
        goto LABEL_22;
      }
      v30 = 0;
      uint64_t v31 = 0;
    }
    char v32 = 0;
    char v33 = 0;
    id v34 = 0;
    char v35 = 0;
    uint64_t v36 = 0;
LABEL_22:
    id v20 = v17;
    char v38 = 0;
    goto LABEL_23;
  }
  v174 = v16;
  if (!v16)
  {
    id v188 = 0;
    char v18 = [a1 _deserializeValue:&v188 forKey:@"size" encrypted:0 expectClass:objc_opt_class() allowNil:a7 errorDescription:&v194];
    id v19 = v188;
    id v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (v14)
      {
        id v40 = v19;
        [v14 setObject:v194 forKeyedSubscript:@"size"];
        id v20 = v40;
        v30 = 0;
        uint64_t v31 = 0;
        a8 = 0;
      }
      else
      {
        if (a8)
        {
          id v57 = v19;
          objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          id v20 = v57;
          v30 = 0;
          uint64_t v31 = 0;
          char v32 = 0;
          char v38 = 0;
          char v33 = 0;
          id v34 = 0;
          char v35 = 0;
LABEL_68:
          uint64_t v36 = 0;
          *a8 = v58;
          goto LABEL_69;
        }
        v30 = 0;
        uint64_t v31 = 0;
      }
      char v32 = 0;
      char v38 = 0;
      char v33 = 0;
      id v34 = 0;
      char v35 = 0;
LABEL_27:
      uint64_t v36 = 0;
      goto LABEL_23;
    }
    v174 = v19;
  }
  id v187 = 0;
  char v21 = [a1 _deserializeValue:&v187 forKey:@"exactMtime" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v22 = v187;
  if ((v21 & 1) == 0)
  {
    id v37 = v22;
    if (!v14)
    {
      char v35 = v174;
      if (a8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        v30 = 0;
        uint64_t v31 = 0;
        char v32 = 0;
        char v38 = 0;
        char v33 = 0;
        uint64_t v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
      }
      else
      {
        v30 = 0;
        uint64_t v31 = 0;
        char v32 = 0;
        char v38 = 0;
        char v33 = 0;
        uint64_t v36 = 0;
      }
      id v20 = v37;
      id v34 = 0;
      goto LABEL_23;
    }
    [v14 setObject:v194 forKeyedSubscript:@"exactMtime"];
    v30 = 0;
    uint64_t v31 = 0;
    a8 = 0;
    char v32 = 0;
    char v38 = 0;
    char v33 = 0;
    uint64_t v36 = 0;
    id v20 = v37;
    id v34 = 0;
LABEL_19:
    char v35 = v174;
    goto LABEL_23;
  }
  id v170 = v22;
  if (!v22)
  {
    id v186 = 0;
    char v23 = [a1 _deserializeValue:&v186 forKey:@"mtime" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
    id v24 = v186;
    id v20 = v24;
    if (v23)
    {
      id v170 = v24;
      goto LABEL_11;
    }
    if (v14)
    {
      id v56 = v24;
      [v14 setObject:v194 forKeyedSubscript:@"mtime"];
      id v20 = v56;
      v30 = 0;
      uint64_t v31 = 0;
      a8 = 0;
      char v32 = 0;
      char v38 = 0;
      char v33 = 0;
      id v34 = 0;
LABEL_52:
      uint64_t v36 = 0;
      goto LABEL_19;
    }
    char v35 = v174;
    if (a8)
    {
      id v61 = v24;
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = v61;
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      char v33 = 0;
      id v34 = 0;
      goto LABEL_68;
    }
    v30 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    char v38 = 0;
    char v33 = 0;
    id v34 = 0;
    goto LABEL_27;
  }
LABEL_11:
  v167 = a4;
  char v25 = [a1 recordID];
  int v26 = [v25 recordName];
  int v27 = [v26 hasPrefix:@"finderBookmark/"];

  if (v27)
  {
    id v185 = 0;
    char v28 = [a1 _deserializeValue:&v185 forKey:@"bookmarkContent" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
    id v29 = v185;
    id v20 = v29;
    if (v28)
    {
      id v168 = 0;
      id v169 = v29;
      v166 = 0;
      goto LABEL_32;
    }
    if (v14)
    {
      id v55 = v29;
      [v14 setObject:v194 forKeyedSubscript:@"bookmarkContent"];
      id v20 = v55;
      v30 = 0;
      uint64_t v31 = 0;
      a8 = 0;
      char v32 = 0;
      char v38 = 0;
      char v33 = 0;
      uint64_t v36 = 0;
      goto LABEL_61;
    }
    id v34 = v170;
    if (a8)
    {
      id v59 = v29;
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = v59;
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      char v33 = 0;
      uint64_t v36 = 0;
      *a8 = v60;
      a8 = 0;
      goto LABEL_19;
    }
    v30 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    char v38 = 0;
    char v33 = 0;
    goto LABEL_52;
  }
  id v184 = 0;
  int v41 = [a1 _deserializeValue:&v184 forKey:@"fileContent" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v169 = v184;
  if ((v41 & 1) == 0)
  {
    if (!v14)
    {
      id v34 = v170;
      char v35 = v174;
      if (a8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        v30 = 0;
        uint64_t v31 = 0;
        char v32 = 0;
        char v38 = 0;
        uint64_t v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
      }
      else
      {
        v30 = 0;
        uint64_t v31 = 0;
        char v32 = 0;
        char v38 = 0;
        uint64_t v36 = 0;
      }
      id v20 = v169;
      char v33 = 0;
      goto LABEL_23;
    }
    [v14 setObject:v194 forKeyedSubscript:@"fileContent"];
    v30 = 0;
    uint64_t v31 = 0;
    a8 = 0;
    char v32 = 0;
    char v38 = 0;
    uint64_t v36 = 0;
    id v20 = v169;
    char v33 = 0;
LABEL_61:
    id v34 = v170;
    char v35 = v174;
    goto LABEL_23;
  }
  id v183 = 0;
  char v42 = [a1 _deserializeValue:&v183 forKey:@"pkgSignature" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v168 = v183;
  if ((v42 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v194 forKeyedSubscript:@"pkgSignature"];
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      uint64_t v36 = 0;
      id v20 = v168;
      char v33 = v169;
      a8 = 0;
      goto LABEL_61;
    }
    id v34 = v170;
    char v35 = v174;
    char v33 = v169;
    if (!a8)
    {
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      uint64_t v36 = 0;
      id v20 = v168;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
    v30 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    char v38 = 0;
    uint64_t v36 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = v168;
LABEL_69:
    a8 = 0;
    goto LABEL_23;
  }
  id v182 = 0;
  char v43 = [a1 _deserializeValue:&v182 forKey:@"thumb1024" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v44 = v182;
  id v20 = v44;
  if ((v43 & 1) == 0)
  {
    if (v14)
    {
      id v63 = v44;
      [v14 setObject:v194 forKeyedSubscript:@"thumb1024"];
      id v20 = v63;
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      uint64_t v36 = 0;
      id v34 = v170;
      char v35 = v174;
      a8 = v168;
      char v33 = v169;
      goto LABEL_23;
    }
    char v33 = v169;
    id v34 = v170;
    if (a8)
    {
      id v67 = v44;
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = v67;
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      uint64_t v36 = 0;
      *a8 = v68;
    }
    else
    {
      v30 = 0;
      uint64_t v31 = 0;
      char v32 = 0;
      char v38 = 0;
      uint64_t v36 = 0;
    }
LABEL_92:
    a8 = v168;
    goto LABEL_19;
  }
  v166 = v44;
LABEL_32:
  id v181 = 0;
  char v45 = [a1 _deserializeValue:&v181 forKey:@"xattr" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v46 = v181;
  if ((v45 & 1) == 0)
  {
    if (v14)
    {
      [v14 setObject:v194 forKeyedSubscript:@"xattr"];
      v30 = 0;
      uint64_t v31 = 0;
      uint64_t v36 = 0;
      id v20 = v46;
      char v32 = 0;
      goto LABEL_73;
    }
    char v33 = v169;
    id v34 = v170;
    char v38 = v166;
    if (a8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
      v30 = 0;
      uint64_t v31 = 0;
      uint64_t v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
      uint64_t v31 = 0;
      uint64_t v36 = 0;
    }
    id v20 = v46;
    char v32 = 0;
    goto LABEL_92;
  }
  id v180 = 0;
  char v47 = [a1 _deserializeValue:&v180 forKey:@"xattrSignature" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v48 = v180;
  if ((v47 & 1) == 0)
  {
    if (!v14)
    {
      char v32 = v46;
      id v34 = v170;
      char v35 = v174;
      char v33 = v169;
      char v38 = v166;
      if (a8)
      {
        id v66 = v48;
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        uint64_t v31 = 0;
        uint64_t v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        id v20 = v66;
      }
      else
      {
        uint64_t v31 = 0;
        uint64_t v36 = 0;
        id v20 = v48;
      }
      v30 = 0;
      a8 = v168;
      goto LABEL_23;
    }
    id v62 = v48;
    [v14 setObject:v194 forKeyedSubscript:@"xattrSignature"];
    uint64_t v31 = 0;
    uint64_t v36 = 0;
    char v32 = v46;
    id v20 = v62;
    v30 = 0;
LABEL_73:
    id v34 = v170;
    char v35 = v174;
    a8 = v168;
    char v33 = v169;
    char v38 = v166;
    goto LABEL_23;
  }
  if (!v48 && v46)
  {
    id v48 = [v46 signature];
  }
  id v165 = v48;
  id v179 = 0;
  char v49 = [a1 _deserializeValue:&v179 forKey:@"boundaryKey" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
  id v50 = v179;
  if (v49)
  {
    v163 = v46;
    id v178 = 0;
    char v51 = [a1 _deserializeValue:&v178 forKey:@"boundaryKeyValidationKey" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v194];
    id v52 = v178;
    id v53 = v52;
    if (v51)
    {
      id v162 = v52;
      if (v50
        && (objc_msgSend(v50, "brc_truncatedSHA256"),
            v54 = objc_claimAutoreleasedReturnValue(),
            char v159 = [v54 isEqualToData:v162],
            v54,
            (v159 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateBogusKey");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v72 = brc_bread_crumbs();
        v73 = brc_default_log();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:]();
        }

        id v74 = objc_alloc(MEMORY[0x263F325E0]);
        v156 = [a1 recordID];
        v75 = [v156 zoneID];
        v160 = (void *)[v74 initWithRecordZoneID:v75];

        v157 = [a1 recordID];
        v76 = [v157 recordName];
        id v77 = +[AppTelemetryTimeSeriesEvent newEDPKeysMismatchForRecordID:v76 mangledID:v160];

        id v78 = [v177 analyticsReporter];
        [v78 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v77];
      }
      else if (!a5)
      {
LABEL_109:
        id v161 = v50;
        id v34 = v170;
        if (!v170)
        {
          brc_bread_crumbs();
          v79 = (char *)objc_claimAutoreleasedReturnValue();
          v80 = brc_default_log();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
          {
            v153 = [a1 recordID];
            objc_msgSend(v153, "brc_itemIDWithSession:", v177);
            id v173 = objc_claimAutoreleasedReturnValue();
            uint64_t v154 = [v173 UTF8String];
            *(_DWORD *)buf = 136315394;
            v196 = (const char *)v154;
            __int16 v197 = 2112;
            char v198 = v79;
            _os_log_fault_impl(&dword_23FA42000, v80, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: The server should have set an mtime for %s%@", buf, 0x16u);
          }
          uint64_t v81 = NSNumber;
          v82 = [a1 modificationDate];
          [v82 timeIntervalSince1970];
          if (!(unint64_t)v83) {
            time(0);
          }
          id v34 = objc_msgSend(v81, "numberWithUnsignedLongLong:");
        }
        if (v169)
        {
          if (v17 || (uint64_t v84 = [v174 unsignedLongLongValue], v84 == objc_msgSend(v169, "size")))
          {
            char v35 = v174;
          }
          else
          {
            v172 = v34;
            char v107 = brc_bread_crumbs();
            char v108 = brc_default_log();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v109 = [a1 recordType];
              v110 = [a1 recordID];
              uint64_t v111 = [v174 longLongValue];
              uint64_t v112 = [v169 size];
              *(_DWORD *)buf = 138413314;
              v196 = v109;
              __int16 v197 = 2112;
              char v198 = v110;
              __int16 v199 = 2048;
              uint64_t v200 = v111;
              __int16 v201 = 2048;
              uint64_t v202 = v112;
              __int16 v203 = 2112;
              v204 = v107;
              _os_log_impl(&dword_23FA42000, v108, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ record %@ has a size inconsistency, %llu != %llu%@", buf, 0x34u);
            }
            char v35 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v169, "size"));

            id v34 = v172;
          }
          if (v168)
          {
            char v85 = NSString;
            v86 = [a1 recordType];
            id v87 = [a1 recordID];
            v88 = [v85 stringWithFormat:@"%@ record %@ is both a file and a package", v86, v87];
            id v89 = v194;
            id v194 = v88;

            if (v14)
            {
              id v90 = v194;
              v91 = @"asset+pkg";
LABEL_143:
              [v14 setObject:v90 forKeyedSubscript:v91];
              uint64_t v36 = 0;
              a8 = v168;
              char v33 = v169;
              char v38 = v166;
              uint64_t v31 = v161;
LABEL_156:
              char v32 = v163;
              v30 = v165;
LABEL_182:
              id v20 = v162;
              goto LABEL_23;
            }
            goto LABEL_144;
          }
        }
        else
        {
          if (!v168)
          {
            uint64_t v102 = NSString;
            id v103 = [a1 recordType];
            v104 = [a1 recordID];
            __int16 v105 = [v102 stringWithFormat:@"%@ record %@ is neither a file nor a package", v103, v104];
            id v106 = v194;
            id v194 = v105;

            char v35 = v174;
            if (v14)
            {
              id v90 = v194;
              v91 = @"pkg+signature";
              goto LABEL_143;
            }
LABEL_144:
            uint64_t v31 = v161;
            char v33 = v169;
            char v38 = v166;
            if (a8)
            {
              objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
              uint64_t v36 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v36 = 0;
            }
            a8 = v168;
            goto LABEL_156;
          }
          char v35 = v174;
        }
        if ([v14 count])
        {
          v92 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32430] code:1001 userInfo:v14];
          if (v92)
          {
            id v93 = brc_bread_crumbs();
            id v94 = brc_default_log();
            if (os_log_type_enabled(v94, (os_log_type_t)0x90u))
            {
              v155 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v196 = "-[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone"
                     ":outOfBandUpload:error:]";
              __int16 v197 = 2080;
              if (!a8) {
                v155 = "(ignored by caller)";
              }
              char v198 = v155;
              __int16 v199 = 2112;
              uint64_t v200 = (uint64_t)v92;
              __int16 v201 = 2112;
              uint64_t v202 = (uint64_t)v93;
              _os_log_error_impl(&dword_23FA42000, v94, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a8) {
            *a8 = v92;
          }
          uint64_t v31 = v161;

          id v95 = brc_bread_crumbs();
          id v96 = brc_default_log();
          if (os_log_type_enabled(v96, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v196 = (const char *)a1;
            __int16 v197 = 2112;
            char v198 = (const char *)v14;
            __int16 v199 = 2112;
            uint64_t v200 = (uint64_t)v95;
            _os_log_error_impl(&dword_23FA42000, v96, (os_log_type_t)0x90u, "[ERROR] failed deserializing version in %@: %@%@", buf, 0x20u);
          }

          uint64_t v36 = 0;
          a8 = v168;
          char v33 = v169;
        }
        else
        {
          id v97 = [a1 modifiedByDevice];

          if (!v97)
          {
            id v98 = brc_bread_crumbs();
            id v99 = brc_default_log();
            if (os_log_type_enabled(v99, (os_log_type_t)0x90u)) {
              -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:]();
            }
          }
          id v100 = objc_opt_new();
          if (objc_msgSend(a1, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v177))
          {
            double v101 = objc_msgSend(a1, "brc_lastEditorDeviceName");
            [v100 setLastEditorDeviceName:v101];
          }
          v171 = v34;
          if (objc_msgSend(v193, "br_nameIsRepresentableOnHFS"))
          {
            [v100 setOriginalPOSIXName:v193];
          }
          else
          {
            id v113 = v192;
            id v114 = v190;
            id v115 = v191;
            v116 = NSString;
            v117 = [v114 stringValue];
            v158 = v115;
            uint64_t v118 = objc_msgSend(v116, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v113, v117, v115, 0);
            [v100 setOriginalPOSIXName:v118];

            v119 = brc_bread_crumbs();
            v120 = brc_default_log();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              v175 = v35;
              id v121 = v114;
              v122 = v100;
              v123 = v193;
              v124 = [v122 originalPOSIXName];
              *(_DWORD *)buf = 138412802;
              v196 = v123;
              id v100 = v122;
              id v114 = v121;
              char v35 = v175;
              __int16 v197 = 2112;
              char v198 = v124;
              __int16 v199 = 2112;
              uint64_t v200 = (uint64_t)v119;
              _os_log_impl(&dword_23FA42000, v120, OS_LOG_TYPE_DEFAULT, "[WARNING] Server gave us an unrepresentable filename: \"%@\" using \"%@\"%@", buf, 0x20u);
            }
            id v34 = v171;
          }
          a8 = v168;
          objc_msgSend(v100, "setSize:", objc_msgSend(v35, "longLongValue"));
          objc_msgSend(v100, "setMtime:", objc_msgSend(v34, "longLongValue"));
          if (v169)
          {
            v125 = [v169 signature];
            [v100 setContentSignature:v125];
          }
          else
          {
            [v100 setContentSignature:v168];
          }
          if (v166)
          {
            unsigned int v126 = [v166 signature];
            [v100 setThumbnailSignature:v126];

            uint64_t v127 = [v166 size];
          }
          else
          {
            [v100 setThumbnailSignature:0];
            uint64_t v127 = 0;
          }
          [v100 setThumbnailSize:v127];
          v128 = [a1 conflictLoserEtags];

          if (v128)
          {
            id v129 = objc_alloc(MEMORY[0x263EFFA08]);
            uint64_t v130 = [a1 conflictLoserEtags];
            id v131 = (void *)[v129 initWithArray:v130];
            [v100 setConflictLoserEtags:v131];

            a8 = v168;
          }
          v132 = [[BRFieldCKInfo alloc] initWithRecord:a1];
          [v100 setCkInfo:v132];

          [v100 setQuarantineInfo:0];
          [v100 setXattrSignature:v165];
          v133 = [v163 fileURL];

          if (v133)
          {
            v134 = [v177 stageRegistry];
            v135 = [v163 fileURL];
            v136 = [v163 signature];
            [v134 saveXattrAtURL:v135 forSignature:v136 error:0];

            a8 = v168;
          }
          if (a3) {
            *a3 = v100;
          }
          if (v167)
          {
            id v137 = objc_alloc_init(BRCStatInfo);
            [(BRCStatInfo *)v137 setType:1];
            -[BRCStatInfo setMode:](v137, "setMode:", [a1 permission] == 1);
            v138 = [v100 originalPOSIXName];
            [(BRCStatInfo *)v137 setLogicalName:v138];

            char v139 = [a1 recordID];
            id v140 = [v139 recordName];
            uint64_t v36 = [v140 hasPrefix:@"documentContent/"];

            if (v36)
            {
              v141 = [BRCItemID alloc];
              v142 = [v176 dbRowID];
              id v143 = [(BRCItemID *)v141 _initAsZoneRootWithZoneRowID:v142];
              [(BRCStatInfo *)v137 setParentID:v143];

              v144 = [a1 creationDate];
              [v144 timeIntervalSince1970];
              unint64_t v146 = (unint64_t)v145;
              if (!(unint64_t)v145) {
                unint64_t v146 = time(0);
              }

              unint64_t v147 = [v171 unsignedLongLongValue];
              if (v146 >= v147) {
                unint64_t v148 = v147;
              }
              else {
                unint64_t v148 = v146;
              }
              [(BRCStatInfo *)v137 setBirthtime:v148];
              v149 = [v100 ckInfo];
              v150 = (void *)[v149 copy];
              [(BRCStatInfo *)v137 setCkInfo:v150];

              [(BRCStatInfo *)v137 setHiddenExt:1];
              void *v167 = v137;
            }
            else
            {
              uint64_t v151 = brc_bread_crumbs();
              v152 = brc_default_log();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT)) {
                -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:]();
              }
            }
            uint64_t v31 = v161;

            char v33 = v169;
            id v34 = v171;
            a8 = v168;
          }
          else
          {
            uint64_t v31 = v161;
            uint64_t v36 = 1;
            char v33 = v169;
            id v34 = v171;
          }
        }
        v30 = v165;
        char v38 = v166;
        char v32 = v163;
        goto LABEL_182;
      }
      *a5 = v50;
      goto LABEL_109;
    }
    if (v14)
    {
      uint64_t v31 = v50;
      id v69 = v52;
      [v14 setObject:v194 forKeyedSubscript:@"boundaryKeyValidationKey"];
      id v53 = v69;
      id v34 = v170;
      char v35 = v174;
      char v33 = v169;
      char v38 = v166;
    }
    else
    {
      id v14 = 0;
      uint64_t v31 = v50;
      id v34 = v170;
      char v35 = v174;
      char v33 = v169;
      char v38 = v166;
      if (a8)
      {
        id v70 = v52;
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        id v71 = (id)objc_claimAutoreleasedReturnValue();
        id v53 = v70;
        *a8 = v71;
      }
    }

    id v20 = 0;
    uint64_t v36 = 0;
    a8 = v168;
    char v32 = v163;
    v30 = v165;
  }
  else
  {
    id v64 = v14;
    v65 = v50;
    uint64_t v164 = v64;
    char v32 = v46;
    if (v64)
    {
      [v64 setObject:v194 forKeyedSubscript:@"boundaryKey"];
      id v34 = v170;
      char v35 = v174;
      char v33 = v169;
      char v38 = v166;
    }
    else
    {
      id v34 = v170;
      char v35 = v174;
      char v33 = v169;
      char v38 = v166;
      if (a8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v194);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    id v20 = 0;
    uint64_t v31 = 0;
    uint64_t v36 = 0;
    a8 = v168;
    id v14 = v164;
    v30 = v165;
  }
LABEL_23:

  return v36;
}

- (uint64_t)deserializeSideCarInfo:()BRCSerializationAdditions error:
{
  id v7 = objc_alloc_init(BRCSideCarInfo);
  id v21 = 0;
  id v22 = 0;
  char v8 = [a1 _deserializeValue:&v21 forKey:@"lastOpenTime" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v22];
  id v9 = v21;
  if (v8)
  {
    id v20 = 0;
    char v10 = [a1 _deserializeValue:&v20 forKey:@"favoriteRank" encrypted:0 expectClass:objc_opt_class() allowNil:1 errorDescription:&v22];
    id v11 = v20;
    if (v10)
    {
      id v19 = 0;
      char v12 = [a1 _deserializeValue:&v19 forKey:@"finderTags" encrypted:1 expectClass:objc_opt_class() allowNil:1 errorDescription:&v22];
      id v13 = v19;
      if (v12)
      {
        id v14 = [[BRFieldCKInfo alloc] initWithRecord:a1];
        [(BRCSideCarInfo *)v7 setCkInfo:v14];

        -[BRCSideCarInfo setFavoriteRank:](v7, "setFavoriteRank:", [v11 longLongValue]);
        -[BRCSideCarInfo setLastUsedTime:](v7, "setLastUsedTime:", [v9 longLongValue]);
        [(BRCSideCarInfo *)v7 setFinderTags:v13];
        char v15 = v7;
        id v16 = *a3;
        *a3 = v15;
        uint64_t v17 = 1;
      }
      else
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v22);
          uint64_t v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v17 = 0;
        }
        id v16 = v13;
        id v13 = 0;
      }
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v22);
        id v13 = 0;
        uint64_t v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = 0;
        uint64_t v17 = 0;
      }
      id v16 = v11;
      id v11 = 0;
    }
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1001, @"%@", v22);
      id v11 = 0;
      id v13 = 0;
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
      id v13 = 0;
      uint64_t v17 = 0;
    }
    id v16 = v9;
    id v9 = 0;
  }

  return v17;
}

- (uint64_t)_locateSideCarServerZone:()BRCSerializationAdditions withShareAliasReference:withSession:
{
  id v8 = a5;
  id v9 = [a4 recordID];
  char v10 = objc_msgSend(v9, "brc_itemIDWithSession:error:", v8, 0);
  if (v10)
  {
    id v11 = [v8 serverDB];
    char v12 = (void *)[v11 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@", v10];

    if ([v12 next])
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __100__CKRecord_BRCSerializationAdditions___locateSideCarServerZone_withShareAliasReference_withSession___block_invoke;
      v23[3] = &unk_26507F1E8;
      id v24 = v8;
      id v13 = [v12 object:v23];
      if (([v13 isBRAlias] & 1) == 0)
      {
        id v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) _locateSideCarServerZone:withShareAliasReference:withSession:]();
        }
      }
      id v14 = [v13 aliasTargetClientZone];
      char v15 = [v14 serverZone];
      uint64_t v16 = [v15 asSharedZone];

      uint64_t v17 = *a3;
      *a3 = (void *)v16;

      [v12 close];
      uint64_t v18 = v16 != 0;
    }
    else
    {
      id v19 = [a1 recordID];
      uint64_t v18 = [v19 locateSideCarServerZone:a3 withSession:v8];
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (uint64_t)locateSideCarServerZone:()BRCSerializationAdditions shareRecordName:withSession:
{
  id v8 = a5;
  id v24 = 0;
  id v25 = 0;
  int v9 = [a1 _deserializeValue:&v24 forKey:@"shareReference" encrypted:0 expectClass:objc_opt_class() allowNil:0 errorDescription:&v25];
  id v10 = v24;
  id v11 = v10;
  uint64_t v12 = 0;
  if (v9)
  {
    id v13 = [v10 recordID];
    uint64_t v14 = [v13 recordName];
    char v15 = *a4;
    *a4 = (void *)v14;

    uint64_t v16 = [v13 recordName];
    int v17 = [v16 hasPrefix:@"shareAlias/"];

    if (v17)
    {
      uint64_t v12 = [a1 _locateSideCarServerZone:a3 withShareAliasReference:v11 withSession:v8];
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x263F325E0]);
      id v19 = [v13 zoneID];
      id v20 = (void *)[v18 initWithRecordZoneID:v19];

      id v21 = [v8 serverZoneByMangledID:v20];
      id v22 = [v21 asSharedZone];

      uint64_t v12 = v22 != 0;
      if (v22) {
        objc_storeStrong(a3, v22);
      }
    }
  }

  return v12;
}

- (uint64_t)serializeSystemFields:()BRCSerializationAdditions
{
  return [a1 serializeSystemFields:a3 includeCZMEtag:1];
}

- (void)serializeSystemFields:()BRCSerializationAdditions includeCZMEtag:
{
  objc_msgSend(a3, "setCKInfoFieldsInRecord:includeCZMEtag:", a1);
  id v4 = objc_alloc(MEMORY[0x263F325E0]);
  uint64_t v5 = [a1 recordID];
  uint64_t v6 = [v5 zoneID];
  id v9 = (id)[v4 initWithRecordZoneID:v6];

  id v7 = +[BRCUserDefaults defaultsForMangledID:v9];
  if ([v7 useFailIfOutdatedForResets])
  {
    [a1 setKnownToServer:1];
    id v8 = [v7 fakeEtagForFailIfOutdated];
    if (([v8 isEqualToString:@"none"] & 1) == 0) {
      [a1 setEtag:v8];
    }
  }
}

- (void)serializeFinderTags:()BRCSerializationAdditions forCreation:
{
  id v7 = a3;
  if ([v7 length])
  {
    uint64_t v6 = [a1 encryptedValues];
    [v6 setObject:v7 forKeyedSubscript:@"finderTags"];
  }
  else if ((a4 & 1) == 0)
  {
    [a1 setObject:0 forKeyedSubscript:@"finderTags"];
  }
}

- (void)serializeContentBoundaryKey:()BRCSerializationAdditions
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [a1 encryptedValues];
    [v4 setObject:v6 forKeyedSubscript:@"boundaryKey"];

    uint64_t v5 = objc_msgSend(v6, "brc_truncatedSHA256");
    [a1 setObject:v5 forKeyedSubscript:@"boundaryKeyValidationKey"];
  }
}

- (void)seralizeBirthtime:()BRCSerializationAdditions
{
  uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 shouldSendRoundedTimestamps];

  if (v6)
  {
    id v7 = [NSNumber numberWithUnsignedLongLong:BRCRoundedTimestamp(a3)];
    [a1 setObject:v7 forKeyedSubscript:@"birthtime"];
  }
  id v9 = [NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [a1 encryptedValues];
  [v8 setObject:v9 forKeyedSubscript:@"exactBirthtime"];
}

- (void)serializeSpecialIdentityForFilename:()BRCSerializationAdditions parentIDIsCloudDocsRoot:parentIDisDocumentsFolder:
{
  id v9 = a3;
  [a1 setObject:0 forKeyedSubscript:@"specialDirectoryIdentity"];
  if (a4)
  {
    if ([v9 isEqualToString:*MEMORY[0x263F32500]])
    {
      id v8 = &unk_26F3DD1C0;
LABEL_11:
      [a1 setObject:v8 forKeyedSubscript:@"specialDirectoryIdentity"];
      goto LABEL_12;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F32510]])
    {
      id v8 = &unk_26F3DD1D8;
      goto LABEL_11;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F32538]])
    {
LABEL_10:
      id v8 = &unk_26F3DD1F0;
      goto LABEL_11;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F32518]])
    {
      id v8 = &unk_26F3DD208;
      goto LABEL_11;
    }
  }
  else if (a5 && [v9 isEqualToString:*MEMORY[0x263F32538]])
  {
    goto LABEL_10;
  }
LABEL_12:
}

- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  return [a1 serializeFilename:a3 forCreation:a4 setExtension:1 basehashSalt:a5 parentIDIsCloudDocsRoot:a6 parentIDIsDocumentsFolder:a7];
}

- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  LOBYTE(v9) = a8;
  return [a1 serializeFilename:a3 forCreation:a4 setExtension:a5 inSharedAlias:0 basehashSaltIfNotShareAlias:a6 parentIDIsCloudDocsRoot:a7 parentIDIsDocumentsFolder:v9];
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  id v15 = a3;
  id v16 = a7;
  id v46 = 0;
  unint64_t v47 = 0;
  int v17 = objc_msgSend(v15, "br_stringByDeletingPathBounceNo:andPathExtension:", &v47, &v46);
  id v18 = v46;
  if (v17)
  {
    unsigned int v45 = a8;
    id v19 = [v17 dataUsingEncoding:4];
    id v20 = [a1 encryptedValues];
    [v20 setObject:v19 forKeyedSubscript:@"encryptedBasename"];

    if (a6) {
      goto LABEL_23;
    }
    id v21 = +[BRCUserDefaults defaultsForMangledID:0];
    int v22 = [v21 supportsEnhancedDrivePrivacy];

    if (!v22)
    {
      id v34 = objc_msgSend(v17, "brc_SHA256");
      [a1 setObject:v34 forKeyedSubscript:@"basehash"];

      goto LABEL_23;
    }
    if (v16)
    {
      char v23 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateBogusKey");
      int v24 = [v16 isEqualToData:v23];

      if (v24)
      {
        id v25 = [a1 pluginFields];
        if (v25)
        {
          [a1 pluginFields];
          int v26 = v44 = v25;
          int v27 = (void *)[v26 mutableCopy];

          id v25 = v44;
        }
        else
        {
          int v27 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
        }

        [v27 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"br_bougusSaltingKey"];
        [a1 setPluginFields:v27];
      }
      char v38 = objc_msgSend(v17, "brc_SHA256WithSalt:", v16);
      [a1 setObject:v38 forKeyedSubscript:@"basehash"];

      v39 = [a1 recordType];
      int v40 = [v39 isEqualToString:@"structure"];

      if (v40)
      {
        int v41 = objc_msgSend(v16, "brc_truncatedSHA256");
        [a1 setObject:v41 forKeyedSubscript:@"basehashSaltValidationKey"];

        [a1 serializeSpecialIdentityForFilename:v15 parentIDIsCloudDocsRoot:v45 parentIDisDocumentsFolder:a9];
      }
      goto LABEL_23;
    }
    char v35 = objc_msgSend(v17, "brc_SHA256");
    [a1 setObject:v35 forKeyedSubscript:@"basehash"];

    uint64_t v36 = [a1 recordType];
    int v37 = [v36 isEqualToString:@"structure"];

    if (!v37)
    {
LABEL_23:

      if (v47 < 2)
      {
        if ((a4 & 1) == 0) {
          [a1 setObject:0 forKeyedSubscript:@"bounceNo"];
        }
      }
      else
      {
        char v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        [a1 setObject:v42 forKeyedSubscript:@"bounceNo"];
      }
      if (v18) {
        char v43 = 0;
      }
      else {
        char v43 = a4;
      }
      if (a5 && (v43 & 1) == 0) {
        [a1 setObject:v18 forKeyedSubscript:@"extension"];
      }
      goto LABEL_33;
    }
    [a1 setObject:0 forKeyedSubscript:@"basehashSaltValidationKey"];
    id v29 = @"specialDirectoryIdentity";
    char v28 = a1;
LABEL_10:
    [v28 setObject:0 forKeyedSubscript:v29];
    goto LABEL_23;
  }
  if (a6)
  {
    char v28 = [a1 encryptedValues];
    id v19 = v28;
    id v29 = @"encryptedBasename";
    goto LABEL_10;
  }
  v30 = brc_bread_crumbs();
  uint64_t v31 = brc_default_log();
  if (os_log_type_enabled(v31, (os_log_type_t)0x90u)) {
    -[CKRecord(BRCSerializationAdditions) serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:]();
  }

  char v32 = brc_bread_crumbs();
  char v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
    -[CKRecord(BRCSerializationAdditions) serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:]();
  }

LABEL_33:
}

- (BOOL)_verifyValueForRecordWithNumber:()BRCSerializationAdditions key:item:error:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 unsignedLongLongValue];
  if (v13 < 0)
  {
    int v27 = a6;
    int v26 = [v12 session];
    int v24 = [v26 analyticsReporter];
    id v25 = [a1 recordID];
    uint64_t v14 = [v25 recordName];
    id v15 = [v12 clientZone];
    id v16 = [v15 mangledID];
    int v17 = NSNumber;
    [v12 clientZone];
    id v19 = v18 = v11;
    id v20 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v19, "enhancedDrivePrivacyEnabled"));
    [v24 aggregateReportForAppTelemetryIdentifier:41 itemID:v14 zoneMangledID:v16 enhancedDrivePrivacyEnabled:v20 error:0];

    id v11 = v18;
    id v21 = brc_bread_crumbs();
    int v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      char v33 = v21;
      _os_log_fault_impl(&dword_23FA42000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has negative value %@!%@", buf, 0x20u);
    }

    if (v27)
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", v11, v10);
      *int v27 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13 >= 0;
}

- (uint64_t)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v115 = a5;
  v117 = a8;
  v116 = a9;
  id v121 = [v15 st];
  char v114 = a6;
  if (a6)
  {
    BOOL v120 = 1;
  }
  else
  {
    id v16 = [v121 ckInfo];
    int v17 = [v16 etag];
    BOOL v120 = v17 == 0;
  }
  uint64_t v118 = [v121 ckInfo];

  id v18 = [v15 clientZone];
  int v113 = [v18 enhancedDrivePrivacyEnabled];

  id v19 = [v15 clientZone];
  if ([v19 isPrivateZone])
  {
    id v20 = [v15 appLibrary];
    int v21 = [v20 wasMovedToCloudDocs];
  }
  else
  {
    int v21 = 0;
  }

  if (v120)
  {
    if ([v15 isDirectory])
    {
      if (v116)
      {
        int v22 = v116[2]();
        if (v22)
        {
          objc_msgSend(a1, "brc_fillWithChildBasehashSalt:", v22);
          char v23 = [v15 clientZone];
          int v24 = [v15 itemID];
          unsigned int v25 = [v23 saltingStateForItemID:v24];

          if (v25) {
            uint64_t v26 = v25;
          }
          else {
            uint64_t v26 = 3;
          }
          int v27 = [NSNumber numberWithUnsignedInt:v26];
          [a1 setObject:v27 forKeyedSubscript:@"saltingState"];
        }
      }
      else
      {
        char v28 = brc_bread_crumbs();
        id v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:]();
        }
      }
    }
  }
  else if ((a4 & 0x60) == 0 && (a7 & 0x2C) == 0)
  {
    v119 = 0;
    goto LABEL_35;
  }
  if (v21
    && ([v15 itemID],
        __int16 v30 = objc_claimAutoreleasedReturnValue(),
        int v31 = [v30 isDocumentsFolder],
        v30,
        v31))
  {
    __int16 v32 = [v15 clientZone];
    char v33 = [v32 asPrivateClientZone];
    uint64_t v34 = [v33 rootItemID];

    char v35 = [v15 session];
    uint64_t v36 = [v15 itemID];
    int v37 = [v36 appLibraryRowID];
    char v38 = [v35 appLibraryByRowID:v37];
    v39 = [v38 appLibraryID];

    int v40 = [v39 stringByReplacingOccurrencesOfString:@"." withString:@"~"];

    int v41 = [v40 stringByAppendingString:@"_Documents"];
  }
  else
  {
    int v41 = [v121 logicalNameWithoutLocalBounce];
    uint64_t v34 = [v121 parentID];
  }
  char v42 = [v15 appLibrary];
  if ([v42 isCloudDocsAppLibrary])
  {
    char v43 = [v15 clientZone];
    if ([v43 isCloudDocsZone])
    {
      id v44 = [v15 parentItemIDInZone];
      uint64_t v45 = [v44 isNonDesktopRoot];
    }
    else
    {
      uint64_t v45 = 0;
    }
  }
  else
  {
    uint64_t v45 = 0;
  }

  id v46 = [v15 parentItemIDInZone];
  uint64_t v47 = [v46 isDocumentsFolder];

  uint64_t v48 = v117[2](v117, v15);
  [a1 serializeFilename:v41 forCreation:v118 == 0 basehashSalt:v48 parentIDIsCloudDocsRoot:v45 parentIDIsDocumentsFolder:v47];
  char v49 = [v15 serverZone];
  id v50 = [v34 validatingDirectoryReferenceInZone:v49];
  [a1 setObject:v50 forKeyedSubscript:@"parent"];
  v119 = (void *)v48;

  if ((a7 & 0x3C) != 0)
  {
    char v51 = [v15 serverZone];
    id v52 = [v34 pcsChainParentReferenceInZone:v51];
    [a1 setParent:v52];
  }
LABEL_35:
  if (a7 == 2)
  {
LABEL_45:
    [a1 setWantsChainPCS:1];
    goto LABEL_46;
  }
  if ([v15 isDirectory])
  {
    if ((a7 & 0xC) == 0) {
      goto LABEL_46;
    }
  }
  else
  {
    char v53 = [v15 isDocument];
    if ((a7 & 0xC) != 0) {
      char v54 = v53;
    }
    else {
      char v54 = 0;
    }
    if ((v54 & 1) == 0) {
      goto LABEL_46;
    }
  }
  if (v120) {
    goto LABEL_45;
  }
  id v55 = [v15 clientZone];
  id v56 = [v55 asPrivateClientZone];
  id v57 = [v15 itemID];
  BOOL v58 = [v56 pcsChainStateForItem:v57] < 2;

  if (v58) {
    goto LABEL_45;
  }
LABEL_46:
  BOOL v59 = !v120;
  if ((a4 & 0x10) != 0) {
    BOOL v59 = 0;
  }
  if (!v59)
  {
    uint64_t v60 = [v121 birthtime];
    id v61 = [NSNumber numberWithUnsignedLongLong:v60];
    int v62 = [a1 _verifyValueForRecordWithNumber:v61 key:@"birthtime" item:v15 error:0];

    if (v62) {
      uint64_t v63 = v60;
    }
    else {
      uint64_t v63 = 0;
    }
    if (v119)
    {
      id v64 = v119;
    }
    else
    {
      v117[2](v117, v15);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
    }
    v119 = v64;

    if ([v15 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:v119 != 0])
    {
      [a1 seralizeBirthtime:v63];
    }
    else
    {
      v65 = [NSNumber numberWithUnsignedLongLong:v63];
      [a1 setObject:v65 forKeyedSubscript:@"birthtime"];
    }
  }
  if (([v15 isSharedToMe] & 1) == 0)
  {
    if ((a4 & 0x800) != 0 || v120) {
      objc_msgSend(a1, "setLastUsedTime:", objc_msgSend(v121, "lastUsedTime"));
    }
    if ((a4 & 0x1000) != 0 || v120)
    {
      uint64_t v68 = [v121 favoriteRank];
      if (v68)
      {
        id v69 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v121, "favoriteRank"));
      }
      else
      {
        id v69 = 0;
      }
      [a1 setObject:v69 forKeyedSubscript:@"favoriteRank"];
      if (v68) {
    }
      }
    BOOL v70 = !v120;
    if ((a4 & 0x200) != 0) {
      BOOL v70 = 0;
    }
    if (!v70)
    {
      id v71 = [v121 finderTags];
      [a1 serializeFinderTags:v71 forCreation:v118 == 0];
    }
  }
  BOOL v72 = !v120;
  if ((a4 & 0x80) != 0) {
    BOOL v72 = 0;
  }
  if (!v72)
  {
    v73 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v121, "isHiddenExt"));
    [a1 setObject:v73 forKeyedSubscript:@"hiddenExt"];
  }
  if (v118) {
    [a1 setObject:0 forKeyedSubscript:@"ftags"];
  }
  if ((a4 & 4) != 0 || v120)
  {
    unsigned int v75 = [v121 type];
    if (v75 <= 0xA && ((1 << v75) & 0x611) != 0)
    {
      if (v118)
      {
        [a1 setObject:0 forKeyedSubscript:@"writable"];
        [a1 setObject:0 forKeyedSubscript:@"executable"];
      }
    }
    else
    {
      v76 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v121, "mode") & 1);
      [a1 setObject:v76 forKeyedSubscript:@"writable"];

      id v77 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(v121, "mode") >> 1) & 1);
      [a1 setObject:v77 forKeyedSubscript:@"executable"];
    }
  }
  if ((a4 & 0x100) != 0 || v120)
  {
    v79 = [v121 xattrSignature];

    if (v79)
    {
      v80 = [v15 session];
      uint64_t v81 = [v80 stageRegistry];
      v82 = [v121 xattrSignature];
      double v83 = [v81 urlForXattrSignature:v82];

      id v122 = 0;
      LODWORD(v80) = [v83 checkResourceIsReachableAndReturnError:&v122];
      id v84 = v122;
      if (v80)
      {
        if (v113)
        {
          char v85 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateSaltingKey");
        }
        else
        {
          char v85 = 0;
        }
        id v89 = objc_msgSend(MEMORY[0x263EFD5E0], "br_assetWithFileURL:boundaryKey:", v83, v85);
        [a1 setObject:v89 forKeyedSubscript:@"xattr"];
        if (v113)
        {
          id v90 = [v121 xattrSignature];
        }
        else
        {
          id v90 = 0;
        }
        v91 = [a1 encryptedValues];
        [v91 setObject:v90 forKeyedSubscript:@"xattrSignature"];

        if (v113) {
      }
        }
      else
      {
        v86 = brc_bread_crumbs();
        id v87 = brc_default_log();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
        {
          v88 = [v121 xattrSignature];
          -[CKRecord(BRCSerializationAdditions) serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:](v88, (uint64_t)v86, v127, v87);
        }

        [a1 setObject:0 forKeyedSubscript:@"xattr"];
        char v85 = [a1 encryptedValues];
        [v85 setObject:0 forKeyedSubscript:@"xattrSignature"];
      }
    }
    else
    {
      if (!v118) {
        goto LABEL_114;
      }
      [a1 setObject:0 forKeyedSubscript:@"xattr"];
      id v84 = [a1 encryptedValues];
      [v84 setObject:0 forKeyedSubscript:@"xattrSignature"];
    }
  }
LABEL_114:
  BOOL v92 = !v120;
  if ((a4 & 0x400) != 0) {
    BOOL v92 = 0;
  }
  if (!v92)
  {
    id v93 = [v15 st];
    id v94 = [v93 trashPutBackPath];
    id v95 = [v94 dataUsingEncoding:4];

    id v96 = [a1 encryptedValues];
    [v96 setObject:v95 forKeyedSubscript:@"restorePath"];

    id v97 = [v15 st];
    id v98 = [v97 trashPutBackParentID];
    id v99 = [v15 serverZone];
    id v100 = [v98 directoryReferenceInZone:v99 action:0];
    [a1 setObject:v100 forKeyedSubscript:@"restoreParent"];
  }
  if ([v15 isSymLink])
  {
    BOOL v101 = !v120;
    if ((a4 & 0x2000) != 0) {
      BOOL v101 = 0;
    }
    if (!v101)
    {
      uint64_t v102 = [v15 asSymlink];
      id v103 = [v102 symlinkTarget];
      v104 = [v103 dataUsingEncoding:4];

      __int16 v105 = [a1 encryptedValues];
      [v105 setObject:v104 forKeyedSubscript:@"targetPath"];
    }
  }
  id v106 = v119;
  if ((v114 & 1) == 0)
  {
    char v107 = [v121 ckInfo];
    if (!v107)
    {
      if ([v15 isFinderBookmark])
      {
        char v108 = brc_bread_crumbs();
        __int16 v109 = brc_default_log();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v124 = v15;
          __int16 v125 = 2112;
          unsigned int v126 = v108;
          _os_log_impl(&dword_23FA42000, v109, OS_LOG_TYPE_DEFAULT, "[WARNING] Item is missing structure CKInfo so using the version CKInfo because they are the same record %@%@", buf, 0x16u);
        }

        v110 = [v15 asFinderBookmark];
        uint64_t v111 = [v110 currentVersion];
        char v107 = [v111 ckInfo];
      }
      else
      {
        char v107 = 0;
      }
    }
    objc_msgSend(a1, "serializeSystemFields:includeCZMEtag:", v107, objc_msgSend(v15, "isDocumentBeingCopiedToNewZone") ^ 1);

    id v106 = v119;
  }

  return 1;
}

- (uint64_t)_updateSize:()BRCSerializationAdditions mtime:shouldUseEnhancedDrivePrivacy:item:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[BRCUserDefaults defaultsForMangledID:0];
  if (v10 && a5)
  {
    uint64_t v14 = [a1 encryptedValues];
    [v14 setObject:v10 forKeyedSubscript:@"exactSize"];
  }
  if (v11)
  {
    if (([a1 _verifyValueForRecordWithNumber:v11 key:@"mtime" item:v12 error:0] & 1) == 0)
    {

      id v11 = &unk_26F3DD220;
    }
    if (a5)
    {
      id v15 = [a1 encryptedValues];
      [v15 setObject:v11 forKeyedSubscript:@"exactMtime"];

      if ([v13 shouldSendRoundedTimestamps])
      {
        id v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", BRCRoundedTimestamp(objc_msgSend(v11, "unsignedLongLongValue")));
        [a1 setObject:v16 forKeyedSubscript:@"mtime"];
      }
    }
    else
    {
      [a1 setObject:v11 forKeyedSubscript:@"mtime"];
    }
  }

  return 1;
}

- (uint64_t)serializeForContentUpload:()BRCSerializationAdditions size:mtime:etag:shouldUseEnhancedDrivePrivacy:error:
{
  id v14 = a3;
  [a1 setEtag:a6];
  [a1 setKnownToServer:1];
  id v15 = [NSNumber numberWithLongLong:a4];
  id v16 = [NSNumber numberWithUnsignedLongLong:a5];
  uint64_t v17 = [a1 _updateSize:v15 mtime:v16 shouldUseEnhancedDrivePrivacy:a7 item:v14 error:a8];

  return v17;
}

- (uint64_t)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:
{
  id v10 = a3;
  id v69 = a6;
  id v11 = [v10 currentVersion];
  char v66 = a5;
  int v12 = [v10 contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:a5];
  uint64_t v68 = [v11 ckInfo];

  if ((a4 & 0x4000000000000000) != 0)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.5();
    }
  }
  if (!v11)
  {
    int v62 = brc_bread_crumbs();
    uint64_t v63 = brc_default_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.4();
    }
  }
  id v15 = [v10 appLibrary];
  if ([v15 isCloudDocsAppLibrary])
  {
    id v16 = [v10 clientZone];
    if ([v16 isCloudDocsZone])
    {
      uint64_t v17 = [v10 parentItemIDInZone];
      uint64_t v18 = [v17 isNonDesktopRoot];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  id v19 = [v10 parentItemIDInZone];
  uint64_t v20 = [v19 isDocumentsFolder];

  if ([v10 isSharedToMeTopLevelItem])
  {
    if (v68) {
      int v21 = 0;
    }
    else {
      int v21 = v12;
    }
    if (v21 == 1)
    {
      int v22 = [v10 clientZone];
      char v23 = [v10 itemID];
      int v24 = [v22 serverItemByItemID:v23];

      unsigned int v25 = [v24 latestVersion];
      uint64_t v26 = [v25 originalPOSIXName];
      int v27 = v26;
      if (v26)
      {
        id v28 = v26;
      }
      else
      {
        id v28 = [v11 originalPOSIXName];
      }
      int v31 = v28;

      [a1 serializeFilename:v31 forCreation:1 basehashSalt:0 parentIDIsCloudDocsRoot:v18 parentIDIsDocumentsFolder:v20];
    }
    __int16 v30 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initShareIDWithShareableItem:v10];
    __int16 v32 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v30 action:0];
    [a1 setShare:v32];

    goto LABEL_26;
  }
  char v29 = v12 ^ 1;
  if ((a4 & 0x40000) != 0) {
    char v29 = 0;
  }
  if ((v29 & 1) == 0)
  {
    __int16 v30 = [v11 originalPOSIXName];
    [a1 serializeFilename:v30 forCreation:v68 == 0 basehashSalt:v69 parentIDIsCloudDocsRoot:v18 parentIDIsDocumentsFolder:v20];
LABEL_26:
  }
  if ((a4 & 0x80000) != 0) {
    char v33 = 0;
  }
  else {
    char v33 = v12 ^ 1;
  }
  if (v33)
  {
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "size"));
    if ((a4 & 0x100000) == 0 && ([v10 isDocumentBeingCopiedToNewZone] & 1) == 0)
    {
      char v35 = brc_bread_crumbs();
      uint64_t v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:]();
      }
    }
  }
  if ((a4 & 0x20000) != 0) {
    char v37 = 0;
  }
  else {
    char v37 = v12 ^ 1;
  }
  if (v37)
  {
    char v38 = 0;
  }
  else
  {
    char v38 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "mtime"));
  }
  uint64_t v39 = objc_msgSend(a1, "_updateSize:mtime:shouldUseEnhancedDrivePrivacy:item:error:", v34, v38, objc_msgSend(v10, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v69 != 0), v10, a7);
  if (v39)
  {
    char v40 = v12 ^ 1;
    if ((a4 & 0x200000) != 0) {
      char v40 = 0;
    }
    if ((v40 & 1) == 0)
    {
      int v41 = [v11 xattrSignature];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        if (v68)
        {
          [a1 setObject:0 forKeyedSubscript:@"xattr"];
          uint64_t v47 = [a1 encryptedValues];
          [v47 setObject:0 forKeyedSubscript:@"xattrSignature"];
          goto LABEL_55;
        }
LABEL_52:
        uint64_t v47 = [MEMORY[0x263EFF8F8] data];
        uint64_t v48 = [a1 encryptedValues];
        [v48 setObject:v47 forKeyedSubscript:@"quarantine"];

LABEL_55:
LABEL_56:
        char v49 = [v10 resolvedConflictLoserEtags];
        id v50 = v49;
        if ((a4 & 0x800000) != 0 && [v49 count] && v68)
        {
          char v51 = [v11 conflictLoserEtags];
          id v52 = (void *)[v51 mutableCopy];

          [v52 minusSet:v50];
          char v53 = [v52 allObjects];
          [a1 setConflictLoserEtags:v53];
        }
        if (v66)
        {
          char v54 = [v10 clientZone];
          id v55 = [v54 mangledID];
          id v56 = +[BRCUserDefaults defaultsForMangledID:v55];
          int v57 = [v56 forceFailIfExistOnRevival];

          if (v57)
          {
            [a1 setKnownToServer:0];
            [a1 setEtag:0];
          }
        }
        else
        {
          BOOL v58 = [v11 ckInfo];
          objc_msgSend(a1, "serializeSystemFields:includeCZMEtag:", v58, objc_msgSend(v10, "isDocumentBeingCopiedToNewZone") ^ 1);
        }
        goto LABEL_65;
      }
      char v43 = [a1 objectForKeyedSubscript:@"xattr"];
      BOOL v44 = v43 == 0;

      if (v44)
      {
        id v64 = brc_bread_crumbs();
        v65 = brc_default_log();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:]();
        }
      }
      uint64_t v45 = [a1 encryptedValues];
      id v46 = [v45 objectForKeyedSubscript:@"xattrSignature"];
      if (v46) {
        goto LABEL_50;
      }
      uint64_t v60 = [v10 clientZone];
      int v61 = [v60 enhancedDrivePrivacyEnabled];

      if (v61)
      {
        uint64_t v45 = brc_bread_crumbs();
        id v46 = brc_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:]();
        }
LABEL_50:
      }
    }
    if (v68) {
      goto LABEL_56;
    }
    goto LABEL_52;
  }
LABEL_65:

  return v39;
}

- (void)serializeSideCarInfo:()BRCSerializationAdditions filenameExtension:diffs:deadInServerTruth:
{
  id v16 = a3;
  id v10 = a4;
  if ((a5 & 0x1000) != 0 || a6)
  {
    if (![v16 favoriteRank])
    {
      [a1 setObject:0 forKeyedSubscript:@"favoriteRank"];
      if ((a5 & 0x800) != 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "favoriteRank"));
    [a1 setObject:v11 forKeyedSubscript:@"favoriteRank"];
  }
  if ((a5 & 0x800) != 0)
  {
LABEL_7:
    objc_msgSend(a1, "setLastUsedTime:", objc_msgSend(v16, "lastUsedTime"));
    goto LABEL_8;
  }
LABEL_6:
  if (a6) {
    goto LABEL_7;
  }
LABEL_8:
  if ((a5 & 0x200) != 0 || a6)
  {
    int v12 = [v16 finderTags];
    uint64_t v13 = [v16 ckInfo];
    id v14 = [v13 etag];
    [a1 serializeFinderTags:v12 forCreation:v14 == 0];
  }
  [a1 setObject:v10 forKeyedSubscript:@"extension"];
  if ((a6 & 1) == 0)
  {
    id v15 = [v16 ckInfo];
    [a1 serializeSystemFields:v15];
  }
}

- (void)setLastUsedTime:()BRCSerializationAdditions
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithLongLong:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [a1 setObject:v4 forKeyedSubscript:@"lastOpenTime"];
  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
}

- (id)_createAppLibraryIfNecessary:()BRCSerializationAdditions session:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v13 = 0;
  uint64_t v5 = (objc_class *)MEMORY[0x263F325E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithAppLibraryName:v7];

  uint64_t v9 = [v6 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v8 appLibraryExists:&v13];

  if (!v13)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Created app library through sync flow %@%@", buf, 0x16u);
    }
  }
  return v9;
}

- (void)_saveAppLibraryIfNecessary:()BRCSerializationAdditions
{
  id v6 = a3;
  v3 = [v6 db];
  [v3 assertOnQueue];

  if ([v6 needsSave])
  {
    id v4 = [v6 session];
    [v4 saveAppLibraryToDB:v6];

    uint64_t v5 = [v6 db];
    [v5 flush];
  }
}

- (void)_processSaltingOnAppLibrary:()BRCSerializationAdditions
{
  id v4 = a3;
  id v6 = [[BRCBasehashSaltInfo alloc] initWithRecord:a1];
  uint64_t v5 = [(BRCBasehashSaltInfo *)v6 childBasehashSalt];
  [v4 setChildBasehashSalt:v5];

  objc_msgSend(v4, "setSaltingState:", -[BRCBasehashSaltInfo saltingState](v6, "saltingState"));
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 recordType];
  int v11 = [v10 isEqualToString:@"structure"];

  if (v11)
  {
    int v12 = [a1 recordID];
    char v13 = [v9 session];
    if (objc_msgSend(v12, "brc_isZoneRootRecordID"))
    {
      id v14 = [v9 session];
      id v15 = [v14 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke;
      block[3] = &unk_265082220;
      id v51 = v9;
      id v52 = a1;
      char v53 = a5;
      dispatch_async_and_wait(v15, block);

      __int16 v16 = v51;
LABEL_4:

LABEL_30:
      goto LABEL_31;
    }
    if (objc_msgSend(v12, "brc_isAppLibraryRootRecordID"))
    {
      uint64_t v17 = objc_msgSend(v12, "brc_appLibraryRootZoneName");
      uint64_t v18 = [a1 _createAppLibraryIfNecessary:v17 session:v13];

      id v19 = [v9 session];
      uint64_t v20 = [v19 clientTruthWorkloop];
      uint64_t v43 = MEMORY[0x263EF8330];
      uint64_t v44 = 3221225472;
      uint64_t v45 = __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke_2;
      id v46 = &unk_265082220;
      uint64_t v47 = a1;
      id v48 = v18;
      char v49 = a5;
      id v21 = v18;
      dispatch_async_and_wait(v20, &v43);
    }
    if (!objc_msgSend(v9, "isCloudDocsZone", v43, v44, v45, v46, v47)) {
      goto LABEL_30;
    }
    if (objc_msgSend(v12, "brc_isAppLibraryRootRecordID"))
    {
      int v22 = objc_msgSend(v12, "brc_appLibraryRootZoneName");
      char v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.9();
      }

      if ([v22 isEqualToString:*MEMORY[0x263F324E8]])
      {
        char v35 = brc_bread_crumbs();
        uint64_t v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:]();
        }
      }
      [v8 addObject:v22];
    }
    if (objc_msgSend(v12, "brc_isAppLibraryDocumentsRecordID"))
    {
      unsigned int v25 = objc_msgSend(v12, "brc_appLibraryDocumentsZoneName");
      uint64_t v26 = brc_bread_crumbs();
      int v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.7();
      }

      if ([v25 isEqualToString:*MEMORY[0x263F324E8]])
      {
        char v37 = brc_bread_crumbs();
        char v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:]();
        }
      }
      [v8 addObject:v25];
    }
    if (([v9 state] & 4) != 0) {
      goto LABEL_30;
    }
    __int16 v16 = [a1 objectForKeyedSubscript:@"parent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = [v16 recordID];
      if (objc_msgSend(v28, "brc_isAppLibraryRootRecordID"))
      {
        char v29 = objc_msgSend(v28, "brc_appLibraryRootZoneName");
        __int16 v30 = brc_bread_crumbs();
        int v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.4();
        }

        if ([v29 isEqualToString:*MEMORY[0x263F324E8]])
        {
          uint64_t v39 = brc_bread_crumbs();
          char v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
            -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:]();
          }
        }
        [v8 addObject:v29];
      }
      if (!objc_msgSend(v28, "brc_isAppLibraryDocumentsRecordID")) {
        goto LABEL_35;
      }
      __int16 v32 = objc_msgSend(v28, "brc_appLibraryDocumentsZoneName");
      char v33 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:]();
      }

      if ([v32 isEqualToString:*MEMORY[0x263F324E8]])
      {
        int v41 = brc_bread_crumbs();
        BOOL v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:]();
        }
      }
      [v8 addObject:v32];
    }
    else
    {
      id v28 = brc_bread_crumbs();
      __int16 v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.5();
      }
    }

LABEL_35:
    goto LABEL_4;
  }
LABEL_31:
}

- (id)getAndUpdateBoundaryKeyForItem:()BRCSerializationAdditions
{
  id v4 = a3;
  if ([v4 isFinderBookmark])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = +[BRCUserDefaults defaultsForMangledID:0];
    int v7 = [v6 supportsEnhancedDrivePrivacy];

    uint64_t v5 = 0;
    if (v7)
    {
      id v8 = [v4 clientZone];
      id v9 = [v4 itemID];
      id v10 = [v4 db];
      uint64_t v5 = [v8 contentBoundaryKeyForItemID:v9 withDB:v10];

      if ([v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:v5 != 0])
      {
        if (!v5)
        {
          uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateSaltingKey");
        }
        [a1 serializeContentBoundaryKey:v5];
        int v11 = NSNumber;
        int v12 = [v4 currentVersion];
        char v13 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "size"));
        id v14 = [a1 encryptedValues];
        [v14 setObject:v13 forKeyedSubscript:@"exactSize"];
      }
    }
  }

  return v5;
}

- (void)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: empty basename and no bounceno%@", v2, v3, v4, v5, v6);
}

- (void)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] basename is nil -> replace with empty string%@", v1, 0xCu);
}

- (void)deserializeAliasInfo:()BRCSerializationAdditions serverZone:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No alias target%@", v2, v3, v4, v5, v6);
}

- (void)_deserializeRootSharingOptions:()BRCSerializationAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Record %@ is missing its PSK or routing key!%@");
}

- (void)deserializeStatInfo:()BRCSerializationAdditions serverMetrics:itemID:session:error:.cold.1()
{
  OUTLINED_FUNCTION_12();
  [v0 UTF8String];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: The server should have set a birthtime on %s%@", v3, v4, v5, v6, v7);
}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: The record name is not a content in the shared zone%@", v2, v3, v4, v5, v6);
}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [v2 recordType];
  uint64_t v5 = [v3 recordID];
  int v6 = 138412802;
  uint8_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v1;
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] %@ record %@ doesn't have a lastEditorDeviceName%@", (uint8_t *)&v6, 0x20u);
}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 recordID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v2, v3, "[CRIT] UNREACHABLE: Got unexpected content boundary key for recordID %@%@", v4, v5, v6, v7, v8);
}

- (void)_locateSideCarServerZone:()BRCSerializationAdditions withShareAliasReference:withSession:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: si.isBRAlias%@", v2, v3, v4, v5, v6);
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: invalid filename%@", v2, v3, v4, v5, v6);
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] couldn't set basename to '%@'%@", v1, 0x16u);
}

- (void)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't find xattr for signature %@%@", buf, 0x16u);
}

- (void)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: childBasehashSaltGetter%@", v2, v3, v4, v5, v6);
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.encryptedValues[kBRRecordKeyXattrSignature] || !item.clientZone.enhancedDrivePrivacyEnabled%@", v2, v3, v4, v5, v6);
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self[kBRRecordKeyXattr]%@", v2, v3, v4, v5, v6);
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: (diffs & BRC_IF_CONTENT_SIGNATURE) || item.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: version != nil%@", v2, v3, v4, v5, v6);
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] On Sync-up of %@ using old etag due to iWork conflict%@");
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![zoneName isEqualToString:BRUbiquitousDefaultContainerID]%@", v2, v3, v4, v5, v6);
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 recordName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] found parent app documents record named: %@%@", v4, v5, v6, v7, v8);
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 recordName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] found parent app library record named: %@%@", v4, v5, v6, v7, v8);
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: parent is not a CKReference for %@%@");
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.7()
{
  OUTLINED_FUNCTION_12();
  os_log_t v1 = [v0 recordName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] found app documents record named: %@%@", v4, v5, v6, v7, v8);
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.9()
{
  OUTLINED_FUNCTION_12();
  os_log_t v1 = [v0 recordName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] found app library record named: %@%@", v4, v5, v6, v7, v8);
}

@end