@interface MFIMAPCompoundDownload
- (BOOL)isComplete;
- (BOOL)isSuccessful;
- (id)subdownloads;
- (unint64_t)bytesFetched;
- (unint64_t)expectedLength;
- (unint64_t)lengthOfDataBeforeLineConversion;
- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4;
- (void)addSubdownload:(id)a3;
- (void)processResults;
- (void)removeSubdownload:(id)a3;
@end

@implementation MFIMAPCompoundDownload

- (id)subdownloads
{
  [(MFIMAPCompoundDownload *)self mf_lock];
  if (self->_subdownloads) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_subdownloads];
  }
  else {
    v3 = 0;
  }
  [(MFIMAPCompoundDownload *)self mf_unlock];
  return v3;
}

- (void)addSubdownload:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  [(MFIMAPCompoundDownload *)self mf_lock];
  subdownloads = self->_subdownloads;
  if (subdownloads)
  {
    if ([(NSMutableArray *)subdownloads indexOfObjectIdenticalTo:v4] == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_subdownloads addObject:v4];
    }
  }
  else
  {
    v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v8 count:1];
    v7 = self->_subdownloads;
    self->_subdownloads = v6;
  }
  [(MFIMAPCompoundDownload *)self mf_unlock];
}

- (void)removeSubdownload:(id)a3
{
  id v4 = a3;
  [(MFIMAPCompoundDownload *)self mf_lock];
  [(NSMutableArray *)self->_subdownloads removeObjectIdenticalTo:v4];
  [(MFIMAPCompoundDownload *)self mf_unlock];
}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_subdownloads && ([v6 isFull] & 1) == 0)
  {
    [(MFIMAPCompoundDownload *)self mf_lock];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = self->_subdownloads;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isComplete", (void)v13) & 1) == 0) {
          [v12 addCommandsToPipeline:v6 withCache:v7];
        }
        if ([v6 isFull]) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    [(MFIMAPCompoundDownload *)self mf_unlock];
  }
}

- (void)processResults
{
  [(MFIMAPCompoundDownload *)self mf_lock];
  [(NSMutableArray *)self->_subdownloads makeObjectsPerformSelector:a2];
  [(MFIMAPCompoundDownload *)self mf_unlock];
}

- (BOOL)isComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_subdownloads) {
    return 1;
  }
  [(MFIMAPCompoundDownload *)self mf_lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_subdownloads;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isComplete", (void)v9) & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_12:

  [(MFIMAPCompoundDownload *)self mf_unlock];
  return v7;
}

- (BOOL)isSuccessful
{
  [(MFIMAPCompoundDownload *)self mf_lock];
  subdownloads = self->_subdownloads;
  if (subdownloads) {
    char v4 = [(NSMutableArray *)subdownloads ef_all:&__block_literal_global_33];
  }
  else {
    char v4 = 1;
  }
  [(MFIMAPCompoundDownload *)self mf_unlock];
  return v4;
}

uint64_t __38__MFIMAPCompoundDownload_isSuccessful__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuccessful];
}

- (unint64_t)expectedLength
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_subdownloads) {
    return 0;
  }
  [(MFIMAPCompoundDownload *)self mf_lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_subdownloads;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "expectedLength", (void)v11);
      unint64_t v9 = 0xFFFFFFFFLL;
      if (v8 == 0xFFFFFFFFLL) {
        break;
      }
      v5 += v8;
      if (v4 == ++v7)
      {
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        unint64_t v9 = v5;
        if (v4) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  [(MFIMAPCompoundDownload *)self mf_unlock];
  return v9;
}

- (unint64_t)bytesFetched
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_subdownloads) {
    return 0;
  }
  [(MFIMAPCompoundDownload *)self mf_lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_subdownloads;
  unint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "bytesFetched", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(MFIMAPCompoundDownload *)self mf_unlock];
  return v4;
}

- (unint64_t)lengthOfDataBeforeLineConversion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  subdownloads = self->_subdownloads;
  if (!subdownloads) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = subdownloads;
  unint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "lengthOfDataBeforeLineConversion", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end