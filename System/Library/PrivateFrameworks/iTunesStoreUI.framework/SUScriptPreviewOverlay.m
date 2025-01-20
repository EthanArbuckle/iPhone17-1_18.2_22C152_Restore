@interface SUScriptPreviewOverlay
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)userInfo;
- (id)_className;
- (id)height;
- (id)isVisible;
- (id)right;
- (id)scriptAttributeKeys;
- (id)top;
- (id)width;
@end

@implementation SUScriptPreviewOverlay

- (id)_className
{
  return @"iTunesPreviewOverlay";
}

- (id)height
{
  return (id)[NSNumber numberWithFloat:0.0];
}

- (id)isVisible
{
  return (id)*MEMORY[0x263EFFB38];
}

- (id)right
{
  return (id)[NSNumber numberWithFloat:0.0];
}

- (id)top
{
  return (id)[NSNumber numberWithFloat:0.0];
}

- (NSString)userInfo
{
  return 0;
}

- (id)width
{
  return (id)[NSNumber numberWithFloat:0.0];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_73, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPreviewOverlay;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_56, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPreviewOverlay;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPreviewOverlay;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_73 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_56 = (uint64_t)sel_hide_;
    unk_2681B5870 = @"hide";
    qword_2681B5878 = (uint64_t)sel_loadURLRequest_;
    unk_2681B5880 = @"loadURLRequest";
    qword_2681B5888 = (uint64_t)sel_show_;
    unk_2681B5890 = @"show";
    __KeyMapping_73 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"height", @"isVisible", @"isVisible", @"right", @"right", @"top", @"top", @"userInfo", @"userInfo", @"width", @"width", 0);
  }
}

@end