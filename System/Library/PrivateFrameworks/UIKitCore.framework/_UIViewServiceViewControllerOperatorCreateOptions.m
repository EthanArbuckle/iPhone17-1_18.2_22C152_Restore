@interface _UIViewServiceViewControllerOperatorCreateOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)hostCanDynamicallySpecifySupportedInterfaceOrientations;
- (BSMachPortSendRight)hostAccessibilityServerPort;
- (NSArray)displayConfigurations;
- (NSString)viewControllerClassName;
- (NSUUID)contextToken;
- (UITraitCollection)traitCollection;
- (_UIViewServiceViewControllerOperatorCreateOptions)initWithCoder:(id)a3;
- (int64_t)availableTextServices;
- (int64_t)initialInterfaceOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableTextServices:(int64_t)a3;
- (void)setContextToken:(id)a3;
- (void)setDisplayConfigurations:(id)a3;
- (void)setHostAccessibilityServerPort:(id)a3;
- (void)setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setTraitCollection:(id)a3;
- (void)setViewControllerClassName:(id)a3;
@end

@implementation _UIViewServiceViewControllerOperatorCreateOptions

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self viewControllerClassName];

  if (v4)
  {
    v5 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self viewControllerClassName];
    [v14 encodeObject:v5 forKey:@"viewControllerClassName"];
  }
  v6 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self contextToken];

  if (v6)
  {
    v7 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self contextToken];
    [v14 encodeObject:v7 forKey:@"contextToken"];
  }
  v8 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self displayConfigurations];

  if (v8)
  {
    v9 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self displayConfigurations];
    [v14 encodeObject:v9 forKey:@"displayConfigurations"];
  }
  v10 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self traitCollection];

  if (v10)
  {
    v11 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self traitCollection];
    [v14 encodeObject:v11 forKey:@"traitCollection"];
  }
  v12 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self hostAccessibilityServerPort];

  if (v12)
  {
    v13 = [(_UIViewServiceViewControllerOperatorCreateOptions *)self hostAccessibilityServerPort];
    [v14 encodeObject:v13 forKey:@"hostAccessibilityServerPort"];
  }
  objc_msgSend(v14, "encodeInteger:forKey:", -[_UIViewServiceViewControllerOperatorCreateOptions availableTextServices](self, "availableTextServices"), @"availableTextServices");
  objc_msgSend(v14, "encodeInteger:forKey:", -[_UIViewServiceViewControllerOperatorCreateOptions initialInterfaceOrientation](self, "initialInterfaceOrientation"), @"initialInterfaceOrientation");
}

- (_UIViewServiceViewControllerOperatorCreateOptions)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIViewServiceViewControllerOperatorCreateOptions;
  v5 = [(_UIViewServiceViewControllerOperatorCreateOptions *)&v21 init];
  if (v5)
  {
    v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"viewControllerClassName"];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v5 setViewControllerClassName:v7];

    v8 = self;
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"contextToken"];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v5 setContextToken:v9];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = self;
    v22[0] = v11;
    v12 = self;
    v22[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    id v14 = [v10 setWithArray:v13];
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"displayConfigurations"];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v5 setDisplayConfigurations:v15];

    v16 = self;
    v17 = [v4 decodeObjectOfClass:v16 forKey:@"traitCollection"];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v5 setTraitCollection:v17];

    v18 = self;
    v19 = [v4 decodeObjectOfClass:v18 forKey:@"hostAccessibilityServerPort"];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v5 setHostAccessibilityServerPort:v19];

    -[_UIViewServiceViewControllerOperatorCreateOptions setAvailableTextServices:](v5, "setAvailableTextServices:", [v4 decodeIntegerForKey:@"availableTextServices"]);
    -[_UIViewServiceViewControllerOperatorCreateOptions setInitialInterfaceOrientation:](v5, "setInitialInterfaceOrientation:", [v4 decodeIntegerForKey:@"initialInterfaceOrientation"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSUUID)contextToken
{
  return self->_contextToken;
}

- (void)setContextToken:(id)a3
{
}

- (NSArray)displayConfigurations
{
  return self->_displayConfigurations;
}

- (void)setDisplayConfigurations:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (BSMachPortSendRight)hostAccessibilityServerPort
{
  return self->_hostAccessibilityServerPort;
}

- (void)setHostAccessibilityServerPort:(id)a3
{
}

- (int64_t)availableTextServices
{
  return self->_availableTextServices;
}

- (void)setAvailableTextServices:(int64_t)a3
{
  self->_availableTextServices = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (BOOL)hostCanDynamicallySpecifySupportedInterfaceOrientations
{
  return self->_hostCanDynamicallySpecifySupportedInterfaceOrientations;
}

- (void)setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3
{
  self->_hostCanDynamicallySpecifySupportedInterfaceOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAccessibilityServerPort, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfigurations, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
}

@end