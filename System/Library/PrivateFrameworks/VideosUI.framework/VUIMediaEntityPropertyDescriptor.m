@interface VUIMediaEntityPropertyDescriptor
+ (id)_classNameFromPropertyType:(unint64_t)a3;
- (BOOL)allowsDefaultValue;
- (BOOL)retrievesSourcePropertiesAtFetch;
- (BOOL)sourceSupportsFiltering;
- (NSSet)sourcePropertyNames;
- (NSString)name;
- (NSString)propertyValueClassName;
- (NSString)sortAsName;
- (VUIMediaEntityPropertyDescriptor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (id)description;
- (id)sourceFilterBlock;
- (id)sourceFilterValueBlock;
- (unint64_t)propertyType;
- (void)_updateSourceSupportsFiltering;
- (void)setAllowsDefaultValue:(BOOL)a3;
- (void)setDefaultValue:(id)a3;
- (void)setName:(id)a3;
- (void)setPropertyType:(unint64_t)a3;
- (void)setPropertyValueClassName:(id)a3;
- (void)setRetrievesSourcePropertiesAtFetch:(BOOL)a3;
- (void)setSortAsName:(id)a3;
- (void)setSourceFilterBlock:(id)a3;
- (void)setSourceFilterValueBlock:(id)a3;
- (void)setSourcePropertyNames:(id)a3;
- (void)setSourceSupportsFiltering:(BOOL)a3;
@end

@implementation VUIMediaEntityPropertyDescriptor

- (VUIMediaEntityPropertyDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaEntityPropertyDescriptor;
  v2 = [(VUIMediaEntityPropertyDescriptor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1F3E921E0;

    v3->_propertyType = 4;
    v3->_allowsDefaultValue = 0;
  }
  return v3;
}

- (NSString)propertyValueClassName
{
  propertyValueClassName = self->_propertyValueClassName;
  if (!propertyValueClassName)
  {
    objc_msgSend((id)objc_opt_class(), "_classNameFromPropertyType:", -[VUIMediaEntityPropertyDescriptor propertyType](self, "propertyType"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_propertyValueClassName;
    self->_propertyValueClassName = v4;

    propertyValueClassName = self->_propertyValueClassName;
  }
  return propertyValueClassName;
}

- (id)defaultValue
{
  if (!self->_defaultValue && [(VUIMediaEntityPropertyDescriptor *)self allowsDefaultValue])
  {
    switch([(VUIMediaEntityPropertyDescriptor *)self propertyType])
    {
      case 0uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E4F1CC28];
        goto LABEL_10;
      case 1uLL:
        v5 = [MEMORY[0x1E4F1C9B8] data];
        defaultValue = (NSString *)self->_defaultValue;
        self->_defaultValue = v5;
        goto LABEL_11;
      case 3uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)&unk_1F3F3D298;
        goto LABEL_10;
      case 4uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = &stru_1F3E921E0;
        goto LABEL_10;
      case 6uLL:
        defaultValue = [(VUIMediaEntityPropertyDescriptor *)self propertyValueClassName];
        id v8 = objc_alloc_init(NSClassFromString(defaultValue));
        id v9 = self->_defaultValue;
        self->_defaultValue = v8;

        goto LABEL_11;
      case 7uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E4F1CBF0];
        goto LABEL_10;
      case 8uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E4F1CC08];
LABEL_10:
        self->_defaultValue = v4;
LABEL_11:

        break;
      default:
        break;
    }
  }
  id v6 = self->_defaultValue;
  return v6;
}

- (NSSet)sourcePropertyNames
{
  sourcePropertyNames = self->_sourcePropertyNames;
  if (!sourcePropertyNames)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(VUIMediaEntityPropertyDescriptor *)self name];
    objc_msgSend(v4, "setWithObjects:", v5, 0);
    id v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sourcePropertyNames;
    self->_sourcePropertyNames = v6;

    sourcePropertyNames = self->_sourcePropertyNames;
  }
  return sourcePropertyNames;
}

