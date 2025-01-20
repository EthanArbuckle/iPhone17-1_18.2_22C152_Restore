@interface PSYWatchSyncState
- (BOOL)isEqual:(id)a3;
- (NSString)activityLabel;
- (PSYWatchSyncState)initWithActivityLabel:(id)a3 globalProgress:(int64_t)a4 syncProgressState:(unint64_t)a5;
- (PSYWatchSyncState)initWithPlistRepresentation:(id)a3;
- (id)description;
- (id)plistRepresentation;
- (int64_t)globalProgress;
- (unint64_t)hash;
- (unint64_t)syncProgressState;
- (unint64_t)version;
@end

@implementation PSYWatchSyncState

- (PSYWatchSyncState)initWithActivityLabel:(id)a3 globalProgress:(int64_t)a4 syncProgressState:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSYWatchSyncState;
  v10 = [(PSYWatchSyncState *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activityLabel, a3);
    v11->_globalProgress = a4;
    v11->_syncProgressState = a5;
    v11->_version = 1;
  }

  return v11;
}

- (PSYWatchSyncState)initWithPlistRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSYWatchSyncState;
  v5 = [(PSYWatchSyncState *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"activityLabel"];
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"version"];
    v5->_version = (unint64_t)[v8 unsignedIntegerValue];

    id v9 = [v4 objectForKeyedSubscript:@"syncProgressState"];
    v5->_syncProgressState = (unint64_t)[v9 unsignedIntegerValue];

    v10 = [v4 objectForKeyedSubscript:@"globalProgress"];
    v5->_globalProgress = (int64_t)[v10 integerValue];
  }
  return v5;
}

- (id)plistRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(PSYWatchSyncState *)self version]];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(PSYWatchSyncState *)self syncProgressState]];
  [v3 setObject:v5 forKeyedSubscript:@"syncProgressState"];

  uint64_t v6 = +[NSNumber numberWithInteger:[(PSYWatchSyncState *)self globalProgress]];
  [v3 setObject:v6 forKeyedSubscript:@"globalProgress"];

  v7 = [(PSYWatchSyncState *)self activityLabel];

  if (v7)
  {
    v8 = [(PSYWatchSyncState *)self activityLabel];
    [v3 setObject:v8 forKeyedSubscript:@"activityLabel"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PSYWatchSyncState *)self syncProgressState];
  unint64_t v4 = [(PSYWatchSyncState *)self globalProgress] ^ v3;
  v5 = [(PSYWatchSyncState *)self activityLabel];
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PSYWatchSyncState *)self globalProgress];
    if (v6 == [v5 globalProgress]
      && (id v7 = [(PSYWatchSyncState *)self syncProgressState],
          v7 == [v5 syncProgressState]))
    {
      v8 = [(PSYWatchSyncState *)self activityLabel];
      id v9 = [v5 activityLabel];
      if (v8 == v9)
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        v10 = [(PSYWatchSyncState *)self activityLabel];
        v11 = [v5 activityLabel];
        unsigned __int8 v12 = [v10 isEqualToString:v11];
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(PSYWatchSyncState *)self activityLabel];
  unint64_t v6 = [(PSYWatchSyncState *)self syncProgressState];
  if (v6 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_10002CE20 + v6);
  }
  v8 = +[NSNumber numberWithInteger:[(PSYWatchSyncState *)self globalProgress]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p activityLabel=%@; syncProgressState=%@; globalProgress=%@>",
    v4,
    self,
    v5,
    v7,
  id v9 = v8);

  return v9;
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (int64_t)globalProgress
{
  return self->_globalProgress;
}

- (unint64_t)syncProgressState
{
  return self->_syncProgressState;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end