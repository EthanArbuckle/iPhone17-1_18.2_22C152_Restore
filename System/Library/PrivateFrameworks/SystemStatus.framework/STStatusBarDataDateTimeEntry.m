@interface STStatusBarDataDateTimeEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_entryForDateValue:(id)a3 mode:(int64_t)a4;
+ (id)entryForDateWithDateValue:(id)a3;
+ (id)entryForShortTimeWithDateValue:(id)a3;
+ (id)entryForTimeWithDateValue:(id)a3;
- (NSDate)dateValue;
- (STStatusBarDataDateTimeEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataDateTimeEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataDateTimeEntry

+ (id)_entryForDateValue:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      uint64_t v7 = +[STStatusBarData shortTimeFormatter];
      goto LABEL_7;
    case 1:
      uint64_t v7 = +[STStatusBarData timeFormatter];
      goto LABEL_7;
    case 0:
      uint64_t v7 = +[STStatusBarData dateFormatter];
LABEL_7:
      v8 = (void *)v7;
      goto LABEL_9;
  }
  v8 = 0;
LABEL_9:
  v9 = [v8 stringFromDate:v6];
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STStatusBarDataDateTimeEntry;
  v10 = objc_msgSendSuper2(&v14, sel_entryWithStringValue_, v9);

  uint64_t v11 = [v6 copy];
  v12 = (void *)v10[4];
  v10[4] = v11;

  v10[3] = a4;

  return v10;
}

+ (id)entryForTimeWithDateValue:(id)a3
{
  return (id)[a1 _entryForDateValue:a3 mode:1];
}

+ (id)entryForShortTimeWithDateValue:(id)a3
{
  return (id)[a1 _entryForDateValue:a3 mode:2];
}

+ (id)entryForDateWithDateValue:(id)a3
{
  return (id)[a1 _entryForDateValue:a3 mode:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v4 = a3;
  [(STStatusBarDataStringEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateValue, @"dateValue", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_mode forKey:@"mode"];
}

- (STStatusBarDataDateTimeEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataStringEntry *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"dateValue", v8.receiver, v8.super_class);

  dateValue = v4->_dateValue;
  v4->_dateValue = (NSDate *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v3 = [(STStatusBarDataStringEntry *)&v7 succinctDescriptionBuilder];
  id v4 = [(STStatusBarDataDateTimeEntry *)self dateValue];
  id v5 = (id)[v3 appendObject:v4 withName:@"dateValue"];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v5 = [(STStatusBarDataStringEntry *)&v18 _equalsBuilderWithObject:v4];
  id v6 = v4;
  objc_super v7 = [(STStatusBarDataDateTimeEntry *)self dateValue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke;
  v16[3] = &unk_1E6B63430;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v16];

  int64_t mode = self->_mode;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke_2;
  v14[3] = &unk_1E6B63D88;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendInteger:mode counterpart:v14];

  return v5;
}

uint64_t __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dateValue];
}

uint64_t __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

- (id)_hashBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v3 = [(STStatusBarDataStringEntry *)&v8 _hashBuilder];
  id v4 = [(STStatusBarDataDateTimeEntry *)self dateValue];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)[v3 appendInteger:self->_mode];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v4 = a3;
  [(STStatusBarDataStringEntry *)&v6 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateValue, @"dateValue", v6.receiver, v6.super_class);
  id v5 = [NSNumber numberWithInteger:self->_mode];
  [v4 encodeObject:v5 forKey:@"modeValue"];
}

- (STStatusBarDataDateTimeEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStatusBarDataDateTimeEntry;
  id v5 = [(STStatusBarDataStringEntry *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateValue"];
    dateValue = v5->_dateValue;
    v5->_dateValue = (NSDate *)v6;

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeValue"];
    v5->_int64_t mode = [v8 integerValue];
  }
  return v5;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
}

@end