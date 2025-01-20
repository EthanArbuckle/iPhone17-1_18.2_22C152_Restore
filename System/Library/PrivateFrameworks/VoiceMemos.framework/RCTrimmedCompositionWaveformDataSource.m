@interface RCTrimmedCompositionWaveformDataSource
- (BOOL)preferLoadingFragmentWaveforms;
- (NSURL)destinationWaveformURL;
- (RCTrimmedCompositionWaveformDataSource)initWithSourceComposition:(id)a3 destinationWaveformURL:(id)a4 trackIndex:(unint64_t)a5;
- (id)generatedWaveformOutputURL;
@end

@implementation RCTrimmedCompositionWaveformDataSource

- (RCTrimmedCompositionWaveformDataSource)initWithSourceComposition:(id)a3 destinationWaveformURL:(id)a4 trackIndex:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RCTrimmedCompositionWaveformDataSource;
  v10 = [(RCCompositionWaveformDataSource *)&v13 initWithComposition:a3 trackIndex:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_destinationWaveformURL, a4);
    [(RCCompositionWaveformDataSource *)v11 setSaveGeneratedWaveform:1];
  }

  return v11;
}

- (BOOL)preferLoadingFragmentWaveforms
{
  return 1;
}

- (id)generatedWaveformOutputURL
{
  return self->_destinationWaveformURL;
}

- (NSURL)destinationWaveformURL
{
  return self->_destinationWaveformURL;
}

- (void).cxx_destruct
{
}

@end