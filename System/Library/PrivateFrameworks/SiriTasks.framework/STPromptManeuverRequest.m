@interface STPromptManeuverRequest
- (id)createResponse;
@end

@implementation STPromptManeuverRequest

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

@end