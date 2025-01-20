@interface SFShowSFCardCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCard)card;
- (SFShowSFCardCommand)initWithCoder:(id)a3;
- (SFShowSFCardCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)embeddedCards;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCard:(id)a3;
@end

@implementation SFShowSFCardCommand

- (SFShowSFCardCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFShowSFCardCommand;
  v5 = [(SFShowSFCardCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 card];

    if (v6)
    {
      v7 = [SFCard alloc];
      v8 = [v4 card];
      v9 = [(SFCard *)v7 initWithProtobuf:v8];
      [(SFShowSFCardCommand *)v5 setCard:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setCard:(id)a3
{
}

- (SFCard)card
{
  return self->_card;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFShowSFCardCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFShowSFCardCommand *)self card];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFShowSFCardCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFShowSFCardCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFShowSFCardCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFShowSFCardCommand *)self card];
    objc_super v7 = [(SFShowSFCardCommand *)v5 card];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFShowSFCardCommand *)self card];
      if (v8)
      {
        v9 = [(SFShowSFCardCommand *)self card];
        v10 = [(SFShowSFCardCommand *)v5 card];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFShowSFCardCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFShowSFCardCommand *)self card];
  v6 = (void *)[v5 copy];
  [v4 setCard:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShowSFCardCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowSFCardCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShowSFCardCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowSFCardCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFShowSFCardCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFShowSFCardCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFShowSFCardCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 card];
    [(SFShowSFCardCommand *)v5 setCard:v9];

    v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    char v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    objc_super v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    objc_super v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)embeddedCards
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SFShowSFCardCommand *)self card];

  if (v4)
  {
    unint64_t v5 = [(SFShowSFCardCommand *)self card];
    [v3 addObject:v5];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(SFShowSFCardCommand *)self card];
    objc_super v7 = [v6 cardSections];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) embeddedCards];
          [v3 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

@end