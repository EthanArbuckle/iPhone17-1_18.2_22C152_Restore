@interface TPSWidgetContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAssets;
- (NSDictionary)attributes;
- (TPSWidgetContent)initWithCoder:(id)a3;
- (TPSWidgetContent)initWithDictionary:(id)a3 metadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)titleContent;
- (int64_t)compare:(id)a3;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setHasAssets:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation TPSWidgetContent

- (id)titleContent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)TPSWidgetContent;
  v2 = [(TPSContent *)&v15 titleContent];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    id v9 = 0;
    goto LABEL_15;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          char v7 = 0;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);

    if ((v7 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v9 = v3;
LABEL_15:

  return v9;
}

- (TPSWidgetContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSWidgetContent;
  char v7 = [(TPSContent *)&v12 initWithDictionary:v6 metadata:a4];
  if (v7
    && ([v6 TPSSafeDictionaryForKey:@"attrs"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        attributes = v7->_attributes,
        v7->_attributes = (NSDictionary *)v8,
        attributes,
        ![(TPSWidgetContent *)v7 hasAssets]))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)hasAssets
{
  v2 = [(TPSContent *)self assets];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSWidgetContent;
  id v4 = a3;
  [(TPSContent *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(TPSWidgetContent *)self attributes];
  [v4 encodeObject:v5 forKey:@"attrs"];

  objc_msgSend(v4, "encodeInteger:forKey:", (int)-[TPSWidgetContent priority](self, "priority"), @"priority");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSWidgetContent;
  id v4 = [(TPSContent *)&v7 copyWithZone:a3];
  uint64_t v5 = [(TPSWidgetContent *)self attributes];
  [v4 setAttributes:v5];

  objc_msgSend(v4, "setPriority:", -[TPSWidgetContent priority](self, "priority"));
  return v4;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setAttributes:(id)a3
{
}

- (TPSWidgetContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSWidgetContent;
  uint64_t v5 = [(TPSContent *)&v15 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    long long v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"attrs"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v12;

    v5->_priority = [v4 decodeIntegerForKey:@"priority"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 priority];
  if (v5 <= [(TPSWidgetContent *)self priority])
  {
    uint64_t v7 = [v4 priority];
    int64_t v6 = v7 != [(TPSWidgetContent *)self priority];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)TPSWidgetContent;
  id v4 = [(TPSContent *)&v8 debugDescription];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"WIDGET PRIORITY: %ld", -[TPSWidgetContent priority](self, "priority"));
  int64_t v6 = [(TPSWidgetContent *)self attributes];
  [v5 appendFormat:@"\n  %@ = %@\n", @"attrs", v6];

  return v5;
}

- (void)setHasAssets:(BOOL)a3
{
  self->_hasAssets = a3;
}

@end