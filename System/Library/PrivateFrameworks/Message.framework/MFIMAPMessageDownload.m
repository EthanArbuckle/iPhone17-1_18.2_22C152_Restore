@interface MFIMAPMessageDownload
- (BOOL)allowsPartialDownloads;
- (BOOL)fetchBodyData;
- (BOOL)isComplete;
- (BOOL)isSuccessful;
- (BOOL)partial;
- (MFIMAPMessageDownload)initWithMessage:(id)a3;
- (id)_networkConverterWithConsumer:(id)a3 didReceiveData:(id)a4;
- (id)data;
- (id)message;
- (id)topLevelPart;
- (void)_addSubdownloadForBodyTextWithCache:(id)a3;
- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4;
- (void)handleFetchResult:(id)a3;
- (void)processResults;
- (void)setAllowsPartialDownloads:(BOOL)a3;
- (void)setFetchBodyData:(BOOL)a3;
- (void)setTopLevelPart:(id)a3;
@end

@implementation MFIMAPMessageDownload

void ___ef_log_MFIMAPMessageDownload_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MFIMAPMessageDownload");
  v1 = (void *)_ef_log_MFIMAPMessageDownload_log;
  _ef_log_MFIMAPMessageDownload_log = (uint64_t)v0;
}

- (MFIMAPMessageDownload)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFIMAPMessageDownload;
  v6 = -[MFIMAPDownload initWithUid:](&v9, sel_initWithUid_, [v5 uid]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v7->_nextByteToFetch = 0;
  }

  return v7;
}

- (id)message
{
  return self->_message;
}

- (BOOL)allowsPartialDownloads
{
  return *((unsigned char *)self + 64) & 1;
}

- (void)setAllowsPartialDownloads:(BOOL)a3
{
  *((unsigned char *)self + 64) = *((unsigned char *)self + 64) & 0xFE | a3;
}

- (BOOL)partial
{
  return (*((unsigned __int8 *)self + 64) >> 1) & 1;
}

- (id)topLevelPart
{
  [(MFIMAPMessageDownload *)self mf_lock];
  v3 = self->_topLevelPart;
  [(MFIMAPMessageDownload *)self mf_unlock];
  return v3;
}

- (void)setTopLevelPart:(id)a3
{
  id v5 = a3;
  [(MFIMAPMessageDownload *)self mf_lock];
  objc_storeStrong((id *)&self->_topLevelPart, a3);
  [(MFIMAPMessageDownload *)self mf_unlock];
}

