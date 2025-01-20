@interface SFSafariTableOfContentsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)elementPath;
- (NSString)text;
- (NSString)trailingText;
- (SFSafariTableOfContentsItem)initWithCoder:(id)a3;
- (SFSafariTableOfContentsItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setElementPath:(id)a3;
- (void)setText:(id)a3;
- (void)setTrailingText:(id)a3;
@end

@implementation SFSafariTableOfContentsItem

- (SFSafariTableOfContentsItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFSafariTableOfContentsItem;
  v5 = [(SFSafariTableOfContentsItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [v4 text];
      [(SFSafariTableOfContentsItem *)v5 setText:v7];
    }
    v8 = [v4 elementPath];

    if (v8)
    {
      v9 = [v4 elementPath];
      [(SFSafariTableOfContentsItem *)v5 setElementPath:v9];
    }
    v10 = [v4 trailingText];

    if (v10)
    {
      v11 = [v4 trailingText];
      [(SFSafariTableOfContentsItem *)v5 setTrailingText:v11];
    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_elementPath, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setTrailingText:(id)a3
{
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (void)setElementPath:(id)a3
{
}

- (NSString)elementPath
{
  return self->_elementPath;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)hash
{
  v3 = [(SFSafariTableOfContentsItem *)self text];
  uint64_t v4 = [v3 hash];
  v5 = [(SFSafariTableOfContentsItem *)self elementPath];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFSafariTableOfContentsItem *)self trailingText];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFSafariTableOfContentsItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFSafariTableOfContentsItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFSafariTableOfContentsItem *)self text];
      unint64_t v8 = [(SFSafariTableOfContentsItem *)v6 text];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(SFSafariTableOfContentsItem *)self text];
      if (v9)
      {
        v3 = [(SFSafariTableOfContentsItem *)self text];
        v10 = [(SFSafariTableOfContentsItem *)v6 text];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(SFSafariTableOfContentsItem *)self elementPath];
      v13 = [(SFSafariTableOfContentsItem *)v6 elementPath];
      objc_super v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(SFSafariTableOfContentsItem *)self elementPath];
      if (v15)
      {
        v25 = v12;
        v16 = [(SFSafariTableOfContentsItem *)self elementPath];
        v28 = [(SFSafariTableOfContentsItem *)v6 elementPath];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(SFSafariTableOfContentsItem *)self trailingText];
      v18 = [(SFSafariTableOfContentsItem *)v6 trailingText];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(SFSafariTableOfContentsItem *)self trailingText];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(SFSafariTableOfContentsItem *)self trailingText];
          v20 = [(SFSafariTableOfContentsItem *)v6 trailingText];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFSafariTableOfContentsItem *)self text];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setText:v6];

  v7 = [(SFSafariTableOfContentsItem *)self elementPath];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setElementPath:v8];

  v9 = [(SFSafariTableOfContentsItem *)self trailingText];
  v10 = (void *)[v9 copy];
  [v4 setTrailingText:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSafariTableOfContentsItem alloc] initWithFacade:self];
  v3 = [(_SFPBSafariTableOfContentsItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSafariTableOfContentsItem alloc] initWithFacade:self];
  v3 = [(_SFPBSafariTableOfContentsItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBSafariTableOfContentsItem alloc] initWithFacade:self];
  v5 = [(_SFPBSafariTableOfContentsItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSafariTableOfContentsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBSafariTableOfContentsItem alloc] initWithData:v5];
  v7 = [(SFSafariTableOfContentsItem *)self initWithProtobuf:v6];

  return v7;
}

@end