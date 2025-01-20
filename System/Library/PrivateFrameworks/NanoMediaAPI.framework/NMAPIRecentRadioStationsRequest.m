@interface NMAPIRecentRadioStationsRequest
- (Class)responseParserClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (unint64_t)limit;
- (void)setLimit:(unint64_t)a3;
@end

@implementation NMAPIRecentRadioStationsRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)NMAPIRecentRadioStationsRequest;
  v5 = [(NMAPIRequest *)&v18 urlComponentsWithStoreURLBag:a3 error:a4];
  v6 = NSString;
  v20[0] = @"/v1/me";
  v20[1] = @"recent";
  v20[2] = @"radio-stations";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  v8 = [v6 pathWithComponents:v7];
  [v5 setPath:v8];

  v9 = [v5 queryItems];
  v10 = (void *)MEMORY[0x263F08BD0];
  v11 = [NSNumber numberWithUnsignedInteger:self->_limit];
  v12 = [v11 stringValue];
  v13 = [v10 queryItemWithName:@"limit" value:v12];
  v19[0] = v13;
  v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"art[url]" value:@"f,c"];
  v19[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v16 = [v9 arrayByAddingObjectsFromArray:v15];
  [v5 setQueryItems:v16];

  return v5;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMAPIRecentRadioStationsRequest;
  id result = [(NMAPIRequest *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 16) = self->_limit;
  }
  return result;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end