@interface WFAppShortcutNamedQueryInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)symbolName;
- (WFAppShortcutNamedQueryInfo)initWithCoder:(id)a3;
- (WFAppShortcutNamedQueryInfo)initWithName:(id)a3 symbolName:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppShortcutNamedQueryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(WFAppShortcutNamedQueryInfo *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(WFAppShortcutNamedQueryInfo *)self symbolName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFAppShortcutNamedQueryInfo *)a3;
  if (v4 != self)
  {
    v5 = [(WFAppShortcutNamedQueryInfo *)self name];
    unint64_t v6 = [(WFAppShortcutNamedQueryInfo *)v4 name];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      LOBYTE(v10) = 0;
      v11 = v8;
      id v12 = v7;
      if (!v7 || !v8)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      int v10 = [v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_16;
      }
    }
    v13 = [(WFAppShortcutNamedQueryInfo *)self symbolName];
    v14 = [(WFAppShortcutNamedQueryInfo *)v4 symbolName];
    id v12 = v13;
    id v15 = v14;
    v11 = v15;
    if (v12 == v15)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      if (v12 && v15) {
        LOBYTE(v10) = [v12 isEqualToString:v15];
      }
    }

    goto LABEL_15;
  }
  LOBYTE(v10) = 1;
LABEL_17:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFAppShortcutNamedQueryInfo *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(WFAppShortcutNamedQueryInfo *)self symbolName];
  [v4 encodeObject:v6 forKey:@"symbolName"];
}

- (WFAppShortcutNamedQueryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"name"];

  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"symbolName"];

  v9 = [(WFAppShortcutNamedQueryInfo *)self initWithName:v6 symbolName:v8];
  return v9;
}

- (WFAppShortcutNamedQueryInfo)initWithName:(id)a3 symbolName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAppShortcutNamedQueryInfo;
  id v8 = [(WFAppShortcutNamedQueryInfo *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    symbolName = v8->_symbolName;
    v8->_symbolName = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end