@interface MPSong
+ (id)song;
+ (id)songWithPath:(id)a3;
- (MPSong)init;
- (MPSong)initWithPath:(id)a3;
- (NSString)path;
- (NSURL)URL;
- (double)audioVolume;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)maxDuration;
- (double)startTime;
- (double)stopTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)parentDocument;
- (id)parentPlaylist;
- (id)song;
- (int64_t)index;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)setAudioVolume:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setInternalDuration;
- (void)setInternalStartTime;
- (void)setParentPlaylist:(id)a3;
- (void)setPath:(id)a3;
- (void)setSong:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setURL:(id)a3;
@end

@implementation MPSong

+ (id)song
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)songWithPath:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithPath:a3];
  return v3;
}

- (MPSong)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPSong;
  id v2 = [(MPSong *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPSongInternal);
    v2->_internal = v3;
    v2->_path = 0;
    [(MPSongInternal *)v3 setDuration:-1.0];
    [(MPSongInternal *)v2->_internal setStartTime:-1.0];
    [(MPSongInternal *)v2->_internal setAudioVolume:-1.0];
    [(MPSongInternal *)v2->_internal setFadeInDuration:0.0];
    [(MPSongInternal *)v2->_internal setFadeOutDuration:0.0];
    [(MPSongInternal *)v2->_internal setAssetLogging:[+[NSUserDefaults standardUserDefaults] BOOLForKey:@"marimbaAssetLogging"]];
  }
  return v2;
}

