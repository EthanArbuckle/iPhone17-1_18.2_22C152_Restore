@interface UIWebPDFLinkAction
- (NSString)title;
- (id)handler;
- (int)type;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation UIWebPDFLinkAction

- (void)dealloc
{
  [(UIWebPDFLinkAction *)self setTitle:0];
  [(UIWebPDFLinkAction *)self setHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFLinkAction;
  [(UIWebPDFLinkAction *)&v3 dealloc];
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

@end