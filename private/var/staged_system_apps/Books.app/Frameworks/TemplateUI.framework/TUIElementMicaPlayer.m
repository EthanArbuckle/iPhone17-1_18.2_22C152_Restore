@interface TUIElementMicaPlayer
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
- ($738B17BD11CC339B30296C0EA03CEC2B)textKey;
- ($738B17BD11CC339B30296C0EA03CEC2B)textValue;
- ($738B17BD11CC339B30296C0EA03CEC2B)urlString;
- (NSURL)baseURL;
- (void)setBaseURL:(id)a3;
- (void)setTextKey:(id)a3;
- (void)setTextValue:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation TUIElementMicaPlayer

+ (id)supportedAttributes
{
  if (qword_2DF1A8 != -1) {
    dispatch_once(&qword_2DF1A8, &stru_251B48);
  }
  v2 = (void *)qword_2DF1A0;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [v10 stringForAttribute:213 node:var0];
  [v11 setUrlString:v12];

  v13 = [v9 baseURLForNode:var0];

  [v11 setBaseURL:v13];
  v14 = [v10 stringForAttribute:117 node:var0];
  id v23 = +[TUIBox layerContentsGravityFromString:v14];

  [v11 setGravity:v23];
  v15 = [v10 stringForAttribute:132 node:var0];
  [v11 setTextKey:v15];

  v16 = [v10 stringForAttribute:133 node:var0];
  [v11 setTextValue:v16];

  [v11 setShouldStartAtEnd:[v10 BOOLForAttribute:195 withDefault:0 node:var0]];
  v17 = [v10 stringForAttribute:142 node:var0];
  [v11 setTriggerName:v17];

  v18 = [v10 stringForAttribute:144 node:var0];
  unint64_t v19 = +[TUIBox triggerStateFromString:v18];

  [v11 setTargetTriggerState:v19];
  [v10 floatForAttribute:143 node:var0];
  [v11 setTriggerDelay:];
  [v10 floatForAttribute:146 node:var0];
  if (v20 == 0.0) {
    double v20 = 1.0;
  }
  [v11 setOpacity:v20];
  v21 = [v10 fontSpecForNode:var0];
  [v11 setFontSpec:v21];

  v22 = [v10 stringForAttribute:172 node:var0];

  [v11 setResourceKind:v22];
}

- ($738B17BD11CC339B30296C0EA03CEC2B)urlString
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_urlString.offset;
}

- (void)setUrlString:(id)a3
{
  self->_urlString.offset = a3.var0;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- ($738B17BD11CC339B30296C0EA03CEC2B)textKey
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_textKey.offset;
}

- (void)setTextKey:(id)a3
{
  self->_textKey.offset = a3.var0;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)textValue
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_textValue.offset;
}

- (void)setTextValue:(id)a3
{
  self->_textValue.offset = a3.var0;
}

- (void).cxx_destruct
{
}

@end