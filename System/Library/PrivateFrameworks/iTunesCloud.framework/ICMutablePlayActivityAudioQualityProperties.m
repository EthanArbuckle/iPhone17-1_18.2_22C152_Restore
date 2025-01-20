@interface ICMutablePlayActivityAudioQualityProperties
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setBitDepth:(int64_t)a3;
- (void)setBitRate:(int64_t)a3;
- (void)setChannelLayoutDescription:(id)a3;
- (void)setCodec:(unsigned int)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSpatialized:(BOOL)a3;
@end

@implementation ICMutablePlayActivityAudioQualityProperties

- (void)setSpatialized:(BOOL)a3
{
  self->super._spatialized = a3;
}

- (void)setSampleRate:(int64_t)a3
{
  self->super._sampleRate = a3;
}

- (void)setCodec:(unsigned int)a3
{
  self->super._codec = a3;
}

- (void)setChannelLayoutDescription:(id)a3
{
}

- (void)setBitDepth:(int64_t)a3
{
  self->super._bitDepth = a3;
}

- (void)setBitRate:(int64_t)a3
{
  self->super._bitRate = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICPlayActivityAudioQualityProperties *)self _copyWithClass:v5 zone:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICPlayActivityAudioQualityProperties *)self _copyWithClass:v5 zone:a3];
}

@end