@interface _SFPBSafariAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBSafariAttributes)initWithDictionary:(id)a3;
- (_SFPBSafariAttributes)initWithFacade:(id)a3;
- (_SFPBSafariAttributes)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)hideReason;
- (unint64_t)hash;
- (void)setHideReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSafariAttributes

- (_SFPBSafariAttributes)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSafariAttributes *)self init];
  if (v5)
  {
    if ([v4 hasHideReason]) {
      -[_SFPBSafariAttributes setHideReason:](v5, "setHideReason:", [v4 hideReason]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)hideReason
{
  return self->_hideReason;
}

- (_SFPBSafariAttributes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBSafariAttributes;
  v5 = [(_SFPBSafariAttributes *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hideReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSafariAttributes setHideReason:](v5, "setHideReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBSafariAttributes)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSafariAttributes *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSafariAttributes *)self dictionaryRepresentation];
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
  if (self->_hideReason)
  {
    uint64_t v4 = [(_SFPBSafariAttributes *)self hideReason];
    if (v4)
    {
      if (v4 == 1)
      {
        v5 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"0";
    }
    [v3 setObject:v5 forKeyedSubscript:@"hideReason"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761 * self->_hideReason;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int hideReason = self->_hideReason;
    BOOL v6 = hideReason == [v4 hideReason];
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
  if ([(_SFPBSafariAttributes *)self hideReason]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariAttributesReadFrom(self, (uint64_t)a3);
}

- (void)setHideReason:(int)a3
{
  self->_int hideReason = a3;
}

@end