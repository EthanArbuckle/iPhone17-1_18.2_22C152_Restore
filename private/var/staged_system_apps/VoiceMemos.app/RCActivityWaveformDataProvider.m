@interface RCActivityWaveformDataProvider
- (RCActivityWaveformDataProvider)initWithWaveformProcessor:(id)a3;
- (RCActivityWaveformProcessor)processor;
- (double)amplitudeForSliceWithTimeRange:(id)a3 fullTimeRangeSampled:(BOOL *)a4;
- (float)_processAmplitude:(float)a3;
- (void)setProcessor:(id)a3;
@end

@implementation RCActivityWaveformDataProvider

- (RCActivityWaveformDataProvider)initWithWaveformProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCActivityWaveformDataProvider;
  v5 = [(RCActivityWaveformDataProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(RCActivityWaveformDataProvider *)v5 setProcessor:v4];
  }

  return v6;
}

- (float)_processAmplitude:(float)a3
{
  id v4 = [(RCActivityWaveformDataProvider *)self processor];
  [v4 runningAverage];
  float v6 = v5;

  double v7 = (1.0 - sub_10005BD74(v6)) * 6.0 * a3;
  if (v7 > 1.0) {
    return 1.0;
  }
  return v7;
}

- (double)amplitudeForSliceWithTimeRange:(id)a3 fullTimeRangeSampled:(BOOL *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  objc_super v8 = [(RCActivityWaveformDataProvider *)self processor];
  [v8 recordingStartTime];
  double v10 = v9;

  v11 = [(RCActivityWaveformDataProvider *)self processor];
  [v11 punchInTime];
  double v13 = v12;

  float v20 = 0.0;
  v14 = [(RCActivityWaveformDataProvider *)self processor];
  unsigned __int8 v15 = [v14 getAmplitudes:&v20 count:1 startTime:v10 + var0 - v13 + -0.1 endTime:v10 + var1 - v13 + -0.1];

  if (a4) {
    *a4 = v15;
  }
  *(float *)&double v16 = v20;
  double v17 = 0.0;
  if (v20 != 0.0)
  {
    -[RCActivityWaveformDataProvider _processAmplitude:](self, "_processAmplitude:", v16, 0.0);
    return v18;
  }
  return v17;
}

- (RCActivityWaveformProcessor)processor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);

  return (RCActivityWaveformProcessor *)WeakRetained;
}

- (void)setProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end