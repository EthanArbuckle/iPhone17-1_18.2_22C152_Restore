@interface SFText
+ (BOOL)supportsSecureCoding;
+ (id)textWithString:(id)a3;
- (BOOL)hasMaxLines;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)text;
- (SFText)initWithCoder:(id)a3;
- (SFText)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)maxLines;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLines:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation SFText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  v3 = [(SFText *)self text];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SFText *)self maxLines] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (SFText *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFText *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(SFText *)self text];
      v9 = [(SFText *)v7 text];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(SFText *)self text];
      if (!v10
        || ([(SFText *)self text],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SFText *)v7 text],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v12 = [(SFText *)self maxLines];
        BOOL v11 = v12 == [(SFText *)v7 maxLines];
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_12;
    }
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = [(SFText *)self text];
  v6 = (void *)[v5 copy];
  [v4 setText:v6];

  objc_msgSend(v4, "setMaxLines:", -[SFText maxLines](self, "maxLines"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBText alloc] initWithFacade:self];
  v3 = [(_SFPBText *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBText alloc] initWithFacade:self];
  v3 = [(_SFPBText *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBText alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBText *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFText)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBText alloc] initWithData:v5];
  v7 = [(SFText *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasMaxLines
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMaxLines:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxLines = a3;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4 = [(SFText *)self text];
  LOWORD(a3) = [v4 characterAtIndex:a3];

  return a3;
}

- (unint64_t)length
{
  v2 = [(SFText *)self text];
  unint64_t v3 = [v2 length];

  return v3;
}

+ (id)textWithString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = objc_opt_new();
  [v4 setText:v3];

  return v4;
}

- (SFText)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFText;
  unint64_t v5 = [(SFText *)&v10 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [v4 text];
      [(SFText *)v5 setText:v7];
    }
    if ([v4 maxLines]) {
      -[SFText setMaxLines:](v5, "setMaxLines:", [v4 maxLines]);
    }
    v8 = v5;
  }

  return v5;
}

@end