@interface PPScoredContact
+ (BOOL)supportsSecureCoding;
+ (id)scoredContactWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredContact:(id)a3;
- (NSArray)scoredEmailAddresses;
- (NSArray)scoredPhoneNumbers;
- (NSArray)scoredPostalAddresses;
- (NSArray)scoredSocialProfiles;
- (PPContact)contact;
- (PPScoredContact)initWithCoder:(id)a3;
- (PPScoredContact)initWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)reverseCompare:(id)a3;
- (unint64_t)hash;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPScoredContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredPostalAddresses, 0);
  objc_storeStrong((id *)&self->_scoredSocialProfiles, 0);
  objc_storeStrong((id *)&self->_scoredEmailAddresses, 0);
  objc_storeStrong((id *)&self->_scoredPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (NSArray)scoredPostalAddresses
{
  return self->_scoredPostalAddresses;
}

- (NSArray)scoredSocialProfiles
{
  return self->_scoredSocialProfiles;
}

- (NSArray)scoredEmailAddresses
{
  return self->_scoredEmailAddresses;
}

- (NSArray)scoredPhoneNumbers
{
  return self->_scoredPhoneNumbers;
}

- (unsigned)flags
{
  return self->_flags;
}

- (double)score
{
  return self->_score;
}

- (PPContact)contact
{
  return self->_contact;
}

- (BOOL)isEqualToScoredContact:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_24;
  }
  contact = self->_contact;
  v7 = (PPContact *)v4[2];
  if (contact == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = contact;
    BOOL v10 = [(PPContact *)v9 isEqual:v8];

    if (!v10) {
      goto LABEL_24;
    }
  }
  scoredPhoneNumbers = self->_scoredPhoneNumbers;
  v12 = (NSArray *)v5[4];
  if (scoredPhoneNumbers == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = scoredPhoneNumbers;
    char v15 = [(NSArray *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
  scoredEmailAddresses = self->_scoredEmailAddresses;
  v17 = (NSArray *)v5[5];
  if (scoredEmailAddresses == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = scoredEmailAddresses;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_24;
    }
  }
  scoredSocialProfiles = self->_scoredSocialProfiles;
  v22 = (NSArray *)v5[6];
  if (scoredSocialProfiles == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = scoredSocialProfiles;
    char v25 = [(NSArray *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_24;
    }
  }
  scoredPostalAddresses = self->_scoredPostalAddresses;
  v27 = (NSArray *)v5[7];
  if (scoredPostalAddresses == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = scoredPostalAddresses;
    char v30 = [(NSArray *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_24;
    }
  }
  if (self->_score != *((double *)v5 + 3))
  {
LABEL_24:
    BOOL v31 = 0;
    goto LABEL_25;
  }
  BOOL v31 = self->_flags == *((unsigned __int8 *)v5 + 8);
LABEL_25:

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPScoredContact *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPScoredContact *)self isEqualToScoredContact:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v6 = [(PPContact *)self->_contact copyWithZone:a3];
  v7 = (void *)[(NSArray *)self->_scoredPhoneNumbers copyWithZone:a3];
  v8 = (void *)[(NSArray *)self->_scoredEmailAddresses copyWithZone:a3];
  v9 = (void *)[(NSArray *)self->_scoredSocialProfiles copyWithZone:a3];
  BOOL v10 = (void *)[(NSArray *)self->_scoredPostalAddresses copyWithZone:a3];
  v11 = [v5 scoredContactWithContact:v6 scoredPhoneNumbers:v7 scoredEmailAddresses:v8 scoredSocialProfiles:v9 scoredPostalAddresses:v10 score:self->_flags flags:self->_score];

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPContact *)self->_contact hash];
  uint64_t v4 = [(NSArray *)self->_scoredPhoneNumbers hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSArray *)self->_scoredEmailAddresses hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_scoredSocialProfiles hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSArray *)self->_scoredPostalAddresses hash] - v6 + 32 * v6;
  v8 = [NSNumber numberWithDouble:self->_score];
  uint64_t v9 = [v8 hash] - v7 + 32 * v7;

  return self->_flags - v9 + 32 * v9;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"con"];
  [v5 encodeObject:self->_scoredPhoneNumbers forKey:@"sph"];
  [v5 encodeObject:self->_scoredEmailAddresses forKey:@"sem"];
  [v5 encodeObject:self->_scoredSocialProfiles forKey:@"ssp"];
  [v5 encodeObject:self->_scoredPostalAddresses forKey:@"spo"];
  [v5 encodeDouble:@"sco" forKey:self->_score];
  [v5 encodeInt32:self->_flags forKey:@"fla"];
}

- (PPScoredContact)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F97350]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"con"];
  BOOL v10 = [v4 decodeObjectOfClasses:v8 forKey:@"sph"];
  v11 = [v4 decodeObjectOfClasses:v8 forKey:@"sem"];
  v12 = [v4 decodeObjectOfClasses:v8 forKey:@"ssp"];
  uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"spo"];
  v14 = (void *)v13;
  char v15 = 0;
  if (v9 && v10 && v11 && v12 && v13)
  {
    [v4 decodeDoubleForKey:@"sco"];
    self = -[PPScoredContact initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:](self, "initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v9, v10, v11, v12, v14, [v4 decodeInt32ForKey:@"fla"], v16);
    char v15 = self;
  }

  return v15;
}

- (int64_t)reverseCompare:(id)a3
{
  return [a3 compare:self];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double score = self->_score;
  [v4 score];
  int64_t v7 = +[PPUtils compareDouble:score withDouble:v6];
  if (!v7)
  {
    v8 = [(PPContact *)self->_contact familyName];
    uint64_t v9 = [v4 contact];
    BOOL v10 = [v9 familyName];
    int64_t v7 = [v8 compare:v10];

    if (!v7)
    {
      v11 = [(PPContact *)self->_contact givenName];
      v12 = [v4 contact];
      uint64_t v13 = [v12 givenName];
      int64_t v7 = [v11 compare:v13];

      if (!v7)
      {
        v14 = [(PPContact *)self->_contact middleName];
        char v15 = [v4 contact];
        double v16 = [v15 middleName];
        int64_t v7 = [v14 compare:v16];

        if (!v7)
        {
          v17 = [(PPContact *)self->_contact identifier];
          v18 = [v4 contact];
          v19 = [v18 identifier];
          int64_t v7 = [v17 compare:v19];
        }
      }
    }
  }

  return v7;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPScoredContact c:%@ p:%@ e:%@ so:%@ ps:%@ s:%f f:%u>", self->_contact, self->_scoredPhoneNumbers, self->_scoredEmailAddresses, self->_scoredSocialProfiles, self->_scoredPostalAddresses, *(void *)&self->_score, self->_flags];
  return v2;
}

- (PPScoredContact)initWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9
{
  id v24 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PPScoredContact;
  char v20 = [(PPScoredContact *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contact, a3);
    objc_storeStrong((id *)&v21->_scoredPhoneNumbers, a4);
    objc_storeStrong((id *)&v21->_scoredEmailAddresses, a5);
    objc_storeStrong((id *)&v21->_scoredSocialProfiles, a6);
    objc_storeStrong((id *)&v21->_scoredPostalAddresses, a7);
    v21->_double score = a8;
    v21->_flags = a9;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scoredContactWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9
{
  uint64_t v9 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = (void *)[objc_alloc((Class)a1) initWithContact:v20 scoredPhoneNumbers:v19 scoredEmailAddresses:v18 scoredSocialProfiles:v17 scoredPostalAddresses:v16 score:v9 flags:a8];

  return v21;
}

@end