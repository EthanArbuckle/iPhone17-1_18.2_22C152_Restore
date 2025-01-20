@interface REJSONExportedValueEncoder
+ (id)_dateFormatter;
- (BOOL)writesArrayHeader;
- (BOOL)writesDictionaryHeader;
- (void)_writeValueAsJSON:(id)a3 toStream:(id)a4;
- (void)writeArrayEndToStream:(id)a3;
- (void)writeArrayStartToStream:(id)a3;
- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5;
- (void)writeDate:(id)a3 toStream:(id)a4;
- (void)writeDictionaryEndToStream:(id)a3;
- (void)writeDictionaryStartToStream:(id)a3;
- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6;
- (void)writeNullToStream:(id)a3;
- (void)writeObjectEnd:(id)a3 toStream:(id)a4;
- (void)writeObjectStart:(id)a3 toStream:(id)a4;
@end

@implementation REJSONExportedValueEncoder

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_dateFormatter_DateFormatter;
  return v2;
}

uint64_t __44__REJSONExportedValueEncoder__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)_dateFormatter_DateFormatter;
  _dateFormatter_DateFormatter = (uint64_t)v0;

  v2 = (void *)_dateFormatter_DateFormatter;
  return [v2 setFormatOptions:1907];
}

- (void)writeDate:(id)a3 toStream:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _dateFormatter];
  id v8 = [v7 stringFromDate:v6];

  objc_msgSend(v5, "re_writeString:", v8);
}

- (void)_writeValueAsJSON:(id)a3 toStream:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F08900];
  id v15 = a3;
  v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  v9 = [v7 arrayWithObjects:&v15 count:1];
  v10 = objc_msgSend(v6, "dataWithJSONObject:options:error:", v9, 0, 0, v15, v16);

  id v11 = [NSString alloc];
  v12 = (void *)[v11 initWithData:v10 encoding:4];
  unint64_t v13 = [v12 length];
  if (v13 >= 3)
  {
    uint64_t v14 = objc_msgSend(v12, "substringWithRange:", 1, v13 - 2);

    objc_msgSend(v5, "re_writeString:", v14);
    v12 = (void *)v14;
  }
}

- (void)writeNullToStream:(id)a3
{
}

- (void)writeObjectStart:(id)a3 toStream:(id)a4
{
}

- (void)writeObjectEnd:(id)a3 toStream:(id)a4
{
}

- (BOOL)writesDictionaryHeader
{
  return 1;
}

- (void)writeDictionaryStartToStream:(id)a3
{
}

- (void)writeDictionaryEndToStream:(id)a3
{
}

- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6
{
  id v11 = a3;
  v9 = (void (**)(void))a5;
  v10 = (void (**)(void))a4;
  objc_msgSend(v11, "re_writeString:", @"\"");
  v10[2](v10);

  objc_msgSend(v11, "re_writeString:", @"\"");
  objc_msgSend(v11, "re_writeString:", @":");
  v9[2](v9);

  if (!a6) {
    objc_msgSend(v11, "re_writeString:", @",");
  }
}

- (BOOL)writesArrayHeader
{
  return 1;
}

- (void)writeArrayStartToStream:(id)a3
{
}

- (void)writeArrayEndToStream:(id)a3
{
}

- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5
{
  id v7 = a3;
  (*((void (**)(id))a4 + 2))(a4);
  if (!a5) {
    objc_msgSend(v7, "re_writeString:", @",");
  }
}

@end