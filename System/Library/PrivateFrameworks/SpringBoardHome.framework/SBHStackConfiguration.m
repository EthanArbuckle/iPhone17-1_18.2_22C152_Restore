@interface SBHStackConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsExternalSuggestions;
- (BOOL)allowsSuggestions;
- (NSArray)dataSources;
- (NSString)sizeClass;
- (SBHStackConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsExternalSuggestions:(BOOL)a3;
- (void)setAllowsSuggestions:(BOOL)a3;
- (void)setDataSources:(id)a3;
- (void)setSizeClass:(id)a3;
@end

@implementation SBHStackConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBHStackConfiguration);
  [(SBHStackConfiguration *)v4 setAllowsSuggestions:[(SBHStackConfiguration *)self allowsSuggestions]];
  [(SBHStackConfiguration *)v4 setAllowsExternalSuggestions:[(SBHStackConfiguration *)self allowsExternalSuggestions]];
  v5 = [(SBHStackConfiguration *)self dataSources];
  [(SBHStackConfiguration *)v4 setDataSources:v5];

  v6 = [(SBHStackConfiguration *)self sizeClass];
  [(SBHStackConfiguration *)v4 setSizeClass:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBHStackConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHStackConfiguration;
  v5 = [(SBHStackConfiguration *)&v15 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v5->_allowsSuggestions = [v4 decodeBoolForKey:@"allowsSuggestions"];
    v5->_allowsExternalSuggestions = [v4 decodeBoolForKey:@"allowsExternalSuggestions"];
    uint64_t v9 = [v4 decodeArrayOfObjectsOfClasses:v8 forKey:@"dataSources"];
    dataSources = v5->_dataSources;
    v5->_dataSources = (NSArray *)v9;

    v11 = self;
    uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"sizeClass"];
    sizeClass = v5->_sizeClass;
    v5->_sizeClass = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SBHStackConfiguration allowsSuggestions](self, "allowsSuggestions"), @"allowsSuggestions");
  objc_msgSend(v4, "encodeBool:forKey:", -[SBHStackConfiguration allowsExternalSuggestions](self, "allowsExternalSuggestions"), @"allowsExternalSuggestions");
  v5 = [(SBHStackConfiguration *)self dataSources];
  [v4 encodeObject:v5 forKey:@"dataSources"];

  id v6 = [(SBHStackConfiguration *)self sizeClass];
  [v4 encodeObject:v6 forKey:@"sizeClass"];
}

- (BOOL)allowsSuggestions
{
  return self->_allowsSuggestions;
}

- (void)setAllowsSuggestions:(BOOL)a3
{
  self->_allowsSuggestions = a3;
}

- (BOOL)allowsExternalSuggestions
{
  return self->_allowsExternalSuggestions;
}

- (void)setAllowsExternalSuggestions:(BOOL)a3
{
  self->_allowsExternalSuggestions = a3;
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setSizeClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end