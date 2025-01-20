@interface TypistKeyboardLushootseed
- (NSDictionary)multiCharacterKeys;
- (id)_multiCharacterTrailForGrapheme:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (void)setMultiCharacterKeys:(id)a3;
@end

@implementation TypistKeyboardLushootseed

- (id)init:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardLushootseed;
  id v4 = [(TypistKeyboard *)&v7 init:a3 options:a4 locale:@"lut"];
  v5 = v4;
  if (v4) {
    [v4 setMultiCharacterKeys:&unk_270C6FAD0];
  }
  return v5;
}

- (id)_multiCharacterTrailForGrapheme:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(TypistKeyboardLushootseed *)self multiCharacterKeys];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)multiCharacterKeys
{
  return self->_multiCharacterKeys;
}

- (void)setMultiCharacterKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end