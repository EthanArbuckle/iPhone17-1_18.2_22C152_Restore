@interface WFContextualActionCalendarEventDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)eventIdentifier;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (WFContextualActionCalendarEventDescriptor)initWithCoder:(id)a3;
- (WFContextualActionCalendarEventDescriptor)initWithEventIdentifier:(id)a3 uniqueIdentifier:(id)a4 title:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionCalendarEventDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  eventIdentifier = self->_eventIdentifier;
  id v5 = a3;
  [v5 encodeObject:eventIdentifier forKey:@"eventIdentifier"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

- (WFContextualActionCalendarEventDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = [(WFContextualActionCalendarEventDescriptor *)self initWithEventIdentifier:v5 uniqueIdentifier:v6 title:v7];
    v10 = self;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContextualActionCalendarEventDescriptor *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v7 = [(WFContextualActionCalendarEventDescriptor *)v6 eventIdentifier];
    BOOL v8 = [(WFContextualActionCalendarEventDescriptor *)self eventIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(WFContextualActionCalendarEventDescriptor *)v6 uniqueIdentifier];
    v17 = [(WFContextualActionCalendarEventDescriptor *)self uniqueIdentifier];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqualToString:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(WFContextualActionCalendarEventDescriptor *)v6 title];
    v22 = [(WFContextualActionCalendarEventDescriptor *)self title];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqualToString:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFContextualActionCalendarEventDescriptor *)self eventIdentifier];
  id v5 = (id)[v3 combineContentsOfPropertyListObject:v4];

  v6 = [(WFContextualActionCalendarEventDescriptor *)self uniqueIdentifier];
  id v7 = (id)[v3 combineContentsOfPropertyListObject:v6];

  BOOL v8 = [(WFContextualActionCalendarEventDescriptor *)self title];
  id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];

  unint64_t v10 = [v3 finalize];
  return v10;
}

- (WFContextualActionCalendarEventDescriptor)initWithEventIdentifier:(id)a3 uniqueIdentifier:(id)a4 title:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFContextualActionCalendarEventDescriptor.m", 18, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFContextualActionCalendarEventDescriptor.m", 17, @"Invalid parameter not satisfying: %@", @"eventIdentifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFContextualActionCalendarEventDescriptor.m", 19, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)WFContextualActionCalendarEventDescriptor;
  int v12 = [(WFContextualActionCalendarEventDescriptor *)&v24 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    eventIdentifier = v12->_eventIdentifier;
    v12->_eventIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    title = v12->_title;
    v12->_title = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end