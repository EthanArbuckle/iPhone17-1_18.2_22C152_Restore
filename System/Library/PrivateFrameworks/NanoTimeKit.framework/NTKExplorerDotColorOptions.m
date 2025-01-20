@interface NTKExplorerDotColorOptions
+ (BOOL)supportsSecureCoding;
- (NTKExplorerDotColorOptions)initWithCoder:(id)a3;
- (UIColor)connectedDotBackgroundColor;
- (UIColor)connectedDotColor;
- (UIColor)noServiceDotColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectedDotBackgroundColor:(id)a3;
- (void)setConnectedDotColor:(id)a3;
- (void)setNoServiceDotColor:(id)a3;
@end

@implementation NTKExplorerDotColorOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NTKExplorerDotColorOptions);
  v5 = v4;
  if (v4)
  {
    [(NTKExplorerDotColorOptions *)v4 setConnectedDotColor:self->_connectedDotColor];
    [(NTKExplorerDotColorOptions *)v5 setConnectedDotBackgroundColor:self->_connectedDotBackgroundColor];
    [(NTKExplorerDotColorOptions *)v5 setNoServiceDotColor:self->_noServiceDotColor];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  connectedDotColor = self->_connectedDotColor;
  id v5 = a3;
  [v5 encodeObject:connectedDotColor forKey:@"connectedDotColorKey"];
  [v5 encodeObject:self->_connectedDotBackgroundColor forKey:@"connectedDotBackgroundColorKey"];
  [v5 encodeObject:self->_noServiceDotColor forKey:@"noServiceDotColor"];
}

- (NTKExplorerDotColorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKExplorerDotColorOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedDotColorKey"];
    connectedDotColor = v5->_connectedDotColor;
    v5->_connectedDotColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedDotBackgroundColorKey"];
    connectedDotBackgroundColor = v5->_connectedDotBackgroundColor;
    v5->_connectedDotBackgroundColor = (UIColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noServiceDotColor"];
    noServiceDotColor = v5->_noServiceDotColor;
    v5->_noServiceDotColor = (UIColor *)v10;
  }
  return v5;
}

- (UIColor)connectedDotColor
{
  return self->_connectedDotColor;
}

- (void)setConnectedDotColor:(id)a3
{
}

- (UIColor)connectedDotBackgroundColor
{
  return self->_connectedDotBackgroundColor;
}

- (void)setConnectedDotBackgroundColor:(id)a3
{
}

- (UIColor)noServiceDotColor
{
  return self->_noServiceDotColor;
}

- (void)setNoServiceDotColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noServiceDotColor, 0);
  objc_storeStrong((id *)&self->_connectedDotBackgroundColor, 0);

  objc_storeStrong((id *)&self->_connectedDotColor, 0);
}

@end