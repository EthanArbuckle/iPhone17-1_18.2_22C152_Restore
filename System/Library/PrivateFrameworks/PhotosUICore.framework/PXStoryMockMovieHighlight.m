@interface PXStoryMockMovieHighlight
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForTargetDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (BOOL)hasFace;
- (BOOL)hasMusic;
- (BOOL)hasVoice;
- (CGRect)bestPlaybackRect;
- (NSData)normalizationData;
- (PXStoryMockMovieHighlight)init;
- (PXStoryMockMovieHighlight)initWithBestPlaybackRect:(CGRect)a3;
- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 audioScore:(float)a7;
- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 face:(BOOL)a7 voice:(BOOL)a8 music:(BOOL)a9 loudness:(float)a10 peak:(float)a11 audioScore:(float)a12;
- (float)audioQualityScore;
- (float)loudness;
- (float)peakVolume;
- (float)qualityScore;
- (void)setAudioQualityScore:(float)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setHasFace:(BOOL)a3;
- (void)setHasMusic:(BOOL)a3;
- (void)setHasVoice:(BOOL)a3;
- (void)setLoudness:(float)a3;
- (void)setNormalizationData:(id)a3;
- (void)setPeakVolume:(float)a3;
- (void)setQualityScore:(float)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation PXStoryMockMovieHighlight

- (void).cxx_destruct
{
}

- (void)setAudioQualityScore:(float)a3
{
  self->_audioQualityScore = a3;
}

- (float)audioQualityScore
{
  return self->_audioQualityScore;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (CGRect)bestPlaybackRect
{
  double x = self->_bestPlaybackRect.origin.x;
  double y = self->_bestPlaybackRect.origin.y;
  double width = self->_bestPlaybackRect.size.width;
  double height = self->_bestPlaybackRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPeakVolume:(float)a3
{
  self->_peakVolume = a3;
}

- (float)peakVolume
{
  return self->_peakVolume;
}

- (void)setLoudness:(float)a3
{
  self->_loudness = a3;
}

- (float)loudness
{
  return self->_loudness;
}

- (void)setHasMusic:(BOOL)a3
{
  self->_hasMusic = a3;
}

- (BOOL)hasMusic
{
  return self->_hasMusic;
}

- (void)setHasVoice:(BOOL)a3
{
  self->_hasVoice = a3;
}

- (BOOL)hasVoice
{
  return self->_hasVoice;
}

- (void)setHasFace:(BOOL)a3
{
  self->_hasFace = a3;
}

- (BOOL)hasFace
{
  return self->_hasFace;
}

- (void)setNormalizationData:(id)a3
{
}

- (NSData)normalizationData
{
  return self->_normalizationData;
}

- (void)setQualityScore:(float)a3
{
  self->_qualityScore = a3;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var1;
  return self;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForTargetDuration:(SEL)a3
{
  memset(v17, 0, sizeof(v17));
  long long v16 = 0u;
  [(PXStoryMockMovieHighlight *)self timeRange];
  memset(&v15, 0, sizeof(v15));
  CMTimeMakeWithSeconds(&v15, a4, 600);
  memset(&v14, 0, sizeof(v14));
  lhs[0] = *(CMTime *)((char *)v17 + 8);
  *(CMTime *)rhs = v15;
  CMTimeSubtract(&v13, lhs, (CMTime *)rhs);
  lhs[0] = v13;
  CMTimeMultiplyByRatio(&v14, lhs, 1, 2);
  memset(lhs, 0, sizeof(lhs));
  *(_OWORD *)rhs = v16;
  *(void *)&rhs[16] = *(void *)&v17[0];
  long long v7 = *(_OWORD *)&v14.value;
  *(void *)&long long v8 = v14.epoch;
  CMTimeAdd(lhs, (CMTime *)rhs, (CMTime *)&v7);
  lhs[1] = v15;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)rhs = v16;
  *(_OWORD *)&rhs[16] = v17[0];
  long long v11 = v17[1];
  long long v8 = *(_OWORD *)&lhs[0].epoch;
  long long v9 = *(_OWORD *)&lhs[1].timescale;
  long long v7 = *(_OWORD *)&lhs[0].value;
  PXStoryTimeRangeIntersection(rhs, &v7, retstr);
  return result;
}

- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 face:(BOOL)a7 voice:(BOOL)a8 music:(BOOL)a9 loudness:(float)a10 peak:(float)a11 audioScore:(float)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)PXStoryMockMovieHighlight;
  id v24 = a6;
  v25 = [(PXStoryMockMovieHighlight *)&v33 init];
  long long v26 = *(_OWORD *)&a3->var0.var3;
  v32[0] = *(_OWORD *)&a3->var0.var0;
  v32[1] = v26;
  v32[2] = *(_OWORD *)&a3->var1.var1;
  [(PXStoryMockMovieHighlight *)v25 setTimeRange:v32];
  *(float *)&double v27 = a4;
  [(PXStoryMockMovieHighlight *)v25 setQualityScore:v27];
  [(PXStoryMockMovieHighlight *)v25 setNormalizationData:v24];

  [(PXStoryMockMovieHighlight *)v25 setHasMusic:v12];
  [(PXStoryMockMovieHighlight *)v25 setHasVoice:v13];
  [(PXStoryMockMovieHighlight *)v25 setHasFace:v14];
  *(float *)&double v28 = a10;
  [(PXStoryMockMovieHighlight *)v25 setLoudness:v28];
  *(float *)&double v29 = a11;
  [(PXStoryMockMovieHighlight *)v25 setPeakVolume:v29];
  -[PXStoryMockMovieHighlight setBestPlaybackRect:](v25, "setBestPlaybackRect:", x, y, width, height);
  *(float *)&double v30 = a12;
  [(PXStoryMockMovieHighlight *)v25 setAudioQualityScore:v30];
  return v25;
}

- (PXStoryMockMovieHighlight)initWithBestPlaybackRect:(CGRect)a3
{
  memset(v5, 0, sizeof(v5));
  LODWORD(v3) = 0.5;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", v5, 0, 0, 0, 0, 0.0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, v3);
}

- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 audioScore:(float)a7
{
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", v9, a6, 0, 0, 0);
}

- (PXStoryMockMovieHighlight)init
{
  memset(v4, 0, sizeof(v4));
  LODWORD(v2) = 0.5;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:audioScore:", v4, 0, 0.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v2);
}

@end