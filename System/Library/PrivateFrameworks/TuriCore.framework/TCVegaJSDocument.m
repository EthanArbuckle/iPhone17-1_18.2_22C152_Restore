@interface TCVegaJSDocument
- (TCVegaCGCanvas)canvas;
- (TCVegaHTMLElement)body;
- (TCVegaJSDocument)initWithCanvas:(id)a3;
- (id)createElementWithString:(id)a3;
- (void)setBody:(id)a3;
- (void)setCanvas:(id)a3;
@end

@implementation TCVegaJSDocument

- (TCVegaJSDocument)initWithCanvas:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCVegaJSDocument;
  v5 = [(TCVegaJSDocument *)&v8 init];
  if (v5)
  {
    v6 = objc_alloc_init(TCVegaHTMLElement);
    [(TCVegaJSDocument *)v5 setBody:v6];

    [(TCVegaJSDocument *)v5 setCanvas:v4];
  }

  return v5;
}

- (id)createElementWithString:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"canvas"])
  {
    v5 = [(TCVegaJSDocument *)self canvas];
  }
  else
  {
    v5 = [[TCVegaHTMLElement alloc] initWithTagName:v4];
  }
  v6 = v5;

  return v6;
}

- (TCVegaHTMLElement)body
{
  return self->body;
}

- (void)setBody:(id)a3
{
}

- (TCVegaCGCanvas)canvas
{
  return (TCVegaCGCanvas *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCanvas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->canvas, 0);
  objc_storeStrong((id *)&self->body, 0);
}

@end