@interface SEProxyWithRemoteTransceiver
- (void)setRemoteTransceiver:(id)a3;
- (void)transceive:(id)a3 callback:(id)a4;
@end

@implementation SEProxyWithRemoteTransceiver

- (void)setRemoteTransceiver:(id)a3
{
}

- (void)transceive:(id)a3 callback:(id)a4
{
  remoteTransceiver = self->_remoteTransceiver;
  id v10 = 0;
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(STSRemoteTransceiverProxy *)remoteTransceiver transceive:v7 outError:&v10];
  id v9 = v10;
  NSLog(&cfstr_SertRemoteTran.isa, v7, v8, v9);

  v6[2](v6, v8, v9);
}

- (void).cxx_destruct
{
}

@end