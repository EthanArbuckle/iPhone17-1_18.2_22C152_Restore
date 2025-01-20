@interface PptTextBlock
- (PptCharRun)characterRunAtIndex:(int)a3;
- (PptTextBlock)init;
- (id)bookmarks;
- (id)hyperlinks;
- (id)metaCharacterFields;
- (id)text;
- (int)characterRunCount;
- (int)paragraphRunCount;
- (int)specialInfoRunCount;
- (int)textType;
- (unsigned)textIndex;
- (void)paragraphRunAtIndex:(int)a3;
- (void)readMetaCharacterFieldsBookmarksAndHyperlinks:(id)a3;
- (void)readSpecialInfo:(id)a3;
- (void)readString:(id)a3;
- (void)readStyles:(id)a3;
- (void)readTextBlock:(id)a3;
- (void)specialInfoRunAtIndex:(int)a3;
- (void)textRuler;
@end

@implementation PptTextBlock

- (PptTextBlock)init
{
  v13.receiver = self;
  v13.super_class = (Class)PptTextBlock;
  v2 = [(PptTextBlock *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->mTextHeader = 0;
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mText = v3->mText;
    v3->mText = v4;

    v3->mStyleText = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mMetaCharacterFields = v3->mMetaCharacterFields;
    v3->mMetaCharacterFields = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBookmarks = v3->mBookmarks;
    v3->mBookmarks = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mHyperlinks = v3->mHyperlinks;
    v3->mHyperlinks = v10;

    v3->mTextRuler = 0;
  }
  return v3;
}

- (void)readTextBlock:(id)a3
{
  id v14 = a3;
  v4 = [v14 firstChildOfType:3999];
  v5 = v4;
  if (!v4)
  {
LABEL_11:
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
  }
  v6 = (const void *)[v4 eshObject];
  if (!v6)
  {
    self->mTextHeader = 0;
    goto LABEL_11;
  }
  self->mTextHeader = v7;
  if (!v7) {
    goto LABEL_11;
  }
  [(PptTextBlock *)self readString:v14];
  [(PptTextBlock *)self readStyles:v14];
  [(PptTextBlock *)self readSpecialInfo:v14];
  [(PptTextBlock *)self readMetaCharacterFieldsBookmarksAndHyperlinks:v14];
  v8 = [v14 firstChildOfType:4006];
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  v10 = (const void *)[v8 eshObject];
  if (!v10)
  {
    self->mTextRuler = 0;
LABEL_13:
    objc_super v13 = __cxa_allocate_exception(4uLL);
    *objc_super v13 = 1000;
  }
  self->mTextRuler = v11;
  if (!v11) {
    goto LABEL_13;
  }
LABEL_7:
}

- (void)readString:(id)a3
{
  id v16 = a3;
  v4 = [v16 firstChildOfType:4000];
  v5 = v4;
  if (v4)
  {
    v6 = (const void *)[v4 eshObject];
    if (!v6
    {
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = 1000;
    }
    v8 = (void *)[[NSString alloc] initWithCsString:v7 + 48];
    [(NSMutableString *)self->mText setString:v8];
LABEL_5:

    goto LABEL_6;
  }
  v9 = [v16 firstChildOfType:4008];
  v5 = v9;
  if (v9)
  {
    v10 = (const void *)[v9 eshObject];
    if (!v10
    {
      v15 = __cxa_allocate_exception(4uLL);
      _DWORD *v15 = 1000;
    }
    v12 = v11;
    unsigned int DataLength = EshRecord::getDataLength(v11);
    if (DataLength)
    {
      v8 = (void *)[[NSString alloc] initWithBytes:*((void *)v12 + 6) length:DataLength encoding:12];
      if (!v8) {
        operator new[]();
      }
      [(NSMutableString *)self->mText setString:v8];
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)readStyles:(id)a3
{
  id v8 = a3;
  v4 = [v8 firstChildOfType:4002];
  if (v4 || ([v8 firstChildOfType:4001], (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (const void *)[v4 eshObject];
    if (v5)
    {
      self->mStyleText = v6;
      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      self->mStyleText = 0;
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
  }
LABEL_5:
}

- (void)readMetaCharacterFieldsBookmarksAndHyperlinks:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 childCount];
  if (v4)
  {
    uint64_t v5 = 0;
    while (2)
    {
      v6 = [v20 childAt:v5];
      v7 = (const void *)[v6 eshObject];
      int v8 = (*(uint64_t (**)(const void *))(*(void *)v7 + 16))(v7);
      v9 = 0;
      switch(v8)
      {
        case 4082:
          v10 = [v20 childAt:v5 + 1];
          uint64_t v11 = [v10 eshObject];
          if (!v11 || (*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) != 4063)
          {
            exception = __cxa_allocate_exception(4uLL);
            _DWORD *exception = 1000;
          }
          v12 = objc_alloc_init(PptHyperlinkBlock);
          [(PptHyperlinkBlock *)v12 setInteractiveInfoContainerHolder:v6];
          [(PptHyperlinkBlock *)v12 setTxInteractiveInfoAtomHolder:v10];
          [(NSMutableArray *)self->mHyperlinks addObject:v12];

          goto LABEL_21;
        case 4083:
        case 4084:
        case 4085:
        case 4086:
          goto LABEL_23;
        case 4087:
          if (!v15) {
            goto LABEL_21;
          }
          id v14 = [[PptMetaCharacterBlock alloc] initWithType:4087 position:v15[12] extraData:v15[13]];
          goto LABEL_19;
        case 4088:
          if (!v16) {
            goto LABEL_21;
          }
          id v14 = [[PptMetaCharacterBlock alloc] initWithType:4088 position:v16[12]];
          goto LABEL_19;
        case 4089:
          if (!v17) {
            goto LABEL_21;
          }
          id v14 = [[PptMetaCharacterBlock alloc] initWithType:4089 position:v17[12]];
          goto LABEL_19;
        case 4090:
          if (!v18) {
            goto LABEL_21;
          }
          id v14 = [[PptMetaCharacterBlock alloc] initWithType:4090 position:v18[12]];
          goto LABEL_19;
        default:
          if (v8 == 4007)
          {
            v9 = 0;
            [(NSMutableArray *)self->mBookmarks addObject:v6];
          }
          else if (v8 == 4056)
          {
            if (v13)
            {
              id v14 = [[PptMetaCharacterBlock alloc] initWithType:4056 position:v13[12]];
LABEL_19:
              v9 = v14;
              if (v14) {
                [(NSMutableArray *)self->mMetaCharacterFields addObject:v14];
              }
            }
            else
            {
LABEL_21:
              v9 = 0;
            }
          }
LABEL_23:

          if (v4 == ++v5) {
            break;
          }
          continue;
      }
      break;
    }
  }
}

- (void)textRuler
{
  return self->mTextRuler;
}

- (int)textType
{
  return self->mTextHeader->var6;
}

- (id)text
{
  return self->mText;
}

- (int)paragraphRunCount
{
  mStyleText = self->mStyleText;
  if (mStyleText) {
    return (mStyleText[7] - mStyleText[6]) >> 3;
  }
  else {
    LODWORD(v3) = 0;
  }
  return v3;
}

- (void)paragraphRunAtIndex:(int)a3
{
  result = self->mStyleText;
  if (result)
  {
    uint64_t v4 = *((void *)result + 6);
    unint64_t v5 = (unint64_t)(*((void *)result + 7) - v4) >> 3;
    if ((int)v5 >= a3)
    {
      if (v5 <= a3) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      return *(void **)(v4 + 8 * a3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)characterRunCount
{
  mStyleText = self->mStyleText;
  if (mStyleText) {
    return (mStyleText[10] - mStyleText[9]) >> 3;
  }
  else {
    LODWORD(v3) = 0;
  }
  return v3;
}

- (id)hyperlinks
{
  return self->mHyperlinks;
}

- (id)metaCharacterFields
{
  return self->mMetaCharacterFields;
}

- (PptCharRun)characterRunAtIndex:(int)a3
{
  result = (PptCharRun *)self->mStyleText;
  if (result)
  {
    uint64_t v4 = *(void *)&result[2].var0;
    unint64_t v5 = (unint64_t)(*(void *)((char *)&result[2].var1 + 4) - v4) >> 3;
    if ((int)v5 >= a3)
    {
      if (v5 <= a3) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      return *(PptCharRun **)(v4 + 8 * a3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)textIndex
{
  return EshRecord::getInstance((EshRecord *)self->mTextHeader);
}

- (id)bookmarks
{
  return self->mBookmarks;
}

- (int)specialInfoRunCount
{
  mSpecialInfo = self->mSpecialInfo;
  if (mSpecialInfo) {
    return (mSpecialInfo[7] - mSpecialInfo[6]) >> 3;
  }
  else {
    LODWORD(v3) = 0;
  }
  return v3;
}

- (void)specialInfoRunAtIndex:(int)a3
{
  mSpecialInfo = self->mSpecialInfo;
  if (mSpecialInfo
    && (unint64_t v5 = (char *)(mSpecialInfo + 6),
        uint64_t v4 = mSpecialInfo[6],
        (int)((unint64_t)(*((void *)v5 + 1) - v4) >> 3) >= a3))
  {
    return *(void **)(v4 + 8 * a3);
  }
  else
  {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHyperlinks, 0);
  objc_storeStrong((id *)&self->mBookmarks, 0);
  objc_storeStrong((id *)&self->mMetaCharacterFields, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

- (void)readSpecialInfo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 firstChildOfType:4010];
  unint64_t v5 = v4;
  if (v4)
  {
    v6 = (const void *)[v4 eshObject];
    if (v6)
    {
      self->mSpecialInfo = v7;
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      self->mSpecialInfo = 0;
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
  }
LABEL_4:
}

@end