@interface BlastDoorLiteMessageCompressor
- (BlastDoorLiteMessageCompressor)init;
- (id)compressData:(id)a3 codecID:(int64_t *)a4;
@end

@implementation BlastDoorLiteMessageCompressor

- (id)compressData:(id)a3 codecID:(int64_t *)a4
{
  id v7 = a3;
  v8 = self;
  v9 = (void *)sub_1C51BE46C(a3, a4);

  return v9;
}

- (BlastDoorLiteMessageCompressor)init
{
  LiteMessageCompressor.init()();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return [(BlastDoorLiteMessageCompressor *)&v4 init];
}

- (void).cxx_destruct
{
}

@end