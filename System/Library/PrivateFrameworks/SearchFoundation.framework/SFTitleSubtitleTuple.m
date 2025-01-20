@interface SFTitleSubtitleTuple
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)subtitle;
- (NSString)title;
- (SFTitleSubtitleTuple)initWithCoder:(id)a3;
- (SFTitleSubtitleTuple)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTitleSubtitleTuple

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(SFTitleSubtitleTuple *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(SFTitleSubtitleTuple *)self subtitle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFTitleSubtitleTuple *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFTitleSubtitleTuple *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFTitleSubtitleTuple *)self title];
      v8 = [(SFTitleSubtitleTuple *)v6 title];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFTitleSubtitleTuple *)self title];
      if (v9)
      {
        v3 = [(SFTitleSubtitleTuple *)self title];
        v10 = [(SFTitleSubtitleTuple *)v6 title];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(SFTitleSubtitleTuple *)self subtitle];
      v13 = [(SFTitleSubtitleTuple *)v6 subtitle];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFTitleSubtitleTuple *)self subtitle];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFTitleSubtitleTuple *)self subtitle];
          [(SFTitleSubtitleTuple *)v6 subtitle];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFTitleSubtitleTuple *)self title];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  v7 = [(SFTitleSubtitleTuple *)self subtitle];
  v8 = (void *)[v7 copy];
  [v4 setSubtitle:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTitleSubtitleTuple alloc] initWithFacade:self];
  v3 = [(_SFPBTitleSubtitleTuple *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTitleSubtitleTuple alloc] initWithFacade:self];
  v3 = [(_SFPBTitleSubtitleTuple *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBTitleSubtitleTuple alloc] initWithFacade:self];
  v5 = [(_SFPBTitleSubtitleTuple *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFTitleSubtitleTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBTitleSubtitleTuple alloc] initWithData:v5];
  v7 = [(SFTitleSubtitleTuple *)self initWithProtobuf:v6];

  return v7;
}

- (SFTitleSubtitleTuple)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFTitleSubtitleTuple;
  v5 = [(SFTitleSubtitleTuple *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFTitleSubtitleTuple *)v5 setTitle:v7];
    }
    v8 = [v4 subtitle];

    if (v8)
    {
      v9 = [v4 subtitle];
      [(SFTitleSubtitleTuple *)v5 setSubtitle:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end