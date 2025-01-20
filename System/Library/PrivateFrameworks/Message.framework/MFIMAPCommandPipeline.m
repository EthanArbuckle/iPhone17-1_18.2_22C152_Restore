@interface MFIMAPCommandPipeline
- (BOOL)isFull;
- (BOOL)isSending;
- (id)failureResponsesFromSendingCommandsWithConnection:(id)a3;
- (unint64_t)chunkSize;
- (unint64_t)expectedSize;
- (void)_removeFetchUnitMatchingResponse:(id)a3;
- (void)addFetchCommandForUid:(unsigned int)a3 fetchItem:(id)a4 expectedLength:(unint64_t)a5 bodyDataConsumer:(id)a6 consumerSection:(id)a7;
- (void)setChunkSize:(unint64_t)a3;
- (void)setFull:(BOOL)a3;
@end

@implementation MFIMAPCommandPipeline

- (void)addFetchCommandForUid:(unsigned int)a3 fetchItem:(id)a4 expectedLength:(unint64_t)a5 bodyDataConsumer:(id)a6 consumerSection:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v19 = a4;
  id v12 = a6;
  id v13 = a7;
  [(MFIMAPCommandPipeline *)self mf_lock];
  if (!self->_fetchUnits)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fetchUnits = self->_fetchUnits;
    self->_fetchUnits = v14;
  }
  v16 = objc_alloc_init(_MFIMAPFetchUnit);
  [(_MFIMAPFetchUnit *)v16 setUid:v10];
  [(_MFIMAPFetchUnit *)v16 setFetchItem:v19];
  [(_MFIMAPFetchUnit *)v16 setBodyDataConsumer:v12];
  [(_MFIMAPFetchUnit *)v16 setConsumerSection:v13];
  [(NSMutableArray *)self->_fetchUnits addObject:v16];
  unint64_t chunkSize = self->_chunkSize;
  unint64_t v18 = self->_expectedSize + a5;
  self->_expectedSize = v18;
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFE | (v18 >= chunkSize);
  [(MFIMAPCommandPipeline *)self mf_unlock];
}

