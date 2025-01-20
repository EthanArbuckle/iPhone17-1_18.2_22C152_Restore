@interface SKHandle(StatusKitAgent)
- (id)idsDestination;
- (id)normalizedHandleString;
- (uint64_t)isNormalizedEqualToHandle:()StatusKitAgent;
@end

@implementation SKHandle(StatusKitAgent)

- (id)idsDestination
{
  v1 = [a1 handleString];
  if (objc_msgSend(v1, "ska_appearsToBeEmail"))
  {
    uint64_t v2 = MEMORY[0x22A6198B0](v1);
  }
  else if (MEMORY[0x22A619910](v1))
  {
    uint64_t v2 = IDSCopyIDForPseudonymID();
  }
  else
  {
    uint64_t v2 = IDSCopyIDForPhoneNumber();
  }
  v3 = (void *)v2;

  return v3;
}

- (id)normalizedHandleString
{
  id v2 = objc_alloc(MEMORY[0x263F4A258]);
  v3 = [a1 handleString];
  v4 = (void *)[v2 initWithUnprefixedURI:v3];

  v5 = [v4 unprefixedURI];

  return v5;
}

- (uint64_t)isNormalizedEqualToHandle:()StatusKitAgent
{
  if (a3 == a1) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = [a1 normalizedHandleString];
  uint64_t v6 = [v4 normalizedHandleString];

  if (v5 | v6) {
    uint64_t v7 = [(id)v5 isEqualToString:v6];
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

@end