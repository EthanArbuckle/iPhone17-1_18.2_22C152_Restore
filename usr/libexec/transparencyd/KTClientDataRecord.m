@interface KTClientDataRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)shouldRemove;
- (BOOL)synced;
- (BOOL)verified;
- (KTClientDataRecord)initWithCoder:(id)a3;
- (KTClientDataRecord)initWithMutation:(id)a3;
- (KTClientDataRecord)initWithSingleDataRecord:(id)a3;
- (NSData)clientData;
- (NSData)clientDataHash;
- (NSDate)addedDate;
- (NSDate)escrowExpiry;
- (NSDate)expiry;
- (NSDate)markedForDeletion;
- (NSDictionary)diagnosticsJsonDictionary;
- (id)debugDescription;
- (id)description;
- (unint64_t)applicationVersion;
- (void)encodeWithCoder:(id)a3;
- (void)markWithMutationMs:(unint64_t)a3;
- (void)setAddedDate:(id)a3;
- (void)setApplicationVersion:(unint64_t)a3;
- (void)setClientData:(id)a3;
- (void)setClientDataHash:(id)a3;
- (void)setEscrowExpiry:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setMarkedForDeletion:(id)a3;
- (void)setSynced:(BOOL)a3;
- (void)setVerified:(BOOL)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
@end

@implementation KTClientDataRecord

- (id)debugDescription
{
  v3 = [(NSData *)self->_clientData kt_hexString];
  v4 = [(NSData *)self->_clientDataHash kt_hexString];
  v5 = +[NSString stringWithFormat:@"{\tclientData:%@\n\tclientDataHash:%@\n\tapplicationVersion:%lu\n\taddedDate:%@\n\tmarkedForDeletion:%@\n\texpiry:%@\n\tescrowExpiry:%@\n}", v3, v4, self->_applicationVersion, self->_addedDate, self->_markedForDeletion, self->_expiry, self->_escrowExpiry];

  return v5;
}

- (id)description
{
  v3 = [(NSData *)self->_clientData kt_hexString];
  v4 = [(NSData *)self->_clientDataHash kt_hexString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"clientData:%@; clientDataHash:%@; applicationVersion:%lu; addedDate:%@; markedForDeletion:%@; expiry:%@; escrowExpiry:%@",
    v3,
    v4,
    self->_applicationVersion,
    self->_addedDate,
    self->_markedForDeletion,
    self->_expiry,
  v5 = self->_escrowExpiry);

  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(KTClientDataRecord *)self clientData];

  if (v4)
  {
    v5 = [(KTClientDataRecord *)self clientData];
    v6 = [v5 kt_hexString];
    [v3 setObject:v6 forKeyedSubscript:@"clientData"];
  }
  v7 = [(KTClientDataRecord *)self clientDataHash];
  v8 = [v7 kt_hexString];
  [v3 setObject:v8 forKeyedSubscript:@"clientDataHash"];

  v9 = +[NSNumber numberWithUnsignedInteger:[(KTClientDataRecord *)self applicationVersion]];
  [v3 setObject:v9 forKeyedSubscript:@"appVersion"];

  v10 = [(KTClientDataRecord *)self addedDate];
  v11 = [v10 kt_dateToString];
  [v3 setObject:v11 forKeyedSubscript:@"addedDate"];

  v12 = [(KTClientDataRecord *)self addedDate];
  v13 = [v12 kt_toISO_8601_UTCString];
  [v3 setObject:v13 forKeyedSubscript:@"addedDateReadable"];

  v14 = [(KTClientDataRecord *)self markedForDeletion];

  if (v14)
  {
    v15 = [(KTClientDataRecord *)self markedForDeletion];
    v16 = [v15 kt_dateToString];
    [v3 setObject:v16 forKeyedSubscript:@"markedDate"];

    v17 = [(KTClientDataRecord *)self markedForDeletion];
    v18 = [v17 kt_toISO_8601_UTCString];
    [v3 setObject:v18 forKeyedSubscript:@"markedDateReadable"];
  }
  v19 = [(KTClientDataRecord *)self expiry];
  v20 = [v19 kt_dateToString];
  [v3 setObject:v20 forKeyedSubscript:@"expiry"];

  v21 = [(KTClientDataRecord *)self expiry];
  v22 = [v21 kt_toISO_8601_UTCString];
  [v3 setObject:v22 forKeyedSubscript:@"expiryReadable"];

  v23 = [(KTClientDataRecord *)self escrowExpiry];

  if (v23)
  {
    v24 = [(KTClientDataRecord *)self escrowExpiry];
    v25 = [v24 kt_dateToString];
    [v3 setObject:v25 forKeyedSubscript:@"escrowExpiry"];

    v26 = [(KTClientDataRecord *)self escrowExpiry];
    v27 = [v26 kt_toISO_8601_UTCString];
    [v3 setObject:v27 forKeyedSubscript:@"escrowExpiryReadable"];
  }
  if ([(KTClientDataRecord *)self verified])
  {
    v28 = +[NSNumber numberWithBool:[(KTClientDataRecord *)self verified]];
    [v3 setObject:v28 forKeyedSubscript:@"matchesServerData"];
  }
  if ([(KTClientDataRecord *)self synced])
  {
    v29 = +[NSNumber numberWithBool:[(KTClientDataRecord *)self synced]];
    [v3 setObject:v29 forKeyedSubscript:@"matchesSyncedData"];
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(KTClientDataRecord *)self applicationVersion];
  if (v4 > 0xFFFFFFFE) {
    abort();
  }
  unint64_t v5 = v4;
  v6 = [(KTClientDataRecord *)self clientData];
  [v12 encodeObject:v6 forKey:@"clientData"];

  [v12 encodeInteger:v5 forKey:@"applicationVersion"];
  v7 = [(KTClientDataRecord *)self clientDataHash];
  [v12 encodeObject:v7 forKey:@"clientDataHash"];

  v8 = [(KTClientDataRecord *)self markedForDeletion];
  [v8 timeIntervalSince1970];
  [v12 encodeDouble:@"markedForDeletion" forKey:@"markedForDeletion"];

  v9 = [(KTClientDataRecord *)self addedDate];
  [v9 timeIntervalSince1970];
  [v12 encodeDouble:@"addedDate"];

  v10 = [(KTClientDataRecord *)self expiry];
  [v10 timeIntervalSince1970];
  [v12 encodeDouble:@"expiry" forKey:@"expiry"];

  v11 = [(KTClientDataRecord *)self escrowExpiry];
  [v11 timeIntervalSince1970];
  [v12 encodeDouble:@"escrowExpiry" forKey:@"escrowExpiry"];

  [v12 encodeBool:-[KTClientDataRecord verified](self, "verified") forKey:@"verified"];
  [v12 encodeBool:-[KTClientDataRecord synced](self, "synced") forKey:@"synced"];
}

