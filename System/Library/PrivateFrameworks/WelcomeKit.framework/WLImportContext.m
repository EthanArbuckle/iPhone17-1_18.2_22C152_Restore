@interface WLImportContext
+ (BOOL)supportsSecureCoding;
- (WLImportContext)initWithCoder:(id)a3;
- (unint64_t)importCount;
- (unint64_t)importErrorCount;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setImportCount:(unint64_t)a3;
- (void)setImportErrorCount:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation WLImportContext

- (WLImportContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLImportContext;
  v5 = [(WLImportContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"import_count"];
    v5->_importCount = [v6 unsignedLongLongValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"import_error_count"];
    v5->_importErrorCount = [v7 unsignedLongLongValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    v5->_size = [v8 unsignedLongLongValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t importCount = self->_importCount;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:importCount];
  [v6 encodeObject:v7 forKey:@"import_count"];

  v8 = [NSNumber numberWithUnsignedLongLong:self->_importErrorCount];
  [v6 encodeObject:v8 forKey:@"import_error_count"];

  id v9 = [NSNumber numberWithUnsignedLongLong:self->_size];
  [v6 encodeObject:v9 forKey:@"size"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)importCount
{
  return self->_importCount;
}

- (void)setImportCount:(unint64_t)a3
{
  self->_unint64_t importCount = a3;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)setImportErrorCount:(unint64_t)a3
{
  self->_importErrorCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end