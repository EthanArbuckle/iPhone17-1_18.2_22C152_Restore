@interface _ML3MutableDatabaseConnectionPoolDiagnostic
- (void)setReaderAvailableConnections:(id)a3;
- (void)setReaderBusyConnections:(id)a3;
- (void)setWriterAvailableConnections:(id)a3;
- (void)setWriterBusyConnections:(id)a3;
@end

@implementation _ML3MutableDatabaseConnectionPoolDiagnostic

- (void)setWriterBusyConnections:(id)a3
{
  if (self->super._writerBusyConnections != a3)
  {
    self->super._writerBusyConnections = (NSArray *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setWriterAvailableConnections:(id)a3
{
  if (self->super._writerAvailableConnections != a3)
  {
    self->super._writerAvailableConnections = (NSArray *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setReaderBusyConnections:(id)a3
{
  if (self->super._readerBusyConnections != a3)
  {
    self->super._readerBusyConnections = (NSArray *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setReaderAvailableConnections:(id)a3
{
  if (self->super._readerAvailableConnections != a3)
  {
    self->super._readerAvailableConnections = (NSArray *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

@end