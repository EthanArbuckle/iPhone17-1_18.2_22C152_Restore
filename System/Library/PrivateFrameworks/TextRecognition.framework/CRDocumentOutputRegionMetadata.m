@interface CRDocumentOutputRegionMetadata
- (BOOL)isEqual:(id)a3;
- (CRDocumentOutputRegionMetadata)initWithCRCodableDataRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crCodableDataRepresentation;
- (unint64_t)numFilteredRegions;
- (void)setNumFilteredRegions:(unint64_t)a3;
@end

@implementation CRDocumentOutputRegionMetadata

- (CRDocumentOutputRegionMetadata)initWithCRCodableDataRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRDocumentOutputRegionMetadata;
  v5 = [(CRDocumentOutputRegionMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v8 = 0;
    if (+[CRCodingUtilities integerFromEncodingData:v4 offset:&v8] != 1)
    {
      v6 = 0;
      goto LABEL_6;
    }
    v5->_numFilteredRegions = +[CRCodingUtilities unsignedIntegerFromEncodingData:v4 offset:&v8];
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)crCodableDataRepresentation
{
  v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:1 toData:v3];
  +[CRCodingUtilities appendUInteger:[(CRDocumentOutputRegionMetadata *)self numFilteredRegions] toData:v3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRDocumentOutputRegionMetadata *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(CRDocumentOutputRegionMetadata *)self numFilteredRegions];
      uint64_t v7 = [(CRDocumentOutputRegionMetadata *)v5 numFilteredRegions];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setNumFilteredRegions:", -[CRDocumentOutputRegionMetadata numFilteredRegions](self, "numFilteredRegions"));
  return v4;
}

- (unint64_t)numFilteredRegions
{
  return self->_numFilteredRegions;
}

- (void)setNumFilteredRegions:(unint64_t)a3
{
  self->_numFilteredRegions = a3;
}

@end