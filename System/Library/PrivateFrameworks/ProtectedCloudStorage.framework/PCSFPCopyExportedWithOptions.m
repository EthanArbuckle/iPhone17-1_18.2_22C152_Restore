@interface PCSFPCopyExportedWithOptions
@end

@implementation PCSFPCopyExportedWithOptions

void ___PCSFPCopyExportedWithOptions_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a3 + 24);
  BOOL v7 = (v6 & 1) == 0 && *(_DWORD *)(v5 + 204) == 3;
  uint64_t v8 = 72;
  if (v7) {
    uint64_t v8 = 64;
  }
  if ((v6 & 4) != 0 && *(void *)(v5 + 56))
  {
    PublicID = (const void *)PCSPublicIdentityGetPublicID(*(void *)(a3 + 16));
    Value = (__CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 56), PublicID);
    if (!Value) {
      PCSAbort("Failed to get anonymous wrapped key:wrappedKey != NULL", v11, v12, v13, v14, v15, v16, v17, v50);
    }
    v18 = Value;
    CFRetain(Value);
  }
  else
  {
    v18 = PCSPublicServiceIdentityCopyWrappedKey(*(void *)(a3 + 16), *(const __CFData **)(v5 + v8), *(const void ***)(a1 + 56));
    if (!v18)
    {
      v49 = *(void **)(a1 + 56);
      if (v49) {
        v49 = (void *)*v49;
      }
      PCSAbortCF(@"Failed to get wrapped key: %@", v49);
    }
  }
  if ((*(unsigned char *)(a3 + 24) & 4) != 0)
  {
    if ((_PCSExportRandomPCSSPKey(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) & 1) == 0)PCSAbort("failed to randomly fill PCSSPKey:_PCSExportRandomPCSSPKey(&share.tbs.shareList.val[n].key)", v32, v33, v34, v35, v36, v37, v38, v50); {
  }
    }
  else if ((_PCSPublicIdentityExportPCSSPKey(*(void *)(a3 + 16), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v19, v20, v21, v22, v23, v24) & 1) == 0)
  {
    PCSAbort("failed to fill PCSSPKey:_PCSPublicIdentityExportPCSSPKey(se->identity, &share.tbs.shareList.val[n].key)", v25, v26, v27, v28, v29, v30, v31, v50);
  }
  if (*(_DWORD *)(a3 + 24))
  {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)
              + 56 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
              + 48) = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
    v39 = *(_DWORD **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)
                     + 56 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
                     + 48);
    if (!v39) {
      PCSAbortCF(@"Failed allocate flags");
    }
    _DWORD *v39 = *(_DWORD *)(a3 + 24);
  }
  if (!FillOctetString((CFIndex *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 32), v18))PCSAbort("failed to allocate wrappedMaster:FillOctetString(&share.tbs.shareList.val[n].wrappedMaster, wrappedKey)", v40, v41, v42, v43, v44, v45, v46, v50); {
  CFRelease(v18);
  }
  uint64_t v47 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v48 = *(unsigned int *)(v47 + 24);
  if (*(void *)(a1 + 64) <= v48) {
    ___PCSFPCopyExportedWithOptions_block_invoke_cold_1();
  }
  *(_DWORD *)(v47 + 24) = v48 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

void ___PCSFPCopyExportedWithOptions_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1[4] + 8);
  uint64_t v5 = a1[6];
  uint64_t v6 = *(unsigned int *)(*(void *)(a1[5] + 8) + 24);
  CFDataRef v7 = PCSIdentityCopyExternalForm(a2, 0, 0);
  FillOctetString((CFIndex *)(*(void *)(*(void *)(v4 + 48) + 8) + 32 * v6 + 16), v7);
  CFRelease(v7);
  *(_DWORD *)(*(void *)(v5 + 8) + 32 * v6) = 3;
  uint64_t v8 = PCSIdentityCopyExportedPublicKey(a2);
  FillOctetString((CFIndex *)(*(void *)(v5 + 8) + 32 * v6 + 16), v8);
  CFRelease(v8);
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(unsigned int *)(v9 + 24);
  if (a1[7] <= v10) {
    ___PCSFPCopyExportedWithOptions_block_invoke_2_cold_1();
  }
  *(_DWORD *)(v9 + 24) = v10 + 1;
  **(_DWORD **)(*(void *)(a1[4] + 8) + 48) = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  *(_DWORD *)a1[6] = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
}

BOOL ___PCSFPCopyExportedWithOptions_block_invoke_3(uint64_t a1, int a2, CFDataRef theData)
{
  BOOL result = FillOctetString((CFIndex *)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) + 8)+ 16 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)), theData);
  **(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
  return result;
}

void ___PCSFPCopyExportedWithOptions_block_invoke_cold_1()
{
}

void ___PCSFPCopyExportedWithOptions_block_invoke_2_cold_1()
{
}

@end