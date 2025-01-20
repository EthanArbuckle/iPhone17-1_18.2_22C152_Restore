uint64_t AMFDRTagsStringToTag(unsigned int *a1)
{
  return bswap32(*a1);
}

void *AMFDRDecodeLogSetHandler(void *result)
{
  _logHandler = result;
  return result;
}

uint64_t _AMFDRDecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a5)
        {
          v8 = *(void **)(a5 + 32);
          if (v8)
          {
            if (*v8 == a4)
            {
              if (DEROidCompare(v8[1], (uint64_t)&oidSha1))
              {
                if (!AMSupportDigestSha1()) {
                  return 0;
                }
              }
              else if (DEROidCompare(*(void *)(*(void *)(a5 + 32) + 8), (uint64_t)&oidSha256))
              {
                if (!AMSupportDigestSha256()) {
                  return 0;
                }
              }
              else
              {
                if (!DEROidCompare(*(void *)(*(void *)(a5 + 32) + 8), (uint64_t)&oidSha384)) {
                  return 4;
                }
                if (!AMSupportDigestSha384()) {
                  return 0;
                }
              }
              return 3;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _AMFDRDecodeVerifyChain(uint64_t a1, uint64_t a2, DERByte **a3, void *a4, DERByte **a5, DERSize *a6, uint64_t a7, uint64_t a8)
{
  int v72 = 0;
  memset(v71, 170, sizeof(v71));
  v8.data = (DERByte *)0xAAAAAAAAAAAAAAAALL;
  v8.uint64_t length = 0xAAAAAAAAAAAAAAAALL;
  DERItem v69 = v8;
  DERItem v70 = v8;
  DERItem v67 = v8;
  DERItem v68 = v8;
  DERItem v65 = v8;
  DERItem v66 = v8;
  DERItem v63 = v8;
  DERItem v64 = v8;
  DERItem v61 = v8;
  DERItem v62 = v8;
  DERItem v59 = v8;
  DERItem v60 = v8;
  DERItem v57 = v8;
  DERItem v58 = v8;
  DERItem v55 = v8;
  DERItem v56 = v8;
  DERItem v53 = v8;
  DERItem v54 = v8;
  v51[18] = v8;
  DERItem v52 = v8;
  v51[16] = v8;
  v51[17] = v8;
  v51[14] = v8;
  v51[15] = v8;
  v51[12] = v8;
  v51[13] = v8;
  v51[10] = v8;
  v51[11] = v8;
  v51[8] = v8;
  v51[9] = v8;
  v51[6] = v8;
  v51[7] = v8;
  v51[4] = v8;
  v51[5] = v8;
  v51[2] = v8;
  v51[3] = v8;
  v51[0] = v8;
  v51[1] = v8;
  v50 = (DERItem *)v51;
  if (a8)
  {
    if (a1 && a2)
    {
      if (a5 && a6)
      {
        if (!a2)
        {
          uint64_t v19 = 3;
          AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainBegin failed", "_AMFDRDecodeVerifyChain");
          uint64_t v21 = *(void *)a8 | 1;
          goto LABEL_56;
        }
        v71[1] = a2;
        v71[2] = 0;
        v71[0] = a1;
        AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(void *)(a8 + 2016), (_OWORD **)&v50, &v72);
        uint64_t v15 = v14;
        if (v14 || !v50)
        {
          uint64_t v19 = 3;
          AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainNext failed (first call)", "_AMFDRDecodeVerifyChain");
          uint64_t v21 = *(void *)a8 | v15;
LABEL_56:
          *(void *)a8 = v21;
          return v19;
        }
        if (*(void *)(a8 + 1944) && *(void *)(a8 + 1952))
        {
          if (*(unsigned char *)(a8 + 2017))
          {
            memset(v49, 0, sizeof(v49));
            DERItem v48 = (DERItem)0;
            uint64_t v22 = AMFDRDecodeIterateTrustObjectTrustedKeyBegin(a8 + 1768);
            if (v22 == 0x40000000000000)
            {
              AMFDRDecodeLogInternal(4, "%s: trustobject does not contain trusted key", "_AMFDRDecodeVerifyChain");
            }
            else if (v22)
            {
              *(void *)a8 |= v22;
              AMFDRDecodeLogInternal(3, "%s: failed to begin decoding trusted key");
              return 3;
            }
            int v23 = 0;
LABEL_26:
            while (1)
            {
              unint64_t v73 = 0;
              uint64_t v74 = 0;
              uint64_t v75 = 0;
              int v24 = DERDecodeSeqNext((unint64_t *)(a8 + 1896), &v73);
              if (v24) {
                break;
              }
              uint64_t v25 = v74;
              unsigned int v26 = v75;
              if (v74) {
                BOOL v27 = v75 == 0;
              }
              else {
                BOOL v27 = 1;
              }
              if (v27) {
                goto LABEL_40;
              }
              AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d", "_AMFDRDecodeVerifyChain", v23);
              uint64_t v28 = AMFDRDecodePublicKey((uint64_t)&v48, v25, v26);
              if (v28)
              {
                AMFDRDecodeLogInternal(7, "%s: PKI: decoding trusted key %d failed with error 0x%016llX");
                goto LABEL_72;
              }
              while (!DEROidCompare((uint64_t)&v50[1], (*(void **)((char *)&kAMFDRDecodeEcdsaInfoList + v28))[3])
                   || !DEROidCompare((uint64_t)v49, (*(void **)((char *)&kAMFDRDecodeEcdsaInfoList + v28))[2]))
              {
                v28 += 8;
                if (v28 == 24)
                {
                  ++v23;
                  goto LABEL_26;
                }
              }
              DERItem v69 = (DERItem)0;
              DERItem v70 = (DERItem)0;
              DERItem v68 = (DERItem)0;
              DERItem v63 = (DERItem)0;
              DERItem v64 = (DERItem)0;
              DERItem v61 = (DERItem)0;
              DERItem v62 = (DERItem)0;
              DERItem v59 = (DERItem)0;
              DERItem v60 = (DERItem)0;
              DERItem v57 = (DERItem)0;
              DERItem v58 = (DERItem)0;
              DERItem v55 = (DERItem)0;
              DERItem v56 = (DERItem)0;
              DERItem v53 = (DERItem)0;
              DERItem v54 = (DERItem)0;
              DERItem v52 = (DERItem)0;
              DERItem v65 = v48;
              DERItem v66 = oidEcPubKey;
              DERItem v67 = (DERItem)v49[0];
              uint64_t v29 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)&v52, a8 + 1768, *(void *)(a8 + 2016), (void *)a8);
              if (v29 != 0x20000000000)
              {
                if (!v29)
                {
                  AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d (success)", "_AMFDRDecodeVerifyChain", v23);
                  goto LABEL_53;
                }
                goto LABEL_74;
              }
            }
            if (v24 == 1)
            {
LABEL_40:
              AMFDRDecodeLogInternal(7, "%s: end of trusted key sequence found root_key=%d", "_AMFDRDecodeVerifyChain", v23);
              *(void *)a8 |= 0x100uLL;
              goto LABEL_53;
            }
            uint64_t v29 = 0x400000;
LABEL_74:
            *(void *)a8 |= v29;
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d failed with error 0x%016llX");
            return 3;
          }
          uint64_t v16 = AMFDRDecodeIterateTrustObjectTrustedBegin(a8 + 1768);
          if (v16)
          {
            uint64_t v17 = v16;
            v18 = "%s: AMFDRDecodeIterateTrustObjectTrustedBegin failed";
LABEL_55:
            uint64_t v19 = 3;
            AMFDRDecodeLogInternal(3, v18, "_AMFDRDecodeVerifyChain");
            uint64_t v21 = *(void *)a8 | v17;
            goto LABEL_56;
          }
          v30 = a4;
          for (int i = 0; ; ++i)
          {
            DERItem v48 = (DERItem)0;
            *(void *)&v49[0] = 0;
            int v32 = DERDecodeSeqNext((unint64_t *)(a8 + 1832), (unint64_t *)&v48);
            if (v32) {
              break;
            }
            uint64_t length = v48.length;
            unsigned int v34 = v49[0];
            if (v48.length) {
              BOOL v35 = LODWORD(v49[0]) == 0;
            }
            else {
              BOOL v35 = 1;
            }
            if (v35) {
              goto LABEL_51;
            }
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d", "_AMFDRDecodeVerifyChain", i);
            uint64_t v36 = AMFDRDecodeCertificate((unint64_t)&v52, length, v34);
            if (v36)
            {
              uint64_t v28 = v36;
              AMFDRDecodeLogInternal(7, "%s: PKI: decoding trusted root %d failed with error 0x%016llX");
              goto LABEL_72;
            }
            uint64_t v37 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)&v52, a8 + 1768, 0, 0);
            if (v37 != 0x20000000000)
            {
              uint64_t v28 = v37;
              if (!v37)
              {
                AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d (success)", "_AMFDRDecodeVerifyChain", i);
                goto LABEL_52;
              }
              AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d failed with error 0x%016llX");
LABEL_72:
              uint64_t v46 = *(void *)a8 | v28;
              goto LABEL_64;
            }
          }
          if (v32 == 1)
          {
LABEL_51:
            AMFDRDecodeLogInternal(7, "%s: end of trusted root sequence found root_cert=%d", "_AMFDRDecodeVerifyChain", i);
            *(void *)a8 |= 0x100uLL;
LABEL_52:
            a4 = v30;
            goto LABEL_53;
          }
          AMFDRDecodeLogInternal(7, "%s: AMFDRDecodeIterateTrustObjectTrustedNext failed", "_AMFDRDecodeVerifyChain");
          uint64_t v46 = *(void *)a8 | 0x400000;
        }
        else
        {
          AMFDRDecodeLogInternal(4, "%s: Skipping trust root check (trustobject unset)", "_AMFDRDecodeVerifyChain");
          *(void *)a8 |= 0x200100uLL;
LABEL_53:
          v38 = v50;
          v50 = &v52;
          AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(void *)(a8 + 2016), (_OWORD **)&v50, &v72);
          if (v39)
          {
            uint64_t v17 = v39;
            v18 = "%s: _AMFDRDecodeIterateCertChainNext failed (second call)";
            goto LABEL_55;
          }
          v47 = a4;
          int v40 = 1;
          while (1)
          {
            if (!v50)
            {
              *a3 = v38[13].data;
              DERSize *v47 = v38[13].length;
              *a5 = v38[18].data;
              *a6 = v38[18].length;
              DERItem v45 = v38[15];
              *(DERItem *)(a8 + 312) = v38[14];
              *(DERItem *)(a8 + 328) = v45;
              AMFDRDecodeLogInternal(7, "%s: PKI: check payload hash with signature (success)", "_AMFDRDecodeVerifyChain");
              return 0;
            }
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by cert %d", "_AMFDRDecodeVerifyChain", v40, v40 - 1);
            uint64_t v41 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)v38, a8 + 1768, *(void *)(a8 + 2016), (void *)a8);
            if (v41) {
              break;
            }
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by %d (success)", "_AMFDRDecodeVerifyChain", v40, v40 - 1);
            ++v40;
            v42 = v50;
            v50 = v38;
            AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(void *)(a8 + 2016), (_OWORD **)&v50, &v72);
            v38 = v42;
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v19 = 3;
              AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainNext failed (%d)", "_AMFDRDecodeVerifyChain", v40);
              uint64_t v21 = *(void *)a8 | v44;
              goto LABEL_56;
            }
          }
          AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by cert %d failed with error 0x%016llX", "_AMFDRDecodeVerifyChain", v40, v40 - 1, v41);
          uint64_t v46 = *(void *)a8 | 0x40000000000;
        }
LABEL_64:
        *(void *)a8 = v46;
        return 3;
      }
      AMFDRDecodeLogInternal(3, "%s: outImg4Blob must be non NULL and outImg4BlobLength must be non 0");
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: chain_blob must be non NULL and chain_blob_length must be non 0");
    }
    *(void *)a8 |= 1uLL;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: context must be non NULL", "_AMFDRDecodeVerifyChain");
  }
  return 6;
}

uint64_t _AMFDRDecodeVerifySignature(const void *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2)
  {
    AMFDRDecodeLogInternal(3, "%s: publicKey must be non NULL and publicKeyLength must be non 0");
    goto LABEL_19;
  }
  if (!a3 || !a4)
  {
    AMFDRDecodeLogInternal(3, "%s: signature must be non NULL and publicKeyLsignatureLengthength must be non 0");
    goto LABEL_19;
  }
  if (!a5 || !a6)
  {
    AMFDRDecodeLogInternal(3, "%s: digest must be non NULL and digestLength must be non 0");
    goto LABEL_19;
  }
  if (!a7 || !*(void *)(a7 + 40))
  {
    AMFDRDecodeLogInternal(3, "%s: implementation must be non NULL and signatureOid must be non NULL");
    goto LABEL_19;
  }
  if (**(void **)(a7 + 32) != a6)
  {
    AMFDRDecodeLogInternal(3, "%s: digestLength is %zu, expecting %zu");
    goto LABEL_19;
  }
  if (!DEROidCompare(a8 + 312, (uint64_t)&oidEcPubKey))
  {
    if (DEROidCompare(*(void *)(a7 + 40), (uint64_t)&oidSha1Rsa))
    {
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa)) {
        goto LABEL_46;
      }
      uint64_t result = AMSupportRsaVerifySignatureSha1();
    }
    else if (DEROidCompare(*(void *)(a7 + 40), (uint64_t)&oidSha256Rsa))
    {
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa)) {
        goto LABEL_46;
      }
      uint64_t result = AMSupportRsaVerifySignatureSha256();
    }
    else
    {
      if (!DEROidCompare(*(void *)(a7 + 40), (uint64_t)&oidSha384Rsa))
      {
        uint64_t result = 4;
LABEL_20:
        if (!a8) {
          return result;
        }
        goto LABEL_21;
      }
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa)) {
        goto LABEL_46;
      }
      uint64_t result = AMSupportRsaVerifySignatureSha384();
    }
    if (result == 2)
    {
      *(void *)a8 |= 0x80000000000000uLL;
      uint64_t result = 3;
LABEL_21:
      *(void *)a8 |= 0x1000000000000uLL;
      return result;
    }
    goto LABEL_47;
  }
  if ((uint64_t (**)())a7 != kAMFDRDecodeImplementationSha384
    && (uint64_t (**)())a7 != kAMFDRDecodeImplementationOffline)
  {
    AMFDRDecodeLogInternal(3, "%s: Expecting kAMFDRDecodeImplementationSha384 or kAMFDRDecodeImplementationOffline");
LABEL_19:
    uint64_t result = 6;
    goto LABEL_20;
  }
  DERItem v15 = oidEcPrime256v1;
  if ((*(unsigned char *)(a8 + 2017) & 1) == 0)
  {
    if (!AMSupportDigestSha256()) {
      goto LABEL_44;
    }
LABEL_46:
    uint64_t result = 3;
    goto LABEL_20;
  }
  if (!*(void *)(a8 + 336))
  {
    AMFDRDecodeLogInternal(3, "%s: missing IM4C leaf public key OID");
    goto LABEL_19;
  }
  uint64_t v13 = 0;
  DERItem v15 = *(DERItem *)(a8 + 328);
  while (!DEROidCompare((uint64_t)&v15, (*(void **)((char *)&kAMFDRDecodeEcdsaInfoList + v13))[2]))
  {
    v13 += 8;
    if (v13 == 24) {
      goto LABEL_36;
    }
  }
  uint64_t v14 = *(uint64_t *)((char *)&kAMFDRDecodeEcdsaInfoList + v13);
  if (!*(_DWORD *)(v14 + 8))
  {
LABEL_36:
    AMFDRDecodeLogInternal(3, "%s: invalid digest length");
    goto LABEL_19;
  }
  if (AMFDRDecodeDigestByLength(*(void *)(a8 + 664), *(void *)(a8 + 672), a8 + 776, *(unsigned int *)(v14 + 8)))goto LABEL_46; {
LABEL_44:
  }
  uint64_t result = AMFDRDecodeEcdsaVerifySignature(a1, a2);
  if (result == 2)
  {
    *(void *)a8 |= 0x80000000000000uLL;
    goto LABEL_46;
  }
LABEL_47:
  if (result) {
    goto LABEL_46;
  }
  return result;
}

uint64_t _AMFDRDecodeEvaluateCertificateProperties(uint64_t a1, uint64_t a2)
{
  memset(v21, 170, 32);
  memset(v19, 170, sizeof(v19));
  memset(v18, 170, sizeof(v18));
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v17 = v3;
  uint64_t v4 = 6;
  if (!a1 || !a2)
  {
LABEL_31:
    if (!a2) {
      return v4;
    }
    goto LABEL_32;
  }
  if (!*(void *)(a1 + 320) || (uint64_t v6 = a1 + 312, !*(void *)(a1 + 312)))
  {
    uint64_t v4 = 0;
    uint64_t v14 = 0x200000000000;
LABEL_21:
    *(void *)a2 |= v14;
    return v4;
  }
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = DERDecodeSeqInit(v6, &v20, &v21[2]);
  if (v7)
  {
    uint64_t v4 = v7;
    AMFDRDecodeLogInternal(3, "%s: failed to init certificate sequence", "_AMFDRDecodeEvaluateCertificateProperties");
LABEL_32:
    uint64_t v14 = 0x800000000000;
    goto LABEL_21;
  }
  if (v20 != 0x2000000000000011)
  {
    uint64_t v4 = 2;
    goto LABEL_32;
  }
  int v8 = 0;
  do
  {
    int v9 = DERDecodeSeqNext(&v21[2], v19);
    if (v9)
    {
      if (v9 == 1)
      {
        if (v8) {
          return 0;
        }
        AMFDRDecodeLogInternal(3, "%s: End of Outer Sequence found, before any valid DER.");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: Outer DER did not terminate properly.");
      }
      goto LABEL_27;
    }
    ++v8;
    if (v19[0] == 0xE00000004D414E50) {
      break;
    }
    if (v19[0] != 0xE00000004F424A50) {
      goto LABEL_29;
    }
  }
  while ((*(unsigned char *)(a2 + 2016) & 0x80) != 0);
  uint64_t v10 = DERImg4DecodeProperty();
  if (v10)
  {
    uint64_t v4 = v10;
    AMFDRDecodeLogInternal(3, "%s: failed to parse certificate dictionary");
  }
  else
  {
    if (*((void *)&v17 + 1) != 0x2000000000000011) {
      goto LABEL_30;
    }
    v11 = DERDecodeSeqContentInit((unint64_t *)&v16 + 1, v21);
    if (!v11)
    {
      int v12 = DERDecodeSeqNext(v21, v18);
      if (!v12)
      {
        uint64_t v13 = DERImg4DecodeProperty();
        if (!v13)
        {
          DERImg4DecodeContentFindItemWithTag();
LABEL_29:
          AMFDRDecodeLogInternal(3, "%s: unexpected tag 0x%llX in certificate properties");
LABEL_30:
          uint64_t v4 = 2;
          goto LABEL_31;
        }
        uint64_t v4 = v13;
        AMFDRDecodeLogInternal(3, "%s: failed to parse certificate property");
        goto LABEL_41;
      }
      if (v12 == 1) {
        AMFDRDecodeLogInternal(3, "%s: End of Inner Sequence found, before any valid DER.");
      }
      else {
        AMFDRDecodeLogInternal(3, "%s: Inner DER did not terminate properly.");
      }
LABEL_27:
      uint64_t v4 = 0xFFFFFFFFLL;
      if (a2) {
        goto LABEL_32;
      }
      return v4;
    }
    uint64_t v4 = (uint64_t)v11;
    AMFDRDecodeLogInternal(3, "%s: failed to certificate dictionary");
  }
LABEL_41:
  if (a2) {
    goto LABEL_32;
  }
  return v4;
}

uint64_t _AMFDRDecodeVerifyChainOffline(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v26, 170, sizeof(v26));
  if (a8)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v11;
    long long v25 = v11;
    long long v22 = v11;
    long long v23 = v11;
    *(_OWORD *)__s1 = v11;
    long long v21 = v11;
    v19[11] = v11;
    v19[12] = v11;
    v19[9] = v11;
    v19[10] = v11;
    v19[7] = v11;
    v19[8] = v11;
    v19[5] = v11;
    v19[6] = v11;
    unint64_t v19[3] = v11;
    v19[4] = v11;
    v19[1] = v11;
    v19[2] = v11;
    v19[0] = v11;
    v27[0] = a1;
    v27[1] = a2;
    if (DERDecodeItem((uint64_t)v27, v26))
    {
      int v12 = "%s: malformed offline signing public key";
    }
    else
    {
      if (v26[0] != 2)
      {
        uint64_t v13 = 3;
        AMFDRDecodeLogInternal(3, "%s: malformed offline signing public key tag", "_AMFDRDecodeVerifyChainOffline");
        uint64_t v14 = *(void *)a8 | 0x40;
        goto LABEL_15;
      }
      if (!AMFDRDecodeCertificate((unint64_t)v19, *(void *)(a8 + 296), *(_DWORD *)(a8 + 304)))
      {
        *(void *)a8 |= 0x100uLL;
        unint64_t v15 = v26[2];
        if ((void *)v26[2] == __s1[1])
        {
          unint64_t v16 = v26[1];
          if (!memcmp(__s1[0], (const void *)v26[1], v26[2]))
          {
            uint64_t v13 = 0;
            *a3 = v16;
            *a4 = v15;
            *(DERItem *)(a8 + 312) = oidEcPubKey;
            return v13;
          }
          long long v17 = "%s: offline signing public key mismatch";
        }
        else
        {
          long long v17 = "%s: offline signing public key length mismatch";
        }
        uint64_t v13 = 3;
        AMFDRDecodeLogInternal(3, v17, "_AMFDRDecodeVerifyChainOffline");
        uint64_t v14 = *(void *)a8 | 0x20000000000000;
        goto LABEL_15;
      }
      int v12 = "%s: fail to decode certificate of offline signing";
    }
    uint64_t v13 = 3;
    AMFDRDecodeLogInternal(3, v12, "_AMFDRDecodeVerifyChainOffline");
    uint64_t v14 = *(void *)a8 | 0x40000000000;
