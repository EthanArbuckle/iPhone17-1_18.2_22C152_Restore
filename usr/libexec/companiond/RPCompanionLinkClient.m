@interface RPCompanionLinkClient
- (void)cad_registerEventID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6;
- (void)cad_registerRequestID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6;
@end

@implementation RPCompanionLinkClient

- (void)cad_registerRequestID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013D34;
  v10[3] = &unk_100034EA8;
  BOOL v12 = a5;
  id v11 = a6;
  id v9 = v11;
  [(RPCompanionLinkClient *)self registerRequestID:a3 options:a4 handler:v10];
}

- (void)cad_registerEventID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013F5C;
  v10[3] = &unk_100034ED0;
  BOOL v12 = a5;
  id v11 = a6;
  id v9 = v11;
  [(RPCompanionLinkClient *)self registerEventID:a3 options:a4 handler:v10];
}

@end