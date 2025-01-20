@interface RCCompositionFragment
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInComposition;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInContentToUse;
- (NSString)description;
- (NSURL)AVOutputURL;
- (NSURL)waveformURL;
- (RCCompositionFragment)initWithAVOutputURL:(id)a3 contentDuration:(double)a4 timeRangeInContentToUse:(id)a5 timeRangeInComposition:(id)a6 trackIndex:(unint64_t)a7;
- (RCCompositionFragment)initWithDictionaryPListRepresentation:(id)a3;
- (double)contentDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryPListRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)fileSizeOfAssets;
- (unint64_t)trackIndex;
- (void)deleteFromFilesystem;
- (void)setAVOutputURL:(id)a3;
- (void)setContentDuration:(double)a3;
- (void)setTimeRangeInComposition:(id)a3;
- (void)setTimeRangeInContentToUse:(id)a3;
- (void)setTrackIndex:(unint64_t)a3;
@end

@implementation RCCompositionFragment

- (RCCompositionFragment)initWithAVOutputURL:(id)a3 contentDuration:(double)a4 timeRangeInContentToUse:(id)a5 timeRangeInComposition:(id)a6 trackIndex:(unint64_t)a7
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  double v10 = a5.var1;
  double v11 = a5.var0;
  id v16 = a3;
  if (a4 < 0.0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"RCCompositionFragment.m" lineNumber:32 description:@"invalid contentDuration"];
  }
  if (RCTimeRangeDeltaWithExactPrecision(v11, v10) < 0.0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"RCCompositionFragment.m" lineNumber:33 description:@"invalid timeRangeInContentToUse"];
  }
  v22.receiver = self;
  v22.super_class = (Class)RCCompositionFragment;
  v17 = [(RCCompositionFragment *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_AVOutputURL, a3);
    v18->_contentDuration = a4;
    v18->_timeRangeInContentToUse.beginTime = v11;
    v18->_timeRangeInContentToUse.endTime = v10;
    v18->_timeRangeInComposition.beginTime = fmax(var0, 0.0);
    v18->_timeRangeInComposition.endTime = var1;
    v18->_trackIndex = a7;
  }

  return v18;
}

- (NSString)description
{
  v3 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)RCCompositionFragment;
  v4 = [(RCCompositionFragment *)&v18 description];
  v5 = [(NSURL *)self->_AVOutputURL path];
  v6 = [(RCCompositionFragment *)self waveformURL];
  v7 = [v6 path];
  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_contentDuration];
  [(RCCompositionFragment *)self timeRangeInContentToUse];
  double v11 = NSStringFromRCTimeRange(v9, v10);
  [(RCCompositionFragment *)self timeRangeInComposition];
  v14 = NSStringFromRCTimeRange(v12, v13);
  v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_trackIndex];
  id v16 = [v3 stringWithFormat:@"%@ AVURL = %@ (waveformURL = %@), contentDuration = %@, timeRangeInContentToUse = %@, timeRangeInComposition = %@, trackIndex = %@", v4, v5, v7, v8, v11, v14, v15];

  return (NSString *)v16;
}

- (NSURL)waveformURL
{
  return (NSURL *)+[RCWaveform waveformURLForAVURL:self->_AVOutputURL trackIndex:self->_trackIndex];
}

- (void)deleteFromFilesystem
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[RCCompositionFragment deleteFromFilesystem]";
    __int16 v9 = 2112;
    double v10 = self;
    _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_INFO, "%s -- deleting fragment assets %@", (uint8_t *)&v7, 0x16u);
  }

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:self->_AVOutputURL error:0];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(RCCompositionFragment *)self waveformURL];
  [v5 removeItemAtURL:v6 error:0];
}

