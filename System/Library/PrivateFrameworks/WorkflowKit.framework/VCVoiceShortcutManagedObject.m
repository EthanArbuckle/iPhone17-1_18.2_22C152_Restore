@interface VCVoiceShortcutManagedObject
+ (id)fetchRequest;
@end

@implementation VCVoiceShortcutManagedObject

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VCVoiceShortcutManagedObject"];
}

@end