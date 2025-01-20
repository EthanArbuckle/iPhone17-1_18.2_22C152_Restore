@interface _RestoreDomainPlanBase
- (BOOL)_enumerateAndMarkNotStartedDirectoriesTopDown:(id)a3 absolutePath:(id)a4 matchingState:(unint64_t)a5 error:(id *)a6 enumerator:(id)a7;
- (BOOL)_enumerateAndMarkPlacedDirectoriesBottomUp:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_enumerateAndMarkRestorablesMatchingType:(unsigned __int16)a3 state:(unint64_t)a4 readOnlyDB:(id)a5 absolutePath:(id)a6 descending:(BOOL)a7 error:(id *)a8 enumerator:(id)a9;
- (BOOL)_enumerateAndMarkUnfinishedAssets:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_enumerateAndMarkUnfinishedSymlinks:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_enumerateAndMarkUnfinishedZeroByteFiles:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_enumerateAssetsFromResultSet:(id)a3 columnIndex:(unsigned int)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_enumerateAssetsToDownload:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_setAssetState:(unint64_t)a3 asset:(id)a4 withFailure:(id)a5 error:(id *)a6;
- (BOOL)isPopulated;
- (BOOL)wasSkipped;
- (MBDomain)domain;
- (id)_countsOfRestorablesByState:(id *)a3;
- (id)_initWithParentPlan:(id)a3 domain:(id)a4 domainID:(unint64_t)a5 restoreType:(int)a6;
@end

@implementation _RestoreDomainPlanBase

- (id)_initWithParentPlan:(id)a3 domain:(id)a4 domainID:(unint64_t)a5 restoreType:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_RestoreDomainPlanBase;
  v13 = [(_RestoreDomainPlanBase *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_parentPlan, a3);
    objc_storeStrong((id *)&v14->_domain, a4);
    v14->_domainID = a5;
    v14->_restoreType = a6;
  }

  return v14;
}

