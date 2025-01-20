@interface SLDImageSymbolConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6;
- (BOOL)isEqual:(id)a3;
- (CGSize)minViableSizeWithDisplayScale:(double)a3 RTL:(BOOL)a4 darkMode:(BOOL)a5;
- (CGSize)minViableSizeWithStyle:(id)a3;
- (NSNumber)pointSizeNumber;
- (NSString)name;
- (SLDImageSymbolConfiguration)init;
- (SLDImageSymbolConfiguration)initWithCoder:(id)a3;
- (SLDImageSymbolConfiguration)initWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6;
- (double)pointSize;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)coreUISize;
- (int64_t)weight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreUISize:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPointSize:(double)a3;
- (void)setPointSizeNumber:(id)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation SLDImageSymbolConfiguration

+ (id)configurationWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6
{
  id v9 = a3;
  v10 = [[SLDImageSymbolConfiguration alloc] initWithName:v9 coreUISize:a4 weight:a5 pointSize:a6];

  return v10;
}

- (SLDImageSymbolConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)SLDImageSymbolConfiguration;
  v2 = [(SLDImageSymbolConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"exclamationmark.circle";

    *(_OWORD *)&v3->_coreUISize = xmmword_19BED1540;
    v3->_pointSize = 20.0;
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:20.0];
    pointSizeNumber = v3->_pointSizeNumber;
    v3->_pointSizeNumber = (NSNumber *)v5;
  }
  return v3;
}

- (SLDImageSymbolConfiguration)initWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDImageSymbolConfiguration;
  v12 = [(SLDImageSymbolConfiguration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_coreUISize = a4;
    v13->_weight = a5;
    v13->_pointSize = a6;
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:a6];
    pointSizeNumber = v13->_pointSizeNumber;
    v13->_pointSizeNumber = (NSNumber *)v14;
  }
  return v13;
}

- (CGSize)minViableSizeWithStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDImageSymbolConfiguration *)self coreUISize];
  uint64_t v6 = [(SLDImageSymbolConfiguration *)self weight];
  [(SLDImageSymbolConfiguration *)self pointSize];
  double v7 = 10.0;
  if (v8 > 0.0)
  {
    [(SLDImageSymbolConfiguration *)self pointSize];
    double v7 = v9;
  }
  if (!v6) {
    uint64_t v6 = 4;
  }
  v10 = [(SLDImageSymbolConfiguration *)self name];
  id v11 = SLDSystemVectorGlyphWithSlotStyle(v4, v10, v5, v6, v7);

  LODWORD(v10) = [v4 displayScale];
  double v12 = SLDVectorGlyphMinimumViableSize(v11, (double)v10);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)minViableSizeWithDisplayScale:(double)a3 RTL:(BOOL)a4 darkMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = [(SLDImageSymbolConfiguration *)self coreUISize];
  uint64_t v10 = [(SLDImageSymbolConfiguration *)self weight];
  [(SLDImageSymbolConfiguration *)self pointSize];
  double v11 = 10.0;
  if (v12 > 0.0)
  {
    [(SLDImageSymbolConfiguration *)self pointSize];
    double v11 = v13;
  }
  if (!v10) {
    uint64_t v10 = 4;
  }
  double v14 = [(SLDImageSymbolConfiguration *)self name];
  double v15 = SLDSystemVectorGlyph(v14, v6, v9, v10, v5, a3, v11);

  double v16 = SLDVectorGlyphMinimumViableSize(v15, a3);
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SLDImageSymbolConfiguration *)self name];
  [v4 encodeObject:v5 forKey:@"symbolName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize"), @"coreUISize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDImageSymbolConfiguration weight](self, "weight"), @"weight");
  [(SLDImageSymbolConfiguration *)self pointSize];
  objc_msgSend(v4, "encodeDouble:forKey:", @"ptSize");
  id v6 = [(SLDImageSymbolConfiguration *)self pointSizeNumber];
  [v4 encodeObject:v6 forKey:@"ptSizeNumber"];
}

- (SLDImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLDImageSymbolConfiguration;
  BOOL v5 = [(SLDImageSymbolConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_coreUISize = [v4 decodeIntegerForKey:@"coreUISize"];
    v5->_weight = [v4 decodeIntegerForKey:@"weight"];
    [v4 decodeDoubleForKey:@"ptSize"];
    v5->_pointSize = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ptSizeNumber"];
    pointSizeNumber = v5->_pointSizeNumber;
    v5->_pointSizeNumber = (NSNumber *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (SLDImageSymbolConfiguration *)v5;
    double v7 = v6;
    if (v6 == self)
    {
      char v12 = 1;
    }
    else
    {
      double v8 = [(SLDImageSymbolConfiguration *)v6 name];
      if (v8
        || ([(SLDImageSymbolConfiguration *)self name], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v9 = [(SLDImageSymbolConfiguration *)v7 name];
        uint64_t v10 = [(SLDImageSymbolConfiguration *)self name];
        int v11 = [v9 isEqual:v10];

        if (v8)
        {

          if (!v11) {
            goto LABEL_15;
          }
        }
        else
        {

          if ((v11 & 1) == 0)
          {
LABEL_15:
            char v12 = 0;
            goto LABEL_16;
          }
        }
      }
      uint64_t v13 = [(SLDImageSymbolConfiguration *)v7 coreUISize];
      if (v13 != [(SLDImageSymbolConfiguration *)self coreUISize]) {
        goto LABEL_15;
      }
      uint64_t v14 = [(SLDImageSymbolConfiguration *)v7 weight];
      if (v14 != [(SLDImageSymbolConfiguration *)self weight]) {
        goto LABEL_15;
      }
      [(SLDImageSymbolConfiguration *)v7 pointSize];
      double v16 = v15;
      [(SLDImageSymbolConfiguration *)self pointSize];
      if (v16 != v17) {
        goto LABEL_15;
      }
      double v18 = [(SLDImageSymbolConfiguration *)v7 pointSizeNumber];
      double v19 = [(SLDImageSymbolConfiguration *)self pointSizeNumber];
      char v12 = [v18 isEqualToNumber:v19];
    }
LABEL_16:

    goto LABEL_17;
  }
  char v12 = 0;
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3 = [(SLDImageSymbolConfiguration *)self coreUISize];
  id v4 = [(SLDImageSymbolConfiguration *)self name];
  uint64_t v5 = [v4 hash];
  int64_t v6 = v5 ^ v3 ^ [(SLDImageSymbolConfiguration *)self weight];
  double v7 = [(SLDImageSymbolConfiguration *)self pointSizeNumber];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(SLDImageSymbolConfiguration *)self name];
  [v4 setName:v5];

  objc_msgSend(v4, "setCoreUISize:", -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize"));
  objc_msgSend(v4, "setWeight:", -[SLDImageSymbolConfiguration weight](self, "weight"));
  [(SLDImageSymbolConfiguration *)self pointSize];
  objc_msgSend(v4, "setPointSize:");
  int64_t v6 = [(SLDImageSymbolConfiguration *)self pointSizeNumber];
  [v4 setPointSizeNumber:v6];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)coreUISize
{
  return self->_coreUISize;
}

- (void)setCoreUISize:(int64_t)a3
{
  self->_coreUISize = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (NSNumber)pointSizeNumber
{
  return self->_pointSizeNumber;
}

- (void)setPointSizeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointSizeNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end