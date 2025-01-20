@interface SearchUIGradientView
+ (Class)layerClass;
- (NSArray)colors;
- (SearchUIGradientView)init;
- (void)setColors:(id)a3;
@end

@implementation SearchUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setColors:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isEqualToArray:self->_colors] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_colors, a3);
    if ([v5 count] == 1)
    {
      v6 = [(SearchUIGradientView *)self layer];
      [v6 setColors:0];

      v7 = [v5 firstObject];
      v8 = self;
      v9 = v7;
    }
    else
    {
      v7 = objc_opt_new();
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(id *)(*((void *)&v17 + 1) + 8 * v14);
            objc_msgSend(v7, "addObject:", objc_msgSend(v15, "CGColor", (void)v17));
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      v16 = [(SearchUIGradientView *)self layer];
      [v16 setColors:v7];

      v8 = self;
      v9 = 0;
    }
    -[SearchUIGradientView setBackgroundColor:](v8, "setBackgroundColor:", v9, (void)v17);
  }
}

- (SearchUIGradientView)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIGradientView;
  return [(SearchUIGradientView *)&v3 init];
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
}

@end