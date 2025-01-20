@interface _MFDAMessageStoreFetchRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserRequested;
- (BOOL)shouldSend;
- (unint64_t)generationNumber;
- (unint64_t)hash;
@end

@implementation _MFDAMessageStoreFetchRequest

- (unint64_t)generationNumber
{
  unint64_t v4 = [(MFMessage *)self->message generationNumber];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:1281 description:@"fetchable messages should have non-zero generationNumer"];
  }
  return v4;
}

- (BOOL)shouldSend
{
  part = self->part;
  if (part)
  {
    uint64_t v4 = -[MFLibraryStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:](self->store, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", part, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
LABEL_5:
    v6 = (void *)v4;
    goto LABEL_6;
  }
  message = self->message;
  if (message)
  {
    uint64_t v4 = [(MFLibraryStore *)self->store bodyDataForMessage:message isComplete:0 isPartial:0 downloadIfNecessary:0];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  uint64_t v7 = [v6 length];
  if (v7)
  {
    v8 = [[MFDAMessagePayloadFetchResponseImpl alloc] initWithData:v6 streaming:0 streamingDone:0];
    [(MFRequestQueueResponseConsumer *)self->consumer handleResponse:v8 error:0];
  }
  return v7 == 0;
}

- (BOOL)isUserRequested
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(MFMessage *)self->message remoteID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(MFMessage *)self->message remoteID];
    v6 = [v4[6] remoteID];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->part, 0);
  objc_storeStrong((id *)&self->message, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->consumer, 0);
}

@end