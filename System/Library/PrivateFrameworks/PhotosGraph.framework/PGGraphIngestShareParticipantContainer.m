@interface PGGraphIngestShareParticipantContainer
- (BOOL)isFavorite;
- (BOOL)isHidden;
- (BOOL)isMe;
- (BOOL)isUserCreated;
- (BOOL)personIdentityFound;
- (CLSPersonIdentity)linkedPersonIdentity;
- (NSDate)anniversaryDate;
- (NSDate)birthdayDate;
- (NSDate)potentialBirthdayDate;
- (NSDictionary)locationsByAddressTypes;
- (NSString)contactID;
- (NSString)fullName;
- (NSString)localIdentifier;
- (NSString)shareParticipantLocalIdentifier;
- (PGGraphIngestShareParticipantContainer)initWithShareParticipant:(id)a3 person:(id)a4;
- (PHShareParticipant)shareParticipant;
- (unint64_t)ageCategory;
- (unint64_t)relationship;
- (unint64_t)sex;
- (void)setLinkedPersonIdentity:(id)a3;
- (void)setPersonIdentityFound:(BOOL)a3;
- (void)setShareParticipant:(id)a3;
@end

@implementation PGGraphIngestShareParticipantContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPersonIdentity, 0);
  objc_storeStrong((id *)&self->_shareParticipant, 0);
}

- (void)setPersonIdentityFound:(BOOL)a3
{
  self->_personIdentityFound = a3;
}

- (BOOL)personIdentityFound
{
  return self->_personIdentityFound;
}

- (void)setLinkedPersonIdentity:(id)a3
{
}

- (CLSPersonIdentity)linkedPersonIdentity
{
  return self->_linkedPersonIdentity;
}

- (void)setShareParticipant:(id)a3
{
}

- (PHShareParticipant)shareParticipant
{
  return self->_shareParticipant;
}

- (PGGraphIngestShareParticipantContainer)initWithShareParticipant:(id)a3 person:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestShareParticipantContainer;
  v8 = [(PGGraphIngestShareParticipantContainer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PGGraphIngestShareParticipantContainer *)v8 setShareParticipant:v6];
    [(PGGraphIngestShareParticipantContainer *)v9 setLinkedPersonIdentity:v7];
    [(PGGraphIngestShareParticipantContainer *)v9 setPersonIdentityFound:v7 != 0];
  }

  return v9;
}

- (NSDictionary)locationsByAddressTypes
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    v4 = [v3 locationsByAddressTypes];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v4;
}

- (unint64_t)sex
{
  if (![(PGGraphIngestShareParticipantContainer *)self personIdentityFound]) {
    return 0;
  }
  v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
  unint64_t v4 = [v3 sex];

  return v4;
}

- (unint64_t)ageCategory
{
  if (![(PGGraphIngestShareParticipantContainer *)self personIdentityFound]) {
    return 0;
  }
  v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
  unint64_t v4 = [v3 ageCategory];

  return v4;
}

- (unint64_t)relationship
{
  if (![(PGGraphIngestShareParticipantContainer *)self personIdentityFound]) {
    return 0;
  }
  v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
  unint64_t v4 = [v3 relationship];

  return v4;
}

- (NSDate)anniversaryDate
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 anniversaryDate];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)potentialBirthdayDate
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 potentialBirthdayDate];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)birthdayDate
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 birthdayDate];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isMe
{
  v2 = [(PGGraphIngestShareParticipantContainer *)self shareParticipant];
  char v3 = [v2 isCurrentUser];

  return v3;
}

- (BOOL)isUserCreated
{
  BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self personIdentityFound];
  if (v3)
  {
    unint64_t v4 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    char v5 = [v4 isUserCreated];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isHidden
{
  BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self personIdentityFound];
  if (v3)
  {
    unint64_t v4 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    char v5 = [v4 isHidden];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isFavorite
{
  BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self personIdentityFound];
  if (v3)
  {
    unint64_t v4 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    char v5 = [v4 isFavorite];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSString)shareParticipantLocalIdentifier
{
  v2 = [(PGGraphIngestShareParticipantContainer *)self shareParticipant];
  BOOL v3 = [v2 localIdentifier];

  return (NSString *)v3;
}

- (NSString)contactID
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 contactID];
  }
  else
  {
    unint64_t v4 = &stru_1F283BC78;
  }
  return (NSString *)v4;
}

- (NSString)localIdentifier
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 localIdentifier];
  }
  else
  {
    unint64_t v4 = &stru_1F283BC78;
  }
  return (NSString *)v4;
}

- (NSString)fullName
{
  if ([(PGGraphIngestShareParticipantContainer *)self personIdentityFound])
  {
    BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self linkedPersonIdentity];
    unint64_t v4 = [v3 fullName];
LABEL_5:

    goto LABEL_7;
  }
  char v5 = [(PGGraphIngestShareParticipantContainer *)self shareParticipant];
  id v6 = [v5 nameComponents];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28F38];
    BOOL v3 = [(PGGraphIngestShareParticipantContainer *)self shareParticipant];
    v8 = [v3 nameComponents];
    unint64_t v4 = [v7 localizedStringFromPersonNameComponents:v8 style:0 options:0];

    goto LABEL_5;
  }
  unint64_t v4 = &stru_1F283BC78;
LABEL_7:
  return (NSString *)v4;
}

@end