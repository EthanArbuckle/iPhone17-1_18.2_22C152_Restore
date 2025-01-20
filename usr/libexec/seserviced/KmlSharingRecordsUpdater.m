@interface KmlSharingRecordsUpdater
- (KmlSharingRecordsUpdater)initWithEndpoint:(id)a3;
- (NSString)endpointIdentifier;
- (void)setEndpointIdentifier:(id)a3;
@end

@implementation KmlSharingRecordsUpdater

- (KmlSharingRecordsUpdater)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KmlSharingRecordsUpdater;
  v6 = [(KmlSharingRecordsUpdater *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [v5 subjectIdentifier];
    endpointIdentifier = v7->_endpointIdentifier;
    v7->_endpointIdentifier = (NSString *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    invitationIdToConfigMap = v7->_invitationIdToConfigMap;
    v7->_invitationIdToConfigMap = (NSMutableDictionary *)v10;

    uint64_t v12 = sub_100339E34();
    updaterQueue = v7->_updaterQueue;
    v7->_updaterQueue = (OS_dispatch_queue *)v12;

    sub_100339FBC((uint64_t)v7);
  }

  return v7;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_updaterQueue, 0);
  objc_storeStrong((id *)&self->_invitationIdToConfigMap, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end