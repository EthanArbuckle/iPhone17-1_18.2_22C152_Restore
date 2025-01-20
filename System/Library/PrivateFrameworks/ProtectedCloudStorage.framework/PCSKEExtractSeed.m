@interface PCSKEExtractSeed
@end

@implementation PCSKEExtractSeed

void ___PCSKEExtractSeed_block_invoke(uint64_t a1, CFDataRef theData, const __CFData *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    unint64_t Length = CFDataGetLength(theData);
    v7 = [*(id *)(a1 + 32) masterKeyId];
    unint64_t v8 = [v7 length];

    if (Length >= v8)
    {
      BytePtr = CFDataGetBytePtr(theData);
      id v10 = [*(id *)(a1 + 32) masterKeyId];
      v11 = (const void *)[v10 bytes];
      v12 = [*(id *)(a1 + 32) masterKeyId];
      LODWORD(BytePtr) = memcmp(BytePtr, v11, [v12 length]);

      if (!BytePtr)
      {
        v13 = *(const void ***)(a1 + 48);
        v14 = *v13;
        if (*v13)
        {
          *v13 = 0;
          CFRelease(v14);
        }
        CFDataRef v15 = *(const __CFData **)(a1 + 56);
        uint64_t v16 = [*(id *)(a1 + 32) version];
        if (v16)
        {
          if (v16 == 1)
          {
            v17 = @"HKDF_SIV_GCM_HMAC_256";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v17 = @"UNKNOWN";
        }
        v18 = v17;
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _PCSKEExtractSeedWithMasterKey(a3, v15, v17, *(const __CFData **)(*(void *)(a1 + 64) + 24), *(const void ***)(a1 + 48));
      }
    }
  }
}

@end