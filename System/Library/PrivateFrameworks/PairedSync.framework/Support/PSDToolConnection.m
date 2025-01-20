@interface PSDToolConnection
- (id)services;
- (void)cancelSyncSession;
- (void)getOrderedActivityInfosWithCompletion:(id)a3;
@end

@implementation PSDToolConnection

- (id)services
{
  v2 = PSYGetClientListDirectory();
  v3 = sub_10001A0A8(v2);

  return v3;
}

- (void)getOrderedActivityInfosWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(PSDToolConnection *)self services];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)cancelSyncSession
{
  id v2 = +[PSDScheduler sharedScheduler];
  [v2 cancelSyncSession];
}

@end