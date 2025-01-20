@interface _SFPBLocalImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBLocalImage)initWithDictionary:(id)a3;
- (_SFPBLocalImage)initWithFacade:(id)a3;
- (_SFPBLocalImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)localImageType;
- (unint64_t)hash;
- (void)setLocalImageType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBLocalImage

- (_SFPBLocalImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBLocalImage *)self init];
  if (v5)
  {
    if ([v4 hasLocalImageType]) {
      -[_SFPBLocalImage setLocalImageType:](v5, "setLocalImageType:", [v4 localImageType]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)localImageType
{
  return self->_localImageType;
}

- (_SFPBLocalImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBLocalImage;
  v5 = [(_SFPBLocalImage *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"localImageType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLocalImage setLocalImageType:](v5, "setLocalImageType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBLocalImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBLocalImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBLocalImage *)self dictionaryRepresentation];
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
  if (self->_localImageType)
  {
    uint64_t v4 = [(_SFPBLocalImage *)self localImageType];
    if (v4 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2EF58[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"localImageType"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761 * self->_localImageType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int localImageType = self->_localImageType;
    BOOL v6 = localImageType == [v4 localImageType];
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
  if ([(_SFPBLocalImage *)self localImageType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLocalImageReadFrom(self, (uint64_t)a3);
}

- (void)setLocalImageType:(int)a3
{
  self->_int localImageType = a3;
}

@end