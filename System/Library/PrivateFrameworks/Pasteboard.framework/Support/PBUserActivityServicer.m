@interface PBUserActivityServicer
+ (id)newServicerForConnection:(id)a3;
- (NSXPCConnection)UAToPasteboardConnection;
- (PBUserActivityServicer)initWithConnection:(id)a3;
- (void)pasteboardWillBeFetched:(id)a3;
- (void)remotePasteboardAvailable:(BOOL)a3;
- (void)setUAToPasteboardConnection:(id)a3;
@end

@implementation PBUserActivityServicer

+ (id)newServicerForConnection:(id)a3
{
  id v3 = a3;
  v4 = [[PBUserActivityServicer alloc] initWithConnection:v3];

  return v4;
}

- (PBUserActivityServicer)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUserActivityServicer;
  v5 = [(PBUserActivityServicer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_UAToPasteboardConnection, v4);
    [v4 setExportedObject:v6];
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UAPasteboardClientProtocol];
    [v4 setExportedInterface:v7];
  }
  return v6;
}

- (void)remotePasteboardAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[PBPasteboardModel sharedModel];
  [v4 _remotePasteboardDidBecomeAvailable:v3];
}

- (void)pasteboardWillBeFetched:(id)a3
{
  id v3 = a3;
  id v4 = +[PBPasteboardModel sharedModel];
  [v4 _remotePasteboardWillBeFetched:v3];
}

- (NSXPCConnection)UAToPasteboardConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_UAToPasteboardConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setUAToPasteboardConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end