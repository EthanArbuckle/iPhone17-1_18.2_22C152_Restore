@interface MRDAVRoute
+ (MRDAVRoute)allocWithZone:(_NSZone *)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRDAVRoute)initWithDictionary:(id)a3;
- (MRDAVRouteExtendedInfo)extendedInfo;
- (NSData)MACAddress;
- (NSDictionary)dictionary;
- (NSString)modelName;
- (NSString)name;
- (NSString)type;
- (NSString)uniqueIdentifier;
- (unint64_t)sampleRate;
@end

@implementation MRDAVRoute

+ (MRDAVRoute)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MRDAVRoute *)+[MRDAVRoute allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MRDAVRoute;
    return (MRDAVRoute *)objc_msgSendSuper2(&v6, "allocWithZone:", a3);
  }
}

- (MRDAVRoute)initWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is abstract", "-[MRDAVRoute initWithDictionary:]");
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDAVRoute *)self uniqueIdentifier];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (unint64_t)sampleRate
{
  return 0;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSData)MACAddress
{
  return self->_MACAddress;
}

- (BOOL)isInputRoute
{
  return self->_inputRoute;
}

- (BOOL)isOutputRoute
{
  return self->_outputRoute;
}

- (BOOL)isPicked
{
  return self->_picked;
}

- (BOOL)isSpeakerRoute
{
  return self->_speakerRoute;
}

- (MRDAVRouteExtendedInfo)extendedInfo
{
  return self->_extendedInfo;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_extendedInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end