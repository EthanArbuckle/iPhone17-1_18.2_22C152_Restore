@interface PBCodable
+ (BOOL)supportsSecureCoding;
+ (id)options;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (PBCodable)init;
- (PBCodable)initWithCoder:(id)a3;
- (PBCodable)initWithData:(id)a3;
- (id)dictionaryRepresentation;
- (id)formattedText;
- (void)encodeWithCoder:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBCodable

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PBCodable *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (PBCodable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  v6 = [(PBCodable *)self initWithData:v5];
  return v6;
}

- (PBCodable)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBCodable;
  return [(PBCodable *)&v3 init];
}

- (PBCodable)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBCodable;
  id v5 = [(PBCodable *)&v10 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [[PBDataReader alloc] initWithData:v4];
  if (![(PBCodable *)v5 readFrom:v6])
  {

    goto LABEL_6;
  }
  BOOL v7 = [(PBDataReader *)v6 hasError];

  if (v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v8 = v5;
LABEL_7:

  return v8;
}

- (NSData)data
{
  objc_super v3 = objc_alloc_init(PBDataWriter);
  [(PBCodable *)self writeTo:v3];
  id v4 = [(PBDataWriter *)v3 immutableData];

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)formattedText
{
  id v2 = [(PBCodable *)self dictionaryRepresentation];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28E78], "string", 0, 0);
  objc_super v3 = (void *)MEMORY[0x1AD0EB790]();
  _textFormatDictionary(v2, 0, (uint64_t)&v6);
  id v4 = (void *)v7;

  return v4;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (void)writeTo:(id)a3
{
}

- (BOOL)readFrom:(id)a3
{
  return 0;
}

+ (id)options
{
  return 0;
}

@end