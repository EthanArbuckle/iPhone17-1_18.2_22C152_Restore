@interface NRASMRequest
- (id)description;
@end

@implementation NRASMRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asName, 0);

  objc_storeStrong((id *)&self->_clientDescription, 0);
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = @"NRASMBrowseRequest[";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v4 = @"NRASMResolveRequest[";
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      CFStringRef v4 = @"NRASMListenRequest[";
    }
  }
  [v3 appendString:v4];
LABEL_8:
  [v3 appendFormat:@"%p, %@, %@", self->_client, self->_identifier, self->_clientDescription];
  if (self->_localOnly) {
    [v3 appendString:@", local"];
  }
  [v3 appendString:@"]"];

  return v3;
}

@end