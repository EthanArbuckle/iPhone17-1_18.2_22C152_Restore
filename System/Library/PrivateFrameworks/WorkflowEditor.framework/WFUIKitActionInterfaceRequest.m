@interface WFUIKitActionInterfaceRequest
+ (BOOL)supportsSecureCoding;
- (CGSize)presentationSize;
- (NSString)actionClassName;
- (NSString)userInterfaceClassName;
- (WFUIKitActionInterfaceRequest)initWithActionClassName:(id)a3 userInterfaceClassName:(id)a4 presentationSize:(CGSize)a5;
- (WFUIKitActionInterfaceRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFUIKitActionInterfaceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceClassName, 0);
  objc_storeStrong((id *)&self->_actionClassName, 0);
}

- (CGSize)presentationSize
{
  double width = self->_presentationSize.width;
  double height = self->_presentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)userInterfaceClassName
{
  return self->_userInterfaceClassName;
}

- (NSString)actionClassName
{
  return self->_actionClassName;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFUIKitActionInterfaceRequest *)self actionClassName];
  [v4 encodeObject:v5 forKey:@"actionClassName"];

  v6 = [(WFUIKitActionInterfaceRequest *)self userInterfaceClassName];
  [v4 encodeObject:v6 forKey:@"userInterfaceClassName"];

  [MEMORY[0x263F08D40] value:&self->_presentationSize withObjCType:"{CGSize=dd}"];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"presentationSize"];
}

- (WFUIKitActionInterfaceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionClassName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInterfaceClassName"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentationSize"];

  objc_msgSend(v7, "wf_CGSizeValue");
  double v9 = v8;
  double v11 = v10;

  if (v5) {
    BOOL v12 = v6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || (v9 == *MEMORY[0x263F001B0] ? (BOOL v13 = v11 == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v13 = 0), v13))
  {
    v14 = 0;
  }
  else
  {
    self = -[WFUIKitActionInterfaceRequest initWithActionClassName:userInterfaceClassName:presentationSize:](self, "initWithActionClassName:userInterfaceClassName:presentationSize:", v5, v6, v9, v11);
    v14 = self;
  }

  return v14;
}

- (WFUIKitActionInterfaceRequest)initWithActionClassName:(id)a3 userInterfaceClassName:(id)a4 presentationSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFUIKitActionInterfaceRequest.m", 17, @"Invalid parameter not satisfying: %@", @"actionClassName" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFUIKitActionInterfaceRequest.m", 18, @"Invalid parameter not satisfying: %@", @"userInterfaceClassName" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)WFUIKitActionInterfaceRequest;
  BOOL v13 = [(WFUIKitActionInterfaceRequest *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    actionClassName = v13->_actionClassName;
    v13->_actionClassName = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    userInterfaceClassName = v13->_userInterfaceClassName;
    v13->_userInterfaceClassName = (NSString *)v16;

    v13->_presentationSize.CGFloat width = width;
    v13->_presentationSize.CGFloat height = height;
    v18 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end