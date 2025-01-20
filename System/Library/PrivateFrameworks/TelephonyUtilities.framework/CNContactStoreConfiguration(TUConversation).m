@interface CNContactStoreConfiguration(TUConversation)
+ (id)tu_contactStoreConfigurationForConversation:()TUConversation;
@end

@implementation CNContactStoreConfiguration(TUConversation)

+ (id)tu_contactStoreConfigurationForConversation:()TUConversation
{
  v3 = (objc_class *)MEMORY[0x1E4F1B990];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 provider];

  v7 = [v6 assumedIdentity];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = objc_msgSend(v8, "tu_assumedIdentity");
  }
  [v5 setAssumedIdentity:v7];

  return v5;
}

@end