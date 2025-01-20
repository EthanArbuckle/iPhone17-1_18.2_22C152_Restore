@interface MRNowPlayingControllerDestination
- (BOOL)isEndpointSet;
- (MRNowPlayingControllerDestination)initWithConfiguration:(id)a3;
- (MRPlayerPath)unresolvedPlayerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpoint:(id)a3;
- (void)setIsEndpointSet:(BOOL)a3;
- (void)setUnresolvedPlayerPath:(id)a3;
@end

@implementation MRNowPlayingControllerDestination

- (void)setEndpoint:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRNowPlayingControllerDestination;
  -[MRDestination setEndpoint:](&v5, sel_setEndpoint_);
  if (!a3) {
    self->_isEndpointSet = 0;
  }
}

- (MRNowPlayingControllerDestination)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRNowPlayingControllerDestination;
  objc_super v5 = [(MRDestination *)&v11 _init];
  if (v5)
  {
    v6 = [v4 destination];
    v7 = [v6 outputDeviceUID];
    [(MRDestination *)v5 setOutputDeviceUID:v7];

    v8 = [v4 destination];
    v9 = [v8 endpoint];
    [(MRNowPlayingControllerDestination *)v5 setEndpoint:v9];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRNowPlayingControllerDestination;
  id v4 = [(MRDestination *)&v7 copyWithZone:a3];
  objc_super v5 = [(MRNowPlayingControllerDestination *)self unresolvedPlayerPath];
  [v4 setUnresolvedPlayerPath:v5];

  objc_msgSend(v4, "setIsEndpointSet:", -[MRNowPlayingControllerDestination isEndpointSet](self, "isEndpointSet"));
  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingControllerDestination;
  v3 = [(MRDestination *)&v8 description];
  id v4 = [(MRDestination *)self endpoint];
  if (v4 || ![(MRNowPlayingControllerDestination *)self isEndpointSet])
  {
    id v6 = v3;
  }
  else
  {
    objc_super v5 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @">", &stru_1EE60E7D8, 0, objc_msgSend(v3, "length") - 1, 1);
    [v5 stringByAppendingString:@" endpoint=NONE>"];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (void)setUnresolvedPlayerPath:(id)a3
{
}

- (BOOL)isEndpointSet
{
  return self->_isEndpointSet;
}

- (void)setIsEndpointSet:(BOOL)a3
{
  self->_isEndpointSet = a3;
}

- (void).cxx_destruct
{
}

@end