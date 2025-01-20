@interface PKContactPickerItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isValueAccepted:(id)a3;
- (NSArray)alternativeAcceptedValues;
- (NSString)displayName;
- (NSString)submissionValue;
- (PKContactPickerItem)initWithCoder:(id)a3;
- (PKContactPickerItem)initWithDictionary:(id)a3;
- (id)acceptedValues;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKContactPickerItem

- (PKContactPickerItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKContactPickerItem;
  v5 = [(PKContactPickerItem *)&v14 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 PKStringForKey:@"displayName"];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"submissionValue"];
  submissionValue = v5->_submissionValue;
  v5->_submissionValue = (NSString *)v8;

  uint64_t v10 = [v4 PKArrayForKey:@"alternativeAcceptedValues"];
  alternativeAcceptedValues = v5->_alternativeAcceptedValues;
  v5->_alternativeAcceptedValues = (NSArray *)v10;

  if (!v5->_displayName) {
    goto LABEL_5;
  }
  if (v5->_submissionValue) {
LABEL_4:
  }
    v12 = v5;
  else {
LABEL_5:
  }
    v12 = 0;

  return v12;
}

- (id)acceptedValues
{
  acceptedValues = self->_acceptedValues;
  if (!acceptedValues)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v4 addObject:self->_submissionValue];
    [v4 addObject:self->_displayName];
    [v4 addObjectsFromArray:self->_alternativeAcceptedValues];
    v5 = (NSMutableSet *)[v4 copy];
    uint64_t v6 = self->_acceptedValues;
    self->_acceptedValues = v5;

    acceptedValues = self->_acceptedValues;
  }
  return acceptedValues;
}

- (BOOL)isValueAccepted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PKContactPickerItem *)self acceptedValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) caseInsensitiveCompare:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: '%@'; ", @"displayName", self->_displayName];
  [v3 appendFormat:@"%@: '%@'; ", @"submissionValue", self->_submissionValue];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"alternativeAcceptedValues",
    self->_alternativeAcceptedValues);
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"displayName"];
  [v5 encodeObject:self->_submissionValue forKey:@"submissionValue"];
  [v5 encodeObject:self->_alternativeAcceptedValues forKey:@"alternativeAcceptedValues"];
}

- (PKContactPickerItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKContactPickerItem;
  id v5 = [(PKContactPickerItem *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submissionValue"];
    submissionValue = v5->_submissionValue;
    v5->_submissionValue = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    long long v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"alternativeAcceptedValues"];
    alternativeAcceptedValues = v5->_alternativeAcceptedValues;
    v5->_alternativeAcceptedValues = (NSArray *)v13;
  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (NSArray)alternativeAcceptedValues
{
  return self->_alternativeAcceptedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeAcceptedValues, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_acceptedValues, 0);
}

@end