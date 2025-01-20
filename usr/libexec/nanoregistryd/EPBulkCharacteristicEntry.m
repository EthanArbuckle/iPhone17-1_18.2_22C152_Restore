@interface EPBulkCharacteristicEntry
- (EPCharacteristicReader)reader;
- (EPCharacteristicWriter)writer;
- (EPDevice)device;
- (void)setDevice:(id)a3;
- (void)setReader:(id)a3;
- (void)setWriter:(id)a3;
@end

@implementation EPBulkCharacteristicEntry

- (EPCharacteristicReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (EPCharacteristicWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
}

- (EPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_writer, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end