@interface PAAccess
+ (BOOL)supportsSecureCoding;
+ (NSArray)allAccessClasses;
+ (NSString)eventStreamIdentifier;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)supportsSameMinuteAccessCountLogging;
- (NSSet)assetIdentifiers;
- (NSString)category;
- (NSString)description;
- (NSString)descriptionForCategory;
- (NSUUID)identifier;
- (PAAccess)initWithAccessor:(id)a3;
- (PAAccess)initWithAccessor:(id)a3 assetIdentifiers:(id)a4;
- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5;
- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6;
- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6 visibilityState:(int64_t)a7 accessEventCount:(unint64_t)a8 accessCount:(unint64_t)a9;
- (PAAccess)initWithCoder:(id)a3;
- (PAAccess)initWithProto:(id)a3;
- (PAAccess)initWithProtoData:(id)a3;
- (PAApplication)accessor;
- (double)timestampAdjustment;
- (id)JSONObject;
- (id)asIntervalBeginEvent;
- (id)asIntervalEndEventWithTimestampAdjustment:(double)a3;
- (id)asIntervalEventWithAssetIdentifiers:(id)a3 visibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5;
- (id)copyWithNewAccessor:(id)a3;
- (id)copyWithNewAssetIdentifiers:(id)a3;
- (id)copyWithNewIdentifier:(id)a3;
- (id)copyWithNewKind:(int64_t)a3;
- (id)copyWithNewTimestampAdjustment:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionForKind;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (int64_t)kind;
- (int64_t)visibilityState;
- (unint64_t)accessCount;
- (unint64_t)eventCount;
- (unint64_t)hash;
- (unint64_t)hashWithOptions:(unint64_t)a3;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessCount:(unint64_t)a3;
@end

@implementation PAAccess

- (id)copyWithNewAccessor:(id)a3
{
  v5 = (PAApplication *)a3;
  accessor = self->_accessor;
  if (accessor == v5 || [(PAApplication *)accessor isEqual:v5])
  {
    v7 = self;
  }
  else
  {
    uint64_t v8 = [(PAAccess *)self copy];
    v7 = (PAAccess *)v8;
    if (v8) {
      objc_storeStrong((id *)(v8 + 16), a3);
    }
  }

  return v7;
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  char v3 = a3;
  unint64_t v5 = [(PAApplication *)self->_accessor hash];
  if (v3)
  {
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v5 = [(NSUUID *)self->_identifier hash] - v5 + 32 * v5;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  unint64_t v5 = self->_kind - v5 + 32 * v5;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
LABEL_11:
    unint64_t v5 = [(NSSet *)self->_assetIdentifiers hash] - v5 + 32 * v5;
    if ((v3 & 0x10) != 0) {
      return v5;
    }
    return self->_visibilityState - v5 + 32 * v5;
  }
LABEL_10:
  v7 = [NSNumber numberWithDouble:self->_timestampAdjustment];
  unint64_t v5 = [v7 hash] - v5 + 32 * v5;

  if ((v3 & 8) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v3 & 0x10) == 0) {
    return self->_visibilityState - v5 + 32 * v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_accessor, 0);
}

- (PAAccess)initWithAccessor:(id)a3 assetIdentifiers:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [(PAAccess *)self initWithAccessor:v8 identifier:v9 kind:1 assetIdentifiers:v7 visibilityState:0 accessEventCount:0 accessCount:0];

  return v10;
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6 visibilityState:(int64_t)a7 accessEventCount:(unint64_t)a8 accessCount:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PAAccess;
  v19 = [(PAAccess *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accessor, a3);
    objc_storeStrong((id *)&v20->_identifier, a4);
    v20->_kind = a5;
    v20->_timestampAdjustment = 0.0;
    v20->_visibilityState = a7;
    v21 = (void *)[v18 copy];
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CAD0] set];
    }
    assetIdentifiers = v20->_assetIdentifiers;
    v20->_assetIdentifiers = v23;

    v20->_accessCount = a9;
    v20->_eventCount = a8;
  }

  return v20;
}