LABEL_15:
    *(void *)a8 = v14;
    return v13;
  }
  AMFDRDecodeLogInternal(3, "%s: context must be non NULL", "_AMFDRDecodeVerifyChainOffline");
  return 6;
}

uint64_t _AMFDRDecodeEvaluateTestStationCertificateProperties()
{
  return 0;
}

uint64_t _AMFDRDecodeVerifyDataCallback(int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v40 = 0;
  uint64_t v39 = 0;
  if (!a4)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeVerifyDataCallback");
    return 6;
  }
  if (!a2)
  {
    AMFDRDecodeLogInternal(3, "%s: property is NULL", "_AMFDRDecodeVerifyDataCallback");
    *(void *)a4 |= 1uLL;
    return 6;
  }
  if (a1 <= 1634953571)
  {
    if (a1 > 1400000108)
    {
      if (a1 == 1400000109) {
        return 0;
      }
      if (a1 == 1400010324)
      {
        uint64_t PropertyData = Img4DecodeGetPropertyData();
        if (!PropertyData)
        {
          AMFDRDecodeLogInternal(3, "%s: Invalid property length of kFDRTag_SrvT", "_AMFDRDecodeVerifyDataCallback");
          uint64_t v6 = 0;
          uint64_t v10 = *(void *)a4 | 0x200;
          goto LABEL_94;
        }
        uint64_t v6 = PropertyData;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_SrvT) failed.");
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    if (a1 == 1145525076)
    {
      if ((*(unsigned char *)(a4 + 2017) & 0x10) == 0)
      {
        uint64_t v13 = Img4DecodeGetPropertyData();
        if (v13)
        {
          uint64_t v6 = v13;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.");
        }
        else
        {
          if (*(unsigned char *)(a4 + 400))
          {
            if (**(void **)(*(void *)(a4 + 2008) + 32) == v40)
            {
              if (!memcmp(v39, (const void *)(a4 + 584), v40)) {
                return 0;
              }
              BOOL v27 = "%s: propertyValue != fdrDecode->sealingManifestImg4.payload.hash";
            }
            else
            {
              BOOL v27 = "%s: propertyLength != implementation->digestInfo->digestOutputSize";
            }
          }
          else
          {
            BOOL v27 = "%s: fdrDecode->sealingManifestImg4.payload_hashed is false";
          }
          uint64_t v6 = 3;
          AMFDRDecodeLogInternal(3, v27, "_AMFDRDecodeVerifyDataCallback");
        }
LABEL_93:
        uint64_t v10 = *(void *)a4 | 0x8000;
        goto LABEL_94;
      }
      long long v17 = "%s: verifying subCC, skip comparing digest of the entire data";
    }
    else
    {
      if (a1 != 1396917319) {
        goto LABEL_37;
      }
      uint64_t v7 = Img4DecodeGetPropertyData();
      if (v7)
      {
        uint64_t v6 = v7;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_SCDG) failed.");
        goto LABEL_93;
      }
      uint64_t v23 = v40;
      *(void *)(a4 + 360) = v39;
      *(void *)(a4 + 368) = v23;
      if ((*(unsigned char *)(a4 + 2017) & 0x10) != 0)
      {
        if (*(void *)(a4 + 128))
        {
          uint64_t v28 = *(unsigned int **)(a4 + 120);
          if (v28)
          {
            __s1 = 0;
            size_t __n = 0;
            int v29 = AMFDRTagsStringToTag(v28);
            if (_AMFDRDecodeSearchEntryFromPropertyList(*(void *)(a4 + 360), *(void *)(a4 + 368), v29, &__s1))
            {
              uint64_t v6 = 0;
              AMFDRDecodeLogInternal(3, "%s: failed to find subCC digest");
            }
            else if (*(unsigned char *)(a4 + 400))
            {
              if (__n == **(void **)(*(void *)(a4 + 2008) + 32))
              {
                if (!memcmp(__s1, (const void *)(a4 + 584), __n))
                {
                  AMFDRDecodeLogInternal(5, "%s: subCC digest verified", "_AMFDRDecodeVerifyDataCallback");
                  uint64_t v6 = 0;
                  *(unsigned char *)(a4 + 376) = 1;
                  return v6;
                }
                uint64_t v6 = 3;
                AMFDRDecodeLogInternal(3, "%s: subCC digest mismatch");
              }
              else
              {
                uint64_t v6 = 3;
                AMFDRDecodeLogInternal(3, "%s: subCC digest length mismatch");
              }
            }
            else
            {
              uint64_t v6 = 3;
              AMFDRDecodeLogInternal(3, "%s: subCC is not hashed");
            }
            uint64_t v10 = *(void *)a4 | 0x1000000000000000;
            goto LABEL_94;
          }
        }
        *(void *)a4 |= 0x1000000000000000uLL;
        long long v17 = "%s: subCCName cannot be NULL when kAMFDRDecodeOptionSubCCOnly is set.";
        goto LABEL_97;
      }
      long long v17 = "%s: not verifying subCC payload, skip checking subCC digest";
    }
    uint64_t v18 = 5;
    goto LABEL_51;
  }
  if (a1 <= 1717660002)
  {
    if (a1 == 1634953572)
    {
      uint64_t v14 = Img4DecodeGetPropertyData();
      if (v14)
      {
        uint64_t v6 = v14;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_asid) failed.");
        goto LABEL_36;
      }
      size_t v24 = *(void *)(a4 + 224);
      if (v24)
      {
        if (v24 == v40)
        {
          long long v25 = *(const void **)(a4 + 216);
          if (v25 && !memcmp(v25, v39, v24)) {
            return 0;
          }
          unsigned int v26 = "%s: kFDRTag_asid property != fdrDecode->assemblyID";
        }
        else
        {
          unsigned int v26 = "%s: kFDRTag_asid property length != fdrDecode->assemblyID.length";
        }
        uint64_t v6 = 3;
        AMFDRDecodeLogInternal(3, v26, "_AMFDRDecodeVerifyDataCallback");
        uint64_t v10 = *(void *)a4 | 0x200000000000000;
        goto LABEL_94;
      }
      long long v17 = "%s: Skip verifying assembly identifier";
      goto LABEL_42;
    }
    if (a1 == 1668047219)
    {
      if (Img4DecodeGetPropertyData())
      {
        int v8 = "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.";
      }
      else
      {
        uint64_t v33 = v40;
        int v8 = "%s: propertyValue must be non NULL with a non-zero length (length=%u)";
      }
      uint64_t v6 = 3;
      AMFDRDecodeLogInternal(3, v8, "_AMFDRDecodeVerifyDataCallback", v33);
      uint64_t v10 = *(void *)a4 | 0x400;
      goto LABEL_94;
    }
LABEL_37:
    uint64_t v15 = 1;
    while (v15 != 48)
    {
      int v16 = kFDRKnownTag[v15++];
      if (v16 == a1)
      {
        if ((unint64_t)(v15 - 2) < 0x2F) {
          return 0;
        }
        break;
      }
    }
    uint64_t v35 = ((__int16)a1 >> 8);
    uint64_t v36 = (char)a1;
    uint64_t v33 = (a1 >> 24);
    uint64_t v34 = (a1 << 8 >> 24);
    long long v17 = "%s: Unsupported tag found in manifest '%c%c%c%c'";
LABEL_42:
    uint64_t v18 = 7;
LABEL_51:
    AMFDRDecodeLogInternal(v18, v17, "_AMFDRDecodeVerifyDataCallback", v33, v34, v35, v36);
    return 0;
  }
  if (a1 == 1717660003)
  {
    LOBYTE(__s1) = 0;
    if (!Img4DecodeGetPropertyBoolean())
    {
      uint64_t v6 = 0;
      *(unsigned char *)(a4 + 2004) = (_BYTE)__s1;
      return v6;
    }
    uint64_t v6 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifyDataCallback");
    uint64_t v10 = *(void *)a4 | 0x400000000;
LABEL_94:
    *(void *)a4 = v10;
    return v6;
  }
  if (a1 != 1768846196)
  {
    if (a1 == 1886546276)
    {
      uint64_t v5 = Img4DecodeGetPropertyData();
      if (v5)
      {
        uint64_t v6 = v5;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_prid) failed.");
LABEL_36:
        uint64_t v10 = *(void *)a4 | 0x2000;
        goto LABEL_94;
      }
      uint64_t v19 = v39;
      uint64_t v20 = v40;
      *(void *)(a4 + 200) = v39;
      *(void *)(a4 + 208) = v20;
      if (!*(void *)(a4 + 1944) || !*(void *)(a4 + 1952))
      {
        AMFDRDecodeLogInternal(4, "%s: Skipping revocation check (trustobject unset)", "_AMFDRDecodeVerifyDataCallback");
        uint64_t v6 = 0;
        uint64_t v10 = *(void *)a4 | 0x200000;
        goto LABEL_94;
      }
      uint64_t v21 = AMFDRDecodeCheckProducerIDRevocation(a4 + 1768, (uint64_t)v19, v20);
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v6 = 3;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeCheckProducerIDRevocation failed with error 0x%016llX", "_AMFDRDecodeVerifyDataCallback", v21);
        uint64_t v10 = *(void *)a4 | v22;
        goto LABEL_94;
      }
      return 0;
    }
    goto LABEL_37;
  }
  uint64_t v12 = Img4DecodeGetPropertyData();
  if (v12)
  {
    uint64_t v6 = v12;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeVerifyDataCallback");
LABEL_30:
    uint64_t v10 = *(void *)a4 | 0x4000;
    goto LABEL_94;
  }
  if (a3 == 1)
  {
    v30 = *(void **)(a4 + 104);
    if (v30)
    {
      size_t v31 = *(void *)(a4 + 112);
      if (v31)
      {
        if (_AMFDRDecodeInstPropertyMatchingWithType(v39, v40, v30, v31, *(const void **)(a4 + 184), *(void *)(a4 + 192), 1, (void *)a4))return 0; {
        AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->uniqueID");
        }
        goto LABEL_85;
      }
    }
    if ((*(unsigned char *)(a4 + 2017) & 0x20) == 0)
    {
      AMFDRDecodeLogInternal(3, "%s: no uniqueID is specified, cannot verify kFDRTag_inst property");
LABEL_85:
      uint64_t v6 = 0;
      goto LABEL_30;
    }
    long long v17 = "%s: no uniqueID is specified, but this is allowed, skip comparing kFDRTag_inst object property";
LABEL_97:
    uint64_t v18 = 3;
    goto LABEL_51;
  }
  if (a3) {
    return 0;
  }
  uint64_t v6 = 0;
  if ((_AMFDRDecodeInstPropertyMatchingWithType(v39, v40, *(void **)(a4 + 136), *(void *)(a4 + 144), *(const void **)(a4 + 168), *(void *)(a4 + 176), 0, (void *)a4) & 1) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->manifestUniqueID", "_AMFDRDecodeVerifyDataCallback");
    uint64_t v6 = 0;
    uint64_t v10 = *(void *)a4 | 0x40000000;
    goto LABEL_94;
  }
  return v6;
}

uint64_t _AMFDRDecodeGetExpectedManifestHash(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(void *)(a2 + 2024);
  }
  AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeGetExpectedManifestHash");
  return 0;
}

uint64_t _AMFDRDecodePropertiesFilterCallback(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = (unint64_t *)a5;
  unint64_t v20 = 0xAAAAAAAAAAAA0000;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!a5)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL");
    return 6;
  }
  if (*(void *)(a5 + 104) && *(void *)(a5 + 112))
  {
    int v6 = 0;
    goto LABEL_7;
  }
  if ((*(unsigned char *)(a5 + 2017) & 0x20) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: data instance cannot be missing without kAMFDRDecodeOptionAllowNoDataInstance specified");
    return 6;
  }
  int v6 = 1;
LABEL_7:
  uint64_t v7 = DERDecodeSeqContentInit(a1, &v17);
  if (v7)
  {
    uint64_t v9 = (uint64_t)v7;
    uint64_t v15 = "%s: can't parse top-level container";
    goto LABEL_34;
  }
  while (1)
  {
    if ((_BYTE)v20) {
      goto LABEL_25;
    }
    uint64_t PropertyInSequence = DERImg4DecodeFindPropertyInSequence();
    if (PropertyInSequence == 1)
    {
      if (BYTE1(v20)) {
        AMFDRDecodeLogInternal(3, "%s: failed to find matching inst object propery, returning a mismatched one", "_AMFDRDecodePropertiesFilterCallback");
      }
      if ((_BYTE)v20)
      {
        if (!v6) {
          return 0;
        }
      }
      else
      {
        *v19 |= 0x4000uLL;
LABEL_25:
        if ((v6 & 1) == 0) {
          return 0;
        }
      }
      AMFDRDecodeLogInternal(3, "%s: uniqueID is not specified, which is allowed, skip uniqueID mismatch errors", "_AMFDRDecodePropertiesFilterCallback");
      uint64_t v9 = 0;
      uint64_t v12 = v19;
      unint64_t v13 = *v19 & 0xFFFFFFFFFFFFBFFFLL;
      goto LABEL_27;
    }
    uint64_t v9 = PropertyInSequence;
    if (PropertyInSequence) {
      break;
    }
    if (BYTE1(v20)) {
      char v10 = v6;
    }
    else {
      char v10 = 0;
    }
    if (v10)
    {
      AMFDRDecodeLogInternal(3, "%s: multiple entries for tag 0x%llu found, but no unique ID specified", "_AMFDRDecodePropertiesFilterCallback", a2);
      if ((_BYTE)v20) {
        return 0;
      }
      uint64_t v9 = 0;
      uint64_t v12 = v19;
      unint64_t v13 = *v19 | 0x4000;
LABEL_27:
      *uint64_t v12 = v13;
      return v9;
    }
    uint64_t v11 = Img4DecodeEvaluateDictionaryProperties();
    if (v11)
    {
      uint64_t v9 = v11;
      AMFDRDecodeLogInternal(5, "%s: failed to find corresponding data instance");
      return v9;
    }
  }
  uint64_t v16 = a2;
  uint64_t v15 = "%s: failed to find property tag 0x%llu";
LABEL_34:
  AMFDRDecodeLogInternal(3, v15, "_AMFDRDecodePropertiesFilterCallback", v16, v17, v18);
  return v9;
}

