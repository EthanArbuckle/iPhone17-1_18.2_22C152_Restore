@interface _RestoreDomainPlanATC
- (BOOL)_enumerate:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateAndMarkNotStartedDirectoriesTopDown:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkPlacedDirectoriesBottomUp:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedAssets:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedSymlinks:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAndMarkUnfinishedZeroByteFiles:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateAssetsToDownload:(id *)a3 enumerator:(id)a4;
- (BOOL)setAssetState:(unint64_t)a3 asset:(id)a4 withFailure:(id)a5 error:(id *)a6;
- (id)_initWithParentPlan:(id)a3 domain:(id)a4 domainID:(unint64_t)a5 atcPaths:(id)a6;
- (id)countsOfRestorablesByState:(id *)a3;
@end

@implementation _RestoreDomainPlanATC

- (id)_initWithParentPlan:(id)a3 domain:(id)a4 domainID:(unint64_t)a5 atcPaths:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10) {
    __assert_rtn("-[_RestoreDomainPlanATC _initWithParentPlan:domain:domainID:atcPaths:]", "MBRestorePlanDB.m", 2145, "parentPlan");
  }
  if (!v11) {
    __assert_rtn("-[_RestoreDomainPlanATC _initWithParentPlan:domain:domainID:atcPaths:]", "MBRestorePlanDB.m", 2146, "domain");
  }
  v13 = v12;
  if (!v12) {
    __assert_rtn("-[_RestoreDomainPlanATC _initWithParentPlan:domain:domainID:atcPaths:]", "MBRestorePlanDB.m", 2147, "atcPaths");
  }
  v17.receiver = self;
  v17.super_class = (Class)_RestoreDomainPlanATC;
  v14 = [(_RestoreDomainPlanBase *)&v17 _initWithParentPlan:v10 domain:v11 domainID:a5 restoreType:2];
  v15 = v14;
  if (v14) {
    objc_storeStrong(v14 + 5, a6);
  }

  return v15;
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
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkNotStartedDirectoriesTopDown:enumerator:]", "MBRestorePlanDB.m", 2166, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkNotStartedDirectoriesTopDown:enumerator:]", "MBRestorePlanDB.m", 2167, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths directories];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B97A8;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)enumerateAndMarkPlacedDirectoriesBottomUp:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkPlacedDirectoriesBottomUp:enumerator:]", "MBRestorePlanDB.m", 2176, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkPlacedDirectoriesBottomUp:enumerator:]", "MBRestorePlanDB.m", 2177, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths directories];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B98DC;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)enumerateAndMarkUnfinishedSymlinks:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedSymlinks:enumerator:]", "MBRestorePlanDB.m", 2186, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedSymlinks:enumerator:]", "MBRestorePlanDB.m", 2187, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths symlinks];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B9A0C;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)enumerateAndMarkUnfinishedZeroByteFiles:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedZeroByteFiles:enumerator:]", "MBRestorePlanDB.m", 2196, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedZeroByteFiles:enumerator:]", "MBRestorePlanDB.m", 2197, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths zeroByteFiles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B9B3C;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)enumerateAndMarkUnfinishedAssets:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedAssets:enumerator:]", "MBRestorePlanDB.m", 2206, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAndMarkUnfinishedAssets:enumerator:]", "MBRestorePlanDB.m", 2207, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths assetFiles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B9C6C;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)enumerateAssetsToDownload:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAssetsToDownload:enumerator:]", "MBRestorePlanDB.m", 2216, "error");
  }
  v7 = v6;
  if (!v6) {
    __assert_rtn("-[_RestoreDomainPlanATC enumerateAssetsToDownload:enumerator:]", "MBRestorePlanDB.m", 2217, "enumerator");
  }
  v8 = [(_ATCPaths *)self->_atcPaths assetFiles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B9D9C;
  v12[3] = &unk_1004184B0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  BOOL v10 = [(_RestoreDomainPlanATC *)self _enumerate:v8 error:a3 block:v12];

  return v10;
}

- (BOOL)_enumerate:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[_RestoreDomainPlanATC _enumerate:error:block:]", "MBRestorePlanDB.m", 2234, "absolutePaths");
  }
  if (!a4) {
    __assert_rtn("-[_RestoreDomainPlanATC _enumerate:error:block:]", "MBRestorePlanDB.m", 2235, "error");
  }
  if (!v9) {
    __assert_rtn("-[_RestoreDomainPlanATC _enumerate:error:block:]", "MBRestorePlanDB.m", 2236, "block");
  }
  parentPlan = self->super._parentPlan;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002B9EF0;
  v15[3] = &unk_100418438;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  unsigned __int8 v13 = [(MBRestorePlanDB *)parentPlan _withReadOnlyDB:a4 accessor:v15];

  return v13;
}

- (void).cxx_destruct
{
}

@end