@interface NSData
- (unint64_t)ic_lengthAsMIMEAttachment;
@end

@implementation NSData

- (unint64_t)ic_lengthAsMIMEAttachment
{
  unint64_t v2 = (2 * ((([(NSData *)self length] + 2) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL;
  return v2 + 2 * (v2 / 0x4C);
}

@end