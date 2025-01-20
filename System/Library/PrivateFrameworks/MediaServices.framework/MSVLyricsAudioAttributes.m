@interface MSVLyricsAudioAttributes
- (BOOL)isSpatialRole;
- (NSString)role;
- (double)lyricsOffset;
- (void)setLyricsOffset:(double)a3;
- (void)setRole:(id)a3;
- (void)setSpatialRole:(BOOL)a3;
@end

@implementation MSVLyricsAudioAttributes

- (void).cxx_destruct
{
}

- (void)setSpatialRole:(BOOL)a3
{
  self->_spatialRole = a3;
}

- (BOOL)isSpatialRole
{
  return self->_spatialRole;
}

- (void)setRole:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setLyricsOffset:(double)a3
{
  self->_lyricsOffset = a3;
}

- (double)lyricsOffset
{
  return self->_lyricsOffset;
}

@end