@interface PMLSessionDescriptor
+ (float)_parseFeatureVersion:(id)a3 descriptor:(id)a4;
+ (id)descriptorForName:(id)a3 version:(id)a4 locale:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubSessionDescriptor;
- (NSString)description;
- (NSString)locale;
- (NSString)name;
- (NSString)version;
- (PMLSessionDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5;
- (PMLSessionDescriptor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (float)featureVersion;
- (id)baseSessionDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subSessionDescriptorForLabel:(unint64_t)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)hash;
- (unint64_t)subSessionLabel;
@end

@implementation PMLSessionDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ %@ %@ %@>", v5, self->_name, self->_version, self->_locale];

  return (NSString *)v6;
}

- (PMLSessionDescriptor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"NAME"];
  v8 = [v6 objectForKeyedSubscript:@"VERSION"];
  v9 = [v6 objectForKeyedSubscript:@"LOCALE"];

  v10 = [(PMLSessionDescriptor *)self initWithName:v7 version:v8 locale:v9];
  return v10;
}

- (id)toPlistWithChunks:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)&self->_name;
  v6[0] = @"NAME";
  v6[1] = @"VERSION";
  long long v7 = v3;
  v6[2] = @"LOCALE";
  locale = self->_locale;
  v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:v6 count:3];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    name = self->_name;
    id v6 = [v4 name];
    if ([(NSString *)name isEqual:v6])
    {
      version = self->_version;
      v8 = [v4 version];
      if ([(NSString *)version isEqual:v8])
      {
        locale = self->_locale;
        v10 = [v4 locale];
        char v11 = [(NSString *)locale isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSString *)self->_locale hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [(PMLSessionDescriptor *)self name];
  v5 = [(PMLSessionDescriptor *)self version];
  id v6 = [(PMLSessionDescriptor *)self locale];
  long long v7 = +[PMLSessionDescriptor descriptorForName:v4 version:v5 locale:v6];

  return v7;
}

- (unint64_t)subSessionLabel
{
  NSUInteger v4 = (void *)MEMORY[0x223C7E5C0]();
  if (subSessionLabel__pasOnceToken3 != -1) {
    dispatch_once(&subSessionLabel__pasOnceToken3, &__block_literal_global_53);
  }
  id v5 = (id)subSessionLabel__pasExprOnceResult;
  id v6 = [(PMLSessionDescriptor *)self name];
  long long v7 = [(PMLSessionDescriptor *)self name];
  v8 = objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v7, "length"));

  if (!v8)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PMLSessionDescriptor.m", 119, @"Handle %@ is not a sub-model handle.", self object file lineNumber description];
  }
  uint64_t v9 = [v8 rangeAtIndex:1];
  uint64_t v11 = v10;
  v12 = [(PMLSessionDescriptor *)self name];
  v13 = objc_msgSend(v12, "substringWithRange:", v9, v11);

  unint64_t v14 = [v13 integerValue];
  return v14;
}

void __39__PMLSessionDescriptor_subSessionLabel__block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"_label([0-9]+)" options:1 error:0];
  v2 = (void *)subSessionLabel__pasExprOnceResult;
  subSessionLabel__pasExprOnceResult = v1;
}

- (BOOL)isSubSessionDescriptor
{
  NSUInteger v3 = (void *)MEMORY[0x223C7E5C0](self, a2);
  if (isSubSessionDescriptor__pasOnceToken2 != -1) {
    dispatch_once(&isSubSessionDescriptor__pasOnceToken2, &__block_literal_global_51);
  }
  id v4 = (id)isSubSessionDescriptor__pasExprOnceResult;
  id v5 = [(PMLSessionDescriptor *)self name];
  id v6 = [(PMLSessionDescriptor *)self name];
  uint64_t v7 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  return v7 != 0;
}

void __46__PMLSessionDescriptor_isSubSessionDescriptor__block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"_label[0-9]+" options:1 error:0];
  v2 = (void *)isSubSessionDescriptor__pasExprOnceResult;
  isSubSessionDescriptor__pasExprOnceResult = v1;
}

- (id)baseSessionDescriptor
{
  NSUInteger v3 = (void *)MEMORY[0x223C7E5C0](self, a2);
  if (baseSessionDescriptor__pasOnceToken1 != -1) {
    dispatch_once(&baseSessionDescriptor__pasOnceToken1, &__block_literal_global_43);
  }
  id v4 = (id)baseSessionDescriptor__pasExprOnceResult;
  id v5 = [(PMLSessionDescriptor *)self name];
  id v6 = [(PMLSessionDescriptor *)self name];
  uint64_t v7 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v6, "length"), &stru_26D329A58);

  v8 = [(PMLSessionDescriptor *)self version];
  uint64_t v9 = [(PMLSessionDescriptor *)self locale];
  uint64_t v10 = +[PMLSessionDescriptor descriptorForName:v7 version:v8 locale:v9];

  return v10;
}

