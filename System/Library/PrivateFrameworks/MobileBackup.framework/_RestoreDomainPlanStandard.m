@interface _RestoreDomainPlanStandard
- (BOOL)_enumerateAndMarkATCRestorables:(id)a3 totalATCAssets:(unint64_t *)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)_setWillRestoreInATCBackgroundPhase:(id)a3 restorableID:(unint64_t)a4 error:(id *)a5;
- (BOOL)enumerateAndMarkATCRestorables:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkNotStartedDirectoriesTopDown:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkPlacedDirectoriesBottomUp:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedAssets:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedSymlinks:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedZeroByteFiles:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAssetsToDownload:(id *)a3 enumerator:(id)a4;
- (BOOL)recordVerificationFailure:(id)a3 error:(id *)a4;
- (BOOL)recordVerificationSuccess:(id *)a3;
- (BOOL)setAssetState:(unint64_t)a3 asset:(id)a4 withFailure:(id)a5 error:(id *)a6;
- (BOOL)setDomainState:(unint64_t)a3 error:(id *)a4;
- (id)atcFileInfosMatchingRelativePath:(id)a3 pendingOnly:(BOOL)a4 range:(_NSRange)a5 error:(id *)a6;
- (id)countsOfRestorablesByState:(id *)a3;
- (unint64_t)domainState:(id *)a3;
@end

@implementation _RestoreDomainPlanStandard

- (unint64_t)domainState:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard domainState:]", "MBRestorePlanDB.m", 1867, "error");
  }
  v5 = -[MBRestorePlanDB _validRWDatabase:](self->super._parentPlan, "_validRWDatabase:");
  id v6 = objc_msgSend(v5, "fetchCountWithError:sql:", a3, @"\n SELECT engineState\n FROM   Domains\n WHERE  domainID = %llu", self->super._domainID);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return (unint64_t)v6;
  }
}

- (BOOL)setDomainState:(unint64_t)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard setDomainState:error:]", "MBRestorePlanDB.m", 1883, "state != MBRestoreDomainStateUndefined");
  }
  if (!a4) {
    __assert_rtn("-[_RestoreDomainPlanStandard setDomainState:error:]", "MBRestorePlanDB.m", 1884, "error");
  }
  if ([(MBDomain *)self->super._domain hasRootPath])
  {
    v7 = [(MBDomain *)self->super._domain rootPath];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(MBRestorePlanDB *)self->super._parentPlan _validRWDatabase:a4];
  unsigned __int8 v9 = [v8 executeWithError:a4, @"\n UPDATE Domains\n SET    engineState = %u, \n        rootPath = %@\n WHERE  domainID = %llu", a3, v7, self->super._domainID sql];

  return v9;
}

- (BOOL)recordVerificationSuccess:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard recordVerificationSuccess:]", "MBRestorePlanDB.m", 1897, "error");
  }
  v3 = a3;
  v5 = -[MBRestorePlanDB _validRWDatabase:](self->super._parentPlan, "_validRWDatabase:");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B7FE8;
  v7[3] = &unk_100416080;
  v7[4] = self;
  LOBYTE(v3) = [v5 performWithConnection:v7 error:v3];

  return (char)v3;
}

