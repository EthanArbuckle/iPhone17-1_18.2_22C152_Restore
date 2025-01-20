@interface VCVoiceShortcutSyncStateManagedObject
+ (id)fetchRequest;
@end

@implementation VCVoiceShortcutSyncStateManagedObject

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VCVoiceShortcutSyncStateManagedObject"];
}

@end