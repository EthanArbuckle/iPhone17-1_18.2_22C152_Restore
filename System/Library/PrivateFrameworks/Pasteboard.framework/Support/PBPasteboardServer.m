@interface PBPasteboardServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)pasteboardServiceListener;
- (NSXPCListener)userActivityListener;
- (PBDataDetectiveAgency)detectiveAgency;
- (PBPasteAuthority)pasteAuthority;
- (PBPasteNotifying)pasteNotifier;
- (PBPasteboardServer)init;
- (UISSlotMachine)pasteButtonSlotMachine;
- (void)setDetectiveAgency:(id)a3;
- (void)setPasteAuthority:(id)a3;
- (void)setPasteButtonSlotMachine:(id)a3;
- (void)setPasteNotifier:(id)a3;
- (void)setPasteboardServiceListener:(id)a3;
- (void)setUserActivityListener:(id)a3;
- (void)start;
@end

@implementation PBPasteboardServer

- (PBPasteboardServer)init
{
  v23.receiver = self;
  v23.super_class = (Class)PBPasteboardServer;
  v2 = [(PBPasteboardServer *)&v23 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.pasteboard.pasted"];
    pasteboardServiceListener = v2->_pasteboardServiceListener;
    v2->_pasteboardServiceListener = v3;

    [(NSXPCListener *)v2->_pasteboardServiceListener setDelegate:v2];
    v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.coreservices.uauseractivitypasteboardclient.xpc"];
    userActivityListener = v2->_userActivityListener;
    v2->_userActivityListener = v5;

    [(NSXPCListener *)v2->_userActivityListener setDelegate:v2];
    v7 = [PBDataDetectiveAgency alloc];
    v8 = objc_alloc_init(PBProbableWebDataDetective);
    v24[0] = v8;
    v9 = objc_alloc_init(PBNumberDataDetective);
    v24[1] = v9;
    v10 = objc_alloc_init(PBDataDetectorsDetective);
    v24[2] = v10;
    v11 = +[NSArray arrayWithObjects:v24 count:3];
    v12 = [(PBDataDetectiveAgency *)v7 initWithDetectives:v11];
    detectiveAgency = v2->_detectiveAgency;
    v2->_detectiveAgency = v12;

    id v14 = objc_alloc((Class)UISSlotMachine);
    v15 = objc_alloc_init(PBPasteButtonDrawer);
    v16 = (UISSlotMachine *)[v14 initWithSlotDrawer:v15 options:3];
    pasteButtonSlotMachine = v2->_pasteButtonSlotMachine;
    v2->_pasteButtonSlotMachine = v16;

    v18 = objc_alloc_init(PBPasteAuthority);
    pasteAuthority = v2->_pasteAuthority;
    v2->_pasteAuthority = v18;

    v20 = objc_alloc_init(PBDruidRemotePasteNotifier);
    pasteNotifier = v2->_pasteNotifier;
    v2->_pasteNotifier = (PBPasteNotifying *)v20;
  }
  return v2;
}

- (void)start
{
  [(NSXPCListener *)self->_pasteboardServiceListener resume];
  userActivityListener = self->_userActivityListener;
  [(NSXPCListener *)userActivityListener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PBPasteboardServer *)self pasteboardServiceListener];

  if (v8 == v6)
  {
    id v11 = +[PBPasteboardServerServicer newServicerForConnection:v7 detectiveAgency:self->_detectiveAgency pasteButtonSlotMachine:self->_pasteButtonSlotMachine pasteAuthority:self->_pasteAuthority pasteNotifier:self->_pasteNotifier];
LABEL_6:

    [v7 resume];
    BOOL v10 = 1;
    goto LABEL_7;
  }
  id v9 = [(PBPasteboardServer *)self userActivityListener];

  if (v9 == v6)
  {
    id v11 = +[PBUserActivityServicer newServicerForConnection:v7];
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (NSXPCListener)pasteboardServiceListener
{
  return self->_pasteboardServiceListener;
}

- (void)setPasteboardServiceListener:(id)a3
{
}

- (NSXPCListener)userActivityListener
{
  return self->_userActivityListener;
}

- (void)setUserActivityListener:(id)a3
{
}

- (PBDataDetectiveAgency)detectiveAgency
{
  return self->_detectiveAgency;
}

- (void)setDetectiveAgency:(id)a3
{
}

- (UISSlotMachine)pasteButtonSlotMachine
{
  return self->_pasteButtonSlotMachine;
}

- (void)setPasteButtonSlotMachine:(id)a3
{
}

- (PBPasteAuthority)pasteAuthority
{
  return self->_pasteAuthority;
}

- (void)setPasteAuthority:(id)a3
{
}

- (PBPasteNotifying)pasteNotifier
{
  return self->_pasteNotifier;
}

- (void)setPasteNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteNotifier, 0);
  objc_storeStrong((id *)&self->_pasteAuthority, 0);
  objc_storeStrong((id *)&self->_pasteButtonSlotMachine, 0);
  objc_storeStrong((id *)&self->_detectiveAgency, 0);
  objc_storeStrong((id *)&self->_userActivityListener, 0);
  objc_storeStrong((id *)&self->_pasteboardServiceListener, 0);
}

@end