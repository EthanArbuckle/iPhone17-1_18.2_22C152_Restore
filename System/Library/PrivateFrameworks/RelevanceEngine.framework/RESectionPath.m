@interface RESectionPath
+ (RESectionPath)sectionPathWithSectionName:(id)a3 element:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)sectionName;
- (RESectionPath)init;
- (RESectionPath)initWithSectionName:(id)a3 element:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)element;
- (unint64_t)hash;
- (void)setElement:(unint64_t)a3;
@end

@implementation RESectionPath

+ (RESectionPath)sectionPathWithSectionName:(id)a3 element:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[RESectionPath alloc] initWithSectionName:v5 element:a4];

  return v6;
}

- (RESectionPath)init
{
  return [(RESectionPath *)self initWithSectionName:0 element:0];
}

- (RESectionPath)initWithSectionName:(id)a3 element:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RESectionPath;
  v7 = [(RESectionPath *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sectionName = v7->_sectionName;
    v7->_sectionName = (NSString *)v8;

    v7->_element = a4;
  }

  return v7;
}

- (NSString)sectionName
{
  v2 = (void *)[(NSString *)self->_sectionName copy];
  return (NSString *)v2;
}

- (unint64_t)element
{
  return self->_element;
}

- (unint64_t)hash
{
  return self->_element ^ [(NSString *)self->_sectionName hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RESectionPath *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = v5;
      if (self->_element == v5->_element)
      {
        sectionName = self->_sectionName;
        uint64_t v8 = v5->_sectionName;
        v9 = sectionName;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSString *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RESectionPath;
  v4 = [(RESectionPath *)&v8 description];
  id v5 = REStringForSectionPath(self);
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[RESectionPath allocWithZone:a3];
  sectionName = self->_sectionName;
  unint64_t element = self->_element;
  return [(RESectionPath *)v4 initWithSectionName:sectionName element:element];
}

- (void)setElement:(unint64_t)a3
{
  self->_unint64_t element = a3;
}

- (void).cxx_destruct
{
}

@end