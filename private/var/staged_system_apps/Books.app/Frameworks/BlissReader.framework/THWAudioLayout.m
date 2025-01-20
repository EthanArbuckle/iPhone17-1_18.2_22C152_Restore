@interface THWAudioLayout
- (BOOL)usesTransportController;
- (BOOL)usesTransportControllerControls;
- (THWMovieInfo)movieInfo;
- (id)layoutGeometryForLayout:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation THWAudioLayout

- (BOOL)usesTransportController
{
  return 1;
}

- (BOOL)usesTransportControllerControls
{
  return 1;
}

- (THWMovieInfo)movieInfo
{
  objc_opt_class();
  [(THWAudioLayout *)self info];

  return (THWMovieInfo *)TSUDynamicCast();
}

- (void)updateChildrenFromInfo
{
  if ([(THWMovieInfo *)[(THWAudioLayout *)self movieInfo] posterImageInfo])
  {
    id v3 = [-[THWAudioLayout layoutController](self, "layoutController") layoutForInfo:-[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo") childOfLayout:self];
    if (!v3) {
      id v3 = [objc_alloc((Class)-[TSDImageInfo layoutClass](-[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"), "layoutClass")) initWithInfo:-[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo")];
    }
    [(THWAudioLayout *)self setChildren:+[NSArray arrayWithObject:v3]];

    [self children makeObjectsPerformSelector:"updateChildrenFromInfo"];
    [(THWAudioLayout *)self invalidate];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THWAudioLayout;
    [(THWMovieLayout *)&v4 updateChildrenFromInfo];
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  v5 = (TSDImageInfo *)[a3 info];
  if (v5 == [(THWMovieInfo *)[(THWAudioLayout *)self movieInfo] posterImageInfo])
  {
    id v7 = objc_alloc((Class)TSDLayoutGeometry);
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "geometry"), "size");
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v10[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    return [v7 initWithSize:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWAudioLayout;
    return [(THWMovieLayout *)&v9 layoutGeometryForLayout:a3];
  }
}

@end