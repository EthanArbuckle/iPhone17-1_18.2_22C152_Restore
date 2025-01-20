@interface STFamilyCirclePrimitiveMember
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMember:(id)a3;
- (BOOL)isMe;
- (BOOL)isOrganizer;
- (BOOL)isParent;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)lastName;
- (STFamilyCirclePrimitiveMember)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 firstName:(id)a6 lastName:(id)a7 memberType:(int64_t)a8 isMe:(BOOL)a9 isParent:(BOOL)a10 isOrganizer:(BOOL)a11 opaqueMember:(id)a12;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)opaqueMember;
- (int64_t)memberType;
- (unint64_t)hash;
@end

@implementation STFamilyCirclePrimitiveMember

- (STFamilyCirclePrimitiveMember)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 firstName:(id)a6 lastName:(id)a7 memberType:(int64_t)a8 isMe:(BOOL)a9 isParent:(BOOL)a10 isOrganizer:(BOOL)a11 opaqueMember:(id)a12
{
  id v18 = a12;
  v38.receiver = self;
  v38.super_class = (Class)STFamilyCirclePrimitiveMember;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [(STFamilyCirclePrimitiveMember *)&v38 init];
  v25 = (NSNumber *)[v23 copy];

  dsid = v24->_dsid;
  v24->_dsid = v25;

  v27 = (NSString *)[v22 copy];
  altDSID = v24->_altDSID;
  v24->_altDSID = v27;

  v29 = (NSString *)[v21 copy];
  appleID = v24->_appleID;
  v24->_appleID = v29;

  v31 = (NSString *)[v20 copy];
  firstName = v24->_firstName;
  v24->_firstName = v31;

  v33 = (NSString *)[v19 copy];
  lastName = v24->_lastName;
  v24->_lastName = v33;

  v24->_isMe = a9;
  v24->_isParent = a10;
  v24->_isOrganizer = a11;
  id opaqueMember = v24->_opaqueMember;
  v24->_memberType = a8;
  v24->_id opaqueMember = v18;

  return v24;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STFamilyCirclePrimitiveMember *)self dsid];
  v5 = [(STFamilyCirclePrimitiveMember *)self altDSID];
  v6 = [(STFamilyCirclePrimitiveMember *)self appleID];
  v7 = +[NSString stringWithFormat:@"<%@: { DSID: %@, AltDSID: %@, AppleID: %@ isMe: %d>", v3, v4, v5, v6, [(STFamilyCirclePrimitiveMember *)self isMe]];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(_WORD *)((char *)&v6 + 1) = *(_WORD *)&self->_isParent;
  LOBYTE(v6) = self->_isMe;
  return objc_msgSend(v4, "initWithDSID:altDSID:appleID:firstName:lastName:memberType:isMe:isParent:isOrganizer:opaqueMember:", self->_dsid, self->_altDSID, self->_appleID, self->_firstName, self->_lastName, self->_memberType, v6, self->_opaqueMember);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STFamilyCirclePrimitiveMember *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STFamilyCirclePrimitiveMember *)self isEqualToMember:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToMember:(id)a3
{
  v9 = (STFamilyCirclePrimitiveMember *)a3;
  if (v9 == self)
  {
    LOBYTE(v12) = 1;
    goto LABEL_57;
  }
  v10 = [(STFamilyCirclePrimitiveMember *)self dsid];
  if (v10
    || ([(STFamilyCirclePrimitiveMember *)v9 dsid], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(STFamilyCirclePrimitiveMember *)self dsid];
    BOOL v5 = [(STFamilyCirclePrimitiveMember *)v9 dsid];
    if (![v4 isEqualToNumber:v5])
    {
      LOBYTE(v12) = 0;
LABEL_53:

      goto LABEL_54;
    }
    int v11 = 1;
  }
  else
  {
    v43 = 0;
    int v11 = 0;
  }
  v13 = [(STFamilyCirclePrimitiveMember *)self altDSID];
  if (v13
    || ([(STFamilyCirclePrimitiveMember *)v9 altDSID],
        (objc_super v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = [(STFamilyCirclePrimitiveMember *)self altDSID];
    v7 = [(STFamilyCirclePrimitiveMember *)v9 altDSID];
    v42 = v3;
    if (![v3 isEqualToString:v7])
    {
      LOBYTE(v12) = 0;
      goto LABEL_51;
    }
    int v40 = v11;
    int v41 = 1;
  }
  else
  {
    int v40 = v11;
    objc_super v38 = 0;
    int v41 = 0;
  }
  v14 = [(STFamilyCirclePrimitiveMember *)self appleID];
  if (v14
    || ([(STFamilyCirclePrimitiveMember *)v9 appleID],
        (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = [(STFamilyCirclePrimitiveMember *)self appleID];
    uint64_t v16 = [(STFamilyCirclePrimitiveMember *)v9 appleID];
    v39 = (void *)v15;
    v17 = (void *)v15;
    uint64_t v3 = (void *)v16;
    if (![v17 isEqualToString:v16])
    {
      LOBYTE(v12) = 0;
      goto LABEL_47;
    }
    int v36 = 1;
  }
  else
  {
    v33 = 0;
    int v36 = 0;
  }
  v37 = [(STFamilyCirclePrimitiveMember *)self firstName];
  if (v37
    || ([(STFamilyCirclePrimitiveMember *)v9 firstName],
        (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(STFamilyCirclePrimitiveMember *)self firstName];
    v34 = [(STFamilyCirclePrimitiveMember *)v9 firstName];
    v35 = v6;
    if (![v6 isEqualToString:v34])
    {
      LOBYTE(v12) = 0;
      goto LABEL_42;
    }
    int v31 = 1;
  }
  else
  {
    v28 = 0;
    int v31 = 0;
  }
  v30 = [(STFamilyCirclePrimitiveMember *)self lastName];
  if (v30
    || ([(STFamilyCirclePrimitiveMember *)v9 lastName],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = [(STFamilyCirclePrimitiveMember *)self lastName];
    uint64_t v19 = [(STFamilyCirclePrimitiveMember *)v9 lastName];
    v29 = (void *)v18;
    id v20 = (void *)v18;
    uint64_t v6 = (void *)v19;
    if (![v20 isEqualToString:v19])
    {
      LOBYTE(v12) = 0;
LABEL_38:

      goto LABEL_40;
    }
    v32 = v3;
    int v27 = 1;
  }
  else
  {
    v32 = v3;
    v26 = 0;
    int v27 = 0;
  }
  id v21 = [(STFamilyCirclePrimitiveMember *)self memberType];
  if (v21 == (void *)[(STFamilyCirclePrimitiveMember *)v9 memberType]
    && (unsigned int v22 = [(STFamilyCirclePrimitiveMember *)self isMe],
        v22 == [(STFamilyCirclePrimitiveMember *)v9 isMe])
    && (unsigned int v23 = [(STFamilyCirclePrimitiveMember *)self isParent],
        v23 == [(STFamilyCirclePrimitiveMember *)v9 isParent]))
  {
    unsigned int v25 = [(STFamilyCirclePrimitiveMember *)self isOrganizer];
    unsigned int v12 = v25 ^ [(STFamilyCirclePrimitiveMember *)v9 isOrganizer] ^ 1;
    uint64_t v3 = v32;
    if (v27) {
      goto LABEL_38;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
    if (v27)
    {
      uint64_t v3 = v32;
      goto LABEL_38;
    }
    uint64_t v3 = v32;
  }
LABEL_40:
  if (v30)
  {

    if (!v31) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  if (v31)
  {
LABEL_42:
  }
LABEL_43:
  if (!v37)
  {

    if ((v36 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  if (v36)
  {
LABEL_47:
  }
LABEL_48:
  if (v14)
  {

    if (v41)
    {
LABEL_50:
      int v11 = v40;
LABEL_51:

      if (v13) {
        goto LABEL_52;
      }
LABEL_60:

      if ((v11 & 1) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else
  {

    if (v41) {
      goto LABEL_50;
    }
  }
  int v11 = v40;
  if (!v13) {
    goto LABEL_60;
  }
LABEL_52:

  if (v11) {
    goto LABEL_53;
  }
LABEL_54:
  if (!v10) {

  }
LABEL_57:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STFamilyCirclePrimitiveMember *)self dsid];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STFamilyCirclePrimitiveMember *)self altDSID];
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

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)memberType
{
  return self->_memberType;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (BOOL)isOrganizer
{
  return self->_isOrganizer;
}

- (id)opaqueMember
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_opaqueMember, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end