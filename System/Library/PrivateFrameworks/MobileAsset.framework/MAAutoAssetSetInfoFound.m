@interface MAAutoAssetSetInfoFound
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSetInfoFound)initWithCoder:(id)a3;
- (MAAutoAssetSetStatus)currentSetStatus;
- (NSString)assetSetIdentifier;
- (id)description;
- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoFound

- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetSetInfoFound;
  v9 = [(MAAutoAssetSetInfoFound *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MAAutoAssetSetInfoFound)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetSetInfoFound;
  v5 = [(MAAutoAssetSetInfoFound *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSetStatus"];
    currentSetStatus = v5->_currentSetStatus;
    v5->_currentSetStatus = (MAAutoAssetSetStatus *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetInfoFound *)self assetSetIdentifier];
  [v4 encodeObject:v5 forKey:@"assetSetIdentifier"];

  id v6 = [(MAAutoAssetSetInfoFound *)self currentSetStatus];
  [v4 encodeObject:v6 forKey:@"currentSetStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MAAutoAssetSetInfoFound *)self summary];
  v5 = [(MAAutoAssetSetInfoFound *)self currentSetStatus];
  id v6 = [v5 description];
  id v7 = [v3 stringWithFormat:@"%@\n%@", v4, v6];

  return v7;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetSetInfoFound *)self assetSetIdentifier];
  v5 = [(MAAutoAssetSetInfoFound *)self currentSetStatus];
  id v6 = [v5 summary];
  id v7 = [v3 stringWithFormat:@"assetSetIdentifier:%@|currentSetStatus:%@", v4, v6];

  return v7;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MAAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSetStatus, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
}

@end