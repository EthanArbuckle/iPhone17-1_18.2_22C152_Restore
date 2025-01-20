@interface NMAPIHeavyRotationRequest
- (Class)responseParserClass;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
@end

@implementation NMAPIHeavyRotationRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)NMAPIHeavyRotationRequest;
  v4 = [(NMAPIRequest *)&v15 urlComponentsWithStoreURLBag:a3 error:a4];
  v5 = NSString;
  v17[0] = @"/v1/me";
  v17[1] = @"history";
  v17[2] = @"heavy-rotation";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v7 = [v5 pathWithComponents:v6];
  [v4 setPath:v7];

  v8 = [v4 queryItems];
  id v9 = objc_alloc(MEMORY[0x263F08BD0]);
  v10 = [&unk_26DA89780 componentsJoinedByString:@","];
  v11 = (void *)[v9 initWithName:@"types" value:v10];
  v16 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v13 = [v8 arrayByAddingObjectsFromArray:v12];
  [v4 setQueryItems:v13];

  return v4;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

@end