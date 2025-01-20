@interface NURenderPipelineVideoMetadataSample
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (AVTimedMetadataGroup)metadataGroup;
- (NURenderPipelineVideoMetadataSample)initWithFrameTime:(id *)a3 metadataGroup:(id)a4;
- (id)description;
@end

@implementation NURenderPipelineVideoMetadataSample

- (void).cxx_destruct
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (AVTimedMetadataGroup)metadataGroup
{
  return self->_metadataGroup;
}

- (NURenderPipelineVideoMetadataSample)initWithFrameTime:(id *)a3 metadataGroup:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NURenderPipelineVideoMetadataSample;
  v8 = [(NURenderPipelineVideoMetadataSample *)&v12 init];
  v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var0;
    v8->_frameTime.epoch = a3->var3;
    *(_OWORD *)&v8->_frameTime.value = v10;
    objc_storeStrong((id *)&v8->_metadataGroup, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime time = (CMTime)self->_frameTime;
  v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  v6 = [v3 stringWithFormat:@"<%@:%p frameTime: %@, Metadata Group: %p>", v4, self, v5, self->_metadataGroup];

  return v6;
}

@end