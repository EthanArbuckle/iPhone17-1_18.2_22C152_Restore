@interface PPFeedbackItem
+ (BOOL)supportsSecureCoding;
+ (id)stringForItemFeedbackType:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPPFeedbackItem:(id)a3;
- (NSString)itemString;
- (PPFeedbackItem)initWithCoder:(id)a3;
- (PPFeedbackItem)initWithItemString:(id)a3 itemFeedbackType:(unsigned int)a4;
- (id)description;
- (unint64_t)hash;
- (unsigned)itemFeedbackType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPFeedbackItem

- (void).cxx_destruct
{
}

- (unsigned)itemFeedbackType
{
  return self->_itemFeedbackType;
}

- (NSString)itemString
{
  return self->_itemString;
}

- (BOOL)isEqualToPPFeedbackItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  itemString = self->_itemString;
  v7 = (NSString *)*((id *)v4 + 2);
  if (itemString == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = itemString;
  char v10 = [(NSString *)v9 isEqual:v8];

  if (v10)
  {
LABEL_6:
    BOOL v11 = self->_itemFeedbackType == v5[2];
    goto LABEL_7;
  }
LABEL_4:
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPFeedbackItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPFeedbackItem *)self isEqualToPPFeedbackItem:v5];

  return v6;
}

- (id)description
{
  v3 = objc_opt_new();
  itemString = self->_itemString;
  v5 = [(id)objc_opt_class() stringForItemFeedbackType:self->_itemFeedbackType];
  [v3 appendFormat:@"{%@:%@}", itemString, v5];

  BOOL v6 = (void *)[v3 copy];
  return v6;
}

- (PPFeedbackItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemString"];
  int v6 = [v4 containsValueForKey:@"itemFeedbackType"];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[PPFeedbackItem initWithItemString:itemFeedbackType:](self, "initWithItemString:itemFeedbackType:", v5, [v4 decodeInt32ForKey:@"itemFeedbackType"]);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  itemString = self->_itemString;
  id v5 = a3;
  [v5 encodeObject:itemString forKey:@"itemString"];
  [v5 encodeInt32:self->_itemFeedbackType forKey:@"itemFeedbackType"];
}

- (unint64_t)hash
{
  uint64_t itemFeedbackType = self->_itemFeedbackType;
  return [(NSString *)self->_itemString hash] - itemFeedbackType + 32 * itemFeedbackType;
}

- (PPFeedbackItem)initWithItemString:(id)a3 itemFeedbackType:(unsigned int)a4
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPFeedbackItem;
  v9 = [(PPFeedbackItem *)&v13 init];
  if (v9)
  {
    if (v8)
    {
      if (a4)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_itemString, a3);
        v9->_uint64_t itemFeedbackType = a4;
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"PPFeedbackItem.m", 26, @"Invalid parameter not satisfying: %@", @"itemString" object file lineNumber description];

      if (a4) {
        goto LABEL_4;
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, v9, @"PPFeedbackItem.m", 27, @"Invalid parameter not satisfying: %@", @"itemFeedbackType" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForItemFeedbackType:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 < 6) {
    return off_1E550F718[a3];
  }
  int v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    BOOL v11 = NSStringFromSelector(a2);
    uint64_t v7 = a3;
    *(_DWORD *)buf = 138412546;
    objc_super v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    _os_log_error_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_ERROR, "%@ called with invalid PPItemFeedbackType value of %lu", buf, 0x16u);
  }
  else
  {
    uint64_t v7 = a3;
  }

  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  char v10 = NSStringFromSelector(a2);
  [v8 raise:v9, @"%@ called with invalid PPItemFeedbackType value of %lu", v10, v7 format];

  return @"invalid";
}

@end