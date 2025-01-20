@interface CLDuetNowPlaying
- (CLDuetNowPlaying)initWithBundleId:(id)a3 status:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6;
- (NSDictionary)outputDeviceIDs;
- (NSNumber)status;
- (NSString)bundleId;
- (NSString)track;
- (void)dealloc;
- (void)setBundleId:(id)a3;
- (void)setOutputDeviceIDs:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTrack:(id)a3;
@end

@implementation CLDuetNowPlaying

- (CLDuetNowPlaying)initWithBundleId:(id)a3 status:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLDuetNowPlaying;
  v10 = [(CLDuetNowPlaying *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CLDuetNowPlaying *)v10 setBundleId:a3];
    [(CLDuetNowPlaying *)v11 setStatus:a4];
    [(CLDuetNowPlaying *)v11 setTrack:a5];
    [(CLDuetNowPlaying *)v11 setOutputDeviceIDs:a6];
  }
  return v11;
}

- (void)dealloc
{
  [(CLDuetNowPlaying *)self setBundleId:0];
  [(CLDuetNowPlaying *)self setStatus:0];
  [(CLDuetNowPlaying *)self setTrack:0];
  [(CLDuetNowPlaying *)self setOutputDeviceIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)CLDuetNowPlaying;
  [(CLDuetNowPlaying *)&v3 dealloc];
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)track
{
  return self->_track;
}

- (void)setTrack:(id)a3
{
}

- (NSDictionary)outputDeviceIDs
{
  return self->_outputDeviceIDs;
}

- (void)setOutputDeviceIDs:(id)a3
{
}

@end