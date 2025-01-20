@interface SFClearProactiveCategoryCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCategory;
- (BOOL)hasShouldClearWholeSection;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldClearWholeSection;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)proactiveIdentifier;
- (SFClearProactiveCategoryCommand)initWithCoder:(id)a3;
- (SFClearProactiveCategoryCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(int)a3;
- (void)setProactiveIdentifier:(id)a3;
- (void)setShouldClearWholeSection:(BOOL)a3;
@end

@implementation SFClearProactiveCategoryCommand

- (SFClearProactiveCategoryCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFClearProactiveCategoryCommand;
  v5 = [(SFClearProactiveCategoryCommand *)&v10 init];
  if (v5)
  {
    if ([v4 category]) {
      -[SFClearProactiveCategoryCommand setCategory:](v5, "setCategory:", [v4 category]);
    }
    if ([v4 shouldClearWholeSection]) {
      -[SFClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", [v4 shouldClearWholeSection]);
    }
    v6 = [v4 proactiveIdentifier];

    if (v6)
    {
      v7 = [v4 proactiveIdentifier];
      [(SFClearProactiveCategoryCommand *)v5 setProactiveIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setProactiveIdentifier:(id)a3
{
}

- (NSString)proactiveIdentifier
{
  return self->_proactiveIdentifier;
}

- (BOOL)shouldClearWholeSection
{
  return self->_shouldClearWholeSection;
}

- (int)category
{
  return self->_category;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFClearProactiveCategoryCommand;
  unint64_t v3 = [(SFCommand *)&v9 hash];
  uint64_t v4 = [(SFClearProactiveCategoryCommand *)self category];
  uint64_t v5 = v4 ^ [(SFClearProactiveCategoryCommand *)self shouldClearWholeSection];
  v6 = [(SFClearProactiveCategoryCommand *)self proactiveIdentifier];
  unint64_t v7 = v3 ^ v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFClearProactiveCategoryCommand *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(SFClearProactiveCategoryCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v15.receiver = self,
  }
             v15.super_class = (Class)SFClearProactiveCategoryCommand,
             [(SFCommand *)&v15 isEqual:v4]))
  {
    uint64_t v5 = v4;
    int v6 = [(SFClearProactiveCategoryCommand *)self category];
    if (v6 == [(SFClearProactiveCategoryCommand *)v5 category]
      && (BOOL v7 = [(SFClearProactiveCategoryCommand *)self shouldClearWholeSection],
          v7 == [(SFClearProactiveCategoryCommand *)v5 shouldClearWholeSection]))
    {
      objc_super v9 = [(SFClearProactiveCategoryCommand *)self proactiveIdentifier];
      objc_super v10 = [(SFClearProactiveCategoryCommand *)v5 proactiveIdentifier];
      if ((v9 == 0) == (v10 != 0))
      {
        char v8 = 0;
      }
      else
      {
        v11 = [(SFClearProactiveCategoryCommand *)self proactiveIdentifier];
        if (v11)
        {
          v12 = [(SFClearProactiveCategoryCommand *)self proactiveIdentifier];
          v13 = [(SFClearProactiveCategoryCommand *)v5 proactiveIdentifier];
          char v8 = [v12 isEqual:v13];
        }
        else
        {
          char v8 = 1;
        }
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFClearProactiveCategoryCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setCategory:", -[SFClearProactiveCategoryCommand category](self, "category"));
  objc_msgSend(v4, "setShouldClearWholeSection:", -[SFClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"));
  uint64_t v5 = [(SFClearProactiveCategoryCommand *)self proactiveIdentifier];
  int v6 = (void *)[v5 copy];
  [v4 setProactiveIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBClearProactiveCategoryCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBClearProactiveCategoryCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBClearProactiveCategoryCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBClearProactiveCategoryCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFClearProactiveCategoryCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFClearProactiveCategoryCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFClearProactiveCategoryCommand *)self init];
  int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  BOOL v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFClearProactiveCategoryCommand *)v5 setCategory:[(SFCommand *)v8 category]];
    [(SFClearProactiveCategoryCommand *)v5 setShouldClearWholeSection:[(SFCommand *)v8 shouldClearWholeSection]];
    objc_super v9 = [(SFCommand *)v8 proactiveIdentifier];
    [(SFClearProactiveCategoryCommand *)v5 setProactiveIdentifier:v9];

    objc_super v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

- (BOOL)hasShouldClearWholeSection
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldClearWholeSection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldClearWholeSection = a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_category = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end