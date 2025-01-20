@interface TUIMicaPlayerBox
- (BOOL)shouldStartAtEnd;
- (Class)layoutClass;
- (NSString)gravity;
- (NSString)resourceKind;
- (NSString)textKey;
- (NSString)textValue;
- (NSString)triggerName;
- (NSString)urlString;
- (NSURL)baseURL;
- (TUIFontSpec)fontSpec;
- (double)opacity;
- (double)triggerDelay;
- (unint64_t)targetTriggerState;
- (void)setBaseURL:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setGravity:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setResourceKind:(id)a3;
- (void)setShouldStartAtEnd:(BOOL)a3;
- (void)setTargetTriggerState:(unint64_t)a3;
- (void)setTextKey:(id)a3;
- (void)setTextValue:(id)a3;
- (void)setTriggerDelay:(double)a3;
- (void)setTriggerName:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation TUIMicaPlayerBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
}

- (NSString)textKey
{
  return self->_textKey;
}

- (void)setTextKey:(id)a3
{
}

- (NSString)textValue
{
  return self->_textValue;
}

- (void)setTextValue:(id)a3
{
}

- (BOOL)shouldStartAtEnd
{
  return self->_shouldStartAtEnd;
}

- (void)setShouldStartAtEnd:(BOOL)a3
{
  self->_shouldStartAtEnd = a3;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)setTriggerName:(id)a3
{
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (void)setTriggerDelay:(double)a3
{
  self->_triggerDelay = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (NSString)resourceKind
{
  return self->_resourceKind;
}

- (void)setResourceKind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceKind, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textKey, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_urlString, 0);
}

@end