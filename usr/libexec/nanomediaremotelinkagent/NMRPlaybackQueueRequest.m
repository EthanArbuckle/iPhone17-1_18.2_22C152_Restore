@interface NMRPlaybackQueueRequest
- (NMRPlaybackQueueRequest)initWithProtobufData:(id)a3;
- (NMRPlaybackQueueRequest)initWithRequest:(void *)a3 playerPath:(void *)a4;
- (id)protobufData;
- (void)performWithQueue:(id)a3 completion:(id)a4;
- (void)playerPath;
- (void)request;
@end

@implementation NMRPlaybackQueueRequest

- (NMRPlaybackQueueRequest)initWithRequest:(void *)a3 playerPath:(void *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NMRPlaybackQueueRequest;
  v4 = [(NMRPlaybackQueueRequest *)&v10 init];
  if (v4)
  {
    v5 = objc_alloc_init(_NMRPlaybackQueueRequestProtobuf);
    protobuf = v4->_protobuf;
    v4->_protobuf = v5;

    ExternalRepresentation = (void *)MRPlaybackQueueRequestCreateExternalRepresentation();
    [(_NMRPlaybackQueueRequestProtobuf *)v4->_protobuf setRequest:ExternalRepresentation];

    v8 = (void *)MRNowPlayingPlayerPathCreateExternalRepresentation();
    [(_NMRPlaybackQueueRequestProtobuf *)v4->_protobuf setPlayerPath:v8];
  }
  return v4;
}

- (void)request
{
  v2 = [(_NMRPlaybackQueueRequestProtobuf *)self->_protobuf request];
  v3 = (const void *)MRPlaybackQueueRequestCreateFromExternalRepresentation();
  CFTypeRef v4 = CFAutorelease(v3);

  return (void *)v4;
}

- (void)playerPath
{
  v2 = [(_NMRPlaybackQueueRequestProtobuf *)self->_protobuf playerPath];
  v3 = (const void *)MRNowPlayingPlayerPathCreateFromExternalRepresentation();
  CFTypeRef v4 = CFAutorelease(v3);

  return (void *)v4;
}

- (void)performWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NMRPlaybackQueueRequest *)self request];
  [(NMRPlaybackQueueRequest *)self playerPath];
  v9 = v6;
  id v8 = v6;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

- (NMRPlaybackQueueRequest)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMRPlaybackQueueRequest;
  v5 = [(NMRPlaybackQueueRequest *)&v9 init];
  if (v5)
  {
    id v6 = [[_NMRPlaybackQueueRequestProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;
  }
  return v5;
}

- (id)protobufData
{
  return [(_NMRPlaybackQueueRequestProtobuf *)self->_protobuf data];
}

- (void).cxx_destruct
{
}

@end