- (NSSet)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (id)asIntervalBeginEvent
{
  v2 = (void *)[(PAAccess *)self copy];
  v2[4] = 2;
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  v4 = (void *)v2[5];
  v2[5] = v3;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(PAApplication *)self->_accessor copyWithZone:a3];
  id v7 = (void *)[(NSUUID *)self->_identifier copyWithZone:a3];
  id v8 = (void *)[v5 initWithAccessor:v6 identifier:v7 kind:self->_kind assetIdentifiers:self->_assetIdentifiers visibilityState:self->_visibilityState accessEventCount:self->_eventCount accessCount:self->_accessCount];

  return v8;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = (PAAccess *)a3;
  if (v6 != self)
  {
    if (![(PAAccess *)v6 isMemberOfClass:objc_opt_class()]) {
      goto LABEL_18;
    }
    accessor = self->_accessor;
    id v8 = [(PAAccess *)v6 accessor];
    LODWORD(accessor) = [(PAApplication *)accessor isEqual:v8];

    if (!accessor) {
      goto LABEL_18;
    }
    if ((v4 & 1) == 0)
    {
      identifier = self->_identifier;
      v10 = [(PAAccess *)v6 identifier];
      LODWORD(identifier) = [(NSUUID *)identifier isEqual:v10];

      if (!identifier) {
        goto LABEL_18;
      }
    }
    if ((v4 & 2) == 0)
    {
      int64_t kind = self->_kind;
      if (kind != [(PAAccess *)v6 kind]) {
        goto LABEL_18;
      }
    }
    if ((v4 & 4) == 0)
    {
      double timestampAdjustment = self->_timestampAdjustment;
      [(PAAccess *)v6 timestampAdjustment];
      if (timestampAdjustment != v13) {
        goto LABEL_18;
      }
    }
    if ((v4 & 8) == 0)
    {
      assetIdentifiers = self->_assetIdentifiers;
      uint64_t v15 = [(PAAccess *)v6 assetIdentifiers];
      if (assetIdentifiers == (NSSet *)v15)
      {
      }
      else
      {
        id v16 = (void *)v15;
        id v17 = self->_assetIdentifiers;
        id v18 = [(PAAccess *)v6 assetIdentifiers];
        LODWORD(v17) = [(NSSet *)v17 isEqual:v18];

        if (!v17)
        {
LABEL_18:
          BOOL v20 = 0;
          goto LABEL_19;
        }
      }
    }
    if ((v4 & 0x10) == 0)
    {
      int64_t visibilityState = self->_visibilityState;
      if (visibilityState != [(PAAccess *)v6 visibilityState]) {
        goto LABEL_18;
      }
    }
  }
  BOOL v20 = 1;
LABEL_19:

  return v20;
}

- (PAApplication)accessor
{
  return self->_accessor;
}

- (id)JSONObject
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"access";
  v10[0] = @"type";
  v10[1] = @"accessor";
  uint64_t v3 = [(PAApplication *)self->_accessor JSONObject];
  v11[1] = v3;
  v10[2] = @"category";
  char v4 = [(PAAccess *)self descriptionForCategory];
  v11[2] = v4;
  v10[3] = @"identifier";
  id v5 = [(NSUUID *)self->_identifier UUIDString];
  v11[3] = v5;
  v10[4] = @"kind";
  id v6 = [(PAAccess *)self descriptionForKind];
  v11[4] = v6;
  v10[5] = @"accessCount";
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAAccess accessCount](self, "accessCount"));
  v11[5] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

- (id)descriptionForKind
{
  unint64_t v2 = self->_kind - 1;
  if (v2 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5D70F20[v2];
  }
}

- (unint64_t)accessCount
{
  return self->_accessCount;
}

- (id)copyWithNewIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PAAccess *)self copy];
  id v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 24), a3);
  }

  return v7;
}

- (id)asIntervalEndEventWithTimestampAdjustment:(double)a3
{
  uint64_t v4 = [(PAAccess *)self copy];
  *(void *)(v4 + 32) = 3;
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v5;

  *(double *)(v4 + 48) = a3;

  return (id)v4;
}

- (unint64_t)hash
{
  return [(PAAccess *)self hashWithOptions:0];
}

- (void)encodeWithCoder:(id)a3
{
  accessor = self->_accessor;
  id v5 = a3;
  [v5 encodeObject:accessor forKey:@"accessor"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_assetIdentifiers forKey:@"assetIdentifiers"];
  [v5 encodeInteger:self->_visibilityState forKey:@"visibilityState"];
  [v5 encodeInteger:self->_eventCount forKey:@"eventCount"];
  [v5 encodeInteger:self->_accessCount forKey:@"accessCount"];
}

- (PAAccess)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__once, &__block_literal_global_1);
  }
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"accessor"];
  id v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v8 = [v5 decodeIntegerForKey:@"kind"];
  v9 = [v5 decodeObjectOfClasses:initWithCoder__allowedIdentifierClasses forKey:@"assetIdentifiers"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"visibilityState"];
  uint64_t v11 = [v5 decodeIntegerForKey:@"eventCount"];
  uint64_t v12 = [v5 decodeIntegerForKey:@"accessCount"];

  double v13 = [(PAAccess *)self initWithAccessor:v6 identifier:v7 kind:v8 assetIdentifiers:v9 visibilityState:v10 accessEventCount:v11 accessCount:v12];
  return v13;
}

- (int64_t)kind
{
  return self->_kind;
}

+ (NSArray)allAccessClasses
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  unint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return (NSArray *)v2;
}

+ (NSString)eventStreamIdentifier
{
  return (NSString *)@"com.apple.privacy.accounting.stream";
}

