@interface CTXPCContextInfo
+ (id)csd_unknownContextInfoForAccountID:(id)a3;
- (BOOL)csd_isTelephony;
- (BOOL)csd_isThumper;
- (BOOL)csd_isUnknown;
@end

@implementation CTXPCContextInfo

+ (id)csd_unknownContextInfoForAccountID:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "csd_UUIDv5");
  if (v4) {
    id v5 = [objc_alloc((Class)CTXPCContextInfo) initWithUUID:v4 andAccountID:v3 andSlot:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)csd_isTelephony
{
  return [(CTXPCContextInfo *)self slotID] != 0;
}

- (BOOL)csd_isThumper
{
  id v3 = [(CTXPCContextInfo *)self accountID];
  if ([v3 length]) {
    BOOL v4 = [(CTXPCContextInfo *)self slotID] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)csd_isUnknown
{
  id v3 = [(CTXPCContextInfo *)self accountID];
  BOOL v7 = [v3 length]
    && (objc_msgSend(v3, "csd_UUIDv5"),
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [(CTXPCContextInfo *)self uuid],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 isEqual:v5],
        v5,
        v4,
        v6)
    && [(CTXPCContextInfo *)self slotID] == 0;

  return v7;
}

@end