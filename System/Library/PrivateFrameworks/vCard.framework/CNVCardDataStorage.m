@interface CNVCardDataStorage
+ (id)storageWithData:(id)a3;
- (CNVCardDataStorage)initWithData:(id)a3;
- (id)insertionMarker;
- (unint64_t)currentLength;
- (unint64_t)estimatedDataLength;
- (void)appendData:(id)a3;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)appendString:(id)a3 usingEncoding:(unint64_t)a4;
- (void)insertString:(id)a3 atMarker:(id)a4;
@end

@implementation CNVCardDataStorage

+ (id)storageWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithData:v4];

  return v5;
}

- (CNVCardDataStorage)initWithData:(id)a3
{
  id v5 = a3;
  v6 = [(CNVCardDataStorage *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
    [(CNVCardDataStorage *)self appendString:v4 usingEncoding:4];
  }
}

- (void)appendString:(id)a3 usingEncoding:(unint64_t)a4
{
  data = self->_data;
  id v5 = [a3 dataUsingEncoding:a4];
  [(NSMutableData *)data appendData:v5];
}

- (void)appendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(CNVCardDataStorage *)self appendString:v6];
}

- (void)appendData:(id)a3
{
}

- (unint64_t)currentLength
{
  return [(NSMutableData *)self->_data length];
}

- (id)insertionMarker
{
  v2 = NSNumber;
  NSUInteger v3 = [(NSMutableData *)self->_data length];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (unint64_t)estimatedDataLength
{
  return [(NSMutableData *)self->_data length];
}

- (void)insertString:(id)a3 atMarker:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    uint64_t v7 = [v11 dataUsingEncoding:4];
    uint64_t v8 = [v6 unsignedIntegerValue];
    data = self->_data;
    id v10 = v7;
    -[NSMutableData replaceBytesInRange:withBytes:length:](data, "replaceBytesInRange:withBytes:length:", v8, 0, [v10 bytes], objc_msgSend(v10, "length"));
  }
}

- (void).cxx_destruct
{
}

@end