- (PAAccess)initWithAccessor:(id)a3
{
  return [(PAAccess *)self initWithAccessor:a3 assetIdentifiers:0];
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5
{
  return [(PAAccess *)self initWithAccessor:a3 identifier:a4 kind:a5 assetIdentifiers:0];
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6
{
  return [(PAAccess *)self initWithAccessor:a3 identifier:a4 kind:a5 assetIdentifiers:a6 visibilityState:0 accessEventCount:0 accessCount:0];
}

- (id)asIntervalEventWithAssetIdentifiers:(id)a3 visibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5
{
  id v8 = a3;
  v9 = (void *)[(PAAccess *)self copy];
  v9[4] = 4;
  uint64_t v10 = (void *)[v8 copy];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v12 = (void *)v9[5];
  v9[5] = v11;

  v9[1] = a4;
  v9[8] = a5;

  return v9;
}

- (id)copyWithNewKind:(int64_t)a3
{
  id result = (id)[(PAAccess *)self copy];
  if (result) {
    *((void *)result + 4) = a3;
  }
  return result;
}

- (id)copyWithNewAssetIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(PAAccess *)self copy];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 copy];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    v9 = (void *)v5[5];
    v5[5] = v8;
  }
  return v5;
}

- (BOOL)supportsSameMinuteAccessCountLogging
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = [(PAAccess *)self category];
  char v4 = [v3 isEqual:@"contacts"];

  return v4;
}

- (NSString)category
{
  return (NSString *)@"unknown";
}

- (NSString)descriptionForCategory
{
  unint64_t v2 = [(PAAccess *)self category];
  uint64_t v3 = v2;
  if (!v2) {
    unint64_t v2 = @"unknown";
  }
  char v4 = v2;

  return v4;
}

- (id)copyWithNewTimestampAdjustment:(double)a3
{
  id result = (id)[(PAAccess *)self copy];
  if (result) {
    *((double *)result + 6) = a3;
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  accessor = self->_accessor;
  identifier = self->_identifier;
  id v7 = [(PAAccess *)self descriptionForKind];
  id v8 = [NSNumber numberWithDouble:self->_timestampAdjustment];
  v9 = [v3 stringWithFormat:@"<%@ %p> accessor:<%@> identifier:%@ kind:%@ timestampAdjustment:%@ visibilityState:%lu assetIdentifierCount:%lu accessCount:%lu", v4, self, accessor, identifier, v7, v8, self->_visibilityState, -[NSSet count](self->_assetIdentifiers, "count"), self->_accessCount];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  return [(PAAccess *)self isEqualToAccess:a3 withOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__PAAccess_initWithCoder___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)initWithCoder__allowedIdentifierClasses;
  initWithCoder__allowedIdentifierClasses = v2;
}

- (unsigned)dataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 >= 3)
  {
    id v6 = a3;
    uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)json
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(PAAccess *)self JSONObject];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:3 error:0];

  return v4;
}

- (id)encodeAsProto
{
  uint64_t v2 = [(PAAccess *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (PAAccess)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [PAApplication alloc];
    id v7 = [v5 accessor];
    id v8 = [(PAApplication *)v6 initWithProto:v7];

    if (v8
      && ([v5 identifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 length],
          v9,
          v10 == 16))
    {
      id v11 = objc_alloc(MEMORY[0x1E4F29128]);
      id v12 = [v5 identifier];
      double v13 = objc_msgSend(v11, "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));

      if (v13 && (uint64_t v14 = [v5 kind] - 1, v14 <= 3))
      {
        uint64_t v15 = v14 + 1;
        id v16 = [v5 assetIdentifiers];
        id v17 = (void *)MEMORY[0x1E4F1CAD0];
        if (v16)
        {
          id v18 = [v5 assetIdentifiers];
          v19 = [v17 setWithArray:v18];
        }
        else
        {
          v19 = [MEMORY[0x1E4F1CAD0] set];
        }

        self = [(PAAccess *)self initWithAccessor:v8 identifier:v13 kind:v15 assetIdentifiers:v19 visibilityState:0 accessEventCount:0 accessCount:0];
        if (self)
        {
          [v5 timestampAdjustment];
          self->_double timestampAdjustment = v21;
          self->_accessCount = (int)[v5 accessCount];
        }

        BOOL v20 = self;
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (PAAccess)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PAPBAccess alloc] initWithData:v4];

    id v6 = [(PAAccess *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [(PAApplication *)self->_accessor proto];
  [v3 setAccessor:v4];

  v11[0] = 0;
  v11[1] = 0;
  [(NSUUID *)self->_identifier getUUIDBytes:v11];
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v11 length:16];
  [v3 setIdentifier:v5];

  id v6 = 0;
  if ((unint64_t)(self->_kind - 1) <= 3)
  {
    [v3 setKind:LODWORD(self->_kind)];
    if (self->_timestampAdjustment != 0.0) {
      objc_msgSend(v3, "setTimestampAdjustment:");
    }
    if (self->_accessCount) {
      objc_msgSend(v3, "setAccessCount:");
    }
    id v7 = [(PAAccess *)self assetIdentifiers];
    id v8 = [v7 allObjects];
    v9 = (void *)[v8 mutableCopy];
    [v3 setAssetIdentifiers:v9];

    id v6 = v3;
  }

  return v6;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestampAdjustment
{
  return self->_timestampAdjustment;
}

- (void)setAccessCount:(unint64_t)a3
{
  self->_accessCount = a3;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

@end