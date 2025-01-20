@interface CNVCardLine21SerializationStrategy
+ (id)serializerWithStorage:(id)a3 encodings:(id)a4;
- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3;
- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3 encodings:(id)a4;
- (id)detectedTypeOfData:(id)a3;
- (id)necessaryEncodingForValue:(id)a3;
- (void)_addAutomagicParametersForData:(id)a3;
- (void)serializeArray:(id)a3 withItemSeparator:(id)a4;
- (void)serializeData:(id)a3;
- (void)serializeParameters:(id)a3;
- (void)serializeString:(id)a3;
- (void)serializeVersionPlaceholder;
@end

@implementation CNVCardLine21SerializationStrategy

+ (id)serializerWithStorage:(id)a3 encodings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithStorage:v7 encodings:v6];

  return v8;
}

- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3
{
  id v4 = a3;
  v5 = +[CNVCardEncoding encodingsFromUserDefaults];
  id v6 = [(CNVCardLine21SerializationStrategy *)self initWithStorage:v4 encodings:v5];

  return v6;
}

- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3 encodings:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNVCardLine21SerializationStrategy;
  id v7 = [(CNVCardLineSerializationStrategyImpl *)&v12 initWithStorage:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    encodings = v7->_encodings;
    v7->_encodings = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)serializeParameters:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_134);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", @";%@",
          *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

id __58__CNVCardLine21SerializationStrategy_serializeParameters___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = +[CNVCardParameterEncoder encodeParameterValue:v2];

  return v3;
}

- (void)serializeString:(id)a3
{
  id v4 = a3;
  id v11 = [(CNVCardLine21SerializationStrategy *)self necessaryEncodingForValue:v4];
  uint64_t v5 = [v11 name];
  char v6 = [v5 isEqualToString:@"ASCII"];

  if ((v6 & 1) == 0)
  {
    storage = self->super._storage;
    uint64_t v8 = [v11 name];
    [(CNVCardSerializationStorage *)storage appendFormat:@";CHARSET=%@", v8];
  }
  [(CNVCardSerializationStorage *)self->super._storage appendString:@":"];
  long long v9 = self->super._storage;
  long long v10 = +[CNVCardValueEncoder encodeValue:v4];

  -[CNVCardSerializationStorage appendString:usingEncoding:](v9, "appendString:usingEncoding:", v10, [v11 stringEncoding]);
}

- (void)serializeArray:(id)a3 withItemSeparator:(id)a4
{
  uint64_t v14 = (__CFString *)a4;
  char v6 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_142);
  if (v14) {
    uint64_t v7 = v14;
  }
  else {
    uint64_t v7 = @";";
  }
  uint64_t v8 = [v6 componentsJoinedByString:v7];
  long long v9 = [(CNVCardLine21SerializationStrategy *)self necessaryEncodingForValue:v8];
  long long v10 = [v9 name];
  char v11 = [v10 isEqualToString:@"ASCII"];

  if ((v11 & 1) == 0)
  {
    storage = self->super._storage;
    v13 = [v9 name];
    [(CNVCardSerializationStorage *)storage appendFormat:@";CHARSET=%@", v13];
  }
  [(CNVCardSerializationStorage *)self->super._storage appendString:@":"];
  -[CNVCardSerializationStorage appendString:usingEncoding:](self->super._storage, "appendString:usingEncoding:", v8, [v9 stringEncoding]);
}

id __71__CNVCardLine21SerializationStrategy_serializeArray_withItemSeparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardValueEncoder encodeValue:a2];
}

- (void)serializeData:(id)a3
{
  id v4 = a3;
  [(CNVCardLine21SerializationStrategy *)self _addAutomagicParametersForData:v4];
  [(CNVCardSerializationStorage *)self->super._storage appendFormat:@":%@ ", CNVCardLineDelimiter];
  objc_msgSend(v4, "_cn_encodeVCardBase64DataWithInitialLength:", 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = (void *)[[NSString alloc] initWithData:v6 encoding:1];
  [(CNVCardSerializationStorage *)self->super._storage appendString:v5];
}

- (void)_addAutomagicParametersForData:(id)a3
{
  storage = self->super._storage;
  id v5 = a3;
  [(CNVCardSerializationStorage *)storage appendString:@";ENCODING=BASE64"];
  uint64_t v6 = [(CNVCardLine21SerializationStrategy *)self detectedTypeOfData:v5];

  if (v6) {
    [(CNVCardSerializationStorage *)self->super._storage appendFormat:@";TYPE=%@", v6];
  }
  MEMORY[0x1F41817F8]();
}

- (id)detectedTypeOfData:(id)a3
{
  if (+[CNVCardData isJPEGData:a3]) {
    return @"JPEG";
  }
  else {
    return 0;
  }
}

- (id)necessaryEncodingForValue:(id)a3
{
  id v4 = a3;
  encodings = self->_encodings;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CNVCardLine21SerializationStrategy_necessaryEncodingForValue___block_invoke;
  v9[3] = &unk_1E6C2D300;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [(NSArray *)encodings _cn_firstObjectPassingTest:v9];
  if (!v7)
  {
    uint64_t v7 = +[CNVCardEncoding utf8Encoding];
  }

  return v7;
}

uint64_t __64__CNVCardLine21SerializationStrategy_necessaryEncodingForValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 stringEncoding];
  return [v2 canBeConvertedToEncoding:v3];
}

- (void)serializeVersionPlaceholder
{
}

- (void).cxx_destruct
{
}

@end