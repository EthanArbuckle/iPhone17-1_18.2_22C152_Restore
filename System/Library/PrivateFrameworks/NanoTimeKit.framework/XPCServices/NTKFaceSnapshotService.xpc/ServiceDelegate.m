@interface ServiceDelegate
+ (id)sharedQueue;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

+ (id)sharedQueue
{
  if (qword_100008840 != -1) {
    dispatch_once(&qword_100008840, &stru_100004288);
  }
  v2 = (void *)qword_100008838;
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NTKFaceSnapshotServiceProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  v7 = +[ServiceDelegate sharedQueue];
  [v4 _setQueue:v7];

  [v4 resume];
  return 1;
}

@end