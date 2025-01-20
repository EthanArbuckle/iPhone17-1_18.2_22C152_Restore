@interface _MFOutgoingMessageBody
- (BOOL)isLastCharacterNewLine;
- (_MFOutgoingMessageBody)init;
- (id)rawData;
- (int64_t)appendData:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)done;
@end

@implementation _MFOutgoingMessageBody

- (_MFOutgoingMessageBody)init
{
  v4.receiver = self;
  v4.super_class = (Class)_MFOutgoingMessageBody;
  v2 = [(_MFOutgoingMessageBody *)&v4 init];
  if (v2) {
    v2->_consumer = (MFBufferedDataConsumer *)objc_alloc_init(MEMORY[0x1E4F734A8]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFOutgoingMessageBody;
  [(_MFOutgoingMessageBody *)&v3 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)isLastCharacterNewLine
{
  return self->_lastNewLine;
}

- (id)rawData
{
  rawData = self->_rawData;
  if (rawData)
  {
    objc_super v3 = rawData;
    return v3;
  }
  else
  {
    consumer = self->_consumer;
    return [(MFBufferedDataConsumer *)consumer data];
  }
}

- (int64_t)appendData:(id)a3
{
  int64_t v5 = -[MFBufferedDataConsumer appendData:](self->_consumer, "appendData:");
  if (v5 >= 1)
  {
    self->_lastNewLine = *(unsigned char *)(v5 + [a3 bytes] - 1) == 10;
    self->_count += v5;
  }
  return v5;
}

- (void)done
{
  self->_rawData = (NSData *)[(MFBufferedDataConsumer *)self->_consumer data];

  self->_consumer = 0;
}

@end