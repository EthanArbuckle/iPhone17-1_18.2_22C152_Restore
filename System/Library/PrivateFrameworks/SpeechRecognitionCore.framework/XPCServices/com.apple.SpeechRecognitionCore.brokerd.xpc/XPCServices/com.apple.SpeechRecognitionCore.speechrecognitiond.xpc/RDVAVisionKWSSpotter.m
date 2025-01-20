@interface RDVAVisionKWSSpotter
- (RDVAVisionKWSSpotter)initWithDelegate:(id)a3;
- (void)addAudioSamples:(void *)a3 count:(int)a4;
- (void)start:(id)a3 saveRuntimeAudio:(BOOL)a4;
- (void)stop;
@end

@implementation RDVAVisionKWSSpotter

- (RDVAVisionKWSSpotter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDVAVisionKWSSpotter;
  v5 = [(RDVAVisionKWSSpotter *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter alloc] initWithDelegate:v4];
    swiftVisionKWSSpotter = v5->_swiftVisionKWSSpotter;
    v5->_swiftVisionKWSSpotter = v6;
  }
  return v5;
}

- (void)start:(id)a3 saveRuntimeAudio:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "componentsSeparatedByString:", @" ", (void)v15);
        v14 = [v13 objectAtIndexedSubscript:0];

        [v7 addObject:v14];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(RDVASwiftVisionKWSSpotter *)self->_swiftVisionKWSSpotter startWithUsedKeywords:v7 saveRuntimeAudio:v4];
}

- (void)addAudioSamples:(void *)a3 count:(int)a4
{
  uint64_t v7 = a4;
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
  if (a4 >= 1)
  {
    uint64_t v8 = a4;
    do
    {
      unsigned int v9 = *(__int16 *)a3;
      a3 = (char *)a3 + 2;
      id v10 = +[NSNumber numberWithInt:v9];
      [v11 addObject:v10];

      --v8;
    }
    while (v8);
  }
  [(RDVASwiftVisionKWSSpotter *)self->_swiftVisionKWSSpotter addAudioSamplesWithAudio:v11 count:v7];
}

- (void)stop
{
}

- (void).cxx_destruct
{
}

@end