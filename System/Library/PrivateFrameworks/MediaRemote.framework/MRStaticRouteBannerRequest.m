@interface MRStaticRouteBannerRequest
+ (BOOL)supportsSecureCoding;
- (MRStaticRouteBannerRequest)initWithCoder:(id)a3;
- (NSArray)outputDeviceNames;
- (NSArray)userSelectedDeviceNames;
- (NSString)actionImageName;
- (NSString)routeIdentifier;
- (NSString)routeName;
- (NSString)routeSymbolName;
- (NSString)soloDeviceEnclosureColor;
- (NSString)soloModelID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionImageName:(id)a3;
- (void)setOutputDeviceNames:(id)a3;
- (void)setRouteIdentifier:(id)a3;
- (void)setRouteName:(id)a3;
- (void)setRouteSymbolName:(id)a3;
- (void)setSoloDeviceEnclosureColor:(id)a3;
- (void)setSoloModelID:(id)a3;
- (void)setUserSelectedDeviceNames:(id)a3;
@end

@implementation MRStaticRouteBannerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MRStaticRouteBannerRequest *)self routeIdentifier];
  [v4 encodeObject:v5 forKey:@"rid"];

  v6 = [(MRStaticRouteBannerRequest *)self routeName];
  [v4 encodeObject:v6 forKey:@"rn"];

  v7 = [(MRStaticRouteBannerRequest *)self outputDeviceNames];
  [v4 encodeObject:v7 forKey:@"rns"];

  v8 = [(MRStaticRouteBannerRequest *)self routeSymbolName];
  [v4 encodeObject:v8 forKey:@"rsn"];

  v9 = [(MRStaticRouteBannerRequest *)self actionImageName];
  [v4 encodeObject:v9 forKey:@"ain"];

  v10 = [(MRStaticRouteBannerRequest *)self soloModelID];
  [v4 encodeObject:v10 forKey:@"smid"];

  v11 = [(MRStaticRouteBannerRequest *)self soloDeviceEnclosureColor];
  [v4 encodeObject:v11 forKey:@"sdec"];

  id v12 = [(MRStaticRouteBannerRequest *)self userSelectedDeviceNames];
  [v4 encodeObject:v12 forKey:@"aseodns"];
}

- (MRStaticRouteBannerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rid"];
  [(MRStaticRouteBannerRequest *)self setRouteIdentifier:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rn"];
  [(MRStaticRouteBannerRequest *)self setRouteName:v6];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rns"];
  [(MRStaticRouteBannerRequest *)self setOutputDeviceNames:v10];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsn"];
  [(MRStaticRouteBannerRequest *)self setRouteSymbolName:v11];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ain"];
  [(MRStaticRouteBannerRequest *)self setActionImageName:v12];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smid"];
  [(MRStaticRouteBannerRequest *)self setSoloModelID:v13];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdec"];
  [(MRStaticRouteBannerRequest *)self setSoloDeviceEnclosureColor:v14];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"aseodns"];

  [(MRStaticRouteBannerRequest *)self setUserSelectedDeviceNames:v18];
  return self;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  v7 = [(MRStaticRouteBannerRequest *)self routeIdentifier];
  [v6 appendFormat:@" routeIdentifier: %@", v7];

  uint64_t v8 = [(MRStaticRouteBannerRequest *)self routeName];
  [v6 appendFormat:@" routeName: %@", v8];

  v9 = [(MRStaticRouteBannerRequest *)self outputDeviceNames];
  [v6 appendFormat:@" routeNames: %@", v9];

  v10 = [(MRStaticRouteBannerRequest *)self routeSymbolName];
  [v6 appendFormat:@" routeSymbolName: %@", v10];

  v11 = [(MRStaticRouteBannerRequest *)self actionImageName];
  [v6 appendFormat:@" actionImageName: %@", v11];

  id v12 = [(MRStaticRouteBannerRequest *)self soloModelID];
  [v6 appendFormat:@" soloModelID: %@", v12];

  v13 = [(MRStaticRouteBannerRequest *)self soloDeviceEnclosureColor];
  [v6 appendFormat:@" soloDeviceEnclosureColor: %@", v13];

  [v6 appendString:@">"];

  return v6;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
}

- (NSArray)outputDeviceNames
{
  return self->_outputDeviceNames;
}

- (void)setOutputDeviceNames:(id)a3
{
}

- (NSString)routeSymbolName
{
  return self->_routeSymbolName;
}

- (void)setRouteSymbolName:(id)a3
{
}

- (NSString)actionImageName
{
  return self->_actionImageName;
}

- (void)setActionImageName:(id)a3
{
}

- (NSString)soloModelID
{
  return self->_soloModelID;
}

- (void)setSoloModelID:(id)a3
{
}

- (NSString)soloDeviceEnclosureColor
{
  return self->_soloDeviceEnclosureColor;
}

- (void)setSoloDeviceEnclosureColor:(id)a3
{
}

- (NSArray)userSelectedDeviceNames
{
  return self->_userSelectedDeviceNames;
}

- (void)setUserSelectedDeviceNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSelectedDeviceNames, 0);
  objc_storeStrong((id *)&self->_soloDeviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_soloModelID, 0);
  objc_storeStrong((id *)&self->_actionImageName, 0);
  objc_storeStrong((id *)&self->_routeSymbolName, 0);
  objc_storeStrong((id *)&self->_outputDeviceNames, 0);
  objc_storeStrong((id *)&self->_routeName, 0);

  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end