@interface SFEngagementSignal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)domainEngagementScores;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)localScore;
- (NSNumber)localScoreConfidence;
- (NSNumber)serverScore;
- (NSNumber)serverScoreConfidence;
- (NSNumber)version;
- (SFEngagementSignal)initWithCoder:(id)a3;
- (SFEngagementSignal)initWithProtobuf:(id)a3;
- (SFEngagementSignal)initWithVersion:(id)a3 serverScore:(id)a4 severScoreConfidence:(id)a5 localScore:(id)a6 localScoreConfidence:(id)a7 domainScores:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainEngagementScores:(id)a3;
- (void)setLocalScore:(id)a3;
- (void)setLocalScoreConfidence:(id)a3;
- (void)setServerScore:(id)a3;
- (void)setServerScoreConfidence:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SFEngagementSignal

- (SFEngagementSignal)initWithVersion:(id)a3 serverScore:(id)a4 severScoreConfidence:(id)a5 localScore:(id)a6 localScoreConfidence:(id)a7 domainScores:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SFEngagementSignal;
  v20 = [(SFEngagementSignal *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(SFEngagementSignal *)v20 setVersion:v14];
    [(SFEngagementSignal *)v21 setServerScore:v15];
    [(SFEngagementSignal *)v21 setServerScoreConfidence:v16];
    [(SFEngagementSignal *)v21 setLocalScore:v17];
    [(SFEngagementSignal *)v21 setLocalScoreConfidence:v18];
    [(SFEngagementSignal *)v21 setDomainEngagementScores:v19];
  }

  return v21;
}

