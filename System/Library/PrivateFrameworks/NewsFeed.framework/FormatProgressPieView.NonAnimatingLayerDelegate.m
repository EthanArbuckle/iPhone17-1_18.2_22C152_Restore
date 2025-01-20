@interface FormatProgressPieView.NonAnimatingLayerDelegate
- (_TtCC8NewsFeed21FormatProgressPieViewP33_79BFB08BC08DDFB4B12E2FC8FCA3207125NonAnimatingLayerDelegate)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation FormatProgressPieView.NonAnimatingLayerDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F1CA98]);
  id v7 = a3;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_init);

  return v9;
}

- (_TtCC8NewsFeed21FormatProgressPieViewP33_79BFB08BC08DDFB4B12E2FC8FCA3207125NonAnimatingLayerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FormatProgressPieView.NonAnimatingLayerDelegate();
  return [(FormatProgressPieView.NonAnimatingLayerDelegate *)&v3 init];
}

@end