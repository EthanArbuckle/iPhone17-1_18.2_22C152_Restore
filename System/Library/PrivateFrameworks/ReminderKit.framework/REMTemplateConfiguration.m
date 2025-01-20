@interface REMTemplateConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSaveCompleted;
- (REMObjectID)sourceListID;
- (REMTemplateConfiguration)initWithCoder:(id)a3;
- (REMTemplateConfiguration)initWithSourceListID:(id)a3 shouldSaveCompleted:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTemplateConfiguration

- (REMTemplateConfiguration)initWithSourceListID:(id)a3 shouldSaveCompleted:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMTemplateConfiguration;
  v8 = [(REMTemplateConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceListID, a3);
    v9->_shouldSaveCompleted = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = REMDynamicCast(v5, (uint64_t)v4);

    id v7 = [(REMTemplateConfiguration *)self sourceListID];
    uint64_t v8 = [v6 sourceListID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(REMTemplateConfiguration *)self sourceListID];
      objc_super v11 = [v6 sourceListID];
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        LOBYTE(v13) = 0;
LABEL_8:

        return v13;
      }
    }
    BOOL v14 = [(REMTemplateConfiguration *)self shouldSaveCompleted];
    int v13 = v14 ^ [v6 shouldSaveCompleted] ^ 1;
    goto LABEL_8;
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMTemplateConfiguration alloc];
  uint64_t v5 = [(REMTemplateConfiguration *)self sourceListID];
  v6 = [(REMTemplateConfiguration *)v4 initWithSourceListID:v5 shouldSaveCompleted:[(REMTemplateConfiguration *)self shouldSaveCompleted]];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(REMTemplateConfiguration *)self sourceListID];
  [v5 encodeObject:v4 forKey:@"sourceListID"];

  objc_msgSend(v5, "encodeBool:forKey:", -[REMTemplateConfiguration shouldSaveCompleted](self, "shouldSaveCompleted"), @"shouldSaveCompleted");
}

- (REMTemplateConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateConfiguration;
  id v5 = [(REMTemplateConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceListID"];
    sourceListID = v5->_sourceListID;
    v5->_sourceListID = (REMObjectID *)v6;

    v5->_shouldSaveCompleted = [v4 decodeBoolForKey:@"shouldSaveCompleted"];
  }

  return v5;
}

- (REMObjectID)sourceListID
{
  return self->_sourceListID;
}

- (BOOL)shouldSaveCompleted
{
  return self->_shouldSaveCompleted;
}

- (void).cxx_destruct
{
}

@end