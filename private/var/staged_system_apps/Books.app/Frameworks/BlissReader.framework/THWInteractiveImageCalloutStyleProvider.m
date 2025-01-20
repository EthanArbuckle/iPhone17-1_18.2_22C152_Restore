@interface THWInteractiveImageCalloutStyleProvider
- (BOOL)selected;
- (THWInteractiveImageCalloutStyleProvider)initWithStorage:(id)a3;
- (TSWPStorage)storage;
- (double)fontScale;
- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (void)dealloc;
- (void)setFontScale:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation THWInteractiveImageCalloutStyleProvider

- (THWInteractiveImageCalloutStyleProvider)initWithStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWInteractiveImageCalloutStyleProvider;
  v4 = [(THWInteractiveImageCalloutStyleProvider *)&v6 init];
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_fontScale = 1.0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutStyleProvider;
  [(THWInteractiveImageCalloutStyleProvider *)&v3 dealloc];
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7 = +[TSSPropertyMap propertyMap];
  if (self->_selected) {
    [v7 setObject:[TSUColor whiteColor] forProperty:18];
  }
  id v8 = [TSWPStorageStyleProvider styleProviderForStorage:self->_storage] paragraphStyleAtParIndex:a3 effectiveRange:a4];
  [v8 floatValueForProperty:17];
  double v10 = self->_fontScale * v9;
  *(float *)&double v10 = v10;
  [v7 setFloatValue:17 forProperty:v10];
  id v11 = [v8 stylesheet];

  return [v11 variationOfStyle:v8 propertyMap:v7];
}

- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4
{
  id v6 = +[TSSPropertyMap propertyMap];
  [a3 floatValueForProperty:17];
  double v8 = self->_fontScale * v7;
  *(float *)&double v8 = v8;
  [v6 setFloatValue:17 forProperty:v8];
  if (self->_selected) {
    [v6 setObject:[TSUColor whiteColor] forProperty:18];
  }
  id v9 = [a3 stylesheet];

  return [v9 variationOfStyle:a3 propertyMap:v6];
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

@end