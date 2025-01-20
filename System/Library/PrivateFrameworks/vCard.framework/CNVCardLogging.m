@interface CNVCardLogging
+ (OS_os_log)meCard;
+ (OS_os_log)vCard;
@end

@implementation CNVCardLogging

+ (OS_os_log)vCard
{
  if (vCard_cn_once_token_1 != -1) {
    dispatch_once(&vCard_cn_once_token_1, &__block_literal_global_2);
  }
  v2 = (void *)vCard_cn_once_object_1;
  return (OS_os_log *)v2;
}

uint64_t __23__CNVCardLogging_vCard__block_invoke()
{
  vCard_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "vcard");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)meCard
{
  if (meCard_cn_once_token_2 != -1) {
    dispatch_once(&meCard_cn_once_token_2, &__block_literal_global_4);
  }
  v2 = (void *)meCard_cn_once_object_2;
  return (OS_os_log *)v2;
}

uint64_t __24__CNVCardLogging_meCard__block_invoke()
{
  meCard_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts", "mecard");
  return MEMORY[0x1F41817F8]();
}

@end