- (unint64_t)fileSizeOfAssets
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(NSURL *)self->_AVOutputURL path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    v6 = [(NSURL *)self->_AVOutputURL path];
    int v7 = [v3 attributesOfItemAtPath:v6 error:0];
    v8 = [v7 objectForKey:*MEMORY[0x1E4F28390]];
    unint64_t v9 = [v8 longLongValue];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInContentToUse
{
  if (RCTimeRangeEqualToTimeRange(self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, -1.79769313e308, 1.79769313e308))
  {
    v3.n128_u64[0] = 0;
    double beginTime = RCTimeRangeMake(v3, self->_contentDuration);
  }
  else
  {
    double beginTime = self->_timeRangeInContentToUse.beginTime;
    double endTime = self->_timeRangeInContentToUse.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (RCCompositionFragment)initWithDictionaryPListRepresentation:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RCCompositionFragment;
  int v5 = [(RCCompositionFragment *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    int v7 = [v4 objectForKey:@"RCAVOutputURL"];
    uint64_t v8 = [v6 URLWithString:v7];
    AVOutputURL = v5->_AVOutputURL;
    v5->_AVOutputURL = (NSURL *)v8;

    uint64_t v10 = [(NSURL *)v5->_AVOutputURL rc_URLByFixingUpPersistentMediaRecordingsDirectory];
    uint64_t v11 = v5->_AVOutputURL;
    v5->_AVOutputURL = (NSURL *)v10;

    double v12 = [v4 objectForKey:@"RCContentDuration"];
    [v12 doubleValue];
    v5->_contentDuration = v13;

    v14 = [v4 objectForKey:@"RCTimeRangeInContentToUse.beginTime"];
    [v14 doubleValue];
    v5->_timeRangeInContentToUse.double beginTime = v15;

    id v16 = [v4 objectForKey:@"RCTimeRangeInContentToUse.endTime"];
    [v16 doubleValue];
    v5->_timeRangeInContentToUse.double endTime = v17;

    objc_super v18 = [v4 objectForKey:@"RCTimeRangeInComposition.beginTime"];
    [v18 doubleValue];
    v5->_timeRangeInComposition.double beginTime = v19;

    v20 = [v4 objectForKey:@"RCTimeRangeInComposition.endTime"];
    [v20 doubleValue];
    v5->_timeRangeInComposition.double endTime = v21;

    objc_super v22 = [v4 objectForKey:@"RCTrackIndex"];
    v5->_trackIndex = [v22 unsignedIntegerValue];
  }
  return v5;
}

- (id)dictionaryPListRepresentation
{
  __n128 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSURL *)self->_AVOutputURL absoluteString];
  [v3 setObject:v4 forKey:@"RCAVOutputURL"];

  int v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_contentDuration];
  [v3 setObject:v5 forKey:@"RCContentDuration"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeRangeInContentToUse.beginTime];
  [v3 setObject:v6 forKey:@"RCTimeRangeInContentToUse.beginTime"];

  int v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeRangeInContentToUse.endTime];
  [v3 setObject:v7 forKey:@"RCTimeRangeInContentToUse.endTime"];

  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeRangeInComposition.beginTime];
  [v3 setObject:v8 forKey:@"RCTimeRangeInComposition.beginTime"];

  unint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeRangeInComposition.endTime];
  [v3 setObject:v9 forKey:@"RCTimeRangeInComposition.endTime"];

  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_trackIndex];
  [v3 setObject:v10 forKey:@"RCTrackIndex"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RCCompositionFragment alloc];
  int v5 = [(RCCompositionFragment *)self AVOutputURL];
  double contentDuration = self->_contentDuration;
  [(RCCompositionFragment *)self timeRangeInComposition];
  unint64_t v9 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:](v4, "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:", v5, [(RCCompositionFragment *)self trackIndex], contentDuration, self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, v7, v8);

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [RCMutableCompositionFragment alloc];
  int v5 = [(RCCompositionFragment *)self AVOutputURL];
  double contentDuration = self->_contentDuration;
  [(RCCompositionFragment *)self timeRangeInComposition];
  unint64_t v9 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:](v4, "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:", v5, [(RCCompositionFragment *)self trackIndex], contentDuration, self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, v7, v8);

  return v9;
}

- (NSURL)AVOutputURL
{
  return self->_AVOutputURL;
}

- (void)setAVOutputURL:(id)a3
{
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- (void)setContentDuration:(double)a3
{
  self->_double contentDuration = a3;
}

- (void)setTimeRangeInContentToUse:(id)a3
{
  self->_timeRangeInContentToUse = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInComposition
{
  double beginTime = self->_timeRangeInComposition.beginTime;
  double endTime = self->_timeRangeInComposition.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)setTimeRangeInComposition:(id)a3
{
  self->_timeRangeInComposition = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (unint64_t)trackIndex
{
  return self->_trackIndex;
}

- (void)setTrackIndex:(unint64_t)a3
{
  self->_trackIndex = a3;
}

- (void).cxx_destruct
{
}

@end