uint64_t AMFDRDecodeTrustObject(unint64_t a1, uint64_t a2, unsigned int a3)
{
  v5[0] = a2;
  v5[1] = a3;
  if (DERParseSequenceToObject((uint64_t)v5, 5u, (uint64_t)&DERFDRTrustObjectItemSpecs, a1, 0x90uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Format");
  }
  else if (*(void *)a1 && *(void *)(a1 + 8) == 4)
  {
    if (**(_DWORD **)a1 == *(_DWORD *)"secb") {
      return 0;
    }
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeTrustObject", kFDRTagStr_secb[0], kFDRTagStr_secb[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object, invalid tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeLogInternal(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v3;
  long long v20 = v3;
  long long v17 = v3;
  long long v18 = v3;
  long long v15 = v3;
  long long v16 = v3;
  long long v13 = v3;
  long long v14 = v3;
  long long v11 = v3;
  long long v12 = v3;
  long long v9 = v3;
  long long v10 = v3;
  long long v7 = v3;
  long long v8 = v3;
  *(_OWORD *)__str = v3;
  long long v6 = v3;
  vsnprintf(__str, 0x100uLL, __format, va);
  if (_logHandler) {
    return _logHandler(a1, __str);
  }
  else {
    return AMSupportLogFormat();
  }
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedBegin(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  v1 = (unint64_t *)(a1 + 64);
  uint64_t v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 16), (unint64_t *)(a1 + 64)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"trst") {
      return 0;
    }
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectTrustedBegin", kFDRTagStr_trst[0], kFDRTagStr_trst[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedNext(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v7 = DERDecodeSeqNext((unint64_t *)(a1 + 64), &v10);
    if (v7)
    {
      if (v7 != 1) {
        return 0x400000;
      }
      int v9 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      int v9 = v12;
    }
    uint64_t result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedKeyBegin(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  v1 = (unint64_t *)(a1 + 128);
  uint64_t v6 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 112), (unint64_t *)(a1 + 128)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted key sequence");
  }
  else
  {
    int v3 = DERDecodeSeqNext(v1, &v4);
    if (v3)
    {
      if (v3 == 1) {
        return 0x40000000000000;
      }
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted key: %d");
    }
    else if (v5 && v6 == 4)
    {
      if (*v5 == *(_DWORD *)"trpk") {
        return 0;
      }
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted key, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectTrustedKeyBegin", kFDRTagStr_trpk[0], kFDRTagStr_trpk[1]);
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted key, invalid trusted key tag length");
    }
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedKeyNext(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v7 = DERDecodeSeqNext((unint64_t *)(a1 + 128), &v10);
    if (v7)
    {
      if (v7 != 1) {
        return 0x400000;
      }
      int v9 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      int v9 = v12;
    }
    uint64_t result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectRevokedBegin(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  v1 = (unint64_t *)(a1 + 80);
  uint64_t v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 48), (unint64_t *)(a1 + 80)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object Revoked sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object Revoked");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"rvok") {
      return 0;
    }
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Revoked, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectRevokedBegin", kFDRTagStr_rvok[0], kFDRTagStr_rvok[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Revoked, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectRevokedNext(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v7 = DERDecodeSeqNext((unint64_t *)(a1 + 80), &v10);
    if (v7)
    {
      if (v7 == 1)
      {
        int v8 = 0;
        uint64_t v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      int v8 = v12;
      if (v12 == 32)
      {
        uint64_t v9 = v11;
LABEL_9:
        uint64_t result = 0;
        *a2 = v9;
        *a3 = v8;
        return result;
      }
    }
    return 0x400000;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectSslRootBegin(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  v1 = (unint64_t *)(a1 + 96);
  uint64_t v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 32), (unint64_t *)(a1 + 96)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object SslRoot sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object SslRoot");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"rssl") {
      return 0;
    }
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object SslRoot, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectSslRootBegin", kFDRTagStr_rssl[0], kFDRTagStr_rssl[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object SslRoot, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectSslRootNext(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v7 = DERDecodeSeqNext((unint64_t *)(a1 + 96), &v10);
    if (v7)
    {
      if (v7 == 1)
      {
        int v8 = 0;
        uint64_t v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      int v8 = v12;
      if (v12)
      {
        uint64_t v9 = v11;
LABEL_9:
        uint64_t result = 0;
        *a2 = v9;
        *a3 = v8;
        return result;
      }
    }
    return 0x400000;
  }
  return result;
}

uint64_t AMFDRDecodeIterateProducerIDBegin(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    v6[0] = a2;
    v6[1] = a3;
    if (DERDecodeSeqInit((uint64_t)v6, &v5, a1))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Producer ID sequence", "AMFDRDecodeIterateProducerIDBegin");
      return 0x80000000000;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t AMFDRDecodeIterateProducerIDNext(unint64_t *a1, void *a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v7 = DERDecodeSeqNext(a1, &v10);
    if (v7)
    {
      if (v7 != 1) {
        return 0x80000000000;
      }
      int v9 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      int v9 = v12;
    }
    uint64_t result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeCheckProducerIDRevocation(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __n_4[0] = 0xAAAAAAAAAAAAAAAALL;
  __n_4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = 1;
  if (!a1 || !a2 || !a3) {
    return v3;
  }
  AMFDRDecodeLogInternal(7, "%s: AMFDRDecodeCheckProducerIDRevocation", "AMFDRDecodeCheckProducerIDRevocation");
  uint64_t v7 = AMFDRDecodeIterateProducerIDBegin(__n_4, a2, a3);
  if (v7)
  {
    uint64_t v3 = v7;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDBegin failed with error 0x%016llX");
    return v3;
  }
  unint64_t v17 = 0;
  long long v18 = 0;
  uint64_t v19 = 0;
  int v8 = DERDecodeSeqNext(__n_4, &v17);
  if (v8)
  {
    if (v8 != 1)
    {
      uint64_t v3 = 0x80000000000;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDNext(first) failed with error 0x%016llX");
      return v3;
    }
    return 0;
  }
  int v9 = v18;
  if (!v18) {
    return 0;
  }
  while (2)
  {
    unsigned int __n = 0;
    __s2 = 0;
    uint64_t v10 = AMFDRDecodeIterateTrustObjectRevokedBegin(a1);
    if (v10)
    {
      uint64_t v3 = v10;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedBegin failed");
      return v3;
    }
    while (1)
    {
      uint64_t v11 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
      if (v11)
      {
        uint64_t v3 = v11;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed");
        return v3;
      }
      if (!__s2) {
        break;
      }
      if (!memcmp(v9, __s2, __n))
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked certificate found", "AMFDRDecodeCheckProducerIDRevocation");
        return 0x10000000000;
      }
    }
    unint64_t v17 = 0;
    long long v18 = 0;
    uint64_t v19 = 0;
    int v12 = DERDecodeSeqNext(__n_4, &v17);
    if (v12)
    {
      if (v12 != 1)
      {
        uint64_t v3 = 0x80000000000;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDNext(loop) failed with error 0x%016llX");
        return v3;
      }
      return 0;
    }
    uint64_t v3 = 0;
    int v9 = v18;
    if (v18) {
      continue;
    }
    break;
  }
  return v3;
}

uint64_t AMFDRDecodeVerifySealingManifest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  long long v18 = (unsigned int *)malloc(0x7F8uLL);
  if (!v18)
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifySealingManifest");
    return 0x80000000000002;
  }
  uint64_t v19 = v18;
  bzero(v18, 0x7F8uLL);
  *((void *)v19 + 5) = a1;
  *((void *)v19 + 6) = a2;
  *((void *)v19 + 243) = a3;
  *((void *)v19 + 244) = a4;
  *((void *)v19 + 9) = a5;
  *((void *)v19 + 10) = a6;
  *((void *)v19 + 17) = a7;
  *((void *)v19 + 18) = a8;
  *((void *)v19 + 48) = a9;
  *((void *)v19 + 49) = a10;
  *((void *)v19 + 251) = kAMFDRDecodeImplementationSha1;
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v35 = v20;
  *(_OWORD *)&v35[16] = v20;
  long long v34 = v20;
  memset(v33, 170, sizeof(v33));
  int v32 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v21 = _AMFDRDecodeVerifyTrustObject((uint64_t)v19);
  if (v21) {
    *(void *)v19 |= v21;
  }
  if (*((void *)v19 + 5) && *((void *)v19 + 6))
  {
    if (Img4DecodeInitManifest())
    {
      AMFDRDecodeLogInternal(3, "%s: could not parse sealing manifest");
    }
    else
    {
      if (!DERImg4DecodeManifest())
      {
        if ((**((unsigned int (***)(void, void, uint64_t, void))v19 + 251))(*((void *)v19 + 140), *((void *)v19 + 141), (uint64_t)(v19 + 308), **(void **)(*((void *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha1 failed");
        }
        else if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, unsigned int *, unsigned int *))(*((void *)v19 + 251) + 8))(*((void *)v19 + 144), *((void *)v19 + 145), &v30, &v31, v19 + 292, v19 + 294))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: certificate chain validation failed");
        }
        else if ((*(unsigned int (**)(uint64_t, uint64_t, void, void, unsigned int *, void))(*((void *)v19 + 251) + 16))(v30, v31, *((void *)v19 + 142), *((void *)v19 + 143), v19 + 308, **(void **)(*((void *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: signature validation failed");
        }
        else if (DERParseInteger((char **)v19 + 138, &v32))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
        }
        else if (DERDecodeItem((uint64_t)(v19 + 280), &v33[5]))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
        }
        else if (v33[5] == 0x2000000000000011)
        {
          if (DERImg4DecodeFindProperty())
          {
            AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
          }
          else
          {
            *((_OWORD *)v19 + 56) = *(_OWORD *)&v35[8];
            if (DERImg4DecodeFindProperty())
            {
              AMFDRDecodeLogInternal(3, "%s: failed to find MANP (manifest payload) tag");
            }
            else
            {
              *((_OWORD *)v19 + 57) = *(_OWORD *)&v35[8];
              if (Img4DecodeEvaluateManifestProperties())
              {
                AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateManifestProperties failed");
              }
              else if (DERDecodeSeqContentInit((unint64_t *)v19 + 112, v33) {
                     || (unsigned int v25 = DERDecodeSeqNext(v33, &v33[2])) != 0)
              }
              {
LABEL_38:
                AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
              }
              else
              {
                char v26 = 0;
                while (!v25)
                {
                  unint64_t v27 = v33[2];
                  if (LODWORD(v33[2]) != 1296125520)
                  {
                    if (DERImg4DecodeFindProperty())
                    {
                      AMFDRDecodeLogInternal(3, "%s: failed to find object properties");
                      goto LABEL_14;
                    }
                    *((_OWORD *)v19 + 58) = *(_OWORD *)&v35[8];
                    if ((*(unsigned int (**)(unsigned int *, unsigned int *))(*((void *)v19 + 251) + 24))(v19 + 214, v19))
                    {
                      AMFDRDecodeLogInternal(3, "%s: evaluateCertificateProperties failed");
                      goto LABEL_14;
                    }
                    if (Img4DecodeEvaluateObjectProperties())
                    {
                      AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateObjectProperties failed");
                      goto LABEL_14;
                    }
                    uint64_t v28 = (uint64_t (*)(unint64_t, void, void, void, void, void, void, void, unsigned int, void, unsigned int, void))*((void *)v19 + 48);
                    if (v28)
                    {
                      uint64_t v29 = v28(v27, *((void *)v19 + 17), v19[36], *((void *)v19 + 25), v19[52], *((void *)v19 + 245), v19[492], *((void *)v19 + 247), v19[496], *((void *)v19 + 249), v19[500], *((void *)v19 + 49));
                      if (v29)
                      {
                        AMFDRDecodeLogInternal(3, "%s: sealingManifestCallback failed with error 0x%llX", "_AMFDRDecodeVerifySealingManifestInternal", v29);
                        uint64_t v23 = *(void *)v19 | 0x400000000;
                        goto LABEL_15;
                      }
                    }
                    char v26 = 1;
                  }
                  unsigned int v25 = DERDecodeSeqNext(v33, &v33[2]);
                  if (v25 >= 2) {
                    goto LABEL_38;
                  }
                }
                if (v26)
                {
                  uint64_t v23 = *(void *)v19;
                  goto LABEL_15;
                }
                AMFDRDecodeLogInternal(3, "%s: No manifest found - not evaluated.");
              }
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
        }
        goto LABEL_14;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sealing manifest");
    }
    uint64_t v22 = *(void *)v19 | 0x2000000;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest is missing", "_AMFDRDecodeVerifySealingManifestInternal");
    uint64_t v22 = *(void *)v19 | 0x1000000;
  }
  *(void *)uint64_t v19 = v22;
LABEL_14:
  AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "_AMFDRDecodeVerifySealingManifestInternal");
  uint64_t v23 = *(void *)v19 | 0x2000000;
LABEL_15:
  free(v19);
  return v23;
}

uint64_t AMFDRDecodeVerifySealingRequest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, unsigned char *a9, void *a10, _DWORD *a11)
{
  uint64_t v19 = (uint64_t *)malloc(0x7F8uLL);
  if (v19)
  {
    long long v20 = v19;
    bzero(v19, 0x7F8uLL);
    if (a10) {
      BOOL v21 = a11 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeVerifySealingRequest");
      uint64_t v22 = 1;
LABEL_18:
      free(v20);
      return v22;
    }
    v20[7] = a1;
    v20[8] = a2;
    v20[243] = a3;
    v20[244] = a4;
    v20[9] = a5;
    v20[10] = a6;
    v20[17] = a7;
    v20[18] = a8;
    v20[251] = (uint64_t)kAMFDRDecodeImplementationTestStationSha1;
    uint64_t v23 = _AMFDRDecodeVerifyTrustObject((uint64_t)v20);
    if (v23)
    {
      uint64_t v24 = v23;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeVerifyTrustObject failed (%llu), continuing.", "_AMFDRDecodeVerifySealingRequestInternal", v23);
      *v20 |= v24;
    }
    if (v20[7] && v20[8])
    {
      if (!Img4DecodeInit())
      {
        if (Img4DecodePerformTrustEvaluatation())
        {
          AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request trust evaluation failed.", "_AMFDRDecodeVerifySealingRequestInternal");
          uint64_t v22 = *v20;
          char v26 = a10;
          unsigned int v25 = a11;
          if (!*v20)
          {
            uint64_t v22 = 0x100000000000;
            *long long v20 = 0x100000000000;
          }
        }
        else
        {
          uint64_t v22 = *v20;
          char v26 = a10;
          unsigned int v25 = a11;
        }
        v20[241] = v20[181];
        v20[242] = v20[182];
        goto LABEL_17;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request failed to decode img4", "_AMFDRDecodeVerifySealingRequestInternal");
      uint64_t v22 = *v20 | 0x200000000;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request is missing", "_AMFDRDecodeVerifySealingRequestInternal");
      uint64_t v22 = *v20 | 0x100000000;
    }
    *long long v20 = v22;
    char v26 = a10;
    unsigned int v25 = a11;
LABEL_17:
    *char v26 = v20[241];
    *unsigned int v25 = v20[242];
    *a9 = *((unsigned char *)v20 + 2004);
    goto LABEL_18;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifySealingRequest");
  return 0x80000000000002;
}

uint64_t AMFDRDecodeSealingRequest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, const void *a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  memset(v24, 170, 24);
  memset(v23, 170, sizeof(v23));
  memset(v20, 170, sizeof(v20));
  v21[0] = a1;
  v21[1] = a2;
  if (a1 && a2)
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    if (DERDecodeSeqInit((uint64_t)v21, &v22, v23))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest top-level container");
      return 0x400000000;
    }
    if (v22 != 0x2000000000000010)
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest top-level container. Expected tag %llu, found %llu");
      return 0x400000000;
    }
    if (DERDecodeSeqNext(v23, v24))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode sealing manifest tag");
      return 0x400000000;
    }
    if (v24[0] != 22)
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest tag. Expected tag %d, found %llu");
      return 0x400000000;
    }
    if (v24[2] != a8)
    {
      AMFDRDecodeLogInternal(3, "%s: uniqueIDInfo.content.length != uniqueIDLength");
      return 0x2000000000;
    }
    if (memcmp((const void *)v24[1], a7, v24[2]))
    {
      AMFDRDecodeLogInternal(3, "%s: memcmp( uniqueIDInfo.content.data, uniqueID, uniqueIDLength) != 0");
      return 0x2000000000;
    }
    unsigned int v18 = DERDecodeSeqNext(v23, &v23[2]);
    if (v18)
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode sealing manifest body");
      return 0x400000000;
    }
    while (1)
    {
      if (v18) {
        return 0;
      }
      if (DERDecodeItem((uint64_t)&v23[3], (unint64_t *)&v20[2]))
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "AMFDRDecodeSealingRequest");
        return 0x2000000;
      }
      if (_AMFDRDecodeDERFDRItem((unint64_t *)&v20[3], v20))
      {
        AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest contents classItem");
        return 0x400000000;
      }
      uint64_t v19 = AMFDRDecodeVerifyTestStationManifest(v20[0], v20[1], a3, a4, a5, a6, (uint64_t)a7, a8, a9, a10);
      if (v19) {
        break;
      }
      unsigned int v18 = DERDecodeSeqNext(v23, &v23[2]);
      if (v18 >= 2)
      {
        AMFDRDecodeLogInternal(3, "%s: Failed decoding next item in sealing manifest contents");
        return 0x400000000;
      }
    }
    uint64_t v16 = v19;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeVerifySealingManifest 0x%016llX", "AMFDRDecodeSealingRequest", v19);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Sealing manifest is NULL or 0 length", "AMFDRDecodeSealingRequest");
    return 0x100000000;
  }
  return v16;
}

