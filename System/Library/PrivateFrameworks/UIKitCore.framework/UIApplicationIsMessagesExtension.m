@interface UIApplicationIsMessagesExtension
@end

@implementation UIApplicationIsMessagesExtension

void ___UIApplicationIsMessagesExtension_block_invoke()
{
  if (qword_1EB25B5B8 != -1) {
    dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
  }
  if (byte_1EB25B4E3)
  {
    v0 = [MEMORY[0x1E4F22448] extensionPointRecordForCurrentProcess];
    if (v0)
    {
      id v2 = v0;
      v1 = [v0 identifier];
      byte_1EB25B4E9 = [v1 isEqualToString:@"com.apple.message-payload-provider"];

      v0 = v2;
    }
  }
}

@end