- (BOOL)isPopulated
{
  return self->_domainID != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)wasSkipped
{
  parentPlan = self->_parentPlan;
  unint64_t domainID = self->_domainID;
  id v11 = 0;
  id v5 = [(MBRestorePlanDB *)parentPlan _verificationStateForDomainID:domainID error:&v11];
  id v6 = v11;
  if (v5)
  {
    BOOL v7 = v5 == (id)4;
  }
  else
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      v13 = domain;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=plan= Failed to get verification state for %@: %@", buf, 0x16u);
      _MBLog();
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)_countsOfRestorablesByState:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanBase _countsOfRestorablesByState:]", "MBRestorePlanDB.m", 1488, "error");
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1002B3794;
  v13 = sub_1002B37A4;
  id v14 = +[NSMutableDictionary dictionary];
  parentPlan = self->_parentPlan;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002B61B4;
  v8[3] = &unk_100418398;
  v8[4] = self;
  v8[5] = &v9;
  [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)_setAssetState:(unint64_t)a3 asset:(id)a4 withFailure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    __assert_rtn("-[_RestoreDomainPlanBase _setAssetState:asset:withFailure:error:]", "MBRestorePlanDB.m", 1518, "asset");
  }
  if (!a6) {
    __assert_rtn("-[_RestoreDomainPlanBase _setAssetState:asset:withFailure:error:]", "MBRestorePlanDB.m", 1519, "error");
  }
  id v12 = v11;
  if (a3 > 1)
  {
    BOOL v20 = -[MBRestorePlanDB _recordAssetState:inode:domainID:failure:restoreType:error:](self->_parentPlan, "_recordAssetState:inode:domainID:failure:restoreType:error:", a3, [v10 originalInode], self->_domainID, v11, self->_restoreType, a6);
  }
  else
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v22 = MBRestoreAssetStateToString(a3);
      *(_DWORD *)buf = 138412546;
      v24 = v22;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Invalid asset state (%@) to set for asset %@", buf, 0x16u);
    }
    id v14 = MBRestoreAssetStateToString(a3);
    sub_1001E70C4(0, a6, @"Invalid asset state (%@) to set for asset %@", v15, v16, v17, v18, v19, (uint64_t)v14);

    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_enumerateAndMarkRestorablesMatchingType:(unsigned __int16)a3 state:(unint64_t)a4 readOnlyDB:(id)a5 absolutePath:(id)a6 descending:(BOOL)a7 error:(id *)a8 enumerator:(id)a9
{
  BOOL v10 = a7;
  unsigned int v13 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  if (!a8) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkRestorablesMatchingType:state:readOnlyDB:absolutePath:descending:error:enumerator:]", "MBRestorePlanDB.m", 1550, "error");
  }
  uint64_t v18 = v17;
  if (!v17) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkRestorablesMatchingType:state:readOnlyDB:absolutePath:descending:error:enumerator:]", "MBRestorePlanDB.m", 1551, "enumerator");
  }
  if (v10) {
    v19 = @"\n SELECT inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \npriority, \nrestorableID\n FROM   Restorables\n WHERE  unint64_t domainID = %llu\n  AND   absolutePath IS %@\n  AND   restoreState = %u\n  AND  (type & %u) = %u\n ORDER BY relativePath DESC;";
  }
  else {
    v19 = @"\n SELECT inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \npriority, \nrestorableID\n FROM   Restorables\n WHERE  unint64_t domainID = %llu\n  AND   absolutePath IS %@\n  AND   restoreState = %u\n  AND  (type & %u) = %u\n ORDER BY relativePath ASC;";
  }
  uint64_t v20 = 57344;
  if (!v13) {
    uint64_t v20 = 0;
  }
  v21 = objc_msgSend(v15, "fetchSQL:", v19, self->_domainID, v16, a4, v20, v13);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002B66BC;
  v25[3] = &unk_100416FD8;
  v25[4] = self;
  id v26 = v18;
  id v22 = v18;
  unsigned __int8 v23 = [v21 enumerateWithError:a8 block:v25];

  return v23;
}

- (BOOL)_enumerateAndMarkNotStartedDirectoriesTopDown:(id)a3 absolutePath:(id)a4 matchingState:(unint64_t)a5 error:(id *)a6 enumerator:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!a6) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkNotStartedDirectoriesTopDown:absolutePath:matchingState:error:enumerator:]", "MBRestorePlanDB.m", 1594, "error");
  }
  if (!v14) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkNotStartedDirectoriesTopDown:absolutePath:matchingState:error:enumerator:]", "MBRestorePlanDB.m", 1595, "enumerator");
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B6944;
  v18[3] = &unk_1004183C0;
  id v19 = v14;
  id v15 = v14;
  BOOL v16 = [(_RestoreDomainPlanBase *)self _enumerateAndMarkRestorablesMatchingType:0x4000 state:a5 readOnlyDB:v12 absolutePath:v13 descending:0 error:a6 enumerator:v18];

  return v16;
}

- (BOOL)_enumerateAndMarkPlacedDirectoriesBottomUp:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkPlacedDirectoriesBottomUp:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1622, "error");
  }
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkPlacedDirectoriesBottomUp:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1623, "enumerator");
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002B6C18;
  v16[3] = &unk_1004183C0;
  id v17 = v12;
  id v13 = v12;
  BOOL v14 = [(_RestoreDomainPlanBase *)self _enumerateAndMarkRestorablesMatchingType:0x4000 state:4 readOnlyDB:v10 absolutePath:v11 descending:1 error:a5 enumerator:v16];

  return v14;
}

