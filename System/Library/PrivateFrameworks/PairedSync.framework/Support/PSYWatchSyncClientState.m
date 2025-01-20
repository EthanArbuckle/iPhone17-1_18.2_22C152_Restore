@interface PSYWatchSyncClientState
- (BOOL)isEqual:(id)a3;
- (BOOL)migrationSync;
- (NSArray)activeActivityLabels;
- (NSArray)completedActivityLabels;
- (NSSet)activeActivityLabelsSet;
- (NSSet)completedActivityLabelsSet;
- (PSYWatchSyncClientState)initWithPlistRepresentation:(id)a3;
- (PSYWatchSyncClientState)initWithSyncSessionState:(unint64_t)a3 syncSessionType:(unint64_t)a4 migrationSync:(BOOL)a5 activities:(id)a6 completedActivities:(id)a7;
- (id)description;
- (id)plistRepresentation;
- (unint64_t)hash;
- (unint64_t)syncSessionState;
- (unint64_t)syncSessionType;
- (unint64_t)version;
@end

@implementation PSYWatchSyncClientState

- (PSYWatchSyncClientState)initWithSyncSessionState:(unint64_t)a3 syncSessionType:(unint64_t)a4 migrationSync:(BOOL)a5 activities:(id)a6 completedActivities:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PSYWatchSyncClientState;
  v15 = [(PSYWatchSyncClientState *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_syncSessionState = a3;
    v15->_syncSessionType = a4;
    v15->_migrationSync = a5;
    objc_storeStrong((id *)&v15->_activeActivityLabels, a6);
    objc_storeStrong((id *)&v16->_completedActivityLabels, a7);
    v16->_version = 1;
  }

  return v16;
}

- (PSYWatchSyncClientState)initWithPlistRepresentation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSYWatchSyncClientState;
  v5 = [(PSYWatchSyncClientState *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"version"];
    v5->_version = (unint64_t)[v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"syncProgressState"];
    v5->_syncSessionState = (unint64_t)[v7 unsignedIntegerValue];

    v8 = [v4 objectForKeyedSubscript:@"syncSessionType"];
    v5->_syncSessionType = (unint64_t)[v8 unsignedIntegerValue];

    v9 = [v4 objectForKeyedSubscript:@"migrationSync"];
    v5->_migrationSync = [v9 BOOLValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"activeActivityLabels"];
    activeActivityLabels = v5->_activeActivityLabels;
    v5->_activeActivityLabels = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"completedActivityLabels"];
    completedActivityLabels = v5->_completedActivityLabels;
    v5->_completedActivityLabels = (NSArray *)v12;
  }
  return v5;
}

- (NSSet)completedActivityLabelsSet
{
  completedActivityLabelsSet = self->_completedActivityLabelsSet;
  if (!completedActivityLabelsSet)
  {
    if (self->_completedActivityLabels)
    {
      +[NSSet setWithArray:](NSSet, "setWithArray:");
      id v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v5 = self->_completedActivityLabelsSet;
      self->_completedActivityLabelsSet = v4;

      completedActivityLabelsSet = self->_completedActivityLabelsSet;
    }
    else
    {
      completedActivityLabelsSet = 0;
    }
  }

  return completedActivityLabelsSet;
}

- (NSSet)activeActivityLabelsSet
{
  activeActivityLabelsSet = self->_activeActivityLabelsSet;
  if (!activeActivityLabelsSet)
  {
    if (self->_activeActivityLabels)
    {
      +[NSSet setWithArray:](NSSet, "setWithArray:");
      id v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v5 = self->_activeActivityLabelsSet;
      self->_activeActivityLabelsSet = v4;

      activeActivityLabelsSet = self->_activeActivityLabelsSet;
    }
    else
    {
      activeActivityLabelsSet = 0;
    }
  }

  return activeActivityLabelsSet;
}

