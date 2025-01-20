@interface CLHEndpointSelector
- (CLHEndpointSelector)init;
- (NSURL)altimeterEndpoint;
- (NSURL)appEndpoint;
- (NSURL)batchEndpoint;
- (NSURL)cellWifiEndpoint;
- (NSURL)indoorEndpoint;
- (NSURL)ionosphereEndpoint;
- (NSURL)passEndpoint;
- (NSURL)poiEndpoint;
- (NSURL)pressureEndpoint;
- (NSURL)traceEndpoint;
- (id)description;
- (id)jsonObject;
- (void)dealloc;
- (void)refresh;
- (void)updateEndpoint:(id *)a3 withKey:(id)a4;
@end

@implementation CLHEndpointSelector

- (CLHEndpointSelector)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLHEndpointSelector;
  v2 = [(CLHEndpointSelector *)&v4 init];
  if (v2)
  {
    v2->_appEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/au"];
    v2->_batchEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/pds/pd"];
    v2->_cellWifiEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/hcy/pbcwloc"];
    v2->_indoorEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/incs"];
    v2->_passEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/pbu"];
    v2->_poiEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.ls.apple.com/hvr/aploc"];
    v2->_pressureEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/psr"];
    v2->_traceEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/hvr/trc"];
    v2->_altimeterEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-carry.ls.apple.com/hvr/alt"];
    v2->_ionosphereEndpoint = (NSURL *)[objc_alloc((Class)NSURL) initWithString:@"https://gsp10-ssl.apple.com/hvr/ion"];
    [(CLHEndpointSelector *)v2 refresh];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHEndpointSelector;
  [(CLHEndpointSelector *)&v3 dealloc];
}

- (void)refresh
{
  [(CLHEndpointSelector *)self updateEndpoint:&self->_appEndpoint withKey:@"CLAppleCollectionServer_App"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_batchEndpoint withKey:@"CLAppleCollectionServer_Tracks"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_cellWifiEndpoint withKey:@"CLAppleCollectionServer_CellWifi"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_indoorEndpoint withKey:@"CLAppleCollectionServer_Indoor"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_passEndpoint withKey:@"CLAppleCollectionServer_Pass"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_poiEndpoint withKey:@"CLAppleCollectionServer_Poi"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_pressureEndpoint withKey:@"CLAppleCollectionServer_Pressure"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_traceEndpoint withKey:@"CLAppleCollectionServer_Trace"];
  [(CLHEndpointSelector *)self updateEndpoint:&self->_altimeterEndpoint withKey:@"CLAppleCollectionServer_Altimeter"];

  [(CLHEndpointSelector *)self updateEndpoint:&self->_ionosphereEndpoint withKey:@"CLAppleCollectionServer_Ionosphere"];
}

- (void)updateEndpoint:(id *)a3 withKey:(id)a4
{
  memset(&__p, 0, sizeof(__p));
  sub_1000C7F88(&v10);
  BOOL v6 = sub_1000A7CF8(v10, (uint64_t)a4, &__p);
  if (v11) {
    sub_1000DB0A0(v11);
  }
  if (v6)
  {

    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    id v8 = [objc_alloc((Class)NSURL) initWithString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p)];
  }
  else
  {
    id v9 = [[+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration") defaultForKey:a4 defaultValue:0];
    if (!v9) {
      goto LABEL_11;
    }

    id v8 = [objc_alloc((Class)NSURL) initWithString:v9];
  }
  *a3 = v8;
LABEL_11:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (id)jsonObject
{
  v4[0] = @"CLAppleCollectionServer_App";
  v5[0] = [(NSURL *)self->_appEndpoint absoluteString];
  v4[1] = @"CLAppleCollectionServer_Tracks";
  v5[1] = [(NSURL *)self->_batchEndpoint absoluteString];
  v4[2] = @"CLAppleCollectionServer_CellWifi";
  v5[2] = [(NSURL *)self->_cellWifiEndpoint absoluteString];
  v4[3] = @"CLAppleCollectionServer_Indoor";
  v5[3] = [(NSURL *)self->_indoorEndpoint absoluteString];
  v4[4] = @"CLAppleCollectionServer_Pass";
  v5[4] = [(NSURL *)self->_passEndpoint absoluteString];
  v4[5] = @"CLAppleCollectionServer_Poi";
  v5[5] = [(NSURL *)self->_poiEndpoint absoluteString];
  v4[6] = @"CLAppleCollectionServer_Pressure";
  v5[6] = [(NSURL *)self->_pressureEndpoint absoluteString];
  v4[7] = @"CLAppleCollectionServer_Trace";
  v5[7] = [(NSURL *)self->_traceEndpoint absoluteString];
  v4[8] = @"CLAppleCollectionServer_Altimeter";
  v5[8] = [(NSURL *)self->_altimeterEndpoint absoluteString];
  v4[9] = @"CLAppleCollectionServer_Ionosphere";
  v5[9] = [(NSURL *)self->_ionosphereEndpoint absoluteString];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
}

- (id)description
{
  id v2 = [[objc_alloc((Class)NSString) initWithData:+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHEndpointSelector jsonObject](self, "jsonObject"), 2, 0) encoding:4];

  return v2;
}

- (NSURL)appEndpoint
{
  return self->_appEndpoint;
}

- (NSURL)batchEndpoint
{
  return self->_batchEndpoint;
}

- (NSURL)cellWifiEndpoint
{
  return self->_cellWifiEndpoint;
}

- (NSURL)indoorEndpoint
{
  return self->_indoorEndpoint;
}

- (NSURL)passEndpoint
{
  return self->_passEndpoint;
}

- (NSURL)poiEndpoint
{
  return self->_poiEndpoint;
}

- (NSURL)pressureEndpoint
{
  return self->_pressureEndpoint;
}

- (NSURL)traceEndpoint
{
  return self->_traceEndpoint;
}

- (NSURL)altimeterEndpoint
{
  return self->_altimeterEndpoint;
}

- (NSURL)ionosphereEndpoint
{
  return self->_ionosphereEndpoint;
}

@end