uint64_t _AMFDRDecodeDERFDRItem(unint64_t *a1, void *a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  if (DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v6, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem", "_AMFDRDecodeDERFDRItem");
    return 16;
  }
  else
  {
    if ((void)v6) {
      BOOL v4 = *((void *)&v6 + 1) == 4;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      if (*(_DWORD *)v6 == *MEMORY[0x263F8BE20])
      {
        uint64_t result = 0;
        uint64_t v5 = *((void *)&v7 + 1);
        *a2 = v7;
        a2[1] = v5;
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem, expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeDERFDRItem", *MEMORY[0x263F8BE20], *(unsigned __int8 *)(MEMORY[0x263F8BE20] + 1), *(unsigned __int8 *)(MEMORY[0x263F8BE20] + 2), *(unsigned __int8 *)(MEMORY[0x263F8BE20] + 3), *(unsigned __int8 *)v6, *(unsigned __int8 *)(v6 + 1), *(unsigned __int8 *)(v6 + 2), *(unsigned __int8 *)(v6 + 3));
        return 64;
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem, invalid tag length", "_AMFDRDecodeDERFDRItem");
      return 32;
    }
  }
  return result;
}

uint64_t AMFDRDecodeVerifyTestStationManifest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  unsigned int v18 = (unsigned int *)malloc(0x7F8uLL);
  if (!v18)
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifyTestStationManifest");
    return 0x80000000000002;
  }
  uint64_t v19 = v18;
  bzero(v18, 0x7F8uLL);
  *((void *)v19 + 5) = a1;
  *((void *)v19 + 6) = a2;
  *((void *)v19 + 243) = a3;
  *((void *)v19 + 244) = a4;
  *((void *)v19 + 9) = a5;
  *((void *)v19 + 10) = a6;
  *((void *)v19 + 17) = a7;
  *((void *)v19 + 18) = a8;
  *((void *)v19 + 48) = a9;
  *((void *)v19 + 49) = a10;
  *((void *)v19 + 251) = kAMFDRDecodeImplementationTestStationSha1;
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v35 = v20;
  *(_OWORD *)&v35[16] = v20;
  long long v34 = v20;
  memset(v33, 170, sizeof(v33));
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  int v30 = 0;
  uint64_t v21 = _AMFDRDecodeVerifyTrustObject((uint64_t)v19);
  if (v21) {
    *(void *)v19 |= v21;
  }
  if (*((void *)v19 + 5) && *((void *)v19 + 6))
  {
    if (Img4DecodeInitManifest())
    {
      AMFDRDecodeLogInternal(3, "%s: could not parse sealing manifest");
    }
    else
    {
      if (!DERImg4DecodeManifest())
      {
        if ((**((unsigned int (***)(void, void, uint64_t, void))v19 + 251))(*((void *)v19 + 140), *((void *)v19 + 141), (uint64_t)(v19 + 308), **(void **)(*((void *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha1 failed");
        }
        else if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, unsigned int *, unsigned int *))(*((void *)v19 + 251) + 8))(*((void *)v19 + 144), *((void *)v19 + 145), &v31, &v32, v19 + 292, v19 + 294))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: certificate chain validation failed");
        }
        else if ((*(unsigned int (**)(uint64_t, uint64_t, void, void, unsigned int *, void))(*((void *)v19 + 251) + 16))(v31, v32, *((void *)v19 + 142), *((void *)v19 + 143), v19 + 308, **(void **)(*((void *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: signature validation failed");
        }
        else if (DERDecodeItem((uint64_t)(v19 + 280), &v33[5]))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
        }
        else if (v33[5] == 0x2000000000000011)
        {
          if (DERParseInteger((char **)v19 + 138, &v30))
          {
            AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
          }
          else if (DERImg4DecodeFindProperty())
          {
            AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
          }
          else
          {
            *((_OWORD *)v19 + 56) = *(_OWORD *)&v35[8];
            if (DERImg4DecodeFindProperty())
            {
              AMFDRDecodeLogInternal(3, "%s: failed to find MANP (manifest payload) tag");
            }
            else
            {
              *((_OWORD *)v19 + 57) = *(_OWORD *)&v35[8];
              if (Img4DecodeEvaluateManifestProperties())
              {
                AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateManifestProperties failed");
              }
              else if (DERDecodeSeqContentInit((unint64_t *)v19 + 112, v33) {
                     || (unsigned int v25 = DERDecodeSeqNext(v33, &v33[2])) != 0)
              }
              {
LABEL_38:
                AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
              }
              else
              {
                char v26 = 0;
                while (!v25)
                {
                  unint64_t v27 = v33[2];
                  if (LODWORD(v33[2]) != 1296125520)
                  {
                    if (DERImg4DecodeFindProperty())
                    {
                      AMFDRDecodeLogInternal(3, "%s: failed to find object properties");
                      goto LABEL_14;
                    }
                    *((_OWORD *)v19 + 58) = *(_OWORD *)&v35[8];
                    if ((*(unsigned int (**)(unsigned int *, unsigned int *))(*((void *)v19 + 251) + 24))(v19 + 214, v19))
                    {
                      AMFDRDecodeLogInternal(3, "%s: evaluateCertificateProperties failed");
                      goto LABEL_14;
                    }
                    if (Img4DecodeEvaluateObjectProperties())
                    {
                      AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateObjectProperties failed");
                      goto LABEL_14;
                    }
                    uint64_t v28 = (uint64_t (*)(unint64_t, void, void, void, void, void, void, void, unsigned int, void, unsigned int, void))*((void *)v19 + 48);
                    if (v28)
                    {
                      uint64_t v29 = v28(v27, *((void *)v19 + 17), v19[36], *((void *)v19 + 25), v19[52], *((void *)v19 + 245), v19[492], *((void *)v19 + 247), v19[496], *((void *)v19 + 249), v19[500], *((void *)v19 + 49));
                      if (v29)
                      {
                        AMFDRDecodeLogInternal(3, "%s: sealingManifestCallback failed with error 0x%llX", "_AMFDRDecodeVerifyTestStationManifestInternal", v29);
                        uint64_t v23 = *(void *)v19 | 0x400000000;
                        goto LABEL_15;
                      }
                    }
                    char v26 = 1;
                  }
                  unsigned int v25 = DERDecodeSeqNext(v33, &v33[2]);
                  if (v25 >= 2) {
                    goto LABEL_38;
                  }
                }
                if (v26)
                {
                  uint64_t v23 = *(void *)v19;
                  goto LABEL_15;
                }
                AMFDRDecodeLogInternal(3, "%s: No manifest found - not evaluated.");
              }
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
        }
        goto LABEL_14;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sealing manifest");
    }
    uint64_t v22 = *(void *)v19 | 0x2000000;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest is missing", "_AMFDRDecodeVerifyTestStationManifestInternal");
    uint64_t v22 = *(void *)v19 | 0x1000000;
  }
  *(void *)uint64_t v19 = v22;
LABEL_14:
  AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "_AMFDRDecodeVerifyTestStationManifestInternal");
  uint64_t v23 = *(void *)v19 | 0x2000000;
LABEL_15:
  free(v19);
  return v23;
}

uint64_t AMFDRDecodeEvaluateTrustCombined(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, void *a9, _DWORD *a10)
{
  return AMFDRDecodeEvaluateTrustCombinedWithSik(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, a10);
}

uint64_t AMFDRDecodeEvaluateTrustCombinedWithSik(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, void *a11, _DWORD *a12)
{
  long long v20 = malloc(0x7F8uLL);
  if (v20)
  {
    uint64_t v21 = v20;
    bzero(v20, 0x7F8uLL);
    if (a11) {
      BOOL v22 = a12 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustCombinedWithSik");
      uint64_t v23 = 1;
    }
    else
    {
      v21[1] = a1;
      void v21[2] = a2;
      v21[9] = a3;
      v21[10] = a4;
      v21[13] = a5;
      v21[14] = a6;
      v21[17] = a7;
      v21[18] = a8;
      v21[21] = a9;
      v21[22] = a10;
      uint64_t v24 = kAMFDRDecodeImplementationSha384;
      if (a4 != 48) {
        uint64_t v24 = kAMFDRDecodeImplementationSha1;
      }
      v21[251] = v24;
      uint64_t v23 = AMFDRDecodeEvaluateTrustInternal((uint64_t)v21);
      *a11 = v21[239];
      *a12 = v21[240];
    }
    free(v21);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustCombinedWithSik");
    return 0x80000000000000;
  }
  return v23;
}

uint64_t AMFDRDecodeEvaluateTrustInternal(uint64_t a1)
{
  if (!*(void *)(a1 + 72) || !*(void *)(a1 + 80)) {
    *(void *)a1 |= 0x40000uLL;
  }
  if ((!*(void *)(a1 + 104) || !*(void *)(a1 + 112)) && (*(unsigned char *)(a1 + 2017) & 0x20) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode->uniqueID is NULL or 0 size", "AMFDRDecodeEvaluateTrustInternal");
    uint64_t result = *(void *)a1 | 1;
LABEL_12:
    *(void *)a1 = result;
    return result;
  }
  if (*(void *)(a1 + 8) && *(void *)(a1 + 16))
  {
    if (_AMFDRDecodeCombined(a1))
    {
      AMFDRDecodeLogInternal(4, "%s: data is unwrapped", "AMFDRDecodeEvaluateTrustInternal");
      uint64_t v3 = *(void *)a1;
      *(void *)(a1 + 1912) = *(void *)(a1 + 8);
      *(void *)(a1 + 1920) = *(void *)(a1 + 16);
      uint64_t result = v3 | 0x5A01C00;
      goto LABEL_12;
    }
  }
  else if (!*(void *)(a1 + 1944) || !*(void *)(a1 + 1952))
  {
    *(void *)a1 |= 0x200000uLL;
  }
  uint64_t v4 = _AMFDRDecodeVerifyTrustObject(a1);
  if (v4) {
    *(void *)a1 |= v4;
  }
  uint64_t v5 = _AMFDRDecodeVerifyData((uint64_t *)a1);
  if (v5) {
    *(void *)a1 |= v5;
  }
  unsigned int v25 = 0;
  int v24 = 0;
  if ((!*(void *)(a1 + 344) || !*(_DWORD *)(a1 + 352)) && (!*(void *)(a1 + 232) || !*(void *)(a1 + 240)))
  {
    AMFDRDecodeLogInternal(6, "%s: No need to verify subCC and asid");
    goto LABEL_56;
  }
  uint64_t v6 = AMFDRDecodeIterateSysconfigBegin(*(void *)(a1 + 1912), *(_DWORD *)(a1 + 1920), &v25, &v24);
  long long v7 = v25;
  if (!v25 || v6)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR 3.0 Data can't be decoded!");
    goto LABEL_51;
  }
  char v8 = 0;
  while (1)
  {
    unsigned int v23 = 0;
    char __n_7 = 0;
    unsigned int __n = 0;
    __s2 = 0;
    uint64_t v9 = AMFDRDecodeIterateSysconfigPayloadNext((uint64_t)v7, &v23, &__n_7, &__s2, &__n, 0);
    if (v9)
    {
      if (v9 == 0x40000000000000)
      {
        if (*(void *)(a1 + 232) && !((*(void *)(a1 + 240) == 0) | v8 & 1)) {
          AMFDRDecodeLogInternal(4, "%s: kFDRTag_asid doesn't exist, but this is allowed");
        }
        goto LABEL_56;
      }
      AMFDRDecodeLogInternal(3, "%s: failed to decode payload: 0x%llx!");
LABEL_51:
      uint64_t v17 = *(void *)a1 | 0x400000000000000;
      goto LABEL_55;
    }
    int v10 = AMFDRTagsStringToTag(&v23);
    if (v10 == 1634953572)
    {
      uint64_t v11 = *(const void **)(a1 + 232);
      if (v11)
      {
        size_t v12 = *(void *)(a1 + 240);
        if (v12)
        {
          if (v12 != __n)
          {
            AMFDRDecodeLogInternal(3, "%s: asid subCC length != fdrDecode->asidSubCCID.length", "_AMFDRDecodeVerifySubCC");
            *(void *)a1 |= 0x200000000000000uLL;
            uint64_t v11 = *(const void **)(a1 + 232);
            size_t v12 = __n;
          }
          if (memcmp(v11, __s2, v12))
          {
            AMFDRDecodeLogInternal(3, "%s: asid subCC data != fdrDecode->asidSubCCID", "_AMFDRDecodeVerifySubCC");
            *(void *)a1 |= 0x200000000000000uLL;
          }
          char v8 = 1;
        }
      }
    }
    if (*(void *)(a1 + 344))
    {
      unint64_t v13 = *(unsigned int *)(a1 + 352);
      if (v13) {
        break;
      }
    }
LABEL_47:
    long long v7 = v25;
  }
  uint64_t v14 = 0;
  while (*(_DWORD *)(*(void *)(a1 + 344) + 4 * v14) != v10)
  {
LABEL_46:
    if (++v14 >= v13) {
      goto LABEL_47;
    }
  }
  uint64_t v15 = *(void *)(a1 + 360);
  if (!v15 || (uint64_t v16 = *(void *)(a1 + 368)) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: No SCDG in manifest, subCC digest missing");
    goto LABEL_54;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (!_AMFDRDecodeSearchEntryFromPropertyList(v15, v16, v10, &v18) && v19 && v18)
  {
    unint64_t v13 = *(unsigned int *)(a1 + 352);
    goto LABEL_46;
  }
  AMFDRDecodeLogInternal(3, "%s: cannot find subCC digest for %u");
LABEL_54:
  uint64_t v17 = *(void *)a1 | 0x1000000000000000;
LABEL_55:
  *(void *)a1 = v17;
LABEL_56:
  if (v25) {
    free(v25);
  }
  return *(void *)a1;
}

uint64_t AMFDRDecodeEvaluateTrust(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, void *a11, _DWORD *a12)
{
  return AMFDRDecodeEvaluateTrustWithSik(a1, a2, 0, 0, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, a11, a12);
}

uint64_t AMFDRDecodeEvaluateTrustWithSik(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, uint64_t a13, unsigned int a14, void *a15, _DWORD *a16)
{
  int v24 = malloc(0x7F8uLL);
  if (v24)
  {
    unsigned int v25 = v24;
    bzero(v24, 0x7F8uLL);
    if (a15) {
      BOOL v26 = a16 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    if (v26)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustWithSik");
      uint64_t v27 = 1;
    }
    else
    {
      v25[243] = a5;
      v25[244] = a6;
      v25[9] = a7;
      v25[10] = a8;
      v25[13] = a9;
      v25[14] = a10;
      v25[17] = a11;
      v25[18] = a12;
      v25[21] = a13;
      v25[22] = a14;
      v25[3] = a1;
      v25[4] = a2;
      v25[35] = a3;
      v25[36] = a4;
      uint64_t v28 = kAMFDRDecodeImplementationSha384;
      if (a8 != 48) {
        uint64_t v28 = kAMFDRDecodeImplementationSha1;
      }
      v25[251] = v28;
      uint64_t v27 = AMFDRDecodeEvaluateTrustInternal((uint64_t)v25);
      *a15 = v25[239];
      *a16 = v25[240];
    }
    free(v25);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustWithSik");
    return 0x80000000000000;
  }
  return v27;
}

uint64_t AMFDRDecodeEvaluateTrustOffline(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, _DWORD *a8)
{
  uint64_t v16 = (uint64_t *)malloc(0x7F8uLL);
  if (v16)
  {
    uint64_t v17 = v16;
    bzero(v16, 0x7F8uLL);
    if (!a7 || !a8)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustOffline");
      uint64_t v19 = 1;
LABEL_13:
      free(v17);
      return v19;
    }
    v17[13] = a3;
    v17[14] = a4;
    v17[3] = a1;
    v17[4] = a2;
    v17[37] = a5;
    v17[38] = a6;
    v17[251] = (uint64_t)kAMFDRDecodeImplementationOffline;
    if (a3 && a4)
    {
      uint64_t v18 = _AMFDRDecodeVerifyData(v17);
      uint64_t v19 = *v17;
      if (!v18)
      {
LABEL_12:
        *a7 = v17[239];
        *a8 = v17[240];
        goto LABEL_13;
      }
      v19 |= v18;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: fdrDecode->uniqueID is NULL or 0 size", "AMFDRDecodeEvaluateTrustOfflineInternal");
      uint64_t v19 = 1;
    }
    *uint64_t v17 = v19;
    goto LABEL_12;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustOffline");
  return 0x80000000000000;
}

uint64_t AMFDRDecodeVerifyMultiCombinedDataIntegrity(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v14 = malloc(0x7F8uLL);
  if (v14)
  {
    uint64_t v15 = (uint64_t)v14;
    bzero(v14, 0x7F8uLL);
    *(void *)(v15 + 8) = a1;
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 72) = a3;
    *(void *)(v15 + 80) = a4;
    *(void *)(v15 + 136) = a5;
    *(void *)(v15 + 144) = a6;
    *(void *)(v15 + 2016) = a7;
    uint64_t v16 = kAMFDRDecodeImplementationSha1;
    if (a4 == 48) {
      uint64_t v16 = kAMFDRDecodeImplementationSha384;
    }
    if ((a7 & 0x20) != 0) {
      uint64_t v16 = kAMFDRDecodeImplementationSha384;
    }
    *(void *)(v15 + 2008) = v16;
    *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    if (!a1 || !a2)
    {
      AMFDRDecodeLogInternal(3, "%s: combinedData is required to be set", "_AMFDRDecodeVerifyMultiCombinedDataInternal");
      uint64_t v18 = 512;
      goto LABEL_15;
    }
    if (!a3 || !a4) {
      *(void *)uint64_t v15 = 0x40000;
    }
    if (_AMFDRDecodeCombined(v15))
    {
      AMFDRDecodeLogInternal(4, "%s: data is unwrapped", "_AMFDRDecodeVerifyMultiCombinedDataInternal");
      uint64_t v17 = *(void *)v15;
      *(void *)(v15 + 1912) = *(void *)(v15 + 8);
      *(void *)(v15 + 1920) = *(void *)(v15 + 16);
      uint64_t v18 = v17 | 0x5A01C00;
LABEL_15:
      *(void *)uint64_t v15 = v18;
      goto LABEL_16;
    }
    uint64_t v21 = _AMFDRDecodeVerifyTrustObject(v15);
    if (v21) {
      *(void *)v15 |= v21;
    }
    _AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData((void *)v15, &v33);
    if (v22)
    {
      __format = "%s: Failed to get payload sequence and set manifest from multi combined data";
    }
    else
    {
      unint64_t v31 = 0;
      v32[0] = 0;
      v32[1] = 0;
      if (DERDecodeSeqNext((unint64_t *)&v33, &v31)) {
        goto LABEL_41;
      }
      __format = "%s: MultiCombinedItem malformed for multi combined data";
      while (1)
      {
        uint64_t v23 = *(void *)(v15 + 2016);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        if (DERParseSequenceContentToObject(v32, 4u, (uint64_t)&DERFDRMultiCombinedItemSpecs, (unint64_t)&v27, 0x40uLL, 0))break; {
        if ((void)v27)
        }
          BOOL v24 = *((void *)&v27 + 1) == 0;
        else {
          BOOL v24 = 1;
        }
        if (v24)
        {
          AMFDRDecodeLogInternal(3, "%s: found an empty data class in multi combined data", "_AMFDRDecodeVerifyMultiCombinedDataInternal");
          uint64_t v18 = *(void *)v15 | 0x20000;
          goto LABEL_15;
        }
        *(_OWORD *)(v15 + 88) = v27;
        if ((void)v29 && *((void *)&v29 + 1)) {
          *(_OWORD *)(v15 + 104) = v29;
        }
        else {
          *(void *)(v15 + 2016) |= 0x2000uLL;
        }
        if ((void)v30 && *((void *)&v30 + 1))
        {
          *(_OWORD *)(v15 + 120) = v30;
          *(void *)(v15 + 2016) |= 0x1000uLL;
        }
        *(_OWORD *)(v15 + 24) = v28;
        uint64_t v25 = _AMFDRDecodeVerifyData((uint64_t *)v15);
        if (v25) {
          *(void *)v15 |= v25;
        }
        if (*(unsigned char *)(v15 + 2032)) {
          *(void *)(v15 + 2024) = v15 + 728;
        }
        *(void *)(v15 + 2016) = v23;
        if (DERDecodeSeqNext((unint64_t *)&v33, &v31)) {
          goto LABEL_41;
        }
      }
    }
    *(void *)v15 |= 0x20000uLL;
    AMFDRDecodeLogInternal(3, __format, "_AMFDRDecodeVerifyMultiCombinedDataInternal");
LABEL_41:
    uint64_t v18 = *(void *)v15;
    if (!*(void *)v15)
    {
      unint64_t v19 = 0;
      goto LABEL_17;
    }
LABEL_16:
    unint64_t v19 = _AMFDRDecodeTolerateErrorsForOptions(*(void *)(v15 + 2016), v18);
LABEL_17:
    free((void *)v15);
    return v19;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifyMultiCombinedDataIntegrity");
  return 0x80000000000000;
}

unint64_t _AMFDRDecodeTolerateErrorsForOptions(__int16 a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a1 & 2) != 0 && (a2 & 0x2600000000100) != 0)
  {
    AMFDRDecodeLogInternal(4, "%s: ignoring unsealed error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", a2 & 0x2600000000100);
    v2 &= 0xFFFD9FFFFFFFFEFFLL;
  }
  if ((a1 & 4) != 0 && (v2 & 0x140000) != 0)
  {
    AMFDRDecodeLogInternal(4, "%s: ignoring trust object mismatch error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", v2 & 0x140000);
    v2 &= 0xFFFFFFFFFFEBFFFFLL;
  }
  if ((a1 & 8) != 0)
  {
    uint64_t v4 = 0x8005A33C80;
    if ((a1 & 1) == 0) {
      uint64_t v4 = 0x8005A03C00;
    }
    uint64_t v5 = v2 & v4;
    if ((v2 & v4) != 0)
    {
      AMFDRDecodeLogInternal(4, "%s: ignoring raw error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", v5);
      v2 ^= v5;
    }
  }
  if ((a1 & 0x10) != 0 && (v2 & 0x1040000300000) != 0)
  {
    AMFDRDecodeLogInternal(4, "%s: ignoring offline signing verification error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", v2 & 0x1040000300000);
    v2 &= 0xFFFEFBFFFFCFFFFFLL;
  }
  if ((a1 & 0x40) != 0 && (v2 & 0x2C0100) != 0)
  {
    AMFDRDecodeLogInternal(4, "%s: ignoring no trustobject error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", v2 & 0x2C0100);
    v2 &= 0xFFFFFFFFFFD3FEFFLL;
  }
  if ((a1 & 0x4000) != 0 && (v2 & 0x1000000000000000) != 0)
  {
    AMFDRDecodeLogInternal(4, "%s: ignoring incomplete subcc error 0x%016llX", "_AMFDRDecodeTolerateErrorsForOptions", v2 & 0x1000000000000000);
    return v2 & 0xEFFFFFFFFFFFFFFFLL;
  }
  return v2;
}

uint64_t AMFDRDecodeCombined(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4, void *a5, _DWORD *a6)
{
  size_t v12 = malloc(0x7F8uLL);
  if (v12)
  {
    unint64_t v13 = v12;
    bzero(v12, 0x7F8uLL);
    if (a1 && a2)
    {
      if (a3 && a4)
      {
        if (a5 && a6)
        {
          v13[1] = a1;
          v13[2] = a2;
          uint64_t v14 = _AMFDRDecodeCombined((uint64_t)v13);
          if (!v14)
          {
            *a3 = v13[243];
            *a4 = v13[244];
            uint64_t v15 = v13[4];
            *a5 = v13[3];
            *a6 = v15;
          }
          goto LABEL_15;
        }
        AMFDRDecodeLogInternal(3, "%s: outData must be non NULL and outDataLength must be non 0");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: outTrustObject must be non NULL and outTrustObjectLength must be non 0");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: inData must be non NULL and inDataLength must be non 0");
    }
    uint64_t v14 = 1;
LABEL_15:
    free(v13);
    return v14;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeCombined");
  return 0x80000000000000;
}

uint64_t _AMFDRDecodeCombined(uint64_t a1)
{
  memset(v17, 170, sizeof(v17));
  long long v15 = 0u;
  *(_OWORD *)uint64_t v16 = 0u;
  long long v14 = 0u;
  if (DERDecodeItem(a1 + 8, v17))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR Combined Format", "_AMFDRDecodeCombined");
    *(void *)a1 |= 0x80uLL;
    return 128;
  }
  if (v17[0] != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Combined Format unexpected tag: %llu", "_AMFDRDecodeCombined", v17[0]);
    *(void *)a1 |= 0x10000uLL;
    return 0x10000;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = *(void *)(a1 + 8) + v3;
  if (v4 < v17[1] + v17[2])
  {
    AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "_AMFDRDecodeCombined");
    *(void *)a1 |= 4uLL;
    return 4;
  }
  if (v4 > v17[1] + v17[2])
  {
    AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "_AMFDRDecodeCombined", v3 - v17[2]);
    *(void *)a1 |= 8uLL;
    return 8;
  }
  if (DERParseSequenceContentToObject(&v17[1], 3u, (uint64_t)&DERFDRCombinedItemSpecs, (unint64_t)&v14, 0x30uLL, 0))goto LABEL_30; {
  if (!(void)v14 || *((void *)&v14 + 1) != 4)
  }
    goto LABEL_29;
  if (*(_DWORD *)v14 != *(_DWORD *)"comb")
  {
LABEL_30:
    *(void *)a1 |= 0x20000uLL;
    return 0x20000;
  }
  if (!(void)v15 || !*((void *)&v15 + 1))
  {
    *(void *)a1 |= 0x200uLL;
    uint64_t DataFromMultiCombined = 512;
    goto LABEL_20;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  if (DERParseSequenceContentToObject((unint64_t *)&v15, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (DERFDRItemSpecs)");
    goto LABEL_30;
  }
  if (!(void)v12 || *((void *)&v12 + 1) != 4)
  {
LABEL_29:
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format, invalid tag length");
    goto LABEL_30;
  }
  if (*(_DWORD *)v12 != *(_DWORD *)"fdrd")
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format, expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeCombined", kFDRTagStr_fdrd[0], kFDRTagStr_fdrd[1]);
    goto LABEL_30;
  }
  uint64_t v9 = *((void *)&v13 + 1);
  *(void *)(a1 + 24) = v13;
  *(void *)(a1 + 32) = v9;
  if ((*(unsigned char *)(a1 + 2017) & 8) != 0)
  {
    uint64_t DataFromMultiCombined = _AMFDRDecodeFindDataFromMultiCombined(a1);
    if (DataFromMultiCombined)
    {
      AMFDRDecodeLogInternal(4, "%s: cannot decode to a multicombined data, proceed with combined format", "_AMFDRDecodeCombined");
      uint64_t v11 = *((void *)&v13 + 1);
      *(void *)(a1 + 24) = v13;
      *(void *)(a1 + 32) = v11;
    }
  }
  else
  {
    uint64_t DataFromMultiCombined = 0;
  }
LABEL_20:
  if (!v16[0] || !v16[1])
  {
    uint64_t v7 = *(void *)a1 | 0x200000;
LABEL_38:
    *(void *)a1 = v7;
    return DataFromMultiCombined;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  if (DERParseSequenceContentToObject(v16, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject)");
LABEL_36:
    uint64_t v8 = 0x20000;
    uint64_t DataFromMultiCombined = 0x20000;
LABEL_37:
    uint64_t v7 = *(void *)a1 | v8;
    goto LABEL_38;
  }
  if (!(void)v12 || *((void *)&v12 + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject), invalid tag length");
    goto LABEL_36;
  }
  if (*(_DWORD *)v12 != *(_DWORD *)"secb")
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject), expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeCombined", kFDRTagStr_secb[0], kFDRTagStr_secb[1]);
    goto LABEL_36;
  }
  long long v10 = v13;
  *(_OWORD *)(a1 + 1944) = v13;
  uint64_t v8 = 0x200000;
  if (!(void)v10 || !*((void *)&v10 + 1)) {
    goto LABEL_37;
  }
  return DataFromMultiCombined;
}

uint64_t AMFDRDecodePublicKey(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    long long v6 = 0uLL;
    unint64_t v5 = 0;
    *(void *)(a1 + 32) = a2;
    *(void *)(a1 + 40) = a3;
    if (_AMFDRDecodePubKey(a1 + 32, (unint64_t *)a1, a1 + 48))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode public key: %d");
    }
    else
    {
      if (!DEROidCompare(a1 + 48, (uint64_t)&oidEcPubKey))
      {
        AMFDRDecodeLogInternal(3, "%s: public key OID is not EC", "AMFDRDecodePublicKey");
        return 64;
      }
      if (!DERDecodeItem(a1 + 64, &v5))
      {
        uint64_t result = 0;
        *(_OWORD *)(a1 + 16) = v6;
        return result;
      }
      AMFDRDecodeLogInternal(3, "%s: failed to decode params");
    }
    return 16;
  }
  return result;
}

