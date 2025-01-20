@interface SFApiResults
+ (BOOL)supportsSecureCoding;
- (BOOL)hasResultType;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (NSArray)flights;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFApiResults)initWithCoder:(id)a3;
- (SFApiResults)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)resultType;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFlights:(id)a3;
- (void)setResultType:(int)a3;
- (void)setStatus:(int)a3;
@end

@implementation SFApiResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setFlights:(id)a3
{
}

- (NSArray)flights
{
  return self->_flights;
}

- (int)resultType
{
  return self->_resultType;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)hash
{
  int v3 = [(SFApiResults *)self status];
  uint64_t v4 = [(SFApiResults *)self resultType] ^ v3;
  v5 = [(SFApiResults *)self flights];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFApiResults *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else if ([(SFApiResults *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(SFApiResults *)self status];
    if (v6 == [(SFApiResults *)v5 status]
      && (int v7 = [(SFApiResults *)self resultType], v7 == [(SFApiResults *)v5 resultType]))
    {
      v8 = [(SFApiResults *)self flights];
      v9 = [(SFApiResults *)v5 flights];
      if ((v8 == 0) == (v9 != 0))
      {
        char v13 = 0;
      }
      else
      {
        v10 = [(SFApiResults *)self flights];
        if (v10)
        {
          v11 = [(SFApiResults *)self flights];
          v12 = [(SFApiResults *)v5 flights];
          char v13 = [v11 isEqual:v12];
        }
        else
        {
          char v13 = 1;
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[SFApiResults status](self, "status"));
  objc_msgSend(v4, "setResultType:", -[SFApiResults resultType](self, "resultType"));
  v5 = [(SFApiResults *)self flights];
  int v6 = (void *)[v5 copy];
  [v4 setFlights:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBApiResults alloc] initWithFacade:self];
  int v3 = [(_SFPBApiResults *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBApiResults alloc] initWithFacade:self];
  int v3 = [(_SFPBApiResults *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBApiResults alloc] initWithFacade:self];
  v5 = [(_SFPBApiResults *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFApiResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBApiResults alloc] initWithData:v5];
  int v7 = [(SFApiResults *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasResultType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_resultType = a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (SFApiResults)initWithProtobuf:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFApiResults;
  v5 = [(SFApiResults *)&v20 init];
  if (v5)
  {
    if ([v4 status]) {
      -[SFApiResults setStatus:](v5, "setStatus:", [v4 status]);
    }
    if ([v4 resultType]) {
      -[SFApiResults setResultType:](v5, "setResultType:", [v4 resultType]);
    }
    int v6 = [v4 flights];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "flights", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          char v13 = [[SFFlight alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(SFApiResults *)v5 setFlights:v7];
    v14 = v5;
  }
  return v5;
}

@end