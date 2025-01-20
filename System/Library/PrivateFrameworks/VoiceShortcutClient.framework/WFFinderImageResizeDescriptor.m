@interface WFFinderImageResizeDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)preserveMetadata;
- (NSString)identifier;
- (WFFinderImageResizeDescriptor)initWithCoder:(id)a3;
- (WFFinderImageResizeDescriptor)initWithFormat:(unint64_t)a3 size:(unint64_t)a4 preserveMetadata:(BOOL)a5;
- (id)description;
- (unint64_t)format;
- (unint64_t)hash;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFinderImageResizeDescriptor

- (void).cxx_destruct
{
}

- (BOOL)preserveMetadata
{
  return self->_preserveMetadata;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFinderImageResizeDescriptor format](self, "format"), @"format");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFinderImageResizeDescriptor size](self, "size"), @"size");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata"), @"preserveMetadata");
}

- (WFFinderImageResizeDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"format"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"size"];
  uint64_t v7 = [v4 decodeBoolForKey:@"preserveMetadata"];

  v8 = [(WFFinderImageResizeDescriptor *)self initWithFormat:v5 size:v6 preserveMetadata:v7];
  v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p, Format: %ld, Size: %ld, Preserve Metadata: %d>", v5, self, -[WFFinderImageResizeDescriptor format](self, "format"), -[WFFinderImageResizeDescriptor size](self, "size"), -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata")];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFFinderImageResizeDescriptor *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
    goto LABEL_11;
  }
  uint64_t v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v6 = 0;
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  unint64_t v7 = [(WFFinderImageResizeDescriptor *)self format];
  if (v7 != [(WFFinderImageResizeDescriptor *)v6 format]) {
    goto LABEL_8;
  }
  unint64_t v8 = [(WFFinderImageResizeDescriptor *)self size];
  if (v8 != [(WFFinderImageResizeDescriptor *)v6 size]) {
    goto LABEL_8;
  }
  BOOL v9 = [(WFFinderImageResizeDescriptor *)self preserveMetadata];
  BOOL v10 = v9 ^ [(WFFinderImageResizeDescriptor *)v6 preserveMetadata] ^ 1;
LABEL_9:

LABEL_11:
  return v10;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFFinderImageResizeDescriptor format](self, "format"));
  id v5 = (id)objc_msgSend(v3, "combineInteger:", -[WFFinderImageResizeDescriptor size](self, "size"));
  id v6 = (id)objc_msgSend(v3, "combineBool:", -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata"));
  unint64_t v7 = [v3 finalize];

  return v7;
}

- (WFFinderImageResizeDescriptor)initWithFormat:(unint64_t)a3 size:(unint64_t)a4 preserveMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)WFFinderImageResizeDescriptor;
  unint64_t v8 = [(WFFinderImageResizeDescriptor *)&v13 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu-%d", a3, a4, v5);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_format = a3;
    v8->_size = a4;
    v8->_preserveMetadata = v5;
    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end