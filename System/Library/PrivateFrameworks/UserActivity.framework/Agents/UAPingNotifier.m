@interface UAPingNotifier
- (BOOL)active;
- (NSMutableSet)pongItems;
- (UAPingNotifier)initWithManager:(id)a3;
- (id)items;
- (id)statusString;
- (int64_t)pongCount;
- (void)setItems:(id)a3;
- (void)setPongCount:(int64_t)a3;
@end

@implementation UAPingNotifier

- (UAPingNotifier)initWithManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UAPingNotifier;
  v3 = [(UAActivityNotifier *)&v7 initWithManager:a3 name:@"PingNotifier"];
  if (v3)
  {
    uint64_t v4 = +[NSMutableSet set];
    pongItems = v3->_pongItems;
    v3->_pongItems = (NSMutableSet *)v4;
  }
  return v3;
}

- (BOOL)active
{
  return 0;
}

- (id)items
{
  return 0;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  v5 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v6 = [v5 debugEnablePinging];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [v12 activityType];
          unsigned int v14 = [v13 isEqual:@"com.apple.ping"];

          if (v14)
          {
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_10000FEBC;
            v15[3] = &unk_1000C4CC8;
            v15[4] = v12;
            v15[5] = self;
            [v12 requestPayloadWithCompletionHandler:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (id)statusString
{
  v3 = [(UAPingNotifier *)self pongItems];
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"PingNotifier: %ld outstanding PONG responses; %ld total pongs sent.",
    [v3 count],
  id v4 = [(UAPingNotifier *)self pongCount]);

  id v5 = [v4 copy];

  return v5;
}

- (NSMutableSet)pongItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)pongCount
{
  return self->_pongCount;
}

- (void)setPongCount:(int64_t)a3
{
  self->_pongCount = a3;
}

- (void).cxx_destruct
{
}

@end