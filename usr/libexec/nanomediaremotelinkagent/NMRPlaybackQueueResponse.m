@interface NMRPlaybackQueueResponse
- (NMRPlaybackQueueResponse)initWithPlaybackQueue:(void *)a3 error:(__CFError *)a4;
- (NMRPlaybackQueueResponse)initWithProtobufData:(id)a3;
- (__CFError)error;
- (id)protobufData;
- (void)invokeCompletion:(id)a3;
- (void)playbackQueue;
@end

@implementation NMRPlaybackQueueResponse

- (NMRPlaybackQueueResponse)initWithPlaybackQueue:(void *)a3 error:(__CFError *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)NMRPlaybackQueueResponse;
  v6 = [(NMRPlaybackQueueResponse *)&v15 init];
  if (v6)
  {
    v7 = objc_alloc_init(_NMRPlaybackQueueResponseProtobuf);
    protobuf = v6->_protobuf;
    v6->_protobuf = v7;

    if (a3)
    {
      ExternalRepresentation = (void *)MRPlaybackQueueCreateExternalRepresentation();
      [(_NMRPlaybackQueueResponseProtobuf *)v6->_protobuf setPlaybackQueue:ExternalRepresentation];
    }
    if (a4)
    {
      id v14 = 0;
      v10 = +[NSKeyedArchiver archivedDataWithRootObject:a4 requiringSecureCoding:1 error:&v14];
      id v11 = v14;
      if (v11)
      {
        v12 = sub_10002C428(2);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000315AC((uint64_t)a4, (uint64_t)v11, v12);
        }
      }
      [(_NMRPlaybackQueueResponseProtobuf *)v6->_protobuf setError:v10];
    }
  }
  return v6;
}

- (void)playbackQueue
{
  if (![(_NMRPlaybackQueueResponseProtobuf *)self->_protobuf hasPlaybackQueue]) {
    return 0;
  }
  v3 = [(_NMRPlaybackQueueResponseProtobuf *)self->_protobuf playbackQueue];
  v4 = (const void *)MRPlaybackQueueCreateFromExternalRepresentation();
  CFTypeRef v5 = CFAutorelease(v4);

  return (void *)v5;
}

- (__CFError)error
{
  if (![(_NMRPlaybackQueueResponseProtobuf *)self->_protobuf hasError]) {
    return 0;
  }
  v3 = +[NSSet setWithObject:](NSSet, "setWithObject:", +[NSError classForKeyedUnarchiver]);
  v4 = [(_NMRPlaybackQueueResponseProtobuf *)self->_protobuf error];
  id v10 = 0;
  CFTypeRef v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v3 fromData:v4 error:&v10];
  v6 = (__CFError *)v10;

  if (v6)
  {
    v7 = sub_10002C428(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031634((uint64_t)v6, v7);
    }
  }
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = v6;
  }

  return v8;
}

- (void)invokeCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, void *, __CFError *))a3 + 2))(v5, [(NMRPlaybackQueueResponse *)self playbackQueue], [(NMRPlaybackQueueResponse *)self error]);
  }
}

- (NMRPlaybackQueueResponse)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMRPlaybackQueueResponse;
  id v5 = [(NMRPlaybackQueueResponse *)&v9 init];
  if (v5)
  {
    v6 = [[_NMRPlaybackQueueResponseProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;
  }
  return v5;
}

- (id)protobufData
{
  return [(_NMRPlaybackQueueResponseProtobuf *)self->_protobuf data];
}

- (void).cxx_destruct
{
}

@end