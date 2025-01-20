@interface FCCKPrivateDatabaseCKPayload
@end

@implementation FCCKPrivateDatabaseCKPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end