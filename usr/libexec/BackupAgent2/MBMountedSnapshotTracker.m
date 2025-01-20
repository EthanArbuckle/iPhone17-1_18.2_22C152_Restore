@interface MBMountedSnapshotTracker
- (MBMountedSnapshotTracker)init;
- (NSArray)mountedSnapshots;
- (id)snapshotMountPointForVolumeMountPoint:(id)a3;
- (void)trackSnapshotForVolume:(id)a3 snapshotName:(id)a4 mountPoint:(id)a5;
@end

@implementation MBMountedSnapshotTracker

- (MBMountedSnapshotTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)MBMountedSnapshotTracker;
  v2 = [(MBMountedSnapshotTracker *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mountedSnapshots = v2->_mountedSnapshots;
    v2->_mountedSnapshots = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    snapshotMountPointsByVolume = v2->_snapshotMountPointsByVolume;
    v2->_snapshotMountPointsByVolume = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)trackSnapshotForVolume:(id)a3 snapshotName:(id)a4 mountPoint:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  [v10 setSnapshotName:v8];
  [v10 setVolumeMountPoint:v11];
  [v10 setSnapshotMountPoint:v9];
  [(NSMutableArray *)self->_mountedSnapshots addObject:v10];
  [(NSMutableDictionary *)self->_snapshotMountPointsByVolume objectForKeyedSubscript:v11];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10009A940();
  }
  [(NSMutableDictionary *)self->_snapshotMountPointsByVolume setObject:v9 forKeyedSubscript:v11];
}

- (id)snapshotMountPointForVolumeMountPoint:(id)a3
{
  return [(NSMutableDictionary *)self->_snapshotMountPointsByVolume objectForKeyedSubscript:a3];
}

- (NSArray)mountedSnapshots
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotMountPointsByVolume, 0);

  objc_storeStrong((id *)&self->_mountedSnapshots, 0);
}

@end