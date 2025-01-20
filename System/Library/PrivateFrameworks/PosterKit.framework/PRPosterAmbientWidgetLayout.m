@interface PRPosterAmbientWidgetLayout
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWidgetLayout:(id)a3;
- (NSDictionary)widgetLayoutIconState;
- (NSString)description;
- (PRPosterAmbientWidgetLayout)initWithBSXPCCoder:(id)a3;
- (PRPosterAmbientWidgetLayout)initWithCoder:(id)a3;
- (PRPosterAmbientWidgetLayout)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setWidgetLayoutIconState:(id)a3;
@end

@implementation PRPosterAmbientWidgetLayout

- (PRPosterAmbientWidgetLayout)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRPosterAmbientWidgetLayout;
    v5 = [(PRPosterAmbientWidgetLayout *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      widgetLayoutIconState = v5->_widgetLayoutIconState;
      v5->_widgetLayoutIconState = (NSDictionary *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_widgetLayoutIconState hash];
}

- (BOOL)isEqualToWidgetLayout:(id)a3
{
  id v4 = (PRPosterAmbientWidgetLayout *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(NSDictionary *)self->_widgetLayoutIconState isEqual:v4->_widgetLayoutIconState];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterAmbientWidgetLayout *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4
  }
      && (self,
          char v6 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && [(PRPosterAmbientWidgetLayout *)self isEqualToWidgetLayout:v5];

  return v8;
}

- (NSString)description
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v3 = PRSPosterUpdateAmbientWidgetsIdentifiers();
  id v4 = (id)[v2 appendObject:v3 withName:@"widgetLayoutIconState"];

  v5 = [v2 build];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F98];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  id v5 = a3;
  id v6 = [v3 dataWithPropertyList:widgetLayoutIconState format:200 options:0 error:0];
  [v5 encodeObject:v6 forKey:@"_widgetLayoutIconStateData"];
}

- (PRPosterAmbientWidgetLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"_widgetLayoutIconStateData"];

  v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
  BOOL v8 = [(PRPosterAmbientWidgetLayout *)self initWithDictionary:v7];

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F98];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  id v5 = a3;
  id v6 = [v3 dataWithPropertyList:widgetLayoutIconState format:200 options:0 error:0];
  [v5 encodeObject:v6 forKey:@"_widgetLayoutIconStateData"];
}

- (PRPosterAmbientWidgetLayout)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"_widgetLayoutIconStateData"];

  v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
  BOOL v8 = [(PRPosterAmbientWidgetLayout *)self initWithDictionary:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterAmbientWidgetLayout alloc];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  return [(PRPosterAmbientWidgetLayout *)v4 initWithDictionary:widgetLayoutIconState];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRMutablePosterAmbientWidgetLayout allocWithZone:a3];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  return [(PRPosterAmbientWidgetLayout *)v4 initWithDictionary:widgetLayoutIconState];
}

- (NSDictionary)widgetLayoutIconState
{
  return self->_widgetLayoutIconState;
}

- (void)setWidgetLayoutIconState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end