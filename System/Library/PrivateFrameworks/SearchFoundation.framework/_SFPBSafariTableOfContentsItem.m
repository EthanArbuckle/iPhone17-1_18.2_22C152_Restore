@interface _SFPBSafariTableOfContentsItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)elementPath;
- (NSString)text;
- (NSString)trailingText;
- (_SFPBSafariTableOfContentsItem)initWithDictionary:(id)a3;
- (_SFPBSafariTableOfContentsItem)initWithFacade:(id)a3;
- (_SFPBSafariTableOfContentsItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setElementPath:(id)a3;
- (void)setText:(id)a3;
- (void)setTrailingText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSafariTableOfContentsItem

- (_SFPBSafariTableOfContentsItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSafariTableOfContentsItem *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [v4 text];
      [(_SFPBSafariTableOfContentsItem *)v5 setText:v7];
    }
    v8 = [v4 elementPath];

    if (v8)
    {
      v9 = [v4 elementPath];
      [(_SFPBSafariTableOfContentsItem *)v5 setElementPath:v9];
    }
    v10 = [v4 trailingText];

    if (v10)
    {
      v11 = [v4 trailingText];
      [(_SFPBSafariTableOfContentsItem *)v5 setTrailingText:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_elementPath, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (NSString)elementPath
{
  return self->_elementPath;
}

- (NSString)text
{
  return self->_text;
}

- (_SFPBSafariTableOfContentsItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBSafariTableOfContentsItem;
  v5 = [(_SFPBSafariTableOfContentsItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSafariTableOfContentsItem *)v5 setText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"elementPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBSafariTableOfContentsItem *)v5 setElementPath:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"trailingText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBSafariTableOfContentsItem *)v5 setTrailingText:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBSafariTableOfContentsItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSafariTableOfContentsItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSafariTableOfContentsItem *)self dictionaryRepresentation];
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
  if (self->_elementPath)
  {
    id v4 = [(_SFPBSafariTableOfContentsItem *)self elementPath];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"elementPath"];
  }
  if (self->_text)
  {
    v6 = [(_SFPBSafariTableOfContentsItem *)self text];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"text"];
  }
  if (self->_trailingText)
  {
    v8 = [(_SFPBSafariTableOfContentsItem *)self trailingText];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"trailingText"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  NSUInteger v4 = [(NSString *)self->_elementPath hash] ^ v3;
  return v4 ^ [(NSString *)self->_trailingText hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBSafariTableOfContentsItem *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBSafariTableOfContentsItem *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBSafariTableOfContentsItem *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSafariTableOfContentsItem *)self elementPath];
  v6 = [v4 elementPath];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBSafariTableOfContentsItem *)self elementPath];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBSafariTableOfContentsItem *)self elementPath];
    v15 = [v4 elementPath];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSafariTableOfContentsItem *)self trailingText];
  v6 = [v4 trailingText];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBSafariTableOfContentsItem *)self trailingText];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBSafariTableOfContentsItem *)self trailingText];
    v20 = [v4 trailingText];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBSafariTableOfContentsItem *)self text];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBSafariTableOfContentsItem *)self elementPath];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBSafariTableOfContentsItem *)self trailingText];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariTableOfContentsItemReadFrom(self, (uint64_t)a3);
}

- (void)setTrailingText:(id)a3
{
  self->_trailingText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setElementPath:(id)a3
{
  self->_elementPath = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setText:(id)a3
{
  self->_text = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end