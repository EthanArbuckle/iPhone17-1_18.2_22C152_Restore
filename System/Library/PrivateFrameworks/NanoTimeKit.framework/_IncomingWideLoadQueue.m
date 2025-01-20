@interface _IncomingWideLoadQueue
- (BOOL)addIncomingPart:(id)a3;
- (BOOL)isFull;
- (NSUUID)wideLoadId;
- (_IncomingWideLoadQueue)initWithPartialMessageTemplate:(id)a3;
- (id)getWideLoad;
- (unint64_t)partsAdded;
- (unint64_t)partsExpected;
- (void)dealloc;
@end

@implementation _IncomingWideLoadQueue

- (_IncomingWideLoadQueue)initWithPartialMessageTemplate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_IncomingWideLoadQueue;
  v5 = [(_IncomingWideLoadQueue *)&v18 init];
  if (!v5) {
    goto LABEL_5;
  }
  if ([v4 isPartial] && objc_msgSend(v4, "numberOfParts"))
  {
    uint64_t v6 = [v4 wideLoadId];
    wideLoadId = v5->_wideLoadId;
    v5->_wideLoadId = (NSUUID *)v6;

    v8 = [(NSUUID *)v5->_wideLoadId UUIDString];
    v9 = +[NSString stringWithFormat:@"Incoming-%@.data", v8];

    v10 = sub_100033FA4();
    uint64_t v11 = [v10 stringByAppendingPathComponent:v9];
    tempFilePath = v5->_tempFilePath;
    v5->_tempFilePath = (NSString *)v11;

    v5->_maxPartSize = (unint64_t)[v4 maxPartSize];
    v5->_partsExpected = (unint64_t)[v4 numberOfParts];
    v5->_partsAdded = 0;
    v13 = (NTKDSyncMessage *)[v4 copyWithoutPayload];
    wideLoadMessageTemplate = v5->_wideLoadMessageTemplate;
    v5->_wideLoadMessageTemplate = v13;

    [(NTKDSyncMessage *)v5->_wideLoadMessageTemplate setWideLoadId:0];
    [(NTKDSyncMessage *)v5->_wideLoadMessageTemplate setNumberOfParts:0];
    [(NTKDSyncMessage *)v5->_wideLoadMessageTemplate setPartNumber:0];
    [(NTKDSyncMessage *)v5->_wideLoadMessageTemplate setMaxPartSize:0];

LABEL_5:
    v15 = v5;
    goto LABEL_9;
  }
  v16 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000448D8();
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (void)dealloc
{
  v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:self->_tempFilePath error:0];

  v4.receiver = self;
  v4.super_class = (Class)_IncomingWideLoadQueue;
  [(_IncomingWideLoadQueue *)&v4 dealloc];
}

- (BOOL)addIncomingPart:(id)a3
{
  id v4 = a3;
  if (![v4 isPartial] || !objc_msgSend(v4, "numberOfParts"))
  {
    v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100044950();
    }

    goto LABEL_12;
  }
  if (self->_partsAdded >= self->_partsExpected)
  {
    v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000449C8();
    }

    goto LABEL_12;
  }
  if (self->_maxPartSize) {
    unint64_t maxPartSize = self->_maxPartSize;
  }
  else {
    unint64_t maxPartSize = 4608000;
  }
  if (!objc_msgSend(v4, "getPayloadDataIntoFile:toOffset:", self->_tempFilePath, (void)objc_msgSend(v4, "partNumber") * maxPartSize))
  {
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  ++self->_partsAdded;
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)isFull
{
  return self->_partsAdded == self->_partsExpected;
}

- (id)getWideLoad
{
  if ([(_IncomingWideLoadQueue *)self isFull])
  {
    id v3 = [(NTKDSyncMessage *)self->_wideLoadMessageTemplate copyWithoutPayload];
    if ([v3 setPayloadDataFromFile:self->_tempFilePath]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100044A44(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v4 = 0;
  }
  return v4;
}

- (NSUUID)wideLoadId
{
  return self->_wideLoadId;
}

- (unint64_t)partsExpected
{
  return self->_partsExpected;
}

- (unint64_t)partsAdded
{
  return self->_partsAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideLoadMessageTemplate, 0);
  objc_storeStrong((id *)&self->_tempFilePath, 0);
  objc_storeStrong((id *)&self->_wideLoadId, 0);
}

@end