@interface PKFamilyMember
+ (BOOL)supportsSecureCoding;
- (BOOL)askToBuyEnabled;
- (BOOL)canSharePeerPaymentAccount;
- (BOOL)hasAppleIDAlias:(id)a3;
- (BOOL)isChildAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFamilyMember:(id)a3;
- (BOOL)isMe;
- (BOOL)isOrganizer;
- (BOOL)isParent;
- (BOOL)parentalControlsEnabled;
- (CNContact)contact;
- (NSDate)dateOfBirth;
- (NSDate)invitationDate;
- (NSDate)joinedDate;
- (NSNumber)dsid;
- (NSSet)appleIDAliases;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)inviteEmail;
- (NSString)lastName;
- (PKFamilyMember)initWithCoder:(id)a3;
- (PKFamilyMember)initWithFAFamilyMember:(id)a3;
- (id)description;
- (id)labelName;
- (int64_t)memberType;
- (int64_t)status;
- (unint64_t)age;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAge:(unint64_t)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAppleIDAliases:(id)a3;
- (void)setAskToBuyEnabled:(BOOL)a3;
- (void)setChildAccount:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setDsid:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setInvitationDate:(id)a3;
- (void)setInviteEmail:(id)a3;
- (void)setJoinedDate:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMe:(BOOL)a3;
- (void)setMemberType:(int64_t)a3;
- (void)setOrganizer:(BOOL)a3;
- (void)setParent:(BOOL)a3;
- (void)setParentalControlsEnabled:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PKFamilyMember

- (PKFamilyMember)initWithFAFamilyMember:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKFamilyMember;
  v6 = [(PKFamilyMember *)&v45 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v6->_member, a3);
  v8 = [v5 statusString];
  v9 = [v8 lowercaseString];
  v10 = v9;
  if (v9 == @"accepted") {
    goto LABEL_5;
  }
  if (!v9) {
    goto LABEL_9;
  }
  char v11 = [(__CFString *)v9 isEqualToString:@"accepted"];

  if (v11)
  {
LABEL_5:
    uint64_t v12 = 2;
    goto LABEL_10;
  }
  v13 = v10;
  if (v13 == @"pending"
    || (v14 = v13,
        int v15 = [(__CFString *)v13 isEqualToString:@"pending"],
        v14,
        v15))
  {
    uint64_t v12 = 1;
  }
  else
  {
LABEL_9:
    uint64_t v12 = 0;
  }
LABEL_10:

  v7->_status = v12;
  v7->_me = [v5 isMe];
  uint64_t v16 = [v5 appleID];
  appleID = v7->_appleID;
  v7->_appleID = (NSString *)v16;

  uint64_t v18 = [v5 dsid];
  dsid = v7->_dsid;
  v7->_dsid = (NSNumber *)v18;

  uint64_t v20 = [v5 altDSID];
  altDSID = v7->_altDSID;
  v7->_altDSID = (NSString *)v20;

  uint64_t v22 = [v5 firstName];
  firstName = v7->_firstName;
  v7->_firstName = (NSString *)v22;

  uint64_t v24 = [v5 lastName];
  lastName = v7->_lastName;
  v7->_lastName = (NSString *)v24;

  uint64_t v26 = [v5 joinedDate];
  joinedDate = v7->_joinedDate;
  v7->_joinedDate = (NSDate *)v26;

  v7->_parentalControlsEnabled = [v5 hasParentalControlsEnabled];
  v7->_askToBuyEnabled = [v5 hasAskToBuyEnabled];
  v7->_parent = [v5 isParent];
  v7->_organizer = [v5 isOrganizer];
  v28 = [v5 dictionary];
  uint64_t v29 = [v28 PKSetContaining:objc_opt_class() forKey:@"member-appleID-aliases"];
  appleIDAliases = v7->_appleIDAliases;
  v7->_appleIDAliases = (NSSet *)v29;

  uint64_t v31 = [v5 inviteEmail];
  inviteEmail = v7->_inviteEmail;
  v7->_inviteEmail = (NSString *)v31;

  uint64_t v33 = [v5 invitationDate];
  invitationDate = v7->_invitationDate;
  v7->_invitationDate = (NSDate *)v33;

  if (PKPreferenceBOOLforKey(@"PKForceU13AccountKey"))
  {
    uint64_t v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-378432000.0];
    dateOfBirth = v7->_dateOfBirth;
    v7->_dateOfBirth = (NSDate *)v35;

    v7->_childAccount = 1;
    v7->_memberType = 2;
    v7->_age = 12;
  }
  else
  {
    v37 = [v5 dictionary];
    v38 = [v37 objectForKey:@"member-date-of-birth"];

    if (v38)
    {
      [v38 doubleValue];
      uint64_t v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v39 / 1000.0];
      v41 = v7->_dateOfBirth;
      v7->_dateOfBirth = (NSDate *)v40;
    }
    v7->_childAccount = [v5 isChildAccount];
    unint64_t v42 = [v5 memberType];
    if (v42 >= 3) {
      uint64_t v43 = -1;
    }
    else {
      uint64_t v43 = v42;
    }
    v7->_memberType = v43;
    v7->_age = [v5 age];
  }
