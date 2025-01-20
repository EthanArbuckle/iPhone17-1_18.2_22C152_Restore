@interface EPSagaTransactionPairingReaderEntry
- (EPCharacteristicReader)reader;
- (EPDevice)device;
- (EPPairer)pairer;
- (NSData)oobKey;
- (void)setDevice:(id)a3;
- (void)setOobKey:(id)a3;
- (void)setPairer:(id)a3;
- (void)setReader:(id)a3;
@end

@implementation EPSagaTransactionPairingReaderEntry

- (EPCharacteristicReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (EPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (EPPairer)pairer
{
  return self->_pairer;
}

- (void)setPairer:(id)a3
{
}

- (NSData)oobKey
{
  return self->_oobKey;
}

- (void)setOobKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobKey, 0);
  objc_storeStrong((id *)&self->_pairer, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end