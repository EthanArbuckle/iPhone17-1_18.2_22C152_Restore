@interface SUScriptGradient
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)type;
- (SUScriptGradient)init;
- (SUScriptGradient)initWithGradient:(id)a3;
- (id)_className;
- (id)copyNativeGradient;
- (id)initLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6;
- (id)initRadialGraidentWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8;
- (id)patternColorWithWidth:(double)a3 height:(double)a4 opaque:(BOOL)a5;
- (id)scriptAttributeKeys;
- (void)addColorStopWithOffset:(double)a3 color:(id)a4;
- (void)dealloc;
@end

@implementation SUScriptGradient

- (SUScriptGradient)init
{
  return [(SUScriptGradient *)self initWithGradient:0];
}

- (id)initLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)SUScriptGradient;
  v10 = [(SUScriptObject *)&v12 init];
  if (v10) {
    v10->_nativeGradient = -[SUGradient initWithPoint0:point1:type:]([SUGradient alloc], "initWithPoint0:point1:type:", 0, a3, a4, 0.0, a5, a6, 0.0);
  }
  return v10;
}

- (id)initRadialGraidentWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  v16.receiver = self;
  v16.super_class = (Class)SUScriptGradient;
  v14 = [(SUScriptObject *)&v16 init];
  if (v14) {
    v14->_nativeGradient = -[SUGradient initWithPoint0:point1:type:]([SUGradient alloc], "initWithPoint0:point1:type:", 1, a3, a4, a5, a6, a7, a8);
  }
  return v14;
}

- (SUScriptGradient)initWithGradient:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptGradient;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_nativeGradient = (SUGradient *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptGradient;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)copyNativeGradient
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_nativeGradient;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)addColorStopWithOffset:(double)a3 color:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      a4 = [[SUScriptColor alloc] initWithStyleString:a4];
    }
    [(SUScriptObject *)self lock];
    -[SUGradient addColorStopWithOffset:color:](self->_nativeGradient, "addColorStopWithOffset:color:", objc_msgSend((id)objc_msgSend(a4, "nativeColor"), "CGColor"), a3);
    [(SUScriptObject *)self unlock];
  }
  else
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (id)patternColorWithWidth:(double)a3 height:(double)a4 opaque:(BOOL)a5
{
  BOOL v5 = a5;
  [(SUScriptObject *)self lock];
  id v9 = -[SUGradient newPatternColorWithSize:opaque:](self->_nativeGradient, "newPatternColorWithSize:opaque:", v5, a3, a4);
  [(SUScriptObject *)self unlock];
  if (v9) {
    v10 = [[SUScriptColor alloc] initWithUIColor:v9];
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (id)_className
{
  return @"iTunesGradient";
}

- (NSString)type
{
  [(SUScriptObject *)self lock];
  if ([(SUGradient *)self->_nativeGradient gradientType] == 1) {
    objc_super v3 = @"radial";
  }
  else {
    objc_super v3 = @"linear";
  }
  [(SUScriptObject *)self unlock];
  return &v3->isa;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_32, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGradient;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_26, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGradient;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptGradient;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_32 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_26 = (uint64_t)sel_addColorStopWithOffset_color_;
    unk_2681B4E90 = @"addColorStop";
    qword_2681B4E98 = (uint64_t)sel_patternColorWithWidth_height_opaque_;
    unk_2681B4EA0 = @"getPatternColor";
    __KeyMapping_32 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"type", 0);
  }
}

@end