- (KTClientDataRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientData"];
  unint64_t v6 = (unint64_t)[v4 decodeIntegerForKey:@"applicationVersion"];
  if ((v6 & 0x8000000000000000) != 0) {
    abort();
  }
  unint64_t v7 = v6;
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  unsigned int v21 = [v4 decodeBoolForKey:@"verified"];
  unsigned int v20 = [v4 decodeBoolForKey:@"synced"];
  [v4 decodeDoubleForKey:@"markedForDeletion"];
  if (v9 <= 0.0)
  {
    v10 = 0;
  }
  else
  {
    v10 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  [v4 decodeDoubleForKey:@"addedDate"];
  if (v11 <= 0.0)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  [v4 decodeDoubleForKey:@"expiry"];
  if (v13 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  [v4 decodeDoubleForKey:@"escrowExpiry"];
  if (v15 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  v17 = objc_alloc_init(KTClientDataRecord);
  v18 = v17;
  if (v17)
  {
    [(KTClientDataRecord *)v17 setClientData:v5];
    [(KTClientDataRecord *)v18 setApplicationVersion:v7];
    [(KTClientDataRecord *)v18 setClientDataHash:v8];
    [(KTClientDataRecord *)v18 setMarkedForDeletion:v10];
    [(KTClientDataRecord *)v18 setAddedDate:v12];
    [(KTClientDataRecord *)v18 setExpiry:v14];
    [(KTClientDataRecord *)v18 setEscrowExpiry:v16];
    [(KTClientDataRecord *)v18 setVerified:v21];
    [(KTClientDataRecord *)v18 setSynced:v20];
  }

  return v18;
}

- (KTClientDataRecord)initWithMutation:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)KTClientDataRecord;
  unint64_t v5 = [(KTClientDataRecord *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 clientDataHash];
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)[v4 appVersion];
    v8 = [v4 idsMutation];
    if ([v8 mutationType] == 1)
    {
    }
    else
    {
      double v9 = [v4 idsMutation];
      unsigned int v10 = [v9 mutationType];

      if (v10 != 4)
      {
        v16 = [v4 idsMutation];
        if ([v16 mutationType] == 2)
        {
        }
        else
        {
          v17 = [v4 idsMutation];
          unsigned int v18 = [v17 mutationType];

          if (v18 != 5) {
            goto LABEL_12;
          }
        }
        expiry = [v4 idsMutation];
        uint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[expiry mutationMs] / 1000.0);
        markedForDeletion = v5->_markedForDeletion;
        v5->_markedForDeletion = (NSDate *)v19;

        goto LABEL_11;
      }
    }
    double v11 = [v4 idsMutation];
    uint64_t v12 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v11 mutationMs] / 1000.0);
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v12;

    if ([v4 expiryMs])
    {
      uint64_t v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 expiryMs] / 1000.0);
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v14;
LABEL_11:
    }
  }
