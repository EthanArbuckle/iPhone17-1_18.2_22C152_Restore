@interface AEAConcreteAirPlayPrimitives
- (AEAConcreteAirPlayPrimitives)init;
- (void)stopAirPlayingWithCompletion:(id)a3;
@end

@implementation AEAConcreteAirPlayPrimitives

- (AEAConcreteAirPlayPrimitives)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEAConcreteAirPlayPrimitives;
  v2 = [(AEAConcreteAirPlayPrimitives *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AVOutputContext sharedSystemScreenContext];
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v3;
  }
  return v2;
}

- (void)stopAirPlayingWithCompletion:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (AEAConcreteAirPlayPrimitives *)self->_outputContext;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003D0C;
  v6[3] = &unk_10009DEA0;
  id v7 = v4;
  id v5 = v4;
  [(AEAConcreteAirPlayPrimitives *)self setOutputDevice:0 options:0 completionHandler:v6];
}

- (void).cxx_destruct
{
}

@end