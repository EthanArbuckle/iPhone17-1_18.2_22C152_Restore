@interface FCContentColorMap
- (FCContentColorMap)initWithColors:(id)a3;
- (NSArray)colors;
@end

@implementation FCContentColorMap

- (FCContentColorMap)initWithColors:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCContentColorMap;
  v5 = [(FCContentColorMap *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_colors, v8);
  }
  return v5;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
}

@end