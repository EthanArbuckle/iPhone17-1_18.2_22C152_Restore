@interface _SFPBMediaDetail
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBMediaDetail)initWithDictionary:(id)a3;
- (_SFPBMediaDetail)initWithFacade:(id)a3;
- (_SFPBMediaDetail)initWithJSON:(id)a3;
- (_SFPBText)content;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setContent:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaDetail

- (_SFPBMediaDetail)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMediaDetail *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBMediaDetail *)v5 setTitle:v7];
    }
    v8 = [v4 content];

    if (v8)
    {
      v9 = [_SFPBText alloc];
      v10 = [v4 content];
      v11 = [(_SFPBText *)v9 initWithFacade:v10];
      [(_SFPBMediaDetail *)v5 setContent:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (_SFPBText)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBMediaDetail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBMediaDetail;
  v5 = [(_SFPBMediaDetail *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBMediaDetail *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBText alloc] initWithDictionary:v8];
      [(_SFPBMediaDetail *)v5 setContent:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBMediaDetail)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaDetail *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaDetail *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBMediaDetail *)self content];
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
  if (self->_title)
  {
    uint64_t v7 = [(_SFPBMediaDetail *)self title];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(_SFPBText *)self->_content hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBMediaDetail *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBMediaDetail *)self title];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBMediaDetail *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBMediaDetail *)self content];
  v6 = [v4 content];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBMediaDetail *)self content];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBMediaDetail *)self content];
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
  id v4 = [(_SFPBMediaDetail *)self title];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBMediaDetail *)self content];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaDetailReadFrom(self, (uint64_t)a3);
}

- (void)setContent:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end