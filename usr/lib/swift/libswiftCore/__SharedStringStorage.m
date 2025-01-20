@interface __SharedStringStorage
- (_TtCs21__SharedStringStorage)init;
- (char)getCString:(char *)a3 maxLength:(int64_t)a4 encoding:(unint64_t)a5;
- (char)isEqual:(id)a3;
- (char)isEqualToString:(id)a3;
- (const)UTF8String;
- (const)_fastCStringContents:(char)a3;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (int64_t)length;
- (unint64_t)fastestEncoding;
- (unint64_t)hash;
- (unsigned)characterAtIndex:(int64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(id)a4;
@end

@implementation __SharedStringStorage

- (_TtCs21__SharedStringStorage)init
{
  closure #1 in _unimplementedInitializer(className:initName:file:line:column:)("Swift.__SharedStringStorage", 27, "init()", 6, 2, "Swift/StringStorage.swift", 25, 2, 0x297uLL, 0x16uLL);
  __break(1u);
  return result;
}

- (int64_t)length
{
  return String.UTF16View.count.getter(*(void *)self->_countAndFlags, (unint64_t)self);
}

- (unint64_t)hash
{
  if ((*(void *)self->_countAndFlags & 0x8000000000000000) != 0) {
    return _swift_stdlib_CFStringHashCString();
  }
  else {
    return _swift_stdlib_CFStringHashNSString();
  }
}

- (unsigned)characterAtIndex:(int64_t)a3
{
  return __SharedStringStorage.character(at:)(a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(id)a4
{
}

- (unint64_t)fastestEncoding
{
  if (*(uint64_t *)self->_countAndFlags < 0) {
    return 1;
  }
  else {
    return 4;
  }
}

- (const)_fastCStringContents:(char)a3
{
  if ((*(void *)self->_countAndFlags & 0x8000000000000000) != 0) {
    return *(const char **)self->start;
  }
  else {
    return 0;
  }
}

- (const)UTF8String
{
  return *(const char **)self->start;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  if (a3 == 1 && *(uint64_t *)self->_countAndFlags < 0 || a3 == 4) {
    return *(const char **)self->start;
  }
  else {
    return (const char *)_swift_stdlib_NSStringCStringUsingEncodingTrampoline(self, a3);
  }
}

- (char)getCString:(char *)a3 maxLength:(int64_t)a4 encoding:(unint64_t)a5
{
  return __SharedStringStorage.getCString(_:maxLength:encoding:)(a3, a4, a5);
}

- (char)isEqualToString:(id)a3
{
  return __SharedStringStorage.isEqualToString(to:)((uint64_t)a3);
}

- (char)isEqual:(id)a3
{
  return __SharedStringStorage.isEqual(to:)((uint64_t)a3);
}

@end