@interface TULabeledHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledHandle:(id)a3;
- (BOOL)isSuggested;
- (NSString)label;
- (TUHandle)handle;
- (TULabeledHandle)init;
- (TULabeledHandle)initWithCoder:(id)a3;
- (TULabeledHandle)initWithHandle:(id)a3 label:(id)a4 isSuggested:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TULabeledHandle

- (TULabeledHandle)initWithHandle:(id)a3 label:(id)a4 isSuggested:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TULabeledHandle;
  v11 = [(TULabeledHandle *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handle, a3);
    uint64_t v13 = [v10 copy];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    v12->_isSuggested = a5;
  }

  return v12;
}

- (TULabeledHandle)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TULabeledHandle.m", 27, @"%s is not available. Use a designated initializer instead.", "-[TULabeledHandle init]");

  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TULabeledHandle *)self handle];
  v6 = [(TULabeledHandle *)self label];
  v7 = [v3 stringWithFormat:@"<%@ %p handle=%@ label=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TULabeledHandle *)self isEqualToLabeledHandle:v4];

  return v5;
}

- (BOOL)isEqualToLabeledHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TULabeledHandle *)self handle];
  v6 = [v4 handle];
  if ([v5 isEqualToHandle:v6])
  {
    v7 = [(TULabeledHandle *)self label];
    v8 = [v4 label];
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      BOOL v9 = [(TULabeledHandle *)self isSuggested];
      int v10 = v9 ^ [v4 isSuggested] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(TULabeledHandle *)self handle];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TULabeledHandle *)self label];
  uint64_t v6 = [v5 hash] ^ v4;
  BOOL v7 = [(TULabeledHandle *)self isSuggested];
  uint64_t v8 = 1237;
  if (v7) {
    uint64_t v8 = 1231;
  }
  unint64_t v9 = v6 ^ v8;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TULabeledHandle *)self handle];
  uint64_t v6 = [(TULabeledHandle *)self label];
  BOOL v7 = objc_msgSend(v4, "initWithHandle:label:isSuggested:", v5, v6, -[TULabeledHandle isSuggested](self, "isSuggested"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TULabeledHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_handle);
  BOOL v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  unint64_t v9 = NSStringFromSelector(sel_label);
  int v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = NSStringFromSelector(sel_isSuggested);
  uint64_t v12 = [v4 decodeBoolForKey:v11];

  uint64_t v13 = [(TULabeledHandle *)self initWithHandle:v7 label:v10 isSuggested:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TULabeledHandle *)self handle];
  uint64_t v6 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(TULabeledHandle *)self label];
  uint64_t v8 = NSStringFromSelector(sel_label);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(TULabeledHandle *)self isSuggested];
  NSStringFromSelector(sel_isSuggested);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v9 forKey:v10];
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isSuggested
{
  return self->_isSuggested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end