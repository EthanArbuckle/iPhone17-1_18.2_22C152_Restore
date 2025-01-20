@interface PKNFCTag
- (NSData)UID;
- (NSData)manufacturerIdentifier;
- (NSData)manufacturerParameter;
- (NSData)systemCode;
- (NSData)tagIdentifier;
- (PKNFCTag)initWithNFTag:(id)a3;
- (unint64_t)technology;
- (void)setManufacturerIdentifier:(id)a3;
- (void)setManufacturerParameter:(id)a3;
- (void)setSystemCode:(id)a3;
- (void)setTagIdentifier:(id)a3;
- (void)setTechnology:(unint64_t)a3;
- (void)setUID:(id)a3;
@end

@implementation PKNFCTag

- (PKNFCTag)initWithNFTag:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKNFCTag;
  v6 = [(PKNFCTag *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingTag, a3);
    v7->_technology = [v5 technology] & 0xF;
    uint64_t v8 = [v5 tagID];
    tagIdentifier = v7->_tagIdentifier;
    v7->_tagIdentifier = (NSData *)v8;

    uint64_t v10 = [v5 IDm];
    manufacturerIdentifier = v7->_manufacturerIdentifier;
    v7->_manufacturerIdentifier = (NSData *)v10;

    uint64_t v12 = [v5 PMm];
    manufacturerParameter = v7->_manufacturerParameter;
    v7->_manufacturerParameter = (NSData *)v12;

    uint64_t v14 = [v5 SystemCode];
    systemCode = v7->_systemCode;
    v7->_systemCode = (NSData *)v14;

    uint64_t v16 = [v5 UID];
    UID = v7->_UID;
    v7->_UID = (NSData *)v16;
  }
  return v7;
}

- (unint64_t)technology
{
  return self->_technology;
}

- (void)setTechnology:(unint64_t)a3
{
  self->_technology = a3;
}

- (NSData)tagIdentifier
{
  return self->_tagIdentifier;
}

- (void)setTagIdentifier:(id)a3
{
}

- (NSData)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (void)setManufacturerIdentifier:(id)a3
{
}

- (NSData)manufacturerParameter
{
  return self->_manufacturerParameter;
}

- (void)setManufacturerParameter:(id)a3
{
}

- (NSData)systemCode
{
  return self->_systemCode;
}

- (void)setSystemCode:(id)a3
{
}

- (NSData)UID
{
  return self->_UID;
}

- (void)setUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UID, 0);
  objc_storeStrong((id *)&self->_systemCode, 0);
  objc_storeStrong((id *)&self->_manufacturerParameter, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
  objc_storeStrong((id *)&self->_underlyingTag, 0);
}

@end