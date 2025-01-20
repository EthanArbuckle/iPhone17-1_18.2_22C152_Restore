@interface BMStreamCRDTLocationBuilder
- (BMStreamCRDTLocationBuilder)initWithAssignerPolicy:(id)a3;
- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5;
@end

@implementation BMStreamCRDTLocationBuilder

- (BMStreamCRDTLocationBuilder)initWithAssignerPolicy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMStreamCRDTLocationBuilder;
  v6 = [(BMStreamCRDTLocationBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policy, a3);
  }

  return v7;
}

- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5
{
  return [(BMStreamCRDTLocationAssignerPolicy *)self->_policy locationWithStreamName:a3 siteIdentifier:a4 timestamp:a5];
}

- (void).cxx_destruct
{
}

@end