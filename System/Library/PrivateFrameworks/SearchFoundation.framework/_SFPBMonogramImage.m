@interface _SFPBMonogramImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)monogramLetters;
- (_SFPBMonogramImage)initWithDictionary:(id)a3;
- (_SFPBMonogramImage)initWithFacade:(id)a3;
- (_SFPBMonogramImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)monogramStyle;
- (unint64_t)hash;
- (void)setMonogramLetters:(id)a3;
- (void)setMonogramStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMonogramImage

- (_SFPBMonogramImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMonogramImage *)self init];
  if (v5)
  {
    v6 = [v4 monogramLetters];

    if (v6)
    {
      v7 = [v4 monogramLetters];
      [(_SFPBMonogramImage *)v5 setMonogramLetters:v7];
    }
    if ([v4 hasMonogramStyle]) {
      -[_SFPBMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", [v4 monogramStyle]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)monogramStyle
{
  return self->_monogramStyle;
}

- (NSString)monogramLetters
{
  return self->_monogramLetters;
}

- (_SFPBMonogramImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBMonogramImage;
  v5 = [(_SFPBMonogramImage *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"monogramLetters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBMonogramImage *)v5 setMonogramLetters:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"monogramStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBMonogramImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMonogramImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMonogramImage *)self dictionaryRepresentation];
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
  if (self->_monogramLetters)
  {
    id v4 = [(_SFPBMonogramImage *)self monogramLetters];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"monogramLetters"];
  }
  if (self->_monogramStyle)
  {
    uint64_t v6 = [(_SFPBMonogramImage *)self monogramStyle];
    if (v6)
    {
      if (v6 == 1)
      {
        uint64_t v7 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v7 = @"0";
    }
    [v3 setObject:v7 forKeyedSubscript:@"monogramStyle"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_monogramStyle) ^ [(NSString *)self->_monogramLetters hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBMonogramImage *)self monogramLetters];
    uint64_t v6 = [v4 monogramLetters];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBMonogramImage *)self monogramLetters];
      if (!v8)
      {

LABEL_10:
        int monogramStyle = self->_monogramStyle;
        BOOL v13 = monogramStyle == [v4 monogramStyle];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBMonogramImage *)self monogramLetters];
      objc_super v11 = [v4 monogramLetters];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBMonogramImage *)self monogramLetters];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMonogramImage *)self monogramStyle]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMonogramImageReadFrom(self, (uint64_t)a3);
}

- (void)setMonogramStyle:(int)a3
{
  self->_int monogramStyle = a3;
}

- (void)setMonogramLetters:(id)a3
{
  self->_monogramLetters = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end