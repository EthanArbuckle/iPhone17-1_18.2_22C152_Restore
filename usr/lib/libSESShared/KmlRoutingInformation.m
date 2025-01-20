@interface KmlRoutingInformation
- (KmlRoutingInformation)initWithInformation:(id)a3 readerIdentifier:(id)a4;
- (KmlRoutingInformation)initWithReaderInformation:(id)a3;
- (NSString)brand;
- (NSString)manufacturer;
- (NSString)readerIdentifier;
- (NSString)regionString;
- (id)getReaderInformation;
- (id)getRoutingInformation;
@end

@implementation KmlRoutingInformation

- (KmlRoutingInformation)initWithReaderInformation:(id)a3
{
  return [(KmlRoutingInformation *)self initWithInformation:a3 readerIdentifier:0];
}

- (KmlRoutingInformation)initWithInformation:(id)a3 readerIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v29.receiver = self;
  v29.super_class = (Class)KmlRoutingInformation;
  v8 = [(KmlRoutingInformation *)&v29 init];
  if (v8)
  {
    v9 = [v6 componentsSeparatedByString:@"."];
    if ([v9 count] == 3)
    {
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      manufacturer = v8->_manufacturer;
      v8->_manufacturer = (NSString *)v10;

      uint64_t v12 = [v9 objectAtIndexedSubscript:1];
      regionString = v8->_regionString;
      v8->_regionString = (NSString *)v12;

      uint64_t v14 = [v9 objectAtIndexedSubscript:2];
      brand = v8->_brand;
      v8->_brand = (NSString *)v14;

      v16 = @"Unknown";
      if (v7) {
        v16 = v7;
      }
      v17 = v16;
    }
    else
    {
      if ([v9 count] != 5)
      {
        v25 = v8->_manufacturer;
        v8->_manufacturer = (NSString *)@"Unknown";

        v26 = v8->_regionString;
        v8->_regionString = (NSString *)@"Unknown";

        v27 = v8->_brand;
        v8->_brand = (NSString *)@"Unknown";

        readerIdentifier = v8->_readerIdentifier;
        v8->_readerIdentifier = (NSString *)@"Unknown";
        goto LABEL_10;
      }
      uint64_t v18 = [v9 objectAtIndexedSubscript:1];
      v19 = v8->_manufacturer;
      v8->_manufacturer = (NSString *)v18;

      uint64_t v20 = [v9 objectAtIndexedSubscript:2];
      v21 = v8->_regionString;
      v8->_regionString = (NSString *)v20;

      uint64_t v22 = [v9 objectAtIndexedSubscript:3];
      v23 = v8->_brand;
      v8->_brand = (NSString *)v22;

      v17 = [v9 objectAtIndexedSubscript:4];
    }
    readerIdentifier = v8->_readerIdentifier;
    v8->_readerIdentifier = &v17->isa;
LABEL_10:
  }
  return v8;
}

- (id)getReaderInformation
{
  return (id)[NSString stringWithFormat:@"V.%@.%@.%@.%@", self->_manufacturer, self->_regionString, self->_brand, self->_readerIdentifier];
}

- (id)getRoutingInformation
{
  return (id)[NSString stringWithFormat:@"%@.%@.%@", self->_manufacturer, self->_regionString, self->_brand];
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)regionString
{
  return self->_regionString;
}

- (NSString)brand
{
  return self->_brand;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_regionString, 0);

  objc_storeStrong((id *)&self->_manufacturer, 0);
}

@end