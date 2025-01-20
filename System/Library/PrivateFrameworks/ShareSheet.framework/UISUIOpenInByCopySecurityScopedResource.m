@interface UISUIOpenInByCopySecurityScopedResource
+ (BOOL)supportsSecureCoding;
- (NSString)bookmarkExportDataEncodedAsString;
- (UISUIOpenInByCopySecurityScopedResource)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkExportDataEncodedAsString:(id)a3;
@end

@implementation UISUIOpenInByCopySecurityScopedResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIOpenInByCopySecurityScopedResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISUIOpenInByCopySecurityScopedResource;
  v5 = [(UISUISecurityScopedResource *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkExportDataEncodedAsString"];
    [(UISUIOpenInByCopySecurityScopedResource *)v5 setBookmarkExportDataEncodedAsString:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISUIOpenInByCopySecurityScopedResource;
  id v4 = a3;
  [(UISUISecurityScopedResource *)&v6 encodeWithCoder:v4];
  v5 = [(UISUIOpenInByCopySecurityScopedResource *)self bookmarkExportDataEncodedAsString];
  [v4 encodeObject:v5 forKey:@"bookmarkExportDataEncodedAsString"];
}

- (NSString)bookmarkExportDataEncodedAsString
{
  return self->_bookmarkExportDataEncodedAsString;
}

- (void)setBookmarkExportDataEncodedAsString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end