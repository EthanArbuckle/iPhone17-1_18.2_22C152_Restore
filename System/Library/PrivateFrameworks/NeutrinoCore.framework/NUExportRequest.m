@interface NUExportRequest
- (NSURL)destinationURL;
- (NUExportRequest)initWithComposition:(id)a3;
- (NUExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDestinationURL:(id)a3;
- (void)setScalePolicy:(id)a3;
@end

@implementation NUExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);

  objc_storeStrong((id *)&self->_destinationURL, 0);
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUExportRequest;
  id v4 = [(NURenderRequest *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSURL *)self->_destinationURL copy];
    v6 = (void *)*((void *)v4 + 19);
    *((void *)v4 + 19) = v5;

    objc_storeStrong((id *)v4 + 20, self->_scalePolicy);
  }
  return v4;
}

- (NUExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4
{
  id v6 = a4;
  v7 = [(NUExportRequest *)self initWithComposition:a3];
  uint64_t v8 = [v6 copy];

  destinationURL = v7->_destinationURL;
  v7->_destinationURL = (NSURL *)v8;

  return v7;
}

- (NUExportRequest)initWithComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUExportRequest;
  v3 = [(NURenderRequest *)&v7 initWithComposition:a3];
  uint64_t v4 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

@end