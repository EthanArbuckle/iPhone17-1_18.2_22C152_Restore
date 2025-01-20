@interface PGGraphContactNode
+ (id)filter;
+ (id)filterWithContactIdentifiers:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (NSDate)birthdayDate;
- (NSDate)potentialBirthdayDate;
- (NSString)contactIdentifier;
- (NSString)name;
- (PGGraphContactNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphContactNode)initWithName:(id)a3 contactIdentifier:(id)a4 birthdayDate:(id)a5 potentialBirthdayDate:(id)a6;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
- (void)setLocalProperties:(id)a3;
@end

@implementation PGGraphContactNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)potentialBirthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)birthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)domain
{
  return 303;
}

- (id)label
{
  v2 = @"Contact";
  return @"Contact";
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphContactNode;
  v4 = [(PGGraphOptimizedNode *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ (%@)", v4, self->_contactIdentifier];

  return v5;
}

- (id)propertyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_contactIdentifier forKeyedSubscript:@"cnid"];
  birthdayDate = self->_birthdayDate;
  if (birthdayDate)
  {
    v5 = NSNumber;
    [(NSDate *)birthdayDate timeIntervalSince1970];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"bday"];
  }
  potentialBirthdayDate = self->_potentialBirthdayDate;
  if (potentialBirthdayDate)
  {
    v8 = NSNumber;
    [(NSDate *)potentialBirthdayDate timeIntervalSince1970];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"pbday"];
  }
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    objc_super v7 = v6;
    if (v6 && ![v6 isEqual:self->_name]) {
      goto LABEL_11;
    }

    v8 = [v5 objectForKeyedSubscript:@"cnid"];
    objc_super v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_contactIdentifier]) {
        goto LABEL_11;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"bday"];
    objc_super v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      double v11 = v10;
      [(NSDate *)self->_birthdayDate timeIntervalSince1970];
      if (v11 != v12) {
        goto LABEL_11;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"pbday"];
    objc_super v7 = v13;
    if (!v13
      || ([v13 doubleValue],
          double v15 = v14,
          [(NSDate *)self->_potentialBirthdayDate timeIntervalSince1970],
          v15 == v16))
    {
      BOOL v17 = 1;
    }
    else
    {
LABEL_11:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)setLocalProperties:(id)a3
{
  id v16 = a3;
  id v4 = [v16 objectForKeyedSubscript:@"name"];
  name = self->_name;
  self->_name = v4;

  v6 = [v16 objectForKeyedSubscript:@"cnid"];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v6;

  v8 = [v16 objectForKeyedSubscript:@"bday"];
  v9 = v8;
  if (v8)
  {
    double v10 = (void *)MEMORY[0x1E4F1C9C8];
    [v8 doubleValue];
    double v11 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    double v11 = 0;
  }
  objc_storeStrong((id *)&self->_birthdayDate, v11);
  if (v9) {

  }
  double v12 = [v16 objectForKeyedSubscript:@"pbday"];
  v13 = v12;
  if (v12)
  {
    double v14 = (void *)MEMORY[0x1E4F1C9C8];
    [v12 doubleValue];
    double v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    double v15 = 0;
  }
  objc_storeStrong((id *)&self->_potentialBirthdayDate, v15);
  if (v13) {
}
  }

- (PGGraphContactNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  objc_super v7 = [v6 objectForKeyedSubscript:@"name"];
  v8 = [v6 objectForKeyedSubscript:@"cnid"];
  v9 = [v6 objectForKeyedSubscript:@"bday"];
  double v10 = v9;
  if (v9)
  {
    double v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v9 doubleValue];
    double v12 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    double v12 = 0;
  }
  v13 = [v6 objectForKeyedSubscript:@"pbday"];
  double v14 = v13;
  if (v13)
  {
    double v15 = (void *)MEMORY[0x1E4F1C9C8];
    [v13 doubleValue];
    id v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v16 = 0;
  }
  BOOL v17 = [(PGGraphContactNode *)self initWithName:v7 contactIdentifier:v8 birthdayDate:v12 potentialBirthdayDate:v16];

  return v17;
}

- (PGGraphContactNode)initWithName:(id)a3 contactIdentifier:(id)a4 birthdayDate:(id)a5 potentialBirthdayDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphContactNode;
  double v15 = [(PGGraphNode *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_contactIdentifier, a4);
    objc_storeStrong((id *)&v16->_birthdayDate, a5);
    objc_storeStrong((id *)&v16->_potentialBirthdayDate, a6);
  }

  return v16;
}

+ (id)filterWithContactIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 filter];
  v9 = @"cnid";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  objc_super v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Contact" domain:303];
  return v2;
}

@end