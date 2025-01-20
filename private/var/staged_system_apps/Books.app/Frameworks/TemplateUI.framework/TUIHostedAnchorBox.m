@interface TUIHostedAnchorBox
- (Class)layoutClass;
- (TUIHostingIdentifier)hostingIdentifier;
- (TUIHostingProperties)hostingProperties;
- (void)setHostingIdentifier:(id)a3;
- (void)setHostingProperties:(id)a3;
@end

@implementation TUIHostedAnchorBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (void)setHostingIdentifier:(id)a3
{
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);

  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end