LABEL_18:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFamilyMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKFamilyMember;
  id v5 = [(PKFamilyMember *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"member"];
    member = v5->_member;
    v5->_member = (FAFamilyMember *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_me = [v4 decodeBoolForKey:@"me"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v16;

    v5->_age = [v4 decodeIntegerForKey:@"age"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memberType"];
    v5->_memberType = PKFamilyMemberTypeFromString(v18);

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"joinedDate"];
    joinedDate = v5->_joinedDate;
    v5->_joinedDate = (NSDate *)v19;

    v5->_childAccount = [v4 decodeBoolForKey:@"childAccount"];
    v5->_parentalControlsEnabled = [v4 decodeBoolForKey:@"parentalControlsEnabled"];
    v5->_askToBuyEnabled = [v4 decodeBoolForKey:@"askToBuyEnabled"];
    v5->_parent = [v4 decodeBoolForKey:@"parent"];
    v5->_organizer = [v4 decodeBoolForKey:@"organizer"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOfBirth"];
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (NSDate *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"appleIDAliases"];
    appleIDAliases = v5->_appleIDAliases;
    v5->_appleIDAliases = (NSSet *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteEmail"];
    inviteEmail = v5->_inviteEmail;
    v5->_inviteEmail = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationDate"];
    invitationDate = v5->_invitationDate;
    v5->_invitationDate = (NSDate *)v32;
  }
  return v5;
}

- (CNContact)contact
{
  contact = self->_contact;
  if (!contact)
  {
    id v4 = [(FAFamilyMember *)self->_member contact];
    id v5 = self->_contact;
    self->_contact = v4;

    contact = self->_contact;
  }
  return contact;
}

- (NSString)firstName
{
  firstName = self->_firstName;
  if (firstName)
  {
    v3 = firstName;
  }
  else
  {
    id v4 = [(PKFamilyMember *)self contact];
    v3 = [v4 givenName];
  }
  return v3;
}

- (NSString)lastName
{
  lastName = self->_lastName;
  if (lastName)
  {
    v3 = lastName;
  }
  else
  {
    id v4 = [(PKFamilyMember *)self contact];
    v3 = [v4 familyName];
  }
  return v3;
}

- (id)labelName
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  id v4 = [(PKFamilyMember *)self lastName];
  [v3 setFamilyName:v4];

  id v5 = [(PKFamilyMember *)self firstName];
  [v3 setGivenName:v5];

  uint64_t v6 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v3 style:2 options:0];

  return v6;
}

- (BOOL)canSharePeerPaymentAccount
{
  return self->_parent || self->_organizer;
}

- (BOOL)hasAppleIDAlias:(id)a3
{
  id v4 = a3;
  appleID = self->_appleID;
  uint64_t v6 = (NSString *)v4;
  v7 = appleID;
  if (v7 == v6)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      BOOL v10 = [(NSSet *)self->_appleIDAliases containsObject:v6];
      goto LABEL_10;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_9;
    }
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_member forKey:@"member"];
  [v6 encodeInteger:self->_status forKey:@"status"];
  [v6 encodeBool:self->_me forKey:@"me"];
  [v6 encodeObject:self->_appleID forKey:@"appleID"];
  [v6 encodeObject:self->_dsid forKey:@"dsid"];
  [v6 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v6 encodeObject:self->_firstName forKey:@"firstName"];
  [v6 encodeObject:self->_lastName forKey:@"lastName"];
  [v6 encodeInteger:self->_age forKey:@"age"];
  unint64_t memberType = self->_memberType;
  if (memberType > 2) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E56F1CE8[memberType];
  }
  [v6 encodeObject:v5 forKey:@"memberType"];
  [v6 encodeObject:self->_joinedDate forKey:@"joinedDate"];
  [v6 encodeBool:self->_childAccount forKey:@"childAccount"];
  [v6 encodeBool:self->_parentalControlsEnabled forKey:@"parentalControlsEnabled"];
  [v6 encodeBool:self->_askToBuyEnabled forKey:@"askToBuyEnabled"];
  [v6 encodeBool:self->_parent forKey:@"parent"];
  [v6 encodeBool:self->_organizer forKey:@"organizer"];
  [v6 encodeObject:self->_dateOfBirth forKey:@"dateOfBirth"];
  [v6 encodeObject:self->_appleIDAliases forKey:@"appleIDAliases"];
  [v6 encodeObject:self->_contact forKey:@"contact"];
  [v6 encodeObject:self->_invitationDate forKey:@"invitationDate"];
  [v6 encodeObject:self->_inviteEmail forKey:@"inviteEmail"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKFamilyMember *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKFamilyMember *)self isEqualToFamilyMember:v5];

  return v6;
}

