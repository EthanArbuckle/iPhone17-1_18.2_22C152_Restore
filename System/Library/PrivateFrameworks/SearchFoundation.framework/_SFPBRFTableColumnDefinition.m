@interface _SFPBRFTableColumnDefinition
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFTableColumnDefinition)initWithDictionary:(id)a3;
- (_SFPBRFTableColumnDefinition)initWithFacade:(id)a3;
- (_SFPBRFTableColumnDefinition)initWithJSON:(id)a3;
- (_SFPBRFTableContentColumnDefinition)content;
- (_SFPBRFTableSpacerColumnDefinition)spacer;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichDefinition;
- (void)setContent:(id)a3;
- (void)setSpacer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTableColumnDefinition

- (_SFPBRFTableColumnDefinition)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFTableColumnDefinition *)self init];
  if (v5)
  {
    if ([v4 hasSpacer])
    {
      v6 = [v4 spacer];

      if (v6)
      {
        v7 = [_SFPBRFTableSpacerColumnDefinition alloc];
        v8 = [v4 spacer];
        v9 = [(_SFPBRFTableSpacerColumnDefinition *)v7 initWithFacade:v8];
        [(_SFPBRFTableColumnDefinition *)v5 setSpacer:v9];
      }
    }
    if ([v4 hasContent])
    {
      v10 = [v4 content];

      if (v10)
      {
        v11 = [_SFPBRFTableContentColumnDefinition alloc];
        v12 = [v4 content];
        v13 = [(_SFPBRFTableContentColumnDefinition *)v11 initWithFacade:v12];
        [(_SFPBRFTableColumnDefinition *)v5 setContent:v13];
      }
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_spacer, 0);
}

- (unint64_t)whichDefinition
{
  return self->_whichDefinition;
}

- (_SFPBRFTableColumnDefinition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFTableColumnDefinition;
  v5 = [(_SFPBRFTableColumnDefinition *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"spacer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTableSpacerColumnDefinition alloc] initWithDictionary:v6];
      [(_SFPBRFTableColumnDefinition *)v5 setSpacer:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTableContentColumnDefinition alloc] initWithDictionary:v8];
      [(_SFPBRFTableColumnDefinition *)v5 setContent:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFTableColumnDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableColumnDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableColumnDefinition *)self dictionaryRepresentation];
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
  if (self->_content)
  {
    id v4 = [(_SFPBRFTableColumnDefinition *)self content];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"content"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"content"];
    }
  }
  if (self->_spacer)
  {
    uint64_t v7 = [(_SFPBRFTableColumnDefinition *)self spacer];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"spacer"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"spacer"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTableSpacerColumnDefinition *)self->_spacer hash];
  return [(_SFPBRFTableContentColumnDefinition *)self->_content hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFTableColumnDefinition *)self spacer];
  v6 = [v4 spacer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFTableColumnDefinition *)self spacer];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFTableColumnDefinition *)self spacer];
    v10 = [v4 spacer];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFTableColumnDefinition *)self content];
  v6 = [v4 content];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFTableColumnDefinition *)self content];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRFTableColumnDefinition *)self content];
    v15 = [v4 content];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBRFTableColumnDefinition *)self spacer];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFTableColumnDefinition *)self content];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableColumnDefinitionReadFrom(self, (uint64_t)a3);
}

- (_SFPBRFTableContentColumnDefinition)content
{
  if (self->_whichDefinition == 2) {
    v2 = self->_content;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  id v4 = (_SFPBRFTableContentColumnDefinition *)a3;
  spacer = self->_spacer;
  self->_spacer = 0;

  self->_whichDefinition = 2 * (v4 != 0);
  content = self->_content;
  self->_content = v4;
}

- (_SFPBRFTableSpacerColumnDefinition)spacer
{
  if (self->_whichDefinition == 1) {
    v2 = self->_spacer;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpacer:(id)a3
{
  id v4 = (_SFPBRFTableSpacerColumnDefinition *)a3;
  content = self->_content;
  self->_content = 0;

  self->_whichDefinition = v4 != 0;
  spacer = self->_spacer;
  self->_spacer = v4;
}

@end