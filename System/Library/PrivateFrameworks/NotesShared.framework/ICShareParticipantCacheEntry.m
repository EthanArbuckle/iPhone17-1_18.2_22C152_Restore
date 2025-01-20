@interface ICShareParticipantCacheEntry
- (NSSet)names;
- (NSString)activityStreamDisplayName;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)initials;
- (NSString)nickname;
- (void)setActivityStreamDisplayName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setInitials:(id)a3;
- (void)setNames:(id)a3;
- (void)setNickname:(id)a3;
@end

@implementation ICShareParticipantCacheEntry

- (NSSet)names
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:5];
  v4 = [(ICShareParticipantCacheEntry *)self givenName];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  v5 = [(ICShareParticipantCacheEntry *)self familyName];
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  v6 = [(ICShareParticipantCacheEntry *)self nickname];
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  v7 = [(ICShareParticipantCacheEntry *)self initials];
  objc_msgSend(v3, "ic_addNonNilObject:", v7);

  v8 = [(ICShareParticipantCacheEntry *)self displayName];
  objc_msgSend(v3, "ic_addNonNilObject:", v8);

  v9 = (void *)[v3 copy];
  return (NSSet *)v9;
}

- (void)setNames:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (NSString)initials
{
  return self->_initials;
}

- (void)setInitials:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)activityStreamDisplayName
{
  return self->_activityStreamDisplayName;
}

- (void)setActivityStreamDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStreamDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_initials, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end