@interface NFReaderSessionInternalInterface
+ (id)interface;
@end

@implementation NFReaderSessionInternalInterface

+ (id)interface
{
  self;
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF465A0];
  +[NFReaderSessionInterface _configureInterface:v0];
  return v0;
}

@end