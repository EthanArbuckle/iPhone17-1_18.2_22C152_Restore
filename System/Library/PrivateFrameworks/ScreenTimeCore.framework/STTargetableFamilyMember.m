@interface STTargetableFamilyMember
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTargetableFamilyMember:(id)a3;
- (BOOL)isParent;
- (BOOL)isSignedInMember;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)firstName;
- (STTargetableFamilyMember)initWithDSID:(id)a3 altDSID:(id)a4 firstName:(id)a5 memberType:(int64_t)a6 isSignedInMember:(BOOL)a7 isParent:(BOOL)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)memberType;
- (unint64_t)hash;
@end

@implementation STTargetableFamilyMember

- (STTargetableFamilyMember)initWithDSID:(id)a3 altDSID:(id)a4 firstName:(id)a5 memberType:(int64_t)a6 isSignedInMember:(BOOL)a7 isParent:(BOOL)a8
{
  v24.receiver = self;
  v24.super_class = (Class)STTargetableFamilyMember;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(STTargetableFamilyMember *)&v24 init];
  v17 = (NSNumber *)objc_msgSend(v15, "copy", v24.receiver, v24.super_class);

  dsid = v16->_dsid;
  v16->_dsid = v17;

  v19 = (NSString *)[v14 copy];
  altDSID = v16->_altDSID;
  v16->_altDSID = v19;

  v21 = (NSString *)[v13 copy];
  firstName = v16->_firstName;
  v16->_firstName = v21;

  v16->_memberType = a6;
  v16->_isSignedInMember = a7;
  v16->_isParent = a8;
  return v16;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STTargetableFamilyMember *)self dsid];
  v5 = [(STTargetableFamilyMember *)self altDSID];
  v6 = [(STTargetableFamilyMember *)self firstName];
  unint64_t v7 = (unint64_t)[(STTargetableFamilyMember *)self memberType] - 1;
  if (v7 > 2) {
    CFStringRef v8 = @"Unknown";
  }
  else {
    CFStringRef v8 = off_1002FE5D8[v7];
  }
  if ([(STTargetableFamilyMember *)self isSignedInMember]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = v9;
  if ([(STTargetableFamilyMember *)self isParent]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  v12 = +[NSString stringWithFormat:@"<%@: {DSID: %@, AltDSID: %@, FirstName: %@, MemberType: %@, SignedIn: %@, Parent: %@ }>", v3, v4, v5, v6, v8, v10, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  dsid = self->_dsid;
  altDSID = self->_altDSID;
  firstName = self->_firstName;
  int64_t memberType = self->_memberType;
  BOOL isSignedInMember = self->_isSignedInMember;
  BOOL isParent = self->_isParent;
  return [v4 initWithDSID:dsid altDSID:altDSID firstName:firstName memberType:memberType isSignedInMember:isSignedInMember isParent:isParent];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STTargetableFamilyMember *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STTargetableFamilyMember *)self isEqualToTargetableFamilyMember:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToTargetableFamilyMember:(id)a3
{
  v6 = (STTargetableFamilyMember *)a3;
  if (v6 != self)
  {
    unint64_t v7 = [(STTargetableFamilyMember *)self dsid];
    CFStringRef v8 = [(STTargetableFamilyMember *)v6 dsid];
    if (![v7 isEqualToNumber:v8])
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(STTargetableFamilyMember *)self altDSID];
    v10 = [(STTargetableFamilyMember *)v6 altDSID];
    if (![v9 isEqualToString:v10])
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    CFStringRef v11 = [(STTargetableFamilyMember *)self firstName];
    if (v11
      || ([(STTargetableFamilyMember *)v6 firstName], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v3 = [(STTargetableFamilyMember *)self firstName];
      id v4 = [(STTargetableFamilyMember *)v6 firstName];
      if (![v3 isEqualToString:v4])
      {
        LOBYTE(v12) = 0;
        goto LABEL_16;
      }
      int v19 = 1;
    }
    else
    {
      v18 = 0;
      int v19 = 0;
    }
    id v13 = [(STTargetableFamilyMember *)self memberType];
    if (v13 == (void *)[(STTargetableFamilyMember *)v6 memberType]
      && (unsigned int v14 = [(STTargetableFamilyMember *)self isSignedInMember],
          v14 == [(STTargetableFamilyMember *)v6 isSignedInMember]))
    {
      unsigned int v16 = [(STTargetableFamilyMember *)self isParent];
      unsigned int v12 = v16 ^ [(STTargetableFamilyMember *)v6 isParent] ^ 1;
      if ((v19 & 1) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v19)
      {
LABEL_17:
        if (!v11) {

        }
        goto LABEL_20;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  LOBYTE(v12) = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STTargetableFamilyMember *)self dsid];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STTargetableFamilyMember *)self altDSID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)memberType
{
  return self->_memberType;
}

- (BOOL)isSignedInMember
{
  return self->_isSignedInMember;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end