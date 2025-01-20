@interface WFShowActionInterfaceDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isCatalystInterfaceRequest;
- (NSDictionary)classNamesByType;
- (NSString)actionClassName;
- (NSString)catalystInterfaceClassName;
- (WFShowActionInterfaceDialogRequest)initWithActionClassName:(id)a3 classNamesByType:(id)a4 attribution:(id)a5;
- (WFShowActionInterfaceDialogRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShowActionInterfaceDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNamesByType, 0);
  objc_storeStrong((id *)&self->_actionClassName, 0);
}

- (NSDictionary)classNamesByType
{
  return self->_classNamesByType;
}

- (NSString)actionClassName
{
  return self->_actionClassName;
}

- (NSString)catalystInterfaceClassName
{
  if ([(WFShowActionInterfaceDialogRequest *)self isCatalystInterfaceRequest])
  {
    v3 = [(NSDictionary *)self->_classNamesByType objectForKey:*MEMORY[0x1E4F5AC00]];
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isCatalystInterfaceRequest
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFShowActionInterfaceDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v7 encodeWithCoder:v4];
  v5 = [(WFShowActionInterfaceDialogRequest *)self actionClassName];
  [v4 encodeObject:v5 forKey:@"actionClassName"];

  v6 = [(WFShowActionInterfaceDialogRequest *)self classNamesByType];
  [v4 encodeObject:v6 forKey:@"classNamesByType"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFShowActionInterfaceDialogRequest *)self actionClassName];
  objc_super v7 = [(WFShowActionInterfaceDialogRequest *)self classNamesByType];
  v8 = [v3 stringWithFormat:@"<%@: %p, actionClassName: %@, classNamesByType: %@>", v5, self, v6, v7];

  return v8;
}

- (WFShowActionInterfaceDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFShowActionInterfaceDialogRequest;
  v5 = [(WFDialogRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionClassName"];
    actionClassName = v5->_actionClassName;
    v5->_actionClassName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"classNamesByType"];
    classNamesByType = v5->_classNamesByType;
    v5->_classNamesByType = (NSDictionary *)v11;

    v13 = v5;
  }

  return v5;
}

- (WFShowActionInterfaceDialogRequest)initWithActionClassName:(id)a3 classNamesByType:(id)a4 attribution:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFShowActionInterfaceDialogRequest;
  v10 = [(WFDialogRequest *)&v17 initWithAttribution:a5 prompt:0];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    actionClassName = v10->_actionClassName;
    v10->_actionClassName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    classNamesByType = v10->_classNamesByType;
    v10->_classNamesByType = (NSDictionary *)v13;

    objc_super v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end