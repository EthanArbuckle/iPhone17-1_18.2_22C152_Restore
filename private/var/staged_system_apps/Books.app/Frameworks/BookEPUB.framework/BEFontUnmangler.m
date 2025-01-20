@interface BEFontUnmangler
- (id)_adobeXORMaskWithEPubID:(id)a3;
- (id)_idpfXORMaskWithEPubID:(id)a3;
- (id)unmangleFontWithAssetInfo:(id)a3 fileData:(id)a4 URL:(id)a5;
@end

@implementation BEFontUnmangler

- (id)unmangleFontWithAssetInfo:(id)a3 fileData:(id)a4 URL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 encryptionAlgorithm];
  if ([@"http://www.idpf.org/2008/embedding" compare:v9 options:1])
  {
    id v10 = v8;
    if ([@"http://ns.adobe.com/pdf/enc#RC" compare:v9 options:1]) {
      goto LABEL_15;
    }
    v11 = [v7 bookEpubIdWithUUIDScheme];
    if ([v11 length])
    {
      v12 = [(BEFontUnmangler *)self _adobeXORMaskWithEPubID:v11];
    }
    else
    {
      v12 = 0;
    }
    id v13 = &stru_3D8 + 40;
  }
  else
  {
    v11 = [v7 bookEpubId];
    v12 = [(BEFontUnmangler *)self _idpfXORMaskWithEPubID:v11];
    id v13 = &stru_3D8 + 56;
  }

  id v10 = v8;
  if (v12)
  {
    id v14 = [v8 mutableCopy];
    v15 = [v14 mutableBytes];
    id v10 = v14;

    id v16 = v8;
    v17 = [v16 bytes];
    if ([v16 length] < v13) {
      id v13 = [v16 length];
    }
    id v18 = v12;
    v19 = [v18 bytes];
    unint64_t v20 = (unint64_t)[v18 length];
    if (v13)
    {
      for (unint64_t i = 0; (id)i != v13; ++i)
        v15[i] = v19[i % v20] ^ v17[i];
    }
  }
LABEL_15:

  return v10;
}

- (id)_idpfXORMaskWithEPubID:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && (v4 = (const char *)[v3 UTF8String]) != 0
    && (+[NSMutableData dataWithLength:20],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    CC_LONG v6 = strlen(v4);
    id v7 = v5;
    CC_SHA1(v4, v6, (unsigned __int8 *)[v7 mutableBytes]);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_adobeXORMaskWithEPubID:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_409BC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_409BC8))
  {
    qword_409BC0 = +[NSCharacterSet characterSetWithCharactersInString:@"-:"];
    __cxa_guard_release(&qword_409BC8);
  }
  v4 = (char *)[v3 rangeOfString:@"urn:uuid:" options:2];
  if (v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [v3 substringFromIndex:&v4[v5]];

    id v3 = (id)v6;
  }
  id v7 = [v3 componentsSeparatedByCharactersInSet:qword_409BC0];
  id v8 = [v7 componentsJoinedByString:&stru_3D7B70];

  if ([v8 length])
  {
    v9 = +[NSData bu_dataFromHexString:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end