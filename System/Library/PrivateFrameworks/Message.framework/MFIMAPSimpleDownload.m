@interface MFIMAPSimpleDownload
- (BOOL)isComplete;
- (BOOL)isSuccessful;
- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 estimatedLength:(unint64_t)a5 consumer:(id)a6;
- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6;
- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 lengthIsKnown:(BOOL)a6 range:(_NSRange)a7 consumer:(id)a8;
- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6;
- (id)error;
- (id)section;
- (unint64_t)bytesFetched;
- (unint64_t)expectedLength;
- (unint64_t)lengthOfDataBeforeLineConversion;
- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4;
- (void)handleFetchResult:(id)a3;
- (void)processResults;
- (void)setError:(id)a3;
@end

@implementation MFIMAPSimpleDownload

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 lengthIsKnown:(BOOL)a6 range:(_NSRange)a7 consumer:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v12 = *(void *)&a3;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MFIMAPSimpleDownload;
  v16 = [(MFIMAPDownload *)&v26 initWithUid:v12];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    section = v16->_section;
    v16->_section = (NSString *)v17;

    v16->_NSUInteger length = a5;
    *((unsigned char *)v16 + 72) = *((unsigned char *)v16 + 72) & 0xFE | a6;
    v16->_range.NSUInteger location = location;
    v16->_range.NSUInteger length = length;
    v19 = (MFCountingDataConsumer *)objc_alloc_init(MEMORY[0x1E4F734B8]);
    countingConsumer = v16->super._countingConsumer;
    v16->super._countingConsumer = v19;

    id v21 = objc_alloc(MEMORY[0x1E4F73498]);
    v27[0] = v16->super._countingConsumer;
    v27[1] = v15;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    uint64_t v23 = [v21 initWithConsumers:v22];
    mainConsumer = v16->super._mainConsumer;
    v16->super._mainConsumer = (MFBaseFilterDataConsumer *)v23;
  }
  return v16;
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 estimatedLength:(unint64_t)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(void *)&a3, a4, a5, 0, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(void *)&a3, a4, a5, 1, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(void *)&a3, a4, a5.length, 1, a5.location, a5.length, a6);
}

- (id)section
{
  return self->_section;
}

- (unint64_t)expectedLength
{
  return self->_length;
}

- (unint64_t)bytesFetched
{
  [(MFIMAPSimpleDownload *)self mf_lock];
  unint64_t v3 = [(MFCountingDataConsumer *)self->super._countingConsumer count];
  [(MFIMAPSimpleDownload *)self mf_unlock];
  return v3;
}

- (void)handleFetchResult:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 type];
  switch(v4)
  {
    case 4:
      NSComparisonResult v8 = [(NSString *)self->_section caseInsensitiveCompare:@"HEADER"];
      break;
    case 5:
      NSComparisonResult v8 = [(NSString *)self->_section caseInsensitiveCompare:@"TEXT"];
      break;
    case 7:
      section = self->_section;
      v6 = [v12 section];
      uint64_t v7 = [(NSString *)section caseInsensitiveCompare:v6];

      if (v7) {
        goto LABEL_12;
      }
      goto LABEL_9;
    default:
      goto LABEL_12;
  }
  if (v8) {
    goto LABEL_12;
  }
LABEL_9:
  [(MFIMAPSimpleDownload *)self mf_lock];
  pendingFetchResults = self->super._pendingFetchResults;
  if (!pendingFetchResults)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = self->super._pendingFetchResults;
    self->super._pendingFetchResults = v10;

    pendingFetchResults = self->super._pendingFetchResults;
  }
  [(NSMutableArray *)pendingFetchResults addObject:v12];
  [(MFIMAPSimpleDownload *)self mf_unlock];
LABEL_12:
}