- (id)plistRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(PSYWatchSyncClientState *)self version]];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(PSYWatchSyncClientState *)self syncSessionState]];
  [v3 setObject:v5 forKeyedSubscript:@"syncProgressState"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(PSYWatchSyncClientState *)self syncSessionType]];
  [v3 setObject:v6 forKeyedSubscript:@"syncSessionType"];

  v7 = +[NSNumber numberWithBool:[(PSYWatchSyncClientState *)self migrationSync]];
  [v3 setObject:v7 forKeyedSubscript:@"migrationSync"];

  v8 = [(PSYWatchSyncClientState *)self activeActivityLabels];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(PSYWatchSyncClientState *)self activeActivityLabels];
    [v3 setObject:v10 forKeyedSubscript:@"activeActivityLabels"];
  }
  v11 = [(PSYWatchSyncClientState *)self completedActivityLabels];
  id v12 = [v11 count];

  if (v12)
  {
    id v13 = [(PSYWatchSyncClientState *)self completedActivityLabels];
    [v3 setObject:v13 forKeyedSubscript:@"completedActivityLabels"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PSYWatchSyncClientState *)self syncSessionState];
  unint64_t v4 = [(PSYWatchSyncClientState *)self syncSessionType] ^ v3;
  uint64_t v5 = [(PSYWatchSyncClientState *)self migrationSync];
  v6 = [(PSYWatchSyncClientState *)self activeActivityLabels];
  unint64_t v7 = v4 ^ (unint64_t)[v6 hash] ^ v5;
  v8 = [(PSYWatchSyncClientState *)self completedActivityLabels];
  unint64_t v9 = v7 ^ (unint64_t)[v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PSYWatchSyncClientState *)self syncSessionState];
    if (v6 == [v5 syncSessionState]
      && (id v7 = [(PSYWatchSyncClientState *)self syncSessionType],
          v7 == [v5 syncSessionType])
      && (unsigned int v8 = [(PSYWatchSyncClientState *)self migrationSync],
          v8 == [v5 migrationSync]))
    {
      v11 = [(PSYWatchSyncClientState *)self activeActivityLabels];
      id v12 = [v5 activeActivityLabels];
      if ([v11 isEqual:v12])
      {
        id v13 = [(PSYWatchSyncClientState *)self completedActivityLabels];
        id v14 = [v5 completedActivityLabels];
        unsigned __int8 v9 = [v13 isEqual:v14];
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(PSYWatchSyncClientState *)self activeActivityLabels];
  id v6 = [(PSYWatchSyncClientState *)self completedActivityLabels];
  id v7 = sub_100018320([(PSYWatchSyncClientState *)self syncSessionState]);
  unint64_t v8 = [(PSYWatchSyncClientState *)self syncSessionType];
  unsigned __int8 v9 = @"Reunion";
  if (v8 != 1) {
    unsigned __int8 v9 = 0;
  }
  if (!v8) {
    unsigned __int8 v9 = @"Full";
  }
  uint64_t v10 = v9;
  unsigned int v11 = [(PSYWatchSyncClientState *)self migrationSync];
  id v12 = "NO";
  if (v11) {
    id v12 = "YES";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p activeActivityLabels=%@; completedActivityLabels=%@; syncSessionState=%@; syncSessionType=%@ migrationSync=%s>",
    v4,
    self,
    v5,
    v6,
    v7,
    v10,
  id v13 = v12);

  return v13;
}

- (NSArray)completedActivityLabels
{
  return self->_completedActivityLabels;
}

- (NSArray)activeActivityLabels
{
  return self->_activeActivityLabels;
}

- (unint64_t)syncSessionState
{
  return self->_syncSessionState;
}

- (unint64_t)syncSessionType
{
  return self->_syncSessionType;
}

- (BOOL)migrationSync
{
  return self->_migrationSync;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActivityLabelsSet, 0);
  objc_storeStrong((id *)&self->_completedActivityLabelsSet, 0);
  objc_storeStrong((id *)&self->_activeActivityLabels, 0);

  objc_storeStrong((id *)&self->_completedActivityLabels, 0);
}

@end