- (SFEngagementSignal)initWithProtobuf:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SFEngagementSignal;
  v5 = [(SFEngagementSignal *)&v29 init];
  if (v5)
  {
    if ([v4 version])
    {
      v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "version"));
      [(SFEngagementSignal *)v5 setVersion:v6];
    }
    [v4 serverScore];
    if (v7 != 0.0)
    {
      v8 = NSNumber;
      [v4 serverScore];
      v9 = objc_msgSend(v8, "numberWithFloat:");
      [(SFEngagementSignal *)v5 setServerScore:v9];
    }
    [v4 localScore];
    if (v10 != 0.0)
    {
      v11 = NSNumber;
      [v4 localScore];
      v12 = objc_msgSend(v11, "numberWithFloat:");
      [(SFEngagementSignal *)v5 setLocalScore:v12];
    }
    if ([v4 serverScoreConfidence])
    {
      v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "serverScoreConfidence"));
      [(SFEngagementSignal *)v5 setServerScoreConfidence:v13];
    }
    if ([v4 localScoreConfidence])
    {
      id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "localScoreConfidence"));
      [(SFEngagementSignal *)v5 setLocalScoreConfidence:v14];
    }
    id v15 = [v4 domainEngagementScores];
    if (v15) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v16 = 0;
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = objc_msgSend(v4, "domainEngagementScores", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [[SFDomainEngagementScore alloc] initWithProtobuf:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if (v22) {
            [v16 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v19);
    }

    [(SFEngagementSignal *)v5 setDomainEngagementScores:v16];
    objc_super v23 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainEngagementScores, 0);
  objc_storeStrong((id *)&self->_localScoreConfidence, 0);
  objc_storeStrong((id *)&self->_serverScoreConfidence, 0);
  objc_storeStrong((id *)&self->_localScore, 0);
  objc_storeStrong((id *)&self->_serverScore, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setDomainEngagementScores:(id)a3
{
}

- (NSArray)domainEngagementScores
{
  return self->_domainEngagementScores;
}

- (void)setLocalScoreConfidence:(id)a3
{
}

- (NSNumber)localScoreConfidence
{
  return self->_localScoreConfidence;
}

- (void)setServerScoreConfidence:(id)a3
{
}

- (NSNumber)serverScoreConfidence
{
  return self->_serverScoreConfidence;
}

- (void)setLocalScore:(id)a3
{
}

- (NSNumber)localScore
{
  return self->_localScore;
}

- (void)setServerScore:(id)a3
{
}

- (NSNumber)serverScore
{
  return self->_serverScore;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (unint64_t)hash
{
  v3 = [(SFEngagementSignal *)self version];
  uint64_t v4 = [v3 hash];
  v5 = [(SFEngagementSignal *)self serverScore];
  uint64_t v6 = [v5 hash] ^ v4;
  float v7 = [(SFEngagementSignal *)self localScore];
  uint64_t v8 = [v7 hash];
  v9 = [(SFEngagementSignal *)self serverScoreConfidence];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(SFEngagementSignal *)self localScoreConfidence];
  uint64_t v12 = [v11 hash];
  v13 = [(SFEngagementSignal *)self domainEngagementScores];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFEngagementSignal *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFEngagementSignal *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      float v7 = [(SFEngagementSignal *)self version];
      uint64_t v8 = [(SFEngagementSignal *)v6 version];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v9 = [(SFEngagementSignal *)self version];
      if (v9)
      {
        uint64_t v10 = [(SFEngagementSignal *)self version];
        v57 = [(SFEngagementSignal *)v6 version];
        if (!objc_msgSend(v10, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_34;
        }
        v54 = v10;
      }
      v56 = [(SFEngagementSignal *)self serverScore];
      v55 = [(SFEngagementSignal *)v6 serverScore];
      if ((v56 == 0) == (v55 != 0)) {
        goto LABEL_32;
      }
      uint64_t v12 = [(SFEngagementSignal *)self serverScore];
      if (v12)
      {
        v13 = [(SFEngagementSignal *)self serverScore];
        v3 = [(SFEngagementSignal *)v6 serverScore];
        if (([v13 isEqual:v3] & 1) == 0)
        {

LABEL_31:
LABEL_32:

          char v11 = 0;
          goto LABEL_33;
        }
        v51 = v13;
        v53 = v8;
        unint64_t v14 = v57;
        id v15 = v12;
      }
      else
      {
        v53 = v8;
        unint64_t v14 = v57;
        id v15 = 0;
      }
      v52 = v3;
      v57 = v14;
      id v16 = [(SFEngagementSignal *)self localScore];
      id v17 = [(SFEngagementSignal *)v6 localScore];
      uint64_t v12 = v15;
      uint64_t v8 = v53;
      if ((v16 == 0) != (v17 != 0))
      {
        id v50 = v17;
        v49 = [(SFEngagementSignal *)self localScore];
        if (v49)
        {
          uint64_t v18 = [(SFEngagementSignal *)self localScore];
          v46 = [(SFEngagementSignal *)v6 localScore];
          v47 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            char v11 = 0;
            v24 = v49;
            goto LABEL_56;
          }
          v48 = v15;
        }
        else
        {
          v48 = v15;
        }
        uint64_t v19 = [(SFEngagementSignal *)self serverScoreConfidence];
        uint64_t v20 = [(SFEngagementSignal *)v6 serverScoreConfidence];
        if ((v19 == 0) != (v20 != 0))
        {
          v45 = v20;
          [(SFEngagementSignal *)self serverScoreConfidence];
          v43 = uint64_t v12 = v48;
          v44 = v19;
          if (v43)
          {
            v21 = [(SFEngagementSignal *)self serverScoreConfidence];
            v41 = [(SFEngagementSignal *)v6 serverScoreConfidence];
            v42 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              char v11 = 0;
              v22 = (void *)v43;
LABEL_54:

LABEL_55:
              v24 = v49;
              if (!v49)
              {
LABEL_57:

                if (v12)
                {
                }
LABEL_33:
                uint64_t v10 = v54;
                if (!v9)
                {
LABEL_35:

                  goto LABEL_36;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_56:

              goto LABEL_57;
            }
          }
          long long v25 = [(SFEngagementSignal *)self localScoreConfidence];
          long long v26 = [(SFEngagementSignal *)v6 localScoreConfidence];
          if ((v25 == 0) == (v26 != 0))
          {

            char v11 = 0;
            uint64_t v12 = v48;
            goto LABEL_53;
          }
          v39 = v25;
          v40 = v26;
          [(SFEngagementSignal *)self localScoreConfidence];
          v38 = uint64_t v12 = v48;
          if (v38
            && ([(SFEngagementSignal *)self localScoreConfidence],
                long long v27 = objc_claimAutoreleasedReturnValue(),
                [(SFEngagementSignal *)v6 localScoreConfidence],
                v36 = objc_claimAutoreleasedReturnValue(),
                v37 = v27,
                !objc_msgSend(v27, "isEqual:")))
          {
            char v11 = 0;
            v32 = (void *)v38;
          }
          else
          {
            long long v28 = [(SFEngagementSignal *)self domainEngagementScores];
            objc_super v29 = [(SFEngagementSignal *)v6 domainEngagementScores];
            if ((v28 == 0) == (v29 != 0))
            {

              char v11 = 0;
              uint64_t v12 = v48;
            }
            else
            {
              v35 = v29;
              uint64_t v30 = [(SFEngagementSignal *)self domainEngagementScores];
              uint64_t v12 = v48;
              if (v30)
              {
                v34 = (void *)v30;
                v33 = [(SFEngagementSignal *)self domainEngagementScores];
                uint64_t v31 = [(SFEngagementSignal *)v6 domainEngagementScores];
                char v11 = objc_msgSend(v33, "isEqual:");
              }
              else
              {

                char v11 = 1;
              }
            }
            v32 = (void *)v38;
            if (!v38) {
              goto LABEL_52;
            }
          }

LABEL_52:
LABEL_53:
          v22 = (void *)v43;
          if (!v43) {
            goto LABEL_55;
          }
          goto LABEL_54;
        }

        uint64_t v12 = v48;
        if (v49)
        {
        }
        id v17 = v50;
      }

      if (v12)
      {
      }
      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_37:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFEngagementSignal *)self version];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setVersion:v6];

  float v7 = [(SFEngagementSignal *)self serverScore];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setServerScore:v8];

  v9 = [(SFEngagementSignal *)self localScore];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setLocalScore:v10];

  char v11 = [(SFEngagementSignal *)self serverScoreConfidence];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setServerScoreConfidence:v12];

  v13 = [(SFEngagementSignal *)self localScoreConfidence];
  unint64_t v14 = (void *)[v13 copy];
  [v4 setLocalScoreConfidence:v14];

  id v15 = [(SFEngagementSignal *)self domainEngagementScores];
  id v16 = (void *)[v15 copy];
  [v4 setDomainEngagementScores:v16];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBEngagementSignal alloc] initWithFacade:self];
  v3 = [(_SFPBEngagementSignal *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBEngagementSignal alloc] initWithFacade:self];
  v3 = [(_SFPBEngagementSignal *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBEngagementSignal alloc] initWithFacade:self];
  v5 = [(_SFPBEngagementSignal *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFEngagementSignal)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBEngagementSignal alloc] initWithData:v5];
  float v7 = [(SFEngagementSignal *)self initWithProtobuf:v6];

  return v7;
}

@end