@interface NGMMessageHasher
+ (id)computeHashForMessage:(id)a3;
@end

@implementation NGMMessageHasher

+ (id)computeHashForMessage:(id)a3
{
  id v3 = a3;
  v4 = [[NGMPBOuterMessage alloc] initWithData:v3];

  if (v4)
  {
    uint64_t v5 = [(NGMPBOuterMessage *)v4 encryptedPayload];
    if (v5)
    {
      id v6 = (id)v5;
      id v7 = [(NGMPBOuterMessage *)v4 ephemeralPubKey];
      if (!v7)
      {
LABEL_6:

        goto LABEL_8;
      }
      v8 = [(NGMPBOuterMessage *)v4 signature];

      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
        v10 = [(NGMPBOuterMessage *)v4 encryptedPayload];
        [v9 appendData:v10];

        v11 = [(NGMPBOuterMessage *)v4 ephemeralPubKey];
        [v9 appendData:v11];

        v12 = [(NGMPBOuterMessage *)v4 signature];
        [v9 appendData:v12];

        v13 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
        id v6 = v9;
        v14 = (const void *)[v6 bytes];
        CC_LONG v15 = [v6 length];
        id v7 = v13;
        CC_SHA256(v14, v15, (unsigned __int8 *)[v7 bytes]);
        goto LABEL_6;
      }
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

@end