- (BOOL)_enumerateAndMarkUnfinishedSymlinks:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedSymlinks:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1649, "error");
  }
  id v13 = v12;
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedSymlinks:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1650, "enumerator");
  }
  objc_msgSend(v10, "fetchSQL:", @"\n SELECT Restorables.inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, RestorableSymlinkTargets.targetPath, RestorableSymlinkTargets.linkCount, Restorables.restorableID\n  FROM  Restorables\n   JOIN RestorableSymlinkTargets ON\n       (RestorableSymlinkTargets.inode = Restorables.inode\n    AND RestorableSymlinkTargets.unint64_t domainID = Restorables.domainID\n      )\n  WHERE Restorables.unint64_t domainID = %llu\n   AND  absolutePath IS %@\n   AND  restoreState != %u\n   AND  type = %u;",
    self->_domainID,
    v11,
    5,
  BOOL v14 = 40960);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B6F04;
  v18[3] = &unk_100416FD8;
  void v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  unsigned __int8 v16 = [v14 enumerateWithError:a5 block:v18];

  return v16;
}

- (BOOL)_enumerateAndMarkUnfinishedZeroByteFiles:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedZeroByteFiles:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1698, "error");
  }
  id v13 = v12;
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedZeroByteFiles:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1699, "enumerator");
  }
  objc_msgSend(v10, "fetchSQL:", @"\n SELECT Restorables.restorableID, \nRestorables.inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \nRestorableAssets.linkCount\n  FROM  Restorables\n   JOIN RestorableAssets ON\n       (RestorableAssets.inode = Restorables.inode\n    AND RestorableAssets.unint64_t domainID = Restorables.domainID\n      )\n  WHERE Restorables.unint64_t domainID = %llu\n   AND  absolutePath IS %@\n   AND  restoreState != %u\n   AND  type = %u\n   AND  size = 0;",
    self->_domainID,
    v11,
    5,
  BOOL v14 = 0x8000);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B72BC;
  v18[3] = &unk_100416FD8;
  void v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  unsigned __int8 v16 = [v14 enumerateWithError:a5 block:v18];

  return v16;
}

- (BOOL)_enumerateAndMarkUnfinishedAssets:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedAssets:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1746, "error");
  }
  id v13 = v12;
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAndMarkUnfinishedAssets:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1747, "enumerator");
  }
  objc_msgSend(v10, "fetchSQL:", @"\n SELECT Restorables.restorableID, \nRestorables.inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \nRestorableAssets.linkCount, \nRestorableAssets.assetSignature, \nRestorableAssets.assetType, \nRestorableAssets.compressionMethod\n FROM   Restorables\n  JOIN  RestorableAssets ON \n       (RestorableAssets.inode = Restorables.inode\n    AND RestorableAssets.unint64_t domainID = Restorables.domainID\n      )\n WHERE  Restorables.unint64_t domainID = %llu\n   AND  absolutePath IS %@\n   AND  restoreState != %u\n   AND  restoreState != %u\n   AND  type = %u\n   AND  size != 0;",
    self->_domainID,
    v11,
    2,
    5,
  BOOL v14 = 0x8000);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B7648;
  v18[3] = &unk_100416FD8;
  void v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  unsigned __int8 v16 = [v14 enumerateWithError:a5 block:v18];

  return v16;
}

