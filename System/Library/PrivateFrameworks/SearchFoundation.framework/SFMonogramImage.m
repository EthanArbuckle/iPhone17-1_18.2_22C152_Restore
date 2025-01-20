@interface SFMonogramImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMonogramStyle;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)monogramLetters;
- (SFMonogramImage)initWithCoder:(id)a3;
- (SFMonogramImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)monogramStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMonogramLetters:(id)a3;
- (void)setMonogramStyle:(int)a3;
@end

@implementation SFMonogramImage

- (SFMonogramImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFMonogramImage;
  v5 = [(SFMonogramImage *)&v10 init];
  if (v5)
  {
    v6 = [v4 monogramLetters];

    if (v6)
    {
      v7 = [v4 monogramLetters];
      [(SFMonogramImage *)v5 setMonogramLetters:v7];
    }
    if ([v4 monogramStyle]) {
      -[SFMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", [v4 monogramStyle]);
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

- (void)setMonogramLetters:(id)a3
{
}

- (NSString)monogramLetters
{
  return self->_monogramLetters;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFMonogramImage;
  unint64_t v3 = [(SFImage *)&v8 hash];
  id v4 = [(SFMonogramImage *)self monogramLetters];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFMonogramImage *)self monogramStyle] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFMonogramImage *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFMonogramImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFMonogramImage;
      if ([(SFImage *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFMonogramImage *)self monogramLetters];
        v9 = [(SFMonogramImage *)v7 monogramLetters];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        objc_super v10 = [(SFMonogramImage *)self monogramLetters];
        if (!v10
          || ([(SFMonogramImage *)self monogramLetters],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFMonogramImage *)v7 monogramLetters],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(SFMonogramImage *)self monogramStyle];
          BOOL v11 = v12 == [(SFMonogramImage *)v7 monogramStyle];
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFMonogramImage;
  id v4 = [(SFImage *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFMonogramImage *)self monogramLetters];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setMonogramLetters:v6];

  objc_msgSend(v4, "setMonogramStyle:", -[SFMonogramImage monogramStyle](self, "monogramStyle"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMonogramImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMonogramImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMonogramImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMonogramImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMonogramImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFMonogramImage;
  v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasMonogramStyle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMonogramStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_monogramStyle = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end