@interface ML3MediaLibraryWriter
- (void)collectDiagnostic:(id)a3;
@end

@implementation ML3MediaLibraryWriter

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  v5 = [(ML3MediaLibraryWriter *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B2FC;
  v7[3] = &unk_10002D8A8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

@end