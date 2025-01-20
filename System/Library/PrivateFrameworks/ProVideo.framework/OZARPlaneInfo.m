@interface OZARPlaneInfo
+ (BOOL)supportsSecureCoding;
+ (id)planeListWithARFrame:(id)a3;
+ (id)planeListWithAnchors:(id)a3;
- (NSNumber)alignment;
- (NSNumber)classification;
- (NSUUID)identifier;
- (NSValue)center;
- (NSValue)extent;
- (NSValue)transform;
- (OZARPlaneInfo)initWithARPlaneAnchor:(id)a3;
- (OZARPlaneInfo)initWithCoder:(id)a3;
- (uint64_t)simdTransform;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignment:(id)a3;
- (void)setCenter:(id)a3;
- (void)setClassification:(id)a3;
- (void)setExtent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTransform:(id)a3;
@end

@implementation OZARPlaneInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZARPlaneInfo;
  [(OZARPlaneInfo *)&v3 dealloc];
}

- (OZARPlaneInfo)initWithARPlaneAnchor:(id)a3
{
  v4 = [(OZARPlaneInfo *)self init];
  if (v4)
  {
    -[OZARPlaneInfo setAlignment:](v4, "setAlignment:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "alignment")));
    -[OZARPlaneInfo setClassification:](v4, "setClassification:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "classification")));
    v5 = (void *)MEMORY[0x1E4F29238];
    [a3 extent];
    -[OZARPlaneInfo setExtent:](v4, "setExtent:", objc_msgSend(v5, "PCValueWithSIMDFloat3:"));
    v6 = (void *)MEMORY[0x1E4F29238];
    [a3 center];
    -[OZARPlaneInfo setCenter:](v4, "setCenter:", objc_msgSend(v6, "PCValueWithSIMDFloat3:"));
    v7 = (void *)MEMORY[0x1E4F29238];
    [a3 transform];
    -[OZARPlaneInfo setTransform:](v4, "setTransform:", objc_msgSend(v7, "PCValueWithSIMDFloat4x4:"));
    -[OZARPlaneInfo setIdentifier:](v4, "setIdentifier:", [a3 identifier]);
  }
  return v4;
}

+ (id)planeListWithARFrame:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a3, "anchors", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [[OZARPlaneInfo alloc] initWithARPlaneAnchor:v10];
          [v4 addObject:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v4;
}

+ (id)planeListWithAnchors:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [[OZARPlaneInfo alloc] initWithARPlaneAnchor:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [v4 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (uint64_t)simdTransform
{
  v1 = (void *)[a1 transform];

  return [v1 PCSIMDFloat4x4Value];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARPlaneInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OZARPlaneInfo;
  v4 = [(OZARPlaneInfo *)&v6 init];
  if (v4)
  {
    -[OZARPlaneInfo setAlignment:](v4, "setAlignment:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"alignment"]);
    -[OZARPlaneInfo setClassification:](v4, "setClassification:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"classification"]);
    -[OZARPlaneInfo setExtent:](v4, "setExtent:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"extent"]);
    -[OZARPlaneInfo setCenter:](v4, "setCenter:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"center"]);
    -[OZARPlaneInfo setTransform:](v4, "setTransform:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"transform"]);
    -[OZARPlaneInfo setIdentifier:](v4, "setIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo alignment](self, "alignment"), @"alignment");
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo classification](self, "classification"), @"classification");
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo extent](self, "extent"), @"extent");
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo center](self, "center"), @"center");
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo transform](self, "transform"), @"transform");
  uint64_t v5 = [(OZARPlaneInfo *)self identifier];

  [a3 encodeObject:v5 forKey:@"identifier"];
}

- (NSNumber)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(id)a3
{
}

- (NSNumber)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (NSValue)extent
{
  return self->_extent;
}

- (void)setExtent:(id)a3
{
}

- (NSValue)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
}

- (NSValue)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end