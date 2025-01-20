@interface TLToneImportResponse
- (NSString)toneIdentifier;
- (TLToneImportResponse)initWithStatusCode:(int64_t)a3 toneIdentifier:(id)a4;
- (id)description;
- (int64_t)statusCode;
@end

@implementation TLToneImportResponse

- (TLToneImportResponse)initWithStatusCode:(int64_t)a3 toneIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLToneImportResponse;
  v7 = [(TLToneImportResponse *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_statusCode = a3;
    uint64_t v9 = [v6 copy];
    toneIdentifier = v8->_toneIdentifier;
    v8->_toneIdentifier = (NSString *)v9;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  unint64_t statusCode = self->_statusCode;
  if (statusCode > 2) {
    v8 = 0;
  }
  else {
    v8 = _TLToneImportStatusCodeHumanReadableDescriptions[statusCode];
  }
  [v6 appendFormat:@"; unint64_t statusCode = %@", v8];

  if (self->_toneIdentifier) {
    [v6 appendFormat:@"; toneIdentifier = \"%@\"", self->_toneIdentifier];
  }
  [v6 appendString:@">"];

  return v6;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void).cxx_destruct
{
}

@end