@interface SACFClientFlowScript
+ (id)clientFlowScript;
- (BOOL)shouldCacheScript;
- (BOOL)shouldSkipExecution;
- (NSData)compressedScript;
- (NSData)jsScriptChecksum;
- (NSString)fileContentType;
- (NSString)jsScript;
- (NSString)jsScriptIdentifier;
- (SACFScriptEncryptionParameters)encryptionParameters;
- (SACFScriptUrlInformation)urlInformation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCompressedScript:(id)a3;
- (void)setEncryptionParameters:(id)a3;
- (void)setFileContentType:(id)a3;
- (void)setJsScript:(id)a3;
- (void)setJsScriptChecksum:(id)a3;
- (void)setJsScriptIdentifier:(id)a3;
- (void)setShouldCacheScript:(BOOL)a3;
- (void)setShouldSkipExecution:(BOOL)a3;
- (void)setUrlInformation:(id)a3;
@end

@implementation SACFClientFlowScript

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ClientFlowScript";
}

+ (id)clientFlowScript
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)compressedScript
{
  return (NSData *)[(AceObject *)self propertyForKey:@"compressedScript"];
}

- (void)setCompressedScript:(id)a3
{
}

- (SACFScriptEncryptionParameters)encryptionParameters
{
  return (SACFScriptEncryptionParameters *)AceObjectAceObjectForProperty(self, @"encryptionParameters");
}

- (void)setEncryptionParameters:(id)a3
{
}

- (NSString)fileContentType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fileContentType"];
}

- (void)setFileContentType:(id)a3
{
}

- (NSString)jsScript
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsScript"];
}

- (void)setJsScript:(id)a3
{
}

- (NSData)jsScriptChecksum
{
  return (NSData *)[(AceObject *)self propertyForKey:@"jsScriptChecksum"];
}

- (void)setJsScriptChecksum:(id)a3
{
}

- (NSString)jsScriptIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsScriptIdentifier"];
}

- (void)setJsScriptIdentifier:(id)a3
{
}

- (BOOL)shouldCacheScript
{
  return AceObjectBoolForProperty(self, @"shouldCacheScript");
}

- (void)setShouldCacheScript:(BOOL)a3
{
}

- (BOOL)shouldSkipExecution
{
  return AceObjectBoolForProperty(self, @"shouldSkipExecution");
}

- (void)setShouldSkipExecution:(BOOL)a3
{
}

- (SACFScriptUrlInformation)urlInformation
{
  return (SACFScriptUrlInformation *)AceObjectAceObjectForProperty(self, @"urlInformation");
}

- (void)setUrlInformation:(id)a3
{
}

@end