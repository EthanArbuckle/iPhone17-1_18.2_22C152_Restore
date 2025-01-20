@interface TCVegaHTMLElement
- (NSMutableArray)childNodes;
- (NSMutableDictionary)events;
- (NSString)tagName;
- (TCVegaCSSStyleDeclaration)style;
- (TCVegaHTMLElement)init;
- (TCVegaHTMLElement)initWithTagName:(id)a3;
- (id)appendWithChild:(id)a3;
- (id)getBoundingClientRect;
- (id)parentNode;
- (id)removeWithChild:(id)a3;
- (void)addEventListenerWithType:(id)a3 listener:(id)a4;
- (void)setChildNodes:(id)a3;
- (void)setEvents:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTagName:(id)a3;
@end

@implementation TCVegaHTMLElement

- (TCVegaHTMLElement)init
{
  return [(TCVegaHTMLElement *)self initWithTagName:0];
}

- (TCVegaHTMLElement)initWithTagName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCVegaHTMLElement;
  v5 = [(TCVegaHTMLElement *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(TCVegaCSSStyleDeclaration);
    [(TCVegaHTMLElement *)v5 setStyle:v6];

    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(TCVegaHTMLElement *)v5 setChildNodes:v7];

    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TCVegaHTMLElement *)v5 setEvents:v8];

    [(TCVegaHTMLElement *)v5 setTagName:v4];
  }

  return v5;
}

- (id)parentNode
{
  v2 = [[TCVegaHTMLElement alloc] initWithTagName:@"div"];
  return v2;
}

- (id)removeWithChild:(id)a3
{
  id v4 = a3;
  v5 = [(TCVegaHTMLElement *)self childNodes];
  [v5 removeObject:v4];

  return 0;
}

- (id)appendWithChild:(id)a3
{
  id v4 = a3;
  v5 = [(TCVegaHTMLElement *)self childNodes];
  [v5 addObject:v4];

  return v4;
}

- (void)addEventListenerWithType:(id)a3 listener:(id)a4
{
  v6 = (void *)MEMORY[0x263F10388];
  id v7 = a3;
  id v9 = [v6 managedValueWithValue:a4 andOwner:self];
  id v8 = [(TCVegaHTMLElement *)self events];
  [v8 setValue:v9 forKey:v7];
}

- (id)getBoundingClientRect
{
  return &unk_26D796BE8;
}

- (TCVegaCSSStyleDeclaration)style
{
  return self->style;
}

- (void)setStyle:(id)a3
{
}

- (NSMutableArray)childNodes
{
  return self->childNodes;
}

- (void)setChildNodes:(id)a3
{
}

- (NSString)tagName
{
  return self->tagName;
}

- (void)setTagName:(id)a3
{
}

- (NSMutableDictionary)events
{
  return self->events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->events, 0);
  objc_storeStrong((id *)&self->tagName, 0);
  objc_storeStrong((id *)&self->childNodes, 0);
  objc_storeStrong((id *)&self->style, 0);
}

@end