- (void)setSourceSupportsFiltering:(BOOL)a3
{
  self->_sourceSupportsFiltering = a3;
  if (!a3)
  {
    id sourceFilterValueBlock = self->_sourceFilterValueBlock;
    self->_id sourceFilterValueBlock = 0;

    id sourceFilterBlock = self->_sourceFilterBlock;
    self->_id sourceFilterBlock = 0;
  }
}

- (void)setSourceFilterValueBlock:(id)a3
{
  v4 = (void *)[a3 copy];
  id sourceFilterValueBlock = self->_sourceFilterValueBlock;
  self->_id sourceFilterValueBlock = v4;

  [(VUIMediaEntityPropertyDescriptor *)self _updateSourceSupportsFiltering];
}

- (void)setSourceFilterBlock:(id)a3
{
  v4 = (void *)[a3 copy];
  id sourceFilterBlock = self->_sourceFilterBlock;
  self->_id sourceFilterBlock = v4;

  [(VUIMediaEntityPropertyDescriptor *)self _updateSourceSupportsFiltering];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIMediaEntityPropertyDescriptor);
  uint64_t v5 = [(NSString *)self->_name copy];
  name = v4->_name;
  v4->_name = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_sortAsName copy];
  sortAsName = v4->_sortAsName;
  v4->_sortAsName = (NSString *)v7;

  v4->_propertyType = self->_propertyType;
  uint64_t v9 = [(NSString *)self->_propertyValueClassName copy];
  propertyValueClassName = v4->_propertyValueClassName;
  v4->_propertyValueClassName = (NSString *)v9;

  v4->_allowsDefaultValue = self->_allowsDefaultValue;
  objc_storeStrong(&v4->_defaultValue, self->_defaultValue);
  uint64_t v11 = [(NSSet *)self->_sourcePropertyNames copy];
  sourcePropertyNames = v4->_sourcePropertyNames;
  v4->_sourcePropertyNames = (NSSet *)v11;

  v4->_retrievesSourcePropertiesAtFetch = self->_retrievesSourcePropertiesAtFetch;
  v4->_sourceSupportsFiltering = self->_sourceSupportsFiltering;
  uint64_t v13 = [self->_sourceFilterValueBlock copy];
  id sourceFilterValueBlock = v4->_sourceFilterValueBlock;
  v4->_id sourceFilterValueBlock = (id)v13;

  uint64_t v15 = [self->_sourceFilterBlock copy];
  id sourceFilterBlock = v4->_sourceFilterBlock;
  v4->_id sourceFilterBlock = (id)v15;

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v42.receiver = self;
  v42.super_class = (Class)VUIMediaEntityPropertyDescriptor;
  v4 = [(VUIMediaEntityPropertyDescriptor *)&v42 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = [(VUIMediaEntityPropertyDescriptor *)self name];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"name", v6];
  [v3 addObject:v7];

  id v8 = NSString;
  uint64_t v9 = [(VUIMediaEntityPropertyDescriptor *)self sortAsName];
  v10 = [v8 stringWithFormat:@"%@=%@", @"sortAsName", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntityPropertyDescriptor propertyType](self, "propertyType"));
  uint64_t v13 = [v11 stringWithFormat:@"%@=%@", @"propertyType", v12];
  [v3 addObject:v13];

  v14 = NSString;
  uint64_t v15 = [(VUIMediaEntityPropertyDescriptor *)self propertyValueClassName];
  v16 = [v14 stringWithFormat:@"%@=%@", @"propertyValueClassName", v15];
  [v3 addObject:v16];

  v17 = NSString;
  [(VUIMediaEntityPropertyDescriptor *)self allowsDefaultValue];
  v18 = VUIBoolLogString();
  v19 = [v17 stringWithFormat:@"%@=%@", @"allowsDefaultValue", v18];
  [v3 addObject:v19];

  v20 = NSString;
  v21 = [(VUIMediaEntityPropertyDescriptor *)self defaultValue];
  v22 = [v20 stringWithFormat:@"%@=%@", @"defaultValue", v21];
  [v3 addObject:v22];

  v23 = NSString;
  v24 = [(VUIMediaEntityPropertyDescriptor *)self sourcePropertyNames];
  v25 = [v23 stringWithFormat:@"%@=%@", @"sourcePropertyNames", v24];
  [v3 addObject:v25];

  v26 = NSString;
  [(VUIMediaEntityPropertyDescriptor *)self retrievesSourcePropertiesAtFetch];
  v27 = VUIBoolLogString();
  v28 = [v26 stringWithFormat:@"%@=%@", @"retrievesSourcePropertiesAtFetch", v27];
  [v3 addObject:v28];

  v29 = NSString;
  [(VUIMediaEntityPropertyDescriptor *)self sourceSupportsFiltering];
  v30 = VUIBoolLogString();
  v31 = [v29 stringWithFormat:@"%@=%@", @"sourceSupportsFiltering", v30];
  [v3 addObject:v31];

  v32 = NSString;
  v33 = [(VUIMediaEntityPropertyDescriptor *)self sourceFilterValueBlock];
  v34 = [v32 stringWithFormat:@"%@=%@", @"sourceFilterValueBlock", v33];
  [v3 addObject:v34];

  v35 = NSString;
  v36 = [(VUIMediaEntityPropertyDescriptor *)self sourceFilterBlock];
  v37 = [v35 stringWithFormat:@"%@=%@", @"sourceFilterBlock", v36];
  [v3 addObject:v37];

  v38 = NSString;
  v39 = [v3 componentsJoinedByString:@", "];
  v40 = [v38 stringWithFormat:@"<%@>", v39];

  return v40;
}

