@interface NSString
+ (id)ps_stringWithData:(id)a3 encoding:(unint64_t)a4;
+ (id)ps_stringWithSTL:(const void *)a3;
+ (id)ps_stringWithUTF8Data:(id)a3;
- (BOOL)ps_IsNilOrEmpty;
- (basic_string<char,)ps_STLString;
- (basic_string<char,)ps_STLStringOnNil:(std::allocator<char>> *__return_ptr)retstr;
- (id)ps_UTF8Data;
- (id)ps_stringWithoutPrefix:(id)a3;
- (id)ps_urlEncode;
@end

@implementation NSString

+ (id)ps_stringWithSTL:(const void *)a3
{
  if (*((char *)a3 + 23) >= 0) {
    v5 = a3;
  }
  else {
    v5 = *(const void **)a3;
  }
  v6 = +[NSString stringWithUTF8String:v5];

  return v6;
}

- (basic_string<char,)ps_STLStringOnNil:(std::allocator<char>> *__return_ptr)retstr
{
  v3 = v1;
  id v7 = v2;
  if (v3 || (v3 = v7) != 0)
  {
    [v3 ps_STLString];
    v5 = v7;
  }
  else
  {
    retstr->__r_.__value_.var0.var1.__data_ = 0;
    retstr->__r_.__value_.var0.var1.__size_ = 0;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = 0;
    v5 = 0;
  }

  return result;
}

- (basic_string<char,)ps_STLString
{
  v2 = v1;
  v5 = (const char *)[v2 UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  unint64_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v8 = v6 | 7;
    }
    uint64_t v9 = v8 + 1;
    v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v8 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v7;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = v9 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v10;
    retstr = v10;
    goto LABEL_8;
  }
  *((unsigned char *)&retstr->__r_.__value_.var0.var1 + 23) = v6;
  if (v6) {
LABEL_8:
  }
    memmove(retstr, v5, v7);
  retstr->__r_.__value_.var0.var0.__data_[v7] = 0;

  return result;
}

+ (id)ps_stringWithUTF8Data:(id)a3
{
  v3 = +[NSString ps_stringWithData:a3 encoding:4];

  return v3;
}

+ (id)ps_stringWithData:(id)a3 encoding:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:a4];

  return v6;
}

- (id)ps_UTF8Data
{
  return [(NSString *)self dataUsingEncoding:4];
}

- (id)ps_urlEncode
{
  v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, 0, @"!*'\"();:@&=+$,/?%#[]% ",
                       0x8000100u);

  return v2;
}

- (BOOL)ps_IsNilOrEmpty
{
  return !self || [(NSString *)self length] == 0;
}

- (id)ps_stringWithoutPrefix:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self hasPrefix:v4])
  {
    -[NSString substringFromIndex:](self, "substringFromIndex:", [v4 length]);
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

@end