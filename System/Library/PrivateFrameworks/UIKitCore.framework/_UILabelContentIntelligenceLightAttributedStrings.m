@interface _UILabelContentIntelligenceLightAttributedStrings
- (NSAttributedString)lightInertAttributedString;
- (NSAttributedString)lightReactiveAttributedString;
- (void)setLightInertAttributedString:(id)a3;
- (void)setLightReactiveAttributedString:(id)a3;
@end

@implementation _UILabelContentIntelligenceLightAttributedStrings

- (NSAttributedString)lightReactiveAttributedString
{
  return self->_lightReactiveAttributedString;
}

- (void)setLightReactiveAttributedString:(id)a3
{
}

- (NSAttributedString)lightInertAttributedString
{
  return self->_lightInertAttributedString;
}

- (void)setLightInertAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightInertAttributedString, 0);
  objc_storeStrong((id *)&self->_lightReactiveAttributedString, 0);
}

@end