uint64_t _AMFDRDecodePubKey(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v8 = v5;
  long long v9 = v5;
  char v7 = -86;
  uint64_t result = DERParseSequenceToObject(a1, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v8, 0x20uLL, 0x20uLL);
  if (!result)
  {
    uint64_t result = DERParseSequenceContentToObject((unint64_t *)&v8, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, a3, 0x20uLL, 0x20uLL);
    if (!result)
    {
      if (DEROidCompare(a3, (uint64_t)&oidRsa) || DEROidCompare(a3, (uint64_t)&oidEcPubKey))
      {
        uint64_t result = DERParseBitString((uint64_t)&v9, a2, &v7);
        if (!result)
        {
          if (v7) {
            return 3;
          }
          else {
            return 0;
          }
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

uint64_t AMFDRDecodeCertificate(unint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    *(void *)(a1 + 256) = a2;
    *(void *)(a1 + 264) = a3;
    if (DERParseSequenceToObject(a1 + 256, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a1, 0x30uLL, 0x30uLL)|| DERParseSequenceToObject(a1, 0xAu, (uint64_t)&FDRDERTBSCertItemSpecs, a1 + 48, 0xA0uLL, 0xA0uLL)|| _AMFDRDecodePubKey(a1 + 144, (unint64_t *)(a1 + 208), a1 + 224))
    {
      return 0x40000000000;
    }
    if (*(void *)(a1 + 248))
    {
      if (DEROidCompare(a1 + 224, (uint64_t)&oidEcPubKey))
      {
        if (*(void *)(a1 + 248) != 10) {
          return 0x40000000000;
        }
        long long v5 = *(unsigned char **)(a1 + 240);
        if (*v5 != 6 || v5[1] != 8 || memcmp(v5 + 2, &_oidEcPrime256v1, 8uLL)) {
          return 0x40000000000;
        }
      }
      else if (DEROidCompare(a1 + 224, (uint64_t)&oidRsa))
      {
        if (*(void *)(a1 + 248) != 2) {
          return 0x40000000000;
        }
        long long v6 = *(unsigned char **)(a1 + 240);
        if (*v6 != 5 || v6[1]) {
          return 0x40000000000;
        }
      }
    }
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    if (_AMFDRDecodeParseExtension(a1 + 48, (uint64_t)&___oidAppleFDRClientID, &v7, (void *)(a1 + 272), 1))
    {
      AMFDRDecodeLogInternal(5, "%s: ClientID extension not found", "AMFDRDecodeCertificate");
    }
    else if (v7 != 12)
    {
      return 0x40000000000;
    }
    if (_AMFDRDecodeParseExtension(a1 + 48, (uint64_t)&___oidAppleSecureBootCertificateProperties, &v7, (void *)(a1 + 288), 0))
    {
      AMFDRDecodeLogInternal(5, "%s: Certificate Properties extension not found", "AMFDRDecodeCertificate");
      return 0;
    }
    if (v7 == 0x2000000000000011) {
      return 0;
    }
    return 0x40000000000;
  }
  return result;
}

uint64_t _AMFDRDecodeParseExtension(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  v20[0] = 0xAAAAAAAAAAAAAAAALL;
  v20[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(v18, 170, sizeof(v18));
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = v5;
  long long v17 = v5;
  memset(v15, 170, sizeof(v15));
  uint64_t v6 = 1;
  v16[0] = v5;
  if (a1 && a2 && a4)
  {
    *a4 = 0;
    a4[1] = 0;
    if (*(void *)(a1 + 152) && (v10 = *(void *)(a1 + 144), uint64_t v9 = a1 + 144, v10))
    {
      unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v6 = 16;
      if (!DERDecodeSeqInit(v9, &v19, v20) && v19 == 0x2000000000000010)
      {
        uint64_t v6 = 2;
        while (!DERDecodeSeqNext(v20, v18))
        {
          if (v18[0] != 0x2000000000000010
            || DERParseSequenceContentToObject(&v18[1], (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v16, 0x30uLL, 0x30uLL))
          {
            return 16;
          }
          if (DEROidCompare(a2, (uint64_t)v16))
          {
            if (DERDecodeItem((uint64_t)&v17, v15)) {
              return 0x40000000000;
            }
            uint64_t v6 = 0;
            *a3 = v15[0];
            if (a5) {
              long long v13 = &v15[1];
            }
            else {
              long long v13 = (unint64_t *)&v17;
            }
            *(_OWORD *)a4 = *(_OWORD *)v13;
            return v6;
          }
        }
      }
    }
    else
    {
      return 512;
    }
  }
  return v6;
}

double AMFDRDecodeImage4Certificate(_OWORD *a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3)
  {
    a1[17] = 0u;
    a1[18] = 0u;
    a1[15] = 0u;
    a1[16] = 0u;
    a1[13] = 0u;
    a1[14] = 0u;
    a1[11] = 0u;
    a1[12] = 0u;
    a1[9] = 0u;
    a1[10] = 0u;
    a1[7] = 0u;
    a1[8] = 0u;
    a1[5] = 0u;
    a1[6] = 0u;
    a1[3] = 0u;
    a1[4] = 0u;
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    memset(v22, 0, sizeof(v22));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v17[0] = 0;
    v17[1] = 0;
    unint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v15 = 0uLL;
    *(void *)&long long v25 = a2;
    *((void *)&v25 + 1) = a3;
    if (DERParseSequenceToObject((uint64_t)&v25, 4u, (uint64_t)&DERFDRImage4CertItemSpecs, (unint64_t)v22, 0x40uLL, 0x40uLL))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to parse im4c: %d");
    }
    else if (*(void *)&v22[0] && *((void *)&v22[0] + 1) == 4)
    {
      if (**(_DWORD **)&v22[0] == *(_DWORD *)"IM4C")
      {
        if (DERDecodeItem((uint64_t)&v23, &v16))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to parse signed section sequence: %d");
        }
        else if (v16 == 0x2000000000000011)
        {
          if (DERParseSequenceContentToObject(v17, 2u, (uint64_t)&DERFDRImage4CertSignedSectionItemSpecs, (unint64_t)&v20, 0x20uLL, 0x20uLL))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse signed section of im4c: %d");
          }
          else if (DERDecodeItem((uint64_t)&v21, &v14))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse public key of im4c: %d");
          }
          else if (DERParseSequenceToObject((uint64_t)&v20, 2u, (uint64_t)&DERFDRImage4CertPropertyItemSpecs, (unint64_t)&v18, 0x20uLL, 0x20uLL))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse cert properties: %d");
          }
          else if ((void)v18 && *((void *)&v18 + 1) == 4)
          {
            if (*(_DWORD *)v18 == *(_DWORD *)"CRTP")
            {
              uint64_t v4 = 0;
              long long v5 = 0;
              do
              {
                uint64_t v6 = 0;
                uint64_t v7 = (uint64_t)*(&kAMFDRDecodeEcdsaInfoList + v4);
                while (*((void *)&v24 + 1) != *(_DWORD *)(v7 + 4) + v6)
                {
                  if (++v6 == 3) {
                    goto LABEL_22;
                  }
                }
                long long v5 = *(_OWORD **)(v7 + 24);
LABEL_22:
                ++v4;
              }
              while (v4 != 3);
              if (v5)
              {
                uint64_t v8 = 0;
                while (1)
                {
                  uint64_t v9 = *(uint64_t *)((char *)&kAMFDRDecodeEcdsaInfoList + v8);
                  if (*((void *)&v15 + 1) == *(_DWORD *)v9) {
                    break;
                  }
                  v8 += 8;
                  if (v8 == 24) {
                    goto LABEL_27;
                  }
                }
                uint64_t v11 = *(long long **)(v9 + 16);
                if (!v11)
                {
LABEL_27:
                  AMFDRDecodeLogInternal(3, "%s: unsupported public key length: %lu");
                  return result;
                }
                *a1 = v23;
                a1[2] = v24;
                a1[1] = *v5;
                a1[13] = v15;
                a1[14] = oidEcPubKey;
                long long v12 = *v11;
                a1[18] = v19;
                long long v13 = v25;
                a1[15] = v12;
                a1[16] = v13;
                double result = *(double *)&v15;
                a1[9] = v15;
              }
              else
              {
                AMFDRDecodeLogInternal(3, "%s: unsupported signature length: %lu");
              }
            }
            else
            {
              AMFDRDecodeLogInternal(3, "%s: malformed cert property key: %c%c%c%c");
            }
          }
          else
          {
            AMFDRDecodeLogInternal(3, "%s: malformed cert property key length: %lu");
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: unexpected signed section tag: 0x%llx");
        }
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: malformed im4c tag: %c%c%c%c");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed im4c tag length: %lu");
    }
  }
  return result;
}

uint64_t AMFDRDecodeIterateCertChainBegin(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a1 = a2;
      a1[1] = a3;
      a1[2] = 0;
    }
  }
  return result;
}

void AMFDRDecodeIterateCertChainNext(uint64_t a1, _OWORD **a2, _DWORD *a3)
{
}

void AMFDRDecodeIterateCertChainNextWithOptions(uint64_t a1, __int16 a2, _OWORD **a3, _DWORD *a4)
{
  unsigned int v15 = 0;
  if (a1 && a3 && *(void *)a1)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7)
    {
      if (!AMFDRDecodeParseDERLengthFromBuffer(*(void *)a1, v7, &v15))
      {
        unint64_t v9 = *(void *)(a1 + 8);
        if (v9 >= v15)
        {
          uint64_t v10 = *a3;
          uint64_t v11 = *(void *)a1;
          if ((a2 & 0x100) != 0) {
            AMFDRDecodeImage4Certificate(v10, v11, v9);
          }
          else {
            uint64_t v12 = AMFDRDecodeCertificate((unint64_t)v10, v11, v9);
          }
          if (!v12)
          {
            int v13 = *(unsigned __int16 *)(a1 + 16);
            *(_WORD *)(a1 + 16) = v13 + 1;
            *a4 = v13;
            uint64_t v14 = *(void *)(a1 + 8) - v15;
            *(void *)a1 += v15;
            *(void *)(a1 + 8) = v14;
          }
        }
      }
    }
    else
    {
      *a3 = 0;
    }
  }
}

uint64_t AMFDRDecodeCheckCertRevocation(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int __n = 0;
  __s2 = 0;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __s1[0] = v4;
  __s1[1] = v4;
  v16[0] = v4;
  v16[1] = v4;
  __n_4[0] = v4;
  __n_4[1] = v4;
  unsigned int v5 = AMSupportDigestSha256();
  if (v5 || (unsigned int v5 = AMSupportDigestSha256()) != 0)
  {
LABEL_3:
    uint64_t v6 = v5;
    uint64_t v7 = "%s: AMSupportDigestSha256 failed";
LABEL_4:
    AMFDRDecodeLogInternal(3, v7, "AMFDRDecodeCheckCertRevocation");
    return v6;
  }
  if (*(void *)(a2 + 272) && *(void *)(a2 + 280))
  {
    unsigned int v5 = AMSupportDigestSha256();
    if (v5) {
      goto LABEL_3;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = AMFDRDecodeIterateTrustObjectRevokedBegin(a1);
  if (v10)
  {
    uint64_t v6 = v10;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedBegin failed");
  }
  else
  {
    uint64_t v11 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
    if (v11)
    {
      uint64_t v6 = v11;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed");
    }
    else
    {
      uint64_t v7 = "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed";
      while (1)
      {
        uint64_t v6 = (uint64_t)__s2;
        if (!__s2) {
          break;
        }
        size_t v12 = __n;
        if (!memcmp(__s1, __s2, __n))
        {
          uint64_t v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked certificate found");
          return v6;
        }
        if (!memcmp(v16, (const void *)v6, v12))
        {
          uint64_t v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked public key found");
          return v6;
        }
        if (v9 && !memcmp(__n_4, (const void *)v6, v12))
        {
          uint64_t v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked client ID found");
          return v6;
        }
        uint64_t v6 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
        if (v6) {
          goto LABEL_4;
        }
      }
    }
  }
  return v6;
}

uint64_t AMFDRDecodeVerifyCertIssuer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AMFDRDecodeVerifyCertIssuerWithOptions(a1, a2, a3, 0, 0);
}

uint64_t AMFDRDecodeVerifyCertIssuerWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, void *a5)
{
  if (!a3)
  {
    AMFDRDecodeLogInternal(3, "%s: trustObject is NULL", "AMFDRDecodeVerifyCertIssuerWithOptions");
    return 1;
  }
  if ((a4 & 0x100) != 0)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9)
      {
        if (_AMFDRDecodeVerifySignatureDataWithOid(*(const void **)(a2 + 208), *(_DWORD *)(a2 + 216), *(void *)(a1 + 32), v9, *(void *)a1, *(unsigned int *)(a1 + 8), *(void *)(a1 + 16), v8, a2 + 240, 1, a5))
        {
          uint64_t v10 = 0x20000000000;
          AMFDRDecodeLogInternal(3, "%s: PKI: im4c cert signature validation with issuer pubkey failed");
        }
        else
        {
          AMFDRDecodeLogInternal(7, "%s: PKI: verify im4c cert was issued and signed by issuer (success)", "_AMFDRDecodeVerifyImage4CertIssuer");
          uint64_t v10 = AMFDRDecodeCheckCertRevocation(a3, a1);
          if (v10) {
            AMFDRDecodeLogInternal(3, "%s: im4c revocation check failed");
          }
        }
      }
      else
      {
        uint64_t v10 = 0x40000000000;
        AMFDRDecodeLogInternal(3, "%s: decoded IM4C signature is empty");
      }
    }
    else
    {
      uint64_t v10 = 0x40000000000;
      AMFDRDecodeLogInternal(3, "%s: decoded IM4C signature OID is empty");
    }
    return v10;
  }

  return _AMFDRDecodeVerifyCertIssuerInternal(a1, a2, a3, a5);
}

uint64_t AMFDRDecodeVerifyCertIssuerNoRevocation(uint64_t a1, uint64_t a2)
{
  return _AMFDRDecodeVerifyCertIssuerInternal(a1, a2, 0, 0);
}

uint64_t _AMFDRDecodeVerifyCertIssuerInternal(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[0] = v7;
  v19[1] = v7;
  uint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  size_t v8 = *(void *)(a2 + 136);
  if (v8 != *(void *)(a1 + 104) || memcmp(*(const void **)(a2 + 128), *(const void **)(a1 + 96), v8))
  {
    AMFDRDecodeLogInternal(3, "%s: PKI: cert was not issued by issuer (subject != issuer)", "_AMFDRDecodeVerifyCertIssuerInternal");
    uint64_t v10 = (char *)malloc(0x100uLL);
    if (_AMFDRDecodeSequenceString(*(void *)(a2 + 128), *(void *)(a2 + 136), v10)) {
      uint64_t v11 = "decode error";
    }
    else {
      uint64_t v11 = v10;
    }
    size_t v12 = (char *)malloc(0x100uLL);
    if (_AMFDRDecodeSequenceString(*(void *)(a1 + 96), *(void *)(a1 + 104), v12)) {
      int v13 = "decode error";
    }
    else {
      int v13 = v12;
    }
    AMFDRDecodeLogInternal(3, "%s: subject: %s, issuer: %s", "_AMFDRDecodeVerifyCertIssuerInternal", v11, v13);
    if (v10) {
      free(v10);
    }
    if (v12) {
      free(v12);
    }
    return 0x20000000000;
  }
  char v18 = -86;
  if (DERParseSequenceContentToObject((unint64_t *)(a1 + 16), (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)v19, 0x20uLL, 0x20uLL))
  {
    AMFDRDecodeLogInternal(3, "%s: decodeAlgId failed");
    return 0x40000000000;
  }
  if (DERParseBitString(a1 + 32, (unint64_t *)&v16, &v18))
  {
    AMFDRDecodeLogInternal(3, "%s: DERParseBitString(sig) failed");
    return 0x40000000000;
  }
  if (v18)
  {
    AMFDRDecodeLogInternal(3, "%s: numUnused != 0");
    return 0x40000000000;
  }
  if (_AMFDRDecodeVerifySignatureDataWithOid(*(const void **)(a2 + 208), *(_DWORD *)(a2 + 216), v16, v17, *(void *)a1, *(unsigned int *)(a1 + 8), *(uint64_t *)&v19[0], DWORD2(v19[0]), a1 + 240, 0, a4))
  {
    AMFDRDecodeLogInternal(3, "%s: PKI: cert signature validation with issuer pubkey failed", "_AMFDRDecodeVerifyCertIssuerInternal");
    return 0x20000000000;
  }
  AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued and signed by issuer (success)", "_AMFDRDecodeVerifyCertIssuerInternal");
  if (!a3) {
    return 0;
  }
  uint64_t v14 = AMFDRDecodeCheckCertRevocation(a3, a1);
  if (v14) {
    AMFDRDecodeLogInternal(3, "%s: revocation check failed", "_AMFDRDecodeVerifyCertIssuerInternal");
  }
  return v14;
}

uint64_t AMFDRDecodeParseDERLengthFromBuffer(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  memset(v6, 170, sizeof(v6));
  uint64_t result = 1;
  if (a1 && a3)
  {
    v7[0] = a1;
    v7[1] = a2;
    if (DERDecodeItemPartialBufferGetLength((uint64_t)v7, v6, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode DER", "AMFDRDecodeParseDERLengthFromBuffer");
      return 2;
    }
    else
    {
      uint64_t result = 0;
      *a3 = LODWORD(v6[2]) - a1 + LODWORD(v6[1]);
    }
  }
  return result;
}

uint64_t AMFDRDecodeMultiSealingResponse(uint64_t a1, unsigned int a2, unsigned char *a3, uint64_t (*a4)(void, void, uint64_t, uint64_t, void, void, uint64_t, void, _DWORD, void, _DWORD, uint64_t), uint64_t a5)
{
  uint64_t v5 = 1;
  if (a1 && a2 && a3)
  {
    memset(v15, 0, sizeof(v15));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(void *)&long long v11 = a1;
    *((void *)&v11 + 1) = a2;
    if (DERParseSequenceToObject((uint64_t)&v11, 2u, (uint64_t)&DERFDRMultiResponseItemSpecs, (unint64_t)v15, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Format");
      return 16;
    }
    long long v11 = v15[0];
    if (DERParseSequenceContentToObject((unint64_t *)&v11, 3u, (uint64_t)&DERFDRMultiSealingResponsePayloadItemSpecs, (unint64_t)&v12, 0x30uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Format");
      return 16;
    }
    if ((void)v13 && (uint64_t v10 = _AMFDRDecodeMultiSealingResposeRecords(1, (unint64_t *)&v13, a4, a5)) != 0
      || (void)v14 && (uint64_t v10 = _AMFDRDecodeMultiSealingResposeRecords(0, (unint64_t *)&v14, a4, a5)) != 0)
    {
      uint64_t v5 = v10;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeMultiSealingResposeRecords failed with error 0x%llX", "AMFDRDecodeMultiSealingResponse", v10);
    }
    else if ((void)v12 && *((void *)&v12 + 1) == 1)
    {
      uint64_t v5 = 0;
      *a3 = *(unsigned char *)v12;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response actionCode Format", "AMFDRDecodeMultiSealingResponse");
      return 32;
    }
  }
  return v5;
}

uint64_t _AMFDRDecodeMultiSealingResposeRecords(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, uint64_t, uint64_t, void, void, uint64_t, void, _DWORD, void, _DWORD, uint64_t), uint64_t a4)
{
  *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !*a2 || !a2[1]) {
    return 1;
  }
  v23[0] = 0;
  v23[1] = 0;
  long long v22 = 0uLL;
  unint64_t v21 = 0;
  if (DERDecodeSeqContentInit(a2, v23))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response payload");
    return 16;
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v7 = 16;
    while (1)
    {
      long long v17 = v8;
      long long v18 = v8;
      long long v19 = v8;
      long long v20 = v8;
      long long v15 = v8;
      long long v16 = v8;
      int v9 = DERDecodeSeqNext(v23, &v21);
      if (v9) {
        break;
      }
      if (!*((void *)&v22 + 1)) {
        return v7;
      }
      if (v21 != 0x2000000000000010)
      {
        AMFDRDecodeLogInternal(3, "%s: Record must be SEQUENCE Container");
        return 32;
      }
      long long v24 = v22;
      if (DERParseSequenceContentToObject((unint64_t *)&v24, 4u, (uint64_t)&DERFDRMultiResponseRecordItemSpecs, (unint64_t)&v17, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Record Format");
        return 16;
      }
      if ((void)v18)
      {
        long long v24 = v18;
        if (DERDecodeItem((uint64_t)&v24, &v21))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response value Format");
          return 32;
        }
        if (v21 != 4)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value must be OCTET_STRING", "_AMFDRDecodeMultiSealingResposeRecords");
          return 64;
        }
        uint64_t v10 = v22;
        if (!(void)v22)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value is NULL");
          return 32;
        }
        uint64_t v11 = *((void *)&v22 + 1);
        if (!*((void *)&v22 + 1))
        {
          AMFDRDecodeLogInternal(3, "%s: Record value length is 0");
          return 32;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      if ((void)v20)
      {
        long long v24 = v20;
        if (DERParseSequenceToObject((uint64_t)&v24, 2u, (uint64_t)&DERFDRMultiResponseErrorItemSpecs, (unint64_t)&v15, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Format");
          return 16;
        }
        if (!(void)v15 || *((void *)&v15 + 1) != 1)
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Code Format");
          return 32;
        }
      }
      if (a3)
      {
        uint64_t v12 = a3(v17, DWORD2(v17), v10, v11, v19, DWORD2(v19), a1, v15, DWORD2(v15), v16, DWORD2(v16), a4);
        if (v12)
        {
          uint64_t v14 = v12;
          AMFDRDecodeLogInternal(3, "%s: multiResponseCallback failed with error 0x%llX", "_AMFDRDecodeMultiSealingResposeRecords", v12);
          return v14;
        }
      }
      long long v8 = 0uLL;
    }
    if (v9 == 1) {
      return 0;
    }
  }
  return v7;
}

uint64_t AMFDRDecodeMultiResponse(uint64_t a1, unsigned int a2, unsigned char *a3, uint64_t (*a4)(void, void, uint64_t, uint64_t, void, void, uint64_t, void, _DWORD, void, _DWORD, uint64_t), uint64_t a5)
{
  uint64_t v5 = 1;
  if (a1 && a2 && a3)
  {
    memset(v15, 0, sizeof(v15));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(void *)&long long v11 = a1;
    *((void *)&v11 + 1) = a2;
    if (DERParseSequenceToObject((uint64_t)&v11, 2u, (uint64_t)&DERFDRMultiResponseItemSpecs, (unint64_t)v15, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Format");
      return 16;
    }
    long long v11 = v15[0];
    if (DERParseSequenceContentToObject((unint64_t *)&v11, 3u, (uint64_t)&DERFDRMultiResponsePayloadItemSpecs, (unint64_t)&v12, 0x30uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Format");
      return 16;
    }
    if ((void)v13 && (uint64_t v10 = _AMFDRDecodeMultiResposeRecords(1, &v13, a4, a5)) != 0
      || (void)v14 && (uint64_t v10 = _AMFDRDecodeMultiResposeRecords(0, &v14, a4, a5)) != 0)
    {
      uint64_t v5 = v10;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeMultiResposeRecords failed with error 0x%llX", "AMFDRDecodeMultiResponse", v10);
    }
    else if ((void)v12 && *((void *)&v12 + 1) == 1)
    {
      uint64_t v5 = 0;
      *a3 = *(unsigned char *)v12;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response actionCode Format", "AMFDRDecodeMultiResponse");
      return 32;
    }
  }
  return v5;
}

uint64_t _AMFDRDecodeMultiResposeRecords(uint64_t a1, void *a2, uint64_t (*a3)(void, void, uint64_t, uint64_t, void, void, uint64_t, void, _DWORD, void, _DWORD, uint64_t), uint64_t a4)
{
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v25 = 0;
  *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !*a2 || !a2[1]) {
    return 1;
  }
  v23[0] = 0;
  v23[1] = 0;
  long long v22 = 0uLL;
  unint64_t v21 = 0;
  if (DERDecodeSeqInit((uint64_t)a2, &v25, v23))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response payload");
    return 16;
  }
  else if (v25 == 0x2000000000000011)
  {
    long long v8 = 0uLL;
    uint64_t v7 = 16;
    while (1)
    {
      long long v17 = v8;
      long long v18 = v8;
      long long v19 = v8;
      long long v20 = v8;
      long long v15 = v8;
      long long v16 = v8;
      int v9 = DERDecodeSeqNext(v23, &v21);
      if (v9) {
        break;
      }
      if (!*((void *)&v22 + 1)) {
        return v7;
      }
      if (v21 != 0x2000000000000010)
      {
        AMFDRDecodeLogInternal(3, "%s: Record must be SEQUENCE Container");
        return 32;
      }
      long long v24 = v22;
      if (DERParseSequenceContentToObject((unint64_t *)&v24, 4u, (uint64_t)&DERFDRMultiResponseRecordItemSpecs, (unint64_t)&v17, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Record Format");
        return 16;
      }
      if ((void)v18)
      {
        long long v24 = v18;
        if (DERDecodeItem((uint64_t)&v24, &v21))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response value Format");
          return 32;
        }
        if (v21 != 4)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value must be OCTET_STRING", "_AMFDRDecodeMultiResposeRecords");
          return 64;
        }
        uint64_t v10 = v22;
        if (!(void)v22)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value is NULL");
          return 32;
        }
        uint64_t v11 = *((void *)&v22 + 1);
        if (!*((void *)&v22 + 1))
        {
          AMFDRDecodeLogInternal(3, "%s: Record value length is 0");
          return 32;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      if ((void)v20)
      {
        long long v24 = v20;
        if (DERParseSequenceToObject((uint64_t)&v24, 2u, (uint64_t)&DERFDRMultiResponseErrorItemSpecs, (unint64_t)&v15, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Format");
          return 16;
        }
        if (!(void)v15 || *((void *)&v15 + 1) != 1)
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Code Format");
          return 32;
        }
      }
      if (a3)
      {
        uint64_t v12 = a3(v17, DWORD2(v17), v10, v11, v19, DWORD2(v19), a1, v15, DWORD2(v15), v16, DWORD2(v16), a4);
        if (v12)
        {
          uint64_t v14 = v12;
          AMFDRDecodeLogInternal(3, "%s: multiResponseCallback failed with error 0x%llX", "_AMFDRDecodeMultiResposeRecords", v12);
          return v14;
        }
      }
      long long v8 = 0uLL;
    }
    if (v9 == 1) {
      return 0;
    }
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Records must be SET Container");
    return 32;
  }
  return v7;
}