+ (id)_classNameFromPropertyType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
      uint64_t v5 = (objc_class *)objc_opt_class();
      goto LABEL_7;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Property value class names cannot be derived for object based attributes", v3);
      uint64_t v5 = 0;
LABEL_7:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return NSStringFromClass(v5);
}

- (void)_updateSourceSupportsFiltering
{
  if (![(VUIMediaEntityPropertyDescriptor *)self sourceSupportsFiltering])
  {
    uint64_t v3 = [(VUIMediaEntityPropertyDescriptor *)self sourceFilterValueBlock];
    if (v3)
    {
    }
    else
    {
      uint64_t v4 = [(VUIMediaEntityPropertyDescriptor *)self sourceFilterBlock];

      if (!v4) {
        return;
      }
    }
    [(VUIMediaEntityPropertyDescriptor *)self setSourceSupportsFiltering:1];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)sortAsName
{
  return self->_sortAsName;
}

- (void)setSortAsName:(id)a3
{
}

- (unint64_t)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyType:(unint64_t)a3
{
  self->_propertyType = a3;
}

- (void)setPropertyValueClassName:(id)a3
{
}

- (void)setDefaultValue:(id)a3
{
}

- (BOOL)allowsDefaultValue
{
  return self->_allowsDefaultValue;
}

- (void)setAllowsDefaultValue:(BOOL)a3
{
  self->_allowsDefaultValue = a3;
}

- (void)setSourcePropertyNames:(id)a3
{
}

- (BOOL)retrievesSourcePropertiesAtFetch
{
  return self->_retrievesSourcePropertiesAtFetch;
}

- (void)setRetrievesSourcePropertiesAtFetch:(BOOL)a3
{
  self->_retrievesSourcePropertiesAtFetch = a3;
}

- (BOOL)sourceSupportsFiltering
{
  return self->_sourceSupportsFiltering;
}

- (id)sourceFilterValueBlock
{
  return self->_sourceFilterValueBlock;
}

- (id)sourceFilterBlock
{
  return self->_sourceFilterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceFilterBlock, 0);
  objc_storeStrong(&self->_sourceFilterValueBlock, 0);
  objc_storeStrong((id *)&self->_sourcePropertyNames, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_propertyValueClassName, 0);
  objc_storeStrong((id *)&self->_sortAsName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end