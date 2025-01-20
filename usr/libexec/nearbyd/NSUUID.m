@interface NSUUID
- (vector<unsigned)_niServerBytesVector;
@end

@implementation NSUUID

- (vector<unsigned)_niServerBytesVector
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  sub_10003F834((unint64_t *)retstr, 0x10uLL);
  return (vector<unsigned char, std::allocator<unsigned char>> *)[(NSUUID *)self getUUIDBytes:retstr->__begin_];
}

@end