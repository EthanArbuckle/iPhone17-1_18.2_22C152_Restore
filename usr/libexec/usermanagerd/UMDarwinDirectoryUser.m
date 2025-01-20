@interface UMDarwinDirectoryUser
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation UMDarwinDirectoryUser

- (BOOL)isEqual:(id)a3
{
  v4 = (UMDarwinDirectoryUser *)a3;
  if (self == v4)
  {
    unsigned __int8 v29 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self) {
        name = self->_name;
      }
      else {
        name = 0;
      }
      v7 = name;
      if (v5) {
        v8 = v5->_name;
      }
      else {
        v8 = 0;
      }
      v9 = v8;
      if (![(NSString *)v7 isEqualToString:v9]) {
        goto LABEL_43;
      }
      if (self)
      {
        unsigned int uid = self->_uid;
        if (v5)
        {
LABEL_10:
          unsigned int v11 = v5->_uid;
          goto LABEL_11;
        }
      }
      else
      {
        unsigned int uid = 0;
        if (v5) {
          goto LABEL_10;
        }
      }
      unsigned int v11 = 0;
LABEL_11:
      if (uid == v11)
      {
        if (self) {
          uunsigned int uid = self->_uuid;
        }
        else {
          uunsigned int uid = 0;
        }
        v13 = uuid;
        if (v5) {
          v14 = v5->_uuid;
        }
        else {
          v14 = 0;
        }
        v15 = v14;
        if (![(NSUUID *)v13 isEqual:v15])
        {
          unsigned __int8 v29 = 0;
LABEL_53:

          goto LABEL_54;
        }
        if (self) {
          primaryGroupUUID = self->_primaryGroupUUID;
        }
        else {
          primaryGroupUUID = 0;
        }
        v17 = primaryGroupUUID;
        if (v5) {
          v18 = v5->_primaryGroupUUID;
        }
        else {
          v18 = 0;
        }
        v19 = v18;
        if (![(NSUUID *)v17 isEqual:v19])
        {
          unsigned __int8 v29 = 0;
LABEL_52:

          goto LABEL_53;
        }
        if (self) {
          fullName = self->_fullName;
        }
        else {
          fullName = 0;
        }
        v36 = fullName;
        if (v5) {
          v21 = v5->_fullName;
        }
        else {
          v21 = 0;
        }
        v22 = v21;
        if (![(NSString *)v36 isEqualToString:v22])
        {
          unsigned __int8 v29 = 0;
LABEL_51:

          goto LABEL_52;
        }
        if (self) {
          homeDirectory = self->_homeDirectory;
        }
        else {
          homeDirectory = 0;
        }
        v35 = homeDirectory;
        if (v5) {
          v24 = v5->_homeDirectory;
        }
        else {
          v24 = 0;
        }
        v34 = v24;
        if (!-[NSString isEqualToString:](v35, "isEqualToString:"))
        {
          unsigned __int8 v29 = 0;
LABEL_50:

          goto LABEL_51;
        }
        if (self) {
          shell = self->_shell;
        }
        else {
          shell = 0;
        }
        v33 = shell;
        if (v5) {
          v26 = v5->_shell;
        }
        else {
          v26 = 0;
        }
        v32 = v26;
        if (!-[NSString isEqualToString:](v33, "isEqualToString:"))
        {
          unsigned __int8 v29 = 0;
          goto LABEL_49;
        }
        if (self)
        {
          memberships = self->_memberships;
          if (v5)
          {
LABEL_39:
            v28 = v5->_memberships;
LABEL_40:
            v31 = memberships;
            unsigned __int8 v29 = [(NSMutableSet *)v31 isEqual:v28];

LABEL_49:
            goto LABEL_50;
          }
        }
        else
        {
          memberships = 0;
          if (v5) {
            goto LABEL_39;
          }
        }
        v28 = 0;
        goto LABEL_40;
      }
LABEL_43:
      unsigned __int8 v29 = 0;
LABEL_54:

      goto LABEL_55;
    }
    unsigned __int8 v29 = 0;
  }
LABEL_55:

  return v29;
}

- (unint64_t)hash
{
  if (self) {
    name = self->_name;
  }
  else {
    name = 0;
  }
  v25 = name;
  v4 = [(NSString *)v25 hash];
  v5 = v4;
  if (self)
  {
    v5 = &v4[self->_uid];
    uunsigned int uid = self->_uuid;
  }
  else
  {
    uunsigned int uid = 0;
  }
  v7 = uuid;
  v24 = (char *)[(NSUUID *)v7 hash];
  if (self) {
    primaryGroupUUID = self->_primaryGroupUUID;
  }
  else {
    primaryGroupUUID = 0;
  }
  v9 = primaryGroupUUID;
  id v10 = [(NSUUID *)v9 hash];
  if (self) {
    fullName = self->_fullName;
  }
  else {
    fullName = 0;
  }
  v12 = fullName;
  NSUInteger v13 = [(NSString *)v12 hash];
  if (self) {
    homeDirectory = self->_homeDirectory;
  }
  else {
    homeDirectory = 0;
  }
  v15 = homeDirectory;
  NSUInteger v16 = [(NSString *)v15 hash];
  if (self) {
    shell = self->_shell;
  }
  else {
    shell = 0;
  }
  v18 = shell;
  v19 = [(NSString *)v18 hash];
  if (self) {
    memberships = self->_memberships;
  }
  else {
    memberships = 0;
  }
  v21 = &v5[(void)v24 + (unint64_t)v10 + v13];
  v22 = &v21[(unint64_t)&v19[v16 + (void)[(NSMutableSet *)memberships hash]]];

  return (unint64_t)v22;
}

- (id)description
{
  if (self)
  {
    v3 = self->_name;
    uint64_t uid = self->_uid;
    v5 = self->_uuid;
    v6 = self->_primaryGroupUUID;
    v7 = self->_fullName;
    v8 = self->_homeDirectory;
    v9 = self->_shell;
    memberships = self->_memberships;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v5 = 0;
    v3 = 0;
    uint64_t uid = 0;
    v6 = 0;
    v8 = 0;
    memberships = 0;
  }
  unsigned int v11 = +[NSString stringWithFormat:@"<UMDarwinDirectoryUser name:%@ uid:%d uuid:%@ primaryGroupUUID:%@ fullName:%@ homeDirectory:%@ shell:%@ memberships:%@", v3, uid, v5, v6, v7, v8, v9, memberships];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_shell, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_primaryGroupUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end