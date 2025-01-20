@interface PKApplicationMessageAction
+ (BOOL)supportsSecureCoding;
+ (void)_createForType:(uint64_t)a1;
- (PKApplicationMessageAction)init;
- (PKApplicationMessageAction)initWithCoder:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageAction

+ (void)_createForType:(uint64_t)a1
{
  self;
  v3 = [PKApplicationMessageActionURL alloc];
  v4 = v3;
  if (v3)
  {
    v8.receiver = v3;
    v8.super_class = (Class)PKApplicationMessageAction;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    v6 = v5;
    if (v5) {
      v5[1] = a2;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKApplicationMessageAction)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageAction)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5 <= 1 && (unint64_t v6 = v5, objc_opt_class()) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKApplicationMessageAction;
      v7 = [(PKApplicationMessageAction *)&v11 init];
      if (v7) {
        v7->_type = v6;
      }
    }
    else
    {
      v7 = 0;
    }
    self = v7;
    objc_super v8 = self;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageAction" code:0 userInfo:0];
    [v4 failWithError:v9];

    objc_super v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

@end