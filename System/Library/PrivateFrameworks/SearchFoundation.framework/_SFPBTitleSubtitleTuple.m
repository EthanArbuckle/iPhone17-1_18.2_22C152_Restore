@interface _SFPBTitleSubtitleTuple
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)subtitle;
- (NSString)title;
- (_SFPBTitleSubtitleTuple)initWithDictionary:(id)a3;
- (_SFPBTitleSubtitleTuple)initWithFacade:(id)a3;
- (_SFPBTitleSubtitleTuple)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTitleSubtitleTuple

- (_SFPBTitleSubtitleTuple)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBTitleSubtitleTuple *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBTitleSubtitleTuple *)v5 setTitle:v7];
    }
    v8 = [v4 subtitle];

    if (v8)
    {
      v9 = [v4 subtitle];
      [(_SFPBTitleSubtitleTuple *)v5 setSubtitle:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBTitleSubtitleTuple)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBTitleSubtitleTuple;
  v5 = [(_SFPBTitleSubtitleTuple *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBTitleSubtitleTuple *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBTitleSubtitleTuple *)v5 setSubtitle:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBTitleSubtitleTuple)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTitleSubtitleTuple *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTitleSubtitleTuple *)self dictionaryRepresentation];
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
  if (self->_subtitle)
  {
    id v4 = [(_SFPBTitleSubtitleTuple *)self subtitle];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"subtitle"];
  }
  if (self->_title)
  {
    v6 = [(_SFPBTitleSubtitleTuple *)self title];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_subtitle hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBTitleSubtitleTuple *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBTitleSubtitleTuple *)self title];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBTitleSubtitleTuple *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBTitleSubtitleTuple *)self subtitle];
  v6 = [v4 subtitle];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBTitleSubtitleTuple *)self subtitle];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBTitleSubtitleTuple *)self subtitle];
    v15 = [v4 subtitle];
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
  id v4 = [(_SFPBTitleSubtitleTuple *)self title];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBTitleSubtitleTuple *)self subtitle];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTitleSubtitleTupleReadFrom(self, (uint64_t)a3);
}

- (void)setSubtitle:(id)a3
{
  self->_subtitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end