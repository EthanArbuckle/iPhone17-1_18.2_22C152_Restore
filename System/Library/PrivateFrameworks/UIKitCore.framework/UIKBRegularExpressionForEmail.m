@interface UIKBRegularExpressionForEmail
@end

@implementation UIKBRegularExpressionForEmail

void ___UIKBRegularExpressionForEmail_block_invoke()
{
  if (!qword_1EB261F90)
  {
    uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" options:1 error:0];
    v1 = (void *)qword_1EB261F90;
    qword_1EB261F90 = v0;
  }
}

@end