@interface SXDocument
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)objectValueClassBlockForPropertyWithName:(id)a3;
+ (id)purgeClassBlockForPropertyWithName:(id)a3;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (NSString)identifier;
- (SXDocument)initWithIdentifier:(id)a3 JSONObject:(id)a4 andVersion:(id)a5;
- (SXDocument)initWithJSONObject:(id)a3 andVersion:(id)a4;
@end

@implementation SXDocument

- (SXDocument)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [v9 UUIDString];
  v11 = [(SXDocument *)self initWithIdentifier:v10 JSONObject:v8 andVersion:v7];

  return v11;
}

- (SXDocument)initWithIdentifier:(id)a3 JSONObject:(id)a4 andVersion:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDocument;
  v10 = [(SXJSONObject *)&v13 initWithJSONObject:a4 andVersion:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_identifier, a3);
  }

  return v11;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"resources"])
  {
    uint64_t v5 = +[SXClassFactory valueClassBlockForBaseClass:objc_opt_class()];
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"componentStyles"])
  {
    v6 = &__block_literal_global_10;
  }
  else if ([v4 isEqualToString:@"textStyles"])
  {
    v6 = &__block_literal_global_12;
  }
  else if ([v4 isEqualToString:@"componentTextStyles"])
  {
    v6 = &__block_literal_global_18;
  }
  else
  {
    if (([v4 isEqualToString:@"componentLayouts"] & 1) == 0)
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
      uint64_t v5 = objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
      goto LABEL_3;
    }
    v6 = &__block_literal_global_24;
  }
LABEL_12:

  return v6;
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_3()
{
  return objc_opt_class();
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_4()
{
  return objc_opt_class();
}

+ (id)objectValueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"components"])
  {
    uint64_t v5 = +[SXJSONObjectComponentSupport shared];
    v6 = [v5 objectValueClassBlock];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
    v6 = objc_msgSendSuper2(&v8, sel_objectValueClassBlockForPropertyWithName_, v4);
  }

  return v6;
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"components"])
  {
    uint64_t v5 = +[SXJSONObjectComponentSupport shared];
    v6 = [v5 purgeClassBlock];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
    v6 = objc_msgSendSuper2(&v8, sel_purgeClassBlockForPropertyWithName_, v4);
  }

  return v6;
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"advertisingSettings"]
    || [v6 isEqualToString:@"autoplacement"]
    || [v6 isEqualToString:@"layout"]
    || [v6 isEqualToString:@"hints"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXDocument;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  id v9 = (void *)v8;

  return (Class)v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end