@interface SRSensorWriterClient
+ (id)sensorWriterClientWithWriter:(id)a3;
- (SRSensorWriter)writer;
- (SRSensorWriterClient)initWithWriter:(id)a3;
- (void)resetDatastoreFiles:(id)a3;
- (void)setMonitoring:(BOOL)a3 withRequestedConfigurations:(id)a4;
- (void)setWriter:(id)a3;
@end

@implementation SRSensorWriterClient

+ (id)sensorWriterClientWithWriter:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithWriter:a3];

  return v3;
}

- (SRSensorWriterClient)initWithWriter:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SRSensorWriterClient;
  v4 = [(SRSensorWriterClient *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SRSensorWriterClient *)v4 setWriter:a3];
  }
  return v5;
}

- (void)resetDatastoreFiles:(id)a3
{
  v4 = [(SRSensorWriterClient *)self writer];

  [(SRSensorWriter *)v4 daemonForcedResetDatastoreFiles:a3];
}

- (void)setMonitoring:(BOOL)a3 withRequestedConfigurations:(id)a4
{
  BOOL v5 = a3;
  v6 = [(SRSensorWriterClient *)self writer];
  [(SRSensorWriter *)v6 set_requestedConfigurations:a4];

  [(SRSensorWriter *)v6 setMonitoring:v5];
}

- (SRSensorWriter)writer
{
  return (SRSensorWriter *)objc_loadWeak((id *)&self->_writer);
}

- (void)setWriter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end