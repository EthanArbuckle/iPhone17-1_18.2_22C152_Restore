@interface MAAsset
- (BOOL)_es_isCompatibleWithThisDevice;
- (BOOL)_es_isDownloading;
- (BOOL)_es_isInstalled;
- (id)_es_contentVersion;
- (id)_es_description;
- (id)_es_language;
- (id)_es_masteredVersion;
- (id)_es_path;
- (id)_es_quasarDir;
- (id)_es_quasarModelPath;
- (int64_t)_es_compareByVersion:(id)a3;
- (int64_t)_es_requiredCapabilityIdentifier;
- (int64_t)_es_status;
@end

@implementation MAAsset

- (int64_t)_es_requiredCapabilityIdentifier
{
  id v2 = objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"RequiredCapabilityIdentifier");
  return (int64_t)_[v2 integerValue];
}

- (BOOL)_es_isCompatibleWithThisDevice
{
  uint64_t v3 = [(MAAsset *)self _es_requiredCapabilityIdentifier];
  if (v3 > AFDeviceHighestLanguageModelCapabilityIdentifier()) {
    return 0;
  }
  objc_msgSend(+[_EARSpeechRecognizer minimumSupportedConfigurationVersion](_EARSpeechRecognizer, "minimumSupportedConfigurationVersion"), "floatValue");
  float v6 = v5;
  objc_msgSend(+[_EARSpeechRecognizer maximumSupportedConfigurationVersion](_EARSpeechRecognizer, "maximumSupportedConfigurationVersion"), "floatValue");
  float v8 = v7;
  objc_msgSend(objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"FormatVersion"), "floatValue");
  return v9 <= v8 && v9 >= v6;
}

- (id)_es_description
{
  id v3 = [(MAAsset *)self _es_contentVersion];
  id v4 = [(MAAsset *)self _es_masteredVersion];
  unsigned int v5 = [(MAAsset *)self _es_isInstalled];
  id v6 = [(MAAsset *)self _es_language];
  if ([(MAAsset *)self _es_isInstalled]) {
    CFStringRef v7 = [(MAAsset *)self _es_path];
  }
  else {
    CFStringRef v7 = &stru_1000F4FA8;
  }
  CFStringRef v8 = @"NO";
  if (v5) {
    CFStringRef v8 = @"YES";
  }
  return +[NSString stringWithFormat:@"Asset: content version: %@, mastered version %@, installed %@, language: %@, path: %@", v3, v4, v8, v6, v7];
}

- (id)_es_language
{
  id v2 = [(MAAsset *)self attributes];
  return [v2 objectForKey:@"Language"];
}

- (id)_es_masteredVersion
{
  id v2 = [(MAAsset *)self attributes];
  uint64_t v3 = ASAttributeMasteredVersion;
  return [v2 objectForKey:v3];
}

- (id)_es_contentVersion
{
  id v2 = [(MAAsset *)self attributes];
  id v3 = [v2 objectForKey:ASAttributeContentVersion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return @"0";
  }
  return _[v3 stringValue];
}

- (id)_es_path
{
  id result = [(MAAsset *)self getLocalUrl];
  if (result)
  {
    id v4 = [(MAAsset *)self getLocalUrl];
    return _[v4 path];
  }
  return result;
}

- (BOOL)_es_isInstalled
{
  return [(MAAsset *)self state] == (id)2 || [(MAAsset *)self state] == (id)3;
}

- (BOOL)_es_isDownloading
{
  return [(MAAsset *)self state] == (id)4;
}

- (int64_t)_es_status
{
  id v2 = (char *)[(MAAsset *)self state];
  if ((unint64_t)(v2 - 1) > 3) {
    return 2;
  }
  else {
    return qword_1000CB0C0[(void)(v2 - 1)];
  }
}

- (id)_es_quasarModelPath
{
  id v3 = [(MAAsset *)self _es_path];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"QuasarDir");
  if (!v5) {
    return 0;
  }
  return [v4 stringByAppendingPathComponent:v5];
}

- (id)_es_quasarDir
{
  id v2 = [(MAAsset *)self attributes];
  return [v2 objectForKey:@"QuasarDir"];
}

- (int64_t)_es_compareByVersion:(id)a3
{
  int64_t result = (int64_t)objc_msgSend(-[MAAsset _es_contentVersion](self, "_es_contentVersion"), "compare:options:", objc_msgSend(a3, "_es_contentVersion"), 64);
  if (!result)
  {
    id v6 = [(MAAsset *)self _es_masteredVersion];
    id v7 = objc_msgSend(a3, "_es_masteredVersion");
    if (v6 && v7)
    {
      int64_t result = (int64_t)[v6 compare:v7 options:64];
      if (result) {
        return result;
      }
    }
    else
    {
      if (v6 && !v7) {
        return 1;
      }
      if (!v6 && v7) {
        return -1;
      }
    }
    id v8 = [(MAAsset *)self _es_path];
    id v9 = objc_msgSend(a3, "_es_path");
    if (v8 && v9)
    {
      int64_t result = (int64_t)[v8 compare:v9];
      if (result) {
        return result;
      }
      return 0;
    }
    if (v8 && !v9) {
      return 1;
    }
    if (v8 || !v9) {
      return 0;
    }
    return -1;
  }
  return result;
}

@end