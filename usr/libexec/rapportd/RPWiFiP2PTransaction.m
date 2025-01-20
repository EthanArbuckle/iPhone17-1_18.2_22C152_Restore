@interface RPWiFiP2PTransaction
+ (id)sharedInstance;
- (NSMutableSet)activeClients;
- (void)activateForClient:(id)a3;
- (void)invalidateForClient:(id)a3;
@end

@implementation RPWiFiP2PTransaction

+ (id)sharedInstance
{
  if (qword_100142E40 != -1) {
    dispatch_once(&qword_100142E40, &stru_100123988);
  }
  v2 = (void *)qword_100142E48;

  return v2;
}

- (void)activateForClient:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100079A04;
  v11[3] = &unk_1001219D0;
  v11[4] = self;
  id v4 = a3;
  id v12 = v4;
  v5 = objc_retainBlock(v11);
  v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NSMutableSet *)v6->_activeClients count];
  objc_sync_exit(v6);

  if (!v7)
  {
    v8 = [(objc_class *)off_100141E50() shared];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100079AF4;
    v9[3] = &unk_1001239B0;
    v9[4] = v6;
    id v10 = v4;
    [v8 beginTransaction:4 completionHandler:v9];
  }
  ((void (*)(void *))v5[2])(v5);
}

- (void)invalidateForClient:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (![(NSMutableSet *)v4->_activeClients count]) {
    goto LABEL_20;
  }
  if (([(NSMutableSet *)v4->_activeClients containsObject:v7] & 1) == 0)
  {
    if (dword_100141DE0 > 10 || dword_100141DE0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_20;
    }
LABEL_8:
    LogPrintF();
LABEL_20:
    objc_sync_exit(v4);

    goto LABEL_21;
  }
  [(NSMutableSet *)v4->_activeClients removeObject:v7];
  if (dword_100141DE0 <= 30 && (dword_100141DE0 != -1 || _LogCategory_Initialize()))
  {
    id v6 = v7;
    LogPrintF();
  }
  if ([(NSMutableSet *)v4->_activeClients count])
  {
    if (dword_100141DE0 > 30 || dword_100141DE0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_20;
    }
    goto LABEL_8;
  }
  objc_sync_exit(v4);

  v5 = [(objc_class *)off_100141E50() shared];
  [v5 endTransaction:4];

  if (dword_100141DE0 <= 30 && (dword_100141DE0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:
}

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void).cxx_destruct
{
}

@end