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

  if (qword_100112F78 != -1) {
    dispatch_once(&qword_100112F78, &stru_1000F18C8);
  }
  [v6 setRelativePathsToBackupAndRestore:qword_100112F70];
  if (qword_100112F88 != -1) {
    dispatch_once(&qword_100112F88, &stru_1000F18E8);
  }
  [v6 setRelativePathsNotToBackup:qword_100112F80];
  if (qword_100112F98 != -1) {
    dispatch_once(&qword_100112F98, &stru_1000F1908);
  }
  [v6 setRelativePathsNotToRestore:qword_100112F90];
  [v6 setShouldDigest:0];

  return v6;
}

@end