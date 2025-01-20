@interface _OutgoingWideLoadQueue
- (BOOL)isEmpty;
- (NSUUID)wideLoadId;
- (_OutgoingWideLoadQueue)initWithWideLoadMessage:(id)a3 maxPartSize:(unint64_t)a4;
- (id)dequeueNextPart;
- (unint64_t)partsAdded;
- (unint64_t)partsRemaining;
- (void)dealloc;
@end

@implementation _OutgoingWideLoadQueue

- (_OutgoingWideLoadQueue)initWithWideLoadMessage:(id)a3 maxPartSize:(unint64_t)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_OutgoingWideLoadQueue;
  v7 = [(_OutgoingWideLoadQueue *)&v21 init];
  if (v7)
  {
    if (([v6 isPartial] & 1) != 0 || !objc_msgSend(v6, "payloadSize"))
    {
      v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000447E4();
      }
    }
    else
    {
      uint64_t v8 = +[NSUUID UUID];
      wideLoadId = v7->_wideLoadId;
      v7->_wideLoadId = (NSUUID *)v8;

      v10 = [(NSUUID *)v7->_wideLoadId UUIDString];
      v11 = +[NSString stringWithFormat:@"Outgoing-%@.data", v10];

      v12 = sub_100033FA4();
      uint64_t v13 = [v12 stringByAppendingPathComponent:v11];
      tempFilePath = v7->_tempFilePath;
      v7->_tempFilePath = (NSString *)v13;

      if ([v6 getPayloadDataIntoFile:v7->_tempFilePath])
      {
        v7->_maxPartSize = a4;
        if (!a4) {
          a4 = 4608000;
        }
        unint64_t v15 = ((unint64_t)[v6 payloadSize] + a4 - 1) / a4;
        v7->_partsAdded = v15;
        v7->_partsRemaining = v15;
        v16 = (NTKDSyncMessage *)[v6 copyWithoutPayload];
        partialMessageTemplate = v7->_partialMessageTemplate;
        v7->_partialMessageTemplate = v16;

        [(NTKDSyncMessage *)v7->_partialMessageTemplate setWideLoadId:v7->_wideLoadId];
        [(NTKDSyncMessage *)v7->_partialMessageTemplate setNumberOfParts:v7->_partsAdded];
        [(NTKDSyncMessage *)v7->_partialMessageTemplate setMaxPartSize:v7->_maxPartSize];
        [(NTKDSyncMessage *)v7->_partialMessageTemplate setPartNumber:0];

        goto LABEL_8;
      }
    }
    v18 = 0;
    goto LABEL_13;
  }
LABEL_8:
  v18 = v7;
LABEL_13:

  return v18;
}

- (void)dealloc
{
  v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:self->_tempFilePath error:0];

  v4.receiver = self;
  v4.super_class = (Class)_OutgoingWideLoadQueue;
  [(_OutgoingWideLoadQueue *)&v4 dealloc];
}

- (BOOL)isEmpty
{
  return self->_partsRemaining == 0;
}

- (id)dequeueNextPart
{
  unint64_t partsRemaining = self->_partsRemaining;
  if (partsRemaining)
  {
    unint64_t v4 = self->_partsAdded - partsRemaining;
    if (self->_maxPartSize) {
      unint64_t maxPartSize = self->_maxPartSize;
    }
    else {
      unint64_t maxPartSize = 4608000;
    }
    self->_unint64_t partsRemaining = partsRemaining - 1;
    id v6 = [(NTKDSyncMessage *)self->_partialMessageTemplate copyWithoutPayload];
    if ([v6 setPayloadDataFromFile:self->_tempFilePath fromOffset:maxPartSize * v4 length:maxPartSize])
    {
      [v6 setPartNumber:v4];
      id v7 = v6;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004485C();
    }

    id v7 = 0;
  }

  return v7;
}

- (NSUUID)wideLoadId
{
  return self->_wideLoadId;
}

- (unint64_t)partsAdded
{
  return self->_partsAdded;
}

- (unint64_t)partsRemaining
{
  return self->_partsRemaining;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialMessageTemplate, 0);
  objc_storeStrong((id *)&self->_tempFilePath, 0);

  objc_storeStrong((id *)&self->_wideLoadId, 0);
}

@end