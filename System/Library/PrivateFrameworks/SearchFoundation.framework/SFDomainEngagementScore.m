@interface SFDomainEngagementScore
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)iFunScore;
- (NSNumber)score;
- (NSNumber)scoreConfidence;
- (SFDomainEngagementScore)initWithCoder:(id)a3;
- (SFDomainEngagementScore)initWithDomain:(int)a3 scoreConfidence:(id)a4 score:(id)a5;
- (SFDomainEngagementScore)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(int)a3;
- (void)setIFunScore:(id)a3;
- (void)setScore:(id)a3;
- (void)setScoreConfidence:(id)a3;
@end

@implementation SFDomainEngagementScore

- (SFDomainEngagementScore)initWithDomain:(int)a3 scoreConfidence:(id)a4 score:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SFDomainEngagementScore;
  v10 = [(SFDomainEngagementScore *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SFDomainEngagementScore *)v10 setDomain:v6];
    [(SFDomainEngagementScore *)v11 setScoreConfidence:v8];
    [(SFDomainEngagementScore *)v11 setScore:v9];
  }

  return v11;
}

- (SFDomainEngagementScore)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFDomainEngagementScore;
  v5 = [(SFDomainEngagementScore *)&v15 init];
  if (v5)
  {
    if ([v4 domain]) {
      -[SFDomainEngagementScore setDomain:](v5, "setDomain:", [v4 domain]);
    }
    if ([v4 scoreConfidence])
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "scoreConfidence"));
      [(SFDomainEngagementScore *)v5 setScoreConfidence:v6];
    }
    [v4 score];
    if (v7 != 0.0)
    {
      id v8 = NSNumber;
      [v4 score];
      id v9 = objc_msgSend(v8, "numberWithFloat:");
      [(SFDomainEngagementScore *)v5 setScore:v9];
    }
    [v4 iFunScore];
    if (v10 != 0.0)
    {
      v11 = NSNumber;
      [v4 iFunScore];
      v12 = objc_msgSend(v11, "numberWithFloat:");
      [(SFDomainEngagementScore *)v5 setIFunScore:v12];
    }
    objc_super v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFunScore, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_scoreConfidence, 0);
}

- (void)setIFunScore:(id)a3
{
}

- (NSNumber)iFunScore
{
  return self->_iFunScore;
}

- (void)setScore:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScoreConfidence:(id)a3
{
}

- (NSNumber)scoreConfidence
{
  return self->_scoreConfidence;
}

- (int)domain
{
  return self->_domain;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFDomainEngagementScore *)self domain];
  id v4 = [(SFDomainEngagementScore *)self scoreConfidence];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(SFDomainEngagementScore *)self score];
  uint64_t v7 = [v6 hash];
  id v8 = [(SFDomainEngagementScore *)self iFunScore];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFDomainEngagementScore *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(SFDomainEngagementScore *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      int v7 = [(SFDomainEngagementScore *)self domain];
      if (v7 != [(SFDomainEngagementScore *)v6 domain])
      {
        char v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      id v8 = [(SFDomainEngagementScore *)self scoreConfidence];
      unint64_t v9 = [(SFDomainEngagementScore *)v6 scoreConfidence];
      if ((v8 == 0) == (v9 != 0))
      {
        char v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      float v10 = [(SFDomainEngagementScore *)self scoreConfidence];
      if (v10)
      {
        uint64_t v3 = [(SFDomainEngagementScore *)self scoreConfidence];
        v11 = [(SFDomainEngagementScore *)v6 scoreConfidence];
        if (![v3 isEqual:v11])
        {
          char v12 = 0;
          goto LABEL_30;
        }
        v32 = v11;
      }
      objc_super v13 = [(SFDomainEngagementScore *)self score];
      v14 = [(SFDomainEngagementScore *)v6 score];
      objc_super v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        char v12 = 0;
        goto LABEL_29;
      }
      v16 = [(SFDomainEngagementScore *)self score];
      if (v16)
      {
        v26 = v13;
        v17 = [(SFDomainEngagementScore *)self score];
        v28 = [(SFDomainEngagementScore *)v6 score];
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v12 = 0;
          objc_super v13 = v26;
          goto LABEL_27;
        }
        v30 = v16;
        v31 = v3;
        objc_super v13 = v26;
      }
      else
      {
        v30 = 0;
        v31 = v3;
      }
      v18 = [(SFDomainEngagementScore *)self iFunScore];
      v19 = [(SFDomainEngagementScore *)v6 iFunScore];
      if ((v18 == 0) == (v19 != 0))
      {

        char v12 = 0;
        v16 = v30;
        uint64_t v3 = v31;
        if (!v30) {
          goto LABEL_28;
        }
      }
      else
      {
        v25 = v18;
        v27 = v19;
        uint64_t v20 = [(SFDomainEngagementScore *)self iFunScore];
        v16 = v30;
        if (v20)
        {
          v24 = (void *)v20;
          v23 = [(SFDomainEngagementScore *)self iFunScore];
          v21 = [(SFDomainEngagementScore *)v6 iFunScore];
          char v12 = objc_msgSend(v23, "isEqual:");
        }
        else
        {

          char v12 = 1;
        }
        uint64_t v3 = v31;
        if (!v30) {
          goto LABEL_28;
        }
      }
LABEL_27:

LABEL_28:
LABEL_29:
      v11 = v32;
      if (!v10)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    char v12 = 0;
  }
LABEL_34:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDomain:", -[SFDomainEngagementScore domain](self, "domain"));
  uint64_t v5 = [(SFDomainEngagementScore *)self scoreConfidence];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setScoreConfidence:v6];

  int v7 = [(SFDomainEngagementScore *)self score];
  id v8 = (void *)[v7 copy];
  [v4 setScore:v8];

  unint64_t v9 = [(SFDomainEngagementScore *)self iFunScore];
  float v10 = (void *)[v9 copy];
  [v4 setIFunScore:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBDomainEngagementScore alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDomainEngagementScore *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDomainEngagementScore alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDomainEngagementScore *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBDomainEngagementScore alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBDomainEngagementScore *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFDomainEngagementScore)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBDomainEngagementScore alloc] initWithData:v5];
  int v7 = [(SFDomainEngagementScore *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_domain = a3;
}

@end