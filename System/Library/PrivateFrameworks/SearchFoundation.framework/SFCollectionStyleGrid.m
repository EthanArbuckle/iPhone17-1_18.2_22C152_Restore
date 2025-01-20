@interface SFCollectionStyleGrid
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGridStyle;
- (BOOL)hasNumberOfColumns;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCollectionStyleGrid)initWithCoder:(id)a3;
- (SFCollectionStyleGrid)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)gridStyle;
- (unint64_t)hash;
- (unint64_t)numberOfColumns;
- (void)encodeWithCoder:(id)a3;
- (void)setGridStyle:(int)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
@end

@implementation SFCollectionStyleGrid

- (int)gridStyle
{
  return self->_gridStyle;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleGrid;
  unint64_t v3 = [(SFCollectionStyle *)&v6 hash];
  unint64_t v4 = [(SFCollectionStyleGrid *)self numberOfColumns];
  return v4 ^ [(SFCollectionStyleGrid *)self gridStyle] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SFCollectionStyleGrid *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFCollectionStyleGrid *)v4 isMemberOfClass:objc_opt_class()] {
         && (v10.receiver = self,
  }
             v10.super_class = (Class)SFCollectionStyleGrid,
             [(SFCollectionStyle *)&v10 isEqual:v4]))
  {
    v5 = v4;
    unint64_t v6 = [(SFCollectionStyleGrid *)self numberOfColumns];
    if (v6 == [(SFCollectionStyleGrid *)v5 numberOfColumns])
    {
      int v7 = [(SFCollectionStyleGrid *)self gridStyle];
      BOOL v8 = v7 == [(SFCollectionStyleGrid *)v5 gridStyle];
    }
    else
    {
      BOOL v8 = 0;
    }
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
  v6.super_class = (Class)SFCollectionStyleGrid;
  id v4 = [(SFCollectionStyle *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setNumberOfColumns:", -[SFCollectionStyleGrid numberOfColumns](self, "numberOfColumns"));
  objc_msgSend(v4, "setGridStyle:", -[SFCollectionStyleGrid gridStyle](self, "gridStyle"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCollectionStyleGrid alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleGrid *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCollectionStyleGrid alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleGrid *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v6 = [[_SFPBCollectionStyleGrid alloc] initWithFacade:self];
  v5 = [(_SFPBCollectionStyleGrid *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCollectionStyleGrid)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v6 = [[_SFPBCollectionStyleGrid alloc] initWithData:v5];
  int v7 = [(SFCollectionStyleGrid *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasGridStyle
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGridStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_gridStyle = a3;
}

- (BOOL)hasNumberOfColumns
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfColumns = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollectionStyleGrid)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleGrid;
  v5 = [(SFCollectionStyleGrid *)&v8 init];
  if (v5)
  {
    if ([v4 numberOfColumns]) {
      -[SFCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", [v4 numberOfColumns]);
    }
    if ([v4 gridStyle]) {
      -[SFCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", [v4 gridStyle]);
    }
    objc_super v6 = v5;
  }

  return v5;
}

@end