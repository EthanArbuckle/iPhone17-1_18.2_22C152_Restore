@interface SAUISnippetDisplayConfigurationResponse
- (BOOL)accessibilityDifferentiateWithoutColor;
- (BOOL)accessibilityInvertColors;
- (BOOL)accessibilityReduceMotion;
- (BOOL)accessibilityReduceTransparency;
- (BOOL)requiresResponse;
- (NSString)displayColorScheme;
- (NSString)displayContrast;
- (NSString)displayGamut;
- (NSString)dynamicTypeSize;
- (NSString)textDirection;
- (NSString)textLegibilityWeight;
- (SAUISize)estimatedVisibleSnippetDisplaySize;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccessibilityDifferentiateWithoutColor:(BOOL)a3;
- (void)setAccessibilityInvertColors:(BOOL)a3;
- (void)setAccessibilityReduceMotion:(BOOL)a3;
- (void)setAccessibilityReduceTransparency:(BOOL)a3;
- (void)setDisplayColorScheme:(id)a3;
- (void)setDisplayContrast:(id)a3;
- (void)setDisplayGamut:(id)a3;
- (void)setDynamicTypeSize:(id)a3;
- (void)setEstimatedVisibleSnippetDisplaySize:(id)a3;
- (void)setTextDirection:(id)a3;
- (void)setTextLegibilityWeight:(id)a3;
@end

@implementation SAUISnippetDisplayConfigurationResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SnippetDisplayConfigurationResponse";
}

- (BOOL)accessibilityDifferentiateWithoutColor
{
  return AceObjectBoolForProperty(self, @"accessibilityDifferentiateWithoutColor");
}

- (void)setAccessibilityDifferentiateWithoutColor:(BOOL)a3
{
}

- (BOOL)accessibilityInvertColors
{
  return AceObjectBoolForProperty(self, @"accessibilityInvertColors");
}

- (void)setAccessibilityInvertColors:(BOOL)a3
{
}

- (BOOL)accessibilityReduceMotion
{
  return AceObjectBoolForProperty(self, @"accessibilityReduceMotion");
}

- (void)setAccessibilityReduceMotion:(BOOL)a3
{
}

- (BOOL)accessibilityReduceTransparency
{
  return AceObjectBoolForProperty(self, @"accessibilityReduceTransparency");
}

- (void)setAccessibilityReduceTransparency:(BOOL)a3
{
}

- (NSString)displayColorScheme
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayColorScheme"];
}

- (void)setDisplayColorScheme:(id)a3
{
}

- (NSString)displayContrast
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayContrast"];
}

- (void)setDisplayContrast:(id)a3
{
}

- (NSString)displayGamut
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayGamut"];
}

- (void)setDisplayGamut:(id)a3
{
}

- (NSString)dynamicTypeSize
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dynamicTypeSize"];
}

- (void)setDynamicTypeSize:(id)a3
{
}

- (SAUISize)estimatedVisibleSnippetDisplaySize
{
  return (SAUISize *)AceObjectAceObjectForProperty(self, @"estimatedVisibleSnippetDisplaySize");
}

- (void)setEstimatedVisibleSnippetDisplaySize:(id)a3
{
}

- (NSString)textDirection
{
  return (NSString *)[(AceObject *)self propertyForKey:@"textDirection"];
}

- (void)setTextDirection:(id)a3
{
}

- (NSString)textLegibilityWeight
{
  return (NSString *)[(AceObject *)self propertyForKey:@"textLegibilityWeight"];
}

- (void)setTextLegibilityWeight:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end