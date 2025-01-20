@interface _UIViewServiceControllerOperatorCreateResult
+ (BOOL)supportsSecureCoding;
- (BSMachPortSendRight)accessibilityServerPort;
- (NSArray)supportedInterfaceOrientations;
- (_UIHostedWindowHostingHandle)serviceWindowHostingHandle;
- (_UIViewServiceControllerOperatorCreateResult)initWithCoder:(id)a3;
- (int)preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityServerPort:(id)a3;
- (void)setPreferredStatusBarStyle:(int64_t)a3;
- (void)setPreferredStatusBarVisibility:(int)a3;
- (void)setServiceWindowHostingHandle:(id)a3;
- (void)setSupportedInterfaceOrientations:(id)a3;
@end

@implementation _UIViewServiceControllerOperatorCreateResult

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(_UIViewServiceControllerOperatorCreateResult *)self serviceWindowHostingHandle];

  if (v4)
  {
    v5 = [(_UIViewServiceControllerOperatorCreateResult *)self serviceWindowHostingHandle];
    [v10 encodeObject:v5 forKey:@"serviceWindowHostingHandle"];
  }
  v6 = [(_UIViewServiceControllerOperatorCreateResult *)self supportedInterfaceOrientations];

  if (v6)
  {
    v7 = [(_UIViewServiceControllerOperatorCreateResult *)self supportedInterfaceOrientations];
    [v10 encodeObject:v7 forKey:@"supportedInterfaceOrientations"];
  }
  objc_msgSend(v10, "encodeInteger:forKey:", -[_UIViewServiceControllerOperatorCreateResult preferredStatusBarStyle](self, "preferredStatusBarStyle"), @"preferredStatusBarStyle");
  objc_msgSend(v10, "encodeInteger:forKey:", -[_UIViewServiceControllerOperatorCreateResult preferredStatusBarVisibility](self, "preferredStatusBarVisibility"), @"preferredStatusBarVisibility");
  v8 = [(_UIViewServiceControllerOperatorCreateResult *)self accessibilityServerPort];

  if (v8)
  {
    v9 = [(_UIViewServiceControllerOperatorCreateResult *)self accessibilityServerPort];
    [v10 encodeObject:v9 forKey:@"accessibilityServerPort"];
  }
}

- (_UIViewServiceControllerOperatorCreateResult)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewServiceControllerOperatorCreateResult;
  v5 = [(_UIViewServiceControllerOperatorCreateResult *)&v17 init];
  if (v5)
  {
    v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"serviceWindowHostingHandle"];
    [(_UIViewServiceControllerOperatorCreateResult *)v5 setServiceWindowHostingHandle:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = self;
    v18[0] = v9;
    id v10 = self;
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v12 = [v8 setWithArray:v11];
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedInterfaceOrientations"];
    [(_UIViewServiceControllerOperatorCreateResult *)v5 setSupportedInterfaceOrientations:v13];

    -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarStyle:](v5, "setPreferredStatusBarStyle:", [v4 decodeIntegerForKey:@"preferredStatusBarStyle"]);
    -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarVisibility:](v5, "setPreferredStatusBarVisibility:", [v4 decodeIntegerForKey:@"preferredStatusBarVisibility"]);
    v14 = self;
    v15 = [v4 decodeObjectOfClass:v14 forKey:@"accessibilityServerPort"];
    [(_UIViewServiceControllerOperatorCreateResult *)v5 setAccessibilityServerPort:v15];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHostedWindowHostingHandle)serviceWindowHostingHandle
{
  return self->_serviceWindowHostingHandle;
}

- (void)setServiceWindowHostingHandle:(id)a3
{
}

- (NSArray)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(id)a3
{
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

- (int)preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (void)setPreferredStatusBarVisibility:(int)a3
{
  self->_preferredStatusBarVisibility = a3;
}

- (BSMachPortSendRight)accessibilityServerPort
{
  return self->_accessibilityServerPort;
}

- (void)setAccessibilityServerPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityServerPort, 0);
  objc_storeStrong((id *)&self->_supportedInterfaceOrientations, 0);
  objc_storeStrong((id *)&self->_serviceWindowHostingHandle, 0);
}

@end