@interface TVRCTimedMetadata
+ (BOOL)supportsSecureCoding;
+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4;
+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(BOOL)a5;
+ (id)_timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5;
- (BOOL)expectsTimedMetadata;
- (BOOL)hasExpectsTimedMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimedMetadata:(id)a3;
- (NSData)rawData;
- (NSString)identifier;
- (TVRCTimedMetadata)initWithCoder:(id)a3;
- (TVRCTimedMetadata)initWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectsTimedMetadata:(BOOL)a3;
- (void)setHasExpectsTimedMetadata:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRawData:(id)a3;
@end

@implementation TVRCTimedMetadata

+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4
{
  return (TVRCTimedMetadata *)[a1 _timedMetadataWithIdentifier:a3 rawData:a4 expectsTimedMetadata:0];
}

+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 numberWithBool:v5];
  v12 = [a1 _timedMetadataWithIdentifier:v10 rawData:v9 expectsTimedMetadata:v11];

  return (TVRCTimedMetadata *)v12;
}

+ (id)_timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 rawData:v9 expectsTimedMetadata:v8];

  return v11;
}

- (TVRCTimedMetadata)initWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TVRCTimedMetadata;
  v11 = [(TVRCTimedMetadata *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_rawData, a4);
    v11->_hasExpectsTimedMetadata = v10 != 0;
    if (v10) {
      char v14 = [v10 BOOLValue];
    }
    else {
      char v14 = 0;
    }
    v11->_expectsTimedMetadata = v14;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(TVRCTimedMetadata *)self isEqualToTimedMetadata:v4];

  return v5;
}

- (BOOL)isEqualToTimedMetadata:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  int v5 = [(TVRCTimedMetadata *)self hasExpectsTimedMetadata];
  if (v5 != [v4 hasExpectsTimedMetadata]) {
    goto LABEL_7;
  }
  int v6 = [(TVRCTimedMetadata *)self expectsTimedMetadata];
  if (v6 != [v4 expectsTimedMetadata]) {
    goto LABEL_7;
  }
  v7 = [(TVRCTimedMetadata *)self identifier];
  id v8 = [v4 identifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(TVRCTimedMetadata *)self rawData];
    v11 = [v4 rawData];
    char v12 = [v10 isEqualToData:v11];
  }
  else
  {
LABEL_7:
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int v5 = [(TVRCTimedMetadata *)self identifier];
  [v4 setIdentifier:v5];

  int v6 = [(TVRCTimedMetadata *)self rawData];
  [v4 setRawData:v6];

  objc_msgSend(v4, "setHasExpectsTimedMetadata:", -[TVRCTimedMetadata hasExpectsTimedMetadata](self, "hasExpectsTimedMetadata"));
  objc_msgSend(v4, "setExpectsTimedMetadata:", -[TVRCTimedMetadata expectsTimedMetadata](self, "expectsTimedMetadata"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCTimedMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCTimedMetadata;
  int v5 = [(TVRCTimedMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawData"];
    rawData = v5->_rawData;
    v5->_rawData = (NSData *)v8;

    v5->_hasExpectsTimedMetadata = [v4 decodeBoolForKey:@"hasExpectsTimedMetadata"];
    v5->_expectsTimedMetadata = [v4 decodeBoolForKey:@"expectsTimedMetadata"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_rawData forKey:@"rawData"];
  [v5 encodeBool:self->_hasExpectsTimedMetadata forKey:@"hasExpectsTimedMetadata"];
  [v5 encodeBool:self->_expectsTimedMetadata forKey:@"expectsTimedMetadata"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (BOOL)hasExpectsTimedMetadata
{
  return self->_hasExpectsTimedMetadata;
}

- (void)setHasExpectsTimedMetadata:(BOOL)a3
{
  self->_hasExpectsTimedMetadata = a3;
}

- (BOOL)expectsTimedMetadata
{
  return self->_expectsTimedMetadata;
}

- (void)setExpectsTimedMetadata:(BOOL)a3
{
  self->_expectsTimedMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end