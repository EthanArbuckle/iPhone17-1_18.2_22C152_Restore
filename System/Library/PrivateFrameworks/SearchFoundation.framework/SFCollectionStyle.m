@interface SFCollectionStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)hasInitiallyVisibleCardSectionCount;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCollectionStyle)initWithCoder:(id)a3;
- (SFCollectionStyle)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)initiallyVisibleCardSectionCount;
- (void)encodeWithCoder:(id)a3;
- (void)setInitiallyVisibleCardSectionCount:(unint64_t)a3;
@end

@implementation SFCollectionStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)initiallyVisibleCardSectionCount
{
  return self->_initiallyVisibleCardSectionCount;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCollectionStyle *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFCollectionStyle *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    unint64_t v6 = [(SFCollectionStyle *)self initiallyVisibleCardSectionCount];
    uint64_t v7 = [(SFCollectionStyle *)v5 initiallyVisibleCardSectionCount];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setInitiallyVisibleCardSectionCount:", -[SFCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCollectionStyle alloc] initWithFacade:self];
  v3 = [(_SFPBCollectionStyle *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCollectionStyle alloc] initWithFacade:self];
  v3 = [(_SFPBCollectionStyle *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBCollectionStyle alloc] initWithFacade:self];
  v5 = [(_SFPBCollectionStyle *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCollectionStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBCollectionStyle alloc] initWithData:v5];
  uint64_t v7 = [(SFCollectionStyle *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasInitiallyVisibleCardSectionCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInitiallyVisibleCardSectionCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_initiallyVisibleCardSectionCount = a3;
}

- (SFCollectionStyle)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCollectionStyle;
  v5 = [(SFCollectionStyle *)&v14 init];
  if (v5)
  {
    if ([v4 initiallyVisibleCardSectionCount]) {
      -[SFCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", [v4 initiallyVisibleCardSectionCount]);
    }
    unint64_t v6 = [v4 collectionStyleRow];

    if (v6)
    {
      uint64_t v7 = [SFCollectionStyleRow alloc];
      uint64_t v8 = [v4 collectionStyleRow];
    }
    else
    {
      v10 = [v4 collectionStyleGrid];

      if (v10)
      {
        uint64_t v7 = [SFCollectionStyleGrid alloc];
        uint64_t v8 = [v4 collectionStyleGrid];
      }
      else
      {
        v11 = [v4 collectionStyleScrolling];

        if (!v11)
        {
          v9 = v5;
          goto LABEL_13;
        }
        uint64_t v7 = [SFCollectionStyleHorizontallyScrolling alloc];
        uint64_t v8 = [v4 collectionStyleScrolling];
      }
    }
    v12 = (void *)v8;
    v9 = [(SFCollectionStyleRow *)v7 initWithProtobuf:v8];

    if ([v4 initiallyVisibleCardSectionCount]) {
      -[SFCollectionStyle setInitiallyVisibleCardSectionCount:](v9, "setInitiallyVisibleCardSectionCount:", [v4 initiallyVisibleCardSectionCount]);
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

@end