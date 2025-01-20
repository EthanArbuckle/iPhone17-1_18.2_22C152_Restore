@interface _SFPBRFTextEncapsulation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFTextEncapsulation)initWithDictionary:(id)a3;
- (_SFPBRFTextEncapsulation)initWithFacade:(id)a3;
- (_SFPBRFTextEncapsulation)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)style;
- (unint64_t)hash;
- (void)setStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTextEncapsulation

- (_SFPBRFTextEncapsulation)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFTextEncapsulation *)self init];
  if (v5)
  {
    if ([v4 hasStyle]) {
      -[_SFPBRFTextEncapsulation setStyle:](v5, "setStyle:", [v4 style]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)style
{
  return self->_style;
}

- (_SFPBRFTextEncapsulation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFTextEncapsulation;
  v5 = [(_SFPBRFTextEncapsulation *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTextEncapsulation setStyle:](v5, "setStyle:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBRFTextEncapsulation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTextEncapsulation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTextEncapsulation *)self dictionaryRepresentation];
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
  if (self->_style)
  {
    uint64_t v4 = [(_SFPBRFTextEncapsulation *)self style];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F058[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"style"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761 * self->_style;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int style = self->_style;
    BOOL v6 = style == [v4 style];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBRFTextEncapsulation *)self style]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextEncapsulationReadFrom(self, (uint64_t)a3);
}

- (void)setStyle:(int)a3
{
  self->_int style = a3;
}

@end