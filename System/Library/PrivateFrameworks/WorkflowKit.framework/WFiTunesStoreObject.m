@interface WFiTunesStoreObject
+ (id)JSONKeyPathsByPropertyKey;
+ (id)descriptionTextJSONTransformer;
- (NSDate)releaseDate;
- (NSNumber)price;
- (NSString)artistID;
- (NSString)artistName;
- (NSString)currencyCode;
- (NSString)descriptionText;
- (NSString)formattedPrice;
@end

@implementation WFiTunesStoreObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSNumber)price
{
  return self->_price;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)artistID
{
  return self->_artistID;
}

- (NSString)formattedPrice
{
  v3 = objc_opt_new();
  [v3 setNumberStyle:2];
  v4 = [(WFiTunesStoreObject *)self currencyCode];
  [v3 setCurrencyCode:v4];

  v5 = [(WFiTunesStoreObject *)self price];
  v6 = [v3 stringFromNumber:v5];

  return (NSString *)v6;
}

+ (id)descriptionTextJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_407_41938];
}

id __53__WFiTunesStoreObject_descriptionTextJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKey:@"longDescription"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 objectForKey:@"description"];
  }
  v6 = v5;

  return v6;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesStoreObject;
  id v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"currencyCode";
  v7[1] = @"artistID";
  v8[0] = @"currency";
  v8[1] = @"artistId";
  v7[2] = @"artistName";
  v7[3] = @"kind";
  v8[2] = @"artistName";
  v8[3] = @"kind";
  v7[4] = @"releaseDate";
  v7[5] = @"descriptionText";
  v8[4] = @"releaseDate";
  v8[5] = &unk_1F2317A30;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end