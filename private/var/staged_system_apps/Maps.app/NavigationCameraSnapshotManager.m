@interface NavigationCameraSnapshotManager
+ (BOOL)archiveTraceSnapshotsDictionary:(id)a3 toFile:(id)a4;
+ (id)sharedInstance;
+ (id)traceSnapshotsDictionaryWithContentsOfArchiveFile:(id)a3;
- (NSMutableDictionary)traceSnapshotsDictionary;
- (NSString)archivePath;
- (NavigationCameraSnapshotManager)init;
- (NavigationCameraSnapshotManager)initWithTraceSnapshotsDictionaryArchiveFile:(id)a3;
- (NavigationCameraSnapshotsObserver)snapshotsObserver;
- (id)_cameraSnapshotComparator;
- (id)cameraSnapshotsOfTraceFile:(id)a3;
- (void)_commitTraceSnapshotsDictionaryToArchive;
- (void)addCameraSnapshot:(id)a3 toTraceFile:(id)a4;
- (void)removeCameraSnapshotAtIndex:(unint64_t)a3 fromTraceFile:(id)a4;
- (void)setSnapshotsObserver:(id)a3;
@end

@implementation NavigationCameraSnapshotManager

+ (id)sharedInstance
{
  if (qword_1016110A8 != -1) {
    dispatch_once(&qword_1016110A8, &stru_101322B18);
  }
  v2 = (void *)qword_1016110A0;

  return v2;
}

+ (id)traceSnapshotsDictionaryWithContentsOfArchiveFile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  v8 = +[NSData dataWithContentsOfFile:v3];

  v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v8 error:0];

  return v9;
}

+ (BOOL)archiveTraceSnapshotsDictionary:(id)a3 toFile:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  unsigned __int8 v7 = [v6 writeToFile:v5 atomically:1];

  return v7;
}

- (NavigationCameraSnapshotManager)init
{
  id v3 = +[TraceManager sharedManager];
  uint64_t v4 = [v3 tracesDirectoryWithTraceType:0];
  id v5 = [v4 stringByAppendingPathComponent:@"NavigationCameraSnapshots.plist"];

  uint64_t v6 = [(NavigationCameraSnapshotManager *)self initWithTraceSnapshotsDictionaryArchiveFile:v5];
  return v6;
}

- (NavigationCameraSnapshotManager)initWithTraceSnapshotsDictionaryArchiveFile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavigationCameraSnapshotManager;
  id v5 = [(NavigationCameraSnapshotManager *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByDeletingLastPathComponent];
    if (([v6 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v7 = [v6 stringByAppendingString:@"/"];

      uint64_t v6 = (void *)v7;
    }
    v8 = +[NSFileManager defaultManager];
    unsigned int v9 = [v8 isWritableFileAtPath:v6];

    if (v9)
    {
      v10 = (NSString *)[v4 copy];
      archivePath = v5->_archivePath;
      v5->_archivePath = v10;

      v12 = v5;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (NSMutableDictionary)traceSnapshotsDictionary
{
  traceSnapshotsDictionary = self->_traceSnapshotsDictionary;
  if (!traceSnapshotsDictionary)
  {
    id v4 = objc_opt_class();
    id v5 = [(NavigationCameraSnapshotManager *)self archivePath];
    uint64_t v6 = [v4 traceSnapshotsDictionaryWithContentsOfArchiveFile:v5];

    uint64_t v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v6 count]];
    v8 = self->_traceSnapshotsDictionary;
    self->_traceSnapshotsDictionary = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D41DFC;
    v10[3] = &unk_101322B40;
    v10[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];

    traceSnapshotsDictionary = self->_traceSnapshotsDictionary;
  }

  return traceSnapshotsDictionary;
}

- (id)cameraSnapshotsOfTraceFile:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if ([v6 count])
  {
    uint64_t v7 = +[NSArray arrayWithArray:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)addCameraSnapshot:(id)a3 toTraceFile:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  uint64_t v7 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  id v8 = [v7 objectForKeyedSubscript:v15];

  if (!v8)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v9 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
    [v9 setObject:v8 forKeyedSubscript:v15];
  }
  id v10 = [v8 count];
  v11 = [(NavigationCameraSnapshotManager *)self _cameraSnapshotComparator];
  id v12 = [v8 indexOfObject:v6 inSortedRange:0 options:v10 usingComparator:1536];

  [v8 insertObject:v6 atIndex:v12];
  id v13 = [v8 objectAtIndexedSubscript:v12];

  if (v13 == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotsObserver);
    [WeakRetained cameraSnapshotsManager:self didInsertAtIndex:v12 toTraceFile:v15];

    [(NavigationCameraSnapshotManager *)self _commitTraceSnapshotsDictionaryToArchive];
  }
}

- (void)removeCameraSnapshotAtIndex:(unint64_t)a3 fromTraceFile:(id)a4
{
  id v9 = a4;
  id v6 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:v9];

  if ((unint64_t)[v7 count] > a3)
  {
    [v7 removeObjectAtIndex:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotsObserver);
    [WeakRetained cameraSnapshotsManager:self didRemoveAtIndex:a3 fromTraceFile:v9];

    [(NavigationCameraSnapshotManager *)self _commitTraceSnapshotsDictionaryToArchive];
  }
}

- (void)_commitTraceSnapshotsDictionaryToArchive
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  id v5 = [v3 initWithCapacity:[v4 count]];

  id v6 = objc_alloc((Class)NSMutableArray);
  uint64_t v7 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  id v8 = [v6 initWithCapacity:[v7 count]];

  id v9 = [(NavigationCameraSnapshotManager *)self traceSnapshotsDictionary];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100D422E4;
  v19 = &unk_101322B68;
  id v20 = v5;
  id v21 = v8;
  id v10 = v8;
  id v11 = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:&v16];

  id v12 = objc_alloc((Class)NSDictionary);
  id v13 = [v12 initWithObjects:v10, v11, v16, v17, v18, v19];
  objc_super v14 = objc_opt_class();
  id v15 = [(NavigationCameraSnapshotManager *)self archivePath];
  [v14 archiveTraceSnapshotsDictionary:v13 toFile:v15];
}

- (id)_cameraSnapshotComparator
{
  return &stru_101322BA8;
}

- (NavigationCameraSnapshotsObserver)snapshotsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotsObserver);

  return (NavigationCameraSnapshotsObserver *)WeakRetained;
}

- (void)setSnapshotsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotsObserver);
  objc_storeStrong((id *)&self->_traceSnapshotsDictionary, 0);

  objc_storeStrong((id *)&self->_archivePath, 0);
}

@end