- (id)data
{
  if (![(MFIMAPMessageDownload *)self isComplete])
  {
    v6 = 0;
    goto LABEL_35;
  }
  [(MFIMAPMessageDownload *)self mf_lock];
  [(_MFSharedBufferedDataConsumer *)self->_textConsumer _reallyDone];
  if ((*((unsigned char *)self + 64) & 2) != 0)
  {
    if (self->_receivedHeaders)
    {
      v7 = [(MFCollectingDataConsumer *)self->_headerConsumer data];
      v6 = (void *)[v7 mutableCopy];
    }
    else
    {
      v6 = 0;
    }
    if (self->_receivedText
      && ([(MFBufferedDataConsumer *)self->_textConsumer data], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v8;
      if (!v6) {
        v6 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithBytes:"\n" length:1];
      }
      [v6 appendData:v4];
    }
    else
    {
      if (self->_topLevelPart)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v6)
        {
          v10 = [(MFMimePart *)self->_topLevelPart type];
          if ([v10 isEqualToString:@"multipart"])
          {
            v11 = [(MFMimePart *)self->_topLevelPart bodyParameterForKey:@"boundary"];

            if (!v11)
            {
              objc_msgSend(v6, "length", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
              if (MFMimeDataGetRangeOfHeader())
              {
                [v6 bytes];
                MFMimePartParseContentTypeHeader();
              }
            }
          }
          else
          {
          }
        }
        else
        {
          v6 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithBytes:"\n" length:1];
        }
        v12 = objc_alloc_init(MFMessageWriter);
        [(MFMessageWriter *)v12 appendDataForMimePart:self->_topLevelPart toData:v6 withPartData:Mutable];
      }
      v4 = 0;
    }
  }
  else
  {
    if (!self->_receivedHeaders
      || ([(MFCollectingDataConsumer *)self->_headerConsumer data],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = 0;
      goto LABEL_30;
    }
    v4 = (void *)v3;
    if (self->_receivedText
      && ([(MFBufferedDataConsumer *)self->_textConsumer data],
          (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = (void *)[v4 mutableCopy];
      [v6 appendData:v5];
    }
    else
    {
      v6 = 0;
    }
  }

LABEL_30:
  [(MFIMAPMessageDownload *)self mf_unlock];
  if (v6)
  {
    BOOL v13 = (*((unsigned char *)self + 64) & 2) != 0 && (*((unsigned char *)self + 64) & 0x10) == 0;
    [(MFMessage *)self->_message setMessageData:v6 isPartial:v13];
  }
LABEL_35:
  return v6;
}

- (BOOL)isComplete
{
  uint64_t v3 = +[MFActivityMonitor currentMonitor];
  v4 = [v3 error];

  if (v4) {
    int v5 = objc_msgSend(v4, "mf_shouldFailDownload") ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  if ((*((unsigned char *)self + 64) & 4) == 0 || (*((unsigned char *)self + 64) & 0x20) == 0) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MFIMAPMessageDownload;
  return [(MFIMAPCompoundDownload *)&v7 isComplete] & v5;
}

- (BOOL)isSuccessful
{
  BOOL v3 = [(MFIMAPMessageDownload *)self isComplete];
  if (v3)
  {
    headerConsumer = self->_headerConsumer;
    textConsumer = self->_textConsumer;
    if (headerConsumer)
    {
      LOBYTE(v3) = self->_receivedHeaders;
      if (!textConsumer) {
        return v3;
      }
      if (self->_receivedHeaders && self->_receivedText)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else if (!textConsumer)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    if (headerConsumer) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = !self->_receivedText;
    }
    LOBYTE(v3) = !v6;
  }
  return v3;
}

- (void)handleFetchResult:(id)a3
{
  id v8 = a3;
  [(MFIMAPMessageDownload *)self mf_lock];
  if (self->_topLevelPart || [v8 type] != 6)
  {
    if ([v8 type] != 12) {
      goto LABEL_9;
    }
    p_pendingFetchResults = &self->super.super._pendingFetchResults;
    pendingFetchResults = self->super.super._pendingFetchResults;
    if (!pendingFetchResults) {
      goto LABEL_7;
    }
  }
  else
  {
    p_pendingFetchResults = &self->super.super._pendingFetchResults;
    pendingFetchResults = self->super.super._pendingFetchResults;
    if (!pendingFetchResults)
    {
LABEL_7:
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      objc_super v7 = *p_pendingFetchResults;
      *p_pendingFetchResults = (NSMutableArray *)v6;

      pendingFetchResults = *p_pendingFetchResults;
    }
  }
  [(NSMutableArray *)pendingFetchResults addObject:v8];
LABEL_9:
  [(MFIMAPMessageDownload *)self mf_unlock];
}

- (void)processResults
{
  [(MFIMAPMessageDownload *)self mf_lock];
  uint64_t v3 = [(NSMutableArray *)self->super.super._pendingFetchResults count];
  if (v3)
  {
    uint64_t v4 = v3;
    v12 = sel_setRemoteContentLinks_;
    while (1)
    {
      int v5 = -[NSMutableArray objectAtIndex:](self->super.super._pendingFetchResults, "objectAtIndex:", 0, v12);
      uint64_t v6 = v5;
      if (!self->_topLevelPart && [v5 type] == 6) {
        break;
      }
      if ([v6 type] != 12 || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_23;
      }
      v10 = self->_message;
      objc_super v7 = [v6 appleRemoteLinks];
      [(MFMessage *)v10 setRemoteContentLinks:v7];
LABEL_22:

LABEL_23:
      [(NSMutableArray *)self->super.super._pendingFetchResults removeObjectAtIndex:0];
      --v4;

      if (!v4) {
        goto LABEL_24;
      }
    }
    objc_super v7 = [v6 bodyStructure];
    if (v7)
    {
      topLevelPart = objc_alloc_init(MFMailMimePart);
      char v9 = [(MFMailMimePart *)topLevelPart parseIMAPPropertyList:v7];
      if ((v9 & 1) == 0)
      {
        v10 = 0;
        goto LABEL_14;
      }
      if (topLevelPart)
      {
        v10 = topLevelPart;
        topLevelPart = (MFMailMimePart *)self->_topLevelPart;
        self->_topLevelPart = (MFMimePart *)v10;
LABEL_14:

LABEL_15:
        if (![(MFMessage *)v10 isSecurePart]
          && [(MFMessage *)v10 hasSecureSubparts])
        {
          *((unsigned char *)self + 64) &= ~2u;
          *((unsigned char *)self + 64) |= 8u;
        }
        char v11 = v9 ^ 1;
        if ((*((unsigned char *)self + 64) & 2) == 0) {
          char v11 = 1;
        }
        if ((v11 & 1) == 0)
        {
          char v14 = -86;
          char v13 = -86;
          [(MFMessage *)v10 getNumberOfAttachments:0 isSigned:&v14 isEncrypted:&v13];
        }
        goto LABEL_22;
      }
    }
    char v9 = 0;
    v10 = 0;
    goto LABEL_15;
  }
LABEL_24:
  [(MFIMAPMessageDownload *)self mf_unlock];
}

- (id)_networkConverterWithConsumer:(id)a3 didReceiveData:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F734E0]) initWithConsumer:v5];
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F734A0]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __70__MFIMAPMessageDownload__networkConverterWithConsumer_didReceiveData___block_invoke;
    v18 = &unk_1E5D3E7B0;
    id v19 = v6;
    v10 = (void *)[v9 initWithAppendHandler:&v15 doneHandler:0];
    char v11 = (void *)MEMORY[0x1E4F73498];
    v20[0] = v8;
    v20[1] = v10;
    v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, v15, v16, v17, v18);
    id v13 = [v11 filterWithConsumers:v12];
  }
  else
  {
    id v13 = v7;
  }

  return v13;
}

