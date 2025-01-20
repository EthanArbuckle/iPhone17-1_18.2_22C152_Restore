@interface FormatProgressCircleView.NonAnimatingLayerDelegate
- (_TtCC8NewsFeed24FormatProgressCircleViewP33_BE65CBDFEC505C025C8981C6A836484825NonAnimatingLayerDelegate)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation FormatProgressCircleView.NonAnimatingLayerDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F1CA98]);
  id v7 = a3;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_init);

  return v9;
}

- (_TtCC8NewsFeed24FormatProgressCircleViewP33_BE65CBDFEC505C025C8981C6A836484825NonAnimatingLayerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FormatProgressCircleView.NonAnimatingLayerDelegate();
  return [(FormatProgressCircleView.NonAnimatingLayerDelegate *)&v3 init];
}

@end