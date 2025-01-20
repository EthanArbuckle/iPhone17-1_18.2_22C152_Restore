@interface _ROPlanDB
- (BOOL)_enumerateFatalFailuresOfType:(id)a3 error:(id *)a4 enumerator:(id)a5;
- (BOOL)_enumerateNonFatalFailuresOfType:(id)a3 error:(id *)a4 enumerator:(id)a5;
- (id)_childFailuresOfErrorID:(unint64_t)a3 error:(id *)a4;
@end

@implementation _ROPlanDB

- (id)_childFailuresOfErrorID:(unint64_t)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[_ROPlanDB _childFailuresOfErrorID:error:]", "MBRestorePlanDB.m", 2412, "errorID");
  }
  if (!a4) {
    __assert_rtn("-[_ROPlanDB _childFailuresOfErrorID:error:]", "MBRestorePlanDB.m", 2413, "error");
  }
  v7 = +[NSMutableArray array];
  -[MBSQLiteDB fetchSQL:](self, "fetchSQL:", @"\nSELECT\n  E.errorID, \n\n   E.errorDomain, \n   E.errorCode, \n   E.description, \n   E.timestamp\n FROM  Errors AS E\n\n  JOIN FatalErrorRelationships AS F\n    ON E.errorID = F.errorID\n WHERE F.parentErrorID = %llu;",
  v8 = a3);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002BAA30;
  v13[3] = &unk_1004184D8;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  unsigned int v10 = [v8 enumerateWithError:a4 block:v13];

  if (v10) {
    id v11 = v9;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_enumerateFatalFailuresOfType:(id)a3 error:(id *)a4 enumerator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!a4) {
    __assert_rtn("-[_ROPlanDB _enumerateFatalFailuresOfType:error:enumerator:]", "MBRestorePlanDB.m", 2449, "error");
  }
  unsigned int v10 = v9;
  if (!v9) {
    __assert_rtn("-[_ROPlanDB _enumerateFatalFailuresOfType:error:enumerator:]", "MBRestorePlanDB.m", 2450, "enumerator");
  }
  id v11 = [(MBSQLiteDB *)self fetchSQL:@"\nSELECT\n  E.errorID, \n\n   E.errorDomain, \n   E.errorCode, \n   E.description, \n   E.timestamp, \n\n   E.count, \n   D.domain, \n   R.relativePath, \n   E.inode\n FROM  Errors AS E\n\n  LEFT JOIN Domains AS D\n    ON E.domainID = D.domainID\n  LEFT JOIN Restorables AS R\n    ON E.restorableID = R.restorableID\n\n  JOIN FatalErrorRelationships AS F\n    ON E.errorID = F.errorID\n WHERE F.parentErrorID IS NULL"];;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BACFC;
  v15[3] = &unk_100416FD8;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  unsigned __int8 v13 = [v11 enumerateWithError:a4 block:v15];

  return v13;
}

- (BOOL)_enumerateNonFatalFailuresOfType:(id)a3 error:(id *)a4 enumerator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!a4) {
    __assert_rtn("-[_ROPlanDB _enumerateNonFatalFailuresOfType:error:enumerator:]", "MBRestorePlanDB.m", 2485, "error");
  }
  unsigned int v10 = v9;
  if (!v9) {
    __assert_rtn("-[_ROPlanDB _enumerateNonFatalFailuresOfType:error:enumerator:]", "MBRestorePlanDB.m", 2486, "enumerator");
  }
  id v11 = [(MBSQLiteDB *)self fetchSQL:@"\nSELECT\n\n   E.errorDomain, \n   E.errorCode, \n   E.description, \n   E.timestamp, \n\n   E.count, \n   D.domain, \n   R.relativePath, \n   E.inode\n FROM  Errors AS E\n\n  LEFT JOIN Domains AS D\n    ON E.domainID = D.domainID\n  LEFT JOIN Restorables AS R\n    ON E.restorableID = R.restorableID\n WHERE E.errorID NOT IN (\n    SELECT errorID FROM FatalErrorRelationships\n)"];;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BAFA4;
  v15[3] = &unk_100413728;
  id v16 = v10;
  id v12 = v10;
  unsigned __int8 v13 = [v11 enumerateWithError:a4 block:v15];

  return v13;
}

@end