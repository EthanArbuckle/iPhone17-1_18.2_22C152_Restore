@interface HomeNotificationAction
+ (id)actionsFromArrayOfDictionaries:(id)a3;
- (BOOL)shouldDismiss;
- (HomeNotificationAction)initWithDictionary:(id)a3;
- (NSSet)serviceUUIDs;
- (NSString)identifier;
- (NSString)title;
- (NSString)type;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setServiceUUIDs:(id)a3;
- (void)setShouldDismiss:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HomeNotificationAction

+ (id)actionsFromArrayOfDictionaries:(id)a3
{
  id v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DB7C;
  v8[3] = &unk_100018D58;
  id v9 = (id)objc_opt_new();
  id v4 = v9;
  [v3 enumerateObjectsUsingBlock:v8];

  if ([v4 count]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (HomeNotificationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (qword_10001F138[0] != -1) {
    dispatch_once(qword_10001F138, &stru_100018D78);
  }
  v5 = [v4 allKeys];
  id v6 = +[NSSet setWithArray:v5];

  if ([v6 count] && objc_msgSend((id)qword_10001F130, "intersectsSet:", v6))
  {
    v17.receiver = self;
    v17.super_class = (Class)HomeNotificationAction;
    v7 = [(HomeNotificationAction *)&v17 init];
    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"itemType"];
      [(HomeNotificationAction *)v7 setType:v8];

      id v9 = [v4 objectForKeyedSubscript:@"identifier"];
      [(HomeNotificationAction *)v7 setIdentifier:v9];

      v10 = [v4 objectForKeyedSubscript:@"shouldDismiss"];
      -[HomeNotificationAction setShouldDismiss:](v7, "setShouldDismiss:", [v10 BOOLValue]);

      v11 = [v4 objectForKeyedSubscript:@"services.uuid"];
      v12 = [v11 na_map:&stru_100018D98];
      v13 = +[NSSet setWithArray:v12];
      [(HomeNotificationAction *)v7 setServiceUUIDs:v13];

      v14 = [v4 objectForKeyedSubscript:@"title"];
      [(HomeNotificationAction *)v7 setTitle:v14];
    }
    self = v7;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = [(HomeNotificationAction *)self type];
  id v4 = [(HomeNotificationAction *)self identifier];
  v5 = +[NSNumber numberWithBool:[(HomeNotificationAction *)self shouldDismiss]];
  id v6 = [(HomeNotificationAction *)self serviceUUIDs];
  v7 = [(HomeNotificationAction *)self title];
  v8 = +[NSString stringWithFormat:@"%@-%@-%@-%@-%@", v3, v4, v5, v6, v7];
  id v9 = [v8 hash];

  return (unint64_t)v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSSet)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (void)setServiceUUIDs:(id)a3
{
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (void)setShouldDismiss:(BOOL)a3
{
  self->_shouldDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end