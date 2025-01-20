@interface MAAutoAssetControlStatisticsBySize
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetControlStatisticsBySize)init;
- (MAAutoAssetControlStatisticsBySize)initWithCoder:(id)a3;
- (MAAutoAssetControlStatisticsBySize)initWithInitialValue:(int64_t)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)fullAssets;
- (int64_t)fullBytes;
- (int64_t)patchedAssets;
- (int64_t)patchedBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setFullAssets:(int64_t)a3;
- (void)setFullBytes:(int64_t)a3;
- (void)setPatchedAssets:(int64_t)a3;
- (void)setPatchedBytes:(int64_t)a3;
@end

@implementation MAAutoAssetControlStatisticsBySize

- (MAAutoAssetControlStatisticsBySize)init
{
  return [(MAAutoAssetControlStatisticsBySize *)self initWithInitialValue:0];
}

- (MAAutoAssetControlStatisticsBySize)initWithInitialValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MAAutoAssetControlStatisticsBySize;
  result = [(MAAutoAssetControlStatisticsBySize *)&v5 init];
  if (result)
  {
    result->_patchedAssets = a3;
    result->_patchedBytes = a3;
    result->_fullAssets = a3;
    result->_fullBytes = a3;
  }
  return result;
}

- (MAAutoAssetControlStatisticsBySize)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetControlStatisticsBySize;
  objc_super v5 = [(MAAutoAssetControlStatisticsBySize *)&v7 init];
  if (v5)
  {
    v5->_patchedAssets = [v4 decodeInt64ForKey:@"patchedAssets"];
    v5->_patchedBytes = [v4 decodeInt64ForKey:@"patchedBytes"];
    v5->_fullAssets = [v4 decodeInt64ForKey:@"fullAssets"];
    v5->_fullBytes = [v4 decodeInt64ForKey:@"fullBytes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), @"patchedAssets");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), @"patchedBytes");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), @"fullAssets");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"), @"fullBytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(MAAutoAssetControlStatisticsBySize);
  [(MAAutoAssetControlStatisticsBySize *)v3 setPatchedAssets:[(MAAutoAssetControlStatisticsBySize *)self patchedAssets]];
  [(MAAutoAssetControlStatisticsBySize *)v3 setPatchedBytes:[(MAAutoAssetControlStatisticsBySize *)self patchedBytes]];
  [(MAAutoAssetControlStatisticsBySize *)v3 setFullAssets:[(MAAutoAssetControlStatisticsBySize *)self fullAssets]];
  [(MAAutoAssetControlStatisticsBySize *)v3 setFullBytes:[(MAAutoAssetControlStatisticsBySize *)self fullBytes]];
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @">>>\n   patchedAssets: %lld\n    patchedBytes: %lld\n      fullAssets: %lld\n       fullBytes: %lld\n<<<]", -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (id)summary
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[patchedAssets:%lld,patchedBytes:%lld,fullAssets:%lld,fullBytes:%lld]", -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (int64_t)patchedAssets
{
  return self->_patchedAssets;
}

- (void)setPatchedAssets:(int64_t)a3
{
  self->_patchedAssets = a3;
}

- (int64_t)patchedBytes
{
  return self->_patchedBytes;
}

- (void)setPatchedBytes:(int64_t)a3
{
  self->_patchedBytes = a3;
}

- (int64_t)fullAssets
{
  return self->_fullAssets;
}

- (void)setFullAssets:(int64_t)a3
{
  self->_fullAssets = a3;
}

- (int64_t)fullBytes
{
  return self->_fullBytes;
}

- (void)setFullBytes:(int64_t)a3
{
  self->_fullBytes = a3;
}

@end