- (BOOL)_enumerateAssetsFromResultSet:(id)a3 columnIndex:(unsigned int)a4 error:(id *)a5 enumerator:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  if (!v10) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsFromResultSet:columnIndex:error:enumerator:]", "MBRestorePlanDB.m", 1776, "rs");
  }
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsFromResultSet:columnIndex:error:enumerator:]", "MBRestorePlanDB.m", 1777, "error");
  }
  id v12 = (uint64_t (**)(void, void, void, void, void, void, void))v11;
  if (!v11) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsFromResultSet:columnIndex:error:enumerator:]", "MBRestorePlanDB.m", 1778, "enumerator");
  }
  int v39 = v8 + 1;
  id v38 = [v10 unsignedLongLongAtIndex:v8];
  id v13 = [v10 fileWithDomain:self->_domain fromIndex:&v39];
  ++v39;
  unsigned int v14 = objc_msgSend(v10, "unsignedIntAtIndex:");
  ++v39;
  id v15 = objc_msgSend(v10, "dataAtIndex:");
  ++v39;
  unsigned __int8 v16 = (char *)objc_msgSend(v10, "unsignedLongLongAtIndex:");
  ++v39;
  signed __int8 v17 = objc_msgSend(v10, "unsignedCharAtIndex:");
  if ((unint64_t)(v16 - 1) >= 3)
  {
    uint64_t v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v37 = MBStringForAssetType((uint64_t)v16);
      *(_DWORD *)buf = 138412546;
      v41 = v37;
      __int16 v42 = 2112;
      v43 = v13;
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Invalid asset type (%@) for %@ when enumerating unfinished asset files", buf, 0x16u);
    }
    id v19 = MBStringForAssetType((uint64_t)v16);
    sub_1001E70C4(0, a5, @"Invalid asset type (%@) for %@ when enumerating unfinished asset files", v20, v21, v22, v23, v24, (uint64_t)v19);
  }
  unint64_t v25 = ((uint64_t (**)(void, void *, char *, void, void *, BOOL, id *))v12)[2](v12, v13, v16, v17, v15, v14 > 1, a5);
  uint64_t v26 = v25;
  if (v25 <= 4 && ((1 << v25) & 0x19) != 0)
  {
    v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      v36 = MBRestorableStateToString(v26);
      *(_DWORD *)buf = 138412546;
      v41 = v36;
      __int16 v42 = 2112;
      v43 = v13;
      _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Invalid restorable state (%@) for %@ when enumerating unfinished asset files", buf, 0x16u);
    }
    v28 = MBRestorableStateToString(v26);
    sub_1001E70C4(0, a5, @"Invalid restorable state (%@) for %@ when enumerating unfinished asset files", v29, v30, v31, v32, v33, (uint64_t)v28);

    BOOL v34 = 0;
  }
  else
  {
    BOOL v34 = -[MBRestorePlanDB _recordRestorableState:restorableID:domainID:inode:restoreType:error:](self->_parentPlan, "_recordRestorableState:restorableID:domainID:inode:restoreType:error:", v25, v38, self->_domainID, [v13 inodeNumber], self->_restoreType, a5);
  }

  return v34;
}

- (BOOL)_enumerateAssetsToDownload:(id)a3 absolutePath:(id)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsToDownload:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1819, "readOnlyDB");
  }
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsToDownload:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1820, "error");
  }
  id v13 = v12;
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanBase _enumerateAssetsToDownload:absolutePath:error:enumerator:]", "MBRestorePlanDB.m", 1821, "enumerator");
  }
  objc_msgSend(v10, "fetchSQL:", @"\nSELECT RestorableAssets.inode, \nlinkCount, \nrecordIDSuffix, encryptionKey, compressionMethod, assetType, assetSize, assetSignature, \nRestorables.size, \nRestorables.protectionClass, \nRestorables.relativePath\n FROM  RestorableAssets\n JOIN  Restorables ON \n      (RestorableAssets.inode = Restorables.inode\n   AND RestorableAssets.unint64_t domainID = Restorables.domainID\n     )\n WHERE RestorableAssets.unint64_t domainID = %llu\n   AND RestorableAssets.assetState != %lu\n   AND Restorables.restoreState != %u\n   AND Restorables.restoreState != %u\n   AND Restorables.absolutePath IS %@\n GROUP BY RestorableAssets.inode;",
    self->_domainID,
    2,
    2,
    5,
  unsigned int v14 = v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B7BD8;
  v18[3] = &unk_100413728;
  id v19 = v13;
  id v15 = v13;
  unsigned __int8 v16 = [v14 enumerateWithError:a5 block:v18];

  return v16;
}

- (MBDomain)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_parentPlan, 0);
}

@end