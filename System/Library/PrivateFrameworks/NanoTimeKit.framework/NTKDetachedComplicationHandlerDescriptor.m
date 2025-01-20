@interface NTKDetachedComplicationHandlerDescriptor
- (CDTemplateComplicationDisplay)display;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NTKComplication)complication;
- (int64_t)family;
- (void)setBundleIdentifier:(id)a3;
- (void)setComplication:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setFamily:(int64_t)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation NTKDetachedComplicationHandlerDescriptor

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (void)setComplication:(id)a3
{
}

- (CDTemplateComplicationDisplay)display
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_display);
  return (CDTemplateComplicationDisplay *)WeakRetained;
}

- (void)setDisplay:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_display);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end