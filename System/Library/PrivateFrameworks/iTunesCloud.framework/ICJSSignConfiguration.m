@interface ICJSSignConfiguration
+ (id)storePlatformConfiguration;
- (NSString)signatureDataCookieName;
- (NSString)signatureDataHeaderName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addRequestComponent:(int64_t)a3 withName:(id)a4;
- (void)_enumerateComponentsUsingBlock:(id)a3;
- (void)includeCookieWithName:(id)a3;
- (void)includeHeaderWithName:(id)a3;
- (void)includeQueryItemWithName:(id)a3;
- (void)setSignatureDataCookieName:(id)a3;
- (void)setSignatureDataHeaderName:(id)a3;
@end

@implementation ICJSSignConfiguration

+ (id)storePlatformConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 includeHeaderWithName:@"X-JS-TIMESTAMP"];
  [v2 includeHeaderWithName:@"X-Apple-Store-Front"];
  [v2 includeQueryItemWithName:@"caller"];
  [v2 includeQueryItemWithName:@"id"];
  [v2 includeQueryItemWithName:@"p"];
  [v2 setSignatureDataHeaderName:@"X-JS-SP-TOKEN"];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDataHeaderName, 0);
  objc_storeStrong((id *)&self->_signatureDataCookieName, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_componentNames, 0);
}

- (void)setSignatureDataHeaderName:(id)a3
{
}

- (NSString)signatureDataHeaderName
{
  return self->_signatureDataHeaderName;
}

- (void)setSignatureDataCookieName:(id)a3
{
}

- (NSString)signatureDataCookieName
{
  return self->_signatureDataCookieName;
}

- (void)_enumerateComponentsUsingBlock:(id)a3
{
  id v4 = a3;
  components = self->_components;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ICJSSignConfiguration__enumerateComponentsUsingBlock___block_invoke;
  v7[3] = &unk_1E5AC6C40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)components enumerateObjectsUsingBlock:v7];
}

void __56__ICJSSignConfiguration__enumerateComponentsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [a2 integerValue];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a3];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v7 + 16))(v7, v8, v9, a4);
}

- (void)_addRequestComponent:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  componentNames = self->_componentNames;
  id v13 = v6;
  if (!componentNames)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = self->_componentNames;
    self->_componentNames = v8;

    id v6 = v13;
    componentNames = self->_componentNames;
  }
  [(NSMutableArray *)componentNames addObject:v6];
  if (!self->_components)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    components = self->_components;
    self->_components = v10;
  }
  v12 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  [(NSMutableArray *)self->_components addObject:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMutableArray *)self->_componentNames mutableCopyWithZone:a3];
    uint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSMutableArray *)self->_components mutableCopyWithZone:a3];
    id v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_signatureDataCookieName copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [(NSString *)self->_signatureDataHeaderName copyWithZone:a3];
    id v13 = (void *)v5[4];
    v5[4] = v12;
  }
  return v5;
}

- (void)includeQueryItemWithName:(id)a3
{
}

- (void)includeHeaderWithName:(id)a3
{
}

- (void)includeCookieWithName:(id)a3
{
}

@end