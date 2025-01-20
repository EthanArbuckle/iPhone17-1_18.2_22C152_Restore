@interface TRFetchAnisetteDataResponse
+ (BOOL)supportsSecureCoding;
- (AKAnisetteData)anisetteData;
- (TRFetchAnisetteDataResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAnisetteData:(id)a3;
@end

@implementation TRFetchAnisetteDataResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRFetchAnisetteDataResponse;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  anisetteData = self->_anisetteData;
  if (anisetteData) {
    [v4 encodeObject:anisetteData forKey:@"TRAnisetteDataMessages_aD"];
  }
}

- (TRFetchAnisetteDataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRFetchAnisetteDataResponse;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRAnisetteDataMessages_aD"];
    anisetteData = v5->_anisetteData;
    v5->_anisetteData = (AKAnisetteData *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"anisetteData:[-%@-]", self->_anisetteData];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRFetchAnisetteDataResponse;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (AKAnisetteData)anisetteData
{
  return self->_anisetteData;
}

- (void)setAnisetteData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end