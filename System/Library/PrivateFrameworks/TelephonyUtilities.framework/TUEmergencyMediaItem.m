@interface TUEmergencyMediaItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (NSString)assetId;
- (TUEmergencyMediaItem)initWithAssetId:(id)a3;
- (TUEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4;
- (TUEmergencyMediaItem)initWithCoder:(id)a3;
- (TUEmergencyMediaItem)initWithMediaItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)emergencyMediaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmergencyMediaType:(int64_t)a3;
@end

@implementation TUEmergencyMediaItem

- (TUEmergencyMediaItem)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 assetId];
  uint64_t v6 = [v4 emergencyMediaType];

  v7 = [(TUEmergencyMediaItem *)self initWithAssetId:v5 mediaType:v6];
  return v7;
}

- (TUEmergencyMediaItem)initWithAssetId:(id)a3
{
  return [(TUEmergencyMediaItem *)self initWithAssetId:a3 mediaType:0];
}

- (TUEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUEmergencyMediaItem;
  v7 = [(TUEmergencyMediaItem *)&v11 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUEmergencyMediaItem initWithAssetId:mediaType:]", @"assetId" format];
    }
    uint64_t v8 = [v6 copy];
    assetId = v7->_assetId;
    v7->_assetId = (NSString *)v8;

    v7->_emergencyMediaType = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUEmergencyMediaItem allocWithZone:a3];

  return [(TUEmergencyMediaItem *)v4 initWithMediaItem:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  assetId = self->_assetId;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_assetId);
  [v5 encodeObject:assetId forKey:v6];

  int64_t emergencyMediaType = self->_emergencyMediaType;
  NSStringFromSelector(sel_emergencyMediaType);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:emergencyMediaType forKey:v8];
}

- (TUEmergencyMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUEmergencyMediaItem;
  id v5 = [(TUEmergencyMediaItem *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_assetId);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v8;

    v10 = NSStringFromSelector(sel_emergencyMediaType);
    v5->_int64_t emergencyMediaType = [v4 decodeIntegerForKey:v10];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_assetId);
  id v5 = [(TUEmergencyMediaItem *)self assetId];
  [v3 appendFormat:@"%@=%@", v4, v5];

  uint64_t v6 = NSStringFromSelector(sel_emergencyMediaType);
  [v3 appendFormat:@"%@=%ld", v6, -[TUEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType")];

  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(TUEmergencyMediaItem *)self assetId];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(TUEmergencyMediaItem *)self emergencyMediaType] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUEmergencyMediaItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUEmergencyMediaItem *)self isEqualToMediaItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUEmergencyMediaItem *)self assetId];
  uint64_t v6 = [v4 assetId];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    int64_t v7 = [(TUEmergencyMediaItem *)self emergencyMediaType];
    BOOL v8 = v7 == [v4 emergencyMediaType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)emergencyMediaType
{
  return self->_emergencyMediaType;
}

- (void)setEmergencyMediaType:(int64_t)a3
{
  self->_int64_t emergencyMediaType = a3;
}

- (void).cxx_destruct
{
}

@end