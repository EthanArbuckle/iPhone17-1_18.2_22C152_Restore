@interface SFCollectionStyleHorizontallyScrolling
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNumberOfRows;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCollectionStyleHorizontallyScrolling)initWithCoder:(id)a3;
- (SFCollectionStyleHorizontallyScrolling)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)numberOfRows;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfRows:(unint64_t)a3;
@end

@implementation SFCollectionStyleHorizontallyScrolling

- (SFCollectionStyleHorizontallyScrolling)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  v5 = [(SFCollectionStyleHorizontallyScrolling *)&v8 init];
  if (v5)
  {
    if ([v4 numberOfRows]) {
      -[SFCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", [v4 numberOfRows]);
    }
    v6 = v5;
  }

  return v5;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  unint64_t v3 = [(SFCollectionStyle *)&v5 hash];
  return [(SFCollectionStyleHorizontallyScrolling *)self numberOfRows] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCollectionStyleHorizontallyScrolling *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFCollectionStyleHorizontallyScrolling *)v4 isMemberOfClass:objc_opt_class()]&& (v10.receiver = self, v10.super_class = (Class)SFCollectionStyleHorizontallyScrolling, [(SFCollectionStyle *)&v10 isEqual:v4]))
  {
    objc_super v5 = v4;
    unint64_t v6 = [(SFCollectionStyleHorizontallyScrolling *)self numberOfRows];
    uint64_t v7 = [(SFCollectionStyleHorizontallyScrolling *)v5 numberOfRows];

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
  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  id v4 = [(SFCollectionStyle *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setNumberOfRows:", -[SFCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleHorizontallyScrolling *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleHorizontallyScrolling *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v6 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithFacade:self];
  objc_super v5 = [(_SFPBCollectionStyleHorizontallyScrolling *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCollectionStyleHorizontallyScrolling)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v6 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithData:v5];
  uint64_t v7 = [(SFCollectionStyleHorizontallyScrolling *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasNumberOfRows
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfRows = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end