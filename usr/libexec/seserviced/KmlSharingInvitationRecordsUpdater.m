@interface KmlSharingInvitationRecordsUpdater
- (KmlSharingInvitationRecordsUpdater)init;
@end

@implementation KmlSharingInvitationRecordsUpdater

- (KmlSharingInvitationRecordsUpdater)init
{
  v8.receiver = self;
  v8.super_class = (Class)KmlSharingInvitationRecordsUpdater;
  v2 = [(KmlSharingInvitationRecordsUpdater *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    invitationIdToRecordMap = v2->_invitationIdToRecordMap;
    v2->_invitationIdToRecordMap = (NSMutableDictionary *)v3;

    uint64_t v5 = sub_1003146F4();
    updaterQueue = v2->_updaterQueue;
    v2->_updaterQueue = (OS_dispatch_queue *)v5;

    sub_10031483C((uint64_t)v2);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterQueue, 0);

  objc_storeStrong((id *)&self->_invitationIdToRecordMap, 0);
}

@end