@interface UMDarwinDirectoryGroup
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation UMDarwinDirectoryGroup

- (BOOL)isEqual:(id)a3
{
  v4 = (UMDarwinDirectoryGroup *)a3;
  if (self == v4)
  {
    unsigned __int8 v19 = 1;
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
        goto LABEL_23;
      }
      if (self)
      {
        unsigned int gid = self->_gid;
        if (v5)
        {
LABEL_10:
          unsigned int v11 = v5->_gid;
          goto LABEL_11;
        }
      }
      else
      {
        unsigned int gid = 0;
        if (v5) {
          goto LABEL_10;
        }
      }
      unsigned int v11 = 0;
LABEL_11:
      if (gid == v11)
      {
        if (self) {
          uuid = self->_uuid;
        }
        else {
          uuid = 0;
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
          unsigned __int8 v19 = 0;
          goto LABEL_25;
        }
        if (self)
        {
          fullName = self->_fullName;
          if (v5)
          {
LABEL_19:
            v17 = v5->_fullName;
LABEL_20:
            v18 = fullName;
            unsigned __int8 v19 = [(NSString *)v18 isEqualToString:v17];

LABEL_25:
            goto LABEL_26;
          }
        }
        else
        {
          fullName = 0;
          if (v5) {
            goto LABEL_19;
          }
        }
        v17 = 0;
        goto LABEL_20;
      }
LABEL_23:
      unsigned __int8 v19 = 0;
LABEL_26:

      goto LABEL_27;
    }
    unsigned __int8 v19 = 0;
  }
LABEL_27:

  return v19;
}

- (unint64_t)hash
{
  if (self) {
    name = self->_name;
  }
  else {
    name = 0;
  }
  v4 = name;
  v5 = [(NSString *)v4 hash];
  v6 = v5;
  if (self)
  {
    v6 = &v5[self->_gid];
    uuid = self->_uuid;
  }
  else
  {
    uuid = 0;
  }
  v8 = uuid;
  id v9 = [(NSUUID *)v8 hash];
  if (self) {
    fullName = self->_fullName;
  }
  else {
    fullName = 0;
  }
  unsigned int v11 = &v6[(void)v9 + [(NSString *)fullName hash]];

  return (unint64_t)v11;
}

- (id)description
{
  if (self)
  {
    v3 = self->_name;
    uint64_t gid = self->_gid;
    v5 = self->_uuid;
    fullName = self->_fullName;
  }
  else
  {
    v5 = 0;
    v3 = 0;
    uint64_t gid = 0;
    fullName = 0;
  }
  v7 = +[NSString stringWithFormat:@"<UMDarwinDirectoryGroup name:%@ gid:%d uuid:%@ fullName:%@", v3, gid, v5, fullName];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end