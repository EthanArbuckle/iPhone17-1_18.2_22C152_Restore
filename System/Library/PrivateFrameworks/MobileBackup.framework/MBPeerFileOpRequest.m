@interface MBPeerFileOpRequest
- (MBPeerFileOpRequest)init;
- (MBPeerFileOpRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)relativePaths;
- (id)dictionaryRepresentation;
- (void)setRelativePaths:(id)a3;
@end

@implementation MBPeerFileOpRequest

- (MBPeerFileOpRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBPeerFileOpRequest;
  v2 = [(MBPeerFileOpRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    relativePaths = v2->_relativePaths;
    v2->_relativePaths = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v3;
}

- (MBPeerFileOpRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBPeerFileOpRequest;
  v7 = [(MBPeerFileOpRequest *)&v12 init];
  if (v7
    && ([v6 objectForKeyedSubscript:@"MBRelativePaths"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        relativePaths = v7->_relativePaths,
        v7->_relativePaths = (NSDictionary *)v8,
        relativePaths,
        !v7->_relativePaths))
  {
    if (a4)
    {
      +[MBError errorWithCode:11, @"Failed to decode response. Missing property in dictionary %@", v6 format];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  CFStringRef v5 = @"MBRelativePaths";
  v2 = [(MBPeerFileOpRequest *)self relativePaths];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (NSDictionary)relativePaths
{
  return self->_relativePaths;
}

- (void)setRelativePaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end