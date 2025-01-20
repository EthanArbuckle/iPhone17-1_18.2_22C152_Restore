@interface SUCoreScanParam
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSMutableDictionary)additionalInfo;
- (NSString)note;
- (SUCoreDescriptor)descriptor;
- (SUCoreDescriptor)fallbackDescriptor;
- (SUCoreDescriptor)majorPrimaryDescriptor;
- (SUCoreDescriptor)majorSecondaryDescriptor;
- (SUCoreDescriptor)minorPrimaryDescriptor;
- (SUCoreDescriptor)minorSecondaryDescriptor;
- (SUCoreScanParam)init;
- (SUCoreScanParam)initWithCoder:(id)a3;
- (SUCoreScanParam)initWithDescriptor:(id)a3 withFallbackDescriptor:(id)a4;
- (SUCoreScanParam)initWithMajorPrimaryDescriptor:(id)a3 majorSecondaryDescriptor:(id)a4 minorPrimaryDescriptor:(id)a5 minorSecondaryDescriptor:(id)a6;
- (SUCoreScanParam)initWithNote:(id)a3;
- (SUCoreScanParam)initWithResult:(int64_t)a3 withError:(id)a4;
- (id)description;
- (id)summary;
- (int64_t)resultCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setError:(id)a3;
- (void)setFallbackDescriptor:(id)a3;
- (void)setMajorPrimaryDescriptor:(id)a3;
- (void)setMajorSecondaryDescriptor:(id)a3;
- (void)setMinorPrimaryDescriptor:(id)a3;
- (void)setMinorSecondaryDescriptor:(id)a3;
- (void)setNote:(id)a3;
- (void)setResultCode:(int64_t)a3;
@end

@implementation SUCoreScanParam

- (SUCoreScanParam)init
{
  v15.receiver = self;
  v15.super_class = (Class)SUCoreScanParam;
  v2 = [(SUCoreScanParam *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    error = v2->_error;
    v2->_resultCode = 0;
    v2->_error = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    fallbackDescriptor = v3->_fallbackDescriptor;
    v3->_fallbackDescriptor = 0;

    majorPrimaryDescriptor = v3->_majorPrimaryDescriptor;
    v3->_majorPrimaryDescriptor = 0;

    majorSecondaryDescriptor = v3->_majorSecondaryDescriptor;
    v3->_majorSecondaryDescriptor = 0;

    minorPrimaryDescriptor = v3->_minorPrimaryDescriptor;
    v3->_minorPrimaryDescriptor = 0;

    minorSecondaryDescriptor = v3->_minorSecondaryDescriptor;
    v3->_minorSecondaryDescriptor = 0;

    note = v3->_note;
    v3->_note = 0;

    uint64_t v12 = objc_opt_new();
    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = (NSMutableDictionary *)v12;
  }
  return v3;
}

- (SUCoreScanParam)initWithResult:(int64_t)a3 withError:(id)a4
{
  id v7 = a4;
  v8 = [(SUCoreScanParam *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v8->_resultCode = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (SUCoreScanParam)initWithDescriptor:(id)a3 withFallbackDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SUCoreScanParam *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_fallbackDescriptor, a4);
  }

  return v10;
}

- (SUCoreScanParam)initWithMajorPrimaryDescriptor:(id)a3 majorSecondaryDescriptor:(id)a4 minorPrimaryDescriptor:(id)a5 minorSecondaryDescriptor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_super v15 = [(SUCoreScanParam *)self init];
  v16 = v15;
  if (v15)
  {
    v15->_type = 3;
    objc_storeStrong((id *)&v15->_majorPrimaryDescriptor, a3);
    objc_storeStrong((id *)&v16->_majorSecondaryDescriptor, a4);
    objc_storeStrong((id *)&v16->_minorPrimaryDescriptor, a5);
    objc_storeStrong((id *)&v16->_minorSecondaryDescriptor, a6);
  }

  return v16;
}

