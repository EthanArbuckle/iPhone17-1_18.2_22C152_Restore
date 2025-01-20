@interface NRDOrphanedConnection
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation NRDOrphanedConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    v7 = nrUUID;
    if (v5) {
      v8 = (void *)v5[1];
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    if (![(NSUUID *)v7 isEqual:v9])
    {
      BOOL v12 = 0;
      goto LABEL_13;
    }
    if (self)
    {
      connection = self->_connection;
      if (v5)
      {
LABEL_9:
        v11 = (OS_xpc_object *)v5[2];
LABEL_10:
        BOOL v12 = connection == v11;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      connection = 0;
      if (v5) {
        goto LABEL_9;
      }
    }
    v11 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0;
  }
  id v4 = nrUUID;
  id v5 = [(NSUUID *)v4 hash];
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0;
  }
  unint64_t v7 = (unint64_t)connection + (void)v5;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    id v4 = self->_nrUUID;
    connection = self->_connection;
  }
  else
  {
    id v4 = 0;
    connection = 0;
  }
  id v6 = [v3 initWithFormat:@"[OrphanedConnection:%@,%@]", v4, connection];

  return v6;
}

@end