uint64_t __70__MFIMAPMessageDownload__networkConverterWithConsumer_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = [v3 length];

  return v4;
}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFIMAPMessageDownload *)self mf_lock];
  if ((*((unsigned char *)self + 64) & 4) == 0)
  {
    if ((*((unsigned char *)self + 64) & 1) == 0 && (*((unsigned char *)self + 64) & 0x40) != 0)
    {
LABEL_16:
      uint64_t v15 = (MFCollectingDataConsumer *)objc_alloc_init(MEMORY[0x1E4F734A8]);
      headerConsumer = self->_headerConsumer;
      self->_headerConsumer = v15;

      v17 = self->_headerConsumer;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __57__MFIMAPMessageDownload_addCommandsToPipeline_withCache___block_invoke;
      v24[3] = &unk_1E5D3B5C0;
      v24[4] = self;
      v18 = [(MFIMAPMessageDownload *)self _networkConverterWithConsumer:v17 didReceiveData:v24];
      id v19 = objc_msgSend(v7, "downloadForUid:section:expectedLength:consumer:", -[MFIMAPDownload uid](self, "uid"), @"HEADER", 1024, v18);
      [(MFIMAPCompoundDownload *)self addSubdownload:v19];

      if ((*((unsigned char *)self + 64) & 2) != 0)
      {
        objc_msgSend(v6, "addFetchCommandForUid:fetchItem:expectedLength:bodyDataConsumer:consumerSection:", -[MFIMAPDownload uid](self, "uid"), @"BODYSTRUCTURE", 256, 0, 0);
      }
      else
      {
        [(MFIMAPMessageDownload *)self _addSubdownloadForBodyTextWithCache:v7];
        *((unsigned char *)self + 64) |= 8u;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [(MFMessage *)self->_message account];
        v21 = [(MFMessage *)self->_message dateReceived];
        int v22 = [v20 shouldFetchRemoteLinksWithDateReceived:v21];

        if (v22) {
          objc_msgSend(v6, "addFetchCommandForUid:fetchItem:expectedLength:bodyDataConsumer:consumerSection:", -[MFIMAPDownload uid](self, "uid"), @"X-APPLE-REMOTE-LINKS", 1024, 0, 0);
        }
      }
      *((unsigned char *)self + 64) |= 4u;

      goto LABEL_24;
    }
    if ((*((unsigned char *)self + 64) & 0x40) != 0)
    {
      unint64_t v12 = [(MFMessage *)self->_message messageSize];
      unint64_t v13 = [v6 chunkSize];
      id v8 = (char *)self + 64;
      char v9 = *((unsigned char *)self + 64);
      if (v12 < v13)
      {
        char v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      id v8 = (char *)self + 64;
      char v9 = *((unsigned char *)self + 64);
    }
    char v14 = 2;
LABEL_15:
    *id v8 = v14 | v9 & 0xFD;
    goto LABEL_16;
  }
  char v10 = *((unsigned char *)self + 64);
  if ((v10 & 0x20) == 0)
  {
    if ((*((unsigned char *)self + 64) & 8) != 0)
    {
      unint64_t nextByteToFetch = self->_nextByteToFetch;
      if (nextByteToFetch < [(MFMessage *)self->_message messageSize])
      {
        [(MFIMAPMessageDownload *)self _addSubdownloadForBodyTextWithCache:v7];
        goto LABEL_24;
      }
      char v10 = *((unsigned char *)self + 64);
    }
    *((unsigned char *)self + 64) = v10 | 0x20;
  }
LABEL_24:
  v23.receiver = self;
  v23.super_class = (Class)MFIMAPMessageDownload;
  [(MFIMAPCompoundDownload *)&v23 addCommandsToPipeline:v6 withCache:v7];
  [(MFIMAPMessageDownload *)self mf_unlock];
}

