@interface MFDAMessageContentConsumer
- (BOOL)didBeginStreaming;
- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4;
- (BOOL)succeeded;
- (DAMailMessage)message;
- (MFCollectingDataConsumer)alternatePartConsumer;
- (MFCollectingDataConsumer)dataConsumer;
- (MFMessageDataConsumerFactory)consumerFactory;
- (NSMutableData)bodyData;
- (double)timeOfLastActivity;
- (id)dataConsumerForPart:(id)a3;
- (int)requestedFormat;
- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6;
- (void)didEndStreamingForMailMessage:(id)a3;
- (void)setAlternatePartConsumer:(id)a3;
- (void)setConsumerFactory:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setRequestedFormat:(int)a3;
@end

@implementation MFDAMessageContentConsumer

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  self->_didBeginStreaming = 1;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  return 1;
}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  id v33 = a6;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  if (a5) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = self->_requestedFormat == 1;
  }
  v11 = (char *)malloc_type_malloc(a4, 0x100004077774924uLL);
  int v12 = 0;
  v13 = v11;
  v14 = a3;
  do
  {
    size_t v15 = a3 - v14 + a4;
    v16 = memccpy(v13, v14, 13, v15);
    if (v16)
    {
      v14 += v16 - v13;
      v13 = v16 - 1;
      ++v12;
      int64_t v17 = v14 - a3;
    }
    else
    {
      v14 = &a3[a4];
      v13 += v15;
      int64_t v17 = a4;
    }
  }
  while (v17 < a4);
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F734C0]) initWithBytesNoCopy:v11 length:v13 - v11];
  if ([v18 length] != a4 - v12)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MFDAMessageContentConsumer.m" lineNumber:73 description:@"sanity check \r removal."];

    if (v10) {
      goto LABEL_11;
    }
LABEL_18:
    bodyData = self->_bodyData;
    if (bodyData)
    {
      [(NSMutableData *)bodyData appendData:v18];
    }
    else
    {
      v30 = (NSMutableData *)[v18 mutableCopy];
      v31 = self->_bodyData;
      self->_bodyData = v30;
    }
    v27 = [(MFDAMessageContentConsumer *)self dataConsumer];
    [v27 appendData:v18];
    goto LABEL_22;
  }
  if (!v10) {
    goto LABEL_18;
  }
LABEL_11:
  if (!self->_triedCreatingAlternatePartConsumer)
  {
    self->_triedCreatingAlternatePartConsumer = 1;
    v19 = [(MFDAMessageContentConsumer *)self consumerFactory];
    v20 = [v19 dataConsumerForPart:@"1.1"];
    [(MFDAMessageContentConsumer *)self setAlternatePartConsumer:v20];

    v21 = [(MFDAMessageContentConsumer *)self alternatePartConsumer];

    if (v21)
    {
      copyRFC822DataForPlainTextMessage(v33, 0, 1);
      v22 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      v23 = self->_bodyData;
      self->_bodyData = v22;

      v24 = [(MFDAMessageContentConsumer *)self dataConsumer];
      v25 = [(MFDAMessageContentConsumer *)self bodyData];
      [v24 appendData:v25];
    }
    else
    {
      v26 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F73540]) initWithCapacity:0];
      v24 = self->_bodyData;
      self->_bodyData = v26;
    }
  }
  v27 = [(MFDAMessageContentConsumer *)self alternatePartConsumer];
  [v27 appendData:v18];
LABEL_22:
}

- (void)didEndStreamingForMailMessage:(id)a3
{
  v4 = (DAMailMessage *)a3;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  v5 = [(MFDAMessageContentConsumer *)self alternatePartConsumer];
  [v5 done];

  v6 = [(MFDAMessageContentConsumer *)self dataConsumer];
  [v6 done];

  message = self->_message;
  self->_message = v4;

  self->_succeeded = 1;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (BOOL)didBeginStreaming
{
  return self->_didBeginStreaming;
}

- (id)dataConsumerForPart:(id)a3
{
  id v4 = a3;
  v5 = [(MFDAMessageContentConsumer *)self consumerFactory];
  v6 = [v5 dataConsumerForPart:v4];

  return v6;
}

- (MFCollectingDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (MFCollectingDataConsumer)alternatePartConsumer
{
  return self->_alternatePartConsumer;
}

- (void)setAlternatePartConsumer:(id)a3
{
}

- (DAMailMessage)message
{
  return self->_message;
}

- (NSMutableData)bodyData
{
  return self->_bodyData;
}

- (MFMessageDataConsumerFactory)consumerFactory
{
  return self->_consumerFactory;
}

- (void)setConsumerFactory:(id)a3
{
}

- (int)requestedFormat
{
  return self->_requestedFormat;
}

- (void)setRequestedFormat:(int)a3
{
  self->_requestedFormat = a3;
}

- (double)timeOfLastActivity
{
  return self->_timeOfLastActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_consumerFactory, 0);
  objc_storeStrong((id *)&self->_alternatePartConsumer, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end