@interface _SFPBRFFont
- (BOOL)applySmallCaps;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFFont)initWithDictionary:(id)a3;
- (_SFPBRFFont)initWithFacade:(id)a3;
- (_SFPBRFFont)initWithJSON:(id)a3;
- (_SFPBRFFont_RFSystemFont)system;
- (id)dictionaryRepresentation;
- (int)name;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setApplySmallCaps:(BOOL)a3;
- (void)setName:(int)a3;
- (void)setSystem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFont

- (_SFPBRFFont)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFFont *)self init];
  if (v5)
  {
    if ([v4 hasName]) {
      -[_SFPBRFFont setName:](v5, "setName:", [v4 name]);
    }
    if ([v4 hasSystem])
    {
      v6 = [v4 system];

      if (v6)
      {
        v7 = [_SFPBRFFont_RFSystemFont alloc];
        v8 = [v4 system];
        v9 = [(_SFPBRFFont_RFSystemFont *)v7 initWithFacade:v8];
        [(_SFPBRFFont *)v5 setSystem:v9];
      }
    }
    if ([v4 hasApplySmallCaps]) {
      -[_SFPBRFFont setApplySmallCaps:](v5, "setApplySmallCaps:", [v4 applySmallCaps]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (_SFPBRFFont)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFFont;
  v5 = [(_SFPBRFFont *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFont setName:](v5, "setName:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"system"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBRFFont_RFSystemFont alloc] initWithDictionary:v7];
      [(_SFPBRFFont *)v5 setSystem:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"applySmallCaps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFont setApplySmallCaps:](v5, "setApplySmallCaps:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFFont)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFont *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFont *)self dictionaryRepresentation];
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
  if (self->_applySmallCaps)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFFont applySmallCaps](self, "applySmallCaps"));
    [v3 setObject:v4 forKeyedSubscript:@"applySmallCaps"];
  }
  if (self->_name)
  {
    uint64_t v5 = [(_SFPBRFFont *)self name];
    if (v5 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5A2ECD0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"name"];
  }
  if (self->_system)
  {
    uint64_t v7 = [(_SFPBRFFont *)self system];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"system"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"system"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_name;
  unint64_t v4 = [(_SFPBRFFont_RFSystemFont *)self->_system hash];
  if (self->_applySmallCaps) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v5 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int name = self->_name;
    if (name == [v4 name])
    {
      v6 = [(_SFPBRFFont *)self system];
      uint64_t v7 = [v4 system];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_SFPBRFFont *)self system];
        if (!v9)
        {

LABEL_11:
          int applySmallCaps = self->_applySmallCaps;
          BOOL v14 = applySmallCaps == [v4 applySmallCaps];
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_SFPBRFFont *)self system];
        objc_super v12 = [v4 system];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ([(_SFPBRFFont *)self name]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBRFFont *)self system];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFFont *)self applySmallCaps]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFontReadFrom(self, (uint64_t)a3);
}

- (void)setApplySmallCaps:(BOOL)a3
{
  self->_int applySmallCaps = a3;
}

- (_SFPBRFFont_RFSystemFont)system
{
  if (self->_whichValue == 2) {
    v2 = self->_system;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSystem:(id)a3
{
  self->_int name = 0;
  self->_whichValue = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_system, a3);
}

- (int)name
{
  if (self->_whichValue == 1) {
    return self->_name;
  }
  else {
    return 0;
  }
}

- (void)setName:(int)a3
{
  system = self->_system;
  self->_system = 0;

  self->_whichValue = 1;
  self->_int name = a3;
}

@end