uint64_t __57__MFIMAPMessageDownload_addCommandsToPipeline_withCache___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 96) = 1;
  return result;
}

- (void)_addSubdownloadForBodyTextWithCache:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MFMessage *)self->_message account];
    id v6 = [v5 fetchLimits];
    uint64_t v7 = [v6 fetchMinBytes];

    if (v7) {
      BOOL v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      unint64_t v9 = 0x4000;
    }
    else {
      unint64_t v9 = v7;
    }
  }
  else
  {
    unint64_t v9 = 0x4000;
  }
  if (self->_nextByteToFetch)
  {
    char v10 = [(MFIMAPMessageDownload *)self _networkConverterWithConsumer:self->_textConsumer didReceiveData:0];
    uint64_t v11 = [(MFMessage *)self->_message messageSize];
    unint64_t nextByteToFetch = self->_nextByteToFetch;
    if (v9 >= v11 - nextByteToFetch) {
      unint64_t v9 = v11 - nextByteToFetch;
    }
    unint64_t v13 = objc_msgSend(v4, "downloadForUid:section:range:consumer:", -[MFIMAPDownload uid](self, "uid"), @"TEXT", nextByteToFetch, v9, v10);
    [(MFIMAPCompoundDownload *)self addSubdownload:v13];

    self->_unint64_t nextByteToFetch = v9 + nextByteToFetch;
  }
  else
  {
    char v14 = objc_alloc_init(_MFSharedBufferedDataConsumer);
    textConsumer = self->_textConsumer;
    self->_textConsumer = v14;

    uint64_t v16 = self->_textConsumer;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__MFIMAPMessageDownload__addSubdownloadForBodyTextWithCache___block_invoke;
    void v20[3] = &unk_1E5D3B5C0;
    v20[4] = self;
    char v10 = [(MFIMAPMessageDownload *)self _networkConverterWithConsumer:v16 didReceiveData:v20];
    unint64_t v17 = [(MFMessage *)self->_message messageSize];
    if (v17 <= v9)
    {
      id v19 = objc_msgSend(v4, "downloadForUid:section:expectedLength:consumer:", -[MFIMAPDownload uid](self, "uid"), @"TEXT", v17, v10);
      [(MFIMAPCompoundDownload *)self addSubdownload:v19];

      *((unsigned char *)self + 64) |= 0x20u;
    }
    else
    {
      v18 = objc_msgSend(v4, "downloadForUid:section:range:consumer:", -[MFIMAPDownload uid](self, "uid"), @"TEXT", self->_nextByteToFetch, v9, v10);
      [(MFIMAPCompoundDownload *)self addSubdownload:v18];

      self->_unint64_t nextByteToFetch = v9;
    }
  }
}

uint64_t __61__MFIMAPMessageDownload__addSubdownloadForBodyTextWithCache___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 97) = 1;
  return result;
}

- (void)setFetchBodyData:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 64) = *((unsigned char *)self + 64) & 0xBF | v3;
}

- (BOOL)fetchBodyData
{
  return (*((unsigned __int8 *)self + 64) >> 6) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textConsumer, 0);
  objc_storeStrong((id *)&self->_headerConsumer, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end