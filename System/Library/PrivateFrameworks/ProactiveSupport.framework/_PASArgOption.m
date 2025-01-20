@interface _PASArgOption
+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6;
+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7;
+ (id)optionWithName:(id)a3 shortName:(id)a4 help:(id)a5;
- (BOOL)required;
- (NSString)argMetavar;
- (NSString)helpDescription;
- (NSString)name;
- (NSString)shortName;
- (_PASArgOption)initWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7;
- (id)description;
@end

@implementation _PASArgOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argMetavar, 0);
  objc_storeStrong((id *)&self->_helpDescription, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)required
{
  return self->_required;
}

- (NSString)argMetavar
{
  return self->_argMetavar;
}

- (NSString)helpDescription
{
  return self->_helpDescription;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"_PASArgOption name:%@ shortName:%@ help:%@ argMetavar:%@", self->_name, self->_shortName, self->_helpDescription, self->_argMetavar];
}

- (_PASArgOption)initWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if ([v13 length])
  {
    if (!v14) {
      goto LABEL_5;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_PASArgParser.m", 62, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];

    if (!v14) {
      goto LABEL_5;
    }
  }
  if ([v14 length] != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_PASArgParser.m", 63, @"Invalid parameter not satisfying: %@", @"!shortName || shortName.length == 1" object file lineNumber description];
  }
LABEL_5:
  if (!v16)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_PASArgParser.m", 64, @"Invalid parameter not satisfying: %@", @"helpDescription" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)_PASArgOption;
  v17 = [(_PASArgOption *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortName, a4);
    objc_storeStrong((id *)&v18->_argMetavar, a5);
    objc_storeStrong((id *)&v18->_helpDescription, a6);
    v18->_required = a7;
  }

  return v18;
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithName:v15 shortName:v14 argMetavar:v13 help:v12 required:v7];

  return v16;
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6
{
  return (id)[a1 optionWithName:a3 shortName:a4 argMetavar:a5 help:a6 required:0];
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 help:(id)a5
{
  return (id)[a1 optionWithName:a3 shortName:a4 argMetavar:0 help:a5];
}

@end