@interface SPBeaconShare
+ (BOOL)supportsSecureCoding;
- (BOOL)delegationStatus;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSUUID)beaconIdentifier;
- (NSUUID)identifier;
- (NSUUID)peerTrustIdentifier;
- (NSUUID)sharingCircleIdentifier;
- (SPBeaconShare)initWithCoder:(id)a3;
- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11;
- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11 delegationStatus:(BOOL)a12;
- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11 visitorCount:(int64_t)a12 delegationStatus:(BOOL)a13;
- (SPHandle)owner;
- (SPHandle)sharee;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)state;
- (int64_t)visitorCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDelegationStatus:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPeerTrustIdentifier:(id)a3;
- (void)setSharee:(id)a3;
- (void)setSharingCircleIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVisitorCount:(int64_t)a3;
@end

@implementation SPBeaconShare

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11 visitorCount:(int64_t)a12 delegationStatus:(BOOL)a13
{
  id v31 = a3;
  id v20 = a4;
  id obj = a5;
  id v21 = a5;
  id v29 = a6;
  id v33 = a6;
  id v30 = a7;
  id v32 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v34.receiver = self;
  v34.super_class = (Class)SPBeaconShare;
  v25 = [(SPBeaconShare *)&v34 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_identifier, a3);
    objc_storeStrong((id *)&v26->_beaconIdentifier, a4);
    objc_storeStrong((id *)&v26->_sharingCircleIdentifier, obj);
    objc_storeStrong((id *)&v26->_peerTrustIdentifier, v29);
    objc_storeStrong((id *)&v26->_owner, v30);
    objc_storeStrong((id *)&v26->_sharee, a8);
    v26->_state = a9;
    objc_storeStrong((id *)&v26->_creationDate, a10);
    objc_storeStrong((id *)&v26->_expirationDate, a11);
    v26->_visitorCount = a12;
    v26->_delegationStatus = a13;
  }

  return v26;
}

- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11
{
  LOBYTE(v12) = 0;
  return [(SPBeaconShare *)self initWithIdentifier:a3 beaconIdentifier:a4 sharingCircleIdentifier:a5 peerTrustIdentifier:a6 owner:a7 sharee:a8 state:a9 creationDate:a10 expirationDate:a11 visitorCount:0 delegationStatus:v12];
}

- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11 delegationStatus:(BOOL)a12
{
  LOBYTE(v13) = a12;
  return [(SPBeaconShare *)self initWithIdentifier:a3 beaconIdentifier:a4 sharingCircleIdentifier:a5 peerTrustIdentifier:a6 owner:a7 sharee:a8 state:a9 creationDate:a10 expirationDate:a11 visitorCount:0 delegationStatus:v13];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPBeaconShare *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPBeaconShare *)self identifier];
      v7 = [(SPBeaconShare *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(SPBeaconShare *)self beaconIdentifier];
        v9 = [(SPBeaconShare *)v5 beaconIdentifier];
        if ([v8 isEqual:v9])
        {
          v10 = [(SPBeaconShare *)self sharingCircleIdentifier];
          v11 = [(SPBeaconShare *)v5 sharingCircleIdentifier];
          if ([v10 isEqual:v11])
          {
            uint64_t v12 = [(SPBeaconShare *)self peerTrustIdentifier];
            id v31 = [(SPBeaconShare *)v5 peerTrustIdentifier];
            id v32 = v12;
            if ([v12 isEqual:v31])
            {
              uint64_t v13 = [(SPBeaconShare *)self owner];
              id v29 = [(SPBeaconShare *)v5 owner];
              id v30 = v13;
              if ([v13 isEqual:v29])
              {
                v14 = [(SPBeaconShare *)self sharee];
                v27 = [(SPBeaconShare *)v5 sharee];
                v28 = v14;
                if ([v14 isEqual:v27])
                {
                  uint64_t v15 = [(SPBeaconShare *)self creationDate];
                  uint64_t v16 = [(SPBeaconShare *)v5 creationDate];
                  v26 = (void *)v15;
                  v17 = (void *)v15;
                  v18 = (void *)v16;
                  if ([v17 isEqual:v16]
                    && (int64_t v23 = [(SPBeaconShare *)self visitorCount],
                        v23 == [(SPBeaconShare *)v5 visitorCount])
                    && (BOOL v24 = [(SPBeaconShare *)self delegationStatus],
                        v24 == [(SPBeaconShare *)v5 delegationStatus]))
                  {
                    v25 = [(SPBeaconShare *)self expirationDate];
                    id v22 = [(SPBeaconShare *)v5 expirationDate];
                    if (objc_msgSend(v25, "isEqual:"))
                    {
                      int64_t v21 = [(SPBeaconShare *)self state];
                      BOOL v19 = v21 == [(SPBeaconShare *)v5 state];
                    }
                    else
                    {
                      BOOL v19 = 0;
                    }
                  }
                  else
                  {
                    BOOL v19 = 0;
                  }
                }
                else
                {
                  BOOL v19 = 0;
                }
              }
              else
              {
                BOOL v19 = 0;
              }
            }
            else
            {
              BOOL v19 = 0;
            }
          }
          else
          {
            BOOL v19 = 0;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  id v22 = [(SPBeaconShare *)self identifier];
  uint64_t v3 = [v22 hash];
  v4 = [(SPBeaconShare *)self beaconIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(SPBeaconShare *)self sharingCircleIdentifier];
  uint64_t v7 = [v6 hash];
  v8 = [(SPBeaconShare *)self peerTrustIdentifier];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  int64_t v10 = [(SPBeaconShare *)self visitorCount];
  uint64_t v11 = v9 ^ v10 ^ [(SPBeaconShare *)self delegationStatus];
  uint64_t v12 = [(SPBeaconShare *)self owner];
  uint64_t v13 = [v12 hash];
  v14 = [(SPBeaconShare *)self sharee];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = [(SPBeaconShare *)self creationDate];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SPBeaconShare *)self expirationDate];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  unint64_t v20 = v19 ^ [(SPBeaconShare *)self state];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = [SPBeaconShare alloc];
  uint64_t v16 = [(SPBeaconShare *)self identifier];
  v4 = [(SPBeaconShare *)self beaconIdentifier];
  uint64_t v5 = [(SPBeaconShare *)self sharingCircleIdentifier];
  v6 = [(SPBeaconShare *)self peerTrustIdentifier];
  uint64_t v7 = [(SPBeaconShare *)self owner];
  v8 = [(SPBeaconShare *)self sharee];
  int64_t v9 = [(SPBeaconShare *)self state];
  int64_t v10 = [(SPBeaconShare *)self creationDate];
  uint64_t v11 = [(SPBeaconShare *)self expirationDate];
  int64_t v12 = [(SPBeaconShare *)self visitorCount];
  LOBYTE(v15) = [(SPBeaconShare *)self delegationStatus];
  uint64_t v13 = [(SPBeaconShare *)v17 initWithIdentifier:v16 beaconIdentifier:v4 sharingCircleIdentifier:v5 peerTrustIdentifier:v6 owner:v7 sharee:v8 state:v9 creationDate:v10 expirationDate:v11 visitorCount:v12 delegationStatus:v15];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_beaconIdentifier forKey:@"beaconIdentifier"];
  [v5 encodeObject:self->_sharingCircleIdentifier forKey:@"sharingCircleIdentifier"];
  [v5 encodeObject:self->_peerTrustIdentifier forKey:@"peerTrustIdentifier"];
  [v5 encodeObject:self->_owner forKey:@"owner"];
  [v5 encodeObject:self->_sharee forKey:@"sharee"];
  [v5 encodeInt64:self->_state forKey:@"state"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeInteger:self->_visitorCount forKey:@"visitorCount"];
  [v5 encodeBool:self->_delegationStatus forKey:@"delegationStatus"];
}

- (SPBeaconShare)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingCircleIdentifier"];
  sharingCircleIdentifier = self->_sharingCircleIdentifier;
  self->_sharingCircleIdentifier = v9;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerTrustIdentifier"];
  peerTrustIdentifier = self->_peerTrustIdentifier;
  self->_peerTrustIdentifier = v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owner"];
  owner = self->_owner;
  self->_owner = v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharee"];
  sharee = self->_sharee;
  self->_sharee = v15;

  self->_state = [v4 decodeIntegerForKey:@"state"];
  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  creationDate = self->_creationDate;
  self->_creationDate = v17;

  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v19;

  self->_visitorCount = [v4 decodeIntegerForKey:@"visitorCount"];
  char v21 = [v4 decodeBoolForKey:@"delegationStatus"];

  self->_delegationStatus = v21;
  return self;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPBeaconShare *)self identifier];
  v6 = [(SPBeaconShare *)self owner];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p %@ %@>", v4, self, v5, v6];

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (SPHandle)sharee
{
  return self->_sharee;
}

- (void)setSharee:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)visitorCount
{
  return self->_visitorCount;
}

- (void)setVisitorCount:(int64_t)a3
{
  self->_visitorCount = a3;
}

- (BOOL)delegationStatus
{
  return self->_delegationStatus;
}

- (void)setDelegationStatus:(BOOL)a3
{
  self->_delegationStatus = a3;
}

- (NSUUID)sharingCircleIdentifier
{
  return self->_sharingCircleIdentifier;
}

- (void)setSharingCircleIdentifier:(id)a3
{
}

- (NSUUID)peerTrustIdentifier
{
  return self->_peerTrustIdentifier;
}

- (void)setPeerTrustIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sharee, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end