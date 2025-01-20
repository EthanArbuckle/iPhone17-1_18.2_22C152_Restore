@interface RPTransportServiceMetadata
+ (id)metadataWithDictionary:(id)a3;
- (RPTransportServiceMetadata)initWithDictionary:(id)a3;
- (RPTransportServiceMetadata)initWithTransportServiceType:(unint64_t)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (unint64_t)serviceType;
@end

@implementation RPTransportServiceMetadata

+ (id)metadataWithDictionary:(id)a3
{
  id v3 = a3;
  CFStringGetTypeID();
  v4 = CFDictionaryGetTypedValue();
  v5 = v4;
  if (v4 && ([v4 isEqual:@"Bonjour"] & 1) != 0) {
    v6 = &off_100120F40;
  }
  else {
    v6 = &off_100120FD0;
  }

  id v7 = [objc_alloc(*v6) initWithDictionary:v3];

  return v7;
}

- (RPTransportServiceMetadata)initWithTransportServiceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPTransportServiceMetadata;
  result = [(RPTransportServiceMetadata *)&v5 init];
  if (result) {
    result->_serviceType = a3;
  }
  return result;
}

- (RPTransportServiceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPTransportServiceMetadata;
  objc_super v5 = [(RPTransportServiceMetadata *)&v10 init];
  if (v5)
  {
    id v6 = v4;
    CFStringGetTypeID();
    id v7 = CFDictionaryGetTypedValue();

    if (v7)
    {
      if ([v7 isEqual:@"Bonjour"]) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = -1;
      }
    }
    else
    {
      uint64_t v8 = -1;
    }

    v5->_serviceType = v8;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = @"Other";
  if (self->_serviceType == 1) {
    v2 = @"Bonjour";
  }
  id v6 = &off_10012B270;
  id v7 = v2;
  id v3 = v2;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (id)description
{
  return [(RPTransportServiceMetadata *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  objc_opt_class();
  NSAppendPrintF();
  id v3 = 0;
  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

@end