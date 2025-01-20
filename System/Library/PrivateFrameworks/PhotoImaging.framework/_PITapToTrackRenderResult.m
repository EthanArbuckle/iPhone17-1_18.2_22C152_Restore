@interface _PITapToTrackRenderResult
- (PTCinematographyTrack)completedTrack;
- (_PITapToTrackRenderResult)initWithCompletedTrack:(id)a3;
@end

@implementation _PITapToTrackRenderResult

- (void).cxx_destruct
{
}

- (PTCinematographyTrack)completedTrack
{
  return self->_completedTrack;
}

- (_PITapToTrackRenderResult)initWithCompletedTrack:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PITapToTrackRenderResult;
  v6 = [(_PITapToTrackRenderResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_completedTrack, a3);
  }

  return v7;
}

@end