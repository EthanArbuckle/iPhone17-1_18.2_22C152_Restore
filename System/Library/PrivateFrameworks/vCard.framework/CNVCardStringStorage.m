@interface CNVCardStringStorage
+ (id)storageWithString:(id)a3;
- (CNVCardStringStorage)initWithString:(id)a3;
- (id)insertionMarker;
- (unint64_t)currentLength;
- (unint64_t)estimatedDataLength;
- (void)appendData:(id)a3;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)insertString:(id)a3 atMarker:(id)a4;
@end

@implementation CNVCardStringStorage

+ (id)storageWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (CNVCardStringStorage)initWithString:(id)a3
{
  id v5 = a3;
  v6 = [(CNVCardStringStorage *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_string, a3);
    v8 = v7;
  }

  return v7;
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
    [(NSMutableString *)self->_string appendString:v4];
  }
}

- (void)appendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(CNVCardStringStorage *)self appendString:v6];
}

- (void)appendData:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithData:v5 encoding:4];

  [(CNVCardStringStorage *)self appendString:v6];
}

- (unint64_t)currentLength
{
  return [(NSMutableString *)self->_string length];
}

- (id)insertionMarker
{
  v2 = NSNumber;
  uint64_t v3 = [(NSMutableString *)self->_string length];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (unint64_t)estimatedDataLength
{
  v2 = [(NSMutableString *)self->_string dataUsingEncoding:4];
  unint64_t v3 = [v2 length];

  return v3;
}

- (void)insertString:(id)a3 atMarker:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
    -[NSMutableString insertString:atIndex:](self->_string, "insertString:atIndex:", v7, [v6 unsignedIntegerValue]);
  }
}

- (void).cxx_destruct
{
}

@end