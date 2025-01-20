@interface STFamilyMember
- (BOOL)isMe;
- (BOOL)isOrganizer;
- (BOOL)isParent;
- (NSNumber)DSID;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)memberType;
- (STFamilyMember)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 memberType:(id)a6 firstName:(id)a7 lastName:(id)a8 isMe:(BOOL)a9 isParent:(BOOL)a10 isOrganizer:(BOOL)a11;
- (id)description;
- (void)setIsMe:(BOOL)a3;
- (void)setIsOrganizer:(BOOL)a3;
- (void)setIsParent:(BOOL)a3;
@end

@implementation STFamilyMember

- (STFamilyMember)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 memberType:(id)a6 firstName:(id)a7 lastName:(id)a8 isMe:(BOOL)a9 isParent:(BOOL)a10 isOrganizer:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)STFamilyMember;
  v23 = [(STFamilyMember *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    DSID = v23->_DSID;
    v23->_DSID = (NSNumber *)v24;

    uint64_t v26 = [v18 copy];
    altDSID = v23->_altDSID;
    v23->_altDSID = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    appleID = v23->_appleID;
    v23->_appleID = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    memberType = v23->_memberType;
    v23->_memberType = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    firstName = v23->_firstName;
    v23->_firstName = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    lastName = v23->_lastName;
    v23->_lastName = (NSString *)v34;

    v23->_isMe = a9;
    v23->_isParent = a10;
    v23->_isOrganizer = a11;
  }

  return v23;
}

- (id)description
{
  v3 = NSString;
  v4 = [(STFamilyMember *)self firstName];
  v5 = [(STFamilyMember *)self lastName];
  v6 = [(STFamilyMember *)self DSID];
  v7 = [(STFamilyMember *)self altDSID];
  v8 = [(STFamilyMember *)self appleID];
  v9 = [(STFamilyMember *)self memberType];
  v10 = [v3 stringWithFormat:@"Name: %@ %@ DSID: %@, altDSID: %@, AppleID: %@ MemberType: %@ Me: %d Parent: %d, Organizer: %d", v4, v5, v6, v7, v8, v9, -[STFamilyMember isMe](self, "isMe"), -[STFamilyMember isParent](self, "isParent"), -[STFamilyMember isOrganizer](self, "isOrganizer")];

  return v10;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)memberType
{
  return self->_memberType;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (void)setIsParent:(BOOL)a3
{
  self->_isParent = a3;
}

- (BOOL)isOrganizer
{
  return self->_isOrganizer;
}

- (void)setIsOrganizer:(BOOL)a3
{
  self->_isOrganizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_memberType, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end