- (MPSong)initWithPath:(id)a3
{
  v4 = [(MPSong *)self init];
  if (v4) {
    v4->_path = (NSString *)a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPath:", -[NSString copy](self->_path, "copy"));
  [v4 copyStruct:self->_internal];
  return v4;
}

- (void)dealloc
{
  path = self->_path;
  if (path) {

  }
  song = self->_song;
  if (song)
  {

    self->_song = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MPSong;
  [(MPSong *)&v5 dealloc];
}

- (id)description
{
  id v3 = +[NSString stringWithFormat:@"==================================== Song %d ===================================\n", [(MPSong *)self index]];
  [(MPSong *)self duration];
  objc_super v5 = [(NSString *)v3 stringByAppendingFormat:@"\t                   Duration: %f\n", v4];
  if (self->_song) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  return [(NSString *)v5 stringByAppendingFormat:@"\t                   Has Song: %@\n", v6];
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  path = self->_path;
  if (path) {

  }
  self->_path = (NSString *)a3;
  [(MPSongInternal *)self->_internal duration];
  double v6 = -1.0;
  BOOL v8 = v7 == -1.0;
  double v9 = -1.0;
  if (!v8) {
    [(MPSong *)self duration];
  }
  [(MPSong *)self setDuration:v9];
  [(MPSongInternal *)self->_internal startTime];
  if (v10 != -1.0)
  {
    [(MPSong *)self startTime];
    double v6 = v11;
  }
  [(MPSong *)self setStartTime:v6];
  if (self->_song)
  {
    id v12 = objc_msgSend(-[MPAudioPlaylist montage](self->_parentPlaylist, "montage"), "audioAssetForFileAtPath:", self->_path);
    song = self->_song;
    [(MCSong *)song setAsset:v12];
  }
}

- (NSURL)URL
{
  if (self->_path) {
    return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  }
  else {
    return 0;
  }
}

- (void)setURL:(id)a3
{
  id v4 = [a3 path];
  [(MPSong *)self setPath:v4];
}

- (double)startTime
{
  [(MPSongInternal *)self->_internal startTime];
  if (result == -1.0)
  {
    id v4 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
    if (v4)
    {
      objc_super v5 = v4;
      double v6 = [(MPSong *)self path];
      [v5 startTimeForPath:v6];
    }
    else
    {
      id v7 = +[MPAssetManager sharedManager];
      BOOL v8 = [(MPSong *)self path];
      [v7 startTimeForAssetAtPath:v8];
    }
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  id v5 = [(MPSong *)self parentDocument];
  double v6 = v5;
  double v7 = 0.0;
  if (v5)
  {
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
    {
      objc_msgSend(v6, "durationForPath:", -[MPSong path](self, "path"));
      double v7 = v8;
      if (v8 < a3) {
        a3 = v8;
      }
    }
  }
  [(MPSong *)self duration];
  double v10 = v9;
  if ([(MPSongInternal *)self->_internal assetLogging]) {
    NSLog(@"Setting startTime: %f on MPSong with path: %@", *(void *)&a3, self->_path);
  }
  [(MPSongInternal *)self->_internal setStartTime:a3];
  if (v6
    && objc_msgSend(objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
  {
    [(MPSongInternal *)self->_internal duration];
    if (v11 == -1.0)
    {
      [(MPSong *)self willChangeValueForKey:@"duration"];
      parentPlaylist = self->_parentPlaylist;
      if (parentPlaylist)
      {
        [(MPAudioPlaylist *)self->_parentPlaylist duration];
        double v15 = v14;
        [(MPSong *)self duration];
        [(MPAudioPlaylist *)parentPlaylist setDuration:v15 + v16 - v10];
      }
      [(MPSong *)self didChangeValueForKey:@"duration"];
    }
    else
    {
      [(MPSong *)self duration];
      if (v7 != 0.0 && a3 + v12 > v7) {
        [(MPSong *)self setDuration:v7 - a3];
      }
    }
  }
  song = self->_song;
  if (a3 == -1.0 || !song)
  {
    if (a3 == -1.0 && song)
    {
      [(MCSong *)song undefineStartTime];
    }
  }
  else
  {
    [(MCSong *)song setStartTime:a3];
  }
}

- (double)duration
{
  [(MPSongInternal *)self->_internal duration];
  if (result == -1.0)
  {
    [(MPSong *)self stopTime];
    double v5 = v4;
    [(MPSong *)self startTime];
    return v5 - v6;
  }
  return result;
}

- (void)setDuration:(double)a3
{
  id v5 = [(MPSong *)self parentDocument];
  if (v5)
  {
    double v6 = v5;
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
    {
      objc_msgSend(v6, "durationForPath:", -[MPSong path](self, "path"));
      double v8 = v7;
      [(MPSong *)self startTime];
      if (v8 != 0.0 && v9 + a3 > v8)
      {
        [(MPSong *)self startTime];
        a3 = v8 - v10;
      }
    }
  }
  [(MPSong *)self duration];
  double v12 = v11;
  if ([(MPSongInternal *)self->_internal assetLogging]) {
    NSLog(@"Setting duration: %f on MPSong with path: %@", *(void *)&a3, self->_path);
  }
  [(MPSongInternal *)self->_internal setDuration:a3];
  parentPlaylist = self->_parentPlaylist;
  if (parentPlaylist)
  {
    [(MPAudioPlaylist *)self->_parentPlaylist duration];
    double v15 = v14;
    [(MPSong *)self duration];
    [(MPAudioPlaylist *)parentPlaylist setDuration:v15 + v16 - v12];
  }
  song = self->_song;
  if (!song || a3 == -1.0)
  {
    if (song && a3 == -1.0)
    {
      [(MCSong *)song undefineDuration];
    }
  }
  else
  {
    [(MCSong *)song setDuration:a3];
  }
}

- (double)fadeInDuration
{
  [(MPSongInternal *)self->_internal fadeInDuration];
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  -[MPSongInternal setFadeInDuration:](self->_internal, "setFadeInDuration:");
  song = self->_song;
  if (song)
  {
    [(MCSong *)song setFadeInDuration:a3];
  }
}

- (double)fadeOutDuration
{
  [(MPSongInternal *)self->_internal fadeOutDuration];
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  -[MPSongInternal setFadeOutDuration:](self->_internal, "setFadeOutDuration:");
  song = self->_song;
  if (song)
  {
    [(MCSong *)song setFadeOutDuration:a3];
  }
}

- (double)audioVolume
{
  [(MPSongInternal *)self->_internal audioVolume];
  if (v3 == -1.0) {
    return 1.0;
  }
  internal = self->_internal;
  [(MPSongInternal *)internal audioVolume];
  return result;
}

- (void)setAudioVolume:(double)a3
{
  -[MPSongInternal setAudioVolume:](self->_internal, "setAudioVolume:");
  song = self->_song;
  if (song)
  {
    *(float *)&double v5 = a3;
    [(MCSong *)song setVolume:v5];
  }
}

- (int64_t)index
{
  return [(MCSong *)self->_song index];
}

- (id)parentPlaylist
{
  return self->_parentPlaylist;
}

- (id)song
{
  return self->_song;
}

- (double)maxDuration
{
  id v3 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
  if (v3)
  {
    double v4 = v3;
    double v5 = [(MPSong *)self path];
    [v4 durationForPath:v5];
  }
  else
  {
    id v7 = +[MPAssetManager sharedManager];
    double v8 = [(MPSong *)self path];
    [v7 durationForAssetAtPath:v8];
  }
  return result;
}

- (double)stopTime
{
  id v3 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
  if (v3)
  {
    double v4 = v3;
    double v5 = [(MPSong *)self path];
    [v4 stopTimeForPath:v5];
  }
  else
  {
    id v7 = +[MPAssetManager sharedManager];
    double v8 = [(MPSong *)self path];
    [v7 stopTimeForAssetAtPath:v8];
  }
  return result;
}

- (id)parentDocument
{
  id v2 = [(MPSong *)self parentPlaylist];
  return [v2 parentDocument];
}

- (void)copyStruct:(id)a3
{
  [a3 duration];
  -[MPSongInternal setDuration:](self->_internal, "setDuration:");
  [a3 startTime];
  -[MPSongInternal setStartTime:](self->_internal, "setStartTime:");
  [a3 audioVolume];
  -[MPSongInternal setAudioVolume:](self->_internal, "setAudioVolume:");
  [a3 fadeInDuration];
  -[MPSongInternal setFadeInDuration:](self->_internal, "setFadeInDuration:");
  [a3 fadeOutDuration];
  internal = self->_internal;
  -[MPSongInternal setFadeOutDuration:](internal, "setFadeOutDuration:");
}

- (void)setSong:(id)a3
{
  song = self->_song;
  if (song)
  {

    self->_song = 0;
  }
  double v6 = (MCSong *)a3;
  self->_song = v6;
  if (v6)
  {
    [(MPSongInternal *)self->_internal audioVolume];
    if (v7 != -1.0)
    {
      [(MPSongInternal *)self->_internal audioVolume];
      *(float *)&double v8 = v8;
      [(MCSong *)self->_song setVolume:v8];
    }
    [(MPSongInternal *)self->_internal startTime];
    if (v9 != -1.0)
    {
      [(MPSongInternal *)self->_internal startTime];
      -[MCSong setStartTime:](self->_song, "setStartTime:");
    }
    [(MPSongInternal *)self->_internal duration];
    if (v10 != -1.0)
    {
      [(MPSongInternal *)self->_internal duration];
      -[MCSong setDuration:](self->_song, "setDuration:");
    }
    [(MPSongInternal *)self->_internal fadeInDuration];
    -[MCSong setFadeInDuration:](self->_song, "setFadeInDuration:");
    [(MPSongInternal *)self->_internal fadeOutDuration];
    double v11 = self->_song;
    -[MCSong setFadeOutDuration:](v11, "setFadeOutDuration:");
  }
}

- (void)setParentPlaylist:(id)a3
{
  if (a3 && self->_parentPlaylist) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A song may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parentPlaylist = (MPAudioPlaylist *)a3;
}

- (void)setInternalDuration
{
  [(MPSong *)self duration];
  internal = self->_internal;
  -[MPSongInternal setDuration:](internal, "setDuration:");
}

- (void)setInternalStartTime
{
  [(MPSong *)self startTime];
  internal = self->_internal;
  -[MPSongInternal setStartTime:](internal, "setStartTime:");
}

@end