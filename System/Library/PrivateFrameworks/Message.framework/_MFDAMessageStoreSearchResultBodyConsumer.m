@interface _MFDAMessageStoreSearchResultBodyConsumer
- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4;
- (BOOL)waitUntilDoneBeforeDate:(id)a3;
- (MFDAStreamingContentConsumer)streamConsumer;
- (MFError)error;
- (_MFDAMessageStoreSearchResultBodyConsumer)init;
- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5;
- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6;
- (void)didEndStreamingForMailMessage:(id)a3;
- (void)searchResultFetchedWithResponses:(id)a3;
- (void)setError:(id)a3;
- (void)setStreamConsumer:(id)a3;
- (void)waitUntilDone;
@end

@implementation _MFDAMessageStoreSearchResultBodyConsumer

- (_MFDAMessageStoreSearchResultBodyConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MFDAMessageStoreSearchResultBodyConsumer;
  v2 = [(_MFDAMessageStoreSearchResultBodyConsumer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"done" condition:0 andDelegate:v2];
    doneCondition = v2->_doneCondition;
    v2->_doneCondition = (MFConditionLock *)v3;
  }
  return v2;
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4 = a3;
  int v5 = [(MFConditionLock *)self->_doneCondition lockWhenCondition:1 beforeDate:v4];
  if (v5) {
    [(MFConditionLock *)self->_doneCondition unlock];
  }

  return v5;
}

- (void)waitUntilDone
{
  [(MFConditionLock *)self->_doneCondition lockWhenCondition:1];
  doneCondition = self->_doneCondition;
  [(MFConditionLock *)doneCondition unlock];
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  int64_t v12 = a3;
  id v6 = a5;
  id v11 = v6;
  MFWalkUpDAErrorChain(&v11, &v12);
  id v7 = v11;

  char v8 = v12 + 1;
  if ((unint64_t)(v12 + 1) <= 0xD)
  {
    if (((1 << v8) & 0x2C0) != 0)
    {
      uint64_t v9 = 1040;
      goto LABEL_12;
    }
    if (((1 << v8) & 0x2400) != 0)
    {
      uint64_t v9 = 1033;
      goto LABEL_12;
    }
    if (v12 == -1)
    {
      uint64_t v9 = 1028;
      goto LABEL_12;
    }
  }
  if (v12 == 63 || v12 == 79) {
    uint64_t v9 = 1032;
  }
  else {
    uint64_t v9 = 1045;
  }
LABEL_12:
  v10 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:v9 localizedDescription:0];
  [(_MFDAMessageStoreSearchResultBodyConsumer *)self setError:v10];
  [(MFConditionLock *)self->_doneCondition lock];
  [(MFConditionLock *)self->_doneCondition unlockWithCondition:1];
}

- (void)searchResultFetchedWithResponses:(id)a3
{
  [(MFConditionLock *)self->_doneCondition lock];
  doneCondition = self->_doneCondition;
  [(MFConditionLock *)doneCondition unlockWithCondition:1];
}

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(_MFDAMessageStoreSearchResultBodyConsumer *)self streamConsumer];
  LOBYTE(v4) = [v7 shouldBeginStreamingForMailMessage:v6 format:v4];

  return v4;
}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v11 = a6;
  v10 = [(_MFDAMessageStoreSearchResultBodyConsumer *)self streamConsumer];
  [v10 consumeData:a3 length:v7 format:v6 mailMessage:v11];
}

- (void)didEndStreamingForMailMessage:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(_MFDAMessageStoreSearchResultBodyConsumer *)self streamConsumer];
  [v4 didEndStreamingForMailMessage:v5];
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MFDAStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamConsumer, 0);
  objc_storeStrong((id *)&self->_doneCondition, 0);
}

@end