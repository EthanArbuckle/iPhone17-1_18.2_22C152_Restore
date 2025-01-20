@interface RCPlaceholderWaveformDataSource
- (RCPlaceholderWaveformDataSource)initWithDuration:(double)a3;
- (RCPlaceholderWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4;
- (double)duration;
@end

@implementation RCPlaceholderWaveformDataSource

- (RCPlaceholderWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RCPlaceholderWaveformDataSource;
  return [(RCPlaceholderWaveformDataSource *)&v5 initWithWaveformGenerator:a3 generatedWaveformOutputURL:a4 trackIndex:-1];
}

- (RCPlaceholderWaveformDataSource)initWithDuration:(double)a3
{
  result = [(RCPlaceholderWaveformDataSource *)self initWithWaveformGenerator:0 generatedWaveformOutputURL:0];
  if (result) {
    result->_placeholderDuration = a3;
  }
  return result;
}

- (double)duration
{
  return self->_placeholderDuration;
}

@end