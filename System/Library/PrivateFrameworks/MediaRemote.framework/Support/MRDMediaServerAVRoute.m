@interface MRDMediaServerAVRoute
- (BOOL)canBeDefaultRoute;
- (BOOL)canBeDefaultSystemRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRDMediaServerAVRoute)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionary;
- (id)extendedInfo;
- (id)modelName;
- (id)name;
- (id)type;
- (id)uniqueIdentifier;
- (unint64_t)hash;
@end

@implementation MRDMediaServerAVRoute

- (MRDMediaServerAVRoute)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDMediaServerAVRoute;
  v5 = [(MRDMediaServerAVRoute *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    routeDescription = v5->_routeDescription;
    v5->_routeDescription = v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteUID];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 hash];
  }
  else {
    unint64_t v5 = 0;
  }
  v6 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteName];
  v7 = v6;
  if (v6) {
    v5 ^= (unint64_t)[v6 hash];
  }
  v8 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteType];
  objc_super v9 = v8;
  if (v8) {
    v5 ^= (unint64_t)[v8 hash];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4[9] isEqualToDictionary:self->_routeDescription];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = +[NSString stringWithFormat:@"<%@ %p: %@>", v4, self, self->_routeDescription];

  return v5;
}

- (id)uniqueIdentifier
{
  return [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteUID];
}

- (id)name
{
  return [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteName];
}

- (id)type
{
  return [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteType];
}

- (id)modelName
{
  v2 = [(MRDMediaServerAVRoute *)self extendedInfo];
  v3 = [v2 modelName];

  return v3;
}

- (BOOL)isInputRoute
{
  return 1;
}

- (BOOL)isOutputRoute
{
  return 1;
}

- (BOOL)isPicked
{
  v3 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_IsCurrentlyPickedOnPairedDevice];
  if ([v3 BOOLValue])
  {
    BOOL v4 = 1;
  }
  else
  {
    unsigned __int8 v5 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked];
    if ([v5 BOOLValue])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = +[MRAVOutputContext sharedSystemAudioContext];
      v7 = [v6 outputDevices];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000C2C6C;
      v9[3] = &unk_10041B1A0;
      v9[4] = self;
      BOOL v4 = [v7 indexOfObjectPassingTest:v9] != (id)0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v4;
}

- (BOOL)isSpeakerRoute
{
  v2 = [(NSDictionary *)self->_routeDescription objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v3 = [v2 isEqualToString:@"Speaker"];

  return v3;
}

- (BOOL)canBeDefaultRoute
{
  return 1;
}

- (BOOL)canBeDefaultSystemRoute
{
  return 1;
}

- (id)dictionary
{
  return self->_routeDescription;
}

- (id)extendedInfo
{
  extendedInfo = self->_extendedInfo;
  if (!extendedInfo)
  {
    BOOL v4 = [[MRDAVRouteExtendedInfo alloc] initWithRoute:self->_routeDescription];
    unsigned __int8 v5 = self->_extendedInfo;
    self->_extendedInfo = v4;

    extendedInfo = self->_extendedInfo;
  }

  return extendedInfo;
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  return [(NSDictionary *)self->_routeDescription matchesUID:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedInfo, 0);

  objc_storeStrong((id *)&self->_routeDescription, 0);
}

@end