void __45__PMLSessionDescriptor_baseSessionDescriptor__block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"_label[0-9]+" options:1 error:0];
  v2 = (void *)baseSessionDescriptor__pasExprOnceResult;
  baseSessionDescriptor__pasExprOnceResult = v1;
}

- (id)subSessionDescriptorForLabel:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x223C7E5C0](self, a2);
  id v6 = [NSString alloc];
  uint64_t v7 = [(PMLSessionDescriptor *)self name];
  v8 = (void *)[v6 initWithFormat:@"%@_label%lu", v7, a3];

  uint64_t v9 = [(PMLSessionDescriptor *)self version];
  uint64_t v10 = [(PMLSessionDescriptor *)self locale];
  uint64_t v11 = +[PMLSessionDescriptor descriptorForName:v8 version:v9 locale:v10];

  return v11;
}

- (float)featureVersion
{
  v2 = [(_PASLazyResult *)self->_featureVersion result];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (PMLSessionDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PMLSessionDescriptor.m", 31, @"Invalid parameter not satisfying: %@", @"version" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PMLSessionDescriptor.m", 30, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PMLSessionDescriptor.m", 32, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)PMLSessionDescriptor;
  v13 = [(PMLSessionDescriptor *)&v26 init];
  unint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_version, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
    id v15 = objc_alloc(MEMORY[0x263F61E68]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__PMLSessionDescriptor_initWithName_version_locale___block_invoke;
    v22[3] = &unk_26459F510;
    id v23 = v11;
    id v24 = v10;
    id v25 = v12;
    uint64_t v16 = [v15 initWithBlock:v22];
    featureVersion = v14->_featureVersion;
    v14->_featureVersion = (_PASLazyResult *)v16;
  }
  return v14;
}

id __52__PMLSessionDescriptor_initWithName_version_locale___block_invoke(void *a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v2 = a1[4];
  float v3 = (void *)[[NSString alloc] initWithFormat:@"%@-%@-%@", a1[5], v2, a1[6]];
  +[PMLSessionDescriptor _parseFeatureVersion:v2 descriptor:v3];
  float v4 = objc_msgSend(v1, "numberWithFloat:");

  return v4;
}

+ (float)_parseFeatureVersion:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  context = (void *)MEMORY[0x223C7E5C0]();
  if (_parseFeatureVersion_descriptor___pasOnceToken0 != -1) {
    dispatch_once(&_parseFeatureVersion_descriptor___pasOnceToken0, &__block_literal_global_4313);
  }
  id v9 = (id)_parseFeatureVersion_descriptor___pasExprOnceResult;
  if (!v9)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PMLSessionDescriptor.m", 57, @"Invalid parameter not satisfying: %@", @"regex" object file lineNumber description];
  }
  id v10 = objc_msgSend(v9, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  uint64_t v11 = [v10 count];
  id v12 = (uint64_t *)MEMORY[0x263EFF498];
  if (v11 != 1)
  {
    v13 = (void *)MEMORY[0x263EFF940];
    uint64_t v14 = *MEMORY[0x263EFF498];
    id v15 = [v9 pattern];
    objc_msgSend(v13, "raise:format:", v14, @"Unexpected number of matches for %@; pattern: %@; descriptor: %@",
      v7,
      v15,
      v8,
      context);
  }
  uint64_t v16 = [v10 firstObject];
  if ([v16 numberOfRanges] != 5)
  {
    v17 = (void *)MEMORY[0x263EFF940];
    uint64_t v18 = *v12;
    v19 = [v9 pattern];
    objc_msgSend(v17, "raise:format:", v18, @"Unexpected number of match ranges for %@; pattern: %@; descriptor: %@",
      v7,
      v19,
      v8);
  }
  uint64_t v20 = [v16 rangeAtIndex:2];
  v22 = objc_msgSend(v7, "substringWithRange:", v20, v21);
  [v22 floatValue];
  float v24 = v23;

  if (v24 <= 0.0)
  {
    id v25 = (void *)MEMORY[0x263EFF940];
    uint64_t v26 = *v12;
    v27 = [v9 pattern];
    objc_msgSend(v25, "raise:format:", v26, @"Unexpected featureVersion extracted for %@; pattern: %@; descriptor: %@",
      v7,
      v27,
      v8);
  }

  return v24;
}

void __56__PMLSessionDescriptor__parseFeatureVersion_descriptor___block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(^|&)FV=([0-9]+(.[0-9]+)?)($|&)" options:0 error:0];
  uint64_t v2 = (void *)_parseFeatureVersion_descriptor___pasExprOnceResult;
  _parseFeatureVersion_descriptor___pasExprOnceResult = v1;
}

+ (id)descriptorForName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 version:v9 locale:v8];

  return v11;
}

@end