@interface WatchDebugController
+ (id)navigationDestinationTitle;
- (WatchDebugController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDirectionsStatusWithCompletionHandler:(id)a3;
@end

@implementation WatchDebugController

+ (id)navigationDestinationTitle
{
  return @"Paired Watch";
}

- (WatchDebugController)init
{
  v30.receiver = self;
  v30.super_class = (Class)WatchDebugController;
  v2 = [(AuxiliaryDebugViewController *)&v30 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.nanomaps.xpc.Maps" options:0];
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCDaemonControlling];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCAppControlling];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v6];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection resume];
    id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v7 sizeToFit];
    v8 = [(WatchDebugController *)v2 tableView];
    [v8 setTableHeaderView:v7];

    [v7 startAnimating];
    objc_initWeak(&location, v2);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1009A1E8C;
    v25[3] = &unk_1012F6B00;
    objc_copyWeak(&v28, &location);
    v9 = v2;
    v26 = v9;
    id v10 = v7;
    id v27 = v10;
    v11 = objc_retainBlock(v25);
    v12 = v2->_connection;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1009A2054;
    v23[3] = &unk_1012E76C0;
    v13 = v11;
    id v24 = v13;
    v14 = [(NSXPCConnection *)v12 remoteObjectProxyWithErrorHandler:v23];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1009A2114;
    v19[3] = &unk_101312A28;
    objc_copyWeak(&v22, &location);
    v15 = v13;
    id v21 = v15;
    id v16 = v10;
    id v20 = v16;
    [v14 _debug_fetchServerConfiguration:v19];

    v17 = v9;
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)WatchDebugController;
  [(MapsDebugValuesViewController *)&v4 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2 * (self->_debugInfo != 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return @"Active Tile Group";
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = @"Copy diagnostic information to the pasteboard. Maps must be in the foreground on the paired Watch";
  }
  else if (a4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2) {
    return 0;
  }
  else {
    return qword_100F72D78[a4];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  [a4 section:a3];
  if (v5 == (id)1)
  {
    id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    [v6 setAccessoryView:0];
    v12 = +[UIColor blackColor];
    v13 = [v6 textLabel];
    [v13 setTextColor:v12];

    v9 = [v6 textLabel];
    [v9 setText:@"Copy Diagnostics"];
    goto LABEL_5;
  }
  if (!v5)
  {
    id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    [v6 setAccessoryView:0];
    id v7 = +[UIColor blackColor];
    v8 = [v6 textLabel];
    [v8 setTextColor:v7];

    [v6 setSelectionStyle:0];
    v9 = [(GEOActiveTileGroup *)self->_activeTileGroup releaseInfo];
    id v10 = +[NSString stringWithFormat:@"%@ - %i", v9, [(GEOActiveTileGroup *)self->_activeTileGroup identifier]];
    v11 = [v6 textLabel];
    [v11 setText:v10];

LABEL_5:
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if ([v7 section] == (id)1)
  {
    v8 = [v6 cellForRowAtIndexPath:v7];
    id v9 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v9 sizeToFit];
    [v8 setAccessoryView:v9];
    [v9 startAnimating];
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1009A28DC;
    v27[3] = &unk_101312A50;
    objc_copyWeak(&v31, &location);
    id v10 = v9;
    id v28 = v10;
    id v11 = v8;
    id v29 = v11;
    objc_super v30 = self;
    v12 = objc_retainBlock(v27);
    connection = self->_connection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1009A29D8;
    v25[3] = &unk_1012E76C0;
    v14 = v12;
    id v26 = v14;
    v15 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1009A2A98;
    v19[3] = &unk_101312AA0;
    objc_copyWeak(&v24, &location);
    id v16 = v14;
    id v23 = v16;
    id v17 = v10;
    id v20 = v17;
    id v18 = v11;
    id v21 = v18;
    id v22 = self;
    [v15 _debug_fetchDiagnosticsString:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

- (void)updateDirectionsStatusWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);

  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end