- (unint64_t)expectedSize
{
  return self->_expectedSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_unint64_t chunkSize = a3;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setFull:(BOOL)a3
{
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFE | a3;
}

- (BOOL)isFull
{
  return *((unsigned char *)self + 24) & 1;
}

- (void)_removeFetchUnitMatchingResponse:(id)a3
{
  id v7 = a3;
  v4 = [v7 fetchResultWithType:8];
  int v5 = [v4 uid];

  if (v5 && [(NSMutableArray *)self->_fetchUnits count])
  {
    v6 = [(NSMutableArray *)self->_fetchUnits objectAtIndex:0];
    if ([v6 uid] == v5 && objc_msgSend(v6, "matchesFetchResponse:", v7)) {
      [(NSMutableArray *)self->_fetchUnits removeObjectAtIndex:0];
    }
  }
}

- (id)failureResponsesFromSendingCommandsWithConnection:(id)a3
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(MFIMAPCommandPipeline *)self mf_lock];
  unint64_t v4 = [(NSMutableArray *)self->_fetchUnits count];
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      v54 = -[NSMutableArray objectAtIndex:](self->_fetchUnits, "objectAtIndex:", i, v51);
      int v6 = [v54 uid];
      v55 = [v54 fetchItem];
      id v7 = [v54 bodyDataConsumer];
      if (!v7
        || ([v54 consumerSection],
            v8 = objc_claimAutoreleasedReturnValue(),
            BOOL v9 = v8 == 0,
            v8,
            v7,
            v9))
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = objc_alloc_init(MFIMAPResponseConsumer);
        v11 = [v54 bodyDataConsumer];
        id v12 = [v54 consumerSection];
        [(MFIMAPResponseConsumer *)v10 addConsumer:v11 forSection:v12];
      }
      unint64_t v13 = i + 1;
      if (i + 1 >= v4)
      {
        v14 = 0;
        int v25 = 1;
      }
      else
      {
        v14 = 0;
        v15 = v10;
        do
        {
          v16 = [(NSMutableArray *)self->_fetchUnits objectAtIndex:v13];
          if ([v16 uid] == v6)
          {
            [(NSMutableArray *)self->_fetchUnits removeObjectAtIndex:v13];
            [(NSMutableArray *)self->_fetchUnits insertObject:v16 atIndex:++i];
            v17 = [v16 fetchItem];
            char v18 = [v17 isEqual:v55];

            if ((v18 & 1) == 0)
            {
              if (!v14)
              {
                v14 = objc_msgSend(@"("), "mutableCopyWithZone:", 0;
                [v14 appendString:v55];
              }
              [v14 appendString:@" "];
              id v19 = [v16 fetchItem];
              [v14 appendString:v19];

              v20 = [v16 bodyDataConsumer];
              if (v20)
              {
                v21 = [v16 consumerSection];
                BOOL v22 = v21 == 0;

                if (!v22)
                {
                  if (!v15) {
                    v15 = objc_alloc_init(MFIMAPResponseConsumer);
                  }
                  v23 = [v16 bodyDataConsumer];
                  v24 = [v16 consumerSection];
                  [(MFIMAPResponseConsumer *)v15 addConsumer:v23 forSection:v24];
                }
              }
            }
          }

          ++v13;
        }
        while (v4 != v13);
        if (v14)
        {
          [v14 appendString:@""]);
          int v25 = 0;
        }
        else
        {
          int v25 = 1;
        }
        uint64_t v10 = v15;
      }
      v26 = [_MFIMAPCommandParameters alloc];
      uint64_t v27 = EFStringWithInt();
      v28 = (void *)v27;
      v29 = v55;
      if (!v25) {
        v29 = v14;
      }
      v66[0] = v27;
      v66[1] = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
      v31 = [(_MFIMAPCommandParameters *)v26 initWithCommand:21 arguments:v30];

      [(_MFIMAPCommandParameters *)v31 setResponseConsumer:v10];
      [v53 addObject:v31];
    }
  }
  if (objc_msgSend(v53, "count", v51))
  {
    *((unsigned char *)self + 24) |= 2u;
    objc_msgSend(v52, "mf_lock");
    double Current = CFAbsoluteTimeGetCurrent();
    id v33 = (id)[v52 _responseFromSendingCommands:v53];
    [v52 setReadBufferSizeFromElapsedTime:self->_expectedSize bytesRead:CFAbsoluteTimeGetCurrent() - Current];
    objc_msgSend(v52, "mf_unlock");
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v34 = v53;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v34);
          }
          v38 = [*(id *)(*((void *)&v60 + 1) + 8 * j) untaggedResponses];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v39 = v38;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
          if (v40)
          {
            uint64_t v41 = *(void *)v57;
            do
            {
              for (uint64_t k = 0; k != v40; ++k)
              {
                if (*(void *)v57 != v41) {
                  objc_enumerationMutation(v39);
                }
                v43 = *(void **)(*((void *)&v56 + 1) + 8 * k);
                if ([v43 isUntagged] && objc_msgSend(v43, "responseType") == 17) {
                  [(MFIMAPCommandPipeline *)self _removeFetchUnitMatchingResponse:v43];
                }
              }
              uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
            }
            while (v40);
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v35);
    }

    *((unsigned char *)self + 24) &= ~2u;
  }
  if ([(NSMutableArray *)self->_fetchUnits count])
  {
    v44 = self->_fetchUnits;
    fetchUnits = self->_fetchUnits;
    self->_fetchUnits = 0;
  }
  else
  {
    v44 = 0;
  }
  self->_expectedSize = 0;
  *((unsigned char *)self + 24) &= ~1u;
  [(MFIMAPCommandPipeline *)self mf_unlock];
  [v52 didFinishCommands:v53];
  unint64_t v46 = [(NSMutableArray *)v44 count];
  if (v46)
  {
    unint64_t v47 = 0;
    do
    {
      v48 = [(NSMutableArray *)v44 objectAtIndex:v47];
      v49 = (void *)[v48 copyFailedFetchResponse];
      if (v49)
      {
        [(NSMutableArray *)v44 replaceObjectAtIndex:v47++ withObject:v49];
      }
      else
      {
        [(NSMutableArray *)v44 removeObjectAtIndex:v47];
        --v46;
      }
    }
    while (v47 < v46);
  }
  if (![(NSMutableArray *)v44 count])
  {

    v44 = 0;
  }

  return v44;
}

- (BOOL)isSending
{
  return (*((unsigned __int8 *)self + 24) >> 1) & 1;
}

- (void).cxx_destruct
{
}

@end