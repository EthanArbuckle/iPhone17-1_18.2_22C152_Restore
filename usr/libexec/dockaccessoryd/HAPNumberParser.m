@interface HAPNumberParser
- (HAPNumberParser)initWithTLVData:(id)a3;
- (unint64_t)decodedNumber;
@end

@implementation HAPNumberParser

- (HAPNumberParser)initWithTLVData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HAPNumberParser;
  v5 = [(HAPNumberParser *)&v8 init];
  v6 = v5;
  if (v5) {
    [v4 getBytes:&v5->_decodedNumber length:8];
  }

  return v6;
}

- (unint64_t)decodedNumber
{
  return self->_decodedNumber;
}

@end