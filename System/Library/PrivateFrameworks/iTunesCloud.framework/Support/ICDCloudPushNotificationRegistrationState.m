@interface ICDCloudPushNotificationRegistrationState
- (ICDCloudPushNotificationRegistrationState)initWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (id)registrationStateForAccountDSID:(id)a3;
- (void)setRegistrationState:(id)a3 forAccountDSID:(id)a4;
@end

@implementation ICDCloudPushNotificationRegistrationState

- (void).cxx_destruct
{
}

- (void)setRegistrationState:(id)a3 forAccountDSID:(id)a4
{
}

- (id)registrationStateForAccountDSID:(id)a3
{
  return [(NSMutableDictionary *)self->_accountRegistrationStates objectForKeyedSubscript:a3];
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:1];
  v4 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableDictionary *)self->_accountRegistrationStates count]];
  accountRegistrationStates = self->_accountRegistrationStates;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FBBDC;
  v8[3] = &unk_1001BDEF8;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)accountRegistrationStates enumerateKeysAndObjectsUsingBlock:v8];
  [v3 setObject:v6 forKey:@"accountStates"];

  return v3;
}

- (ICDCloudPushNotificationRegistrationState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(ICDCloudPushNotificationRegistrationState *)self init];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "ic_dictionaryValueForKey:", @"accountStates");
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    accountRegistrationStates = v5->_accountRegistrationStates;
    v5->_accountRegistrationStates = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FBD68;
    v10[3] = &unk_1001BEAC0;
    v11 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
  }
  return v5;
}

@end