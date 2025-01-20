@interface REElementUpdateOperation
+ (id)insertElement:(id)a3 atPath:(id)a4;
+ (id)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5;
+ (id)refreshElement:(id)a3 atPath:(id)a4;
+ (id)reloadElement:(id)a3 atPath:(id)a4;
+ (id)removeElement:(id)a3 atPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (REElement)element;
- (REElementUpdateOperation)initWithElement:(id)a3 path:(id)a4 newPath:(id)a5 updateType:(unint64_t)a6;
- (RESectionPath)movedToPath;
- (RESectionPath)path;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation REElementUpdateOperation

- (REElementUpdateOperation)initWithElement:(id)a3 path:(id)a4 newPath:(id)a5 updateType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REElementUpdateOperation;
  v14 = [(REElementUpdateOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_element, a3);
    objc_storeStrong((id *)&v15->_path, a4);
    objc_storeStrong((id *)&v15->_movedToPath, a5);
    v15->_type = a6;
  }

  return v15;
}

+ (id)reloadElement:(id)a3 atPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 path:v5 newPath:0 updateType:0];

  return v7;
}

+ (id)insertElement:(id)a3 atPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 path:v5 newPath:0 updateType:2];

  return v7;
}

+ (id)removeElement:(id)a3 atPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 path:v5 newPath:0 updateType:1];

  return v7;
}

+ (id)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v9 path:v8 newPath:v7 updateType:3];

  return v10;
}

+ (id)refreshElement:(id)a3 atPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 path:v5 newPath:0 updateType:4];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(REElement *)self->_element hash];
  unint64_t v4 = [(RESectionPath *)self->_path hash] ^ v3;
  return v4 ^ [(RESectionPath *)self->_movedToPath hash] ^ self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(REElement *)self->_element isEqual:v5[1]]
      && [(RESectionPath *)self->_path isEqual:v5[2]]
      && [(RESectionPath *)self->_movedToPath isEqual:v5[3]]
      && self->_type == v5[4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  switch(self->_type)
  {
    case 0uLL:
      unint64_t v3 = NSString;
      id v4 = [(REElementUpdateOperation *)self path];
      id v5 = REStringForSectionPath(v4);
      [v3 stringWithFormat:@" Reload: %@", v5];
      goto LABEL_8;
    case 1uLL:
      id v7 = NSString;
      id v4 = [(REElementUpdateOperation *)self path];
      id v5 = REStringForSectionPath(v4);
      [v7 stringWithFormat:@" Remove: %@", v5];
      goto LABEL_8;
    case 2uLL:
      id v8 = NSString;
      id v4 = [(REElementUpdateOperation *)self path];
      id v5 = REStringForSectionPath(v4);
      [v8 stringWithFormat:@" Insert: %@", v5];
      goto LABEL_8;
    case 3uLL:
      id v9 = NSString;
      id v4 = [(REElementUpdateOperation *)self path];
      id v5 = REStringForSectionPath(v4);
      v10 = [(REElementUpdateOperation *)self movedToPath];
      id v11 = REStringForSectionPath(v10);
      BOOL v6 = [v9 stringWithFormat:@" Move: %@ → %@", v5, v11];

      goto LABEL_9;
    case 4uLL:
      id v12 = NSString;
      id v4 = [(REElementUpdateOperation *)self path];
      id v5 = REStringForSectionPath(v4);
      [v12 stringWithFormat:@" Refresh: %@", v5];
LABEL_8:
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      break;
    default:
      BOOL v6 = &stru_26CFA57D0;
      break;
  }
  v16.receiver = self;
  v16.super_class = (Class)REElementUpdateOperation;
  id v13 = [(REElementUpdateOperation *)&v16 description];
  v14 = [v13 stringByAppendingString:v6];

  return v14;
}

- (REElement)element
{
  return self->_element;
}

- (RESectionPath)path
{
  return self->_path;
}

- (RESectionPath)movedToPath
{
  return self->_movedToPath;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedToPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end