- (BOOL)recordVerificationFailure:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard recordVerificationFailure:error:]", "MBRestorePlanDB.m", 1905, "failure");
  }
  if (!a4) {
    __assert_rtn("-[_RestoreDomainPlanStandard recordVerificationFailure:error:]", "MBRestorePlanDB.m", 1906, "error");
  }
  v7 = v6;
  v8 = [(MBRestorePlanDB *)self->super._parentPlan _validRWDatabase:a4];
  unsigned __int8 v9 = v8;
  if (v8
    && [v8 _recordFailure:v7 domainID:self->super._domainID restoreType:self->super._restoreType inode:0 restorableID:0 error:a4])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002B8130;
    v12[3] = &unk_100416080;
    v12[4] = self;
    unsigned __int8 v10 = [v9 performWithConnection:v12 error:a4];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)enumerateAndMarkATCRestorables:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkATCRestorables:enumerator:]", "MBRestorePlanDB.m", 1921, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkATCRestorables:enumerator:]", "MBRestorePlanDB.m", 1922, "enumerator");
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  parentPlan = self->super._parentPlan;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B82E0;
  v12[3] = &unk_1004183E8;
  v12[4] = self;
  v14 = &v15;
  id v8 = v6;
  id v13 = v8;
  LODWORD(parentPlan) = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v12];

  if (parentPlan)
  {
    if (v16[3])
    {
      unsigned __int8 v9 = [(MBRestorePlanDB *)self->super._parentPlan _validRWDatabase:a3];
      unsigned __int8 v10 = objc_msgSend(v9, "executeWithError:sql:", a3, @"\n UPDATE Domains\n SET    totalATCItems = %llu\n WHERE  domainID = %llu;",
                               v16[3],
                               self->super._domainID);
    }
    else
    {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (BOOL)_enumerateAndMarkATCRestorables:(id)a3 totalATCAssets:(unint64_t *)a4 error:(id *)a5 enumerator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (!v10) {
    __assert_rtn("-[_RestoreDomainPlanStandard _enumerateAndMarkATCRestorables:totalATCAssets:error:enumerator:]", "MBRestorePlanDB.m", 1946, "readOnlyDB");
  }
  if (!a4) {
    __assert_rtn("-[_RestoreDomainPlanStandard _enumerateAndMarkATCRestorables:totalATCAssets:error:enumerator:]", "MBRestorePlanDB.m", 1947, "totalATCAssets");
  }
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanStandard _enumerateAndMarkATCRestorables:totalATCAssets:error:enumerator:]", "MBRestorePlanDB.m", 1948, "error");
  }
  v12 = v11;
  if (!v11) {
    __assert_rtn("-[_RestoreDomainPlanStandard _enumerateAndMarkATCRestorables:totalATCAssets:error:enumerator:]", "MBRestorePlanDB.m", 1949, "enumerator");
  }
  objc_msgSend(v10, "fetchSQL:", @"\n SELECT inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \npriority, \nrestorableID\n FROM   Restorables\n WHERE  domainID = %llu;",
  id v13 = self->super._domainID);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002B8508;
  v17[3] = &unk_100418410;
  v17[4] = self;
  id v18 = v12;
  v19 = a4;
  id v14 = v12;
  unsigned __int8 v15 = [v13 enumerateWithError:a5 block:v17];

  return v15;
}

- (BOOL)_setWillRestoreInATCBackgroundPhase:(id)a3 restorableID:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8) {
    __assert_rtn("-[_RestoreDomainPlanStandard _setWillRestoreInATCBackgroundPhase:restorableID:error:]", "MBRestorePlanDB.m", 1994, "restorable");
  }
  if (!a4) {
    __assert_rtn("-[_RestoreDomainPlanStandard _setWillRestoreInATCBackgroundPhase:restorableID:error:]", "MBRestorePlanDB.m", 1995, "restorableID != 0");
  }
  if (!a5) {
    __assert_rtn("-[_RestoreDomainPlanStandard _setWillRestoreInATCBackgroundPhase:restorableID:error:]", "MBRestorePlanDB.m", 1996, "error");
  }
  unsigned __int8 v9 = v8;
  id v10 = [v8 absolutePath];
  id v11 = [(MBRestorePlanDB *)self->super._parentPlan _validRWDatabase:a5];
  unsigned __int8 v12 = objc_msgSend(v11, "executeWithError:sql:", a5, @"\nUPDATE Restorables\n   SET absolutePath = %@\n WHERE restorableID = %llu;",
                           v10,
                           a4);

  return v12;
}

- (id)countsOfRestorablesByState:(id *)a3
{
  return [(_RestoreDomainPlanBase *)self _countsOfRestorablesByState:a3];
}

- (BOOL)setAssetState:(unint64_t)a3 asset:(id)a4 withFailure:(id)a5 error:(id *)a6
{
  return [(_RestoreDomainPlanBase *)self _setAssetState:a3 asset:a4 withFailure:a5 error:a6];
}

