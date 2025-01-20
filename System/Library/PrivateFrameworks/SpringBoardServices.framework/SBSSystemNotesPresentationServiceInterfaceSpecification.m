@interface SBSSystemNotesPresentationServiceInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSSystemNotesPresentationServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.system-notes-presentation-service";
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_3 != -1) {
    dispatch_once(&interface_onceToken_3, &__block_literal_global_12);
  }
  v2 = (void *)interface___interface_3;
  return (BSServiceInterface *)v2;
}

void __68__SBSSystemNotesPresentationServiceInterfaceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF5C910];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF67178];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_3;
  interface___interface_3 = v1;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

@end