- (void)processResults
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(MFIMAPSimpleDownload *)self mf_lock];
  if ((*((unsigned char *)self + 72) & 2) == 0)
  {
    unint64_t v3 = +[MFActivityMonitor currentMonitor];
    uint64_t v4 = [(NSMutableArray *)self->super._pendingFetchResults count];
    [(NSMutableArray *)self->super._pendingFetchResults sortUsingFunction:_comparePartialFetchResults context:0];
    if (v4)
    {
      *(void *)&long long v5 = 138543874;
      long long v19 = v5;
      while (1)
      {
        if ((*((unsigned char *)self + 72) & 2) != 0) {
          goto LABEL_23;
        }
        [(NSMutableArray *)self->super._pendingFetchResults removeObjectAtIndex:0];
        unint64_t v6 = [(MFIMAPSimpleDownload *)self bytesFetched];
        unint64_t v7 = v6;
        char v8 = *((unsigned char *)self + 72);
        if ((v8 & 2) == 0 && self->_lastBytesFetched == v6)
        {
          *((unsigned char *)self + 72) = v8 | 2;
          v9 = +[MFIMAPConnection log];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            section = self->_section;
            unint64_t length = self->_length;
            *(_DWORD *)buf = v19;
            id v21 = section;
            __int16 v22 = 2048;
            unint64_t v23 = v7;
            __int16 v24 = 2048;
            unint64_t v25 = length;
            _os_log_error_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_ERROR, "Server returned less bytes than expected for part %{public}@ (%lu versus %lu)", buf, 0x20u);
          }

          char v8 = *((unsigned char *)self + 72);
        }
        if (v8 & 2) == 0 && (*((unsigned char *)self + 72))
        {
          BOOL v15 = v7 >= self->_length;
          *((unsigned char *)self + 72) = v8 & 0xFD | (2 * v15);
          if (!v15) {
            goto LABEL_19;
          }
        }
        else
        {
          *((unsigned char *)self + 72) = v8 | 2;
        }
        v10 = objc_msgSend(v3, "error", v19);
        v11 = v10;
        if (!v10) {
          break;
        }
        char v12 = objc_msgSend(v10, "mf_shouldFailDownload");
        char v13 = *((unsigned char *)self + 72);
        if ((v12 & 1) == 0) {
          goto LABEL_17;
        }
        char v14 = 0;
LABEL_18:
        *((unsigned char *)self + 72) = v13 & 0xFD | v14;

LABEL_19:
        if (!--v4) {
          goto LABEL_23;
        }
      }
      char v13 = *((unsigned char *)self + 72);
LABEL_17:
      char v14 = 2;
      goto LABEL_18;
    }
LABEL_23:
    if ((*((unsigned char *)self + 72) & 2) != 0 && self->_range.length == 0x7FFFFFFFFFFFFFFFLL) {
      self->_originalDataLength = [(MFIMAPSimpleDownload *)self bytesFetched];
    }
    v18 = [(MFIMAPDownload *)self mainConsumer];
    [v18 done];
  }
  [(MFIMAPSimpleDownload *)self mf_unlock];
}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  id v11 = a3;
  [(MFIMAPSimpleDownload *)self mf_lock];
  if (([v11 isFull] & 1) == 0 && !-[MFIMAPSimpleDownload isComplete](self, "isComplete"))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    unint64_t v6 = [(MFIMAPSimpleDownload *)self bytesFetched];
    [v5 appendString:@"BODY.PEEK["];
    if (self->_section) {
      objc_msgSend(v5, "appendString:");
    }
    [v5 appendString:@"]"];
    unint64_t length = self->_length;
    if (*((unsigned char *)self + 72))
    {
      length -= v6;
      self->_lastBytesFetched = [(MFIMAPSimpleDownload *)self bytesFetched];
      NSUInteger v8 = length;
      if (v6 || (NSUInteger v8 = self->_range.length, v8 != 0x7FFFFFFFFFFFFFFFLL))
      {
        if (v8)
        {
          [v5 appendString:@"<"];
          v9 = EFStringWithUnsignedInteger();
          [v5 appendString:v9];

          [v5 appendString:@"."];
          v10 = EFStringWithUnsignedInteger();
          [v5 appendString:v10];

          [v5 appendString:@">"];
        }
      }
    }
    [v11 addFetchCommandForUid:self->super._uid fetchItem:v5 expectedLength:length bodyDataConsumer:self->super._mainConsumer consumerSection:self->_section];
  }
  [(MFIMAPSimpleDownload *)self mf_unlock];
}

- (BOOL)isComplete
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (BOOL)isSuccessful
{
  return (*((unsigned char *)self + 72) & 2) != 0 && self->_error == 0;
}

- (id)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  id v5 = a3;
  [(MFIMAPSimpleDownload *)self mf_lock];
  objc_storeStrong((id *)&self->_error, a3);
  [(MFIMAPSimpleDownload *)self mf_unlock];
}

- (unint64_t)lengthOfDataBeforeLineConversion
{
  return self->_originalDataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end