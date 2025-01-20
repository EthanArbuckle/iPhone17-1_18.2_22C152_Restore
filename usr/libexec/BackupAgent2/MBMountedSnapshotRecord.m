@interface MBMountedSnapshotRecord
- (NSString)snapshotMountPoint;
- (NSString)snapshotName;
- (NSString)volumeMountPoint;
- (id)description;
- (void)setSnapshotMountPoint:(id)a3;
- (void)setSnapshotName:(id)a3;
- (void)setVolumeMountPoint:(id)a3;
@end

@implementation MBMountedSnapshotRecord

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: %p mtpt:%@ volume:%@ name:%@>", class_getName(v3), self, self->_snapshotMountPoint, self->_volumeMountPoint, self->_snapshotName];
}

- (NSString)snapshotMountPoint
{
  return self->_snapshotMountPoint;
}

- (void)setSnapshotMountPoint:(id)a3
{
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (void)setVolumeMountPoint:(id)a3
{
}

- (NSString)snapshotName
{
  return self->_snapshotName;
}

- (void)setSnapshotName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotName, 0);
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);

  objc_storeStrong((id *)&self->_snapshotMountPoint, 0);
}

@end