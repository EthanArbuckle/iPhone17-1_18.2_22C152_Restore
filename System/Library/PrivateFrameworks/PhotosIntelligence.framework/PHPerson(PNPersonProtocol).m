@interface PHPerson(PNPersonProtocol)
- (BOOL)favorite;
- (BOOL)hidden;
- (__CFString)anonymizedName;
- (id)keyFace;
- (id)personLocalIdentifiers;
- (void)pn_addMergeCandidatePersons:()PNPersonProtocol;
- (void)setIsVerified:()PNPersonProtocol;
- (void)setKeyFace:()PNPersonProtocol;
- (void)setManualOrder:()PNPersonProtocol;
@end

@implementation PHPerson(PNPersonProtocol)

- (id)personLocalIdentifiers
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = [a1 localIdentifier];
  v4[0] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)pn_addMergeCandidatePersons:()PNPersonProtocol
{
  v4 = (void *)MEMORY[0x263F14E90];
  id v5 = a3;
  id v6 = [v4 changeRequestForPerson:a1];
  [v6 addMergeCandidatePersons:v5];
}

- (void)setKeyFace:()PNPersonProtocol
{
  id v9 = a3;
  v4 = [a1 keyFace];
  id v5 = [v4 localIdentifier];
  id v6 = [v9 localIdentifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x263F14E90] changeRequestForPerson:a1];
    [v8 setKeyFace:v9 forCluster:0];
  }
}

- (id)keyFace
{
  v1 = [MEMORY[0x263F14DF0] fetchKeyFaceForPerson:a1 options:0];
  v2 = [v1 firstObject];

  return v2;
}

- (void)setManualOrder:()PNPersonProtocol
{
  id v4 = [MEMORY[0x263F14E90] changeRequestForPerson:a1];
  [v4 setManualOrder:a3];
}

- (void)setIsVerified:()PNPersonProtocol
{
  id v1 = [MEMORY[0x263F14E90] changeRequestForPerson:a1];
  [v1 setVerifiedType:2];
}

- (BOOL)favorite
{
  return [a1 type] == 1;
}

- (BOOL)hidden
{
  return [a1 type] == -1;
}

- (__CFString)anonymizedName
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, &PHPersonPVPersonProtocolAnonymizedNameKey);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [a1 name];
    if ([v3 length])
    {
      id v4 = [v3 dataUsingEncoding:1 allowLossyConversion:1];
      CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
      id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
      v2 = [v5 base64EncodedStringWithOptions:0];
    }
    else
    {
      v2 = 0;
    }
    if (v2) {
      id v6 = v2;
    }
    else {
      id v6 = &stru_270753580;
    }
    objc_setAssociatedObject(a1, &PHPersonPVPersonProtocolAnonymizedNameKey, v6, (void *)1);
  }
  if ([(__CFString *)v2 length]) {
    char v7 = v2;
  }
  else {
    char v7 = 0;
  }
  v8 = v7;

  return v8;
}

@end