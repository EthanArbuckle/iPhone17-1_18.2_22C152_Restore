@interface HomeKitHelper
- (BOOL)areAnyAccessoriesConfigured;
- (BOOL)areAnySpeakersConfigured;
- (BOOL)areHomesConfigured;
@end

@implementation HomeKitHelper

- (BOOL)areAnyAccessoriesConfigured
{
  return MEMORY[0x270EF3BF0](self, a2);
}

- (BOOL)areAnySpeakersConfigured
{
  return MEMORY[0x270EF3C00](self, a2);
}

- (BOOL)areHomesConfigured
{
  return MEMORY[0x270EF3DE8](self, a2);
}

@end