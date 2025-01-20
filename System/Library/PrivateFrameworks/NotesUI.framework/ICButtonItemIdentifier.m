@interface ICButtonItemIdentifier
- (BOOL)isEqual:(id)a3;
- (ICButtonItemIdentifier)initWithType:(int64_t)a3 parentIdentifier:(id)a4;
- (ICItemIdentifier)parentIdentifier;
- (NSString)description;
- (NSString)displayText;
- (NSString)systemImageName;
- (int64_t)style;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation ICButtonItemIdentifier

- (ICButtonItemIdentifier)initWithType:(int64_t)a3 parentIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICButtonItemIdentifier;
  v8 = [(ICButtonItemIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_parentIdentifier, a4);
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICButtonItemIdentifier type](self, "type"));
  id v7 = [(ICButtonItemIdentifier *)self parentIdentifier];
  v8 = [(ICButtonItemIdentifier *)self displayText];
  v9 = [v3 stringWithFormat:@"<%@: %p, type: %@, parentIdentifier: %@, displayText: %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  if (v5 && (int64_t v6 = -[ICButtonItemIdentifier type](self, "type"), v6 == [v5 type]))
  {
    id v7 = [(ICButtonItemIdentifier *)self parentIdentifier];
    v8 = [v5 parentIdentifier];
    v9 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v7) {
      v10 = 0;
    }
    else {
      v10 = v7;
    }
    unint64_t v11 = v10;
    if (v9 == v8) {
      v12 = 0;
    }
    else {
      v12 = v8;
    }
    unint64_t v13 = v12;
    v14 = (void *)v13;
    if (v11 | v13)
    {
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        char v16 = 0;
      }
      else {
        char v16 = [(id)v11 isEqual:v13];
      }
    }
    else
    {
      char v16 = 1;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    uint64_t v4 = [(ICButtonItemIdentifier *)self type];
    v5 = [(ICButtonItemIdentifier *)self parentIdentifier];
    char v6 = [v5 hash];
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (NSString)displayText
{
  int64_t v2 = [(ICButtonItemIdentifier *)self type];
  if (v2 == 1)
  {
    v3 = [MEMORY[0x1E4F83380] localizedTitleForDefaultFolder];
  }
  else if (v2)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICButtonItemIdentifier displayText]" simulateCrash:1 showAlert:0 format:@"Unknown button type"];
    v3 = &stru_1F0973378;
  }
  else
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Folder" value:@"New Folder" table:0 allowSiri:1];
  }
  return (NSString *)v3;
}

- (NSString)systemImageName
{
  int64_t v2 = [(ICButtonItemIdentifier *)self type];
  if (!v2) {
    return (NSString *)@"folder.badge.plus";
  }
  if (v2 == 1) {
    return (NSString *)@"folder";
  }
  [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICButtonItemIdentifier systemImageName]" simulateCrash:1 showAlert:0 format:@"Unknown button type"];
  return (NSString *)&stru_1F0973378;
}

- (int64_t)style
{
  int64_t v2 = [(ICButtonItemIdentifier *)self type];
  if (!v2) {
    return 1;
  }
  if (v2 != 1) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICButtonItemIdentifier style]" simulateCrash:1 showAlert:0 format:@"Unknown button type"];
  }
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (ICItemIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void).cxx_destruct
{
}

@end