uint64_t AMFDRDecodeMetadata(unint64_t a1, unsigned int a2, uint64_t (*a3)(void, void, void, void, uint64_t), uint64_t a4)
{
  uint64_t v20 = 0;
  uint64_t v4 = 1;
  if (a1 && a2)
  {
    v17[0] = 0;
    v17[1] = 0;
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    unint64_t v18 = a1;
    uint64_t v19 = a2;
    if (DERDecodeSeqInit((uint64_t)&v18, &v20, v17))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response Metadata");
      return 16;
    }
    else if (v20 == 0x2000000000000011)
    {
      long long v7 = 0uLL;
      uint64_t v4 = 16;
      while (1)
      {
        long long v12 = v7;
        long long v13 = v7;
        int v8 = DERDecodeSeqNext(v17, &v14);
        if (v8) {
          break;
        }
        if (!v16) {
          return 512;
        }
        if (v14 != 0x2000000000000010)
        {
          AMFDRDecodeLogInternal(3, "%s: MetadataRecord must be SEQUENCE Container");
          return 32;
        }
        unint64_t v18 = v15;
        uint64_t v19 = v16;
        if (DERParseSequenceContentToObject(&v18, 2u, (uint64_t)&DERFDRMetadataRecordItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Metadata Record Format");
          return 16;
        }
        if (a3)
        {
          uint64_t v9 = a3(v12, DWORD2(v12), v13, DWORD2(v13), a4);
          if (v9)
          {
            uint64_t v11 = v9;
            AMFDRDecodeLogInternal(3, "%s: metadataRecordCallback failed with error 0x%llX", "AMFDRDecodeMetadata", v9);
            return v11;
          }
        }
        long long v7 = 0uLL;
      }
      if (v8 == 1) {
        return 0;
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: Metadata must be SET Container");
      return 32;
    }
  }
  return v4;
}

uint64_t AMFDRDecodeGetImg4RawData(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = 1;
  if (a1 && a2)
  {
    if (Img4DecodeInit())
    {
      return 0x2000;
    }
    else
    {
      uint64_t v4 = 0;
      if (a3 && a4)
      {
        uint64_t v4 = 0;
        *a3 = 0xAAAAAAAAAAAAAAAALL;
        *a4 = -1431655766;
      }
    }
  }
  return v4;
}

uint64_t AMFDRDecodeGetImg4Manifest(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = 1;
  if (a1 && a2)
  {
    if (Img4DecodeInit())
    {
      AMFDRDecodeLogInternal(3, "%s: FDR failed to decode Data img4", "AMFDRDecodeGetImg4Manifest");
      return 0x2000;
    }
    else
    {
      uint64_t v4 = 0;
      if (a3 && a4)
      {
        uint64_t v4 = 0;
        *a3 = 0xAAAAAAAAAAAAAAAALL;
        *a4 = -1431655766;
      }
    }
  }
  return v4;
}

uint64_t AMFDRDecodeFDR2Data(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4, void *a5, _DWORD *a6)
{
  long long v29 = 0u;
  *(_OWORD *)long long v30 = 0u;
  long long v28 = 0u;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  memset(v33, 170, sizeof(v33));
  if (DERDecodeItem((uint64_t)&v31, v33))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR2 Format", "AMFDRDecodeFDR2Data");
    return 128;
  }
  if (v33[0] != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR2 Format unexpected tag: %llu", "AMFDRDecodeFDR2Data", v33[0]);
    return 0x4000000000000;
  }
  if (v31 + v32 < v33[1] + v33[2])
  {
    AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "AMFDRDecodeFDR2Data");
    return 4;
  }
  if (v31 + v32 > v33[1] + v33[2])
  {
    AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "AMFDRDecodeFDR2Data", v32 - v33[2]);
    return 8;
  }
  if (DERParseSequenceContentToObject(&v33[1], 3u, (uint64_t)&DERFDR2DataItemSpecs, (unint64_t)&v28, 0x30uLL, 0))return 0x8000000000000; {
  long long v12 = (unsigned __int8 *)v28;
  }
  if (!(void)v28 || *((void *)&v28 + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format, invalid fdr2Data.tag.length");
    return 0x8000000000000;
  }
  long long v13 = "fdr2";
  if (*(_DWORD *)v28 != *(_DWORD *)"fdr2") {
    goto LABEL_14;
  }
  uint64_t v10 = 512;
  if ((void)v29 && *((void *)&v29 + 1))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)&v29, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v26, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (DERFDRItemSpecs)");
      return 0x8000000000000;
    }
    long long v12 = (unsigned __int8 *)v26;
    if (!(void)v26 || *((void *)&v26 + 1) != 4)
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format, invalid tag length");
      return 0x8000000000000;
    }
    long long v13 = "fdrd";
    if (*(_DWORD *)v26 != *(_DWORD *)"fdrd")
    {
LABEL_14:
      uint64_t v14 = *v13;
      uint64_t v24 = v12[2];
      uint64_t v25 = v12[3];
      uint64_t v22 = *v12;
      uint64_t v23 = v12[1];
      uint64_t v20 = v13[2];
      uint64_t v21 = v13[3];
      uint64_t v19 = v13[1];
      unint64_t v15 = "%s: malformed FDR2 Format, expected tag %c%c%c%c found tag %c%c%c%c";
LABEL_15:
      AMFDRDecodeLogInternal(3, v15, "AMFDRDecodeFDR2Data", v14, v19, v20, v21, v22, v23, v24, v25);
      return 0x8000000000000;
    }
    uint64_t v10 = 0;
    int v17 = DWORD2(v27);
    *a3 = v27;
    *a4 = v17;
  }
  if (v30[0] && v30[1])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    if (DERParseSequenceContentToObject(v30, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v26, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (manifest2)");
      return 0x8000000000000;
    }
    if (!(void)v26 || *((void *)&v26 + 1) != 4)
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (manifest2), invalid tag length");
      return 0x8000000000000;
    }
    if (*(_DWORD *)v26 == *(_DWORD *)"mft2")
    {
      int v18 = DWORD2(v27);
      *a5 = v27;
      *a6 = v18;
      return v10;
    }
    uint64_t v14 = kFDRTagStr_mft2[0];
    uint64_t v24 = *(unsigned __int8 *)(v26 + 2);
    uint64_t v25 = *(unsigned __int8 *)(v26 + 3);
    uint64_t v22 = *(unsigned __int8 *)v26;
    uint64_t v23 = *(unsigned __int8 *)(v26 + 1);
    uint64_t v20 = kFDRTagStr_mft2[2];
    uint64_t v21 = kFDRTagStr_mft2[3];
    uint64_t v19 = kFDRTagStr_mft2[1];
    unint64_t v15 = "%s: malformed FDR2 Format (manifest2), expected tag %c%c%c%c found tag %c%c%c%c";
    goto LABEL_15;
  }
  return v10;
}

uint64_t AMFDRDecodeOfflineBlob(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4, void *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  memset(v21, 170, sizeof(v21));
  v20[0] = 0xAAAAAAAAAAAAAAAALL;
  v20[1] = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = a1;
  v22[1] = a2;
  if (DERDecodeSeqInit((uint64_t)v22, v21, v20))
  {
    uint64_t v14 = "%s: failed to decode offline blob Format";
  }
  else if (DERDecodeSeqNext(v20, &v21[1]))
  {
    uint64_t v14 = "%s: failed to get CSR from offline blob";
  }
  else
  {
    if (v21[1] != 2) {
      goto LABEL_16;
    }
    int v17 = v21[3];
    *a3 = v21[2];
    *a4 = v17;
    if (DERDecodeSeqNext(v20, &v21[1]))
    {
      uint64_t v14 = "%s: failed to get CSR signature from offline blob";
      goto LABEL_5;
    }
    if (v21[1] != 2) {
      goto LABEL_16;
    }
    int v18 = v21[3];
    *a5 = v21[2];
    *a6 = v18;
    if (DERDecodeSeqNext(v20, &v21[1]))
    {
      uint64_t v14 = "%s: failed to get attestation from offline blob";
      goto LABEL_5;
    }
    if (v21[1] != 2)
    {
LABEL_16:
      uint64_t v15 = 32;
      AMFDRDecodeLogInternal(3, "%s: malformed offline blob");
      return v15;
    }
    int v19 = v21[3];
    *a7 = v21[2];
    *a8 = v19;
    if (DERDecodeSeqNext(v20, &v21[1]) == 1) {
      return 0;
    }
    uint64_t v14 = "%s: unexepcted items in offline blob";
  }
LABEL_5:
  uint64_t v15 = 16;
  AMFDRDecodeLogInternal(3, v14, "AMFDRDecodeOfflineBlob");
  return v15;
}

uint64_t AMFDRDecodeTrustEvaluation(uint64_t *a1, void *a2, _DWORD *a3)
{
  uint64_t v6 = malloc(0x7F8uLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    bzero(v6, 0x7F8uLL);
    if (a1)
    {
      uint64_t v8 = *a1;
      if (*a1 && (uint64_t v9 = *((unsigned int *)a1 + 2), v9))
      {
        if (a2 && a3)
        {
          uint64_t v10 = a1[18];
          if ((v10 & 0x801) != 0)
          {
            *(void *)(v7 + 8) = v8;
            *(void *)(v7 + 16) = v9;
          }
          else
          {
            *(void *)(v7 + 1944) = a1[2];
            *(void *)(v7 + 1952) = *((unsigned int *)a1 + 6);
            *(void *)(v7 + 24) = v8;
            *(void *)(v7 + 32) = v9;
            uint64_t v13 = *((unsigned int *)a1 + 10);
            *(void *)(v7 + 280) = a1[4];
            *(void *)(v7 + 288) = v13;
          }
          uint64_t v14 = *((unsigned int *)a1 + 14);
          *(void *)(v7 + 72) = a1[6];
          *(void *)(v7 + 80) = v14;
          uint64_t v15 = *((unsigned int *)a1 + 18);
          *(void *)(v7 + 88) = a1[8];
          *(void *)(v7 + 96) = v15;
          if ((v10 & 0x80) != 0)
          {
            uint64_t v18 = a1[12];
            uint64_t v19 = *((unsigned int *)a1 + 26);
            uint64_t v16 = v18;
            uint64_t v17 = v19;
          }
          else
          {
            uint64_t v16 = a1[10];
            uint64_t v17 = *((unsigned int *)a1 + 22);
            uint64_t v18 = a1[12];
            uint64_t v19 = *((unsigned int *)a1 + 26);
          }
          *(void *)(v7 + 104) = v16;
          *(void *)(v7 + 112) = v17;
          uint64_t v20 = *((unsigned int *)a1 + 34);
          *(void *)(v7 + 216) = a1[16];
          *(void *)(v7 + 224) = v20;
          uint64_t v21 = *((unsigned int *)a1 + 66);
          *(void *)(v7 + 232) = a1[32];
          *(void *)(v7 + 240) = v21;
          *(void *)(v7 + 136) = v18;
          *(void *)(v7 + 144) = v19;
          uint64_t v22 = a1[14];
          uint64_t v23 = *((unsigned int *)a1 + 30);
          *(void *)(v7 + 168) = v22;
          *(void *)(v7 + 176) = v23;
          uint64_t v24 = a1[26];
          if (v24 && (uint64_t v25 = *((unsigned int *)a1 + 54), v25))
          {
            *(void *)(v7 + 184) = v24;
            uint64_t v23 = v25;
          }
          else
          {
            *(void *)(v7 + 184) = v22;
          }
          *(void *)(v7 + 192) = v23;
          *(void *)(v7 + 2016) = v10;
          if (v22) {
            BOOL v26 = 1;
          }
          else {
            BOOL v26 = v14 == 48;
          }
          BOOL v27 = !v26 && (v10 & 0x20) == 0;
          long long v28 = kAMFDRDecodeImplementationSha1;
          if (!v27) {
            long long v28 = kAMFDRDecodeImplementationSha384;
          }
          *(void *)(v7 + 2008) = v28;
          if ((v10 & 0x100) != 0)
          {
            *(void *)(v7 + 2008) = kAMFDRDecodeImplementationSha384;
            uint64_t v29 = *((unsigned int *)a1 + 58);
            *(void *)(v7 + 152) = a1[28];
            *(void *)(v7 + 160) = v29;
          }
          if ((v10 & 0x1000) != 0)
          {
            uint64_t v30 = *((unsigned int *)a1 + 62);
            *(void *)(v7 + 120) = a1[30];
            *(void *)(v7 + 128) = v30;
          }
          *(void *)(v7 + 2024) = a1[19];
          uint64_t v31 = a1[34];
          if (v31)
          {
            int v32 = *((_DWORD *)a1 + 70);
            if (v32)
            {
              *(void *)(v7 + 344) = v31;
              *(_DWORD *)(v7 + 352) = v32;
            }
          }
          uint64_t v33 = AMFDRDecodeEvaluateTrustInternal(v7);
          *a2 = *(void *)(v7 + 1912);
          *a3 = *(void *)(v7 + 1920);
          if (*(unsigned char *)(v7 + 2032))
          {
            long long v34 = *(_OWORD *)(v7 + 744);
            *((_OWORD *)a1 + 10) = *(_OWORD *)(v7 + 728);
            *((_OWORD *)a1 + 11) = v34;
            *((_OWORD *)a1 + 12) = *(_OWORD *)(v7 + 760);
          }
          if (v33) {
            unint64_t v11 = _AMFDRDecodeTolerateErrorsForOptions(a1[18], v33);
          }
          else {
            unint64_t v11 = 0;
          }
          goto LABEL_14;
        }
        AMFDRDecodeLogInternal(3, "%s: outRawData and outRawDataLength must be non NULL");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: ctx->inData must be non NULL and ctx->inDataLength must be non 0");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: ctx must be non NULL");
    }
    unint64_t v11 = 1;
LABEL_14:
    free((void *)v7);
    return v11;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeTrustEvaluation");
  return 0x80000000000000;
}

uint64_t AMFDRDecodeMetaProperty(uint64_t a1, unsigned int a2, uint64_t (*a3)(void))
{
  uint64_t v3 = 1;
  if (a1 && a2)
  {
    v14[0] = 0;
    v14[1] = 0;
    long long v13 = 0uLL;
    unint64_t v12 = 0;
    *(void *)&long long v15 = a1;
    *((void *)&v15 + 1) = a2;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14)
      || DERDecodeSeqNext(v14, &v12))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR property meta");
      return 16;
    }
    long long v15 = v13;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14)
      || DERDecodeSeqNext(v14, &v12))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse MinimalManifestMetaData");
      return 16;
    }
    long long v15 = v13;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)&v15, 2u, (uint64_t)&DERFDRMetaPropertyItemSpecs, (unint64_t)&v10, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed metaProperty Format");
      return 16;
    }
    long long v15 = v11;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse content of MinimalManifestMetaData");
      return 16;
    }
    uint64_t v3 = 34;
    while (1)
    {
      int v6 = DERDecodeSeqNext(v14, &v12);
      if (v6) {
        break;
      }
      if (!*((void *)&v13 + 1)) {
        return 512;
      }
      if (a3)
      {
        if (!(void)v10
          || *((void *)&v10 + 1) != 16
          || (*(void *)v10 == 0x2D6C616D696E696DLL ? (BOOL v7 = *(void *)(v10 + 8) == 0x74736566696E616DLL) : (BOOL v7 = 0),
              !v7))
        {
          AMFDRDecodeLogInternal(3, "%s: unsupported meta property type", "AMFDRDecodeMetaProperty");
          return v3;
        }
        uint64_t v8 = a3(0);
        uint64_t v3 = 32;
        if (v8)
        {
          uint64_t v9 = v8;
          AMFDRDecodeLogInternal(3, "%s: metaPropertyCallback failed with error 0x%llX", "AMFDRDecodeMetaProperty", v8);
          return v9;
        }
      }
    }
    if (v6 == 1) {
      return 0;
    }
    else {
      return 16;
    }
  }
  return v3;
}

uint64_t AMFDRDecodeManifestBody(void *a1)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v8 = v2;
  *(_OWORD *)&v8[16] = v2;
  long long v7 = v2;
  memset(v6, 170, sizeof(v6));
  int v5 = 0;
  uint64_t v3 = (char *)malloc(0x1D8uLL);
  *a1 = v3;
  if (Img4DecodeInitManifest())
  {
    AMFDRDecodeLogInternal(3, "%s: can't decode manifest from Img4DecodeInitManifest, but it might be multi-manifest");
    return 2;
  }
  if (DERDecodeItem((uint64_t)(v3 + 280), v6))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
    return 2;
  }
  if (v6[0] != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
    return 2;
  }
  if (DERParseInteger((char **)v3 + 33, &v5))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
    return 2;
  }
  if (DERImg4DecodeFindProperty())
  {
    AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
    return 2;
  }
  *(_OWORD *)(v3 + 56) = *(_OWORD *)&v8[8];
  if (DERDecodeSeqContentInit((unint64_t *)v3 + 7, (unint64_t *)v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
    return 2;
  }
  return 0;
}

uint64_t AMFDRDecodeManifestBodyNext(unint64_t **a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  long long v12 = 0uLL;
  unint64_t v11 = 0;
  int v5 = *a1;
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  int v6 = DERDecodeSeqNext(v5, &v11);
  if (v6 == 1) {
    return 0x40000000000000;
  }
  if (v6)
  {
    uint64_t v9 = "%s: can't parse DERDecodeSeqNext";
LABEL_13:
    uint64_t v10 = 3;
    goto LABEL_15;
  }
  Objectuint64_t PropertyData = Img4DecodeGetObjectPropertyData();
  if (ObjectPropertyData == 1) {
    return 0;
  }
  if (ObjectPropertyData)
  {
    uint64_t v9 = "%s: Img4DecodeGetObjectPropertyData failed";
    goto LABEL_13;
  }
  if (DERImg4DecodePropertyWithItem())
  {
    uint64_t v9 = "%s: DERImg4DecodePropertyWithItem failed";
    goto LABEL_13;
  }
  if (!Img4DecodeEvaluateDictionaryProperties()) {
    return 0;
  }
  uint64_t v9 = "%s: failed to find corresponding data instance";
  uint64_t v10 = 5;
LABEL_15:
  AMFDRDecodeLogInternal(v10, v9, "AMFDRDecodeManifestBodyNext");
  return 2;
}

uint64_t _AMFDRDecodeGetDataInstCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    if (a1 == 1768846196)
    {
      uint64_t PropertyData = Img4DecodeGetPropertyData();
      if (PropertyData) {
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.");
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t PropertyData = 6;
    AMFDRDecodeLogInternal(3, "%s: context is NULL");
  }
  return PropertyData;
}

uint64_t AMFDRDecodeManifestBodyDestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
  return 0;
}

void AMFDRDecodeIterateSysconfigDestroy(void **a1)
{
  if (a1)
  {
    long long v2 = *a1;
    if (v2)
    {
      free(v2);
      *a1 = 0;
    }
  }
}

uint64_t AMFDRDecodeIterateSysconfigBegin(uint64_t a1, unsigned int a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = 0;
  uint64_t v4 = 1;
  if (!a1) {
    return v4;
  }
  if (!a2) {
    return v4;
  }
  if (!a3) {
    return v4;
  }
  long long v7 = a4;
  if (!a4) {
    return v4;
  }
  uint64_t v9 = (void *)*a3;
  uint64_t v10 = (void *)*a3;
  if (!*a3)
  {
    uint64_t v10 = malloc(0x78uLL);
    if (!v10) {
      return 0x80000000000000;
    }
  }
  v10[14] = 0;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *(_OWORD *)uint64_t v10 = 0u;
  v17[0] = a1;
  v17[1] = a2;
  int v11 = DERParseSequenceToObject((uint64_t)v17, 5u, (uint64_t)&DERSysconfigItemSpecs, (unint64_t)(v10 + 1), 0x50uLL, 0);
  if (v11)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse sysconfig sequence: %d", "AMFDRDecodeIterateSysconfigBegin", v11);
    uint64_t v4 = 0x400000000000000;
    goto LABEL_32;
  }
  uint64_t v12 = v10[2];
  if (v12 != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: magic size is invalid: %lu", "AMFDRDecodeIterateSysconfigBegin", v12);
    uint64_t v4 = 0x400000000000020;
    goto LABEL_32;
  }
  for (uint64_t i = 3; i != -1; --i)
    *v7++ = *(unsigned char *)(v10[1] + i);
  if (v10[4] != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: version size is invalid: %lu");
    goto LABEL_25;
  }
  int v14 = *(_DWORD *)v10[3];
  if (!(_BYTE)v14)
  {
    AMFDRDecodeLogInternal(3, "%s: minor version not supported: 0x%x");
    goto LABEL_25;
  }
  if ((v14 & 0xFFFF00) != 0x30000)
  {
    AMFDRDecodeLogInternal(3, "%s: sysconfig version not supported: 0x%x");
LABEL_25:
    uint64_t v4 = 0x402000000000000;
    goto LABEL_32;
  }
  if (DERDecodeSeqInit((uint64_t)(v10 + 5), &v16, v10 + 11))
  {
    uint64_t v4 = 0x400000000000010;
    AMFDRDecodeLogInternal(3, "%s: failed to decode sysconfig payload: %d");
    goto LABEL_32;
  }
  if (v16 != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: invalid payload tag: 0x%llx");
LABEL_31:
    uint64_t v4 = 0x400000000000040;
    goto LABEL_32;
  }
  if (!DERDecodeSeqInit((uint64_t)(v10 + 7), &v16, v10 + 13))
  {
    if (v16 == 0x2000000000000011)
    {
      uint64_t v4 = 0;
      *(unsigned char *)uint64_t v10 = 1;
      *a3 = v10;
      return v4;
    }
    AMFDRDecodeLogInternal(3, "%s: invalid metadata tag: 0x%llx");
    goto LABEL_31;
  }
  uint64_t v4 = 0x400000000000010;
  AMFDRDecodeLogInternal(3, "%s: failed to decode sysconfig metadata: %d");
