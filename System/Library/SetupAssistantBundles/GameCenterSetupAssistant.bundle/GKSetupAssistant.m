@interface GKSetupAssistant
- (BOOL)cancelled;
- (id)accountSetupRequestParameters;
- (id)delegateServiceIdentifier;
- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setupOperationFailed;
@end

@implementation GKSetupAssistant

- (id)delegateServiceIdentifier
{
  return GKGameCenterIdentifier;
}

- (id)accountSetupRequestParameters
{
  v3 = +[GKDevice currentDevice];
  v4 = [v3 udid];

  v5 = [(GKSetupAssistant *)self _gkAuthenticatedPlayerID];
  v6 = +[NSMutableDictionary dictionary];
  v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:@"player-id"];
  }
  if (v4) {
    [v7 setObject:v4 forKey:@"device-id"];
  }

  return v7;
}

- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GKSetupAssistant *)self setCancelled:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_38F8;
  v9[3] = &unk_4090;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(GKSetupAssistant *)self _gkSetupAccountWithParamaters:v7 completionHandler:v9];
}

- (void)setupOperationFailed
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end