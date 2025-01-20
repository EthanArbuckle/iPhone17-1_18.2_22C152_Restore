@interface DBTDuxburyFormatTextNode
+ (id)LaTeXCommandForString:(id)a3;
- (DBTDuxburyFormatTextNode)initWithText:(id)a3;
- (NSString)text;
- (id)LaTeXRepresentation;
- (id)description;
@end

@implementation DBTDuxburyFormatTextNode

+ (id)LaTeXCommandForString:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__DBTDuxburyFormatTextNode_LaTeXCommandForString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = LaTeXCommandForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&LaTeXCommandForString__onceToken, block);
  }
  v5 = [(id)LaTeXCommandForString__Commands objectForKeyedSubscript:v4];

  return v5;
}

void __50__DBTDuxburyFormatTextNode_LaTeXCommandForString___block_invoke()
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v0 = [v3 pathForResource:@"LaTeX" ofType:@"plist"];
  uint64_t v1 = +[NSDictionary dictionaryWithContentsOfFile:v0];
  v2 = (void *)LaTeXCommandForString__Commands;
  LaTeXCommandForString__Commands = v1;
}

- (DBTDuxburyFormatTextNode)initWithText:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DBTDuxburyFormatTextNode;
  id v3 = a3;
  id v4 = [(DBTDuxburyFormatNode *)&v8 init];
  v5 = (NSString *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  text = v4->_text;
  v4->_text = v5;

  return v4;
}

- (id)LaTeXRepresentation
{
  id v3 = [(id)objc_opt_class() LaTeXCommandForString:self->_text];
  text = v3;
  if (!v3) {
    text = self->_text;
  }
  v5 = text;

  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)DBTDuxburyFormatTextNode;
  id v3 = [(DBTDuxburyFormatTextNode *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@ text:\"%@\"", v3, self->_text];

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end