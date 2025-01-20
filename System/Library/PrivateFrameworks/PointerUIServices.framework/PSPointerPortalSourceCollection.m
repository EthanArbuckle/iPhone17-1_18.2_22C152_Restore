@interface PSPointerPortalSourceCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeInvalidatedIfPointerLeavesDisplay;
- (PSMatchMoveSource)samplingMatchMoveSource;
- (PSPointerPortalSourceCollection)initWithCoder:(id)a3;
- (PSPointerPortalSourceCollection)initWithPointerPortalSource:(id)a3 overlayEffectPortalSource:(id)a4 samplingMatchMoveSource:(id)a5;
- (PSPortalSource)overlayEffectPortalSource;
- (PSPortalSource)pointerPortalSource;
- (id)description;
- (unint64_t)hash;
- (unsigned)sourceContextID;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldBeInvalidatedIfPointerLeavesDisplay:(BOOL)a3;
@end

@implementation PSPointerPortalSourceCollection

- (PSPointerPortalSourceCollection)initWithPointerPortalSource:(id)a3 overlayEffectPortalSource:(id)a4 samplingMatchMoveSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PSPointerPortalSourceCollection;
  v11 = [(PSPointerPortalSourceCollection *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    pointerPortalSource = v11->_pointerPortalSource;
    v11->_pointerPortalSource = (PSPortalSource *)v12;

    uint64_t v14 = [v9 copy];
    overlayEffectPortalSource = v11->_overlayEffectPortalSource;
    v11->_overlayEffectPortalSource = (PSPortalSource *)v14;

    uint64_t v16 = [v10 copy];
    samplingMatchMoveSource = v11->_samplingMatchMoveSource;
    v11->_samplingMatchMoveSource = (PSMatchMoveSource *)v16;
  }
  return v11;
}

- (unsigned)sourceContextID
{
  return [(PSPortalSource *)self->_pointerPortalSource sourceContextID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSPointerPortalSourceCollection *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects() && BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PSPortalSource *)self->_pointerPortalSource hash];
  unint64_t v4 = [(PSPortalSource *)self->_overlayEffectPortalSource hash] ^ v3;
  return v4 ^ [(PSMatchMoveSource *)self->_samplingMatchMoveSource hash];
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%x", -[PSPointerPortalSourceCollection sourceContextID](self, "sourceContextID"));
  [v3 appendString:v4 withName:@"sourceContextID"];

  id v5 = (id)[v3 appendObject:self->_pointerPortalSource withName:@"pointerPortalSource"];
  id v6 = (id)[v3 appendObject:self->_overlayEffectPortalSource withName:@"overlayEffectPortalSource"];
  id v7 = (id)[v3 appendObject:self->_samplingMatchMoveSource withName:@"samplingMatchMoveSource"];
  id v8 = (id)[v3 appendBool:self->_shouldBeInvalidatedIfPointerLeavesDisplay withName:@"shouldInvalidateIfPointerLeavesDisplay" ifEqualTo:1];
  id v9 = [v3 build];

  return v9;
}

- (PSPointerPortalSourceCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerPortalSource"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overlayEffectPortalSource"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"samplingMatchMoveSource"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    id v10 = 0;
  }
  else
  {
    self = [(PSPointerPortalSourceCollection *)self initWithPointerPortalSource:v5 overlayEffectPortalSource:v6 samplingMatchMoveSource:v7];
    id v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  overlayEffectPortalSource = self->_overlayEffectPortalSource;
  id v5 = a3;
  [v5 encodeObject:overlayEffectPortalSource forKey:@"overlayEffectPortalSource"];
  [v5 encodeObject:self->_pointerPortalSource forKey:@"pointerPortalSource"];
  [v5 encodeObject:self->_samplingMatchMoveSource forKey:@"samplingMatchMoveSource"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPortalSource)overlayEffectPortalSource
{
  return self->_overlayEffectPortalSource;
}

- (PSPortalSource)pointerPortalSource
{
  return self->_pointerPortalSource;
}

- (PSMatchMoveSource)samplingMatchMoveSource
{
  return self->_samplingMatchMoveSource;
}

- (BOOL)shouldBeInvalidatedIfPointerLeavesDisplay
{
  return self->_shouldBeInvalidatedIfPointerLeavesDisplay;
}

- (void)setShouldBeInvalidatedIfPointerLeavesDisplay:(BOOL)a3
{
  self->_shouldBeInvalidatedIfPointerLeavesDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingMatchMoveSource, 0);
  objc_storeStrong((id *)&self->_pointerPortalSource, 0);
  objc_storeStrong((id *)&self->_overlayEffectPortalSource, 0);
}

@end