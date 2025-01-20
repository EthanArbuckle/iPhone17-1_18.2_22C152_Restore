@interface WFWorkflowCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFolder;
- (NSString)name;
- (WFWorkflowCollection)initWithCoder:(id)a3;
- (WFWorkflowCollection)initWithIdentifier:(id)a3 isFolder:(BOOL)a4 name:(id)a5 glyphCharacter:(unsigned __int16)a6 isDeleted:(BOOL)a7;
- (unint64_t)hash;
- (unsigned)glyphCharacter;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowCollection

- (NSString)name
{
  return self->_name;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (WFWorkflowCollection)initWithIdentifier:(id)a3 isFolder:(BOOL)a4 name:(id)a5 glyphCharacter:(unsigned __int16)a6 isDeleted:(BOOL)a7
{
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowCollection;
  v13 = [(WFDatabaseObjectDescriptor *)&v18 initWithIdentifier:a3 objectType:2];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_glyphCharacter = a6;
    v13->_folder = a4;
    v13->_deleted = a7;
    v16 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (BOOL)isFolder
{
  return self->_folder;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowCollection;
  id v4 = a3;
  [(WFDatabaseObjectDescriptor *)&v7 encodeWithCoder:v4];
  v5 = [(WFWorkflowCollection *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[WFWorkflowCollection glyphCharacter](self, "glyphCharacter"));
  [v4 encodeObject:v6 forKey:@"glyphCharacter"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowCollection isFolder](self, "isFolder"), @"folder");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowCollection isDeleted](self, "isDeleted"), @"deleted");
}

- (WFWorkflowCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowCollection;
  v5 = [(WFDatabaseObjectDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"glyphCharacter"];
    v5->_glyphCharacter = [v8 unsignedLongValue];

    v5->_folder = [v4 decodeBoolForKey:@"folder"];
    v5->_deleted = [v4 decodeBoolForKey:@"deleted"];
    v9 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFWorkflowCollection *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(WFDatabaseObjectDescriptor *)v5 identifier];
      objc_super v7 = [(WFDatabaseObjectDescriptor *)self identifier];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(WFWorkflowCollection *)v5 name];
        v9 = [(WFWorkflowCollection *)self name];
        if ([v8 isEqualToString:v9])
        {
          int v10 = [(WFWorkflowCollection *)v5 glyphCharacter];
          BOOL v11 = v10 == [(WFWorkflowCollection *)self glyphCharacter];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(WFWorkflowCollection *)self name];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(WFWorkflowCollection *)self glyphCharacter];
  uint64_t v6 = [(WFWorkflowCollection *)self isFolder];
  unint64_t v7 = v5 ^ v6 ^ [(WFWorkflowCollection *)self isDeleted];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end