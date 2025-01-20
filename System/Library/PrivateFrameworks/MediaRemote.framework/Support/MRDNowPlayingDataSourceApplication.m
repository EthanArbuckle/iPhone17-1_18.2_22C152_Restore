@interface MRDNowPlayingDataSourceApplication
- (BOOL)isEligible;
- (MRDNowPlayingDataSourceApplication)initWithPID:(int)a3 audioSessionID:(id)a4 mxSessionIDs:(id)a5 isEligible:(BOOL)a6;
- (NSNumber)audioSessionID;
- (NSSet)mxSessionIDs;
- (NSString)nowPlayingApplicationDisplayID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)pid;
@end

@implementation MRDNowPlayingDataSourceApplication

- (MRDNowPlayingDataSourceApplication)initWithPID:(int)a3 audioSessionID:(id)a4 mxSessionIDs:(id)a5 isEligible:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRDNowPlayingDataSourceApplication;
  v13 = [(MRDNowPlayingDataSourceApplication *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_pid = a3;
    objc_storeStrong((id *)&v13->_audioSessionID, a4);
    objc_storeStrong((id *)&v14->_mxSessionIDs, a5);
    v14->_isEligible = a6;
  }

  return v14;
}

- (id)description
{
  v2 = [(MRDNowPlayingDataSourceApplication *)self dictionaryRepresentation];
  v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(MRDNowPlayingDataSourceApplication *)self nowPlayingApplicationDisplayID];
  [v3 setObject:v4 forKeyedSubscript:@"bundleID"];

  v5 = [(MRDNowPlayingDataSourceApplication *)self audioSessionID];
  [v3 setObject:v5 forKeyedSubscript:@"audioSessionID"];

  v6 = +[NSNumber numberWithInt:[(MRDNowPlayingDataSourceApplication *)self pid]];
  [v3 setObject:v6 forKeyedSubscript:@"pid"];

  v7 = [(MRDNowPlayingDataSourceApplication *)self mxSessionIDs];
  v8 = [v7 allObjects];
  [v3 setObject:v8 forKeyedSubscript:@"mxSessionIDs"];

  return v3;
}

- (NSString)nowPlayingApplicationDisplayID
{
  v2 = sub_10016A160(self->_pid);
  id v3 = [v2 copy];

  return (NSString *)v3;
}

- (int)pid
{
  return self->_pid;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mxSessionIDs, 0);

  objc_storeStrong((id *)&self->_audioSessionID, 0);
}

@end