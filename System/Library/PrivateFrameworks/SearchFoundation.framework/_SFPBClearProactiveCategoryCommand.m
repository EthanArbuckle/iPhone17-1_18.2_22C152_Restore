@interface _SFPBClearProactiveCategoryCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldClearWholeSection;
- (NSData)jsonData;
- (NSString)proactiveIdentifier;
- (_SFPBClearProactiveCategoryCommand)initWithDictionary:(id)a3;
- (_SFPBClearProactiveCategoryCommand)initWithFacade:(id)a3;
- (_SFPBClearProactiveCategoryCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)category;
- (unint64_t)hash;
- (void)setCategory:(int)a3;
- (void)setProactiveIdentifier:(id)a3;
- (void)setShouldClearWholeSection:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBClearProactiveCategoryCommand

- (_SFPBClearProactiveCategoryCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBClearProactiveCategoryCommand *)self init];
  if (v5)
  {
    if ([v4 hasCategory]) {
      -[_SFPBClearProactiveCategoryCommand setCategory:](v5, "setCategory:", [v4 category]);
    }
    if ([v4 hasShouldClearWholeSection]) {
      -[_SFPBClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", [v4 shouldClearWholeSection]);
    }
    v6 = [v4 proactiveIdentifier];

    if (v6)
    {
      v7 = [v4 proactiveIdentifier];
      [(_SFPBClearProactiveCategoryCommand *)v5 setProactiveIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
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

- (_SFPBClearProactiveCategoryCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBClearProactiveCategoryCommand;
  v5 = [(_SFPBClearProactiveCategoryCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"category"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBClearProactiveCategoryCommand setCategory:](v5, "setCategory:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"shouldClearWholeSection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"proactiveIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBClearProactiveCategoryCommand *)v5 setProactiveIdentifier:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBClearProactiveCategoryCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBClearProactiveCategoryCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBClearProactiveCategoryCommand *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_category)
  {
    uint64_t v4 = [(_SFPBClearProactiveCategoryCommand *)self category];
    if (v4 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2EFD8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"category"];
  }
  if (self->_proactiveIdentifier)
  {
    v6 = [(_SFPBClearProactiveCategoryCommand *)self proactiveIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"proactiveIdentifier"];
  }
  if (self->_shouldClearWholeSection)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"));
    [v3 setObject:v8 forKeyedSubscript:@"shouldClearWholeSection"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_shouldClearWholeSection) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v2 = 2654435761 * self->_category;
  return v3 ^ [(NSString *)self->_proactiveIdentifier hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int category = self->_category;
    if (category == [v4 category])
    {
      int shouldClearWholeSection = self->_shouldClearWholeSection;
      if (shouldClearWholeSection == [v4 shouldClearWholeSection])
      {
        uint64_t v7 = [(_SFPBClearProactiveCategoryCommand *)self proactiveIdentifier];
        v8 = [v4 proactiveIdentifier];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_SFPBClearProactiveCategoryCommand *)self proactiveIdentifier];
          if (!v10)
          {

LABEL_12:
            BOOL v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          objc_super v12 = [(_SFPBClearProactiveCategoryCommand *)self proactiveIdentifier];
          v13 = [v4 proactiveIdentifier];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ([(_SFPBClearProactiveCategoryCommand *)self category]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBClearProactiveCategoryCommand *)self shouldClearWholeSection]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_SFPBClearProactiveCategoryCommand *)self proactiveIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBClearProactiveCategoryCommandReadFrom(self, (uint64_t)a3);
}

- (void)setProactiveIdentifier:(id)a3
{
  self->_proactiveIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setShouldClearWholeSection:(BOOL)a3
{
  self->_int shouldClearWholeSection = a3;
}

- (void)setCategory:(int)a3
{
  self->_int category = a3;
}

@end