@interface PBPasteButtonDrawer
- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
@end

@implementation PBPasteButtonDrawer

- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  return 0;
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001F598;
  v19[3] = &unk_100031D50;
  id v20 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001F600;
  v17[3] = &unk_100031D78;
  id v18 = v20;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001F668;
  v15[3] = &unk_100031DA0;
  id v16 = v18;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F6D0;
  v13[3] = &unk_100031DC8;
  id v14 = v16;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F738;
  v11[3] = &unk_100031DF0;
  id v12 = v14;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F7A8;
  v9[3] = &unk_100031E18;
  id v10 = v12;
  id v6 = v12;
  v7 = [a4 _acceptCalloutBarPasteButtonTagVisit:v19 systemInputAssistantPasteButtonTagVisit:v17 undoInteractionHUDIconPasteButtonTagVisit:v15 undoInteractionHUDTextPasteButtonTagVisit:v13 contextMenuPasteButtonTagVisit:v11 editMenuPasteButtonTagVisit:v9];

  return v7;
}

@end