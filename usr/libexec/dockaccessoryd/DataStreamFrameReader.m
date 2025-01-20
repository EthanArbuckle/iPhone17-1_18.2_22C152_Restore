@interface DataStreamFrameReader
+ (id)logCategory;
- (BOOL)hasCompleteFrame;
- (BOOL)hasFailed;
- (BOOL)hasPartialData;
- (DataStreamFrameReader)init;
- (id)popRawFrame;
- (unint64_t)_getCurrentFrameSize;
- (unint64_t)bytesNeededForCurrentFrame;
- (void)_readFrameHeaderIfPossible;
- (void)pushFrameData:(id)a3;
- (void)reset;
@end

@implementation DataStreamFrameReader

- (DataStreamFrameReader)init
{
  v3.receiver = self;
  v3.super_class = (Class)DataStreamFrameReader;
  result = [(DataStreamFrameReader *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_headerInfoRead = 0;
    result->_payloadLength = 0;
    result->_currentframeType = 0;
  }
  return result;
}

- (BOOL)hasFailed
{
  return self->_streamFailed;
}

- (BOOL)hasCompleteFrame
{
  return ![(DataStreamFrameReader *)self hasFailed]
      && [(DataStreamFrameReader *)self bytesNeededForCurrentFrame] == 0;
}

- (BOOL)hasPartialData
{
  return self->_partialFrame
      && [(DataStreamFrameReader *)self bytesNeededForCurrentFrame] != 0;
}

- (unint64_t)_getCurrentFrameSize
{
  unsigned int v2 = self->_currentframeType - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return self->_payloadLength + qword_10023FA18[(char)v2];
  }
}

- (unint64_t)bytesNeededForCurrentFrame
{
  if ([(DataStreamFrameReader *)self hasFailed]) {
    return 0;
  }
  partialFrame = self->_partialFrame;
  if (!partialFrame) {
    return 4;
  }
  size_t size = dispatch_data_get_size(partialFrame);
  size_t v6 = size;
  if (!self->_headerInfoRead) {
    return 4 - size;
  }
  unint64_t v7 = [(DataStreamFrameReader *)self _getCurrentFrameSize];
  if (v7 >= v6) {
    return v7 - v6;
  }
  else {
    return 0;
  }
}

- (void)pushFrameData:(id)a3
{
  data2 = a3;
  if (![(DataStreamFrameReader *)self hasFailed])
  {
    partialFrame = self->_partialFrame;
    if (partialFrame) {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(partialFrame, data2);
    }
    else {
      concat = data2;
    }
    size_t v6 = self->_partialFrame;
    self->_partialFrame = concat;

    [(DataStreamFrameReader *)self _readFrameHeaderIfPossible];
  }
}

- (void)_readFrameHeaderIfPossible
{
  if (!self->_headerInfoRead)
  {
    p_currentframeType = &self->_currentframeType;
    p_payloadLength = &self->_payloadLength;
    BOOL v5 = +[DataStreamMessageCoder readHeaderFromPartialData:self->_partialFrame frameType:&self->_currentframeType payloadLength:&self->_payloadLength];
    self->_headerInfoRead = v5;
    if (v5)
    {
      if (*p_payloadLength - 1048572 <= 0xFFFFFFFFFFEFFFFFLL)
      {
        partialFrame = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
      if (*p_currentframeType - 1 >= 3)
      {
        unint64_t v7 = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
    }
  }
}

- (void)reset
{
  partialFrame = self->_partialFrame;
  self->_partialFrame = 0;

  *(_WORD *)&self->_headerInfoRead = 0;
}

- (id)popRawFrame
{
  if ([(DataStreamFrameReader *)self hasCompleteFrame])
  {
    size_t v3 = [(DataStreamFrameReader *)self _getCurrentFrameSize];
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_partialFrame, 0, v3);
    partialFrame = self->_partialFrame;
    size_t size = dispatch_data_get_size(partialFrame);
    size_t v7 = size - v3;
    if (size == v3)
    {
      [(DataStreamFrameReader *)self reset];
    }
    else
    {
      dispatch_data_t v8 = dispatch_data_create_subrange(partialFrame, v3, v7);
      [(DataStreamFrameReader *)self reset];
      [(DataStreamFrameReader *)self pushFrameData:v8];
    }
  }
  else
  {
    dispatch_data_t subrange = 0;
  }

  return subrange;
}

+ (id)logCategory
{
  if (qword_1002AD678 != -1) {
    dispatch_once(&qword_1002AD678, &stru_1002734C0);
  }
  unsigned int v2 = (void *)qword_1002AD680;

  return v2;
}

- (void).cxx_destruct
{
}

@end