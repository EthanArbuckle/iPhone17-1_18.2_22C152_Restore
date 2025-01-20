@interface TUBusinessCallerItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCallerItem:(id)a3;
- (NSString)department;
- (NSString)description;
- (NSString)name;
- (NSURL)logoURL;
- (TUBusinessCallerItem)initWithName:(id)a3 department:(id)a4 logoURL:(id)a5;
- (unint64_t)hash;
@end

@implementation TUBusinessCallerItem

- (TUBusinessCallerItem)initWithName:(id)a3 department:(id)a4 logoURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUBusinessCallerItem;
  v12 = [(TUBusinessCallerItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_department, a4);
    if (v11) {
      v14 = (NSURL *)v11;
    }
    else {
      v14 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/stock"];
    }
    logoURL = v13->_logoURL;
    v13->_logoURL = v14;

    objc_storeStrong((id *)&v13->_name, a3);
  }

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUBusinessCallerItem *)self name];
  v6 = [(TUBusinessCallerItem *)self department];
  v7 = [(TUBusinessCallerItem *)self logoURL];
  v8 = [v3 stringWithFormat:@"<%@: name=%@, department=%@, logoURL=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUBusinessCallerItem *)self isEqualToCallerItem:v4];

  return v5;
}

- (BOOL)isEqualToCallerItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUBusinessCallerItem *)self logoURL];
  v6 = [v4 logoURL];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    v7 = [(TUBusinessCallerItem *)self name];
    v8 = [v4 name];
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      id v9 = [(TUBusinessCallerItem *)self department];
      id v10 = [v4 department];
      char v11 = TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);
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

  return v11;
}

- (unint64_t)hash
{
  v3 = [(TUBusinessCallerItem *)self name];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUBusinessCallerItem *)self department];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TUBusinessCallerItem *)self logoURL];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSString)department
{
  return self->_department;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);

  objc_storeStrong((id *)&self->_department, 0);
}

@end