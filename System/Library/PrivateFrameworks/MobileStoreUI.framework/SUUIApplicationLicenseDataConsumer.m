@interface SUUIApplicationLicenseDataConsumer
- (id)applicationLicenseWithDictionary:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUIApplicationLicenseDataConsumer

- (id)applicationLicenseWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SUUIApplicationLicensePage);
  v5 = [v3 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUUIApplicationLicensePage *)v4 setTitle:v5];
  }
  v6 = [v3 objectForKey:@"item-metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKey:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v6 objectForKey:@"type"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v8 = 0;
      }
      id v9 = [NSString alloc];
      v10 = [MEMORY[0x263F81708] systemFontOfSize:0.0];
      v11 = [v10 fontName];
      v12 = objc_msgSend(v9, "initWithFormat:", @"body { padding: 10px; background: white; font-family: '%@'; font-size: 13px; color: black; line-height: 18px; }p { margin-top: 0; padding-top: 0 }",
                      v11);

      if ([v8 isEqualToString:@"markup"])
      {
        uint64_t v13 = [[NSString alloc] initWithFormat:@"<html><head><style type=\"text/css\">%@</style></head><body><div>%@</div></body></html>", v12, v7];
      }
      else
      {
        uint64_t v13 = SUCreateHTMLForPlainText();
      }
      v14 = (void *)v13;
      [(SUUIApplicationLicensePage *)v4 setLicenseAgreementHTML:v13];
    }
  }

  return v4;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseDataConsumer;
  v6 = [(SSVURLProtocolConsumer *)&v9 objectForData:a3 response:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(SUUIApplicationLicenseDataConsumer *)self applicationLicenseWithDictionary:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end