- (SUCoreScanParam)initWithNote:(id)a3
{
  id v5 = a3;
  v6 = [(SUCoreScanParam *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (SUCoreScanParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUCoreScanParam;
  id v5 = [(SUCoreScanParam *)&v27 init];
  if (v5)
  {
    v5->_resultCode = [v4 decodeInt64ForKey:@"resultCode"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    id v7 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v8 = [v7 buildError:v5->_resultCode underlying:0 description:v6];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUCoreDescriptor *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackDescriptor"];
    fallbackDescriptor = v5->_fallbackDescriptor;
    v5->_fallbackDescriptor = (SUCoreDescriptor *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorPrimaryDescriptor"];
    majorPrimaryDescriptor = v5->_majorPrimaryDescriptor;
    v5->_majorPrimaryDescriptor = (SUCoreDescriptor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorSecondaryDescriptor"];
    majorSecondaryDescriptor = v5->_majorSecondaryDescriptor;
    v5->_majorSecondaryDescriptor = (SUCoreDescriptor *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorPrimaryDescriptor"];
    minorPrimaryDescriptor = v5->_minorPrimaryDescriptor;
    v5->_minorPrimaryDescriptor = (SUCoreDescriptor *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorSecondaryDescriptor"];
    minorSecondaryDescriptor = v5->_minorSecondaryDescriptor;
    v5->_minorSecondaryDescriptor = (SUCoreDescriptor *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"note"];
    note = v5->_note;
    v5->_note = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalInfo"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSMutableDictionary *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreScanParam resultCode](self, "resultCode"), @"resultCode");
  id v5 = [NSString alloc];
  v6 = [(SUCoreScanParam *)self error];
  id v15 = (id)[v5 initWithFormat:@"%@", v6];

  [v4 encodeObject:v15 forKey:@"error"];
  id v7 = [(SUCoreScanParam *)self descriptor];
  [v4 encodeObject:v7 forKey:@"descriptor"];

  uint64_t v8 = [(SUCoreScanParam *)self fallbackDescriptor];
  [v4 encodeObject:v8 forKey:@"fallbackDescriptor"];

  v9 = [(SUCoreScanParam *)self majorPrimaryDescriptor];
  [v4 encodeObject:v9 forKey:@"majorPrimaryDescriptor"];

  uint64_t v10 = [(SUCoreScanParam *)self majorSecondaryDescriptor];
  [v4 encodeObject:v10 forKey:@"majorSecondaryDescriptor"];

  id v11 = [(SUCoreScanParam *)self minorPrimaryDescriptor];
  [v4 encodeObject:v11 forKey:@"minorPrimaryDescriptor"];

  uint64_t v12 = [(SUCoreScanParam *)self minorSecondaryDescriptor];
  [v4 encodeObject:v12 forKey:@"minorSecondaryDescriptor"];

  id v13 = [(SUCoreScanParam *)self note];
  [v4 encodeObject:v13 forKey:@"note"];

  uint64_t v14 = [(SUCoreScanParam *)self additionalInfo];
  [v4 encodeObject:v14 forKey:@"additionalInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  switch(self->_type)
  {
    case 1:
      id v3 = [NSString alloc];
      int64_t v4 = [(SUCoreScanParam *)self resultCode];
      id v5 = [(SUCoreScanParam *)self error];
      v6 = [(SUCoreScanParam *)self additionalInfo];
      id v7 = (void *)[v3 initWithFormat:@"\n[>>>\n                   resultCode: %ld\n                        error: %@\n               additionalInfo: %@\n<<<]", v4, v5, v6];

      break;
    case 2:
      id v8 = [NSString alloc];
      v9 = [(SUCoreScanParam *)self descriptor];
      uint64_t v10 = [v9 summary];
      id v11 = [(SUCoreScanParam *)self fallbackDescriptor];
      uint64_t v12 = [v11 summary];
      id v13 = [(SUCoreScanParam *)self additionalInfo];
      id v7 = (void *)[v8 initWithFormat:@"\n[>>>\n                   descriptor: %@\n           fallbackDescriptor: %@\n               additionalInfo: %@\n<<<]", v10, v12, v13];

      goto LABEL_7;
    case 3:
      id v25 = [NSString alloc];
      uint64_t v14 = [(SUCoreScanParam *)self majorPrimaryDescriptor];
      id v15 = [v14 summary];
      uint64_t v16 = [(SUCoreScanParam *)self majorSecondaryDescriptor];
      v17 = [v16 summary];
      uint64_t v18 = [(SUCoreScanParam *)self minorPrimaryDescriptor];
      v19 = [v18 summary];
      uint64_t v20 = [(SUCoreScanParam *)self minorSecondaryDescriptor];
      v21 = [v20 summary];
      uint64_t v22 = [(SUCoreScanParam *)self additionalInfo];
      id v7 = (void *)[v25 initWithFormat:@"\n[>>>\n       majorPrimaryDescriptor: %@\n     majorSecondaryDescriptor: %@\n       minorPrimaryDescriptor: %@\n     minorSecondaryDescriptor: %@\n               additionalInfo: %@\n<<<]", v15, v17, v19, v21, v22];

      break;
    case 4:
      id v23 = [NSString alloc];
      v9 = [(SUCoreScanParam *)self note];
      uint64_t v10 = [(SUCoreScanParam *)self additionalInfo];
      id v7 = (void *)[v23 initWithFormat:@"\n[>>>\n          note: %@\nadditionalInfo: %@\n<<<]", v9, v10];
LABEL_7:

      break;
    default:
      id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"\n[>>>\n        NO_INFO: %d\n<<<]", self->_type);
      break;
  }

  return v7;
}

- (id)summary
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"resultCode:%ld", -[SUCoreScanParam resultCode](self, "resultCode"));
  int64_t v4 = [(SUCoreScanParam *)self error];

  if (v4)
  {
    id v5 = [(SUCoreScanParam *)self error];
    v6 = [v5 description];
    uint64_t v7 = [v3 stringByAppendingFormat:@",errorDesc:%@", v6];

    id v3 = (void *)v7;
  }
  id v8 = [(SUCoreScanParam *)self descriptor];
  if (v8)
  {

LABEL_6:
    uint64_t v10 = [(SUCoreScanParam *)self descriptor];
    id v11 = [v10 summary];
    uint64_t v12 = [(SUCoreScanParam *)self fallbackDescriptor];
    id v13 = [v12 summary];
    uint64_t v14 = [v3 stringByAppendingFormat:@",descriptor:%@,fallbackDescriptor:%@", v11, v13];

    id v3 = (void *)v14;
    goto LABEL_7;
  }
  v9 = [(SUCoreScanParam *)self fallbackDescriptor];

  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  id v15 = [(SUCoreScanParam *)self majorPrimaryDescriptor];
  if (v15
    || ([(SUCoreScanParam *)self majorSecondaryDescriptor],
        (id v15 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(SUCoreScanParam *)self minorPrimaryDescriptor],
        (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_11:
    uint64_t v16 = [(SUCoreScanParam *)self majorPrimaryDescriptor];
    v17 = [v16 summary];
    uint64_t v18 = [(SUCoreScanParam *)self majorSecondaryDescriptor];
    v19 = [v18 summary];
    uint64_t v20 = [(SUCoreScanParam *)self minorPrimaryDescriptor];
    v21 = [v20 summary];
    uint64_t v22 = [(SUCoreScanParam *)self minorSecondaryDescriptor];
    id v23 = [v22 summary];
    uint64_t v24 = [v3 stringByAppendingFormat:@",majorPrimaryDescriptor:%@,majorSecondaryDescriptor:%@,minorPrimaryDescriptor:%@,minorSecondaryDescriptor:%@", v17, v19, v21, v23];

    id v3 = (void *)v24;
    goto LABEL_12;
  }
  v26 = [(SUCoreScanParam *)self minorSecondaryDescriptor];

  if (v26) {
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (SUCoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUCoreDescriptor)fallbackDescriptor
{
  return self->_fallbackDescriptor;
}

- (void)setFallbackDescriptor:(id)a3
{
}

- (SUCoreDescriptor)majorPrimaryDescriptor
{
  return self->_majorPrimaryDescriptor;
}

- (void)setMajorPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)majorSecondaryDescriptor
{
  return self->_majorSecondaryDescriptor;
}

- (void)setMajorSecondaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)minorPrimaryDescriptor
{
  return self->_minorPrimaryDescriptor;
}

- (void)setMinorPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)minorSecondaryDescriptor
{
  return self->_minorSecondaryDescriptor;
}

- (void)setMinorSecondaryDescriptor:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSMutableDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_minorSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_minorPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_majorSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_majorPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_fallbackDescriptor, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end