- (BOOL)isEqualToFamilyMember:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  if (!v5)
  {
    char v3 = 0;
    goto LABEL_16;
  }
  int64_t status = self->_status;
  if (status == 2)
  {
LABEL_5:
    dsid = self->_dsid;
    BOOL v9 = (NSNumber *)v6[6];
    if (dsid && v9) {
      char v3 = -[NSNumber isEqual:](dsid, "isEqual:");
    }
    else {
      char v3 = dsid == v9;
    }
    goto LABEL_16;
  }
  if (status != 1)
  {
    if (status) {
      goto LABEL_16;
    }
    goto LABEL_5;
  }
  BOOL v10 = (void *)v5[15];
  char v11 = self->_inviteEmail;
  uint64_t v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    if (v11 && v12) {
      char v3 = [(NSString *)v11 isEqualToString:v12];
    }
  }

LABEL_16:
  return v3 & 1;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  unint64_t status = self->_status;
  if (status <= 2) {
    [v3 safelyAddObject:*(Class *)((char *)&self->super.isa + qword_191675580[status])];
  }
  unint64_t v6 = PKCombinedHash(17, v4);

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_me) {
    [v3 appendFormat:@"isMe: '%@'; ", @"YES"];
  }
  unint64_t memberType = self->_memberType;
  if (memberType > 2) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = off_1E56F1CE8[memberType];
  }
  [v4 appendFormat:@"memberType: '%@'; ", v6];
  [v4 appendFormat:@"dsid: '%@'; ", self->_dsid];
  [v4 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  if (self->_childAccount) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 appendFormat:@"childAccount: '%@'; ", v7];
  if (self->_parent) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v4 appendFormat:@"parent: '%@'; ", v8];
  if (self->_organizer) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v4 appendFormat:@"organizer: '%@'; ", v9];
  if (self->_status == 1)
  {
    [v4 appendFormat:@"inviteEmail: '%@'; ", self->_inviteEmail];
    [v4 appendFormat:@"invitationDate: '%@'; ", self->_invitationDate];
  }
  [v4 appendFormat:@">"];
  return v4;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_unint64_t status = a3;
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSSet)appleIDAliases
{
  return self->_appleIDAliases;
}

- (void)setAppleIDAliases:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setContact:(id)a3
{
}

- (unint64_t)age
{
  return self->_age;
}

- (void)setAge:(unint64_t)a3
{
  self->_age = a3;
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
}

- (int64_t)memberType
{
  return self->_memberType;
}

- (void)setMemberType:(int64_t)a3
{
  self->_unint64_t memberType = a3;
}

- (NSDate)joinedDate
{
  return self->_joinedDate;
}

- (void)setJoinedDate:(id)a3
{
}

- (BOOL)parentalControlsEnabled
{
  return self->_parentalControlsEnabled;
}

- (void)setParentalControlsEnabled:(BOOL)a3
{
  self->_parentalControlsEnabled = a3;
}

- (BOOL)askToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (void)setAskToBuyEnabled:(BOOL)a3
{
  self->_askToBuyEnabled = a3;
}

- (BOOL)isChildAccount
{
  return self->_childAccount;
}

- (void)setChildAccount:(BOOL)a3
{
  self->_childAccount = a3;
}

- (BOOL)isParent
{
  return self->_parent;
}

- (void)setParent:(BOOL)a3
{
  self->_parent = a3;
}

- (BOOL)isOrganizer
{
  return self->_organizer;
}

- (void)setOrganizer:(BOOL)a3
{
  self->_organizer = a3;
}

- (NSString)inviteEmail
{
  return self->_inviteEmail;
}

- (void)setInviteEmail:(id)a3
{
}

- (NSDate)invitationDate
{
  return self->_invitationDate;
}

- (void)setInvitationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationDate, 0);
  objc_storeStrong((id *)&self->_inviteEmail, 0);
  objc_storeStrong((id *)&self->_joinedDate, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end