- (BOOL)enumerateAndMarkNotStartedDirectoriesTopDown:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkNotStartedDirectoriesTopDown:enumerator:]", "MBRestorePlanDB.m", 2015, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkNotStartedDirectoriesTopDown:enumerator:]", "MBRestorePlanDB.m", 2016, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B896C;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (BOOL)enumerateAndMarkPlacedDirectoriesBottomUp:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkPlacedDirectoriesBottomUp:enumerator:]", "MBRestorePlanDB.m", 2024, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkPlacedDirectoriesBottomUp:enumerator:]", "MBRestorePlanDB.m", 2025, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8A80;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (BOOL)enumerateAndMarkUnfinishedSymlinks:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedSymlinks:enumerator:]", "MBRestorePlanDB.m", 2033, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedSymlinks:enumerator:]", "MBRestorePlanDB.m", 2034, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8B90;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (BOOL)enumerateAndMarkUnfinishedZeroByteFiles:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedZeroByteFiles:enumerator:]", "MBRestorePlanDB.m", 2042, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedZeroByteFiles:enumerator:]", "MBRestorePlanDB.m", 2043, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8CA0;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (BOOL)enumerateAndMarkUnfinishedAssets:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedAssets:enumerator:]", "MBRestorePlanDB.m", 2051, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAndMarkUnfinishedAssets:enumerator:]", "MBRestorePlanDB.m", 2052, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8DB0;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (BOOL)enumerateAssetsToDownload:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAssetsToDownload:enumerator:]", "MBRestorePlanDB.m", 2060, "error");
  }
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanStandard enumerateAssetsToDownload:enumerator:]", "MBRestorePlanDB.m", 2061, "enumerator");
  }
  parentPlan = self->super._parentPlan;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8EC0;
  v11[3] = &unk_100418438;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a3 accessor:v11];

  return v9;
}

- (id)atcFileInfosMatchingRelativePath:(id)a3 pendingOnly:(BOOL)a4 range:(_NSRange)a5 error:(id *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  BOOL v9 = a4;
  id v11 = a3;
  if (!a6) {
    __assert_rtn("-[_RestoreDomainPlanStandard atcFileInfosMatchingRelativePath:pendingOnly:range:error:]", "MBRestorePlanDB.m", 2075, "error");
  }
  id v12 = v11;
  if (v9) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = 7;
  }
  id v14 = +[NSMutableArray array];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  parentPlan = self->super._parentPlan;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1002B92B8;
  v32[3] = &unk_100418488;
  v32[4] = self;
  uint64_t v36 = v13;
  NSUInteger v37 = location;
  NSUInteger v38 = length;
  id v16 = v12;
  id v33 = v16;
  v35 = &v39;
  id v17 = v14;
  id v34 = v17;
  if ([(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a6 accessor:v32])
  {

    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (char *)[v17 count];
        uint64_t v21 = v40[3];
        id v22 = [v17 count];
        v23 = [(MBDomain *)self->super._domain name];
        *(_DWORD *)buf = 134218754;
        v44 = &v20[-v21];
        __int16 v45 = 2048;
        id v46 = v22;
        __int16 v47 = 2112;
        id v48 = v23;
        __int16 v49 = 2112;
        id v50 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=plan= =atc= Found %llu/%lu restore files from plan for domain:%@, relativePath:%@", buf, 0x2Au);
      }
      [v17 count];
      [v17 count];
      v31 = [(MBDomain *)self->super._domain name];
      _MBLog();
    }
    id v24 = v17;
  }
  else
  {
    v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [(MBDomain *)self->super._domain name];
        id v28 = *a6;
        *(_DWORD *)buf = 138412802;
        v44 = v27;
        __int16 v45 = 2112;
        id v46 = v16;
        __int16 v47 = 2112;
        id v48 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "=plan= =atc= Failed finding restore files from plan for domain:%@, relativePath:%@ %@", buf, 0x20u);
      }
      v29 = [(MBDomain *)self->super._domain name];
      _MBLog();
    }
    id v24 = 0;
  }
  _Block_object_dispose(&v39, 8);

  return v24;
}

@end