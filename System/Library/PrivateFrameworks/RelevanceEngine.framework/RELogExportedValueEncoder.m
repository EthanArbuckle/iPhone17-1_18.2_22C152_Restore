@interface RELogExportedValueEncoder
+ (id)_dateFormatter;
- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5;
- (void)writeDate:(id)a3 toStream:(id)a4;
- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6;
- (void)writeNullToStream:(id)a3;
- (void)writeNumber:(id)a3 toStream:(id)a4;
- (void)writeObjectStart:(id)a3 toStream:(id)a4;
- (void)writeString:(id)a3 toStream:(id)a4;
@end

@implementation RELogExportedValueEncoder

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken_80 != -1) {
    dispatch_once(&_dateFormatter_onceToken_80, &__block_literal_global_82);
  }
  v2 = (void *)_dateFormatter_DateFormatter_79;
  return v2;
}

uint64_t __43__RELogExportedValueEncoder__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)_dateFormatter_DateFormatter_79;
  _dateFormatter_DateFormatter_79 = (uint64_t)v0;

  v2 = (void *)_dateFormatter_DateFormatter_79;
  return [v2 setFormatOptions:2035];
}

- (void)writeDate:(id)a3 toStream:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _dateFormatter];
  id v8 = [v7 stringFromDate:v6];

  objc_msgSend(v5, "re_writeString:", v8);
}

- (void)writeString:(id)a3 toStream:(id)a4
{
}

- (void)writeNumber:(id)a3 toStream:(id)a4
{
  id v5 = a4;
  id v6 = [a3 stringValue];
  objc_msgSend(v5, "re_writeString:", v6);
}

- (void)writeNullToStream:(id)a3
{
}

- (void)writeObjectStart:(id)a3 toStream:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = +[RESingleton sharedInstance];
  int v7 = [v6 exportedInterfaceClass:objc_opt_class()];

  if (v7) {
    [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v9];
  }
  else {
  id v8 = [v9 description];
  }
  objc_msgSend(v5, "re_writeString:", v8);
}

- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6
{
  id v8 = (void (*)(id))*((void *)a4 + 2);
  id v9 = (void (**)(void))a5;
  id v10 = a3;
  v8(a4);
  objc_msgSend(v10, "re_writeString:", @"=");
  v9[2](v9);

  objc_msgSend(v10, "re_writeString:", @" ");
}

- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5
{
  id v6 = (void (*)(id))*((void *)a4 + 2);
  id v7 = a3;
  v6(a4);
  objc_msgSend(v7, "re_writeString:", @" ");
}

@end