LABEL_32:
  if (!v9) {
    free(v10);
  }
  return v4;
}

uint64_t AMFDRDecodeIterateSysconfigPayloadNext(uint64_t a1, unsigned char *a2, unsigned char *a3, void *a4, _DWORD *a5, unsigned char *a6)
{
  unint64_t v24 = 0;
  v25[0] = 0;
  v25[1] = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  memset(v20, 0, sizeof(v20));
  uint64_t v6 = 1;
  BOOL v19 = 0;
  if (!a3) {
    return v6;
  }
  if (!a1) {
    return v6;
  }
  long long v7 = a2;
  if (!a2 || !a4 || !a5) {
    return v6;
  }
  if (!*(unsigned char *)a1)
  {
    AMFDRDecodeLogInternal(3, "%s: sysconfig context is not initialized");
    return 0x400000000000000;
  }
  int v12 = DERDecodeSeqNext((unint64_t *)(a1 + 88), &v24);
  if (v12 == 1) {
    return 0x40000000000000;
  }
  if (v12 || v24 != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode payload: %d", "AMFDRDecodeIterateSysconfigPayloadNext", v12);
    return 0x400000000000040;
  }
  int v13 = DERParseSequenceContentToObject(v25, 5u, (uint64_t)&DERSysconfigPayloadItemSpecs, (unint64_t)v20, 0x50uLL, 0);
  if (v13)
  {
    uint64_t v6 = 0x400000000000010;
    AMFDRDecodeLogInternal(3, "%s: failed to parse payload content: %d", "AMFDRDecodeIterateSysconfigPayloadNext", v13);
    return v6;
  }
  if (*((void *)&v20[0] + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: invalid key length: %lu", "AMFDRDecodeIterateSysconfigPayloadNext", *((void *)&v20[0] + 1));
    return 0x400000000000020;
  }
  uint64_t v14 = *(void *)&v20[0];
  for (uint64_t i = 3; i != -1; --i)
    *v7++ = *(unsigned char *)(v14 + i);
  if (DERParseBooleanWithDefault((unsigned __int8 **)&v23, 0, &v19))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse BOOLean: %d");
    return 0x400000000000000;
  }
  if (v19)
  {
    uint64_t v6 = 0;
    *a3 = 1;
  }
  else
  {
    int v17 = DWORD2(v22);
    if (*((void *)&v22 + 1))
    {
      *a4 = v22;
      *a5 = v17;
      uint64_t v6 = 0;
      if (a6) {
        *a6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
      int v18 = DWORD2(v21);
      *a4 = v21;
      *a5 = v18;
    }
  }
  return v6;
}

_OWORD *AMFDRDecodeCreateCertificate()
{
  v0 = malloc(0x130uLL);
  v1 = v0;
  if (v0)
  {
    v0[17] = 0u;
    v0[18] = 0u;
    v0[15] = 0u;
    v0[16] = 0u;
    v0[13] = 0u;
    v0[14] = 0u;
    v0[11] = 0u;
    v0[12] = 0u;
    v0[9] = 0u;
    v0[10] = 0u;
    v0[7] = 0u;
    v0[8] = 0u;
    v0[5] = 0u;
    v0[6] = 0u;
    v0[3] = 0u;
    v0[4] = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    _OWORD *v0 = 0u;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc empty certificate", "AMFDRDecodeCreateCertificate");
  }
  return v1;
}

void AMFDRDecodeDestoryCertificate(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t AMFDRDecodeGetTbsCertSubject(uint64_t a1)
{
  if (a1) {
    return a1 + 128;
  }
  else {
    return 0;
  }
}

uint64_t AMFDRDecodeGetTbsCertExtensions(uint64_t a1)
{
  if (a1) {
    return a1 + 192;
  }
  else {
    return 0;
  }
}

uint64_t AMFDRDecodeGetPubkey(uint64_t a1)
{
  if (a1) {
    return a1 + 208;
  }
  else {
    return 0;
  }
}

uint64_t AMFDRDecodeGetRawCertificate(uint64_t a1)
{
  if (a1) {
    return a1 + 256;
  }
  else {
    return 0;
  }
}

void *AMFDRDecodeCreateCertificateChain()
{
  v0 = malloc(0x18uLL);
  v1 = v0;
  if (v0)
  {
    void *v0 = 0;
    v0[1] = 0;
    v0[2] = 0;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc empty certificate chain", "AMFDRDecodeCreateCertificateChain");
  }
  return v1;
}

void AMFDRDecodeDestoryCertificateChain(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t _AMFDRDecodeVerifyTrustObject(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1944);
  if (!v2)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Trust Object is NULL", "_AMFDRDecodeVerifyTrustObject");
    uint64_t v4 = 0x200000;
    goto LABEL_5;
  }
  uint64_t v3 = AMFDRDecodeTrustObject(a1 + 1768, v2, *(_DWORD *)(a1 + 1952));
  if (!v3)
  {
    if (!*(void *)(a1 + 72))
    {
      AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest is NULL", "_AMFDRDecodeVerifyTrustObject");
      uint64_t v4 = 0x40000;
      goto LABEL_5;
    }
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s2[1] = v6;
    __s2[2] = v6;
    __s2[0] = v6;
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7 == 48)
    {
      if (AMSupportDigestSha384())
      {
LABEL_11:
        AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha256 failed");
LABEL_16:
        uint64_t v4 = 0x100000;
        goto LABEL_5;
      }
    }
    else
    {
      if (v7 != 32)
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest size not supported. digest is of size %zu", "_AMFDRDecodeVerifyTrustObject", v7);
        uint64_t v4 = 0x80000;
        goto LABEL_5;
      }
      if (AMSupportDigestSha256()) {
        goto LABEL_11;
      }
    }
    if (!memcmp(*(const void **)(a1 + 72), __s2, *(void *)(a1 + 80))) {
      return 0;
    }
    AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest mismatch.");
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Format", "_AMFDRDecodeVerifyTrustObject");
LABEL_5:
  *(void *)a1 |= v4;
  return v4;
}

uint64_t _AMFDRDecodeVerifySealingManifestCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 <= 1717660002)
  {
    switch(a1)
    {
      case 1145525076:
        if (Img4DecodeGetPropertyData())
        {
          uint64_t v5 = 3;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
          uint64_t v6 = *(void *)a4 | 0x80000000;
          goto LABEL_35;
        }
        uint64_t v5 = 0;
        *(void *)(a4 + 1992) = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)(a4 + 2000) = 0;
        return v5;
      case 1400000109:
        return 0;
      case 1668047219:
        if (Img4DecodeGetPropertyData())
        {
          uint64_t v5 = 3;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
          uint64_t v6 = *(void *)a4 | 0x20000000;
LABEL_35:
          *(void *)a4 = v6;
          return v5;
        }
        uint64_t v5 = 0;
        *(void *)(a4 + 1960) = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)(a4 + 1968) = 0;
        return v5;
    }
LABEL_18:
    uint64_t v7 = 1;
    while (v7 != 48)
    {
      int v8 = kFDRKnownTag[v7++];
      if (v8 == a1)
      {
        if ((unint64_t)(v7 - 2) < 0x2F) {
          return 0;
        }
        break;
      }
    }
    AMFDRDecodeLogInternal(7, "%s: Unsupported tag found in manifest '%c%c%c%c'", "_AMFDRDecodeVerifySealingManifestCallback", (a1 >> 24), (a1 << 8 >> 24), ((__int16)a1 >> 8), (char)a1);
    return 0;
  }
  if (a1 == 1717660003)
  {
    if (Img4DecodeGetPropertyBoolean())
    {
      uint64_t v5 = 3;
      AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
      uint64_t v6 = *(void *)a4 | 0x400000000;
      goto LABEL_35;
    }
    uint64_t v5 = 0;
    *(unsigned char *)(a4 + 2004) = 0;
    return v5;
  }
  if (a1 == 1768846196)
  {
    if (Img4DecodeGetPropertyData())
    {
      AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)a4 | 0x40000000;
      goto LABEL_35;
    }
    uint64_t v5 = 0;
    *(void *)(a4 + 1976) = 0xAAAAAAAAAAAAAAAALL;
    *(_DWORD *)(a4 + 1984) = 0;
    return v5;
  }
  if (a1 != 1886546276) {
    goto LABEL_18;
  }
  if (Img4DecodeGetPropertyData())
  {
    uint64_t v5 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_prid) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
    uint64_t v6 = *(void *)a4 | 0x2000;
    goto LABEL_35;
  }
  *(void *)(a4 + 200) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a4 + 208) = 0;
  if (!*(void *)(a4 + 1944) || !*(void *)(a4 + 1952))
  {
    AMFDRDecodeLogInternal(4, "%s: Skipping revocation check (trustobject unset)", "_AMFDRDecodeVerifySealingManifestCallback");
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)a4 | 0x200000;
    goto LABEL_35;
  }
  uint64_t v9 = AMFDRDecodeCheckProducerIDRevocation(a4 + 1768, 0xAAAAAAAAAAAAAAAALL, 0);
  uint64_t v5 = v9;
  if (v9)
  {
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeCheckProducerIDRevocation failed with error 0x%016llX", "_AMFDRDecodeVerifySealingManifestCallback", v9);
    *(void *)a4 |= v5;
    if ((v5 & 0xFFFFFFFFBFFFFFFFLL) != 0) {
      return 3;
    }
    else {
      return 0;
    }
  }
  return v5;
}

