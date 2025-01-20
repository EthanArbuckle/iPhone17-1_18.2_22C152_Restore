@interface MBAppGroup
- (id)domain;
@end

@implementation MBAppGroup

- (id)domain
{
  v3 = [(MBContainer *)self identifier];
  v4 = [(MBContainer *)self volumeMountPoint];
  v5 = [(MBContainer *)self containerDir];
  v6 = +[MBDomain appGroupDomainWithIdentifier:v3 volumeMountPoint:v4 rootPath:v5];

  if (qword_100482968 != -1) {
    dispatch_once(&qword_100482968, &stru_100418058);
  }
  [v6 setRelativePathsToBackupAndRestore:qword_100482960];
  if (qword_100482978 != -1) {
    dispatch_once(&qword_100482978, &stru_100418078);
  }
  [v6 setRelativePathsNotToBackup:qword_100482970];
  if (qword_100482988 != -1) {
    dispatch_once(&qword_100482988, &stru_100418098);
  }
  [v6 setRelativePathsNotToRestore:qword_100482980];
  [v6 setShouldDigest:0];
  return v6;
}

@end