LABEL_12:

  return v5;
}

- (KTClientDataRecord)initWithSingleDataRecord:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KTClientDataRecord;
  unint64_t v5 = [(KTClientDataRecord *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 clientDataHash];
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)[v4 appVersion];
    uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 addedMs] / 1000.0);
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v8;

    if ([v4 markedForDeletionMs])
    {
      uint64_t v10 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 markedForDeletionMs] / 1000.0);
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = (NSDate *)v10;
    }
    else
    {
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = 0;
    }

    if ([v4 expiryMs])
    {
      uint64_t v12 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 expiryMs] / 1000.0);
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v12;
    }
    if ([v4 escrowExpiryMs])
    {
      uint64_t v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 escrowExpiryMs] / 1000.0);
      escrowExpiry = v5->_escrowExpiry;
      v5->_escrowExpiry = (NSDate *)v14;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTClientDataRecord *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [(KTClientDataRecord *)self clientData];
      uint64_t v7 = [(KTClientDataRecord *)v5 clientData];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        double v9 = [(KTClientDataRecord *)self clientData];
        uint64_t v10 = [(KTClientDataRecord *)v5 clientData];
        unsigned int v11 = [v9 isEqualToData:v10];

        if (!v11) {
          goto LABEL_32;
        }
      }
      id v13 = [(KTClientDataRecord *)self applicationVersion];
      if (v13 == (id)[(KTClientDataRecord *)v5 applicationVersion])
      {
        uint64_t v14 = [(KTClientDataRecord *)self clientDataHash];
        uint64_t v15 = [(KTClientDataRecord *)v5 clientDataHash];
        if (v14 == (void *)v15)
        {
        }
        else
        {
          v16 = (void *)v15;
          objc_super v17 = [(KTClientDataRecord *)self clientDataHash];
          unsigned int v18 = [(KTClientDataRecord *)v5 clientDataHash];
          unsigned int v19 = [v17 isEqualToData:v18];

          if (!v19) {
            goto LABEL_32;
          }
        }
        unsigned int v20 = [(KTClientDataRecord *)self addedDate];
        uint64_t v21 = [(KTClientDataRecord *)v5 addedDate];
        if (v20 == (void *)v21)
        {
        }
        else
        {
          objc_super v22 = (void *)v21;
          v23 = [(KTClientDataRecord *)self addedDate];
          v24 = [(KTClientDataRecord *)v5 addedDate];
          unsigned int v25 = [v23 kt_isEqualWithinOneMillisecond:v24];

          if (!v25) {
            goto LABEL_32;
          }
        }
        v26 = [(KTClientDataRecord *)self markedForDeletion];
        uint64_t v27 = [(KTClientDataRecord *)v5 markedForDeletion];
        if (v26 == (void *)v27)
        {
        }
        else
        {
          v28 = (void *)v27;
          v29 = [(KTClientDataRecord *)self markedForDeletion];
          v30 = [(KTClientDataRecord *)v5 markedForDeletion];
          unsigned int v31 = [v29 kt_isEqualWithinOneMillisecond:v30];

          if (!v31) {
            goto LABEL_32;
          }
        }
        v32 = [(KTClientDataRecord *)self expiry];
        uint64_t v33 = [(KTClientDataRecord *)v5 expiry];
        if (v32 == (void *)v33)
        {
        }
        else
        {
          v34 = (void *)v33;
          v35 = [(KTClientDataRecord *)self expiry];
          v36 = [(KTClientDataRecord *)v5 expiry];
          unsigned int v37 = [v35 kt_isEqualWithinOneMillisecond:v36];

          if (!v37) {
            goto LABEL_32;
          }
        }
        v38 = [(KTClientDataRecord *)self escrowExpiry];
        uint64_t v39 = [(KTClientDataRecord *)v5 escrowExpiry];
        if (v38 == (void *)v39)
        {
        }
        else
        {
          v40 = (void *)v39;
          v41 = [(KTClientDataRecord *)self escrowExpiry];
          v42 = [(KTClientDataRecord *)v5 escrowExpiry];
          unsigned int v43 = [v41 kt_isEqualWithinOneMillisecond:v42];

          if (!v43) {
            goto LABEL_32;
          }
        }
        unsigned int v44 = [(KTClientDataRecord *)self verified];
        if (v44 == [(KTClientDataRecord *)v5 verified])
        {
          unsigned int v45 = [(KTClientDataRecord *)self synced];
          if (v45 == [(KTClientDataRecord *)v5 synced])
          {
            BOOL v12 = 1;
            goto LABEL_33;
          }
        }
      }
