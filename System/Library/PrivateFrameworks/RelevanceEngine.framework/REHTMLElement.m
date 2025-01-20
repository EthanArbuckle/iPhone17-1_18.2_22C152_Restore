@interface REHTMLElement
+ (id)div;
+ (id)elementWithHTMLData:(id)a3;
+ (id)elementWithHTMLString:(id)a3;
+ (id)h1:(id)a3;
+ (id)h2:(id)a3;
+ (id)h3:(id)a3;
+ (id)h4:(id)a3;
+ (id)h5:(id)a3;
+ (id)h6:(id)a3;
+ (id)htmlElementWithTag:(id)a3 content:(id)a4;
+ (id)link:(id)a3 title:(id)a4;
+ (id)nav;
+ (id)script:(id)a3;
+ (unint64_t)_defaultStringEncoding;
- (NSArray)classes;
- (NSData)encodedData;
- (NSDictionary)attributes;
- (REHTMLElement)init;
- (id)_contentString;
- (id)_encodeString:(id)a3;
- (id)_encodedData;
- (id)_prefixContentString;
- (id)_suffixContentString;
- (id)addChild:(id)a3;
- (id)addChildren:(id)a3;
- (id)append:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementByAddingAtttibute:(id)a3 value:(id)a4;
- (id)elementByAddingAtttibutes:(id)a3;
- (id)elementByAddingClass:(id)a3;
- (id)elementByAddingClasses:(id)a3;
@end

@implementation REHTMLElement

- (REHTMLElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLElement;
  v2 = [(REHTMLElement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;
  }
  return v3;
}

+ (id)elementWithHTMLData:(id)a3
{
  id v3 = a3;
  v4 = [[REHTMLDataElement alloc] initWithData:v3];

  return v4;
}

+ (id)elementWithHTMLString:(id)a3
{
  id v3 = a3;
  v4 = [[REHTMLConstantElement alloc] initWithContent:v3];

  return v4;
}

+ (id)htmlElementWithTag:(id)a3 content:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[REHTMLTagElement alloc] initWithTag:v6 content:v5];

  return v7;
}

+ (id)link:(id)a3 title:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = a3;
  }
  id v6 = a3;
  v7 = [a1 htmlElementWithTag:@"a" content:v5];
  v8 = [v7 elementByAddingAtttibute:@"href" value:v6];

  return v8;
}

+ (id)div
{
  return (id)[a1 htmlElementWithTag:@"div" content:&stru_26CFA57D0];
}

+ (id)script:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"script" content:a3];
}

+ (id)nav
{
  return (id)[a1 htmlElementWithTag:@"nav" content:&stru_26CFA57D0];
}

+ (id)h1:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h1" content:a3];
}

+ (id)h2:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h2" content:a3];
}

+ (id)h3:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h3" content:a3];
}

+ (id)h4:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h4" content:a3];
}

+ (id)h5:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h5" content:a3];
}

+ (id)h6:(id)a3
{
  return (id)[a1 htmlElementWithTag:@"h6" content:a3];
}

- (id)_prefixContentString
{
  return &stru_26CFA57D0;
}

- (id)_contentString
{
  return &stru_26CFA57D0;
}

- (id)_suffixContentString
{
  return &stru_26CFA57D0;
}

+ (unint64_t)_defaultStringEncoding
{
  return 4;
}

- (id)_encodeString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = objc_msgSend(v3, "dataUsingEncoding:", objc_msgSend((id)objc_opt_class(), "_defaultStringEncoding"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_encodedData
{
  id v3 = [MEMORY[0x263EFF990] data];
  v4 = [(REHTMLElement *)self _prefixContentString];
  id v5 = [(REHTMLElement *)self _encodeString:v4];

  if (v5) {
    [v3 appendData:v5];
  }
  id v6 = [(REHTMLElement *)self _contentString];
  v7 = [(REHTMLElement *)self _encodeString:v6];

  if (v7) {
    [v3 appendData:v7];
  }
  v8 = [(REHTMLElement *)self _suffixContentString];
  v9 = [(REHTMLElement *)self _encodeString:v8];

  if (v9) {
    [v3 appendData:v9];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (NSData)encodedData
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__26;
  v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__REHTMLElement_encodedData__block_invoke;
  v11[3] = &unk_2644BD938;
  v11[4] = self;
  v11[5] = &v12;
  REHTMLElementAccessLock(v11);
  id v3 = (void *)v13[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [(REHTMLElement *)self _encodedData];
    id v6 = (void *)v13[5];
    v13[5] = v5;

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __28__REHTMLElement_encodedData__block_invoke_2;
    v10[3] = &unk_2644BD960;
    v10[4] = self;
    v10[5] = &v12;
    REHTMLElementAccessLock(v10);
    id v7 = [NSString alloc];
    v8 = (void *)[v7 initWithData:v13[5] encoding:4];
    [v8 length];
    id v4 = (id)v13[5];
  }
  _Block_object_dispose(&v12, 8);

  return (NSData *)v4;
}

void __28__REHTMLElement_encodedData__block_invoke(uint64_t a1)
{
}

void __28__REHTMLElement_encodedData__block_invoke_2(uint64_t a1)
{
}

- (NSArray)classes
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (id)elementByAddingClass:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[REHTMLElement elementByAddingClasses:](self, "elementByAddingClasses:", v6, v9, v10);

  return v7;
}

- (id)elementByAddingClasses:(id)a3
{
  id v4 = a3;
  id v5 = [(REHTMLElement *)self classes];
  id v6 = [v5 arrayByAddingObjectsFromArray:v4];

  id v7 = [(REHTMLElement *)self elementBySettingClasses:v6];

  return v7;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (id)elementByAddingAtttibute:(id)a3 value:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  v13[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = [(REHTMLElement *)self elementByAddingAtttibutes:v9];

  return v10;
}

- (id)elementByAddingAtttibutes:(id)a3
{
  id v4 = a3;
  id v5 = [(REHTMLElement *)self attributes];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setValuesForKeysWithDictionary:v4];
  id v7 = (void *)[v6 copy];
  id v8 = [(REHTMLElement *)self elementBySettingAtttibutes:v7];

  return v8;
}

- (id)append:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = [REHTMLContainerElement alloc];
    v9[0] = self;
    v9[1] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

    id v7 = [(REHTMLContainerElement *)v5 initWithElements:v6];
  }
  else
  {
    id v7 = self;
  }
  return v7;
}

- (id)addChild:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v9 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v9 count:1];

    -[REHTMLElement addChildren:](self, "addChildren:", v6, v9, v10);
    id v7 = (REHTMLElement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = self;
  }
  return v7;
}

- (id)addChildren:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    id v5 = [[REHTMLParentElement alloc] initWithParents:self children:v4];
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (void).cxx_destruct
{
}

@end