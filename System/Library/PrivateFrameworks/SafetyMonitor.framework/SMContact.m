@interface SMContact
- (NSData)allowReadToken;
- (NSData)safetyCacheKey;
- (NSData)sharingInvitationData;
- (NSDate)syncDate;
- (NSString)participantID;
- (NSURL)shareURL;
- (NSUUID)identifier;
- (NSUUID)sessionUUID;
- (SMContact)initWithIdentifier:(id)a3 sessionID:(id)a4 allowReadToken:(id)a5 safetyCacheKey:(id)a6 syncDate:(id)a7 sharingInvitationData:(id)a8 shareURL:(id)a9 participantID:(id)a10;
- (void)setAllowReadToken:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setSafetyCacheKey:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setSharingInvitationData:(id)a3;
- (void)setSyncDate:(id)a3;
@end

@implementation SMContact

- (SMContact)initWithIdentifier:(id)a3 sessionID:(id)a4 allowReadToken:(id)a5 safetyCacheKey:(id)a6 syncDate:(id)a7 sharingInvitationData:(id)a8 shareURL:(id)a9 participantID:(id)a10
{
  id v17 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  if (v17)
  {
    v30.receiver = self;
    v30.super_class = (Class)SMContact;
    v18 = [(SMContact *)&v30 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_identifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 6, a8);
      objc_storeStrong(p_isa + 7, a9);
      objc_storeStrong(p_isa + 8, a10);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSData)allowReadToken
{
  return self->_allowReadToken;
}

- (void)setAllowReadToken:(id)a3
{
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (void)setSafetyCacheKey:(id)a3
{
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (void)setSyncDate:(id)a3
{
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void)setSharingInvitationData:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_allowReadToken, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end