uint64_t _AMFDRDecodeVerifySealingRequestCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 1;
  }
  if (a1 <= 1668047218)
  {
    if (a1 != 1145525076)
    {
      if (a1 != 1400000109)
      {
LABEL_12:
        uint64_t v8 = 1;
        while (v8 != 48)
        {
          int v9 = kFDRKnownTag[v8++];
          if (v9 == a1)
          {
            if ((unint64_t)(v8 - 2) < 0x2F) {
              return 0;
            }
            break;
          }
        }
        AMFDRDecodeLogInternal(7, "%s: Unsupported tag found in manifest '%c%c%c%c'", "_AMFDRDecodeVerifySealingRequestCallback", (a1 >> 24), (a1 << 8 >> 24), ((__int16)a1 >> 8), (char)a1);
      }
      return 0;
    }
    if (Img4DecodeGetPropertyData())
    {
      int v11 = "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.";
    }
    else if (*(unsigned char *)(a4 + 1312))
    {
      if (**(void **)(*(void *)(a4 + 2008) + 32))
      {
        int v11 = "%s: propertyLength != AMFDRDigestSize";
      }
      else
      {
        if (!memcmp(0, (const void *)(a4 + 1496), 0)) {
          return 0;
        }
        int v11 = "%s: propertyValue != fdrDecode->sealingManifestImg4.payload.hash";
      }
    }
    else
    {
      int v11 = "%s: fdrDecode->sealingRequestImg4.payload_hashed is false";
    }
    uint64_t v6 = 3;
    AMFDRDecodeLogInternal(3, v11, "_AMFDRDecodeVerifySealingRequestCallback");
    uint64_t v7 = *(void *)a4 | 0x4000000000;
    goto LABEL_36;
  }
  if (a1 == 1668047219)
  {
    if (Img4DecodeGetPropertyData()) {
      uint64_t v10 = "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.";
    }
    else {
      uint64_t v10 = "%s: propertyLength != kImg4TagSize";
    }
    uint64_t v6 = 3;
    AMFDRDecodeLogInternal(3, v10, "_AMFDRDecodeVerifySealingRequestCallback");
    uint64_t v7 = *(void *)a4 | 0x1000000000;
    goto LABEL_36;
  }
  if (a1 != 1717660003)
  {
    if (a1 == 1768846196)
    {
      if (Img4DecodeGetPropertyData())
      {
        uint64_t v5 = "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.";
LABEL_8:
        uint64_t v6 = 3;
        AMFDRDecodeLogInternal(3, v5, "_AMFDRDecodeVerifySealingRequestCallback");
        uint64_t v7 = *(void *)a4 | 0x2000000000;
LABEL_36:
        *(void *)a4 = v7;
        return v6;
      }
      uint64_t v12 = *(void *)(a4 + 144);
      if (v12)
      {
        uint64_t v6 = 3;
        AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst propertyLength (%d) != fdrDecode->manifestUniqueID.length (%zu)", "_AMFDRDecodeVerifySealingRequestCallback", 0, v12);
        uint64_t v7 = *(void *)a4 | 0x40000000;
        goto LABEL_36;
      }
      if (memcmp(0, *(const void **)(a4 + 136), 0))
      {
        uint64_t v5 = "%s: kFDRTag_inst propertyValue != fdrDecode->manifestUniqueID.data";
        goto LABEL_8;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (Img4DecodeGetPropertyBoolean())
  {
    uint64_t v6 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifySealingRequestCallback");
    uint64_t v7 = *(void *)a4 | 0x400000000;
    goto LABEL_36;
  }
  uint64_t v6 = 0;
  *(unsigned char *)(a4 + 2004) = 0;
  return v6;
}

uint64_t _AMFDRDecodeFilterDataInstanceCallback(int a1, uint64_t a2, int a3, _WORD *a4)
{
  if (!*(void *)a4)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeFilterDataInstanceCallback");
    return 6;
  }
  if (!a2)
  {
    AMFDRDecodeLogInternal(3, "%s: property is NULL", "_AMFDRDecodeFilterDataInstanceCallback");
    **(void **)a4 |= 1uLL;
    return 6;
  }
  if (a1 != 1768846196) {
    return 0;
  }
  uint64_t PropertyData = Img4DecodeGetPropertyData();
  if (PropertyData)
  {
    uint64_t v7 = PropertyData;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeFilterDataInstanceCallback");
    **(void **)a4 |= 0x4000uLL;
    return v7;
  }
  if (a3 != 1)
  {
    AMFDRDecodeLogInternal(3, "%s: unexpected property type != kImg4ObjectProperty", "_AMFDRDecodeFilterDataInstanceCallback");
    return 0;
  }
  if (_AMFDRDecodeInstPropertyMatchingWithType((_DWORD *)0xAAAAAAAAAAAAAAAALL, 0, *(void **)(*(void *)a4 + 104), *(void *)(*(void *)a4 + 112), *(const void **)(*(void *)a4 + 184), *(void *)(*(void *)a4 + 192), 1, *(void **)a4))
  {
    AMFDRDecodeLogInternal(6, "%s: kFDRTag_inst property == fdrDecode->uniqueID, found corresponding Data Instance.", "_AMFDRDecodeFilterDataInstanceCallback");
    uint64_t v7 = 0;
    a4[4] = 1;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->uniqueID", "_AMFDRDecodeFilterDataInstanceCallback");
    uint64_t v7 = 0;
    a4[4] = 256;
  }
  return v7;
}

uint64_t _AMFDRDecodeInstPropertyMatchingWithType(_DWORD *a1, uint64_t a2, void *__s2, size_t __n, const void *a5, size_t a6, int a7, void *a8)
{
  if (a8)
  {
    uint64_t v11 = a8[252];
    if ((v11 & 0x100) != 0 && a8[19] && a8[20] && (!a7 || (v11 & 0x80) != 0))
    {
      a6 = 0;
      a5 = 0;
      unsigned int __n = a8[20];
      __s2 = (void *)a8[19];
    }
  }
  if (a2 < 5 || *a1 != 762014067)
  {
    if (__n != a2)
    {
      uint64_t v17 = a2;
      size_t v18 = __n;
      uint64_t v12 = "%s: kFDRTag_inst propertyLength (%d) != instLength (%zu)";
      goto LABEL_14;
    }
    if (memcmp(a1, __s2, __n))
    {
      uint64_t v12 = "%s: kFDRTag_inst propertyValue != instValue";
LABEL_14:
      uint64_t v13 = 4;
LABEL_20:
      AMFDRDecodeLogInternal(v13, v12, "_AMFDRDecodeInstPropertyMatching", v17, v18);
      return 0;
    }
    return 1;
  }
  size_t v14 = (a2 - 4);
  if (__n >= v14)
  {
    uint64_t v17 = (a2 - 4);
    size_t v18 = __n;
    uint64_t v12 = "%s: kFDRTag_inst propertyLength (sik) (%d) <= instLength (%zu)";
    goto LABEL_19;
  }
  long long v15 = a1 + 1;
  if (memcmp(a1 + 1, __s2, __n))
  {
    uint64_t v12 = "%s: kFDRTag_inst propertyValue (sik) != instValue";
    goto LABEL_19;
  }
  if (*((unsigned char *)v15 + __n) != 45)
  {
    uint64_t v12 = "%s: kFDRTag_inst propertyValue missing expected -";
    goto LABEL_19;
  }
  uint64_t result = 1;
  if (a6 && a5)
  {
    if (a6 == v14 + ~__n)
    {
      if (!memcmp((char *)v15 + __n + 1, a5, a6)) {
        return 1;
      }
      uint64_t v12 = "%s: kFDRTag_inst propertyValue (sik) != sikValue";
    }
    else
    {
      uint64_t v17 = (v14 + ~__n);
      size_t v18 = a6;
      uint64_t v12 = "%s: kFDRTag_inst propertyLength (sik) (%d) != sikLength (%zu)";
    }
LABEL_19:
    uint64_t v13 = 3;
    goto LABEL_20;
  }
  return result;
}

uint64_t _AMFDRDecodeSearchEntryFromPropertyList(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v15[0] = a1;
  v15[1] = a2;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v9 = v6;
  long long v10 = v6;
  uint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v12[0] = 0;
  v12[1] = 0;
  unint64_t v11 = 0;
  if (DERDecodeSeqInit((uint64_t)v15, &v14, v13) || v14 != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse property list");
    return 2;
  }
  if (DERDecodeSeqNext(v13, &v11))
  {
LABEL_8:
    AMFDRDecodeLogInternal(3, "%s: cannot find tag in property list");
    return 2;
  }
  while (1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    if (DERParseSequenceContentToObject(v12, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v9, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode subCC digests sequence");
      return 2;
    }
    if (*((void *)&v9 + 1) == 4 && AMFDRTagsStringToTag((unsigned int *)v9) == a3) {
      break;
    }
    if (DERDecodeSeqNext(v13, &v11)) {
      goto LABEL_8;
    }
  }
  if (a4)
  {
    uint64_t result = 0;
    uint64_t v8 = *((void *)&v10 + 1);
    *a4 = v10;
    a4[1] = v8;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: outValue is NULL", "_AMFDRDecodeSearchEntryFromPropertyList");
    return 1;
  }
  return result;
}

uint64_t _AMFDRDecodeVerifyData(uint64_t *a1)
{
  int v23 = 0;
  uint64_t v2 = a1[252];
  if ((~*((_DWORD *)a1 + 504) & 0x1080) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: cannot set kAMFDRDecodeOptionManifestOnly and kAMFDRDecodeOptionSubCCOnly at the same time");
    goto LABEL_68;
  }
  if ((v2 & 0x80) != 0)
  {
    if (!Img4DecodeInitManifest()) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  if ((v2 & 0x1000) == 0)
  {
    if (!Img4DecodeInit())
    {
LABEL_5:
      uint64_t v2 = a1[252];
      goto LABEL_9;
    }
LABEL_7:
    AMFDRDecodeLogInternal(3, "%s: FDR failed to decode Data img4");
LABEL_18:
    uint64_t v6 = *a1;
    uint64_t v7 = 83901440;
LABEL_19:
    uint64_t result = v6 | v7;
    *a1 = v6 | v7;
    uint64_t v9 = a1[4];
    a1[239] = a1[3];
    a1[240] = v9;
    return result;
  }
  a1[106] = 0;
  *((_OWORD *)a1 + 51) = 0u;
  *((_OWORD *)a1 + 52) = 0u;
  *((_OWORD *)a1 + 49) = 0u;
  *((_OWORD *)a1 + 50) = 0u;
  *((_OWORD *)a1 + 47) = 0u;
  *((_OWORD *)a1 + 48) = 0u;
  *((_OWORD *)a1 + 45) = 0u;
  *((_OWORD *)a1 + 46) = 0u;
  *((_OWORD *)a1 + 43) = 0u;
  *((_OWORD *)a1 + 44) = 0u;
  *((_OWORD *)a1 + 41) = 0u;
  *((_OWORD *)a1 + 42) = 0u;
  *((_OWORD *)a1 + 39) = 0u;
  *((_OWORD *)a1 + 40) = 0u;
  *((_OWORD *)a1 + 37) = 0u;
  *((_OWORD *)a1 + 38) = 0u;
  *((_OWORD *)a1 + 35) = 0u;
  *((_OWORD *)a1 + 36) = 0u;
  *((_OWORD *)a1 + 33) = 0u;
  *((_OWORD *)a1 + 34) = 0u;
  *((_OWORD *)a1 + 31) = 0u;
  *((_OWORD *)a1 + 32) = 0u;
  *((_OWORD *)a1 + 29) = 0u;
  *((_OWORD *)a1 + 30) = 0u;
  *((_OWORD *)a1 + 27) = 0u;
  *((_OWORD *)a1 + 28) = 0u;
  *((_OWORD *)a1 + 25) = 0u;
  *((_OWORD *)a1 + 26) = 0u;
  a1[51] = v3;
  a1[52] = v4;
  a1[61] = (uint64_t)"IM4P";
  a1[62] = 4;
  a1[67] = v3;
  a1[68] = v4;
LABEL_9:
  uint64_t v5 = a1[35];
  if ((v2 & 0x1000) != 0)
  {
    if (v5) {
      goto LABEL_16;
    }
    AMFDRDecodeLogInternal(3, "%s: trust evaluation on subCC requires a reStitchManifest");
LABEL_68:
    uint64_t result = *a1 | 1;
    goto LABEL_36;
  }
  if (!v5)
  {
    if ((v2 & 0x1000) == 0) {
      goto LABEL_12;
    }
LABEL_21:
    int v23 = AMFDRTagsStringToTag((unsigned int *)a1[11]);
    goto LABEL_22;
  }
LABEL_16:
  *(_OWORD *)(a1 + 53) = *(_OWORD *)(a1 + 35);
  if (DERImg4DecodeManifest())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to decode manifestOverride");
    goto LABEL_18;
  }
  uint64_t v2 = a1[252];
  if ((v2 & 0x1000) != 0) {
    goto LABEL_21;
  }
LABEL_12:
  if ((v2 & 0x80) == 0)
  {
    if (Img4DecodeGetPayloadType())
    {
      AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload type");
      goto LABEL_18;
    }
    if (a1[66] != 3)
    {
      AMFDRDecodeLogInternal(3, "%s: Payload version is wrong size. got %zu expected %d");
      goto LABEL_50;
    }
    uint64_t v16 = (unsigned __int16 *)a1[65];
    int v17 = *v16;
    int v18 = *((unsigned __int8 *)v16 + 2);
    if (v17 != 11825 || v18 != 48)
    {
      AMFDRDecodeLogInternal(3, "%s: Payload version mismatch");
LABEL_50:
      uint64_t v6 = *a1;
      uint64_t v7 = 0x8005001C00;
      goto LABEL_19;
    }
  }
LABEL_22:
  long long v10 = (unsigned int *)a1[11];
  if (!v10) {
    goto LABEL_25;
  }
  if ((unint64_t)(a1[12] - 3) >= 2)
  {
    AMFDRDecodeLogInternal(3, "%s: Invalid data class length");
LABEL_35:
    uint64_t result = *a1 | 0x100000004000C00;
LABEL_36:
    *a1 = result;
    return result;
  }
  if (AMFDRTagsStringToTag(v10) != v23)
  {
    AMFDRDecodeLogInternal(3, "%s: Payload type mismatch");
    goto LABEL_35;
  }
LABEL_25:
  uint64_t v11 = *a1;
  if ((a1[252] & 0x80) != 0)
  {
    if (!Img4DecodePerformManifestTrustEvaluationWithCallbacks()) {
      goto LABEL_59;
    }
  }
  else if (!Img4DecodePerformTrustEvaluationWithCallbacks())
  {
    goto LABEL_59;
  }
  uint64_t v12 = *a1;
  if ((*a1 & 0x1000000000000) == 0)
  {
LABEL_54:
    AMFDRDecodeLogInternal(3, "%s: FDR data trust evaluation failed.", "_AMFDRDecodeVerifyData");
    if (!*a1) {
      *a1 = 0x100000000000;
    }
    goto LABEL_61;
  }
  uint64_t v13 = (uint64_t (**)())a1[251];
  if (v13 == kAMFDRDecodeImplementationSha1)
  {
    uint64_t v14 = "%s: Evaluation returned code=0x%016llX, re-evaluate with FDR 2.0 format";
    long long v15 = kAMFDRDecodeImplementationSha384;
    goto LABEL_44;
  }
  if (v13 == kAMFDRDecodeImplementationSha384)
  {
    uint64_t v14 = "%s: Evaluation returned code=0x%016llX, re-evaluate with FDR 1.0 format";
    long long v15 = kAMFDRDecodeImplementationSha1;
LABEL_44:
    a1[251] = (uint64_t)v15;
    AMFDRDecodeLogInternal(4, v14, "_AMFDRDecodeVerifyData", v12);
  }
  uint64_t v20 = (uint64_t (**)())a1[251];
  if (v20 != kAMFDRDecodeImplementationSha1 && v20 != kAMFDRDecodeImplementationSha384) {
    goto LABEL_54;
  }
  uint64_t v21 = *a1;
  *a1 = v11;
  *((unsigned char *)a1 + 400) = 0;
  if ((a1[252] & 0x80) != 0) {
    int v22 = Img4DecodePerformManifestTrustEvaluationWithCallbacks();
  }
  else {
    int v22 = Img4DecodePerformTrustEvaluationWithCallbacks();
  }
  if (v22)
  {
    AMFDRDecodeLogInternal(4, "%s: Re-evaluation returned code=0x%016llX", "_AMFDRDecodeVerifyData", *a1);
    *a1 = v21;
    goto LABEL_54;
  }
  if ((a1[252] & 0x20) != 0)
  {
    AMFDRDecodeLogInternal(3, "%s: Re-evaluation succeeded but decode options require version2", "_AMFDRDecodeVerifyData");
    *a1 |= 0x2000000000000uLL;
  }
  else
  {
    AMFDRDecodeLogInternal(4, "%s: Re-evaluation succeeded", "_AMFDRDecodeVerifyData");
  }
LABEL_59:
  if (*((unsigned char *)a1 + 401)) {
    *((unsigned char *)a1 + 2032) = 1;
  }
LABEL_61:
  if ((*((unsigned char *)a1 + 2017) & 0x10) != 0)
  {
    uint64_t result = *a1;
    if (!*((unsigned char *)a1 + 376))
    {
      result |= 0x1000000000000000uLL;
      *a1 = result;
    }
  }
  else
  {
    uint64_t result = *a1;
  }
  a1[239] = a1[67];
  a1[240] = a1[68];
  return result;
}

double _AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData(void *a1, _OWORD *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v14[0] = 0xAAAAAAAAAAAAAAAALL;
  v14[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v4;
  long long v45 = v4;
  long long v42 = v4;
  long long v43 = v4;
  long long v40 = v4;
  long long v41 = v4;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v22 = v4;
  long long v23 = v4;
  long long v21 = v4;
  long long v19 = v4;
  long long v20 = v4;
  long long v18 = v4;
  unsigned int v13 = 0;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  int v11 = 0;
  memset(v10, 170, sizeof(v10));
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v15 = 0;
  if (DERDecodeItem((uint64_t)(a1 + 3), &v15))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR Multi Combined Format", "_AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData");
    *a1 |= 0x80uLL;
  }
  else if (v15 == 0x2000000000000010)
  {
    uint64_t v6 = a1[3];
    uint64_t v7 = a1[4];
    if (v6 + v7 >= (unint64_t)(v16 + v17))
    {
      if (v6 + v7 > (unint64_t)(v16 + v17))
      {
        AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "_AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData", v7 - v17);
        *a1 |= 8uLL;
      }
      else if (Img4DecodeInit())
      {
        AMFDRDecodeLogInternal(3, "%s: FDR failed to decode multi combined Data img4");
      }
      else if (Img4DecodeGetManifest())
      {
        AMFDRDecodeLogInternal(3, "%s: FDR failed to get manifest from multi combined data");
      }
      else if (Img4DecodeGetPayloadType())
      {
        AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload type from multi combined data");
      }
      else if (v11 == AMFDRTagsStringToTag((unsigned int *)"mcmb"))
      {
        if (Img4DecodeGetPayload())
        {
          AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload from multi combined data");
        }
        else if (DERDecodeSeqInit((uint64_t)v14, &v10[16], v10) {
               || *(void *)&v10[16] != 0x2000000000000011)
        }
        {
          AMFDRDecodeLogInternal(3, "%s: payload sequence malformed for multi combined data");
        }
        else
        {
          uint64_t v9 = v13;
          a1[35] = v12;
          a1[36] = v9;
          if (a2)
          {
            double result = *(double *)v10;
            *a2 = *(_OWORD *)v10;
          }
        }
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: multi combined payload type is not mcmb");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "_AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData");
      *a1 |= 4uLL;
    }
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Multi Combined Format unexpected tag: %llu", "_AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData", v15);
    *a1 |= 0x10000uLL;
  }
  return result;
}

uint64_t _AMFDRDecodeFindDataFromMultiCombined(uint64_t a1)
{
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v14 = v2;
  *(_OWORD *)unsigned int __n = v2;
  *(_OWORD *)__s1 = v2;
  long long v13 = v2;
  v18[0] = 0;
  v18[1] = 0;
  unint64_t v17 = 0;
  _AMFDRDecodeGetPayloadSeqAndSetManifestFromMultiCombinedData((void *)a1, &v16);
  if (v3)
  {
    uint64_t v10 = v3;
    *(void *)a1 |= 0x20000uLL;
    AMFDRDecodeLogInternal(3, "%s: Failed to get payload sequence and set manifest from multi combined data", "_AMFDRDecodeFindDataFromMultiCombined");
    return v10;
  }
  if (*(void *)(a1 + 104) && *(void *)(a1 + 112))
  {
    char v4 = 0;
  }
  else
  {
    if ((*(unsigned char *)(a1 + 2017) & 0x20) == 0)
    {
      AMFDRDecodeLogInternal(3, "%s: no data instance is specified when looking for data in multi combined format", "_AMFDRDecodeFindDataFromMultiCombined");
      return 1;
    }
    char v4 = 1;
  }
  if (DERDecodeSeqNext((unint64_t *)&v16, &v17)) {
    goto LABEL_36;
  }
  char v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  while (1)
  {
    while (1)
    {
      *(_OWORD *)uint64_t v14 = 0u;
      *(_OWORD *)unsigned int __n = 0u;
      *(_OWORD *)__s1 = 0u;
      long long v13 = 0u;
      if (DERParseSequenceContentToObject(v18, 4u, (uint64_t)&DERFDRMultiCombinedItemSpecs, (unint64_t)__s1, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: MultiCombinedItem malformed for multi combined data", "_AMFDRDecodeFindDataFromMultiCombined");
        return 0x20000;
      }
      if (__s1[1] != *(void **)(a1 + 96)
        || memcmp(__s1[0], *(const void **)(a1 + 88), (size_t)__s1[1])
        || (v4 & 1) == 0
        && (v14[1] != *(void *)(a1 + 112) || memcmp((const void *)v14[0], *(const void **)(a1 + 104), v14[1]))
        || __n[1] != *(void *)(a1 + 128))
      {
        goto LABEL_12;
      }
      uint64_t v8 = *(const void **)(a1 + 120);
      if (__n[0]) {
        break;
      }
      if (!v8) {
        goto LABEL_24;
      }
LABEL_12:
      if (DERDecodeSeqNext((unint64_t *)&v16, &v17))
      {
        if ((v5 & 1) == 0) {
          goto LABEL_36;
        }
        goto LABEL_29;
      }
    }
    if (!v8 || memcmp((const void *)__n[0], v8, __n[1])) {
      goto LABEL_12;
    }
LABEL_24:
    if ((v4 & 1) == 0)
    {
      AMFDRDecodeLogInternal(5, "%s: found data in multi combined format", "_AMFDRDecodeFindDataFromMultiCombined");
      uint64_t v6 = *((void *)&v13 + 1);
      uint64_t v7 = v13;
LABEL_29:
      uint64_t v10 = 0;
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v6;
      return v10;
    }
    if (v5) {
      break;
    }
    size_t v9 = v14[1];
    *(void *)(a1 + 104) = v14[0];
    *(void *)(a1 + 112) = v9;
    AMFDRDecodeLogInternal(5, "%s: found data in multi combined format", "_AMFDRDecodeFindDataFromMultiCombined");
    uint64_t v6 = *((void *)&v13 + 1);
    uint64_t v7 = v13;
    char v5 = 1;
    if (DERDecodeSeqNext((unint64_t *)&v16, &v17)) {
      goto LABEL_29;
    }
  }
  AMFDRDecodeLogInternal(3, "%s: found multiple entries that match, uniqueID is required in this case", "_AMFDRDecodeFindDataFromMultiCombined");
  *(void *)a1 |= 0x4000uLL;
LABEL_36:
  AMFDRDecodeLogInternal(3, "%s: cannot find data in multi combined format", "_AMFDRDecodeFindDataFromMultiCombined");
  return 512;
}

uint64_t _AMFDRDecodeVerifySignatureDataWithOid(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, char a10, void *a11)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&v22[0] = a7;
  *((void *)&v22[0] + 1) = a8;
  if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha1Rsa))
  {
    memset(&v22[1], 170, 20);
    if (AMSupportDigestSha1()) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = AMSupportRsaVerifySignatureSha1();
    if (!a11) {
      goto LABEL_36;
    }
LABEL_33:
    if (result != 2) {
      goto LABEL_36;
    }
    *a11 |= 0x80000000000000uLL;
    return 0xFFFFFFFFLL;
  }
  if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha256Rsa))
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[1] = v14;
    void v22[2] = v14;
    if (AMSupportDigestSha256()) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = AMSupportRsaVerifySignatureSha256();
    if (a11) {
      goto LABEL_33;
    }
    goto LABEL_36;
  }
  if (!DEROidCompare((uint64_t)v22, (uint64_t)&oidSha384Rsa))
  {
    if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha256Ecdsa))
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22[1] = v16;
      void v22[2] = v16;
      unint64_t v20 = 0;
      long long v21 = 0uLL;
      if (!a9)
      {
        AMFDRDecodeLogInternal(3, "%s: publicKeyParam is NULL!!");
        return 0xFFFFFFFFLL;
      }
      if (!a10)
      {
        if (DERDecodeItem(a9, &v20)) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_26;
      }
      if (*(void *)(a9 + 8))
      {
        long long v21 = *(_OWORD *)a9;
LABEL_26:
        if (AMSupportDigestSha256()) {
          return 0xFFFFFFFFLL;
        }
        size_t v18 = a2;
        long long v19 = a1;
        goto LABEL_32;
      }
LABEL_38:
      AMFDRDecodeLogInternal(3, "%s: missing public key algorithm parameter OID", "_AMFDRDecodeVerifySignatureDataWithOid");
      return 6;
    }
    if (!DEROidCompare((uint64_t)v22, (uint64_t)&oidSha384Ecdsa)) {
      return 4;
    }
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    void v22[2] = v17;
    long long v23 = v17;
    v22[1] = v17;
    unint64_t v20 = 0;
    long long v21 = 0uLL;
    if (!a9)
    {
      AMFDRDecodeLogInternal(3, "%s: publicKeyParam is NULL");
      return 0xFFFFFFFFLL;
    }
    if (a10)
    {
      if (!*(void *)(a9 + 8)) {
        goto LABEL_38;
      }
      long long v21 = *(_OWORD *)a9;
    }
    else if (DERDecodeItem(a9, &v20))
    {
      return 0xFFFFFFFFLL;
    }
    if (AMSupportDigestSha384()) {
      return 0xFFFFFFFFLL;
    }
    size_t v18 = a2;
    long long v19 = a1;
LABEL_32:
    uint64_t result = AMFDRDecodeEcdsaVerifySignature(v19, v18);
    if (!a11) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  void v22[2] = v15;
  long long v23 = v15;
  v22[1] = v15;
  if (AMSupportDigestSha384()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = AMSupportRsaVerifySignatureSha384();
  if (a11) {
    goto LABEL_33;
  }
LABEL_36:
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t AMFDRDecodeEcdsaVerifySignature(const void *a1, size_t a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (a2)
    {
      return AMSupportEcDsaVerifySignature();
    }
    else
    {
      char v5 = malloc(a2 + 1);
      if (v5)
      {
        uint64_t v6 = v5;
        *char v5 = 4;
        memcpy(v5 + 1, a1, a2);
        uint64_t v7 = AMSupportEcDsaVerifySignature();
        free(v6);
        return v7;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

uint64_t _AMFDRDecodeSequenceString(unint64_t a1, unint64_t a2, _OWORD *a3)
{
  v20[0] = a1;
  v20[1] = a2;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = 0uLL;
  unint64_t v17 = 0;
  v19[0] = 0;
  v19[1] = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  if (a3)
  {
    a3[14] = 0uLL;
    a3[15] = 0uLL;
    a3[12] = 0uLL;
    a3[13] = 0uLL;
    a3[10] = 0uLL;
    a3[11] = 0uLL;
    a3[8] = 0uLL;
    a3[9] = 0uLL;
    a3[6] = 0uLL;
    a3[7] = 0uLL;
    a3[4] = 0uLL;
    a3[5] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    *a3 = 0uLL;
    a3[1] = 0uLL;
    char v4 = DERDecodeSeqContentInit(v20, v19);
    if (v4)
    {
      uint64_t v12 = (uint64_t)v4;
      AMFDRDecodeLogInternal(3, "%s: failed to init sequence");
    }
    else
    {
      uint64_t v5 = 0;
      size_t v6 = 255;
      while (1)
      {
        uint64_t v7 = DERDecodeSeqNext(v19, &v17);
        if (v7) {
          break;
        }
        long long v14 = v18;
        if (v17 == 0x2000000000000011)
        {
          long long v15 = 0u;
          long long v16 = 0u;
          uint64_t v8 = DERParseSequenceToObject((uint64_t)&v14, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v15, 0x20uLL, 0);
          if (v8)
          {
            uint64_t v12 = v8;
            AMFDRDecodeLogInternal(3, "%s: malformed AttributeTypeAndValue format: %d");
            return v12;
          }
          if ((void)v16)
          {
            long long v14 = v16;
            long long v18 = 0uLL;
            unint64_t v17 = 0;
            uint64_t v9 = DERDecodeItem((uint64_t)&v14, &v17);
            if (v9)
            {
              uint64_t v12 = v9;
              AMFDRDecodeLogInternal(3, "%s: malformed attribute: %d");
              return v12;
            }
            if (v17 == 19 || v17 == 12)
            {
              if (v5)
              {
                if (!v6) {
                  return 0;
                }
                *((unsigned char *)a3 + v5++) = 32;
                --v6;
              }
              uint64_t v10 = (char *)a3 + v5;
              uint64_t v11 = *((void *)&v18 + 1);
              if (v6 < *((void *)&v18 + 1))
              {
                memcpy(v10, (const void *)v18, v6);
                return 0;
              }
              v6 -= *((void *)&v18 + 1);
              memcpy(v10, (const void *)v18, *((size_t *)&v18 + 1));
              v5 += v11;
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: Attribute must be set container. Found unexpected tag 0x%llu, skipping", "_AMFDRDecodeSequenceString", v17);
        }
      }
      uint64_t v12 = v7;
      if (v7 == 1) {
        return 0;
      }
      AMFDRDecodeLogInternal(3, "%s: failed to decode all sequences: %d");
    }
  }
  else
  {
    uint64_t v12 = 3;
    AMFDRDecodeLogInternal(3, "%s: buffer is NULL");
  }
  return v12;
}

uint64_t AMFDRDecodeDigestByLength(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 48) {
    return AMSupportDigestSha384();
  }
  if (a4 == 32) {
    return AMSupportDigestSha256();
  }
  return 1;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  char v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  size_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      long long v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          long long v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    long long v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t AMSupportDigestSha1()
{
  return MEMORY[0x270F97A48]();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x270F97A50]();
}

uint64_t AMSupportDigestSha384()
{
  return MEMORY[0x270F97A58]();
}

uint64_t AMSupportEcDsaVerifySignature()
{
  return MEMORY[0x270F97A78]();
}

uint64_t AMSupportLogFormat()
{
  return MEMORY[0x270F97AB8]();
}

uint64_t AMSupportRsaVerifySignatureSha1()
{
  return MEMORY[0x270F97B20]();
}

uint64_t AMSupportRsaVerifySignatureSha256()
{
  return MEMORY[0x270F97B28]();
}

uint64_t AMSupportRsaVerifySignatureSha384()
{
  return MEMORY[0x270F97B30]();
}

uint64_t DERImg4DecodeContentFindItemWithTag()
{
  return MEMORY[0x270F97BD0]();
}

uint64_t DERImg4DecodeFindProperty()
{
  return MEMORY[0x270F97BD8]();
}

uint64_t DERImg4DecodeFindPropertyInSequence()
{
  return MEMORY[0x270F97BE0]();
}

uint64_t DERImg4DecodeManifest()
{
  return MEMORY[0x270F97BE8]();
}

uint64_t DERImg4DecodeProperty()
{
  return MEMORY[0x270F97BF0]();
}

uint64_t DERImg4DecodePropertyWithItem()
{
  return MEMORY[0x270F97BF8]();
}

uint64_t Img4DecodeEvaluateDictionaryProperties()
{
  return MEMORY[0x270F97C00]();
}

uint64_t Img4DecodeEvaluateManifestProperties()
{
  return MEMORY[0x270F97C08]();
}

uint64_t Img4DecodeEvaluateObjectProperties()
{
  return MEMORY[0x270F97C10]();
}

uint64_t Img4DecodeGetManifest()
{
  return MEMORY[0x270F97C28]();
}

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x270F97C30]();
}

uint64_t Img4DecodeGetPayload()
{
  return MEMORY[0x270F97C40]();
}

uint64_t Img4DecodeGetPayloadType()
{
  return MEMORY[0x270F97C48]();
}

uint64_t Img4DecodeGetPropertyBoolean()
{
  return MEMORY[0x270F97C50]();
}

uint64_t Img4DecodeGetPropertyData()
{
  return MEMORY[0x270F97C58]();
}

uint64_t Img4DecodeInit()
{
  return MEMORY[0x270F97C68]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x270F97C70]();
}

uint64_t Img4DecodePerformManifestTrustEvaluationWithCallbacks()
{
  return MEMORY[0x270F97C78]();
}

uint64_t Img4DecodePerformTrustEvaluatation()
{
  return MEMORY[0x270F97C80]();
}

uint64_t Img4DecodePerformTrustEvaluationWithCallbacks()
{
  return MEMORY[0x270F97C90]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}