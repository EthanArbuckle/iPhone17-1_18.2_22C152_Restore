@interface STSApdu
@end

@implementation STSApdu

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_le, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end