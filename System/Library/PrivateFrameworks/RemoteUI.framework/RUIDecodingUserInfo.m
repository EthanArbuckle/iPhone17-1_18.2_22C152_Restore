@interface RUIDecodingUserInfo
- (RUIDecodingUserInfo)init;
@end

@implementation RUIDecodingUserInfo

- (RUIDecodingUserInfo)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIDecodingUserInfo_values) = (Class)MEMORY[0x263F8EE80];
  v3.receiver = self;
  v3.super_class = (Class)RUIDecodingUserInfo;
  return [(RUIDecodingUserInfo *)&v3 init];
}

- (void).cxx_destruct
{
}

@end