LABEL_32:
      BOOL v12 = 0;
LABEL_33:

      goto LABEL_34;
    }
    BOOL v12 = 0;
  }
LABEL_34:

  return v12;
}

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(KTClientDataRecord *)self markedForDeletion];

  if (v5)
  {
    uint64_t v6 = [(KTClientDataRecord *)self markedForDeletion];
    BOOL v7 = [v6 compare:v4] == (id)-1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)expired:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(KTClientDataRecord *)self expiry];

  if (v5)
  {
    uint64_t v6 = [(KTClientDataRecord *)self expiry];
    BOOL v7 = [v6 compare:v4] == (id)-1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)active:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(KTClientDataRecord *)self markedForDeletion];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(KTClientDataRecord *)self markedForDeletion],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 compare:v4],
        v7,
        v6,
        v8 == (id)-1))
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v9 = [(KTClientDataRecord *)self expiry];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      unsigned int v11 = [(KTClientDataRecord *)self expiry];
      BOOL v12 = [v11 compare:v4] != (id)-1;
    }
    else
    {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (void)markWithMutationMs:(unint64_t)a3
{
  uint64_t v5 = [(KTClientDataRecord *)self markedForDeletion];

  if (!v5)
  {
    double v6 = (double)a3 / 1000.0;
    BOOL v7 = +[NSDate dateWithTimeIntervalSince1970:v6];
    [(KTClientDataRecord *)self setMarkedForDeletion:v7];

    [(KTClientDataRecord *)self setExpiry:0];
    id v8 = +[NSDate dateWithTimeIntervalSince1970:v6 + (double)kKTEscrowExpiryPeriod];
    [(KTClientDataRecord *)self setEscrowExpiry:v8];
  }
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v16 = a3;
  uint64_t v5 = [v16 idsMutation];
  id v6 = [v5 mutationMs];

  BOOL v7 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)v6 / 1000.0];
  if ([(KTClientDataRecord *)self marked:v7] || [(KTClientDataRecord *)self expired:v7])
  {
    [(KTClientDataRecord *)self setMarkedForDeletion:0];
    id v8 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)v6 / 1000.0];
    [(KTClientDataRecord *)self setAddedDate:v8];

    if (![v16 expiryMs]) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ([v16 expiryMs])
  {
    BOOL v12 = [(KTClientDataRecord *)self expiry];
    [v12 timeIntervalSince1970];
    double v14 = vabdd_f64(v13, (double)((unint64_t)[v16 expiryMs] / 0x3E8));
    double v15 = (double)kKTExpiryGracePeriod;

    if (v14 > v15)
    {
LABEL_4:
      uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v16 expiryMs] / 1000.0);
      [(KTClientDataRecord *)self setExpiry:v9];

      id v10 = [v16 expiryMs];
      unsigned int v11 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)v10 / 1000.0 + (double)kKTEscrowExpiryPeriod];
      [(KTClientDataRecord *)self setEscrowExpiry:v11];
    }
  }
LABEL_5:
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 idsMutation];
  id v6 = [v5 mutationMs];

  BOOL v7 = [(KTClientDataRecord *)self markedForDeletion];

  if (v7)
  {
    id v8 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)v6 / 1000.0 + (double)kKTEscrowExpiryPeriod];
    [(KTClientDataRecord *)self setEscrowExpiry:v8];
  }
  else
  {
    [(KTClientDataRecord *)self markWithMutationMs:v6];
  }
}

- (BOOL)shouldRemove
{
  v3 = +[NSDate now];
  id v4 = [(KTClientDataRecord *)self escrowExpiry];
  BOOL v5 = [v3 compare:v4] == (id)1;

  return v5;
}

- (NSData)clientData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientData:(id)a3
{
}

- (unint64_t)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(unint64_t)a3
{
  self->_applicationVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (NSDate)markedForDeletion
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMarkedForDeletion:(id)a3
{
}

- (NSDate)addedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAddedDate:(id)a3
{
}

- (NSDate)expiry
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExpiry:(id)a3
{
}

- (NSDate)escrowExpiry
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEscrowExpiry:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)synced
{
  return self->_synced;
}

- (void)setSynced:(BOOL)a3
{
  self->_synced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escrowExpiry, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_markedForDeletion, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

@end