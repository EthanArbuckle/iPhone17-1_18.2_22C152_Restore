@interface NSDateFormatter(RemoteManagementModel)
+ (id)rmmodel_sharedRFC3339DateFormatter;
@end

@implementation NSDateFormatter(RemoteManagementModel)

+ (id)rmmodel_sharedRFC3339DateFormatter
{
  if (rmmodel_sharedRFC3339DateFormatter_onceToken != -1) {
    dispatch_once(&rmmodel_sharedRFC3339DateFormatter_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)rmmodel_sharedRFC3339DateFormatter_rfcFormatter;
  return v0;
}

@end