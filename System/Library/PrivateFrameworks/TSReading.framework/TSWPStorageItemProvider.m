@interface TSWPStorageItemProvider
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)storageItemProviderWithString:(id)a3;
- (NSString)string;
- (TSWPStorageItemProvider)initWithString:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)_loadPlainTextData:(id)a3;
- (void)dealloc;
- (void)setString:(id)a3;
@end

@implementation TSWPStorageItemProvider

- (TSWPStorageItemProvider)initWithString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPStorageItemProvider;
  v4 = [(TSWPStorageItemProvider *)&v6 init];
  if (v4) {
    v4->_string = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageItemProvider;
  [(TSWPStorageItemProvider *)&v3 dealloc];
}

+ (id)storageItemProviderWithString:(id)a3
{
  objc_super v3 = [[TSWPStorageItemProvider alloc] initWithString:a3];

  return v3;
}

- (void)_loadPlainTextData:(id)a3
{
  v4 = [(NSString *)self->_string dataUsingEncoding:4];
  v5 = (void (*)(id, NSData *, void))*((void *)a3 + 2);

  v5(a3, v4, 0);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = [(id)*MEMORY[0x263F1DD38] identifier];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend((id)*MEMORY[0x263F1DD38], "identifier"), "isEqualToString:", a3))
  {
    [(TSWPStorageItemProvider *)self _loadPlainTextData:a4];
  }
  else
  {
    if (a3)
    {
      v9 = @"typeIdentifier";
      v10[0] = a3;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:v7]);
  }
  return 0;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

@end