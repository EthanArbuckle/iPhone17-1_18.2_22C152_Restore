@interface HCHuffmanCoder
+ (id)characterCoderForLocale:(id)a3;
+ (id)coderFromBurstTrieFile:(id)a3 indexTableFile:(id)a4;
+ (id)coderMatchingName:(id)a3 locale:(id)a4;
+ (id)wordCoderForLocale:(id)a3;
- (HCBurstTrie)burstTrie;
- (HCHuffmanCoder)init;
- (HCHuffmanCoder)initWithBurstTrie:(id)a3 indexTable:(id)a4;
- (HCIndexTable)indexTable;
- (NSUUID)versionUUID;
- (id)codeForKey:(id)a3;
- (id)stringCodeForKey:(id)a3;
- (unint64_t)count;
- (void)setBurstTrie:(id)a3;
- (void)setIndexTable:(id)a3;
@end

@implementation HCHuffmanCoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTable, 0);

  objc_storeStrong((id *)&self->_burstTrie, 0);
}

- (void)setIndexTable:(id)a3
{
}

- (HCIndexTable)indexTable
{
  return self->_indexTable;
}

- (void)setBurstTrie:(id)a3
{
}

- (HCBurstTrie)burstTrie
{
  return self->_burstTrie;
}

- (id)stringCodeForKey:(id)a3
{
  v3 = [(HCHuffmanCoder *)self codeForKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = _createBinaryStringForHuffmanCode(v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)codeForKey:(id)a3
{
  id v4 = a3;
  burstTrie = self->_burstTrie;
  if (burstTrie && self->_indexTable)
  {
    v6 = [(HCBurstTrie *)burstTrie payloadForKey:v4];
    v7 = v6;
    if (v6)
    {
      v8 = -[HCIndexTable codeAtIndex:](self->_indexTable, "codeAtIndex:", [v6 unsignedIntValue] - 1);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSUUID)versionUUID
{
  v2 = [(HCHuffmanCoder *)self indexTable];
  v3 = [v2 versionUUID];

  return (NSUUID *)v3;
}

- (unint64_t)count
{
  unint64_t v3 = [(HCBurstTrie *)self->_burstTrie count];
  [(HCIndexTable *)self->_indexTable count];
  return v3;
}

- (HCHuffmanCoder)initWithBurstTrie:(id)a3 indexTable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HCHuffmanCoder;
  v9 = [(HCHuffmanCoder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_burstTrie, a3);
    objc_storeStrong((id *)&v10->_indexTable, a4);
  }

  return v10;
}

- (HCHuffmanCoder)init
{
  return [(HCHuffmanCoder *)self initWithBurstTrie:0 indexTable:0];
}

+ (id)coderFromBurstTrieFile:(id)a3 indexTableFile:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[HCBurstTrie burstTrieFromFile:a3];
  id v7 = +[HCIndexTable indexTableFromFile:v5];

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      objc_super v12 = "+[HCHuffmanCoder coderFromBurstTrieFile:indexTableFile:]";
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Could not load the huffman coder from the supplied file paths.", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v9 = [[HCHuffmanCoder alloc] initWithBurstTrie:v6 indexTable:v7];
  }

  return v9;
}

+ (id)coderMatchingName:(id)a3 locale:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5695;
  v20 = __Block_byref_object_dispose__5696;
  id v21 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  LDEnumerateAssetDataItems();
  if (v17[5])
  {
    BOOL v8 = [NSString stringWithFormat:@"%@.triemap", v6, v15, 3221225472, __43__HCHuffmanCoder_coderMatchingName_locale___block_invoke, &unk_1E6E2AA30, &v16];
    v9 = [NSString stringWithFormat:@"%@.htbl", v6];
    v10 = [(id)v17[5] URLByAppendingPathComponent:v8];
    int v11 = [(id)v17[5] URLByAppendingPathComponent:v9];
    objc_super v12 = [a1 coderFromBurstTrieFile:v10 indexTableFile:v11];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v14 = [v7 localeIdentifier];
      *(_DWORD *)buf = 136315394;
      v23 = "+[HCHuffmanCoder coderMatchingName:locale:]";
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Couldn't find a Huffman coder for locale: '%@'", buf, 0x16u);
    }
    objc_super v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __43__HCHuffmanCoder_coderMatchingName_locale___block_invoke(uint64_t a1, const void *a2, int a3, int a4, CFStringRef theString1, unsigned char *a6)
{
  if (CFEqual(theString1, @"DifferentialPrivacyHuffmanCoder"))
  {
    CFTypeRef v9 = CFRetain(a2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

+ (id)wordCoderForLocale:(id)a3
{
  return (id)[a1 coderMatchingName:@"words" locale:a3];
}

+ (id)characterCoderForLocale:(id)a3
{
  return (id)[a1 coderMatchingName:@"chars" locale:a3];
}

@end