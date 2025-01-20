@interface CSDSecureImageTranscoder
- (CSDSecureImageTranscoder)init;
- (void)generatePreviewImageFromData:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation CSDSecureImageTranscoder

- (CSDSecureImageTranscoder)init
{
  return (CSDSecureImageTranscoder *)sub_10034D0E4();
}

- (void)generatePreviewImageFromData:(NSData *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_10034CFE0((uint64_t)&unk_10058AED8, (uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end